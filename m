Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F13B63912B
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Nov 2022 22:40:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230053AbiKYVkp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Nov 2022 16:40:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229806AbiKYVko (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Nov 2022 16:40:44 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7C1557B56
        for <linux-gpio@vger.kernel.org>; Fri, 25 Nov 2022 13:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669412443; x=1700948443;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=atuZ5imtxhJSKOevUZ7LXDHtgbW8YPtXbKYHIQUAZUo=;
  b=QXXaF3sneJ9Rpl2gEpSz3iNDUsGW3jDUGVABgjopakeaaag3DphJi6i/
   pTwGZ3zZLV8ETmhZJmBeM51IAavUck5o4aawphxjxLDjXgkNAjTegGdRi
   JhXkJHX9C8U3InGPq+dSAaz5WdQ1D6K4lkEi3dpnzN9HxGWayAq4lyQlH
   vieN0aptzf94/PmZJ6HUOZZHjfpvX7emaiAUJJRFTY0Gkz7jKWaysx7ey
   7NAeMwpNC6SkiJ/8KwyejsE0fho4gf9YFFPVLCVDi19gmCfoX2aCzFtu8
   GzPBQ4fZPdn6VqRDIza57zxSpQN0XDrDL3zjaTEQtxpT76fYTJ/+MSjft
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10542"; a="302114176"
X-IronPort-AV: E=Sophos;i="5.96,194,1665471600"; 
   d="scan'208";a="302114176"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2022 13:40:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10542"; a="817235331"
X-IronPort-AV: E=Sophos;i="5.96,194,1665471600"; 
   d="scan'208";a="817235331"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 25 Nov 2022 13:40:42 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oygR7-0005XE-1R;
        Fri, 25 Nov 2022 21:40:41 +0000
Date:   Sat, 26 Nov 2022 05:40:17 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 7963ba02b2d1de681ba1ee33060db42eb4cf4c07
Message-ID: <63813641.5AD08B7Mgbou4uHH%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 7963ba02b2d1de681ba1ee33060db42eb4cf4c07  gpio: pcf857x: Convert to i2c's .probe_new()

elapsed time: 2166m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
arc                  randconfig-r043-20221124
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
s390                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allyesconfig
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
sh                               allmodconfig
x86_64                        randconfig-a002
i386                          randconfig-a001
x86_64                        randconfig-a004
x86_64                        randconfig-a006
i386                          randconfig-a003
powerpc                           allnoconfig
i386                          randconfig-a005
mips                             allyesconfig
powerpc                          allmodconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
i386                                defconfig
i386                             allyesconfig
x86_64                            allnoconfig
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig

clang tested configs:
riscv                randconfig-r042-20221124
hexagon              randconfig-r041-20221124
hexagon              randconfig-r045-20221124
s390                 randconfig-r044-20221124
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
x86_64                        randconfig-a012
x86_64                        randconfig-a016
x86_64                        randconfig-a014
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a002
x86_64                        randconfig-a005
i386                          randconfig-a004
i386                          randconfig-a006

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
