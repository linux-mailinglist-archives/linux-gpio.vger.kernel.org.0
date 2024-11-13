Return-Path: <linux-gpio+bounces-12897-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0ED79C66D5
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 02:41:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B5F66B2AD4C
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 01:41:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 520EC2E634;
	Wed, 13 Nov 2024 01:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="halYflSn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B6329CFB
	for <linux-gpio@vger.kernel.org>; Wed, 13 Nov 2024 01:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731462067; cv=none; b=Ij+R0VFFyOw7Gmxf/s8+r5qKwkKS+uDC6eYjr0jbcQ04ZkO/RCxJGGSd9/7eL0jrGaJglu5jk6yfbUMHmyzCNBXMXbIosf9C+5wplEBXh1e7WfadjQ0g1PFK56NavQKSwWrb9/T6LzIsevt7Q1pyMNSnqrTnoOoz24aQrjDBYk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731462067; c=relaxed/simple;
	bh=+OckHo3NvNmgoytUiGr9PQuVSRZD9ZZ+xyqzL5gWiOs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lVrlZmQ4okWrlVDOQaWM6Qkw12HZmvyFA/2FwOmxDjivAeYANLMwwmaoZLQr1VrS0ASM+1gCOVFib0uoY9x4YL4XQZ9kSWGc1ZoQXDJ8/cHh/X4DLZLc4akGAuhZ2bSalNNDijm/Cs30TnNRM6z8OuUpKLLxmfeefdWBzW55fsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=halYflSn; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731462063; x=1762998063;
  h=date:from:to:cc:subject:message-id;
  bh=+OckHo3NvNmgoytUiGr9PQuVSRZD9ZZ+xyqzL5gWiOs=;
  b=halYflSnuZXJQKI5Zj0d6lhZL7eVa4WrewVv4ysPV2IquTjSnz27zzJn
   ZnL1Z7As2JkfDmDCfTAoswMIWTulQ6fxwcDeEnLmF/oSCbMjio4Wv6J/2
   gfpZSDNZ1xLb+9N9W5SB0gNBycG/vI7c+UMhUpO5w8exKx8uyJhDABDK5
   7U/yI921U0nqtMQR5iHfgDuXUOnwUyX+xRL1lLuS7+8f5+YhMvq7jNni5
   jWhMcS/7Qyqejud52xtkKGngE2Acem0pCSyfm0wLB0mbf660i9Km8bfCw
   NPs4E6NoaQo7P0/56WTf75chIQ4JzeU1T2fqRtmqIDjyuFdWneeQ26hWF
   g==;
X-CSE-ConnectionGUID: hczIyuQWScS7/ShUrgqkBA==
X-CSE-MsgGUID: vG6lHtG6RC+hAEaRsgZvSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="35121019"
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; 
   d="scan'208";a="35121019"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 17:41:03 -0800
X-CSE-ConnectionGUID: EG6godw+RZ6ktRlUDlYykw==
X-CSE-MsgGUID: LMg0MDBhQ2GksC5uiZEWuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; 
   d="scan'208";a="87455933"
