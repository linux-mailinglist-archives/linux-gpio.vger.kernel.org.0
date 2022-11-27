Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D19BE639AF5
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Nov 2022 14:20:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229595AbiK0NUj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 27 Nov 2022 08:20:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229631AbiK0NUi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 27 Nov 2022 08:20:38 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FD03EE30
        for <linux-gpio@vger.kernel.org>; Sun, 27 Nov 2022 05:20:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669555236; x=1701091236;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Kf+CgvxRKHPTdFrM+PyldxLiUu9O8TF5nI6nkOLjvIc=;
  b=BgUOynhxi0L6pt9IANNvpAzEbmxThClbj7BvUoz6b9zRiny9aEDkPnbI
   d2YhEj0S3LChX8F1LaCWofmOdRzz7ndqcU0tUqSH6jiseoxSErn1w5Xo+
   vJHM/u7JCooFGdO0Crv6PKf/v0sCQrZabVYSwZrYpZBRSlCB1jLjl5/Sk
   QOBfsXoQbIDr838xZU8+q9XT77uxmmqeBJCJp2bcOzK72lbWi7mpxFiOx
   WQAXfduVvzXiJ9dY5A3axpE1oA2u0py6xGpiWi5Yk+udHt/j4FTUuJ2Rv
   gHwUvQqH/ow+m46ymCH52/3A1MTcdaOzHi1ZjX97H4AwsTApiP24spRUF
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10544"; a="314706538"
X-IronPort-AV: E=Sophos;i="5.96,198,1665471600"; 
   d="scan'208";a="314706538"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2022 05:20:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10544"; a="817547897"
X-IronPort-AV: E=Sophos;i="5.96,198,1665471600"; 
   d="scan'208";a="817547897"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 27 Nov 2022 05:20:34 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1ozHaD-000725-1b;
        Sun, 27 Nov 2022 13:20:33 +0000
Date:   Sun, 27 Nov 2022 21:19:59 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 94c590928e100cebb0a3cd7ddf7b566dbca311f5
Message-ID: <638363ff.GVa8iWIceKmkQzji%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 94c590928e100cebb0a3cd7ddf7b566dbca311f5  Merge branch 'devel' into for-next

elapsed time: 855m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
um                             i386_defconfig
s390                                defconfig
um                           x86_64_defconfig
arc                  randconfig-r043-20221127
riscv                randconfig-r042-20221127
x86_64                              defconfig
s390                             allyesconfig
s390                 randconfig-r044-20221127
x86_64                        randconfig-a013
x86_64                          rhel-8.3-func
arc                              allyesconfig
x86_64                           rhel-8.3-syz
x86_64                    rhel-8.3-kselftests
alpha                            allyesconfig
ia64                             allmodconfig
x86_64                        randconfig-a002
m68k                             allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                               rhel-8.3
x86_64                        randconfig-a006
x86_64                           allyesconfig
x86_64                        randconfig-a011
i386                          randconfig-a001
x86_64                        randconfig-a004
x86_64                           rhel-8.3-kvm
i386                          randconfig-a003
m68k                             allmodconfig
x86_64                        randconfig-a015
i386                          randconfig-a005
sh                               allmodconfig
mips                             allyesconfig
powerpc                          allmodconfig
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
i386                                defconfig
i386                             allyesconfig
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig

clang tested configs:
hexagon              randconfig-r045-20221127
hexagon              randconfig-r041-20221127
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a002
x86_64                        randconfig-a016
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
i386                          randconfig-a006
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
