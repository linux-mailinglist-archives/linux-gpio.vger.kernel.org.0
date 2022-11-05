Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACCA261A76A
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Nov 2022 04:56:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229472AbiKED4K (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Nov 2022 23:56:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbiKED4J (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Nov 2022 23:56:09 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C15631DE8
        for <linux-gpio@vger.kernel.org>; Fri,  4 Nov 2022 20:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667620568; x=1699156568;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=jkZVwFZ6wDI6tnYACyTYkeWefC+r+o9mSS6wCS95T7M=;
  b=JYi4BPUIC+eHEaAdsP2HYLjUa821HHN0tYtO1fJZpgFGWhORhocq7Y/P
   auBjGJbfeZr6p1ckCgJ1FM3PXWaRYLlVNorqNNXgq0okjXk8mMIWqrB14
   cwCO81C5ndf5hVonI5D8g/oC1VeG+QeIQ7T4SBYl0MW2CSs41wluzHPb9
   rn/F0phGXSn01mU9yzSQ3zjVUT/4MvHuozJdI3Dfeoy71Qtv7B5lIE2E8
   IqGplCwKU9AiR7xOmRuCoLodl7dRIX1vQjghZukfiwrBImr34wsl+BqFo
   H0GYs3FbOggooVBWwL8J+i0LocbMQSTZH0w2FLM3evSU5aMZF8SO34OEx
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10521"; a="308836347"
X-IronPort-AV: E=Sophos;i="5.96,139,1665471600"; 
   d="scan'208";a="308836347"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2022 20:56:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10521"; a="586397533"
X-IronPort-AV: E=Sophos;i="5.96,139,1665471600"; 
   d="scan'208";a="586397533"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 04 Nov 2022 20:56:05 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1orAHt-000HcW-0e;
        Sat, 05 Nov 2022 03:56:05 +0000
Date:   Sat, 05 Nov 2022 11:55:39 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 b8b80348c57b360019071e17380298619c5d8066
Message-ID: <6365debb.k7boT2D/4jg1JLC7%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: b8b80348c57b360019071e17380298619c5d8066  gpiolib: of: add polarity quirk for Freescale PCIe controller

elapsed time: 722m

configs tested: 70
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                               rhel-8.3
x86_64                              defconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
arc                                 defconfig
s390                             allmodconfig
powerpc                           allnoconfig
alpha                               defconfig
powerpc                          allmodconfig
i386                          randconfig-a001
x86_64                           rhel-8.3-syz
x86_64                        randconfig-a013
x86_64                        randconfig-a011
arc                  randconfig-r043-20221104
sh                               allmodconfig
x86_64                        randconfig-a015
i386                          randconfig-a003
riscv                randconfig-r042-20221104
s390                                defconfig
s390                 randconfig-r044-20221104
mips                             allyesconfig
x86_64                        randconfig-a002
i386                          randconfig-a005
x86_64                         rhel-8.3-kunit
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                           rhel-8.3-kvm
s390                             allyesconfig
i386                                defconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
arm                                 defconfig
arc                              allyesconfig
ia64                             allmodconfig
alpha                            allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
arm                              allyesconfig
arm64                            allyesconfig
i386                             allyesconfig
powerpc                     taishan_defconfig
powerpc                      ppc6xx_defconfig
mips                     loongson1b_defconfig
arm                           viper_defconfig
i386                          randconfig-c001
powerpc              randconfig-c003-20221104

clang tested configs:
i386                          randconfig-a013
i386                          randconfig-a015
i386                          randconfig-a011
hexagon              randconfig-r041-20221104
x86_64                        randconfig-a012
hexagon              randconfig-r045-20221104
x86_64                        randconfig-a014
i386                          randconfig-a002
x86_64                        randconfig-a016
x86_64                        randconfig-a005
x86_64                        randconfig-a001
i386                          randconfig-a006
x86_64                        randconfig-a003
i386                          randconfig-a004
mips                        bcm63xx_defconfig
powerpc                   bluestone_defconfig
mips                        omega2p_defconfig
powerpc                     akebono_defconfig
powerpc                     mpc512x_defconfig
x86_64                        randconfig-k001

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