Received: from lkp-server01.sh.intel.com (HELO bcfed0da017c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 12 Nov 2024 17:41:01 -0800
Received: from kbuild by bcfed0da017c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tB2NP-0001vL-0S;
	Wed, 13 Nov 2024 01:40:59 +0000
Date: Wed, 13 Nov 2024 09:40:48 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 8bcbd0379c05c66ce2e842c7e8901aa317cdf04e
Message-ID: <202411130943.9l6PKRFL-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 8bcbd0379c05c66ce2e842c7e8901aa317cdf04e  gpio: rockchip: support new version GPIO

elapsed time: 734m

configs tested: 107
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                       allnoconfig    gcc-14.2.0
alpha                      allyesconfig    clang-20
alpha                      allyesconfig    gcc-14.2.0
arc                        allmodconfig    clang-20
arc                        allmodconfig    gcc-13.2.0
arc                         allnoconfig    gcc-14.2.0
arc                        allyesconfig    clang-20
arc                        allyesconfig    gcc-13.2.0
arc                      hsdk_defconfig    gcc-14.2.0
arm                        allmodconfig    clang-20
arm                        allmodconfig    gcc-14.2.0
arm                         allnoconfig    gcc-14.2.0
arm                        allyesconfig    clang-20
arm                        allyesconfig    gcc-14.2.0
arm                   at91_dt_defconfig    clang-20
arm               davinci_all_defconfig    gcc-14.2.0
arm                integrator_defconfig    clang-20
arm                  keystone_defconfig    gcc-14.2.0
arm                  mvebu_v5_defconfig    gcc-14.2.0
arm                 netwinder_defconfig    clang-20
arm                      qcom_defconfig    clang-20
arm                  shmobile_defconfig    gcc-14.2.0
arm64                      alldefconfig    gcc-14.2.0
arm64                      allmodconfig    clang-20
arm64                       allnoconfig    gcc-14.2.0
arm64                         defconfig    clang-20
csky                        allnoconfig    gcc-14.2.0
hexagon                    allmodconfig    clang-20
hexagon                     allnoconfig    gcc-14.2.0
hexagon                    allyesconfig    clang-20
i386                       allmodconfig    clang-19
i386                        allnoconfig    clang-19
i386                       allyesconfig    clang-19
i386                          defconfig    clang-19
loongarch                  allmodconfig    gcc-14.2.0
loongarch                   allnoconfig    gcc-14.2.0
m68k                       allmodconfig    gcc-14.2.0
m68k                        allnoconfig    gcc-14.2.0
m68k                       allyesconfig    gcc-14.2.0
m68k                 m5249evb_defconfig    gcc-14.2.0
m68k                 m5475evb_defconfig    clang-20
microblaze                 allmodconfig    gcc-14.2.0
microblaze                  allnoconfig    gcc-14.2.0
microblaze                 allyesconfig    gcc-14.2.0
mips                        allnoconfig    gcc-14.2.0
mips                  qi_lb60_defconfig    gcc-14.2.0
mips                     xway_defconfig    clang-20
nios2                       allnoconfig    gcc-14.2.0
openrisc                    allnoconfig    clang-20
openrisc                   allyesconfig    gcc-14.2.0
openrisc                      defconfig    gcc-12
parisc                     allmodconfig    gcc-14.2.0
parisc                      allnoconfig    clang-20
parisc                     allyesconfig    gcc-14.2.0
parisc                        defconfig    gcc-12
powerpc              adder875_defconfig    clang-20
powerpc                    allmodconfig    gcc-14.2.0
powerpc                     allnoconfig    clang-20
powerpc                    allyesconfig    clang-20
powerpc                    allyesconfig    gcc-14.2.0
powerpc                  cell_defconfig    clang-20
powerpc           linkstation_defconfig    gcc-14.2.0
powerpc               mpc512x_defconfig    gcc-14.2.0
powerpc               mpc5200_defconfig    clang-20
powerpc           mpc836x_rdk_defconfig    clang-20
powerpc            mpc866_ads_defconfig    clang-20
powerpc                pcm030_defconfig    clang-20
powerpc               ppa8548_defconfig    gcc-14.2.0
powerpc               sequoia_defconfig    gcc-14.2.0
powerpc               tqm8555_defconfig    gcc-14.2.0
riscv                      allmodconfig    clang-20
riscv                      allmodconfig    gcc-14.2.0
riscv                       allnoconfig    clang-20
riscv                      allyesconfig    clang-20
riscv                      allyesconfig    gcc-14.2.0
riscv                         defconfig    gcc-12
s390                       allmodconfig    clang-20
s390                       allmodconfig    gcc-14.2.0
s390                        allnoconfig    clang-20
s390                       allyesconfig    gcc-14.2.0
s390                          defconfig    gcc-12
sh                         allmodconfig    gcc-14.2.0
sh                          allnoconfig    gcc-14.2.0
sh                         allyesconfig    gcc-14.2.0
sh                   apsh4a3a_defconfig    gcc-14.2.0
sh                            defconfig    gcc-12
sh          ecovec24-romimage_defconfig    clang-20
sh             secureedge5410_defconfig    clang-20
sh               sh7710voipgw_defconfig    gcc-14.2.0
sh             sh7724_generic_defconfig    clang-20
sh                       shx3_defconfig    clang-20
sparc                      allmodconfig    gcc-14.2.0
sparc64                       defconfig    gcc-12
um                         allmodconfig    clang-20
um                          allnoconfig    clang-20
um                         allyesconfig    clang-20
um                         allyesconfig    gcc-12
um                            defconfig    gcc-12
um                       i386_defconfig    gcc-12
um                     x86_64_defconfig    gcc-12
x86_64                      allnoconfig    clang-19
x86_64                     allyesconfig    clang-19
x86_64                        defconfig    clang-19
x86_64                            kexec    clang-19
x86_64                            kexec    gcc-12
x86_64                         rhel-8.3    gcc-12
xtensa                      allnoconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

