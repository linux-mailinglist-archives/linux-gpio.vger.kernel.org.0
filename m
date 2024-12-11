Return-Path: <linux-gpio+bounces-13750-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5409ECB52
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2024 12:35:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E878828689A
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2024 11:35:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABBF41C07C9;
	Wed, 11 Dec 2024 11:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fd5eXFAD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C2F238E01
	for <linux-gpio@vger.kernel.org>; Wed, 11 Dec 2024 11:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733916899; cv=none; b=S4Uj8RbYH03KPLM6AvNf4EpzlKA9lH50pBYwmGLONKrFKi7XArAxLEkSmDGLWKhLliWL9WhZPRuzABub+6yI3yE4wxjpLcqgf2rwp2LO057lBU2JXpz6nusXBdQjkMSyRvypuRLKBPTyxpnRCxzTxEsycg9e+hTtxK14XaCgJ10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733916899; c=relaxed/simple;
	bh=27weLdZ89maRlTZtzGzvB3tWIg3LknUI1jg4zjBWVNU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RQRKuHyGo/7Gfr8dZKA8rvNzIHdZ8aVMAOadkJzLtmWgl2L8QurM7S1dSqCh5pZU/G424XWlu6vme/1/7F5/nRstFXCwKkzaYW6uqnRJ//hJqnefOl92sjfjFlIb1YyEJ31PllftOhCGZxtI0AY8xqtumVBQUfe1JlHba4Oo5H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fd5eXFAD; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733916897; x=1765452897;
  h=date:from:to:cc:subject:message-id;
  bh=27weLdZ89maRlTZtzGzvB3tWIg3LknUI1jg4zjBWVNU=;
  b=fd5eXFAD1EpQA8TxsZnzLtG98NEJKNsb+VkGWwx2J7cLPISMBEa2VsMd
   B0fvlmo9Ilv/O72nxieZZ7XtNCW9YFNYIvIKM9TI221OHVec6Idl+6sl+
   CpnBdSGYjblkAh0ZK94GaHyd8OFju0DKH8y13/VI4FbpIHgVDPFVPE5sH
   KWE4Gbfbff8V+uh4Az7BA/p1pVFAQVODue6sgAYfp41Z2h3saU3SEdgqi
   6bizfhtKZOvdS50NNfB8ZKACkf1B+CtmyvUqttXmV8D2AMhEhT1Q9zQmk
   baFqNDuHD2FUO17eYghklrZfO3BGTV/TtxovP7WKBzuIGpgLZ/QTVVJYn
   w==;
X-CSE-ConnectionGUID: fRQrDcctTm2OADmYecYFGw==
X-CSE-MsgGUID: O1XJXbN2R7mNCARKxuysmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="34192522"
X-IronPort-AV: E=Sophos;i="6.12,225,1728975600"; 
   d="scan'208";a="34192522"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 03:34:57 -0800
X-CSE-ConnectionGUID: PGX+kmHqRmqZsbcChjYpKA==
X-CSE-MsgGUID: agrHu739RbuQZjWFoO+LHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="96582605"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 11 Dec 2024 03:34:56 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLKzV-0006bk-10;
	Wed, 11 Dec 2024 11:34:53 +0000
Date: Wed, 11 Dec 2024 19:34:45 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 9ac4b58fcef0f9fc03fa6e126a5f53c1c71ada8a
Message-ID: <202412111937.GqEalwIU-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: 9ac4b58fcef0f9fc03fa6e126a5f53c1c71ada8a  gpio: idio-16: Actually make use of the GPIO_IDIO_16 symbol namespace

elapsed time: 1458m

