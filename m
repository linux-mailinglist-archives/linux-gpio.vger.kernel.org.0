Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D35551390E
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Apr 2022 17:53:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236090AbiD1P4c (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Apr 2022 11:56:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236071AbiD1P4b (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Apr 2022 11:56:31 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB199B82DD
        for <linux-gpio@vger.kernel.org>; Thu, 28 Apr 2022 08:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651161196; x=1682697196;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=6ZDoOdUe/tOoBuCf964GUpeBsJIptppxOwQ9UBSR3Es=;
  b=cmjFHhAA6bgPVTTGHAyBrb03IAgX4+ee6bKO73vNtw5DZClgBTw+Xl1T
   2SRMX8JY5GJruzFgaaHLDZTSrvxVXSWUU7GFlAS/E4bQkYGdPkv1aA6s+
   bKO+8fNzt2HpiGbGkWMnvV5pIB4AwkFfmBup+Onglp5Ni3g/CTyz65EW5
   OJCc0zqVzILNHzLpu/ZJrOjjyws+H2WnNE1tfS8jfBFkTbG/exlt09RF4
   9TuQ+YCXQPjiQw8/AskP1oggZsnCu0IMfsp1rJODSlpa3ZyQ+ZY+KpiOf
   5g+StsNsvTIq18cM/FhYxwsf+kdOicFXoPxX8P+sqNhMIqUFeIUkTTanw
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10331"; a="326825955"
X-IronPort-AV: E=Sophos;i="5.91,295,1647327600"; 
   d="scan'208";a="326825955"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2022 08:53:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,295,1647327600"; 
   d="scan'208";a="683015591"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 28 Apr 2022 08:53:15 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nk6SA-0005VD-8T;
        Thu, 28 Apr 2022 15:53:14 +0000
Date:   Thu, 28 Apr 2022 23:52:40 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 091304c65297c521e88a2529a84d4274785cffd1
Message-ID: <626ab848.GszUgVQ2OnaEbxAm%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 091304c65297c521e88a2529a84d4274785cffd1  Merge branch 'devel' into for-next

elapsed time: 5791m

configs tested: 187
configs skipped: 3

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
riscv                            allyesconfig
um                           x86_64_defconfig
riscv                            allmodconfig
um                             i386_defconfig
mips                             allmodconfig
powerpc                          allmodconfig
m68k                             allyesconfig
m68k                             allmodconfig
powerpc                          allyesconfig
s390                             allmodconfig
s390                             allyesconfig
i386                 randconfig-c001-20220425
arc                              allyesconfig
alpha                            allyesconfig
nios2                            allyesconfig
sh                   sh7724_generic_defconfig
sh                           se7751_defconfig
arc                         haps_hs_defconfig
mips                  maltasmvp_eva_defconfig
sh                          r7785rp_defconfig
mips                  decstation_64_defconfig
powerpc                      tqm8xx_defconfig
arm                      jornada720_defconfig
sh                            migor_defconfig
arc                      axs103_smp_defconfig
arm                     eseries_pxa_defconfig
sh                           sh2007_defconfig
arc                     nsimosci_hs_defconfig
powerpc                    amigaone_defconfig
sh                        apsh4ad0a_defconfig
m68k                        mvme147_defconfig
arm                          exynos_defconfig
x86_64                           alldefconfig
arm                       omap2plus_defconfig
arm                      integrator_defconfig
sparc64                          alldefconfig
arm                          lpd270_defconfig
mips                      maltasmvp_defconfig
powerpc                  iss476-smp_defconfig
xtensa                          iss_defconfig
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
m68k                           sun3_defconfig
m68k                        m5407c3_defconfig
sh                          lboxre2_defconfig
riscv                               defconfig
arm                        realview_defconfig
mips                       capcella_defconfig
sparc                       sparc32_defconfig
arm                           u8500_defconfig
mips                           gcw0_defconfig
xtensa                    xip_kc705_defconfig
mips                    maltaup_xpa_defconfig
sh                             sh03_defconfig
m68k                       m5249evb_defconfig
sh                          polaris_defconfig
mips                          rb532_defconfig
openrisc                    or1ksim_defconfig
arm                  randconfig-c002-20220424
x86_64                        randconfig-c001
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
sparc                               defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
powerpc                           allnoconfig
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
x86_64                        randconfig-a013
x86_64                        randconfig-a011
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
arc                  randconfig-r043-20220424
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
powerpc              randconfig-c003-20220425
i386                 randconfig-c001-20220425
arm                  randconfig-c002-20220425
mips                 randconfig-c004-20220425
x86_64               randconfig-c007-20220425
s390                 randconfig-c005-20220425
riscv                randconfig-c006-20220425
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
s390                             alldefconfig
arm                       mainstone_defconfig
arm                          moxart_defconfig
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
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
i386                          randconfig-a013
i386                          randconfig-a015
i386                          randconfig-a011
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
hexagon              randconfig-r041-20220424
riscv                randconfig-r042-20220424
hexagon              randconfig-r045-20220424
s390                 randconfig-r044-20220424

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
