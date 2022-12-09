Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FDAA647D0A
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Dec 2022 05:48:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229468AbiLIEsI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Dec 2022 23:48:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbiLIEsG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Dec 2022 23:48:06 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C96713E080
        for <linux-gpio@vger.kernel.org>; Thu,  8 Dec 2022 20:48:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670561285; x=1702097285;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=EGnRSeQpHD0B6GswG6qcD/0fZtaw0P9rEALLqeYBQRc=;
  b=l6OItgbrO7Ju5Z50Vm04qkBr8qGslgLQ9ibxP+8Nkn86S9NAI4dFch73
   VIEmJPwFwICGH3Vh6R30clts/L+Q8rpKU/1+C7naZB1pS/AUA07OmrKgo
   eXru2ROAHTsueij5CavxtAQ7TqHos58rAIBM0Lc0StK3L3oFwdfuFqHCm
   A43LKiNLnfx661Z9GUaRmaZbj6l6mt81bcrfBQ1bCyk89XVoYfTot3VV0
   bE4UcQQTnPu6GAX9zn2pzaGiRYLXN1ad2jyA9XjIqPcsvDdyznwJMbCD1
   d14qYu9kOApPGMjH/vBqRjiDMv7hztoz7YejbfoSSm8+MyrcCEZceynPR
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10555"; a="403631572"
X-IronPort-AV: E=Sophos;i="5.96,230,1665471600"; 
   d="scan'208";a="403631572"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2022 20:48:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10555"; a="753886846"
X-IronPort-AV: E=Sophos;i="5.96,230,1665471600"; 
   d="scan'208";a="753886846"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 08 Dec 2022 20:48:04 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1p3VIp-0001d8-1b;
        Fri, 09 Dec 2022 04:48:03 +0000
Date:   Fri, 09 Dec 2022 12:47:10 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 83e1bcaf8cef26edaaf2a6098ef760f563683483
Message-ID: <6392bdce.tjUzPrt1tvTYKjJw%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 83e1bcaf8cef26edaaf2a6098ef760f563683483  pinctrl: thunderbay: fix possible memory leak in thunderbay_build_functions()

elapsed time: 729m

configs tested: 62
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
um                           x86_64_defconfig
um                             i386_defconfig
s390                                defconfig
s390                             allyesconfig
x86_64                               rhel-8.3
x86_64                              defconfig
sh                               allmodconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
m68k                             allmodconfig
alpha                            allyesconfig
mips                             allyesconfig
m68k                             allyesconfig
powerpc                          allmodconfig
arc                              allyesconfig
i386                                defconfig
x86_64                           allyesconfig
arc                  randconfig-r043-20221207
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
riscv                randconfig-r042-20221207
x86_64                          rhel-8.3-rust
s390                 randconfig-r044-20221207
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
ia64                             allmodconfig
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a001
i386                          randconfig-a003
x86_64                        randconfig-a002
i386                          randconfig-a016
x86_64                        randconfig-a006
x86_64                        randconfig-a004
i386                          randconfig-a005
i386                             allyesconfig
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
x86_64                            allnoconfig

clang tested configs:
arm                  randconfig-r046-20221207
hexagon              randconfig-r041-20221207
hexagon              randconfig-r045-20221207
x86_64                        randconfig-a014
x86_64                        randconfig-a012
x86_64                        randconfig-a016
i386                          randconfig-a013
i386                          randconfig-a011
x86_64                        randconfig-a005
i386                          randconfig-a002
x86_64                        randconfig-a001
i386                          randconfig-a015
x86_64                        randconfig-a003
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-k001

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
