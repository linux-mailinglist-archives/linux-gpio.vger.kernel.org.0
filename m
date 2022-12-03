Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93D46641427
	for <lists+linux-gpio@lfdr.de>; Sat,  3 Dec 2022 05:41:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229823AbiLCElq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Dec 2022 23:41:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231153AbiLCElo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Dec 2022 23:41:44 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB0E113F44
        for <linux-gpio@vger.kernel.org>; Fri,  2 Dec 2022 20:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670042503; x=1701578503;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=VZJ8C18naPP46L6iJQVZIKnY/iLosEFoDysjt1Xv7Hs=;
  b=S3MeUy+2BlOyZvWPU++/vf16PAQnw+WxmqKi5xI1JgaKNLX8r8JafJvj
   R8AU0Vv5GBEdrClbujJ0TVclghKcv8YeV2CMzqmBPT0PVbwLAG0THoyIm
   Bgme9x0SItR+aCOVctiWXCfLb661cOxehmMsp9slmTfOazSmIZbiC+kVf
   E2AIRVAOm4J1mZK7Ey2v8+PSpHjqKAjQ6GZrHZR44TTUDScDpiCHHad0Q
   VmYhJ1eD2Tr2gXBdPh5ko5v73hmsK8S02Gg+6ThGSFGvDaV5le9wtPoo+
   +rCmwZxdVhhdV/Vj4D0Cdm7LUkLOJarFV8gIPm85XInGcEOVL++GFjlMo
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10549"; a="313734035"
X-IronPort-AV: E=Sophos;i="5.96,214,1665471600"; 
   d="scan'208";a="313734035"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2022 20:41:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10549"; a="708706388"
X-IronPort-AV: E=Sophos;i="5.96,214,1665471600"; 
   d="scan'208";a="708706388"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 02 Dec 2022 20:41:39 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1p1KLK-000EHS-1V;
        Sat, 03 Dec 2022 04:41:38 +0000
Date:   Sat, 03 Dec 2022 12:41:09 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 c83bf778e98eda8e5dc2fd30904378eba828e057
Message-ID: <638ad365.6GjCpKKe0v64J1fo%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: c83bf778e98eda8e5dc2fd30904378eba828e057  dt-bindings: gpio: add loongson gpio

elapsed time: 724m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
powerpc                           allnoconfig
um                           x86_64_defconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
s390                                defconfig
x86_64                           rhel-8.3-kvm
sh                               allmodconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
s390                             allyesconfig
mips                             allyesconfig
powerpc                          allmodconfig
x86_64                              defconfig
ia64                             allmodconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
arc                  randconfig-r043-20221201
m68k                             allyesconfig
riscv                randconfig-r042-20221201
x86_64                        randconfig-a002
x86_64                               rhel-8.3
s390                 randconfig-r044-20221201
x86_64                        randconfig-a004
x86_64                        randconfig-a006
x86_64                           allyesconfig
i386                                defconfig
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
i386                             allyesconfig
arm                                 defconfig
arm                              allyesconfig
arm64                            allyesconfig

clang tested configs:
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
hexagon              randconfig-r041-20221201
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
hexagon              randconfig-r045-20221201
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
