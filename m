Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 032B4576BC5
	for <lists+linux-gpio@lfdr.de>; Sat, 16 Jul 2022 06:27:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229588AbiGPE1D (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 16 Jul 2022 00:27:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbiGPE1C (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 16 Jul 2022 00:27:02 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A7AA481DE
        for <linux-gpio@vger.kernel.org>; Fri, 15 Jul 2022 21:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657945619; x=1689481619;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=2gTWC/3zRkwjnqaV09ehgIJjHr0IRHxNiZToKuOrBuE=;
  b=WwHYtGVGl9Zo52yqNqCJK3ZDaI36BdxoHYM+8+DjK7URzjAZrfuj3kaT
   +SzAQqdJilG41Cw3WlKXjSlC5UnINOwUeq27Ao0suPMte0xBMKtHxm7Eo
   zPScq1i5S9G9klcIzuucA8Wi3oJLYsjPjAud12y7ZZB0LYrlbWKkbcIae
   FQTYDzqkPChGqw1WbGpulmo5VazzrzwNCtHB61Ry0GL8eM7DM9vdUn5hR
   AklpvCuhQqazxJ0hQjcgtkLis0SHFryfhrdzPolK/iCWkS6ykEl/5t3Cl
   bo3l0nBvBSH6a9CWSoMMhMzlb32v31hWw/Dek314R8+V5oBTkipHIccXV
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10409"; a="286681938"
X-IronPort-AV: E=Sophos;i="5.92,275,1650956400"; 
   d="scan'208";a="286681938"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2022 21:26:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,275,1650956400"; 
   d="scan'208";a="923748614"
Received: from lkp-server02.sh.intel.com (HELO ff137eb26ff1) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 15 Jul 2022 21:26:57 -0700
Received: from kbuild by ff137eb26ff1 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1oCZOL-00018O-2o;
        Sat, 16 Jul 2022 04:26:57 +0000
Date:   Sat, 16 Jul 2022 12:26:23 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 63e90bf077788750191298f7ad9351badb25de3c
Message-ID: <62d23def.IdesMfUn0JvnL9r1%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 63e90bf077788750191298f7ad9351badb25de3c  gpio: 104-idi-48: unsigned to unsigned int cleanup

elapsed time: 4065m

configs tested: 170
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-c001
arm                         nhk8815_defconfig
sh                           se7751_defconfig
sh                         apsh4a3a_defconfig
arm                        trizeps4_defconfig
mips                           gcw0_defconfig
riscv             nommu_k210_sdcard_defconfig
sparc                             allnoconfig
arm                           h3600_defconfig
mips                         cobalt_defconfig
sh                        sh7785lcr_defconfig
arm                        mvebu_v7_defconfig
powerpc                 mpc85xx_cds_defconfig
parisc                generic-32bit_defconfig
m68k                       m5275evb_defconfig
arm                        oxnas_v6_defconfig
arm                        clps711x_defconfig
powerpc                      pcm030_defconfig
m68k                          atari_defconfig
arc                          axs103_defconfig
powerpc                     pq2fads_defconfig
arm                             ezx_defconfig
sh                             sh03_defconfig
m68k                        m5272c3_defconfig
arc                                 defconfig
arm                         at91_dt_defconfig
powerpc                   motionpro_defconfig
arm                           imxrt_defconfig
xtensa                    smp_lx200_defconfig
nios2                            allyesconfig
alpha                             allnoconfig
powerpc                      arches_defconfig
ia64                          tiger_defconfig
arm                      footbridge_defconfig
arm                         lubbock_defconfig
sh                           se7343_defconfig
sh                             espt_defconfig
powerpc                 mpc8540_ads_defconfig
arm                           viper_defconfig
sh                        edosk7705_defconfig
arc                              alldefconfig
powerpc                  iss476-smp_defconfig
mips                         bigsur_defconfig
arm                        multi_v7_defconfig
sh                          rsk7203_defconfig
arm                        spear6xx_defconfig
powerpc                     redwood_defconfig
arm                       aspeed_g5_defconfig
sh                               alldefconfig
openrisc                            defconfig
x86_64                                  kexec
sparc                               defconfig
xtensa                           allyesconfig
csky                                defconfig
sparc                            allyesconfig
riscv                               defconfig
s390                                defconfig
s390                             allmodconfig
alpha                               defconfig
s390                             allyesconfig
parisc                              defconfig
nios2                               defconfig
parisc64                            defconfig
parisc                           allyesconfig
riscv                             allnoconfig
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
i386                              debian-10.3
i386                   debian-10.3-kselftests
riscv                          rv32_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220715
ia64                             allmodconfig
csky                              allnoconfig
arc                               allnoconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
i386                             allyesconfig
i386                                defconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arc                  randconfig-r043-20220713
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit

clang tested configs:
arm                         socfpga_defconfig
powerpc                 mpc8272_ads_defconfig
arm                   milbeaut_m10v_defconfig
riscv                             allnoconfig
arm                      tct_hammer_defconfig
powerpc                 mpc836x_mds_defconfig
arm                           spitz_defconfig
powerpc                 mpc836x_rdk_defconfig
powerpc                 mpc8560_ads_defconfig
arm                      pxa255-idp_defconfig
mips                        workpad_defconfig
powerpc                          g5_defconfig
powerpc                    gamecube_defconfig
powerpc                  mpc885_ads_defconfig
powerpc                    mvme5100_defconfig
arm                        vexpress_defconfig
s390                             alldefconfig
powerpc                   lite5200b_defconfig
arm                          pcm027_defconfig
arm                       cns3420vb_defconfig
arm                     am200epdkit_defconfig
powerpc                     ksi8560_defconfig
mips                      malta_kvm_defconfig
powerpc                        fsp2_defconfig
hexagon                             defconfig
powerpc                      ppc44x_defconfig
mips                           ip28_defconfig
powerpc                     ppa8548_defconfig
powerpc                     kilauea_defconfig
mips                           ip27_defconfig
powerpc                     tqm5200_defconfig
mips                        omega2p_defconfig
arm                          moxart_defconfig
powerpc                     mpc512x_defconfig
mips                     cu1000-neo_defconfig
arm                         orion5x_defconfig
powerpc                      pmac32_defconfig
riscv                            alldefconfig
x86_64                        randconfig-k001
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r045-20220714
hexagon              randconfig-r041-20220714
hexagon              randconfig-r045-20220713
riscv                randconfig-r042-20220713
hexagon              randconfig-r041-20220713
s390                 randconfig-r044-20220713
hexagon              randconfig-r045-20220715
s390                 randconfig-r044-20220715
hexagon              randconfig-r041-20220715
riscv                randconfig-r042-20220715

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
