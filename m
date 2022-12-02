Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DEFD6400FE
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Dec 2022 08:24:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232124AbiLBHYF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Dec 2022 02:24:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230094AbiLBHYE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Dec 2022 02:24:04 -0500
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F209DEE19
        for <linux-gpio@vger.kernel.org>; Thu,  1 Dec 2022 23:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669965843; x=1701501843;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=7Yzf+saqV+3+tuIonb+14s5HkopIj2e64Hbcf/xxuhE=;
  b=KKnLnhwnJM5/7378isBgkYLIyJ4oQ2tD+hKlMWIAKo3Ds0z5hL4rshcU
   Fqp7mEbSipB34W40uWJZFYtpvLEUH/WECZ62avLFZ21A6IrTdiXV7H7Hg
   lYmQsWjIwFCGXy6mg44Zk853+Tm03YxLoNhUdIUCgWI1K9flTRtvieRI6
   MS8WMwWtrPkTKa5z5aZiJDVLdskw0O7Bxt9Wc8lluG78mxKbaFCMH78gi
   j2ukv9AinkfqZXTikcuuCOwr0gThxxA8YlIa9JS9Kn1tIIszX0BMt85ax
   NKfkcFCKGL0ywakvqXcSTCdtU0i3r/6eyuEaDrxlfQ0zCVgUSSpWrWWT+
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="378044861"
X-IronPort-AV: E=Sophos;i="5.96,210,1665471600"; 
   d="scan'208";a="378044861"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2022 23:24:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="644935380"
X-IronPort-AV: E=Sophos;i="5.96,210,1665471600"; 
   d="scan'208";a="644935380"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 01 Dec 2022 23:24:02 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1p10Ov-000DNv-0m;
        Fri, 02 Dec 2022 07:24:01 +0000
Date:   Fri, 02 Dec 2022 15:23:52 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 98d8b93c617139aeaf745c1573c02d86830f25d1
Message-ID: <6389a808.01PSZmWYrnrCJR0S%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: 98d8b93c617139aeaf745c1573c02d86830f25d1  gpiolib: protect the GPIO device against being dropped while in use by user-space

elapsed time: 724m

configs tested: 57
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
alpha                               defconfig
s390                             allmodconfig
s390                                defconfig
s390                             allyesconfig
um                             i386_defconfig
um                           x86_64_defconfig
powerpc                           allnoconfig
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
m68k                             allmodconfig
m68k                             allyesconfig
arc                              allyesconfig
alpha                            allyesconfig
ia64                             allmodconfig
sh                               allmodconfig
arc                  randconfig-r043-20221201
s390                 randconfig-r044-20221201
riscv                randconfig-r042-20221201
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
powerpc                          allmodconfig
mips                             allyesconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                            allnoconfig
i386                             allyesconfig
i386                                defconfig
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
xtensa                           alldefconfig
microblaze                          defconfig
powerpc                      arches_defconfig
powerpc                      tqm8xx_defconfig

clang tested configs:
hexagon              randconfig-r045-20221201
hexagon              randconfig-r041-20221201
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
