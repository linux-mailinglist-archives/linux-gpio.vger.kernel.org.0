Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F410751EE00
	for <lists+linux-gpio@lfdr.de>; Sun,  8 May 2022 16:22:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233772AbiEHOZp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 8 May 2022 10:25:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233661AbiEHOZo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 8 May 2022 10:25:44 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6BD3E09E
        for <linux-gpio@vger.kernel.org>; Sun,  8 May 2022 07:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652019713; x=1683555713;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=75vISRgGcd6vr8M9QaNlmjwbVYGZruA7Onc8SISzHoY=;
  b=BIuXhg1kMABTXsXPpcT1/z58FhVDuCDPST3GRVaiaUerlMDF/bsRkXqq
   lGfrxOyKMFmr1CVTSXGee+JVlGQXk1UbMl4e4P8z95zzeCrfL+qABRo9I
   c5ZAVLVP2VsAcouzbfe0dyfxPtWd+yQBkBDRV/s8hYONMMrf8QVY6qA1q
   wInrjfs9TLliEuxdbOa7ZvIAbKTQtph2qhKoK/JZl+zabBU+8ti+71RmF
   c1hQ3ZLANCoJiN6URwll9AkofAevL3gaSjv9ojoO2FImB+Gyr4aMFkzbD
   DB/VOXOxyr/Oi2j1bftDJl21Qhp/dcxlMwUmmZJVBgt+KBmm0FpLAOwrn
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10341"; a="266436705"
X-IronPort-AV: E=Sophos;i="5.91,208,1647327600"; 
   d="scan'208";a="266436705"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2022 07:21:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,208,1647327600"; 
   d="scan'208";a="695938507"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 08 May 2022 07:21:51 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nnhnD-000FWp-0S;
        Sun, 08 May 2022 14:21:51 +0000
Date:   Sun, 08 May 2022 22:21:48 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:fixes] BUILD SUCCESS
 f680058f406863b55ac226d1c157701939c63db4
Message-ID: <6277d1fc.usqpRhvYTv+0a7Ow%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git fixes
branch HEAD: f680058f406863b55ac226d1c157701939c63db4  pinctrl: mediatek: mt8365: fix IES control pins

elapsed time: 9593m

