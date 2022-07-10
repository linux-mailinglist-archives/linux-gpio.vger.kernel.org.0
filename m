Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3A4256CF4F
	for <lists+linux-gpio@lfdr.de>; Sun, 10 Jul 2022 15:50:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229463AbiGJNuQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 10 Jul 2022 09:50:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbiGJNuQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 10 Jul 2022 09:50:16 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAF31DF04
        for <linux-gpio@vger.kernel.org>; Sun, 10 Jul 2022 06:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657461015; x=1688997015;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Lga4IzVkhg5az/T8Py7gCsV/kAIICwFFze1EUWWiv/Y=;
  b=ZuxNN+KyZfW2a6jACzJVT+7z6mMWEroG8drFxywvEqqKvpM/feWBqKys
   bo4FuP3Y+8t2EO86hN5MfuJIXlsvc41mgQe+a7B41lWgZXvZmXKHhQzLa
   cZCx4LOxzDSVl5fJUZ22ekf/ZDMctHidvvK7zBANM2eggW5+t7QPjTZyN
   gJ9o27InIb2LE0WWnWK/cJ/VSv0ZFRsGEEq4ca//lbfJphQeUXvvH4WcD
   wC8BHQ6VcIIenbZIlPzSsjlaOsgyIWyiR2YrMrmATMpKOYbDMip4lADKY
   mSgohpRH5J+/6Vija6mYhz7J22cr/3MPDYkhOI+A4oFo0D2X89oHWlg63
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10403"; a="267555550"
X-IronPort-AV: E=Sophos;i="5.92,260,1650956400"; 
   d="scan'208";a="267555550"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2022 06:50:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,260,1650956400"; 
   d="scan'208";a="544725669"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 10 Jul 2022 06:50:14 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1oAXK9-000PtE-HT;
        Sun, 10 Jul 2022 13:50:13 +0000
Date:   Sun, 10 Jul 2022 21:49:28 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 bae3a3b626e12241b27b0a39aade427afb081632
Message-ID: <62cad8e8.NLPejknb6HBhQqek%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: bae3a3b626e12241b27b0a39aade427afb081632  Merge branch 'devel' into for-next

elapsed time: 763m

configs tested: 63
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
i386                          randconfig-c001
arm                             ezx_defconfig
mips                       bmips_be_defconfig
arm                        trizeps4_defconfig
arm                           sunxi_defconfig
sh                 kfr2r09-romimage_defconfig
arc                                 defconfig
nios2                               defconfig
s390                          debug_defconfig
s390                       zfcpdump_defconfig
nios2                            allyesconfig
arm                          gemini_defconfig
arc                         haps_hs_defconfig
ia64                             allmodconfig
powerpc                           allnoconfig
mips                             allyesconfig
sh                               allmodconfig
powerpc                          allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
i386                             allyesconfig
i386                                defconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
i386                          randconfig-a001
i386                          randconfig-a003
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
arc                  randconfig-r043-20220710
s390                 randconfig-r044-20220710
riscv                randconfig-r042-20220710
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-syz

clang tested configs:
x86_64                        randconfig-k001
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a016
x86_64                        randconfig-a012
x86_64                        randconfig-a014
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
hexagon              randconfig-r041-20220710
hexagon              randconfig-r045-20220710

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
