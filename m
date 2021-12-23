Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37EE147DFA6
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Dec 2021 08:38:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346855AbhLWHie (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Dec 2021 02:38:34 -0500
Received: from mga11.intel.com ([192.55.52.93]:30435 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229965AbhLWHid (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 23 Dec 2021 02:38:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640245113; x=1671781113;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=FI4XX4PcUcVunYuOto1gedpr0He66GFGD0vwNpXTqYA=;
  b=h0day27kq/qYJ+EEKU+IWo6hUehbscMlQdMOOAkDj3czeda88hsg7Tqg
   aONVTGVbKUC3/sd954XZvYXqXnAX1DtrbdTcCtYXAWeMQuKNnzKtlwdvW
   m2JuK0EuOGZ3RKnzTS9f/mgzho4mhk/8U8KgogbylIQ4ZCmSq7xl8e0k+
   3ETZHjh8vc17GWYEeaGyWI7dQopnSyUo/wQaYT25mqtgBgV53SrRNLu4G
   lyms2wLK6nYPwcb2Dp7GCSNkkK617MgqnY2BStYpN5YU/px93CAtyBsV8
   Ww9HZzMiiAJbKJweT6c9KZRGf0to2+qh/5bDiAXwFy4LaKF/vCiBUNaKA
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10206"; a="238312765"
X-IronPort-AV: E=Sophos;i="5.88,228,1635231600"; 
   d="scan'208";a="238312765"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2021 23:38:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,228,1635231600"; 
   d="scan'208";a="468450330"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 22 Dec 2021 23:38:31 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1n0IgJ-0001Wo-4p; Thu, 23 Dec 2021 07:38:31 +0000
Date:   Thu, 23 Dec 2021 15:37:29 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 195acd15792a4672653417e57ea5a289dfd6ecfd
Message-ID: <61c42739.5YpKzQvyWN7PQCsp%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 195acd15792a4672653417e57ea5a289dfd6ecfd  Merge branch 'devel' into for-next

elapsed time: 1592m

configs tested: 204
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm                                 defconfig
arm                              allmodconfig
arm                              allyesconfig
arm64                            allyesconfig
i386                 randconfig-c001-20211223
arm                          moxart_defconfig
powerpc               mpc834x_itxgp_defconfig
sparc                       sparc64_defconfig
powerpc                         wii_defconfig
powerpc64                        alldefconfig
powerpc                      ppc44x_defconfig
mips                         tb0287_defconfig
sh                          sdk7786_defconfig
arm                      pxa255-idp_defconfig
mips                          ath25_defconfig
arc                        nsimosci_defconfig
arm                       mainstone_defconfig
powerpc                     ep8248e_defconfig
sh                         microdev_defconfig
arm                         s5pv210_defconfig
mips                        vocore2_defconfig
sh                     magicpanelr2_defconfig
openrisc                  or1klitex_defconfig
powerpc                     pq2fads_defconfig
arm                        spear6xx_defconfig
arm                        mvebu_v7_defconfig
sh                           sh2007_defconfig
sh                 kfr2r09-romimage_defconfig
powerpc                      pcm030_defconfig
arc                     nsimosci_hs_defconfig
arm                       aspeed_g4_defconfig
m68k                         apollo_defconfig
parisc                              defconfig
powerpc                     pseries_defconfig
powerpc                     tqm5200_defconfig
mips                     loongson1b_defconfig
mips                         bigsur_defconfig
powerpc                  storcenter_defconfig
powerpc                     taishan_defconfig
arm                         shannon_defconfig
mips                            gpr_defconfig
ia64                            zx1_defconfig
arm                          ixp4xx_defconfig
microblaze                          defconfig
xtensa                         virt_defconfig
sh                          polaris_defconfig
powerpc                      katmai_defconfig
mips                         tb0226_defconfig
microblaze                      mmu_defconfig
sh                        sh7757lcr_defconfig
powerpc                     tqm8541_defconfig
sh                          r7780mp_defconfig
sh                         apsh4a3a_defconfig
arm                           stm32_defconfig
arm                             pxa_defconfig
sh                          rsk7203_defconfig
m68k                       m5249evb_defconfig
arm64                            alldefconfig
powerpc                   motionpro_defconfig
arm                        clps711x_defconfig
sh                           se7343_defconfig
ia64                      gensparse_defconfig
xtensa                           allyesconfig
powerpc                  mpc866_ads_defconfig
powerpc                 xes_mpc85xx_defconfig
mips                           rs90_defconfig
arm                  colibri_pxa300_defconfig
sh                          landisk_defconfig
xtensa                  audio_kc705_defconfig
sh                            shmin_defconfig
arm                          pxa3xx_defconfig
sh                          rsk7264_defconfig
powerpc64                           defconfig
sh                        edosk7760_defconfig
ia64                             allyesconfig
powerpc                     kilauea_defconfig
mips                     cu1830-neo_defconfig
mips                     loongson2k_defconfig
mips                             allyesconfig
arm                            dove_defconfig
arm                         cm_x300_defconfig
powerpc                       ebony_defconfig
arm                            pleb_defconfig
xtensa                          iss_defconfig
mips                           ip32_defconfig
m68k                             allyesconfig
arm                         lpc32xx_defconfig
arm                          pxa168_defconfig
powerpc                      makalu_defconfig
arm                        trizeps4_defconfig
powerpc                     tqm8555_defconfig
arm                         mv78xx0_defconfig
arm                          lpd270_defconfig
arm                            zeus_defconfig
sh                           se7722_defconfig
m68k                       m5475evb_defconfig
xtensa                    smp_lx200_defconfig
arm                        vexpress_defconfig
powerpc                          allmodconfig
mips                          rm200_defconfig
mips                       bmips_be_defconfig
mips                        bcm47xx_defconfig
sh                             shx3_defconfig
arm                           sunxi_defconfig
mips                           ip22_defconfig
sh                      rts7751r2d1_defconfig
s390                             allyesconfig
openrisc                            defconfig
m68k                       bvme6000_defconfig
alpha                               defconfig
riscv             nommu_k210_sdcard_defconfig
arm                     davinci_all_defconfig
powerpc                      walnut_defconfig
sh                        sh7763rdp_defconfig
mips                            e55_defconfig
arm                        shmobile_defconfig
mips                       capcella_defconfig
mips                          rb532_defconfig
powerpc                        icon_defconfig
arm                  randconfig-c002-20211222
arm                  randconfig-c002-20211223
ia64                             allmodconfig
ia64                                defconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                            allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                                defconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
x86_64               randconfig-a001-20211222
x86_64               randconfig-a003-20211222
x86_64               randconfig-a005-20211222
x86_64               randconfig-a006-20211222
x86_64               randconfig-a004-20211222
x86_64               randconfig-a002-20211222
i386                 randconfig-a006-20211222
i386                 randconfig-a004-20211222
i386                 randconfig-a002-20211222
i386                 randconfig-a003-20211222
i386                 randconfig-a005-20211222
i386                 randconfig-a001-20211222
x86_64               randconfig-a013-20211223
x86_64               randconfig-a015-20211223
x86_64               randconfig-a014-20211223
x86_64               randconfig-a011-20211223
x86_64               randconfig-a012-20211223
x86_64               randconfig-a016-20211223
i386                 randconfig-a012-20211223
i386                 randconfig-a011-20211223
i386                 randconfig-a014-20211223
i386                 randconfig-a016-20211223
i386                 randconfig-a015-20211223
i386                 randconfig-a013-20211223
arc                  randconfig-r043-20211222
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
riscv                            allyesconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a013-20211222
x86_64               randconfig-a012-20211222
x86_64               randconfig-a011-20211222
x86_64               randconfig-a015-20211222
x86_64               randconfig-a014-20211222
x86_64               randconfig-a016-20211222
i386                 randconfig-a012-20211222
i386                 randconfig-a011-20211222
i386                 randconfig-a014-20211222
i386                 randconfig-a016-20211222
i386                 randconfig-a015-20211222
i386                 randconfig-a013-20211222
hexagon              randconfig-r041-20211222
hexagon              randconfig-r045-20211222
riscv                randconfig-r042-20211222
s390                 randconfig-r044-20211222

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
