Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 857AA639AF4
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Nov 2022 14:20:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229685AbiK0NUj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 27 Nov 2022 08:20:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229595AbiK0NUh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 27 Nov 2022 08:20:37 -0500
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 469BAEE33
        for <linux-gpio@vger.kernel.org>; Sun, 27 Nov 2022 05:20:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669555236; x=1701091236;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=UZEIVqslMrT9KKH8dSs3NGRUL6HDc/bnupIGfD2cZuU=;
  b=bbqZJPK8JSd7Futp1QWL5//ZtyTDXXGXc6ebnd44p795kha5OwA/l2dg
   Qx/+X3h33XBe4Kl3CHqsMGYugTw7qwKUKcqvd6UXOT6i9IHo/2hRyft4u
   JBSKzhcDA+b6MkxnAJBymEzwUQiI7aI/qWWSHDT0jm3Q5pOmR3lK+Oi7v
   RNKXc//WW9aOlikxORC5DsHdLkX6QkV0X8yo5JY7padelHFbsmvCNSbCu
   cdpGJ16cdHuTGfbsmxCUs7PfN7wlLmtZ7vfBML9/k3XRpCNvcd6EZiH0M
   juoILyMNhV0iXIGy/1mKBEbdHvX1LrcAvR9hpB4sHsGRR7FJ7LhMc+w91
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10544"; a="378926486"
X-IronPort-AV: E=Sophos;i="5.96,198,1665471600"; 
   d="scan'208";a="378926486"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2022 05:20:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10544"; a="888117191"
X-IronPort-AV: E=Sophos;i="5.96,198,1665471600"; 
   d="scan'208";a="888117191"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 27 Nov 2022 05:20:34 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1ozHaD-000723-1W;
        Sun, 27 Nov 2022 13:20:33 +0000
Date:   Sun, 27 Nov 2022 21:20:01 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 6349c162b7dc69da82d508bccf68ef017893573e
Message-ID: <63836401.C/TtV74dx5ab6eQY%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 6349c162b7dc69da82d508bccf68ef017893573e  pinctrl: sunxi: d1: Add CAN bus pinmuxes

elapsed time: 856m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                          rhel-8.3-func
um                             i386_defconfig
x86_64                    rhel-8.3-kselftests
arc                                 defconfig
um                           x86_64_defconfig
s390                             allmodconfig
arc                  randconfig-r043-20221127
alpha                               defconfig
s390                                defconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
riscv                randconfig-r042-20221127
s390                 randconfig-r044-20221127
x86_64                        randconfig-a004
x86_64                              defconfig
s390                             allyesconfig
x86_64                        randconfig-a002
mips                             allyesconfig
powerpc                           allnoconfig
i386                          randconfig-a001
x86_64                               rhel-8.3
i386                          randconfig-a003
powerpc                          allmodconfig
x86_64                           rhel-8.3-kvm
m68k                             allmodconfig
i386                          randconfig-a005
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           allyesconfig
arc                              allyesconfig
sh                               allmodconfig
alpha                            allyesconfig
m68k                             allyesconfig
ia64                             allmodconfig
x86_64                        randconfig-a006
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
i386                                defconfig
i386                             allyesconfig
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig

clang tested configs:
hexagon              randconfig-r045-20221127
hexagon              randconfig-r041-20221127
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64                        randconfig-a005
i386                          randconfig-a002
i386                          randconfig-a004
x86_64                        randconfig-a001
i386                          randconfig-a006
x86_64                        randconfig-a003
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
