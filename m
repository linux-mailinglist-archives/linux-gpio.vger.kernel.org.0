Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62F3251179E
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Apr 2022 14:46:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233662AbiD0MUi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Apr 2022 08:20:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233653AbiD0MUi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Apr 2022 08:20:38 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E2553EBA6
        for <linux-gpio@vger.kernel.org>; Wed, 27 Apr 2022 05:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651061847; x=1682597847;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=zqvBlyw87ZFmIrwiogQyjztuj2WE3xTNyJynyDomZyg=;
  b=OjwL2Wn6a9E5hiRKEK2bum7YSTvFTRaUiJmF/242mOP/Mu6KG3mEBeXn
   lxMg8xtwMqpzpIDklAIP2fciyhzf6LJfP8xPjKMKQ6rA6E64vxgf1eCOG
   4kGirgypvXDjJncA6RFdlx/PIOhqTy7baPSEJyr2w4vXkvV47chDQBdx0
   25pgnZusiAwvMj7BIYaDS4733q5A2PdTOde8MM31AJxLTzL2mq629YSzR
   L/PeIapEJPLuKM4WC32xgYskIGb4drOjSNQmZSt2U7ydQdMqLErbAURHk
   30NoG+GS9j0cY+9pKHSe+TQvu75+FKl1tV9XrNOk7fSeHMgk/Vznepxa6
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="263496815"
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; 
   d="scan'208";a="263496815"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2022 05:17:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; 
   d="scan'208";a="533178941"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 27 Apr 2022 05:17:24 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1njgbk-0004eA-6G;
        Wed, 27 Apr 2022 12:17:24 +0000
Date:   Wed, 27 Apr 2022 20:16:33 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 69ab1e16d3823c05892371cd2c89e7852ac87067
Message-ID: <62693421.UvNLLmE1xMt6MgeX%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 69ab1e16d3823c05892371cd2c89e7852ac87067  dt-bindings: pinctrl: add binding for Ralink RT3883 pinctrl

elapsed time: 6547m

configs tested: 235
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                              allmodconfig
arm                                 defconfig
arm64                               defconfig
arm                              allyesconfig
arm64                            allyesconfig
i386                          randconfig-c001
mips                             allyesconfig
riscv                            allyesconfig
um                           x86_64_defconfig
riscv                            allmodconfig
um                             i386_defconfig
mips                             allmodconfig
powerpc                          allmodconfig
m68k                             allyesconfig
s390                             allmodconfig
s390                             allyesconfig
m68k                             allmodconfig
powerpc                          allyesconfig
i386                 randconfig-c001-20220425
arc                              allyesconfig
alpha                            allyesconfig
nios2                            allyesconfig
ia64                             alldefconfig
sh                           se7750_defconfig
sh                           sh2007_defconfig
i386                                defconfig
powerpc                       maple_defconfig
arc                        nsimosci_defconfig
h8300                       h8s-sim_defconfig
sh                     sh7710voipgw_defconfig
arc                      axs103_smp_defconfig
sh                        edosk7705_defconfig
sh                          r7785rp_defconfig
mips                  decstation_64_defconfig
powerpc                      tqm8xx_defconfig
arm                      jornada720_defconfig
sh                            migor_defconfig
arm                     eseries_pxa_defconfig
arc                     nsimosci_hs_defconfig
powerpc                    amigaone_defconfig
sh                        apsh4ad0a_defconfig
m68k                        mvme147_defconfig
arm                          exynos_defconfig
x86_64                           alldefconfig
sh                        edosk7760_defconfig
powerpc                      ppc40x_defconfig
arc                          axs103_defconfig
sparc                               defconfig
arm                       omap2plus_defconfig
arm                      integrator_defconfig
sparc64                          alldefconfig
arm                          lpd270_defconfig
mips                      maltasmvp_defconfig
powerpc                  iss476-smp_defconfig
xtensa                          iss_defconfig
powerpc                      arches_defconfig
powerpc                     rainier_defconfig
sh                               j2_defconfig
mips                    maltaup_xpa_defconfig
powerpc                    klondike_defconfig
arm                          badge4_defconfig
arm                            lart_defconfig
arm                            zeus_defconfig
sh                        sh7763rdp_defconfig
sh                         ap325rxa_defconfig
arm                       aspeed_g5_defconfig
sh                           se7780_defconfig
powerpc                     pq2fads_defconfig
arm                         s3c6400_defconfig
arm                           stm32_defconfig
xtensa                  nommu_kc705_defconfig
mips                  maltasmvp_eva_defconfig
h8300                            alldefconfig
arm                        cerfcube_defconfig
m68k                          multi_defconfig
powerpc                 mpc85xx_cds_defconfig
sh                          sdk7780_defconfig
arm                        trizeps4_defconfig
powerpc                         ps3_defconfig
arm                        spear6xx_defconfig
m68k                            q40_defconfig
ia64                      gensparse_defconfig
sh                          lboxre2_defconfig
powerpc                      cm5200_defconfig
h8300                    h8300h-sim_defconfig
m68k                        m5407c3_defconfig
riscv                               defconfig
arm                        realview_defconfig
mips                       capcella_defconfig
sh                   sh7724_generic_defconfig
sh                          r7780mp_defconfig
powerpc                      chrp32_defconfig
sh                         ecovec24_defconfig
sh                           se7722_defconfig
arm                            xcep_defconfig
sh                           se7619_defconfig
sparc                       sparc32_defconfig
arm                           u8500_defconfig
mips                           gcw0_defconfig
xtensa                    xip_kc705_defconfig
m68k                       m5475evb_defconfig
powerpc                   currituck_defconfig
powerpc                 canyonlands_defconfig
powerpc                       holly_defconfig
xtensa                  audio_kc705_defconfig
arm                            mps2_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220422
arm                  randconfig-c002-20220424
x86_64               randconfig-c001-20220425
arm                  randconfig-c002-20220425
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                                defconfig
nios2                               defconfig
csky                                defconfig
alpha                               defconfig
h8300                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                                defconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
powerpc                           allnoconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64               randconfig-a015-20220425
x86_64               randconfig-a014-20220425
x86_64               randconfig-a011-20220425
x86_64               randconfig-a013-20220425
x86_64               randconfig-a012-20220425
x86_64               randconfig-a016-20220425
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
i386                 randconfig-a014-20220425
i386                 randconfig-a012-20220425
i386                 randconfig-a011-20220425
i386                 randconfig-a015-20220425
i386                 randconfig-a013-20220425
i386                 randconfig-a016-20220425
arc                  randconfig-r043-20220425
s390                 randconfig-r044-20220425
riscv                randconfig-r042-20220425
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
x86_64                           allyesconfig
x86_64                          rhel-8.3-func
x86_64                                  kexec
x86_64                              defconfig
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit
x86_64                               rhel-8.3

