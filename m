Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACD4768E6D9
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Feb 2023 04:51:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229530AbjBHDvx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Feb 2023 22:51:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbjBHDvw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Feb 2023 22:51:52 -0500
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A143CDC7
        for <linux-gpio@vger.kernel.org>; Tue,  7 Feb 2023 19:51:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675828311; x=1707364311;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=r3a9gKwjEef4g3JWfalwUZvzX96I/2hwuA5Oy5zZfTI=;
  b=L1EhSql3wFdTnHmO+d2Q61zfB5CtHpt4NgsFO93aeWowrnKuX5rhbJr5
   pyV+S2R8fcxWUOz57052T028QQh4jOYsqX9mjpx9H+28WFgT943bkfDW/
   heb9qveOVud8x51U41H77ZRWezERthlMB+F3+XqogS0n37MO/H7cQqhb5
   La1srhkLB3KiV3q002BWbXVm2u5h0R6DZWWd4YZjDQp7rmNP1u9fGq8Ka
   uhnJg0SMb+tnW+ksATSv4FCB/AmcntLgu1zNFuxF2H+GhxMdvwibFdqow
   c+ITjbgK2TtjqocN0MdZUwt+JRjeRCUtZGXB/Yp3ept5409rGCcFVMYsK
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="394294248"
X-IronPort-AV: E=Sophos;i="5.97,279,1669104000"; 
   d="scan'208";a="394294248"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2023 19:51:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="617059205"
X-IronPort-AV: E=Sophos;i="5.97,279,1669104000"; 
   d="scan'208";a="617059205"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 07 Feb 2023 19:51:48 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pPbUp-0004A2-2C;
        Wed, 08 Feb 2023 03:51:47 +0000
Date:   Wed, 08 Feb 2023 11:51:42 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 6c83b2d94fcca735cf7d8aa7a55a4957eb404a9d
Message-ID: <63e31c4e.jYYOu3QtSvbPKQeh%lkp@intel.com>
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
branch HEAD: 6c83b2d94fcca735cf7d8aa7a55a4957eb404a9d  pinctrl: add mt7981 pinctrl driver

elapsed time: 724m

configs tested: 72
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                            allnoconfig
arc                                 defconfig
um                             i386_defconfig
s390                             allmodconfig
um                           x86_64_defconfig
alpha                               defconfig
s390                             allyesconfig
s390                                defconfig
x86_64                           rhel-8.3-bpf
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
arm                                 defconfig
i386                                defconfig
x86_64                              defconfig
x86_64               randconfig-a014-20230206
x86_64               randconfig-a013-20230206
x86_64               randconfig-a011-20230206
x86_64                               rhel-8.3
x86_64               randconfig-a012-20230206
x86_64               randconfig-a015-20230206
arm                              allyesconfig
x86_64               randconfig-a016-20230206
x86_64                           allyesconfig
arm64                            allyesconfig
i386                 randconfig-a011-20230206
powerpc                           allnoconfig
i386                 randconfig-a014-20230206
mips                             allyesconfig
powerpc                          allmodconfig
ia64                             allmodconfig
i386                 randconfig-a012-20230206
sh                               allmodconfig
i386                 randconfig-a013-20230206
i386                             allyesconfig
i386                 randconfig-a016-20230206
i386                 randconfig-a015-20230206
s390                 randconfig-r044-20230206
arc                  randconfig-r043-20230205
arm                  randconfig-r046-20230205
arc                  randconfig-r043-20230206
riscv                randconfig-r042-20230206
x86_64                        randconfig-a004
m68k                             allyesconfig
x86_64                        randconfig-a002
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
x86_64                        randconfig-a006
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
i386                          randconfig-c001

clang tested configs:
i386                 randconfig-a002-20230206
hexagon              randconfig-r041-20230205
i386                 randconfig-a004-20230206
riscv                randconfig-r042-20230205
i386                 randconfig-a003-20230206
i386                 randconfig-a001-20230206
hexagon              randconfig-r045-20230206
hexagon              randconfig-r041-20230206
i386                 randconfig-a006-20230206
i386                 randconfig-a005-20230206
arm                  randconfig-r046-20230206
s390                 randconfig-r044-20230205
hexagon              randconfig-r045-20230205
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
x86_64                          rhel-8.3-rust
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
