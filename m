Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F37515B9240
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Sep 2022 03:43:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229473AbiIOBnK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Sep 2022 21:43:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229873AbiIOBnK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Sep 2022 21:43:10 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB0D88D3EE
        for <linux-gpio@vger.kernel.org>; Wed, 14 Sep 2022 18:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663206189; x=1694742189;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=1M9W/OftUZPErzKrFT1BSDOXjwyugJlLatBWDgVdqs8=;
  b=IwsfksojuVEI6dul6oiu3y78uJ1oH5ogYyx7YTD7tu95YI4QD7GamMLh
   5QWM0P8Zekw/qgdEkJGV8oL1s2K56SVnhIQ3BCfHpKJwByt0xrF+2nX/3
   lmDDg5uCTBMM+zLGeliMFSatYDzLgkNsmnVd5MLqavfH52r+B3mvus8RC
   qqPeZ39IAGvYqPUO9WcXBhP/2z+tuRaKDiw4eVwh1KbteWnFPzD6PmpMK
   zUJBJhv86BgPpA0bJFU1pcmTFS+bL28o4JKiwQND2QQkHVl+lwiPjcUHq
   37Vu0Yc9fdBsYIzjut3nX0OEBcn029u6D9jcbQi4uXCqOn6Gm+Ymmkfw9
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10470"; a="298583694"
X-IronPort-AV: E=Sophos;i="5.93,316,1654585200"; 
   d="scan'208";a="298583694"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2022 18:43:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,316,1654585200"; 
   d="scan'208";a="685529379"
Received: from lkp-server01.sh.intel.com (HELO d6e6b7c4e5a2) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 14 Sep 2022 18:43:06 -0700
Received: from kbuild by d6e6b7c4e5a2 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oYduE-0000mJ-06;
        Thu, 15 Sep 2022 01:43:06 +0000
Date:   Thu, 15 Sep 2022 09:42:40 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:fixes] BUILD SUCCESS
 c297561bc98ad0f2a37ce0178ee3ba89ab586d70
Message-ID: <63228310.PF1I0Ph2305/Vus5%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git fixes
branch HEAD: c297561bc98ad0f2a37ce0178ee3ba89ab586d70  pinctrl: ocelot: Fix interrupt controller

elapsed time: 722m

configs tested: 58
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
x86_64                              defconfig
powerpc                           allnoconfig
i386                                defconfig
powerpc                          allmodconfig
x86_64                               rhel-8.3
mips                             allyesconfig
arc                  randconfig-r043-20220914
arm                                 defconfig
sh                               allmodconfig
i386                          randconfig-a014
x86_64                           allyesconfig
i386                          randconfig-a001
x86_64                           rhel-8.3-kvm
i386                          randconfig-a003
x86_64                          rhel-8.3-func
i386                             allyesconfig
i386                          randconfig-a005
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests
arm                              allyesconfig
x86_64                        randconfig-a002
i386                          randconfig-a012
x86_64                           rhel-8.3-syz
arm64                            allyesconfig
x86_64                        randconfig-a004
i386                          randconfig-a016
x86_64                        randconfig-a006
ia64                             allmodconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
alpha                            allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
m68k                             allyesconfig

clang tested configs:
hexagon              randconfig-r041-20220914
i386                          randconfig-a013
riscv                randconfig-r042-20220914
s390                 randconfig-r044-20220914
hexagon              randconfig-r045-20220914
i386                          randconfig-a002
i386                          randconfig-a011
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a015
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
