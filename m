Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4276860C21B
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Oct 2022 05:12:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230295AbiJYDMD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Oct 2022 23:12:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229707AbiJYDMA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Oct 2022 23:12:00 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 084D52790B
        for <linux-gpio@vger.kernel.org>; Mon, 24 Oct 2022 20:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666667519; x=1698203519;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=tloe4TRPPHIdn6A4EY65Neu5A/sYpSohieI4dPh8o4Q=;
  b=jLnyzxhZHrxPtKR0dpzzc6YjKBVOoYYpH8Hc8cBXbNc+OmbNG7P7lYzQ
   eoLMkyBvp/a2DPf9slBrJiVfD94sL8BJtorSYT+suK5iIDYiUF83okToW
   afg51wQLvPcKmpj6URPHbxt1TzULUcAhbMksC1PWN8xCvQC3MjSRwZWOM
   3I0RkBODbnfAZAOrv57v6Y6qLVRLPHU+szOpHNUXp3OVQVys1mTvLzMtg
   BL9r/3/AkReF7sDnRkRJ1gPXGE6c/77TRbedMulR6/bNWMFzrGSAskzC4
   s0Z+GYIobIdeGp0JEbrnCoHrtJGA060uCOnkkyKuhOf0Bj+P6naly715e
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="287295668"
X-IronPort-AV: E=Sophos;i="5.95,210,1661842800"; 
   d="scan'208";a="287295668"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2022 20:11:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="960660459"
X-IronPort-AV: E=Sophos;i="5.95,210,1661842800"; 
   d="scan'208";a="960660459"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 24 Oct 2022 20:11:57 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1onAM9-0005ra-0u;
        Tue, 25 Oct 2022 03:11:57 +0000
Date:   Tue, 25 Oct 2022 11:11:42 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-gpio:gpio-descriptors-input-cleanup] BUILD SUCCESS
 a434a9e148fe0c3047eb257827d17ddc6e0d4f21
Message-ID: <635753ee.dP/nCnImnYzVvZZs%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git gpio-descriptors-input-cleanup
branch HEAD: a434a9e148fe0c3047eb257827d17ddc6e0d4f21  ARM: davinci: Switch DA850EVM to use GPIO descriptors

elapsed time: 729m

configs tested: 69
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
s390                             allyesconfig
i386                                defconfig
x86_64                              defconfig
ia64                             allmodconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64                               rhel-8.3
i386                             allyesconfig
powerpc                          allmodconfig
m68k                             allmodconfig
x86_64                           allyesconfig
mips                             allyesconfig
x86_64                           rhel-8.3-syz
arc                              allyesconfig
powerpc                           allnoconfig
x86_64                         rhel-8.3-kunit
alpha                            allyesconfig
sh                               allmodconfig
x86_64                           rhel-8.3-kvm
m68k                             allyesconfig
i386                          randconfig-a014
i386                          randconfig-a012
arc                  randconfig-r043-20221024
riscv                randconfig-r042-20221024
i386                          randconfig-a016
arm                                 defconfig
arc                  randconfig-r043-20221023
s390                 randconfig-r044-20221024
arm                              allyesconfig
x86_64               randconfig-a013-20221024
x86_64               randconfig-a012-20221024
x86_64               randconfig-a011-20221024
x86_64               randconfig-a015-20221024
x86_64               randconfig-a014-20221024
x86_64               randconfig-a016-20221024
arm64                            allyesconfig
i386                 randconfig-a011-20221024
i386                 randconfig-a014-20221024
i386                 randconfig-a015-20221024
i386                 randconfig-a016-20221024
i386                 randconfig-a012-20221024
i386                 randconfig-a013-20221024

clang tested configs:
i386                          randconfig-a013
hexagon              randconfig-r045-20221023
hexagon              randconfig-r041-20221024
i386                          randconfig-a011
riscv                randconfig-r042-20221023
x86_64               randconfig-a001-20221024
i386                 randconfig-a004-20221024
i386                 randconfig-a001-20221024
hexagon              randconfig-r045-20221024
i386                 randconfig-a002-20221024
x86_64               randconfig-a003-20221024
i386                          randconfig-a015
s390                 randconfig-r044-20221023
i386                 randconfig-a005-20221024
x86_64               randconfig-a004-20221024
hexagon              randconfig-r041-20221023
i386                 randconfig-a003-20221024
x86_64               randconfig-a002-20221024
x86_64               randconfig-a005-20221024
i386                 randconfig-a006-20221024
x86_64               randconfig-a006-20221024

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
