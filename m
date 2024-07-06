Return-Path: <linux-gpio+bounces-8079-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF8F9292B8
	for <lists+linux-gpio@lfdr.de>; Sat,  6 Jul 2024 13:11:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 237352814F3
	for <lists+linux-gpio@lfdr.de>; Sat,  6 Jul 2024 11:11:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38C0154907;
	Sat,  6 Jul 2024 11:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VPisQRn3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72822837F
	for <linux-gpio@vger.kernel.org>; Sat,  6 Jul 2024 11:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720264308; cv=none; b=Fw0RmJKE4QfCuqboctIkOq6xGNos5BpVAGIvwLgG7XTnd1buJqiE7YVuEhbbyEetp6isv7CkMXw2n3TnIc5llpqw0BTczHYN6HPRpC4I+jOUkzeZKleqrjFqjJ9SEdeW4taaecMOekqf9SzCvuMoQYinsYX7JIHqu5ETMJSX4iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720264308; c=relaxed/simple;
	bh=xvrR+hyS5EM2lZXoa+BN1X4XrMw0MVbgjFMyHOuhPcE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AqHOkh8FaFkfb1ioNShBW9SMbHT7+sX/9SYbhqjGq3cPwvNVQ74uOjVIyghuKBSJJe0IQYaDQ7RLttBqRY+TB897NjhTdm3YYUBsT+hDi1Ak0Zwzg2mRjIauAAJv/bUS18fziWivzD0849TKLVGZW6vwd5MgrDisWmT0o/fNhJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VPisQRn3; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720264306; x=1751800306;
  h=date:from:to:cc:subject:message-id;
  bh=xvrR+hyS5EM2lZXoa+BN1X4XrMw0MVbgjFMyHOuhPcE=;
  b=VPisQRn3C+DJwRc9NsuesZVnD9wuMEO0jaE3HaqrWt3ddJbnbr3YgRtV
   Jo/vADKuPTfY36Os46kQp5Qi6NCh4JFvW5Mzi0yE8CyyCExRoj6kdabDz
   4Sm8Hdpt/Ao9Yu4GqBsH1IzPmlGSXC0g3Knq4Ih8I7R2Skt8ufCiBKulG
   rZ5au6qEUe8mAjBZwMRQAsyqv8r5JNiXqbKfm91RByZgQjjmD29h+97we
   7n5py/wcb4kwNnMc7Jqq6QNvXwEw2aH+XD6oY9b+oh5Ql3YImmGAvnw+G
   BbzoWkzl36QWNdgX2R92VP3w0HhSltOHofgQN8HonrxoueWatbws93aiA
   g==;
X-CSE-ConnectionGUID: KAopJaz1RZaIhuIOhOwjIg==
X-CSE-MsgGUID: ov3/ZSdLQbCbXjztududrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="28201851"
X-IronPort-AV: E=Sophos;i="6.09,187,1716274800"; 
   d="scan'208";a="28201851"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2024 04:11:45 -0700
X-CSE-ConnectionGUID: qOJFw6LUT5q8QgIdlxiXuw==
X-CSE-MsgGUID: Pfg6L5CrR8qNqCwSMAPzdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,187,1716274800"; 
   d="scan'208";a="51491592"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 06 Jul 2024 04:11:44 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQ3KP-000ThW-2S;
	Sat, 06 Jul 2024 11:11:41 +0000
Date: Sat, 06 Jul 2024 19:10:58 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 11eaac6e8e72001c28d2043eb160736187b7977d
Message-ID: <202407061956.o5zu4h5E-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 11eaac6e8e72001c28d2043eb160736187b7977d  Merge tag 'renesas-pinctrl-for-v6.11-tag3' of git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers into devel

elapsed time: 1199m

