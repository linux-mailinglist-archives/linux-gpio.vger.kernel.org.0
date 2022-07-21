Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8807257C275
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Jul 2022 04:51:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230155AbiGUCvb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 Jul 2022 22:51:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229556AbiGUCvb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Jul 2022 22:51:31 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 813487538D
        for <linux-gpio@vger.kernel.org>; Wed, 20 Jul 2022 19:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658371890; x=1689907890;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=SlQtQ2D373idqcZiTcgSErKKDop60tLu5Uzoxbpju7c=;
  b=Cn+XYxgZLkj7m1Tn7bK56a+/LeEfhPJVY3zHX9291i0pD17ffSoiWPKw
   jpNo8nKMZ9l+UTRj6CqDdL5365nc6zkDQOoOShUJQl9Yr/g/pgIK+7bUL
   0ji0V2wRzYMo7flHLL+J6QZxv2tSZaBB3Hceil30DA/cFi0PQeZO0hjvf
   XCfUtehiZkwADjyB+SJ/FZ3zH7kCPRv93b7dBhdhNH5vzOi8FXPHaLyKo
   /iP9NdnwU6Un/0SV74xdkkF0vmm60FR2Oy+87V3REx1szBM5bzWBdoBnZ
   p74jtunhuxFacx3nWadnqKlIWxBKK4oklYwB1FQ7rLYMqMDL9SFIBKyXz
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10414"; a="286944030"
X-IronPort-AV: E=Sophos;i="5.92,288,1650956400"; 
   d="scan'208";a="286944030"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2022 19:51:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,288,1650956400"; 
   d="scan'208";a="625922771"
Received: from lkp-server01.sh.intel.com (HELO 7dfbdc7c7900) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 20 Jul 2022 19:51:29 -0700
Received: from kbuild by 7dfbdc7c7900 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1oEMHg-0001Mn-Ap;
        Thu, 21 Jul 2022 02:51:28 +0000
Date:   Thu, 21 Jul 2022 10:51:26 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 840ba17f74f376bf4542a9a818e019cd60a8517f
Message-ID: <62d8bf2e.usdgrV/mlAqwHVig%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 840ba17f74f376bf4542a9a818e019cd60a8517f  dt-bindings: pinctrl: mt8195: Use drive-strength-microamp in examples

elapsed time: 3058m

configs tested: 159
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                              allyesconfig
arm64                            allyesconfig
arm                                 defconfig
i386                          randconfig-c001
i386                 randconfig-c001-20220718
arm                          iop32x_defconfig
sh                      rts7751r2d1_defconfig
arm                         nhk8815_defconfig
xtensa                  audio_kc705_defconfig
powerpc                    adder875_defconfig
m68k                        m5272c3_defconfig
mips                         bigsur_defconfig
csky                              allnoconfig
um                             i386_defconfig
m68k                             alldefconfig
arc                     haps_hs_smp_defconfig
powerpc                     pq2fads_defconfig
sh                         microdev_defconfig
arc                     nsimosci_hs_defconfig
mips                           ci20_defconfig
arm                          lpd270_defconfig
sh                           se7206_defconfig
sh                             shx3_defconfig
sh                                  defconfig
powerpc                      ep88xc_defconfig
arm                      footbridge_defconfig
powerpc                        cell_defconfig
nios2                               defconfig
openrisc                 simple_smp_defconfig
arc                 nsimosci_hs_smp_defconfig
arm                          badge4_defconfig
sparc                             allnoconfig
arm                        mini2440_defconfig
arc                        nsimosci_defconfig
sparc                            allyesconfig
mips                  maltasmvp_eva_defconfig
x86_64                              defconfig
sh                        sh7757lcr_defconfig
sh                   secureedge5410_defconfig
m68k                        mvme147_defconfig
nios2                         10m50_defconfig
mips                           jazz_defconfig
xtensa                  cadence_csp_defconfig
sh                           se7343_defconfig
arm                         at91_dt_defconfig
xtensa                              defconfig
m68k                            mac_defconfig
arm                           viper_defconfig
arm                            lart_defconfig
arm                              allmodconfig
m68k                                defconfig
arm                           corgi_defconfig
powerpc                      pcm030_defconfig
alpha                            allyesconfig
m68k                            q40_defconfig
mips                  decstation_64_defconfig
loongarch                        alldefconfig
ia64                         bigsur_defconfig
arm                          exynos_defconfig
sparc                               defconfig
xtensa                           allyesconfig
csky                                defconfig
x86_64                                  kexec
s390                                defconfig
s390                             allmodconfig
arc                                 defconfig
alpha                               defconfig
s390                             allyesconfig
nios2                            allyesconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
loongarch                           defconfig
loongarch                         allnoconfig
arm                  randconfig-c002-20220718
x86_64               randconfig-c001-20220718
alpha                             allnoconfig
arc                               allnoconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
i386                             allyesconfig
i386                                defconfig
x86_64               randconfig-a014-20220718
x86_64               randconfig-a016-20220718
x86_64               randconfig-a012-20220718
x86_64               randconfig-a013-20220718
x86_64               randconfig-a015-20220718
x86_64               randconfig-a011-20220718
i386                 randconfig-a015-20220718
i386                 randconfig-a011-20220718
i386                 randconfig-a012-20220718
i386                 randconfig-a014-20220718
i386                 randconfig-a016-20220718
i386                 randconfig-a013-20220718
i386                          randconfig-a012
i386                          randconfig-a016
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
s390                 randconfig-r044-20220718
riscv                randconfig-r042-20220718
arc                  randconfig-r043-20220718
x86_64                    rhel-8.3-kselftests
x86_64                           allyesconfig
um                           x86_64_defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit

clang tested configs:
arm                      tct_hammer_defconfig
mips                           ip28_defconfig
powerpc                 mpc8315_rdb_defconfig
powerpc                 mpc832x_mds_defconfig
powerpc                    gamecube_defconfig
arm                     am200epdkit_defconfig
riscv                            alldefconfig
arm                        magician_defconfig
arm                          pxa168_defconfig
arm                          moxart_defconfig
powerpc                          allmodconfig
powerpc                 mpc832x_rdb_defconfig
arm                          pcm027_defconfig
mips                          ath25_defconfig
powerpc                      acadia_defconfig
mips                          malta_defconfig
mips                      maltaaprp_defconfig
mips                           rs90_defconfig
arm                           spitz_defconfig
x86_64                        randconfig-k001
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
i386                 randconfig-a001-20220718
i386                 randconfig-a006-20220718
i386                 randconfig-a002-20220718
i386                 randconfig-a004-20220718
i386                 randconfig-a005-20220718
i386                 randconfig-a003-20220718
x86_64               randconfig-a004-20220718
x86_64               randconfig-a003-20220718
x86_64               randconfig-a001-20220718
x86_64               randconfig-a002-20220718
x86_64               randconfig-a006-20220718
x86_64               randconfig-a005-20220718
hexagon              randconfig-r041-20220718
hexagon              randconfig-r045-20220718

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
