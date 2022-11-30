Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6E1563D77F
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Nov 2022 15:04:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229515AbiK3OEe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Nov 2022 09:04:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229746AbiK3OEU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Nov 2022 09:04:20 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E19E62ED63
        for <linux-gpio@vger.kernel.org>; Wed, 30 Nov 2022 06:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669817058; x=1701353058;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=2PgY5BkgK0WH8WLv5b9dVmohgMfVbOxR7Gtvlo38ZyM=;
  b=jBYHDQ3uf7DGpbJFSeQMqv77sBRh0WbPY/SoTEq2Bm6sPDIyd65r1wTY
   5oy7ndQMmuVfbCSRAPiWEnQyu8VpPUtW+Il10ullcvDAegtfKCMNO3lr2
   UKJF91gqQKV6HCBDyZor6Zfq1sy6WChpWyQbG2vkz+KdF+BuKCyuNcHrG
   +0xFhfqVQ9qgbuW3Tg1eI1Eo+QT3iwX05q7CDO3W7xFaTpDxQB29YoLpi
   GFYFTM75YdioAIRrYwkAlgWDUE6Q3SG27G+qxNVNc19ls1Ab4rlQSE97d
   q61Diwmdoy8+hvfwf9qtNFQLOya/U83rMWV4XRDV351Q7nMGdfG6PfGPS
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="295764828"
X-IronPort-AV: E=Sophos;i="5.96,206,1665471600"; 
   d="scan'208";a="295764828"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2022 06:04:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="638000651"
X-IronPort-AV: E=Sophos;i="5.96,206,1665471600"; 
   d="scan'208";a="638000651"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 30 Nov 2022 06:04:17 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1p0NhA-000BFU-1a;
        Wed, 30 Nov 2022 14:04:16 +0000
Date:   Wed, 30 Nov 2022 22:03:30 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 3b7c7478eda00945987d45f902bc3942c89243d3
Message-ID: <638762b2.4jVA7cvdI7Zi97A9%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 3b7c7478eda00945987d45f902bc3942c89243d3  gpiolib: Provide to_gpio_device() helper

elapsed time: 743m

configs tested: 47
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
s390                             allyesconfig
powerpc                           allnoconfig
um                           x86_64_defconfig
um                             i386_defconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
x86_64                               rhel-8.3
x86_64                           rhel-8.3-syz
x86_64                           rhel-8.3-kvm
x86_64                         rhel-8.3-kunit
x86_64                              defconfig
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
x86_64                           allyesconfig
arc                  randconfig-r043-20221128
sh                               allmodconfig
mips                             allyesconfig
powerpc                          allmodconfig
i386                                defconfig
ia64                             allmodconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
i386                             allyesconfig
x86_64                            allnoconfig
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig

clang tested configs:
hexagon              randconfig-r045-20221128
hexagon              randconfig-r041-20221128
riscv                randconfig-r042-20221128
s390                 randconfig-r044-20221128
x86_64               randconfig-a013-20221128
x86_64               randconfig-a012-20221128
x86_64               randconfig-a014-20221128
x86_64               randconfig-a011-20221128
x86_64               randconfig-a016-20221128
x86_64               randconfig-a015-20221128
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
