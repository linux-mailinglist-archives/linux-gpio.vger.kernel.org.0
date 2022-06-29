Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D19455F42C
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Jun 2022 05:35:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229637AbiF2Dfu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Jun 2022 23:35:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbiF2Dft (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Jun 2022 23:35:49 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5C4B17AA3
        for <linux-gpio@vger.kernel.org>; Tue, 28 Jun 2022 20:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656473747; x=1688009747;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=z26Kc2YJ7El3YIERZfl5O1CnPyqzqA2XHZBn+lwvms4=;
  b=HMikq3tmeL0MdzcZma58n69/cc876Wc50uyDwqJcLH1J3Z3JdgIx2dxs
   mBz4hq1F0UGLwqCodDzzEiyDfH+NdSlHfBBf6wfe6wx8sUAitdbceKNVh
   H9dSe8U7R7P3UEHMd2YBFDp4osYrsGBei71mVAxEXRnW3tacvQe1/NZPE
   i53xpU+M7OT4/+yryzRWmi/midpUwh8niJZIgatMazHtk1Km3RS1K3i5I
   SgGEMZFQRQe1GtJlQmK5Jq97+iLuX4Hw/fJ6LLln/dcm4B/BOZwFitnGL
   aZgXLXKPhYBzzsFztjHZQtfX5ib+4hztv+Gi0bQ36wtkQNhSywG+aR36K
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10392"; a="280673668"
X-IronPort-AV: E=Sophos;i="5.92,230,1650956400"; 
   d="scan'208";a="280673668"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2022 20:35:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,230,1650956400"; 
   d="scan'208";a="917433661"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 28 Jun 2022 20:35:46 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1o6OUT-000AsA-PJ;
        Wed, 29 Jun 2022 03:35:45 +0000
Date:   Wed, 29 Jun 2022 11:35:16 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 869283d149c8f34f2352fac3d1179905eff19bcd
Message-ID: <62bbc874.g4fzZWXnAPbokJYi%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 869283d149c8f34f2352fac3d1179905eff19bcd  Merge branch 'devel' into for-next

elapsed time: 767m

configs tested: 48
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                            allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
mips                             allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
sh                               allmodconfig
alpha                            allyesconfig
arc                              allyesconfig
i386                                defconfig
i386                             allyesconfig
x86_64               randconfig-a012-20220627
x86_64               randconfig-a011-20220627
x86_64               randconfig-a014-20220627
x86_64               randconfig-a015-20220627
x86_64               randconfig-a016-20220627
x86_64               randconfig-a013-20220627
i386                 randconfig-a012-20220627
i386                 randconfig-a015-20220627
i386                 randconfig-a011-20220627
i386                 randconfig-a013-20220627
i386                 randconfig-a014-20220627
i386                 randconfig-a016-20220627
arc                  randconfig-r043-20220627
riscv                randconfig-r042-20220627
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig

clang tested configs:
i386                 randconfig-a002-20220627
i386                 randconfig-a003-20220627
i386                 randconfig-a001-20220627
i386                 randconfig-a006-20220627
i386                 randconfig-a004-20220627
i386                 randconfig-a005-20220627
x86_64               randconfig-a002-20220627
x86_64               randconfig-a003-20220627
x86_64               randconfig-a001-20220627
x86_64               randconfig-a005-20220627
x86_64               randconfig-a004-20220627
x86_64               randconfig-a006-20220627
hexagon              randconfig-r041-20220627
hexagon              randconfig-r045-20220627

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
