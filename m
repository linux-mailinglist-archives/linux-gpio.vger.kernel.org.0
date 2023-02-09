Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26D4968FDF3
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Feb 2023 04:29:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232743AbjBID3D (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Feb 2023 22:29:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232740AbjBID2l (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Feb 2023 22:28:41 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AE74527A
        for <linux-gpio@vger.kernel.org>; Wed,  8 Feb 2023 19:27:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675913244; x=1707449244;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=B28kF2M4juhiPopbRtVY2MQLKqojsY18bzgzyoeid50=;
  b=NjBYA7YsoBpnaY9wMI0dq+Unw4Jk2SZ4fHCgWcbSj0Qy4UYMYfQxNUqg
   RLzODHaNrHvpH2lbUKcHfyhebJRxW2nZA64spgdzhqWfuWnv81T3zs6Y4
   efh0sdLZso59dp/6FWLwtyjnFLNsxijHpf4AZBdnH4Pm2aeBTyKRex/Pr
   WpDVaqE/MsZ5Lz2izGWuRKGCXzPjlYG65/40e0vsTmDTjKnuggTeMGdSC
   UTUx2SFD56w+NZl5dCA+2SDr3ZtlONJHgez2miSvnSWNXqhumC3416CxW
   z3be3cudICZvgLIWJSNyvmez3rrp2uwUUX5U1AHSQXd4vF7UfMNQJbQeC
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="416222426"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; 
   d="scan'208";a="416222426"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2023 19:27:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="669433172"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; 
   d="scan'208";a="669433172"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 08 Feb 2023 19:27:22 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pPxaj-0004n4-2e;
        Thu, 09 Feb 2023 03:27:21 +0000
Date:   Thu, 09 Feb 2023 11:26:37 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 15dcc128d60739c444b729a04c4add800832d5b6
Message-ID: <63e467ed.y53qraYyseFSVkj1%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 15dcc128d60739c444b729a04c4add800832d5b6  Merge branch 'devel' into for-next

elapsed time: 722m

configs tested: 65
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                            allnoconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           rhel-8.3-bpf
s390                                defconfig
powerpc                           allnoconfig
s390                             allyesconfig
x86_64                              defconfig
arm                                 defconfig
i386                                defconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
arm                              allyesconfig
x86_64                           rhel-8.3-kvm
sh                               allmodconfig
arm64                            allyesconfig
x86_64                    rhel-8.3-kselftests
mips                             allyesconfig
x86_64                          rhel-8.3-func
ia64                             allmodconfig
i386                          randconfig-a014
i386                          randconfig-a012
x86_64                        randconfig-a013
x86_64                        randconfig-a011
m68k                             allyesconfig
i386                             allyesconfig
i386                          randconfig-a016
x86_64                        randconfig-a015
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
arc                  randconfig-r043-20230209
arm                  randconfig-r046-20230209
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
alpha                            allyesconfig
x86_64                               rhel-8.3
m68k                             allmodconfig
arc                              allyesconfig
powerpc                          allmodconfig
x86_64                           allyesconfig

clang tested configs:
x86_64                          rhel-8.3-rust
x86_64               randconfig-a001-20230206
i386                          randconfig-a013
x86_64               randconfig-a002-20230206
x86_64               randconfig-a004-20230206
x86_64                        randconfig-a014
i386                          randconfig-a011
x86_64                        randconfig-a012
i386                          randconfig-a015
x86_64                        randconfig-a016
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
hexagon              randconfig-r041-20230209
hexagon              randconfig-r045-20230209
s390                 randconfig-r044-20230209
riscv                randconfig-r042-20230209
i386                          randconfig-a004
i386                          randconfig-a002
i386                          randconfig-a006

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
