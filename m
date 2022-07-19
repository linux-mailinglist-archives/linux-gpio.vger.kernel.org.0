Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 951AE5799FD
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Jul 2022 14:10:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238253AbiGSMKO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Jul 2022 08:10:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238591AbiGSMJL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Jul 2022 08:09:11 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C2D14A821
        for <linux-gpio@vger.kernel.org>; Tue, 19 Jul 2022 05:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658232136; x=1689768136;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=H47PnfvjSmAt50T89NID1gos1kx+lr1euEHeCFh3cnk=;
  b=CVUCpqzlNx9wON+jnotOXjwryr8bfP80Vtp79aqxgvcr5YuFSfSXMAVf
   GtBJIBVEUqIqhBdrgfyEmKomlyeqoWIRjYKg8E0zTfWXySCYhm8RUE/Qw
   079eS6l/fYAoUDtrPPlyZXf0vIH3Dhnr8ycDfS1YpUjDQYuBIXE5344z7
   O3iV7SJY9L9myOy7TY5tojFjPSj1FQtjZfSDWwmWJ01ags7OLKbWGjlAQ
   mFqqWCClCOxJa58OV0TDq/JFTCXh9voCfwlYfY5TX8rNyOsMJT0OospEm
   pNqNMwQxFpbDN0VdRitu3Xcs3s2SmwqC+U8f2aFBcvgnY7V6Eo9g23Hxm
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10412"; a="287622540"
X-IronPort-AV: E=Sophos;i="5.92,284,1650956400"; 
   d="scan'208";a="287622540"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2022 05:02:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,284,1650956400"; 
   d="scan'208";a="687090111"
Received: from lkp-server02.sh.intel.com (HELO ff137eb26ff1) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 19 Jul 2022 05:02:11 -0700
Received: from kbuild by ff137eb26ff1 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1oDlvW-0005cw-Oa;
        Tue, 19 Jul 2022 12:02:10 +0000
Date:   Tue, 19 Jul 2022 20:01:53 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:fixes] BUILD SUCCESS
 4546760619cfa9b718fe2059ceb07101cf9ff61e
Message-ID: <62d69d31.lXpPXOdjIBGLGeu8%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git fixes
branch HEAD: 4546760619cfa9b718fe2059ceb07101cf9ff61e  pinctrl: armada-37xx: use raw spinlocks for regmap to avoid invalid wait context

elapsed time: 727m

configs tested: 120
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-c001
i386                 randconfig-c001-20220718
powerpc                     tqm8541_defconfig
sh                          landisk_defconfig
sh                          r7785rp_defconfig
sh                            migor_defconfig
powerpc                      tqm8xx_defconfig
powerpc                  iss476-smp_defconfig
m68k                         amcore_defconfig
sh                           se7343_defconfig
sh                         microdev_defconfig
arm                          pxa910_defconfig
arm                        oxnas_v6_defconfig
arm                        mini2440_defconfig
sh                               alldefconfig
arm                          lpd270_defconfig
mips                       bmips_be_defconfig
sparc                             allnoconfig
um                               alldefconfig
arm                        mvebu_v7_defconfig
loongarch                 loongson3_defconfig
sh                        sh7785lcr_defconfig
sh                             sh03_defconfig
arm64                            alldefconfig
m68k                                defconfig
arc                        nsim_700_defconfig
s390                                defconfig
arm                             rpc_defconfig
xtensa                  nommu_kc705_defconfig
m68k                       m5208evb_defconfig
arm                       imx_v6_v7_defconfig
m68k                        mvme16x_defconfig
s390                             allmodconfig
arc                                 defconfig
alpha                               defconfig
s390                             allyesconfig
loongarch                           defconfig
loongarch                         allnoconfig
arm                  randconfig-c002-20220718
x86_64               randconfig-c001-20220718
ia64                             allmodconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
sh                               allmodconfig
mips                             allyesconfig
i386                             allyesconfig
i386                                defconfig
x86_64                        randconfig-a002
x86_64                        randconfig-a006
x86_64                        randconfig-a004
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
s390                 randconfig-r044-20220718
riscv                randconfig-r042-20220718
arc                  randconfig-r043-20220718
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
arm                      tct_hammer_defconfig
mips                          rm200_defconfig
arm                        mvebu_v5_defconfig
powerpc                        fsp2_defconfig
powerpc                     akebono_defconfig
powerpc                    socrates_defconfig
powerpc                   bluestone_defconfig
arm                        vexpress_defconfig
powerpc                      obs600_defconfig
powerpc                     ppa8548_defconfig
arm                          ixp4xx_defconfig
x86_64                        randconfig-k001
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                 randconfig-a004-20220718
i386                 randconfig-a001-20220718
i386                 randconfig-a005-20220718
i386                 randconfig-a006-20220718
i386                 randconfig-a002-20220718
i386                 randconfig-a003-20220718
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64               randconfig-a001-20220718
x86_64               randconfig-a005-20220718
x86_64               randconfig-a003-20220718
x86_64               randconfig-a002-20220718
x86_64               randconfig-a006-20220718
x86_64               randconfig-a004-20220718
hexagon              randconfig-r041-20220718
hexagon              randconfig-r045-20220718

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
