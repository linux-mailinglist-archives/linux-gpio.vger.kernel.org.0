Return-Path: <linux-gpio+bounces-7864-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7906391EB3B
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jul 2024 01:00:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D5E0282BEC
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Jul 2024 23:00:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 115F67E799;
	Mon,  1 Jul 2024 23:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YOkC9R6Y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD984779E
	for <linux-gpio@vger.kernel.org>; Mon,  1 Jul 2024 23:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719874852; cv=none; b=NZTQtkc+IGHwDxEwE6hnOyb0MYQRkCGmMbtjH1BskEKSwQ6hgX0ZayRfUauhZFpd3PZ403BxqT0eywG8nniIwN4xrI76204D85hBQ2jYj5uZnPbDmJCv5oqL+kLIxzLYdDEGmTf2+LmS7HM631tBfT4eRAFNqFvaBj1ImgsbriE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719874852; c=relaxed/simple;
	bh=Qc0IpXhA7rZCBIRGH7YfoiuFffUnh9yHawo4Y9mpfF0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XVUmsE0Sdf0iAQKZJATykhQs0dKtecU7JZ1sOhowf8biId9ELUt1rpF1ROy8ggUhu5QslBRf8ozve39bKL1sRBulPVPyBGJD7GUspkvDUucNpleETzvX5xpKzqM+yPiu+aBswbPXVSAB8Ydkc7quPyt7pQlBRZ/1J98UYxAk/Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YOkC9R6Y; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719874851; x=1751410851;
  h=date:from:to:cc:subject:message-id;
  bh=Qc0IpXhA7rZCBIRGH7YfoiuFffUnh9yHawo4Y9mpfF0=;
  b=YOkC9R6YoTNieQud6f2tdLJgnh6PSpCniA4UQdN4yO2798vwAv1TOTD6
   ft36wn6p2x4OT8YyoSCCS4IlsnaAhUqmqQF7VRgwHLZ/aS2syPsAfjIMl
   DTrgCcF5cyuAo/WgTJVNROn9v6Dy3fvhJ3y68NhheiKGkH+YmxjJKfkyM
   lCVT/2JYyb1tFUxLKZPyBE3odxyie/yoOtYhjak6UUloI65kd7ZhNk5IG
   ZBaHmZiKno7oysoBmJ1sfYW5Bt8hOZvFf9X4mKJy7QYo1+AheWBNxnBpD
   lzxEROC7t3dU65vs2N4tr8HSDBotmA5reb0ZDK4QpWZKlY55j8EEHw9QB
   A==;
X-CSE-ConnectionGUID: CW7mIzoBRE2PuiF1GwSK+g==
X-CSE-MsgGUID: mxI09BRYRvmxizbhqAaYXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11120"; a="17242888"
X-IronPort-AV: E=Sophos;i="6.09,177,1716274800"; 
   d="scan'208";a="17242888"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2024 16:00:50 -0700
X-CSE-ConnectionGUID: yFyYzf7AQ7WMHav5LQlj4Q==
X-CSE-MsgGUID: mzBan4AmSaq6gi0uy3OFBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,177,1716274800"; 
   d="scan'208";a="45810520"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 01 Jul 2024 16:00:49 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sOQ0s-000NS2-2V;
	Mon, 01 Jul 2024 23:00:46 +0000
Date: Tue, 02 Jul 2024 07:00:26 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-gpio:b4/asoc-tas-gpios] BUILD SUCCESS
 3af06073a9474b89fd1d92ba0d338781305af34a
Message-ID: <202407020724.rGYINnxR-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git b4/asoc-tas-gpios
branch HEAD: 3af06073a9474b89fd1d92ba0d338781305af34a  ASoC: tas*: Drop unused GPIO includes

elapsed time: 1477m