configs tested: 306
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-c001
mips                             allyesconfig
riscv                            allmodconfig
mips                             allmodconfig
um                             i386_defconfig
um                           x86_64_defconfig
riscv                            allyesconfig
sparc                            allyesconfig
arc                              allyesconfig
alpha                            allyesconfig
nios2                            allyesconfig
mips                         tb0226_defconfig
powerpc                      cm5200_defconfig
powerpc                       holly_defconfig
powerpc                         ps3_defconfig
sh                            shmin_defconfig
mips                  maltasmvp_eva_defconfig
arc                     haps_hs_smp_defconfig
arc                            hsdk_defconfig
arm                         vf610m4_defconfig
xtensa                           allyesconfig
powerpc                     ep8248e_defconfig
s390                       zfcpdump_defconfig
arm                        realview_defconfig
arm                       multi_v4t_defconfig
xtensa                  nommu_kc705_defconfig
sparc64                          alldefconfig
mips                           jazz_defconfig
sh                            titan_defconfig
ia64                        generic_defconfig
parisc                              defconfig
sh                         microdev_defconfig
arc                           tb10x_defconfig
sh                          rsk7203_defconfig
powerpc                      pasemi_defconfig
mips                         mpc30x_defconfig
microblaze                          defconfig
m68k                        m5272c3_defconfig
mips                         bigsur_defconfig
arm                            pleb_defconfig
powerpc                   currituck_defconfig
openrisc                 simple_smp_defconfig
powerpc                     taishan_defconfig
m68k                           sun3_defconfig
powerpc                      pcm030_defconfig
parisc                           allyesconfig
powerpc                 mpc85xx_cds_defconfig
arm                         lubbock_defconfig
sh                           se7619_defconfig
mips                            gpr_defconfig
mips                       bmips_be_defconfig
arm                         nhk8815_defconfig
sh                        sh7763rdp_defconfig
h8300                    h8300h-sim_defconfig
arm                        oxnas_v6_defconfig
ia64                         bigsur_defconfig
powerpc                     asp8347_defconfig
m68k                          hp300_defconfig
ia64                          tiger_defconfig
m68k                          atari_defconfig
powerpc                           allnoconfig
powerpc                     tqm8555_defconfig
h8300                               defconfig
sh                          rsk7264_defconfig
sparc                            alldefconfig
arm                      integrator_defconfig
mips                         cobalt_defconfig
powerpc                      ep88xc_defconfig
arm                           imxrt_defconfig
arc                          axs103_defconfig
powerpc                    amigaone_defconfig
microblaze                      mmu_defconfig
sh                          polaris_defconfig
xtensa                    smp_lx200_defconfig
arm                          gemini_defconfig
sh                          kfr2r09_defconfig
riscv             nommu_k210_sdcard_defconfig
arc                     nsimosci_hs_defconfig
powerpc                mpc7448_hpc2_defconfig
xtensa                              defconfig
parisc                generic-64bit_defconfig
sh                          lboxre2_defconfig
sparc64                             defconfig
arm                           sunxi_defconfig
powerpc                       maple_defconfig
m68k                       m5249evb_defconfig
arc                 nsimosci_hs_smp_defconfig
mips                           ip32_defconfig
alpha                            alldefconfig
i386                                defconfig
sh                 kfr2r09-romimage_defconfig
sh                           se7721_defconfig
m68k                             alldefconfig
sh                          r7785rp_defconfig
powerpc                      ppc6xx_defconfig
mips                    maltaup_xpa_defconfig
powerpc                       ppc64_defconfig
sh                           sh2007_defconfig
arm                       omap2plus_defconfig
mips                  decstation_64_defconfig
mips                      fuloong2e_defconfig
nios2                         3c120_defconfig
m68k                        stmark2_defconfig
powerpc                 mpc834x_mds_defconfig
powerpc64                           defconfig
sh                        edosk7760_defconfig
s390                          debug_defconfig
sh                      rts7751r2d1_defconfig
arc                         haps_hs_defconfig
m68k                        mvme147_defconfig
sh                          rsk7201_defconfig
openrisc                  or1klitex_defconfig
powerpc                     sequoia_defconfig
mips                     decstation_defconfig
powerpc                         wii_defconfig
powerpc                 mpc8540_ads_defconfig
s390                             allyesconfig
sh                        apsh4ad0a_defconfig
powerpc                     mpc83xx_defconfig
mips                         rt305x_defconfig
arm                            mps2_defconfig
h8300                            alldefconfig
arm                            zeus_defconfig
mips                      maltasmvp_defconfig
m68k                         apollo_defconfig
parisc                generic-32bit_defconfig
powerpc                 canyonlands_defconfig
arm                         lpc18xx_defconfig
arm64                            alldefconfig
powerpc                 linkstation_defconfig
m68k                            mac_defconfig
sh                             espt_defconfig
openrisc                            defconfig
sh                          urquell_defconfig
arm                            lart_defconfig
arm                     eseries_pxa_defconfig
powerpc                    klondike_defconfig
m68k                            q40_defconfig
h8300                       h8s-sim_defconfig
sh                                  defconfig
arm                         at91_dt_defconfig
xtensa                  audio_kc705_defconfig
sh                   sh7770_generic_defconfig
sh                         ecovec24_defconfig
sh                   secureedge5410_defconfig
um                                  defconfig
arm                            qcom_defconfig
csky                                defconfig
sh                        sh7785lcr_defconfig
xtensa                         virt_defconfig
sh                               allmodconfig
sparc                       sparc64_defconfig
m68k                             allmodconfig
sh                           se7705_defconfig
arm                            hisi_defconfig
mips                       capcella_defconfig
arm                        keystone_defconfig
mips                        bcm47xx_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220501
arm                  randconfig-c002-20220505
x86_64               randconfig-c001-20220502
i386                 randconfig-c001-20220502
arm                  randconfig-c002-20220502
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allyesconfig
m68k                                defconfig
nios2                               defconfig
alpha                               defconfig
h8300                            allyesconfig
arc                                 defconfig
s390                                defconfig
s390                             allmodconfig
parisc64                            defconfig
sparc                               defconfig
i386                             allyesconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
powerpc                          allyesconfig
powerpc                          allmodconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
x86_64               randconfig-a006-20220502
x86_64               randconfig-a001-20220502
x86_64               randconfig-a003-20220502
x86_64               randconfig-a002-20220502
x86_64               randconfig-a004-20220502
x86_64               randconfig-a005-20220502
i386                 randconfig-a004-20220502
i386                 randconfig-a006-20220502
i386                 randconfig-a002-20220502
i386                 randconfig-a003-20220502
i386                 randconfig-a001-20220502
i386                 randconfig-a005-20220502
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arc                  randconfig-r043-20220501
arc                  randconfig-r043-20220502
s390                 randconfig-r044-20220501
riscv                randconfig-r042-20220501
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                               rhel-8.3

