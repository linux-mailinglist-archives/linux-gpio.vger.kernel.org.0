Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7633664D192
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Dec 2022 22:03:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229480AbiLNVDa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Dec 2022 16:03:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbiLNVD3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Dec 2022 16:03:29 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3598E2C12B
        for <linux-gpio@vger.kernel.org>; Wed, 14 Dec 2022 13:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671051808; x=1702587808;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=DW1PrX6AYggd58gDhhcVAeYDJrh3Z6j1su6Mzdj8+F0=;
  b=OQEzRt9xwJwsnRwT8VZCFwOaUVJcWaHvVVDcrE5/dcy+yZRBPHOMp9/c
   cuESlW4JJctozkJeLaiaQPQRVaQLxiaNULIvFHF5/mCMGT73vMw90dlwg
   RjdwtBJtJmC24kjvK6eu8oGoqotl65ZMeSg1d5AFMSDdvhMbN5qXTqwSK
   hCZh+1TX43Vw/0WSjGtrgelsQeJcRa5s7ECsrvzv0JBMQzEKK55WbLvNM
   0SdRtPLJqVoOibCNXFziRWsmizquIAmVQwMRGLV5kI2lUHCRrTnn2MBV5
   aOW4Re73iE6KATgBzZq1hO7tPXIk2h1As7mZ9Gqslic5BRuJvn9SapGcy
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10561"; a="298187347"
X-IronPort-AV: E=Sophos;i="5.96,245,1665471600"; 
   d="scan'208";a="298187347"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2022 13:03:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10561"; a="651257241"
X-IronPort-AV: E=Sophos;i="5.96,245,1665471600"; 
   d="scan'208";a="651257241"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 14 Dec 2022 13:03:26 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1p5YuU-0005nb-0t;
        Wed, 14 Dec 2022 21:03:26 +0000
Date:   Thu, 15 Dec 2022 05:02:51 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 11e47bbd700f31bd1ee9f8863381bc9e741c0e97
Message-ID: <639a39fb.NyFyjIoOPcK+oyvc%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 11e47bbd700f31bd1ee9f8863381bc9e741c0e97  gpio: sim: set a limit on the number of GPIOs

elapsed time: 723m

configs tested: 61
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                           rhel-8.3-bpf
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                        randconfig-a002
x86_64                        randconfig-a004
x86_64                        randconfig-a006
arc                                 defconfig
s390                             allmodconfig
x86_64                        randconfig-a011
alpha                               defconfig
arc                  randconfig-r043-20221213
m68k                             allyesconfig
x86_64                          rhel-8.3-rust
powerpc                           allnoconfig
x86_64                        randconfig-a015
x86_64                    rhel-8.3-kselftests
arm                  randconfig-r046-20221213
x86_64                          rhel-8.3-func
m68k                             allmodconfig
arc                              allyesconfig
x86_64                        randconfig-a013
ia64                             allmodconfig
s390                                defconfig
alpha                            allyesconfig
s390                             allyesconfig
i386                                defconfig
arm                                 defconfig
i386                          randconfig-a001
mips                             allyesconfig
i386                          randconfig-a003
x86_64                               rhel-8.3
powerpc                          allmodconfig
sh                               allmodconfig
i386                          randconfig-a014
i386                          randconfig-a005
x86_64                              defconfig
i386                          randconfig-a012
i386                          randconfig-a016
arm                              allyesconfig
arm64                            allyesconfig
i386                             allyesconfig
x86_64                           allyesconfig

clang tested configs:
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
hexagon              randconfig-r041-20221213
x86_64                        randconfig-a012
hexagon              randconfig-r045-20221213
x86_64                        randconfig-a014
riscv                randconfig-r042-20221213
s390                 randconfig-r044-20221213
x86_64                        randconfig-a016
i386                          randconfig-a002
i386                          randconfig-a013
i386                          randconfig-a004
i386                          randconfig-a011
i386                          randconfig-a006
i386                          randconfig-a015

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
