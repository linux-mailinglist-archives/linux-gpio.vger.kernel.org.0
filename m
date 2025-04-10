Return-Path: <linux-gpio+bounces-18677-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 216BDA8496F
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Apr 2025 18:20:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C9B89A103C
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Apr 2025 16:19:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E7331EBA19;
	Thu, 10 Apr 2025 16:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XWCfE3YF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282E21E991C
	for <linux-gpio@vger.kernel.org>; Thu, 10 Apr 2025 16:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744301989; cv=none; b=tjuuhTwBE6O+jwJH2EfSygJWeNi6jeTcCrKwpwuMb0x24MdG8tsHuvq7O6sQep/TcSwP3hFUMDzKhsYB2espPUZE6SKyLoGkSpTTezxzpyYhRsjF2W7+eqDqVblDGk79vcwwEo/07xXm4pgc1+WZV8JFUMb+ojormdysOwaQikE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744301989; c=relaxed/simple;
	bh=AIFNEUUZjUxAhO5lLwAvhAjTxw3Bem+R69sdFJ2Yz64=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fupWJwCYpp9OsbWYMiXWhIVsCXTszdd0XYnKm6zLrSelMabrcZPIa6GJWpH2rb8BUEj4/whyromCPzaEVrMUDLpXs1QNQyTaHtZx6QWCp+Xtpirq+guq0YbfZwebJWcFUeuoEA07cXKXVF6yq0xMBI3/kjERYE4nmfjstJeYA/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XWCfE3YF; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744301988; x=1775837988;
  h=date:from:to:cc:subject:message-id;
  bh=AIFNEUUZjUxAhO5lLwAvhAjTxw3Bem+R69sdFJ2Yz64=;
  b=XWCfE3YFDhsUfF+04ZTI44EWLQVfreFlg9LXFmQTk+nUa0X0kB3jZAt9
   EIKK3+SXW+gTtS0VpGFBHsAdI/1+BaFcNlAfaikJLWrHTE5L05J8kp3S1
   pvP2AhX7CQaqt0YnwDDbO80s5mggB8j12pjtYTwj7C+lTnNVIw4nr2l1P
   6Gj2otpV6749ZKusGgbtgXltPm5CyL+D2RrMtPgGK1BpUwsOFfklPKIOd
   6AoD7twZuSvAgYIeLzgiWnlxeydcknJVk1Q5bLkq2lOWPXquATZ/9tdHt
   PRH3VRzODGVVJeqafxCh02v4JWdn2eYl3G/SxawhcAyQX/BUT+43zDV+Z
   w==;
X-CSE-ConnectionGUID: oDODX0sJQlqaI1Ae4s0MPQ==
X-CSE-MsgGUID: /bgzW9wnTL2oAmXIQfh6Jw==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="45733622"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="45733622"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 09:19:47 -0700
X-CSE-ConnectionGUID: +H/AryiYSk+ta5n65UL+Ig==
X-CSE-MsgGUID: 7Jby3QMMQo+SqiVkQpHPNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="129490156"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 10 Apr 2025 09:19:45 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u2ucx-000AIi-0o;
	Thu, 10 Apr 2025 16:19:43 +0000
Date: Fri, 11 Apr 2025 00:19:17 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD REGRESSION
 6d7f0c1103ef3935eb3f302d09af4ef9e85212a3
Message-ID: <202504110007.Ygp5e2iL-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 6d7f0c1103ef3935eb3f302d09af4ef9e85212a3  selftests: gpio: add test cases for gpio-aggregator

Error/Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202504100718.3Ftgs2zL-lkp@intel.com

    ld.lld: error: relocation R_PPC_ADDR16_HA cannot be used against symbol 'vdso32_start'; recompile with -fPIC

Error/Warning ids grouped by kconfigs:

recent_errors
`-- powerpc-randconfig-003-20250410
    `-- ld.lld:error:relocation-R_PPC_ADDR16_HA-cannot-be-used-against-symbol-vdso32_start-recompile-with-fPIC

elapsed time: 1464m

configs tested: 90
configs skipped: 2

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                   randconfig-001-20250410    gcc-14.2.0
arc                   randconfig-002-20250410    gcc-12.4.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                   randconfig-001-20250410    clang-21
arm                   randconfig-002-20250410    clang-18
arm                   randconfig-003-20250410    gcc-7.5.0
arm                   randconfig-004-20250410    gcc-8.5.0
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250410    clang-21
arm64                 randconfig-002-20250410    clang-21
arm64                 randconfig-003-20250410    gcc-6.5.0
arm64                 randconfig-004-20250410    gcc-8.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250410    gcc-14.2.0
csky                  randconfig-002-20250410    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250410    clang-21
hexagon               randconfig-002-20250410    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250410    clang-20
i386        buildonly-randconfig-002-20250410    clang-20
i386        buildonly-randconfig-003-20250410    clang-20
i386        buildonly-randconfig-004-20250410    gcc-11
i386        buildonly-randconfig-005-20250410    clang-20
i386        buildonly-randconfig-006-20250410    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250410    gcc-12.4.0
loongarch             randconfig-002-20250410    gcc-12.4.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250410    gcc-14.2.0
nios2                 randconfig-002-20250410    gcc-10.5.0
parisc                randconfig-001-20250410    gcc-5.5.0
parisc                randconfig-002-20250410    gcc-11.5.0
powerpc               randconfig-001-20250410    gcc-6.5.0
powerpc               randconfig-002-20250410    gcc-6.5.0
powerpc               randconfig-003-20250410    clang-21
powerpc64             randconfig-001-20250410    clang-21
powerpc64             randconfig-002-20250410    clang-21
powerpc64             randconfig-003-20250410    clang-21
riscv                 randconfig-001-20250410    clang-21
riscv                 randconfig-002-20250410    gcc-8.5.0
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250410    clang-17
s390                  randconfig-002-20250410    gcc-6.5.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250410    gcc-12.4.0
sh                    randconfig-002-20250410    gcc-10.5.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250410    gcc-10.3.0
sparc                 randconfig-002-20250410    gcc-7.5.0
sparc64               randconfig-001-20250410    gcc-7.5.0
sparc64               randconfig-002-20250410    gcc-5.5.0
um                               allmodconfig    clang-19
um                               allyesconfig    gcc-12
um                    randconfig-001-20250410    clang-21
um                    randconfig-002-20250410    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250410    clang-20
x86_64      buildonly-randconfig-002-20250410    gcc-12
x86_64      buildonly-randconfig-003-20250410    clang-20
x86_64      buildonly-randconfig-004-20250410    clang-20
x86_64      buildonly-randconfig-005-20250410    clang-20
x86_64      buildonly-randconfig-006-20250410    clang-20
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250410    gcc-14.2.0
xtensa                randconfig-002-20250410    gcc-7.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