configs tested: 233
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                            allyesconfig   gcc-13.2.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                        nsim_700_defconfig   gcc-13.2.0
arc                 nsimosci_hs_smp_defconfig   gcc-13.2.0
arc                   randconfig-001-20240706   gcc-13.2.0
arc                   randconfig-002-20240706   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                               allnoconfig   clang-19
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                                 defconfig   gcc-13.2.0
arm                       imx_v4_v5_defconfig   gcc-13.2.0
arm                      integrator_defconfig   gcc-13.2.0
arm                        keystone_defconfig   gcc-13.2.0
arm                   randconfig-001-20240706   gcc-13.2.0
arm                   randconfig-002-20240706   gcc-13.2.0
arm                   randconfig-003-20240706   gcc-13.2.0
arm                   randconfig-004-20240706   gcc-13.2.0
arm                         socfpga_defconfig   gcc-13.2.0
arm                          sp7021_defconfig   gcc-13.2.0
arm64                            allmodconfig   clang-19
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240706   gcc-13.2.0
arm64                 randconfig-002-20240706   gcc-13.2.0
arm64                 randconfig-003-20240706   clang-16
arm64                 randconfig-003-20240706   gcc-13.2.0
arm64                 randconfig-004-20240706   clang-19
arm64                 randconfig-004-20240706   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240706   gcc-13.2.0
csky                  randconfig-002-20240706   gcc-13.2.0
hexagon                          allmodconfig   clang-19
hexagon                           allnoconfig   clang-19
hexagon                          allyesconfig   clang-19
hexagon                             defconfig   clang-19
hexagon               randconfig-001-20240706   clang-19
hexagon               randconfig-002-20240706   clang-15
i386                             allmodconfig   clang-18
i386                             allmodconfig   gcc-13
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-13
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-13
i386         buildonly-randconfig-001-20240706   clang-18
i386         buildonly-randconfig-002-20240706   clang-18
i386         buildonly-randconfig-002-20240706   gcc-13
i386         buildonly-randconfig-003-20240706   clang-18
i386         buildonly-randconfig-004-20240706   clang-18
i386         buildonly-randconfig-004-20240706   gcc-13
i386         buildonly-randconfig-005-20240706   clang-18
i386         buildonly-randconfig-005-20240706   gcc-10
i386         buildonly-randconfig-006-20240706   clang-18
i386                                defconfig   clang-18
i386                  randconfig-001-20240706   clang-18
i386                  randconfig-001-20240706   gcc-13
i386                  randconfig-002-20240706   clang-18
i386                  randconfig-003-20240706   clang-18
i386                  randconfig-003-20240706   gcc-13
i386                  randconfig-004-20240706   clang-18
i386                  randconfig-005-20240706   clang-18
i386                  randconfig-006-20240706   clang-18
i386                  randconfig-006-20240706   gcc-12
i386                  randconfig-011-20240706   clang-18
i386                  randconfig-011-20240706   gcc-11
i386                  randconfig-012-20240706   clang-18
i386                  randconfig-013-20240706   clang-18
i386                  randconfig-014-20240706   clang-18
i386                  randconfig-015-20240706   clang-18
i386                  randconfig-015-20240706   gcc-7
i386                  randconfig-016-20240706   clang-18
i386                  randconfig-016-20240706   gcc-13
loongarch                        allmodconfig   gcc-13.2.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240706   gcc-13.2.0
loongarch             randconfig-002-20240706   gcc-13.2.0
m68k                             allmodconfig   gcc-13.2.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-13.2.0
m68k                          amiga_defconfig   gcc-13.2.0
m68k                         apollo_defconfig   gcc-13.2.0
m68k                                defconfig   gcc-13.2.0
m68k                       m5475evb_defconfig   gcc-13.2.0
m68k                        stmark2_defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-13.2.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                           ci20_defconfig   gcc-13.2.0
mips                           jazz_defconfig   gcc-13.2.0
mips                     loongson1b_defconfig   gcc-13.2.0
mips                      loongson3_defconfig   gcc-13.2.0
mips                          malta_defconfig   gcc-13.2.0
mips                       rbtx49xx_defconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240706   gcc-13.2.0
nios2                 randconfig-002-20240706   gcc-13.2.0
openrisc                          allnoconfig   gcc-13.2.0
openrisc                         allyesconfig   gcc-13.2.0
openrisc                            defconfig   gcc-13.2.0
openrisc                    or1ksim_defconfig   gcc-13.2.0
parisc                           allmodconfig   gcc-13.2.0
parisc                            allnoconfig   gcc-13.2.0
parisc                           allyesconfig   gcc-13.2.0
parisc                              defconfig   gcc-13.2.0
parisc                randconfig-001-20240706   gcc-13.2.0
parisc                randconfig-002-20240706   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                     akebono_defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-13.2.0
powerpc                           allnoconfig   gcc-13.2.0
powerpc                          allyesconfig   clang-19
powerpc                          allyesconfig   gcc-13.2.0
powerpc                      bamboo_defconfig   gcc-13.2.0
powerpc                      mgcoge_defconfig   gcc-13.2.0
powerpc                  mpc866_ads_defconfig   gcc-13.2.0
powerpc                  mpc885_ads_defconfig   gcc-13.2.0
powerpc               randconfig-001-20240706   gcc-13.2.0
powerpc               randconfig-002-20240706   gcc-13.2.0
powerpc               randconfig-003-20240706   clang-19
powerpc                     sequoia_defconfig   gcc-13.2.0
powerpc64             randconfig-001-20240706   gcc-13.2.0
powerpc64             randconfig-002-20240706   gcc-13.2.0
powerpc64             randconfig-003-20240706   clang-19
powerpc64             randconfig-003-20240706   gcc-13.2.0
riscv                            allmodconfig   clang-19
riscv                            allmodconfig   gcc-13.2.0
riscv                             allnoconfig   gcc-13.2.0
riscv                            allyesconfig   clang-19
riscv                            allyesconfig   gcc-13.2.0
riscv                               defconfig   clang-19
riscv                               defconfig   gcc-13.2.0
riscv                 randconfig-001-20240706   gcc-13.2.0
riscv                 randconfig-002-20240706   gcc-13.2.0
s390                             alldefconfig   gcc-13.2.0
s390                             allmodconfig   clang-19
s390                              allnoconfig   clang-19
s390                              allnoconfig   gcc-13.2.0
s390                             allyesconfig   clang-19
s390                             allyesconfig   gcc-13.2.0
s390                                defconfig   clang-19
s390                                defconfig   gcc-13.2.0
s390                  randconfig-001-20240706   gcc-13.2.0
s390                  randconfig-002-20240706   clang-19
s390                  randconfig-002-20240706   gcc-13.2.0
sh                               allmodconfig   gcc-13.2.0
sh                                allnoconfig   gcc-13.2.0
sh                               allyesconfig   gcc-13.2.0
sh                                  defconfig   gcc-13.2.0
sh                ecovec24-romimage_defconfig   gcc-13.2.0
sh                          r7785rp_defconfig   gcc-13.2.0
sh                    randconfig-001-20240706   gcc-13.2.0
sh                    randconfig-002-20240706   gcc-13.2.0
sh                           se7619_defconfig   gcc-13.2.0
sh                           se7722_defconfig   gcc-13.2.0
sh                           se7724_defconfig   gcc-13.2.0
sparc                            allmodconfig   gcc-13.2.0
sparc64                             defconfig   gcc-13.2.0
sparc64               randconfig-001-20240706   gcc-13.2.0
sparc64               randconfig-002-20240706   gcc-13.2.0
um                               allmodconfig   clang-19
um                               allmodconfig   gcc-13.2.0
um                                allnoconfig   clang-17
um                                allnoconfig   gcc-13.2.0
um                               allyesconfig   gcc-13
um                               allyesconfig   gcc-13.2.0
um                                  defconfig   clang-19
um                                  defconfig   gcc-13.2.0
um                             i386_defconfig   gcc-13
um                             i386_defconfig   gcc-13.2.0
um                    randconfig-001-20240706   clang-19
um                    randconfig-001-20240706   gcc-13.2.0
um                    randconfig-002-20240706   gcc-13
um                    randconfig-002-20240706   gcc-13.2.0
um                           x86_64_defconfig   clang-15
um                           x86_64_defconfig   gcc-13.2.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240706   clang-18
x86_64       buildonly-randconfig-002-20240706   clang-18
x86_64       buildonly-randconfig-003-20240706   clang-18
x86_64       buildonly-randconfig-004-20240706   clang-18
x86_64       buildonly-randconfig-005-20240706   clang-18
x86_64       buildonly-randconfig-005-20240706   gcc-13
x86_64       buildonly-randconfig-006-20240706   clang-18
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-13
x86_64                randconfig-001-20240706   clang-18
x86_64                randconfig-001-20240706   gcc-9
x86_64                randconfig-002-20240706   clang-18
x86_64                randconfig-003-20240706   clang-18
x86_64                randconfig-004-20240706   clang-18
x86_64                randconfig-005-20240706   clang-18
x86_64                randconfig-006-20240706   clang-18
x86_64                randconfig-011-20240706   clang-18
x86_64                randconfig-011-20240706   gcc-12
x86_64                randconfig-012-20240706   clang-18
x86_64                randconfig-012-20240706   gcc-12
x86_64                randconfig-013-20240706   clang-18
x86_64                randconfig-014-20240706   clang-18
x86_64                randconfig-014-20240706   gcc-13
x86_64                randconfig-015-20240706   clang-18
x86_64                randconfig-015-20240706   gcc-13
x86_64                randconfig-016-20240706   clang-18
x86_64                randconfig-016-20240706   gcc-13
x86_64                randconfig-071-20240706   clang-18
x86_64                randconfig-071-20240706   gcc-12
x86_64                randconfig-072-20240706   clang-18
x86_64                randconfig-072-20240706   gcc-13
x86_64                randconfig-073-20240706   clang-18
x86_64                randconfig-073-20240706   gcc-12
x86_64                randconfig-074-20240706   clang-18
x86_64                randconfig-074-20240706   gcc-13
x86_64                randconfig-075-20240706   clang-18
x86_64                randconfig-076-20240706   clang-18
x86_64                randconfig-076-20240706   gcc-13
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                       common_defconfig   gcc-13.2.0
xtensa                generic_kc705_defconfig   gcc-13.2.0
xtensa                  nommu_kc705_defconfig   gcc-13.2.0
xtensa                randconfig-001-20240706   gcc-13.2.0
xtensa                randconfig-002-20240706   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