clang tested configs:
riscv                randconfig-c006-20220424
mips                 randconfig-c004-20220424
x86_64                        randconfig-c007
i386                          randconfig-c001
arm                  randconfig-c002-20220424
powerpc              randconfig-c003-20220424
riscv                randconfig-c006-20220425
mips                 randconfig-c004-20220425
x86_64               randconfig-c007-20220425
arm                  randconfig-c002-20220425
i386                 randconfig-c001-20220425
powerpc              randconfig-c003-20220425
s390                 randconfig-c005-20220424
arm                     davinci_all_defconfig
powerpc                      acadia_defconfig
mips                           ip27_defconfig
powerpc                      walnut_defconfig
powerpc                     kilauea_defconfig
powerpc                 mpc8315_rdb_defconfig
powerpc                      ppc64e_defconfig
powerpc                      pmac32_defconfig
powerpc                  mpc885_ads_defconfig
powerpc                     ksi8560_defconfig
mips                      maltaaprp_defconfig
mips                       rbtx49xx_defconfig
riscv                            alldefconfig
arm                    vt8500_v6_v7_defconfig
arm64                            allyesconfig
arm                            dove_defconfig
arm                         hackkit_defconfig
hexagon                             defconfig
powerpc                    mvme5100_defconfig
arm                         mv78xx0_defconfig
powerpc                      ppc44x_defconfig
arm                              alldefconfig
arm                        spear3xx_defconfig
x86_64                           allyesconfig
powerpc               mpc834x_itxgp_defconfig
mips                   sb1250_swarm_defconfig
mips                          ath25_defconfig
powerpc                     tqm8540_defconfig
arm                         orion5x_defconfig
mips                     cu1830-neo_defconfig
hexagon                          alldefconfig
riscv                    nommu_virt_defconfig
powerpc                 mpc832x_rdb_defconfig
arm                         socfpga_defconfig
arm                       mainstone_defconfig
arm                          moxart_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
i386                 randconfig-a006-20220425
i386                 randconfig-a002-20220425
i386                 randconfig-a005-20220425
i386                 randconfig-a003-20220425
i386                 randconfig-a001-20220425
i386                 randconfig-a004-20220425
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64               randconfig-a002-20220425
x86_64               randconfig-a004-20220425
x86_64               randconfig-a003-20220425
x86_64               randconfig-a001-20220425
x86_64               randconfig-a005-20220425
x86_64               randconfig-a006-20220425
hexagon              randconfig-r041-20220422
riscv                randconfig-r042-20220422
hexagon              randconfig-r045-20220422
hexagon              randconfig-r041-20220424
riscv                randconfig-r042-20220424
hexagon              randconfig-r045-20220424

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
