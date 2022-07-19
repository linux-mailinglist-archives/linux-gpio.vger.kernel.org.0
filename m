Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1804C57A99E
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Jul 2022 00:05:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232113AbiGSWFj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Jul 2022 18:05:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229784AbiGSWFi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Jul 2022 18:05:38 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FDC33138A
        for <linux-gpio@vger.kernel.org>; Tue, 19 Jul 2022 15:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658268337; x=1689804337;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=yVI3XgtN4/cDc5Kep+y0STvh2o1L7Av08k++0eZ5fq0=;
  b=mdlmu8Q91EbqCkG7BBLPDsTocAem3cGMFpwCSJ0PQw53qAlNtWOexGD+
   05m2wcMSHeAteLxRkp+HNwnLvticS/V9df/zKeW5xshKYNBdC3aC3dACN
   do+yIi1e4vqktIDhwSgy7CqcAlHmkPj4CaZXTBxfXeFyfpfKw9w9wBirT
   qWWWZnuqIBhKJSGqzmu8wKKvVopD1AR6QMcT6ZUF+hgXWc1Pu5FApWcJQ
   2rzaDexi4BbEFdBVIEortWwoaUC7MtzUUojXSMn7mePhqyVWXyXrbf2AZ
   jL/Y0sGvEw92HTW2axucvSd0J2hL5tk4bH6t4CjO9lVnidcCaK6L3BqdV
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10413"; a="372920841"
X-IronPort-AV: E=Sophos;i="5.92,285,1650956400"; 
   d="scan'208";a="372920841"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2022 15:05:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,285,1650956400"; 
   d="scan'208";a="625379434"
Received: from lkp-server02.sh.intel.com (HELO ff137eb26ff1) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 19 Jul 2022 15:05:35 -0700
Received: from kbuild by ff137eb26ff1 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1oDvLT-00069K-8Y;
        Tue, 19 Jul 2022 22:05:35 +0000
Date:   Wed, 20 Jul 2022 06:05:20 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 c4371c56397340134c1827ab70dbf817dbb1b99b
Message-ID: <62d72aa0.Qtr3+POg7VZqNrrG%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: c4371c56397340134c1827ab70dbf817dbb1b99b  gpio: remove VR41XX related gpio driver

elapsed time: 726m

configs tested: 119
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
i386                 randconfig-c001-20220718
m68k                         amcore_defconfig
sh                           se7343_defconfig
sh                         microdev_defconfig
arm                          pxa910_defconfig
arm                        oxnas_v6_defconfig
powerpc                    sam440ep_defconfig
xtensa                    smp_lx200_defconfig
m68k                             alldefconfig
arc                     haps_hs_smp_defconfig
powerpc                     pq2fads_defconfig
arc                     nsimosci_hs_defconfig
mips                        bcm47xx_defconfig
powerpc                      ppc40x_defconfig
arm64                            alldefconfig
mips                            ar7_defconfig
sh                             sh03_defconfig
m68k                                defconfig
powerpc                     rainier_defconfig
arm                          lpd270_defconfig
arc                           tb10x_defconfig
arm                        keystone_defconfig
powerpc                     stx_gp3_defconfig
powerpc                      ppc6xx_defconfig
arm                        spear6xx_defconfig
arm                            qcom_defconfig
m68k                       m5208evb_defconfig
arm                       imx_v6_v7_defconfig
m68k                        mvme16x_defconfig
sh                        sh7757lcr_defconfig
x86_64                              defconfig
ia64                          tiger_defconfig
arc                    vdk_hs38_smp_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
loongarch                           defconfig
loongarch                         allnoconfig
ia64                             allmodconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
alpha                            allyesconfig
arc                              allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
i386                                defconfig
i386                             allyesconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64               randconfig-a013-20220718
x86_64               randconfig-a012-20220718
x86_64               randconfig-a016-20220718
x86_64               randconfig-a011-20220718
x86_64               randconfig-a015-20220718
x86_64               randconfig-a014-20220718
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
i386                 randconfig-a015-20220718
i386                 randconfig-a011-20220718
i386                 randconfig-a012-20220718
i386                 randconfig-a014-20220718
i386                 randconfig-a016-20220718
i386                 randconfig-a013-20220718
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arc                  randconfig-r043-20220718
s390                 randconfig-r044-20220718
riscv                randconfig-r042-20220718
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit

clang tested configs:
hexagon                          alldefconfig
mips                      bmips_stb_defconfig
mips                          ath79_defconfig
arm                         hackkit_defconfig
arm                        multi_v5_defconfig
x86_64                        randconfig-k001
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
i386                 randconfig-a004-20220718
i386                 randconfig-a001-20220718
i386                 randconfig-a005-20220718
i386                 randconfig-a006-20220718
i386                 randconfig-a002-20220718
i386                 randconfig-a003-20220718
x86_64               randconfig-a003-20220718
x86_64               randconfig-a001-20220718
x86_64               randconfig-a002-20220718
x86_64               randconfig-a004-20220718
x86_64               randconfig-a005-20220718
x86_64               randconfig-a006-20220718
hexagon              randconfig-r041-20220718
hexagon              randconfig-r045-20220718

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
