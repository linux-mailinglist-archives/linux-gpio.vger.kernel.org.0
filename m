Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E42FC5B9243
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Sep 2022 03:43:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229910AbiIOBnN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Sep 2022 21:43:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229931AbiIOBnM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Sep 2022 21:43:12 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B71D8D3EE
        for <linux-gpio@vger.kernel.org>; Wed, 14 Sep 2022 18:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663206191; x=1694742191;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=lF6cWkuDT6tqNPxdIvfTFwfOjqbrsXMLZceNQk0Dmwo=;
  b=YWk+jCm0HsX623JFqFoQjsXs3KFOYjdOFsHt4WWzglpaIPiC/Lu8cIhS
   xrbfcTfsZs+zArQ/V6sKves24Fo47J/NYKF5Q3qz0BJwJS4VIN5UD5Gk4
   El1nEQ7cutYzwToQALx83+8ko4oG134PR3wRF2d91gP3dtIDJNpC/hVIT
   SCdv5zOcByUMJ8qDE+H2a1SGwUFsv27BDBHf4jBfuwLsEMqthWNHDorbp
   RSQ0+7r+dSZgl/6Y9l2ENqD6sIS17MDNg2dYwYmzihCBTwyiSrQD+sqhb
   bWd7c0EF6I4sOZz42Z6PolO4alX5uPfOAgepqsCkypwq0seDEvPrfg235
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10470"; a="299946043"
X-IronPort-AV: E=Sophos;i="5.93,316,1654585200"; 
   d="scan'208";a="299946043"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2022 18:43:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,316,1654585200"; 
   d="scan'208";a="706164174"
Received: from lkp-server01.sh.intel.com (HELO d6e6b7c4e5a2) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 14 Sep 2022 18:43:06 -0700
Received: from kbuild by d6e6b7c4e5a2 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oYduE-0000mN-0K;
        Thu, 15 Sep 2022 01:43:06 +0000
Date:   Thu, 15 Sep 2022 09:42:53 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 04fa696fc49cde70440858d87805882e5f0cbc2b
Message-ID: <6322831d.lg6BmrGwGVJLmquW%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 04fa696fc49cde70440858d87805882e5f0cbc2b  Merge branch 'devel' into for-next

elapsed time: 722m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
um                             i386_defconfig
alpha                               defconfig
um                           x86_64_defconfig
s390                                defconfig
s390                             allmodconfig
s390                             allyesconfig
x86_64                              defconfig
powerpc                          allmodconfig
i386                                defconfig
mips                             allyesconfig
powerpc                           allnoconfig
sh                               allmodconfig
m68k                             allmodconfig
arc                              allyesconfig
x86_64                        randconfig-a004
alpha                            allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                        randconfig-a002
arc                  randconfig-r043-20220914
m68k                             allyesconfig
x86_64                        randconfig-a013
x86_64                          rhel-8.3-func
x86_64                               rhel-8.3
x86_64                         rhel-8.3-kunit
arm                                 defconfig
x86_64                        randconfig-a011
x86_64                           rhel-8.3-kvm
x86_64                           allyesconfig
x86_64                           rhel-8.3-syz
i386                          randconfig-a001
i386                             allyesconfig
x86_64                        randconfig-a006
i386                          randconfig-a003
x86_64                        randconfig-a015
i386                          randconfig-a005
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
arm64                            allyesconfig
arm                              allyesconfig
ia64                             allmodconfig

clang tested configs:
hexagon              randconfig-r041-20220914
x86_64                        randconfig-a014
riscv                randconfig-r042-20220914
s390                 randconfig-r044-20220914
x86_64                        randconfig-a001
hexagon              randconfig-r045-20220914
x86_64                        randconfig-a016
x86_64                        randconfig-a012
i386                          randconfig-a013
i386                          randconfig-a002
x86_64                        randconfig-a003
i386                          randconfig-a015
i386                          randconfig-a006
i386                          randconfig-a004
i386                          randconfig-a011
x86_64                        randconfig-a005

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
