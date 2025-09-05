Return-Path: <linux-gpio+bounces-25655-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9F9B45110
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Sep 2025 10:15:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB6C61C25E62
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Sep 2025 08:16:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5B362222A1;
	Fri,  5 Sep 2025 08:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vm3Qf3O1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFBFB13E898
	for <linux-gpio@vger.kernel.org>; Fri,  5 Sep 2025 08:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757060149; cv=none; b=EJUN51yEzPGnu8BSP1ZWD0PEl83h6LeR6SzSD0/MhXDBn7QAvkUEUBGaW5zC3JR1ZhPP8u2CTJb8Vm3hUAm/9203Ra4wtd3bkgyoDVmE08CG+1uCTm3fh0VpShNDwGn+oe6D33rIFrFnyz6Neq+GPqzeQ335IfpzI8Ef4SPWERk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757060149; c=relaxed/simple;
	bh=GTvLXmWGNRrxSoDhhUhs4in2IxrnP+9yF0jMisO6ppw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=o068Q2Aux/l9/JKp9RDHmgzwkcojlcqv5oQKX1nGR/153WKYN9ZtNYMuD9oKcUn3iDZWrn1BcP1Grcl7IqBDQut2A5035DTRlV/xAQ4NkwCHiDF43GW2bBf/FNb1+atv9Zm8T2Cfw4dN/vXTHrCivUdK59ypd0zZpwI2RycrERM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vm3Qf3O1; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757060147; x=1788596147;
  h=date:from:to:cc:subject:message-id;
  bh=GTvLXmWGNRrxSoDhhUhs4in2IxrnP+9yF0jMisO6ppw=;
  b=Vm3Qf3O1DIzhOLBmecUvGuMurLk+l1J5HDHAad7+v34ejU7b5QIRZwla
   grYn1f7Mv3cdU6m0RShHZsL+TUmDM74N1LXYwZpIYyaJPks6582JmXRPM
   akG/ZeK7/kiilifCqlD0yvsjbNQpFjxHCqOPmzEdxhlfp/SK28Ta9u+RF
   ECR0FxqGHSM53ysnh+QjnY2DqsJSBtrsrH2O+qhLYHI87oToUBzSrYFpF
   M1ZFdPKtPg0YWekDcAevfn82Od0nBn/+Y3ZOEmDSuip1LgF2tfSaog+xj
   lc26rVJ+a/L8YbzTWDi9m3l/dyjvU8iaQXd0DnvN+7ww/5fwwJb1wqPY/
   Q==;
X-CSE-ConnectionGUID: 2nzpr5x3QC+iwMgf247Wtg==
X-CSE-MsgGUID: EYInXlsDTdmWABcDnZxUjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="58621190"
X-IronPort-AV: E=Sophos;i="6.18,240,1751266800"; 
   d="scan'208";a="58621190"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2025 01:15:47 -0700
X-CSE-ConnectionGUID: ziReHUAuQa+l7gDysR+XoQ==
X-CSE-MsgGUID: KkArvq1eQh+SDORC1qNYAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,240,1751266800"; 
   d="scan'208";a="171684136"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 05 Sep 2025 01:15:46 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uuRbj-0000Al-2h;
	Fri, 05 Sep 2025 08:15:43 +0000
Date: Fri, 05 Sep 2025 16:15:34 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:ib-mfd-gpio-stmpe-for-v6.18-rc1] BUILD SUCCESS
 df6a44003953fb23ad67f82d299e439e7ff7150a
Message-ID: <202509051628.FkzRtAeW-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git ib-mfd-gpio-stmpe-for-v6.18-rc1
branch HEAD: df6a44003953fb23ad67f82d299e439e7ff7150a  mfd: stmpe: Allow building as module

elapsed time: 1151m

