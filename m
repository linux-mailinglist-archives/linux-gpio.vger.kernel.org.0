Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9C2C50DD12
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Apr 2022 11:46:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235434AbiDYJsI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 Apr 2022 05:48:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236239AbiDYJra (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Apr 2022 05:47:30 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4743C344ED
        for <linux-gpio@vger.kernel.org>; Mon, 25 Apr 2022 02:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650879866; x=1682415866;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=hlqRJJ3OnukM44+KMZjid5VpkEE3prDEyO2a5ZnwN78=;
  b=bazzQuiVZQyclGY1tPemua4kUALzUVwMOrjvb+htKwheebjCk1edk9nH
   XYLBooyTUa5Syg+S1K9wb9XkaS85Tszuk0fVcbvtbMkpC6oSvAXvMGQo9
   6nlyZvU9kEDcwJFD/cMR4jMG0xaRU7Kpy5nv3hl5ihTYNiwlWt5WyDoTf
   VM3PMECmXCvN81nux8aKa+2wTGYSTUJBYQ3Gv6fxsgzBgmMtvbV0/QA+w
   +oIYT3ULJVWnhahxTzrchblAGBebLiAOASh/UmvOqpwDdlrHTo7LTmsHr
   5MuxppTI4DbD7SKhWI6tW1dYAMUgIH+AJujTHF/c70V+DLrrTAIhF27f5
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10327"; a="351646621"
X-IronPort-AV: E=Sophos;i="5.90,287,1643702400"; 
   d="scan'208";a="351646621"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2022 02:44:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,287,1643702400"; 
   d="scan'208";a="616443386"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 25 Apr 2022 02:44:13 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nivGO-0002Ih-Hl;
        Mon, 25 Apr 2022 09:44:12 +0000
Date:   Mon, 25 Apr 2022 17:43:20 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:fixes] BUILD SUCCESS
 0c9843a74a85224a89daa81fa66891dae2f930e1
Message-ID: <62666d38.t+cKvFIQ+6eFI+ZL%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git fixes
branch HEAD: 0c9843a74a85224a89daa81fa66891dae2f930e1  pinctrl: pistachio: fix use of irq_of_parse_and_map()

elapsed time: 1102m

configs tested: 197
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
i386                 randconfig-c001-20220425
sh                          r7785rp_defconfig
powerpc                     tqm8548_defconfig
powerpc                      pasemi_defconfig
mips                  maltasmvp_eva_defconfig
sh                   sh7724_generic_defconfig
sh                           se7751_defconfig
arc                         haps_hs_defconfig
mips                  decstation_64_defconfig
powerpc                      tqm8xx_defconfig
arm                      jornada720_defconfig
nios2                            allyesconfig
sh                            migor_defconfig
arc                      axs103_smp_defconfig
arm                     eseries_pxa_defconfig
sh                           sh2007_defconfig
um                             i386_defconfig
arc                     nsimosci_hs_defconfig
powerpc                    amigaone_defconfig
sh                        apsh4ad0a_defconfig
m68k                        mvme147_defconfig
arm                          exynos_defconfig
x86_64                           alldefconfig
arm                           u8500_defconfig
powerpc                  iss476-smp_defconfig
xtensa                          iss_defconfig
arm                       omap2plus_defconfig
ia64                             alldefconfig
powerpc                      arches_defconfig
powerpc                     rainier_defconfig
arm                            lart_defconfig
arm                            zeus_defconfig
arm                       aspeed_g5_defconfig
sh                           se7780_defconfig
powerpc                     pq2fads_defconfig
h8300                            alldefconfig
arm                        cerfcube_defconfig
m68k                          multi_defconfig
powerpc                 mpc85xx_cds_defconfig
sh                          sdk7780_defconfig
sh                         apsh4a3a_defconfig
sh                           se7206_defconfig
m68k                         amcore_defconfig
arm                           h5000_defconfig
mips                      loongson3_defconfig
arc                          axs101_defconfig
m68k                        m5407c3_defconfig
riscv                               defconfig
arm                        realview_defconfig
mips                       capcella_defconfig
sparc                       sparc32_defconfig
mips                           gcw0_defconfig
xtensa                    xip_kc705_defconfig
mips                    maltaup_xpa_defconfig
sh                             sh03_defconfig
m68k                       m5249evb_defconfig
sh                          polaris_defconfig
mips                          rb532_defconfig
openrisc                    or1ksim_defconfig
arm                             pxa_defconfig
mips                         bigsur_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                           se7343_defconfig
mips                 decstation_r4k_defconfig
arm                  randconfig-c002-20220424
x86_64                        randconfig-c001
x86_64               randconfig-c001-20220425
arm                  randconfig-c002-20220425
ia64                             allmodconfig
ia64                             allyesconfig
ia64                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                                defconfig
s390                             allmodconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                             allyesconfig
sparc                               defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64               randconfig-a015-20220425
x86_64               randconfig-a014-20220425
x86_64               randconfig-a011-20220425
x86_64               randconfig-a013-20220425
x86_64               randconfig-a012-20220425
x86_64               randconfig-a016-20220425
i386                 randconfig-a014-20220425
i386                 randconfig-a012-20220425
i386                 randconfig-a011-20220425
i386                 randconfig-a015-20220425
i386                 randconfig-a013-20220425
i386                 randconfig-a016-20220425
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
arc                  randconfig-r043-20220425
s390                 randconfig-r044-20220425
riscv                randconfig-r042-20220425
arc                  randconfig-r043-20220424
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                            allyesconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
x86_64                          rhel-8.3-func
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
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
powerpc                  mpc885_ads_defconfig
powerpc                     ksi8560_defconfig
mips                      maltaaprp_defconfig
arm                         hackkit_defconfig
mips                       rbtx49xx_defconfig
arm                              alldefconfig
arm                        spear3xx_defconfig
x86_64                           allyesconfig
powerpc               mpc834x_itxgp_defconfig
hexagon                          alldefconfig
mips                          ath25_defconfig
powerpc                 xes_mpc85xx_defconfig
arm                       aspeed_g4_defconfig
arm                       mainstone_defconfig
arm                          moxart_defconfig
powerpc                 mpc8315_rdb_defconfig
arm                          collie_defconfig
i386                 randconfig-a006-20220425
i386                 randconfig-a002-20220425
i386                 randconfig-a005-20220425
i386                 randconfig-a003-20220425
i386                 randconfig-a001-20220425
i386                 randconfig-a004-20220425
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64               randconfig-a002-20220425
x86_64               randconfig-a004-20220425
x86_64               randconfig-a003-20220425
x86_64               randconfig-a001-20220425
x86_64               randconfig-a005-20220425
x86_64               randconfig-a006-20220425
i386                          randconfig-a013
i386                          randconfig-a015
i386                          randconfig-a011
hexagon              randconfig-r041-20220424
hexagon              randconfig-r045-20220424
riscv                randconfig-r042-20220424
s390                 randconfig-r044-20220424

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
