Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18B4A5A33DE
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Aug 2022 04:43:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232298AbiH0Cng (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 26 Aug 2022 22:43:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232279AbiH0Cng (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Aug 2022 22:43:36 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD72BE3991
        for <linux-gpio@vger.kernel.org>; Fri, 26 Aug 2022 19:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661568215; x=1693104215;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=i1/GyxPtGkuU+ez86aaNnKowfoClby6pRQd+lvrFTlQ=;
  b=HQkIQtmlf0rtoIS6HI4TaE7rgeYTm7oDDTOCjqv3ivabo/fv4kTtiZ+8
   owLE9OiYKLNB8dGRhkNq8HKJr+PNaYjNS3Fd8A7bhYDCSJcBDU8vawlFo
   XWXJLgwo5K84qXOc0y/W78koV1SiW9S3JvBeLiVm+42w/Ro7xvXKyDZ2e
   AKmvyTBnmXtr3PlYm4nCJRjHKceTuzGFl9EIWAZEF9wEcy9IcwvV65QQo
   yOdbl1k83lZC0PO3Tw8Sj784muRwkAzScLocwN8kEX57vBdB6xQ8cak+Z
   D2LKe2jIQbDxFES8LOd1T7tbEwWNvFFxCUPletZMCOPZNUsrvZMvsEtEJ
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10451"; a="274380411"
X-IronPort-AV: E=Sophos;i="5.93,267,1654585200"; 
   d="scan'208";a="274380411"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2022 19:43:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,267,1654585200"; 
   d="scan'208";a="753071980"
Received: from lkp-server01.sh.intel.com (HELO 71b0d3b5b1bc) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 26 Aug 2022 19:43:34 -0700
Received: from kbuild by 71b0d3b5b1bc with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oRlnK-0000tY-04;
        Sat, 27 Aug 2022 02:43:34 +0000
Date:   Sat, 27 Aug 2022 10:43:30 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 1ebfe7e36182a658819e4ded44d38d4033c8bbfb
Message-ID: <630984d2.x1xqOPqDP0dVjRaU%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 1ebfe7e36182a658819e4ded44d38d4033c8bbfb  pinctrl: nuvoton: Use 'unsigned int' instead of just 'unsigned'.

elapsed time: 722m

configs tested: 77
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
loongarch                         allnoconfig
x86_64                              defconfig
arc                                 defconfig
loongarch                           defconfig
x86_64                           allyesconfig
alpha                               defconfig
s390                                defconfig
powerpc                           allnoconfig
m68k                             allmodconfig
s390                             allmodconfig
x86_64                               rhel-8.3
arm                                 defconfig
s390                             allyesconfig
i386                                defconfig
i386                          randconfig-a001
i386                          randconfig-a003
arc                  randconfig-r043-20220823
i386                          randconfig-a005
sh                               allmodconfig
x86_64                        randconfig-a015
mips                             allyesconfig
alpha                            allyesconfig
i386                          randconfig-a014
arc                  randconfig-r043-20220825
x86_64                          rhel-8.3-func
powerpc                          allmodconfig
x86_64                        randconfig-a013
x86_64                         rhel-8.3-kunit
i386                          randconfig-a012
x86_64                        randconfig-a011
m68k                             allyesconfig
x86_64                           rhel-8.3-kvm
i386                          randconfig-a016
arc                              allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
i386                             allyesconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
arm64                            allyesconfig
arm                              allyesconfig
nios2                               defconfig
nios2                            allyesconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
powerpc                          allyesconfig
riscv                               defconfig
riscv                            allmodconfig
riscv                            allyesconfig
ia64                             allmodconfig

clang tested configs:
hexagon              randconfig-r041-20220825
i386                          randconfig-a013
hexagon              randconfig-r041-20220823
i386                          randconfig-a002
hexagon              randconfig-r045-20220825
i386                          randconfig-a015
i386                          randconfig-a006
s390                 randconfig-r044-20220823
riscv                randconfig-r042-20220825
i386                          randconfig-a004
s390                 randconfig-r044-20220825
riscv                randconfig-r042-20220823
x86_64                        randconfig-a014
i386                          randconfig-a011
hexagon              randconfig-r045-20220823
x86_64                        randconfig-a016
x86_64                        randconfig-a012
hexagon              randconfig-r045-20220827
riscv                randconfig-r042-20220827
hexagon              randconfig-r041-20220827
s390                 randconfig-r044-20220827
x86_64                        randconfig-a003
x86_64                        randconfig-a001

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
