Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50D5F6359E3
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Nov 2022 11:30:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236605AbiKWK3t (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Nov 2022 05:29:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236108AbiKWK3M (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Nov 2022 05:29:12 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B54851173FA
        for <linux-gpio@vger.kernel.org>; Wed, 23 Nov 2022 02:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669198275; x=1700734275;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=j4uLK3h4s4LsRmNUOxRzOGsNVJNLmLeKFxLprawQQjQ=;
  b=CPXzxWPa5y4PJgsYO+atu/5o9nCJ22qX1eTj0FdDzql/458lsIou6OfJ
   d4P3c9eLBydimJOdFeNRb7VDI7IBNn2Q4OD/HlLsLqROWx6Kp9jxQQRVX
   OkemkL00iBafU8624cYqcKm21GAD/W3e5vHhnec8lXg+RF/h3zhVDtIBq
   Iyg6eSyC1CMfYjGPQW8d52Wpgf34Hkcv4GF+pMkRpSKkMW49Uf/gkRIUa
   apG+KM2EPAeSlE/cBUXr6YQR/BtaBsnyZ4C0qrB0Doy/iLzW20Wx2YAyH
   92sg66DjZ75o6df1kOVYA5gNColReG65jtWn6IFqMCl+fvjaX64NUjJ1D
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="312731630"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; 
   d="scan'208";a="312731630"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2022 02:11:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="672823454"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; 
   d="scan'208";a="672823454"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 23 Nov 2022 02:11:09 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oxmij-0002cm-0c;
        Wed, 23 Nov 2022 10:11:09 +0000
Date:   Wed, 23 Nov 2022 18:10:52 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:fixes] BUILD SUCCESS
 11780e37565db4dd064d3243ca68f755c13f65b4
Message-ID: <637df1ac.ALkPi72BPv9KX2ci%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git fixes
branch HEAD: 11780e37565db4dd064d3243ca68f755c13f65b4  pinctrl: meditatek: Startup with the IRQs disabled

elapsed time: 817m

configs tested: 72
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
alpha                               defconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
s390                                defconfig
sh                               allmodconfig
s390                             allmodconfig
x86_64                           rhel-8.3-syz
x86_64                           rhel-8.3-kvm
x86_64                         rhel-8.3-kunit
x86_64                              defconfig
x86_64                           allyesconfig
s390                             allyesconfig
x86_64                               rhel-8.3
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
ia64                             allmodconfig
m68k                             allyesconfig
alpha                            allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
i386                                defconfig
arc                  randconfig-r043-20221121
i386                             allyesconfig
riscv                randconfig-r042-20221121
s390                 randconfig-r044-20221121
arm                          simpad_defconfig
powerpc                  iss476-smp_defconfig
sh                             espt_defconfig
arc                    vdk_hs38_smp_defconfig
x86_64                            allnoconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                 randconfig-a014-20221121
i386                 randconfig-a011-20221121
i386                 randconfig-a013-20221121
i386                 randconfig-a016-20221121
i386                 randconfig-a012-20221121
i386                 randconfig-a015-20221121
arc                  randconfig-r043-20221120
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig

clang tested configs:
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
x86_64               randconfig-a004-20221121
x86_64               randconfig-a001-20221121
x86_64               randconfig-a003-20221121
x86_64               randconfig-a002-20221121
x86_64               randconfig-a006-20221121
x86_64               randconfig-a005-20221121
hexagon              randconfig-r041-20221121
i386                 randconfig-a001-20221121
i386                 randconfig-a003-20221121
i386                 randconfig-a002-20221121
i386                 randconfig-a004-20221121
i386                 randconfig-a005-20221121
hexagon              randconfig-r045-20221121
i386                 randconfig-a006-20221121
powerpc                 mpc832x_rdb_defconfig
mips                     cu1000-neo_defconfig
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
