Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42CC0216416
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jul 2020 04:38:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727850AbgGGCiV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Jul 2020 22:38:21 -0400
Received: from mga03.intel.com ([134.134.136.65]:45070 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726869AbgGGCiV (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 6 Jul 2020 22:38:21 -0400
IronPort-SDR: ZH91aHBIj1kx4YQUi9hBclfyZbjrVTh+x5z6EjwTRt1Dj33jOn5XOsUeEbmwX/zUvZ3KVUwc2i
 37hrjubHJFLg==
X-IronPort-AV: E=McAfee;i="6000,8403,9674"; a="147539871"
X-IronPort-AV: E=Sophos;i="5.75,321,1589266800"; 
   d="scan'208";a="147539871"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2020 19:38:20 -0700
IronPort-SDR: niqW3+VxO7xfMMtDlzXdZ75d59YlgZ5HOvxQzxMaO56204379+SWrPUSb4FxZ6ln/1saC9/pJk
 BCjwPpf2OY6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,321,1589266800"; 
   d="scan'208";a="283235884"
Received: from lkp-server01.sh.intel.com (HELO f2047cb89c8e) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 06 Jul 2020 19:38:19 -0700
Received: from kbuild by f2047cb89c8e with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jsdUw-000025-Nl; Tue, 07 Jul 2020 02:38:18 +0000
Date:   Tue, 07 Jul 2020 10:37:40 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [pinctrl:for-next] BUILD SUCCESS
 2db6267b6f4d8608f23fde928522a9c9d5ea5cd6
Message-ID: <5f03dff4.CNUz84ssQRXm0T6s%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git  for-next
branch HEAD: 2db6267b6f4d8608f23fde928522a9c9d5ea5cd6  Merge branch 'devel' into for-next

elapsed time: 725m

configs tested: 135
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                               allnoconfig
arm64                            allyesconfig
arm64                               defconfig
arm64                            allmodconfig
arm64                             allnoconfig
arm                           corgi_defconfig
mips                     loongson1b_defconfig
s390                              allnoconfig
arm                           spitz_defconfig
arm                             ezx_defconfig
sh                                  defconfig
arm                      tct_hammer_defconfig
powerpc64                           defconfig
sh                        dreamcast_defconfig
arm                         orion5x_defconfig
mips                           ip22_defconfig
riscv                    nommu_k210_defconfig
mips                           jazz_defconfig
sh                          r7785rp_defconfig
openrisc                         allyesconfig
sparc                            alldefconfig
mips                  mips_paravirt_defconfig
sh                     sh7710voipgw_defconfig
mips                         rt305x_defconfig
nios2                         3c120_defconfig
arm                            hisi_defconfig
mips                            gpr_defconfig
arm                          pxa168_defconfig
sparc64                          allyesconfig
sh                               j2_defconfig
mips                       lemote2f_defconfig
sh                           se7780_defconfig
arm                     davinci_all_defconfig
arm                     eseries_pxa_defconfig
arm                              zx_defconfig
parisc                generic-32bit_defconfig
xtensa                  audio_kc705_defconfig
mips                        bcm47xx_defconfig
sh                          rsk7269_defconfig
m68k                        m5307c3_defconfig
mips                         bigsur_defconfig
arm                       versatile_defconfig
m68k                        stmark2_defconfig
sh                           se7705_defconfig
xtensa                          iss_defconfig
i386                              allnoconfig
i386                             allyesconfig
i386                                defconfig
i386                              debian-10.3
ia64                             allmodconfig
ia64                                defconfig
ia64                              allnoconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                              allnoconfig
m68k                           sun3_defconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
nios2                            allyesconfig
openrisc                            defconfig
c6x                              allyesconfig
c6x                               allnoconfig
nds32                               defconfig
nds32                             allnoconfig
csky                             allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
h8300                            allmodconfig
xtensa                              defconfig
arc                                 defconfig
arc                              allyesconfig
sh                               allmodconfig
sh                                allnoconfig
microblaze                        allnoconfig
mips                             allyesconfig
mips                              allnoconfig
mips                             allmodconfig
parisc                            allnoconfig
parisc                              defconfig
parisc                           allyesconfig
parisc                           allmodconfig
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
powerpc                             defconfig
i386                 randconfig-a001-20200706
i386                 randconfig-a002-20200706
i386                 randconfig-a006-20200706
i386                 randconfig-a004-20200706
i386                 randconfig-a005-20200706
i386                 randconfig-a003-20200706
i386                 randconfig-a011-20200706
i386                 randconfig-a014-20200706
i386                 randconfig-a015-20200706
i386                 randconfig-a016-20200706
i386                 randconfig-a012-20200706
i386                 randconfig-a013-20200706
x86_64               randconfig-a001-20200706
x86_64               randconfig-a006-20200706
x86_64               randconfig-a002-20200706
x86_64               randconfig-a003-20200706
x86_64               randconfig-a004-20200706
x86_64               randconfig-a005-20200706
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
s390                             allyesconfig
s390                             allmodconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
sparc64                             defconfig
sparc64                           allnoconfig
sparc64                          allmodconfig
um                                allnoconfig
um                                  defconfig
um                               allmodconfig
um                               allyesconfig
x86_64                               rhel-7.6
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                                   rhel
x86_64                         rhel-7.2-clear
x86_64                                    lkp
x86_64                              fedora-25

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
