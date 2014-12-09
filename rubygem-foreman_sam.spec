%{?scl:%scl_package rubygem-%{gem_name}}
%{!?scl:%global pkg_name %{name}}

%global gemname foreman_sam

%global gemdir %(ruby -rubygems -e 'puts Gem::dir' 2>/dev/null)
%global geminstdir %{gemdir}/gems/%{gemname}-%{version}

Summary: SAM plugin for Katello
Name: %{?scl_prefix}rubygem-%{gemname}
Version: 0.0.1
Release: 1%{?dist}
Group: Development/Languages
License: GPLv3
URL: http://katello.org
Source0: %{gemname}-%{version}.gem

%if "%{?scl}" == "ruby193"
Requires: %{?scl_prefix}ruby-wrapper
BuildRequires: %{?scl_prefix}ruby-wrapper
%endif
%if 0%{?fedora} > 18  || 0%{?rhel} > 6
Requires: ruby(release) = 2.0.0
BuildRequires: ruby(release) = 2.0.0
BuildRequires: rubygems-devel
%else
%if "%{?scl}" == "ruby193"
Requires: %{?scl_prefix}ruby(abi) = 1.9.1
BuildRequires: %{?scl_prefix}ruby(abi) = 1.9.1
BuildRequires:  %{?scl_prefix}rubygems-devel
%else
Requires: ruby(abi) = 1.8
BuildRequires: ruby(abi) = 1.8
%endif
%endif
Requires: %{?scl_prefix}rubygems
BuildRequires: %{?scl_prefix}rubygems
BuildArch: noarch

Provides: %{?scl_prefix}rubygem(%{gem_name}) = %{version}

%description
SAM plugin for Katello.


%package doc
Summary: Documentation for %{name}
Group: Documentation
Requires: %{?scl_prefix}%{name} = %{version}-%{release}
BuildArch: noarch

%description doc
Documentation for %{name}


%prep
%setup -q -c -T
mkdir -p .%{gemdir}
%{?scl:scl enable %{scl} "}
gem install --local --install-dir .%{gemdir} \
            --force %{SOURCE0}
%{?scl:"}

%build

%install
mkdir -p %{buildroot}%{gemdir}
cp -pa .%{gemdir}/* \
        %{buildroot}%{gemdir}/


%files
%dir %{geminstdir}
%{geminstdir}/
%exclude %{gemdir}/cache/%{gemname}-%{version}.gem
%{gemdir}/specifications/%{gemname}-%{version}.gemspec

%files doc
%doc %{gemdir}/doc/%{gemname}-%{version}


%changelog
* Mon Dec 08 2014  <mmccune@redhat.com> - 0.0.1-1
- Initial package
