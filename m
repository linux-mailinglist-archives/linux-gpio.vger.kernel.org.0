Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 039AD60C21D
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Oct 2022 05:12:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229707AbiJYDME (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Oct 2022 23:12:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229918AbiJYDMA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Oct 2022 23:12:00 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1B454361C
        for <linux-gpio@vger.kernel.org>; Mon, 24 Oct 2022 20:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666667519; x=1698203519;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=l7nEpYjR7pb+wj9PnBDJRjN2aQkM6JWdH1aATL8MKNw=;
  b=OdxzJC/Pg4ayb5Nayx/jw5knNHOWw70xY2CIcfLGo2VCih8Ra58uemNq
   Vor/LUUw8zbLB+jYkGc39ljbaGBKQVQOnGJb+LFk/INGqYw2raecSBIGJ
   L3j9SINGhbDfrwKZ90PqTq+ECp3muawNByTTZRfuxTg8yQJ7C8Ne63S6O
   Gg/92Myw/urxtE4JmyLu1FvMOTOFZKnudzyfjDAua1KyOHw74OHg6EtuL
   GSJrSXlzSTDq1DqAq6k4LM528qnsqM1JNOXuskrRBbzeexOyXwkadTlw1
   R++vWL9acopdvSqJz1TsEer6/n2RHMTMXnDSvUZOvJyCuf0/1Klf93F9B
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="308669374"
X-IronPort-AV: E=Sophos;i="5.95,210,1661842800"; 
   d="scan'208";a="308669374"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2022 20:11:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="720701763"
X-IronPort-AV: E=Sophos;i="5.95,210,1661842800"; 
   d="scan'208";a="720701763"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 24 Oct 2022 20:11:58 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1onAM9-0005rm-1H;
        Tue, 25 Oct 2022 03:11:57 +0000
Date:   Tue, 25 Oct 2022 11:11:36 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-gpio:gpio-descriptors-extcon-cleanup] BUILD SUCCESS
 bf7e76ba6926f3983209de5827d49fb7005ec4c9
Message-ID: <635753e8.RAyHEtK2RbxCzDoa%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git gpio-descriptors-extcon-cleanup
branch HEAD: bf7e76ba6926f3983209de5827d49fb7005ec4c9  extcon: gpio: Always check state on resume

elapsed time: 729m

configs tested: 124
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                               allnoconfig
alpha                             allnoconfig
riscv                             allnoconfig
csky                              allnoconfig
um                             i386_defconfig
um                           x86_64_defconfig
s390                             allyesconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
powerpc                           allnoconfig
i386                                defconfig
i386                             allyesconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
x86_64                               rhel-8.3
m68k                             allmodconfig
arc                              allyesconfig
arc                  randconfig-r043-20221024
alpha                            allyesconfig
riscv                randconfig-r042-20221024
sh                               allmodconfig
arc                  randconfig-r043-20221023
m68k                             allyesconfig
s390                 randconfig-r044-20221024
x86_64               randconfig-k001-20221024
mips                             allyesconfig
powerpc                          allmodconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
ia64                             allmodconfig
i386                          randconfig-c001
x86_64               randconfig-a014-20221024
x86_64               randconfig-a015-20221024
x86_64               randconfig-a016-20221024
x86_64               randconfig-a013-20221024
x86_64               randconfig-a012-20221024
x86_64               randconfig-a011-20221024
i386                 randconfig-a011-20221024
i386                 randconfig-a014-20221024
i386                 randconfig-a015-20221024
i386                 randconfig-a016-20221024
i386                 randconfig-a012-20221024
i386                 randconfig-a013-20221024
powerpc                   motionpro_defconfig
csky                             alldefconfig
powerpc                 mpc837x_rdb_defconfig
openrisc                            defconfig
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
arm                       omap2plus_defconfig
powerpc                 mpc85xx_cds_defconfig
arm                        spear6xx_defconfig
powerpc                      tqm8xx_defconfig
powerpc                 mpc834x_mds_defconfig
mips                            gpr_defconfig
m68k                            q40_defconfig
m68k                        m5307c3_defconfig
powerpc                      cm5200_defconfig
sh                        sh7763rdp_defconfig
ia64                             allyesconfig
sh                             shx3_defconfig
arc                      axs103_smp_defconfig
mips                        vocore2_defconfig
sh                         ap325rxa_defconfig
ia64                      gensparse_defconfig
arm                          pxa910_defconfig
i386                 randconfig-c001-20221024
parisc                generic-64bit_defconfig
sh                           se7712_defconfig
arc                              alldefconfig
sh                        dreamcast_defconfig
sh                          polaris_defconfig
riscv                    nommu_k210_defconfig
xtensa                    xip_kc705_defconfig
arm                        mini2440_defconfig
powerpc                      chrp32_defconfig
sh                          lboxre2_defconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
m68k                       m5249evb_defconfig
arm                       aspeed_g5_defconfig
powerpc                  storcenter_defconfig
powerpc                 canyonlands_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
sparc                               defconfig
xtensa                           allyesconfig
csky                                defconfig
sparc                            allyesconfig
x86_64                                  kexec
powerpc                     tqm8555_defconfig

clang tested configs:
hexagon              randconfig-r045-20221023
hexagon              randconfig-r041-20221024
riscv                randconfig-r042-20221023
hexagon              randconfig-r045-20221024
s390                 randconfig-r044-20221023
hexagon              randconfig-r041-20221023
i386                 randconfig-a004-20221024
i386                 randconfig-a006-20221024
i386                 randconfig-a002-20221024
i386                 randconfig-a003-20221024
i386                 randconfig-a001-20221024
i386                 randconfig-a005-20221024
x86_64               randconfig-a005-20221024
x86_64               randconfig-a002-20221024
x86_64               randconfig-a006-20221024
x86_64               randconfig-a001-20221024
x86_64               randconfig-a004-20221024
x86_64               randconfig-a003-20221024
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
mips                     loongson2k_defconfig
arm                          moxart_defconfig
arm                         s3c2410_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
