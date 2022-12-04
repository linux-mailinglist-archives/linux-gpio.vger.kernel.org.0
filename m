Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EA57641A94
	for <lists+linux-gpio@lfdr.de>; Sun,  4 Dec 2022 04:08:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229539AbiLDDIE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 3 Dec 2022 22:08:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229765AbiLDDID (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 3 Dec 2022 22:08:03 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0E0510FF7
        for <linux-gpio@vger.kernel.org>; Sat,  3 Dec 2022 19:08:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670123282; x=1701659282;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=NGjtdF6mnPMgflVIKMwTJJtxhgIssnfDfWH8G+9/fqw=;
  b=EEV81Ibc1i0wYDXfjUiEm7p/I0rmPj+zf2Asshc+Y7U7RBNK4tBrCprk
   skUOCvOa3w+RZ1M3oXkAkYMHs4ONTYydxfatQVcHiYYpZlVycS7C+NCgV
   p7bjNu7r6Vt0Xazu0PviSBfEYd0xstPRykb4tSoErYp8h1XdjGSw7nlwx
   YiztaJASzALeqPi6PdN7GtlBrqIdrNmuTW78s79vU8QnRxFYF+gWdcnMx
   g1WrNtrHWB3/jvcF9jiWIhYoiaLX2BgJRxaw6pvSVrbmuRunrfyMQt5vi
   khyGjkZdP7aHmK+6WKRWaQCpF4sfyV+DnnBg1dd064kPsb24QjO73qcxJ
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10550"; a="343142932"
X-IronPort-AV: E=Sophos;i="5.96,216,1665471600"; 
   d="scan'208";a="343142932"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2022 19:08:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10550"; a="645429489"
X-IronPort-AV: E=Sophos;i="5.96,216,1665471600"; 
   d="scan'208";a="645429489"
Received: from lkp-server01.sh.intel.com (HELO 4d912534d779) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 03 Dec 2022 19:08:00 -0800
Received: from kbuild by 4d912534d779 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1p1fMG-0000WR-0b;
        Sun, 04 Dec 2022 03:08:00 +0000
Date:   Sun, 04 Dec 2022 11:07:56 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD REGRESSION
 96010045bb9eb70dcb67937e4e6ac182bdb2b1be
Message-ID: <638c0f0c.6G9r4pzMUNYBT7D4%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 96010045bb9eb70dcb67937e4e6ac182bdb2b1be  gpio: loongson: enable irqdomain hierarchy config

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202212040126.HnyXYYfY-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202212040138.Fiez8jpV-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

drivers/gpio/gpio-loongson-64bit.c:263:15: error: no member named 'of_node' in 'struct gpio_chip'; did you mean 'fwnode'?
drivers/gpio/gpio-loongson-64bit.c:263:29: error: 'struct gpio_chip' has no member named 'of_node'; did you mean 'fwnode'?

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
`-- ia64-buildonly-randconfig-r005-20221203
    `-- drivers-gpio-gpio-loongson-64bit.c:error:struct-gpio_chip-has-no-member-named-of_node
clang_recent_errors
`-- hexagon-buildonly-randconfig-r002-20221203
    `-- drivers-gpio-gpio-loongson-64bit.c:error:no-member-named-of_node-in-struct-gpio_chip

elapsed time: 725m

configs tested: 60
configs skipped: 2

gcc tested configs:
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                               rhel-8.3
arc                  randconfig-r043-20221201
x86_64                              defconfig
m68k                             allyesconfig
x86_64                          rhel-8.3-func
m68k                             allmodconfig
riscv                randconfig-r042-20221201
arc                              allyesconfig
s390                 randconfig-r044-20221201
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
alpha                            allyesconfig
arc                                 defconfig
ia64                             allmodconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
powerpc                           allnoconfig
s390                             allyesconfig
sh                               allmodconfig
powerpc                          allmodconfig
mips                             allyesconfig
i386                             allyesconfig
i386                                defconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
x86_64                            allnoconfig
i386                          randconfig-c001
powerpc                         ps3_defconfig
parisc                           alldefconfig
s390                          debug_defconfig
powerpc                   currituck_defconfig
ia64                            zx1_defconfig

clang tested configs:
hexagon              randconfig-r045-20221201
hexagon              randconfig-r041-20221201
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
hexagon              randconfig-r041-20221204
riscv                randconfig-r042-20221204
hexagon              randconfig-r045-20221204
s390                 randconfig-r044-20221204

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