configs tested: 255
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-18
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-18
arc                              allyesconfig    gcc-13.2.0
arc                                 defconfig    gcc-14.2.0
arc                   randconfig-001-20241210    gcc-13.2.0
arc                   randconfig-001-20241211    gcc-14.2.0
arc                   randconfig-002-20241210    gcc-13.2.0
arc                   randconfig-002-20241211    gcc-14.2.0
arm                              allmodconfig    clang-18
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-18
arm                              allyesconfig    gcc-14.2.0
arm                                 defconfig    gcc-14.2.0
arm                        keystone_defconfig    gcc-14.2.0
arm                        mvebu_v5_defconfig    clang-20
arm                        neponset_defconfig    gcc-14.2.0
arm                           omap1_defconfig    gcc-14.2.0
arm                            qcom_defconfig    gcc-14.2.0
arm                   randconfig-001-20241210    clang-20
arm                   randconfig-001-20241211    gcc-14.2.0
arm                   randconfig-002-20241210    gcc-14.2.0
arm                   randconfig-002-20241211    gcc-14.2.0
arm                   randconfig-003-20241210    clang-20
arm                   randconfig-003-20241211    gcc-14.2.0
arm                   randconfig-004-20241210    clang-20
arm                   randconfig-004-20241211    gcc-14.2.0
arm                        vexpress_defconfig    gcc-14.2.0
arm64                            alldefconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20241210    clang-20
arm64                 randconfig-001-20241211    gcc-14.2.0
arm64                 randconfig-002-20241210    clang-20
arm64                 randconfig-002-20241211    gcc-14.2.0
arm64                 randconfig-003-20241210    clang-20
arm64                 randconfig-003-20241211    gcc-14.2.0
arm64                 randconfig-004-20241210    clang-20
arm64                 randconfig-004-20241211    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20241210    gcc-14.2.0
csky                  randconfig-001-20241211    gcc-14.2.0
csky                  randconfig-002-20241210    gcc-14.2.0
csky                  randconfig-002-20241211    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20241210    clang-16
hexagon               randconfig-001-20241211    gcc-14.2.0
hexagon               randconfig-002-20241210    clang-14
hexagon               randconfig-002-20241211    gcc-14.2.0
i386                             allmodconfig    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-19
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-19
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241210    gcc-12
i386        buildonly-randconfig-001-20241211    clang-19
i386        buildonly-randconfig-002-20241210    clang-19
i386        buildonly-randconfig-002-20241211    clang-19
i386        buildonly-randconfig-003-20241210    gcc-12
i386        buildonly-randconfig-003-20241211    clang-19
i386        buildonly-randconfig-004-20241210    clang-19
i386        buildonly-randconfig-004-20241211    clang-19
i386        buildonly-randconfig-005-20241210    clang-19
i386        buildonly-randconfig-005-20241211    clang-19
i386        buildonly-randconfig-006-20241210    clang-19
i386        buildonly-randconfig-006-20241211    clang-19
i386                                defconfig    clang-19
i386                  randconfig-001-20241211    gcc-12
i386                  randconfig-002-20241211    gcc-12
i386                  randconfig-003-20241211    gcc-12
i386                  randconfig-004-20241211    gcc-12
i386                  randconfig-005-20241211    gcc-12
i386                  randconfig-006-20241211    gcc-12
i386                  randconfig-007-20241211    gcc-12
i386                  randconfig-011-20241211    gcc-12
i386                  randconfig-012-20241211    gcc-12
i386                  randconfig-013-20241211    gcc-12
i386                  randconfig-014-20241211    gcc-12
i386                  randconfig-015-20241211    gcc-12
i386                  randconfig-016-20241211    gcc-12
i386                  randconfig-017-20241211    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20241210    gcc-14.2.0
loongarch             randconfig-001-20241211    gcc-14.2.0
loongarch             randconfig-002-20241210    gcc-14.2.0
loongarch             randconfig-002-20241211    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                          hp300_defconfig    gcc-14.2.0
m68k                        m5272c3_defconfig    gcc-14.2.0
m68k                       m5475evb_defconfig    clang-20
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                         bigsur_defconfig    gcc-14.2.0
mips                        maltaup_defconfig    gcc-14.2.0
mips                        omega2p_defconfig    gcc-14.2.0
mips                        qi_lb60_defconfig    clang-20
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20241210    gcc-14.2.0
nios2                 randconfig-001-20241211    gcc-14.2.0
nios2                 randconfig-002-20241210    gcc-14.2.0
nios2                 randconfig-002-20241211    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20241210    gcc-14.2.0
parisc                randconfig-001-20241211    gcc-14.2.0
parisc                randconfig-002-20241210    gcc-14.2.0
parisc                randconfig-002-20241211    gcc-14.2.0
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    clang-16
powerpc                          allyesconfig    gcc-14.2.0
powerpc                    amigaone_defconfig    gcc-14.2.0
powerpc                       eiger_defconfig    gcc-14.2.0
powerpc                    mvme5100_defconfig    gcc-14.2.0
powerpc               randconfig-001-20241210    clang-20
powerpc               randconfig-001-20241211    gcc-14.2.0
powerpc               randconfig-002-20241210    clang-20
powerpc               randconfig-002-20241211    gcc-14.2.0
powerpc               randconfig-003-20241210    clang-20
powerpc               randconfig-003-20241211    gcc-14.2.0
powerpc                     skiroot_defconfig    clang-20
powerpc                         wii_defconfig    clang-20
powerpc64             randconfig-001-20241210    gcc-14.2.0
powerpc64             randconfig-001-20241211    gcc-14.2.0
powerpc64             randconfig-002-20241210    gcc-14.2.0
powerpc64             randconfig-002-20241211    gcc-14.2.0
powerpc64             randconfig-003-20241210    gcc-14.2.0
powerpc64             randconfig-003-20241211    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    clang-20
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv                    nommu_virt_defconfig    clang-20
riscv                 randconfig-001-20241210    clang-19
riscv                 randconfig-001-20241211    clang-20
riscv                 randconfig-002-20241210    gcc-14.2.0
riscv                 randconfig-002-20241211    clang-20
s390                             allmodconfig    clang-19
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                                defconfig    gcc-14.2.0
s390                  randconfig-001-20241210    gcc-14.2.0
s390                  randconfig-001-20241211    clang-20
s390                  randconfig-002-20241210    gcc-14.2.0
s390                  randconfig-002-20241211    clang-20
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                             espt_defconfig    clang-20
sh                     magicpanelr2_defconfig    gcc-14.2.0
sh                    randconfig-001-20241210    gcc-14.2.0
sh                    randconfig-001-20241211    clang-20
sh                    randconfig-002-20241210    gcc-14.2.0
sh                    randconfig-002-20241211    clang-20
sh                          rsk7203_defconfig    gcc-14.2.0
sh                           se7721_defconfig    gcc-14.2.0
sh                           se7724_defconfig    gcc-14.2.0
sh                   sh7770_generic_defconfig    clang-20
sparc                            alldefconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20241210    gcc-14.2.0
sparc                 randconfig-001-20241211    clang-20
sparc                 randconfig-002-20241210    gcc-14.2.0
sparc                 randconfig-002-20241211    clang-20
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20241210    gcc-14.2.0
sparc64               randconfig-001-20241211    clang-20
sparc64               randconfig-002-20241210    gcc-14.2.0
sparc64               randconfig-002-20241211    clang-20
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241210    clang-20
um                    randconfig-001-20241211    clang-20
um                    randconfig-002-20241210    gcc-12
um                    randconfig-002-20241211    clang-20
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241210    gcc-12
x86_64      buildonly-randconfig-001-20241211    gcc-12
x86_64      buildonly-randconfig-002-20241210    clang-19
x86_64      buildonly-randconfig-002-20241211    gcc-12
x86_64      buildonly-randconfig-003-20241210    clang-19
x86_64      buildonly-randconfig-003-20241211    gcc-12
x86_64      buildonly-randconfig-004-20241210    gcc-12
x86_64      buildonly-randconfig-004-20241211    gcc-12
x86_64      buildonly-randconfig-005-20241210    gcc-12
x86_64      buildonly-randconfig-005-20241211    gcc-12
x86_64      buildonly-randconfig-006-20241210    clang-19
x86_64      buildonly-randconfig-006-20241211    gcc-12
x86_64                              defconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20241211    clang-19
x86_64                randconfig-002-20241211    clang-19
x86_64                randconfig-003-20241211    clang-19
x86_64                randconfig-004-20241211    clang-19
x86_64                randconfig-005-20241211    clang-19
x86_64                randconfig-006-20241211    clang-19
x86_64                randconfig-007-20241211    clang-19
x86_64                randconfig-008-20241211    clang-19
x86_64                randconfig-071-20241211    clang-19
x86_64                randconfig-072-20241211    clang-19
x86_64                randconfig-073-20241211    clang-19
x86_64                randconfig-074-20241211    clang-19
x86_64                randconfig-075-20241211    clang-19
x86_64                randconfig-076-20241211    clang-19
x86_64                randconfig-077-20241211    clang-19
x86_64                randconfig-078-20241211    clang-19
x86_64                               rhel-9.4    clang-19
x86_64                           rhel-9.4-bpf    clang-19
x86_64                         rhel-9.4-kunit    clang-19
x86_64                           rhel-9.4-ltp    clang-19
x86_64                          rhel-9.4-rust    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                generic_kc705_defconfig    gcc-14.2.0
xtensa                randconfig-001-20241210    gcc-14.2.0
xtensa                randconfig-001-20241211    clang-20
xtensa                randconfig-002-20241210    gcc-14.2.0
xtensa                randconfig-002-20241211    clang-20
xtensa                         virt_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

