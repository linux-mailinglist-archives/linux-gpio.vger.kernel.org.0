Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 586481AC0B3
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Apr 2020 14:06:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2634872AbgDPMGU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Apr 2020 08:06:20 -0400
Received: from mga12.intel.com ([192.55.52.136]:50548 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2634695AbgDPMGS (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 16 Apr 2020 08:06:18 -0400
IronPort-SDR: UGL/nwPnTx+YXm1Ng5y9zQcOZVNiAM/LSXconCBpO6K6kcPVliubmXzDdzEJHDd6tDglTHGwKt
 Y68ENlYje6Rg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2020 05:06:16 -0700
IronPort-SDR: ofhIn3qgxRHoj64Mnme4hmh0iHWWP75YUVPJIC6jSirW0tho2/03Vga8xWcSqoXfJt+5jWyNFn
 bjwwUzrNNEcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,390,1580803200"; 
   d="scan'208";a="244379993"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 16 Apr 2020 05:06:15 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jP3Hb-0007wr-5K; Thu, 16 Apr 2020 20:06:15 +0800
Date:   Thu, 16 Apr 2020 20:05:34 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [gpio:gpio-descriptors-sa1100fb] BUILD SUCCESS
 6a7f966069a267078313489f124a598169328e57
Message-ID: <5e984a0e.K43SpVhTlMtizXtb%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git  gpio-descriptors-sa1100fb
branch HEAD: 6a7f966069a267078313489f124a598169328e57  ARM/fbdev: sa11x0: Switch to use GPIO descriptors

elapsed time: 870m

configs tested: 78
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

arm64                            allyesconfig
arm                              allyesconfig
arm64                            allmodconfig
arm64                             allnoconfig
arm                               allnoconfig
arm                              allmodconfig
sparc                            allyesconfig
microblaze                      mmu_defconfig
i386                                defconfig
s390                                defconfig
m68k                          multi_defconfig
m68k                       m5475evb_defconfig
c6x                              allyesconfig
riscv                               defconfig
nios2                         3c120_defconfig
um                           x86_64_defconfig
m68k                             allmodconfig
openrisc                    or1ksim_defconfig
s390                          debug_defconfig
nds32                             allnoconfig
csky                                defconfig
nios2                         10m50_defconfig
h8300                    h8300h-sim_defconfig
mips                      fuloong2e_defconfig
mips                              allnoconfig
xtensa                          iss_defconfig
s390                             allyesconfig
um                                  defconfig
i386                              allnoconfig
i386                             allyesconfig
i386                             alldefconfig
i386                              debian-10.3
ia64                             allmodconfig
ia64                                defconfig
ia64                              allnoconfig
ia64                             allyesconfig
ia64                             alldefconfig
c6x                        evmc6678_defconfig
xtensa                       common_defconfig
openrisc                 simple_smp_defconfig
mips                      malta_kvm_defconfig
mips                             allyesconfig
mips                         64r6el_defconfig
mips                           32r2_defconfig
mips                             allmodconfig
parisc                            allnoconfig
parisc                generic-64bit_defconfig
parisc                generic-32bit_defconfig
parisc                           allyesconfig
i386                 randconfig-a002-20200416
i386                 randconfig-a003-20200416
i386                 randconfig-a001-20200416
x86_64               randconfig-a001-20200416
x86_64               randconfig-a002-20200416
x86_64               randconfig-a003-20200416
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
s390                       zfcpdump_defconfig
s390                              allnoconfig
s390                             allmodconfig
s390                             alldefconfig
sh                          rsk7269_defconfig
sh                               allmodconfig
sh                            titan_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                                allnoconfig
sparc                               defconfig
sparc64                             defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                          allmodconfig
um                             i386_defconfig
x86_64                                   rhel
x86_64                               rhel-7.6
x86_64                    rhel-7.6-kselftests

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
