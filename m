Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1681462A3EE
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Nov 2022 22:21:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238748AbiKOVVZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Nov 2022 16:21:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232119AbiKOVVD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Nov 2022 16:21:03 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9729831DCD
        for <linux-gpio@vger.kernel.org>; Tue, 15 Nov 2022 13:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668547220; x=1700083220;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=P5FjMpTh5W7HLo3oMS/UjQ/k/hAjNz/gJzpGL+Lya4E=;
  b=cQ3YlY6ZnI9B4AZk7H6D754hEs8/BVUa3U845W06boWHoCGsuW3VOsuw
   0RJWmi11+8K4zVaVyGSyYnrxbCmMTN3YEsOn49W7oC8mTWrAPhMTgMzpy
   n4T2Mz+IPEGuM4DAFG8EJcyM0LjUSD8GyxwxZtPb2UpkjML7SIkdn7/oW
   +lRHjjwFmy3L0DvGn10QZmkVVlkDLrd5CYvsSk7jkQqfcx6Glt/r2AoSJ
   RuSYdvBVz53aJft4cr0c25h9CWOHAjwH2MrRfR879bWy+Lt1CLluHjRgN
   KmHzAbiIUmAnOEjxsqKLFSediXog49Hds4XsEhXUFoMfopKrbHdG+Op6D
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="398659271"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; 
   d="scan'208";a="398659271"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2022 13:20:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="884118468"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; 
   d="scan'208";a="884118468"
Received: from lkp-server01.sh.intel.com (HELO ebd99836cbe0) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 15 Nov 2022 13:20:19 -0800
Received: from kbuild by ebd99836cbe0 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1ov3Lu-0001fb-1s;
        Tue, 15 Nov 2022 21:20:18 +0000
Date:   Wed, 16 Nov 2022 05:19:54 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 8555c646407de9e924f438d7dd81cd67c4a19bfa
Message-ID: <6374027a.yjhj3J6+6sifjjFO%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 8555c646407de9e924f438d7dd81cd67c4a19bfa  Merge branch 'devel' into for-next

elapsed time: 720m

configs tested: 70
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
x86_64                               rhel-8.3
um                           x86_64_defconfig
arc                                 defconfig
x86_64                           rhel-8.3-kvm
x86_64                         rhel-8.3-kunit
alpha                               defconfig
i386                                defconfig
s390                                defconfig
x86_64                           rhel-8.3-syz
s390                             allmodconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
powerpc                           allnoconfig
s390                             allyesconfig
i386                             allyesconfig
x86_64               randconfig-a002-20221114
x86_64               randconfig-a001-20221114
x86_64               randconfig-a004-20221114
i386                 randconfig-a001-20221114
x86_64               randconfig-a003-20221114
i386                 randconfig-a004-20221114
x86_64               randconfig-a006-20221114
i386                 randconfig-a002-20221114
i386                 randconfig-a005-20221114
i386                 randconfig-a003-20221114
x86_64                           allyesconfig
i386                 randconfig-a006-20221114
arc                              allyesconfig
x86_64               randconfig-a005-20221114
alpha                            allyesconfig
ia64                             allmodconfig
m68k                             allyesconfig
m68k                             allmodconfig
sh                               allmodconfig
arc                  randconfig-r043-20221114
mips                             allyesconfig
powerpc                          allmodconfig
arm                                 defconfig
arm                              allyesconfig
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
arm64                            allyesconfig
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
x86_64                            allnoconfig

clang tested configs:
x86_64               randconfig-a014-20221114
x86_64               randconfig-a012-20221114
x86_64               randconfig-a016-20221114
x86_64               randconfig-a015-20221114
x86_64               randconfig-a013-20221114
x86_64               randconfig-a011-20221114
i386                 randconfig-a011-20221114
i386                 randconfig-a014-20221114
i386                 randconfig-a013-20221114
i386                 randconfig-a012-20221114
i386                 randconfig-a015-20221114
i386                 randconfig-a016-20221114
riscv                randconfig-r042-20221114
hexagon              randconfig-r041-20221114
hexagon              randconfig-r045-20221114
s390                 randconfig-r044-20221114
hexagon              randconfig-r041-20221115
hexagon              randconfig-r045-20221115
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
