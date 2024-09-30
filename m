Return-Path: <linux-gpio+bounces-10598-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E031A98B08C
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Oct 2024 00:57:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 63ED22824EA
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Sep 2024 22:57:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 180DF187324;
	Mon, 30 Sep 2024 22:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lnqT9/sY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5DA721373
	for <linux-gpio@vger.kernel.org>; Mon, 30 Sep 2024 22:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727737064; cv=none; b=tevn8p+5ozmYSPV5RUEwfVh7S7OoHG/wWwbLZD1zifMwZNGJiKp+A5bJYp2uix9OY93QdRvGAPm5fgLBBvllqfjVrqvsxQv8ZUNC52cB5lnDu+Ycs91It8TudgNYl0Nxm7Uai8XGfm3OB7JYCkpwiIU3ZiLmBrUwHgmTtY2+eLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727737064; c=relaxed/simple;
	bh=HelSYfRpoRDDEMJlLaPPJfKWovf24/EGeyPqWuzMke0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=quazicExP/xjV9zsjJIfViwM3pwQRoSpdpxTQz48gLHbRiPlHhK9v786laVWoRtBj9kERy8twkWJEwo2ABbgnMZaHBI+wJq8VIMepiV3hXY6MumGMrAP9aymUbfu5BONC0TfEVVXpTy2NMSnZVejaK1BKLB7I/goubDtFRdpbnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lnqT9/sY; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727737063; x=1759273063;
  h=date:from:to:cc:subject:message-id;
  bh=HelSYfRpoRDDEMJlLaPPJfKWovf24/EGeyPqWuzMke0=;
  b=lnqT9/sYZh/7mY4EiJZNDk4HHJzN1v9pAxKqskHY6N1gMhXqJIpSojIr
   Flz26Xnw7OAIrswlghPrL0i/6R/PRqcrUg+xFkshkLfMVDZKSnT+k5Mx+
   qjb4gkp5bePqg5T8v6VnjSQlL4aepCySUqhlPdOBR1L+HB5wjseQwJ8Fu
   1cjmWMLHwRsBzMsdOCShTH24xM6FOSAV7dtz+PyKsnsqVvttJwvL4seRk
   Ad0JhxioLYzt4Hpi/5fZdOtdXNLb8LAbx+D5NrpkGqiy/Z6DrbJzM2Rq0
   aKD0w0Hpz1DPfe+5xu64euE042nrIIPMww61nT5hn9C7YBLp5+qEN9UiO
   Q==;
X-CSE-ConnectionGUID: bi2nwpXwQwunUyncFos9Cg==
X-CSE-MsgGUID: 9riDxv8yQEqSnQecQ2wHWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="29735803"
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; 
   d="scan'208";a="29735803"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 15:57:41 -0700
X-CSE-ConnectionGUID: H/vXOcskRTudMD4ycC+svg==
X-CSE-MsgGUID: VOhPF7xrTYioRbElRguzqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; 
   d="scan'208";a="77524584"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 30 Sep 2024 15:57:40 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svPKk-000Q06-0S;
	Mon, 30 Sep 2024 22:57:38 +0000
Date: Tue, 01 Oct 2024 06:56:56 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 f53ab43553ea32ef535cad320c92f9d124890a2c
Message-ID: <202410010643.YRztYDaF-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: f53ab43553ea32ef535cad320c92f9d124890a2c  Fix typos in GPIO TODO document

elapsed time: 844m