configs tested: 227
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                            allyesconfig    clang-19
alpha                               defconfig    clang-19
arc                              allmodconfig    clang-19
arc                               allnoconfig    clang-22
arc                              allyesconfig    clang-19
arc                          axs103_defconfig    clang-22
arc                                 defconfig    clang-19
arc                   randconfig-001-20250904    gcc-9.5.0
arc                   randconfig-001-20250905    clang-22
arc                   randconfig-002-20250904    gcc-11.5.0
arc                   randconfig-002-20250905    clang-22
arm                              allmodconfig    clang-19
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                                 defconfig    clang-19
arm                   randconfig-001-20250904    gcc-10.5.0
arm                   randconfig-001-20250905    clang-22
arm                   randconfig-002-20250904    gcc-13.4.0
arm                   randconfig-002-20250905    clang-22
arm                   randconfig-003-20250904    gcc-8.5.0
arm                   randconfig-003-20250905    clang-22
arm                   randconfig-004-20250904    gcc-13.4.0
arm                   randconfig-004-20250905    clang-22
arm                    vt8500_v6_v7_defconfig    clang-22
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                               defconfig    clang-19
arm64                 randconfig-001-20250904    gcc-8.5.0
arm64                 randconfig-001-20250905    clang-22
arm64                 randconfig-002-20250904    gcc-8.5.0
arm64                 randconfig-002-20250905    clang-22
arm64                 randconfig-003-20250904    clang-22
arm64                 randconfig-003-20250905    clang-22
arm64                 randconfig-004-20250904    gcc-8.5.0
arm64                 randconfig-004-20250905    clang-22
csky                              allnoconfig    clang-22
csky                                defconfig    clang-19
csky                  randconfig-001-20250905    gcc-11.5.0
csky                  randconfig-001-20250905    gcc-15.1.0
csky                  randconfig-002-20250905    gcc-11.5.0
csky                  randconfig-002-20250905    gcc-13.4.0
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20250905    clang-22
hexagon               randconfig-001-20250905    gcc-11.5.0
hexagon               randconfig-002-20250905    clang-22
hexagon               randconfig-002-20250905    gcc-11.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20250904    clang-20
i386        buildonly-randconfig-001-20250905    clang-20
i386        buildonly-randconfig-002-20250904    gcc-12
i386        buildonly-randconfig-002-20250905    clang-20
i386        buildonly-randconfig-003-20250904    gcc-13
i386        buildonly-randconfig-003-20250905    clang-20
i386        buildonly-randconfig-004-20250904    gcc-13
i386        buildonly-randconfig-004-20250905    clang-20
i386        buildonly-randconfig-005-20250904    clang-20
i386        buildonly-randconfig-005-20250905    clang-20
i386        buildonly-randconfig-006-20250904    clang-20
i386        buildonly-randconfig-006-20250905    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250905    gcc-13
i386                  randconfig-002-20250905    gcc-13
i386                  randconfig-003-20250905    gcc-13
i386                  randconfig-004-20250905    gcc-13
i386                  randconfig-005-20250905    gcc-13
i386                  randconfig-006-20250905    gcc-13
i386                  randconfig-007-20250905    gcc-13
i386                  randconfig-011-20250905    clang-20
i386                  randconfig-012-20250905    clang-20
i386                  randconfig-013-20250905    clang-20
i386                  randconfig-014-20250905    clang-20
i386                  randconfig-015-20250905    clang-20
i386                  randconfig-016-20250905    clang-20
i386                  randconfig-017-20250905    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250905    clang-18
loongarch             randconfig-001-20250905    gcc-11.5.0
loongarch             randconfig-002-20250905    clang-18
loongarch             randconfig-002-20250905    gcc-11.5.0
m68k                             allmodconfig    clang-19
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                                defconfig    clang-19
m68k                        m5272c3_defconfig    clang-22
microblaze                       allmodconfig    clang-19
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250905    gcc-10.5.0
nios2                 randconfig-001-20250905    gcc-11.5.0
nios2                 randconfig-002-20250905    gcc-11.5.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-13
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250905    gcc-11.5.0
parisc                randconfig-001-20250905    gcc-15.1.0
parisc                randconfig-002-20250905    gcc-11.5.0
parisc                randconfig-002-20250905    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    gcc-15.1.0
powerpc                 mpc836x_rdk_defconfig    clang-22
powerpc               randconfig-001-20250905    gcc-11.5.0
powerpc               randconfig-001-20250905    gcc-8.5.0
powerpc               randconfig-002-20250905    clang-22
powerpc               randconfig-002-20250905    gcc-11.5.0
powerpc               randconfig-003-20250905    gcc-11.5.0
powerpc               randconfig-003-20250905    gcc-8.5.0
powerpc64             randconfig-001-20250905    clang-22
powerpc64             randconfig-001-20250905    gcc-11.5.0
powerpc64             randconfig-002-20250905    clang-22
powerpc64             randconfig-002-20250905    gcc-11.5.0
powerpc64             randconfig-003-20250905    gcc-11.5.0
powerpc64             randconfig-003-20250905    gcc-14.3.0
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-13
riscv                 randconfig-001-20250904    gcc-8.5.0
riscv                 randconfig-001-20250905    gcc-15.1.0
riscv                 randconfig-002-20250904    clang-22
riscv                 randconfig-002-20250905    gcc-15.1.0
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-13
s390                  randconfig-001-20250904    gcc-10.5.0
s390                  randconfig-001-20250905    gcc-15.1.0
s390                  randconfig-002-20250904    gcc-8.5.0
s390                  randconfig-002-20250905    gcc-15.1.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-13
sh                    randconfig-001-20250904    gcc-12.5.0
sh                    randconfig-001-20250905    gcc-15.1.0
sh                    randconfig-002-20250904    gcc-10.5.0
sh                    randconfig-002-20250905    gcc-15.1.0
sh                           se7619_defconfig    clang-22
sh                     sh7710voipgw_defconfig    clang-22
sh                            titan_defconfig    clang-22
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250904    gcc-11.5.0
sparc                 randconfig-001-20250905    gcc-15.1.0
sparc                 randconfig-002-20250904    gcc-15.1.0
sparc                 randconfig-002-20250905    gcc-15.1.0
sparc64                             defconfig    gcc-13
sparc64               randconfig-001-20250904    gcc-12.5.0
sparc64               randconfig-001-20250905    gcc-15.1.0
sparc64               randconfig-002-20250904    clang-20
sparc64               randconfig-002-20250905    gcc-15.1.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                                  defconfig    gcc-13
um                             i386_defconfig    gcc-13
um                    randconfig-001-20250904    gcc-13
um                    randconfig-001-20250905    gcc-15.1.0
um                    randconfig-002-20250904    clang-22
um                    randconfig-002-20250905    gcc-15.1.0
um                           x86_64_defconfig    gcc-13
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250904    gcc-12
x86_64      buildonly-randconfig-001-20250905    gcc-13
x86_64      buildonly-randconfig-002-20250904    clang-20
x86_64      buildonly-randconfig-002-20250905    gcc-13
x86_64      buildonly-randconfig-003-20250904    gcc-13
x86_64      buildonly-randconfig-003-20250905    gcc-13
x86_64      buildonly-randconfig-004-20250904    gcc-13
x86_64      buildonly-randconfig-004-20250905    gcc-13
x86_64      buildonly-randconfig-005-20250904    gcc-13
x86_64      buildonly-randconfig-005-20250905    gcc-13
x86_64      buildonly-randconfig-006-20250904    clang-20
x86_64      buildonly-randconfig-006-20250905    gcc-13
x86_64                              defconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250905    clang-20
x86_64                randconfig-002-20250905    clang-20
x86_64                randconfig-003-20250905    clang-20
x86_64                randconfig-004-20250905    clang-20
x86_64                randconfig-005-20250905    clang-20
x86_64                randconfig-006-20250905    clang-20
x86_64                randconfig-007-20250905    clang-20
x86_64                randconfig-008-20250905    clang-20
x86_64                randconfig-071-20250905    clang-20
x86_64                randconfig-072-20250905    clang-20
x86_64                randconfig-073-20250905    clang-20
x86_64                randconfig-074-20250905    clang-20
x86_64                randconfig-075-20250905    clang-20
x86_64                randconfig-076-20250905    clang-20
x86_64                randconfig-077-20250905    clang-20
x86_64                randconfig-078-20250905    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-13
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-13
x86_64                           rhel-9.4-ltp    gcc-13
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250904    gcc-10.5.0
xtensa                randconfig-001-20250905    gcc-15.1.0
xtensa                randconfig-002-20250904    gcc-11.5.0
xtensa                randconfig-002-20250905    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