configs tested: 173
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                            allyesconfig   gcc-13.2.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                          axs103_defconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                   randconfig-001-20240701   gcc-13.2.0
arc                   randconfig-002-20240701   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                          collie_defconfig   gcc-13.2.0
arm                                 defconfig   gcc-13.2.0
arm                   randconfig-001-20240701   gcc-13.2.0
arm                   randconfig-002-20240701   gcc-13.2.0
arm                   randconfig-003-20240701   gcc-13.2.0
arm                   randconfig-004-20240701   gcc-13.2.0
arm                           sunxi_defconfig   gcc-13.2.0
arm                           tegra_defconfig   gcc-13.2.0
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240701   gcc-13.2.0
arm64                 randconfig-002-20240701   gcc-13.2.0
arm64                 randconfig-003-20240701   gcc-13.2.0
arm64                 randconfig-004-20240701   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240701   gcc-13.2.0
csky                  randconfig-002-20240701   gcc-13.2.0
i386                             allmodconfig   clang-18
i386                              allnoconfig   clang-18
i386                             allyesconfig   clang-18
i386         buildonly-randconfig-001-20240701   clang-18
i386         buildonly-randconfig-002-20240701   clang-18
i386         buildonly-randconfig-003-20240701   clang-18
i386         buildonly-randconfig-004-20240701   clang-18
i386         buildonly-randconfig-005-20240701   clang-18
i386         buildonly-randconfig-005-20240701   gcc-13
i386         buildonly-randconfig-006-20240701   clang-18
i386         buildonly-randconfig-006-20240701   gcc-9
i386                                defconfig   clang-18
i386                  randconfig-001-20240701   clang-18
i386                  randconfig-002-20240701   clang-18
i386                  randconfig-003-20240701   clang-18
i386                  randconfig-004-20240701   clang-18
i386                  randconfig-004-20240701   gcc-7
i386                  randconfig-005-20240701   clang-18
i386                  randconfig-006-20240701   clang-18
i386                  randconfig-006-20240701   gcc-13
i386                  randconfig-011-20240701   clang-18
i386                  randconfig-011-20240701   gcc-13
i386                  randconfig-012-20240701   clang-18
i386                  randconfig-013-20240701   clang-18
i386                  randconfig-014-20240701   clang-18
i386                  randconfig-014-20240701   gcc-8
i386                  randconfig-015-20240701   clang-18
i386                  randconfig-015-20240701   gcc-10
i386                  randconfig-016-20240701   clang-18
loongarch                        allmodconfig   gcc-13.2.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240701   gcc-13.2.0
loongarch             randconfig-002-20240701   gcc-13.2.0
m68k                             allmodconfig   gcc-13.2.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-13.2.0
m68k                                defconfig   gcc-13.2.0
m68k                          hp300_defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-13.2.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                         cobalt_defconfig   gcc-13.2.0
mips                malta_qemu_32r6_defconfig   gcc-13.2.0
nios2                         3c120_defconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240701   gcc-13.2.0
nios2                 randconfig-002-20240701   gcc-13.2.0
openrisc                          allnoconfig   gcc-13.2.0
openrisc                         allyesconfig   gcc-13.2.0
openrisc                            defconfig   gcc-13.2.0
parisc                           allmodconfig   gcc-13.2.0
parisc                            allnoconfig   gcc-13.2.0
parisc                           allyesconfig   gcc-13.2.0
parisc                              defconfig   gcc-13.2.0
parisc                randconfig-001-20240701   gcc-13.2.0
parisc                randconfig-002-20240701   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-13.2.0
powerpc                           allnoconfig   gcc-13.2.0
powerpc                          allyesconfig   gcc-13.2.0
powerpc                   lite5200b_defconfig   gcc-13.2.0
powerpc                 mpc836x_rdk_defconfig   gcc-13.2.0
powerpc                     mpc83xx_defconfig   gcc-13.2.0
powerpc               randconfig-001-20240701   gcc-13.2.0
powerpc               randconfig-002-20240701   gcc-13.2.0
powerpc               randconfig-003-20240701   gcc-13.2.0
powerpc64             randconfig-001-20240701   gcc-13.2.0
powerpc64             randconfig-002-20240701   gcc-13.2.0
powerpc64             randconfig-003-20240701   gcc-13.2.0
riscv                            allmodconfig   gcc-13.2.0
riscv                             allnoconfig   gcc-13.2.0
riscv                            allyesconfig   gcc-13.2.0
riscv                               defconfig   gcc-13.2.0
riscv                 randconfig-001-20240701   gcc-13.2.0
riscv                 randconfig-002-20240701   gcc-13.2.0
s390                             allmodconfig   clang-19
s390                              allnoconfig   clang-19
s390                              allnoconfig   gcc-13.2.0
s390                             allyesconfig   clang-19
s390                                defconfig   gcc-13.2.0
s390                  randconfig-001-20240701   gcc-13.2.0
s390                  randconfig-002-20240701   gcc-13.2.0
sh                                allnoconfig   gcc-13.2.0
sh                        apsh4ad0a_defconfig   gcc-13.2.0
sh                                  defconfig   gcc-13.2.0
sh                        dreamcast_defconfig   gcc-13.2.0
sh                          kfr2r09_defconfig   gcc-13.2.0
sh                          landisk_defconfig   gcc-13.2.0
sh                    randconfig-001-20240701   gcc-13.2.0
sh                    randconfig-002-20240701   gcc-13.2.0
sh                          rsk7264_defconfig   gcc-13.2.0
sparc64                             defconfig   gcc-13.2.0
sparc64               randconfig-001-20240701   gcc-13.2.0
sparc64               randconfig-002-20240701   gcc-13.2.0
um                               allmodconfig   gcc-13.2.0
um                                allnoconfig   clang-17
um                                allnoconfig   gcc-13.2.0
um                               allyesconfig   gcc-13.2.0
um                                  defconfig   gcc-13.2.0
um                             i386_defconfig   gcc-13.2.0
um                    randconfig-001-20240701   gcc-13.2.0
um                    randconfig-002-20240701   gcc-13.2.0
um                           x86_64_defconfig   gcc-13.2.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240701   gcc-11
x86_64       buildonly-randconfig-002-20240701   gcc-11
x86_64       buildonly-randconfig-003-20240701   gcc-11
x86_64       buildonly-randconfig-004-20240701   gcc-11
x86_64       buildonly-randconfig-005-20240701   gcc-11
x86_64       buildonly-randconfig-006-20240701   gcc-11
x86_64                              defconfig   clang-18
x86_64                                  kexec   clang-18
x86_64                randconfig-001-20240701   gcc-11
x86_64                randconfig-002-20240701   gcc-11
x86_64                randconfig-003-20240701   gcc-11
x86_64                randconfig-004-20240701   gcc-11
x86_64                randconfig-005-20240701   gcc-11
x86_64                randconfig-006-20240701   gcc-11
x86_64                randconfig-011-20240701   gcc-11
x86_64                randconfig-012-20240701   gcc-11
x86_64                randconfig-013-20240701   gcc-11
x86_64                randconfig-014-20240701   gcc-11
x86_64                randconfig-015-20240701   gcc-11
x86_64                randconfig-016-20240701   gcc-11
x86_64                randconfig-071-20240701   gcc-11
x86_64                randconfig-072-20240701   gcc-11
x86_64                randconfig-073-20240701   gcc-11
x86_64                randconfig-074-20240701   gcc-11
x86_64                randconfig-075-20240701   gcc-11
x86_64                randconfig-076-20240701   gcc-11
x86_64                          rhel-8.3-func   clang-18
x86_64                          rhel-8.3-rust   clang-18
x86_64                               rhel-8.3   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                randconfig-001-20240701   gcc-13.2.0
xtensa                randconfig-002-20240701   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