configs tested: 181
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-13.3.0
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                              allyesconfig    gcc-13.2.0
arc                                 defconfig    gcc-14.1.0
arc                     haps_hs_smp_defconfig    clang-20
arc                           tb10x_defconfig    clang-20
arm                              allmodconfig    clang-20
arm                              allmodconfig    gcc-14.1.0
arm                               allnoconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                              allyesconfig    gcc-14.1.0
arm                                 defconfig    gcc-14.1.0
arm                          ep93xx_defconfig    clang-20
arm                      integrator_defconfig    clang-20
arm                         orion5x_defconfig    clang-20
arm                        realview_defconfig    clang-20
arm                          sp7021_defconfig    clang-20
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
i386                             allmodconfig    clang-18
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-18
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-18
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20240930    clang-18
i386        buildonly-randconfig-001-20240930    gcc-12
i386        buildonly-randconfig-001-20241001    clang-18
i386        buildonly-randconfig-002-20240930    clang-18
i386        buildonly-randconfig-002-20241001    clang-18
i386        buildonly-randconfig-003-20240930    clang-18
i386        buildonly-randconfig-003-20241001    clang-18
i386        buildonly-randconfig-004-20240930    clang-18
i386        buildonly-randconfig-004-20240930    gcc-12
i386        buildonly-randconfig-004-20241001    clang-18
i386        buildonly-randconfig-005-20240930    clang-18
i386        buildonly-randconfig-005-20241001    clang-18
i386        buildonly-randconfig-006-20240930    clang-18
i386        buildonly-randconfig-006-20241001    clang-18
i386                                defconfig    clang-18
i386                  randconfig-001-20240930    clang-18
i386                  randconfig-001-20241001    clang-18
i386                  randconfig-002-20240930    clang-18
i386                  randconfig-002-20241001    clang-18
i386                  randconfig-003-20240930    clang-18
i386                  randconfig-003-20240930    gcc-12
i386                  randconfig-003-20241001    clang-18
i386                  randconfig-004-20240930    clang-18
i386                  randconfig-004-20241001    clang-18
i386                  randconfig-005-20240930    clang-18
i386                  randconfig-005-20241001    clang-18
i386                  randconfig-006-20240930    clang-18
i386                  randconfig-006-20241001    clang-18
i386                  randconfig-011-20240930    clang-18
i386                  randconfig-011-20241001    clang-18
i386                  randconfig-012-20240930    clang-18
i386                  randconfig-012-20241001    clang-18
i386                  randconfig-013-20240930    clang-18
i386                  randconfig-013-20240930    gcc-12
i386                  randconfig-013-20241001    clang-18
i386                  randconfig-014-20240930    clang-18
i386                  randconfig-014-20240930    gcc-12
i386                  randconfig-014-20241001    clang-18
i386                  randconfig-015-20240930    clang-18
i386                  randconfig-015-20241001    clang-18
i386                  randconfig-016-20240930    clang-18
i386                  randconfig-016-20240930    gcc-12
i386                  randconfig-016-20241001    clang-18
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
loongarch                 loongson3_defconfig    clang-20
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
m68k                          sun3x_defconfig    clang-20
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                           ci20_defconfig    clang-20
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.1.0
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.1.0
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.1.0
powerpc                          allyesconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
powerpc                   bluestone_defconfig    clang-20
powerpc                      cm5200_defconfig    clang-20
powerpc                     ep8248e_defconfig    clang-20
riscv                            allmodconfig    clang-20
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.1.0
riscv                            allyesconfig    clang-20
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
s390                             allmodconfig    clang-20
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                            hp6xx_defconfig    clang-20
sh                           se7619_defconfig    clang-20
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
um                               alldefconfig    clang-20
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    clang-20
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64      buildonly-randconfig-001-20240930    gcc-11
x86_64      buildonly-randconfig-002-20240930    gcc-11
x86_64      buildonly-randconfig-003-20240930    gcc-11
x86_64      buildonly-randconfig-004-20240930    gcc-11
x86_64      buildonly-randconfig-005-20240930    gcc-11
x86_64      buildonly-randconfig-006-20240930    gcc-11
x86_64                              defconfig    clang-18
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-18
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20240930    gcc-11
x86_64                randconfig-002-20240930    gcc-11
x86_64                randconfig-003-20240930    gcc-11
x86_64                randconfig-004-20240930    gcc-11
x86_64                randconfig-005-20240930    gcc-11
x86_64                randconfig-006-20240930    gcc-11
x86_64                randconfig-011-20240930    gcc-11
x86_64                randconfig-012-20240930    gcc-11
x86_64                randconfig-013-20240930    gcc-11
x86_64                randconfig-014-20240930    gcc-11
x86_64                randconfig-015-20240930    gcc-11
x86_64                randconfig-016-20240930    gcc-11
x86_64                randconfig-071-20240930    gcc-11
x86_64                randconfig-072-20240930    gcc-11
x86_64                randconfig-073-20240930    gcc-11
x86_64                randconfig-074-20240930    gcc-11
x86_64                randconfig-075-20240930    gcc-11
x86_64                randconfig-076-20240930    gcc-11
x86_64                               rhel-8.3    gcc-12
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

