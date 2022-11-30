Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E971663CE2E
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Nov 2022 05:02:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232726AbiK3ECZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Nov 2022 23:02:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232959AbiK3ECX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Nov 2022 23:02:23 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5732A6C70F
        for <linux-gpio@vger.kernel.org>; Tue, 29 Nov 2022 20:02:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669780942; x=1701316942;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=0GkJPpA5j+z8UOjspb1+dpmgedq7qng3h8jK+fbHoxQ=;
  b=JTre2zFJRnR0VDGPqEhO3yY+cSsyDhhnnUggsDITljyJQKMCl+awnkAv
   OJRxwZwNhiEZ0h+gVPeWP9UX8u2I5PqBjr66WSQC6XFJLDA9izMMbU90C
   c00lNFeM+ila25ux0ocRko+TvABcWobUK9yXnmqasEw0dwcdrjoZHcGy+
   +PjMqND2gSJW8YhcYk4z7w0RZozv4D46DFfX4Qv5DyNTdsCgRaFzCnAXe
   rFcaoloVEUQ+MQHvalmK4JASmA1WevXarasN5CuSaZsRCiMkQWPNk66lc
   svrR8r4Q2clEHiJYqplqS/q5XG0Mk9QPpt23J3ln32RYol7hTbp6ZAqgY
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10546"; a="315328564"
X-IronPort-AV: E=Sophos;i="5.96,205,1665471600"; 
   d="scan'208";a="315328564"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2022 20:02:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10546"; a="818479274"
X-IronPort-AV: E=Sophos;i="5.96,205,1665471600"; 
   d="scan'208";a="818479274"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 29 Nov 2022 20:02:20 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1p0EId-0009Ud-2P;
        Wed, 30 Nov 2022 04:02:19 +0000
Date:   Wed, 30 Nov 2022 12:01:24 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 c05e8b14f374c37313c435dd99859d556e9bce62
Message-ID: <6386d594.kzip0C+fo/FCz2hE%lkp@intel.com>
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
branch HEAD: c05e8b14f374c37313c435dd99859d556e9bce62  Merge branch 'devel' into for-next

elapsed time: 1848m

configs tested: 56
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
alpha                               defconfig
powerpc                          allmodconfig
mips                             allyesconfig
powerpc                           allnoconfig
s390                             allmodconfig
sh                               allmodconfig
s390                                defconfig
um                             i386_defconfig
m68k                             allmodconfig
um                           x86_64_defconfig
alpha                            allyesconfig
m68k                             allyesconfig
arc                              allyesconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
s390                             allyesconfig
arc                  randconfig-r043-20221128
x86_64                           rhel-8.3-syz
x86_64                           rhel-8.3-kvm
x86_64                         rhel-8.3-kunit
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
i386                 randconfig-a002-20221128
i386                 randconfig-a003-20221128
i386                 randconfig-a001-20221128
i386                 randconfig-a004-20221128
i386                 randconfig-a005-20221128
i386                 randconfig-a006-20221128
ia64                             allmodconfig
x86_64                        randconfig-a002
i386                                defconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a006
i386                             allyesconfig
arm                                 defconfig

clang tested configs:
hexagon              randconfig-r041-20221128
riscv                randconfig-r042-20221128
s390                 randconfig-r044-20221128
hexagon              randconfig-r045-20221128
x86_64               randconfig-a012-20221128
x86_64               randconfig-a014-20221128
x86_64               randconfig-a011-20221128
x86_64               randconfig-a013-20221128
x86_64               randconfig-a015-20221128
x86_64               randconfig-a016-20221128
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                 randconfig-a012-20221128
i386                 randconfig-a011-20221128
i386                 randconfig-a013-20221128
i386                 randconfig-a014-20221128
i386                 randconfig-a016-20221128
i386                 randconfig-a015-20221128

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