clang tested configs:
x86_64                        randconfig-c007
i386                          randconfig-c001
powerpc              randconfig-c003-20220501
riscv                randconfig-c006-20220501
mips                 randconfig-c004-20220501
arm                  randconfig-c002-20220501
s390                 randconfig-c005-20220501
powerpc              randconfig-c003-20220505
riscv                randconfig-c006-20220505
arm                  randconfig-c002-20220505
mips                     loongson2k_defconfig
arm                   milbeaut_m10v_defconfig
powerpc                    ge_imp3a_defconfig
arm                           spitz_defconfig
mips                      maltaaprp_defconfig
arm                     davinci_all_defconfig
mips                        omega2p_defconfig
mips                   sb1250_swarm_defconfig
arm                         palmz72_defconfig
arm                         socfpga_defconfig
mips                          malta_defconfig
powerpc                      pmac32_defconfig
arm                         lpc32xx_defconfig
powerpc                    socrates_defconfig
mips                     cu1830-neo_defconfig
riscv                    nommu_virt_defconfig
powerpc                  mpc866_ads_defconfig
mips                           mtx1_defconfig
arm                  colibri_pxa270_defconfig
powerpc                 mpc8315_rdb_defconfig
powerpc                      ppc44x_defconfig
powerpc                        fsp2_defconfig
powerpc                   microwatt_defconfig
mips                       lemote2f_defconfig
arm                         bcm2835_defconfig
arm                          ep93xx_defconfig
mips                      bmips_stb_defconfig
arm                       spear13xx_defconfig
arm                         shannon_defconfig
powerpc                     ksi8560_defconfig
powerpc               mpc834x_itxgp_defconfig
arm                            dove_defconfig
powerpc                      katmai_defconfig
powerpc                 mpc8560_ads_defconfig
powerpc                     tqm8540_defconfig
powerpc                 mpc8272_ads_defconfig
arm                           sama7_defconfig
riscv                          rv32_defconfig
mips                      pic32mzda_defconfig
powerpc                      ppc64e_defconfig
powerpc                   bluestone_defconfig
x86_64                           allyesconfig
powerpc                     powernv_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64               randconfig-a015-20220502
x86_64               randconfig-a012-20220502
x86_64               randconfig-a016-20220502
x86_64               randconfig-a014-20220502
x86_64               randconfig-a013-20220502
x86_64               randconfig-a011-20220502
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
i386                 randconfig-a011-20220502
i386                 randconfig-a013-20220502
i386                 randconfig-a016-20220502
i386                 randconfig-a015-20220502
i386                 randconfig-a014-20220502
i386                 randconfig-a012-20220502
hexagon              randconfig-r045-20220502
riscv                randconfig-r042-20220502
hexagon              randconfig-r041-20220502
hexagon              randconfig-r045-20220501
hexagon              randconfig-r041-20220501
hexagon              randconfig-r045-20220505
hexagon              randconfig-r041-20220505

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
