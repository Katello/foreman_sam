%global gem_name foreman_sam

# rubygems-devel defines a lot of nice macros, including:
#   %{gem_dir}
#   %{gem_instdir}
#   %{gem_libdir}
#   %{gem_cache}
#   %{gem_spec}
# that we'll be using below

%{?scl:%scl_package rubygem-%{gem_name}}
%{!?scl:%global pkg_name %{name}}

Summary: SAM plugin for Foreman and Katello
Name: %{?scl_prefix}rubygem-%{gem_name}
Version: 0.0.1
Release: 1%{?dist}
Group: Development/Languages
License: GPLv3
URL: http://katello.org
Source0: %{gem_name}-%{version}.gem
BuildArch: noarch

%if "%{?scl}" == "ruby193"
Requires: %{?scl_prefix}ruby-wrapper
BuildRequires: %{?scl_prefix}ruby-wrapper
%endif

Requires: %{?scl_prefix}rubygem-katello
Requires: %{?scl_prefix}rubygems
BuildRequires: %{?scl_prefix}rubygems
BuildRequires: %{?scl_prefix}rubygems-devel
BuildRequires: foreman-assets >= 1.7.0
%if 0%{?rhel} > 6
Requires: ruby(release) = 2.0.0
BuildRequires: ruby(release) = 2.0.0
%else
%if "%{?scl}" == "ruby193"
Requires: %{?scl_prefix}ruby(abi) = 1.9.1
BuildRequires: %{?scl_prefix}ruby(abi) = 1.9.1
%else
Requires: ruby(abi) = 1.8
BuildRequires: ruby(abi) = 1.8
%endif
%endif

Provides: %{?scl_prefix}rubygem(%{gem_name}) = %{version}

%description
SAM plugin for Foreman and Katello.

%prep
%setup -q -c -T
%{__install} --directory .%{gem_dir}
%{?scl:scl enable %{scl} "}
gem install --local --install-dir .%{gem_dir} --force %{SOURCE0} --no-rdoc --no-ri
%{?scl:"}

%build

%install
# it's recommended to clean your buildroot first
%{__rm} --recursive --force %{buildroot}

%{__install} --directory %{buildroot}%{gem_dir}
%{__cp} --archive .%{gem_dir}/cache %{buildroot}%{gem_dir}/
%{__cp} --archive .%{gem_dir}/doc %{buildroot}%{gem_dir}/
%{__cp} --archive .%{gem_dir}/gems %{buildroot}%{gem_dir}/
%{__cp} --archive .%{gem_dir}/specifications %{buildroot}%{gem_dir}/

%{__install} --directory %{buildroot}%{foreman_bundlerd_dir}

%foreman_bundlerd_file

%{__install} --directory %{buildroot}%{foreman_dir}/plugins
%{__install} .%{gem_instdir}/config/%{gem_name}.yaml %{buildroot}%{foreman_dir}/plugins/

%clean
%{__rm} --recursive --force %{buildroot} .%{gem_dir}

%files
%defattr(644, root, foreman, -)
%{gem_instdir}/Rakefile
%{gem_instdir}/LICENSE
%{gem_instdir}/README.md
%{gem_instdir}/app/
%{gem_instdir}/lib/
%{gem_instdir}/config/
%{gem_spec}
%{gem_cache}
%{foreman_bundlerd_plugin}
%config(noreplace) %{foreman_dir}/plugins/%{gem_name}.yaml

%changelog
* Mon Dec 08 2014 Mike McCune <mmccune@redhat.com> - 0.0.1-1
- Initial package
