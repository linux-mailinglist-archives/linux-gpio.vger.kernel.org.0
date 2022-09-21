Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D1CF5BF2A0
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Sep 2022 03:17:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230055AbiIUBQ5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 20 Sep 2022 21:16:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229669AbiIUBQ4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 20 Sep 2022 21:16:56 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43BE4606B0
        for <linux-gpio@vger.kernel.org>; Tue, 20 Sep 2022 18:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663723015; x=1695259015;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=M919m13dW6cKVTlewyWDaVt1MuMpJA6MYxfUiNfw9aA=;
  b=d7I85Wvu7RCqLJdnzwFt/Sln8y726lXIpCoLx1rToMukEf2TrRqiy/8O
   weBqTHtV3VUp3kkYyemgJSRMeLpuPFUB+MfMEEHyRV1etaD52BrIBJu11
   Z0kVUYscnCA30iN6orNvzj/NbK8kZMwLVqgNHNAGp/wy4KkrYo18gxytV
   vVtNl4BKxOoOT3lrYsKEXOUspHyk9bYVNBU3bZbjmz+q9yIHXtswJPeI5
   xHCzpNqSVrfRvwdl1rY8TYFbc7CCUidhmZ++MkYxdVjGJaC0UTRxB+9Jn
   It1cUZCwPHD+VsLXx0i+/seZflvqENwJblElNMus6vBdXMiKENkKIv9Lv
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10476"; a="286934873"
X-IronPort-AV: E=Sophos;i="5.93,332,1654585200"; 
   d="scan'208";a="286934873"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2022 18:16:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,332,1654585200"; 
   d="scan'208";a="708225447"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 20 Sep 2022 18:16:53 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oaoM8-00035p-36;
        Wed, 21 Sep 2022 01:16:52 +0000
Date:   Wed, 21 Sep 2022 09:16:26 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 ee6cac37368b7ec2b3f798fb7d6d4ce7a62db537
Message-ID: <632a65ea.fOt0XholaE8PabEK%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: ee6cac37368b7ec2b3f798fb7d6d4ce7a62db537  pinctrl: cy8c95x0: Align function names in cy8c95x0_pmxops

elapsed time: 738m

configs tested: 46
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
i386                                defconfig
powerpc                          allmodconfig
mips                             allyesconfig
arc                  randconfig-r043-20220919
sh                               allmodconfig
i386                 randconfig-a013-20220919
powerpc                           allnoconfig
arc                                 defconfig
i386                 randconfig-a012-20220919
s390                 randconfig-r044-20220919
alpha                               defconfig
i386                 randconfig-a014-20220919
riscv                randconfig-r042-20220919
i386                 randconfig-a011-20220919
s390                                defconfig
i386                             allyesconfig
i386                 randconfig-a015-20220919
i386                 randconfig-a016-20220919
s390                             allmodconfig
x86_64                              defconfig
x86_64                        randconfig-a002
x86_64                        randconfig-a004
x86_64                        randconfig-a006
s390                             allyesconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
x86_64                           rhel-8.3-kvm
ia64                             allmodconfig
x86_64                               rhel-8.3
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
arm                                 defconfig
x86_64                         rhel-8.3-kunit
x86_64                           allyesconfig
arm                              allyesconfig
arm64                            allyesconfig

clang tested configs:
hexagon              randconfig-r041-20220919
hexagon              randconfig-r045-20220919
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
