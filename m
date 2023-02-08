Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ECC1B68E6D8
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Feb 2023 04:51:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229509AbjBHDvw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Feb 2023 22:51:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbjBHDvv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Feb 2023 22:51:51 -0500
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D26368A4E
        for <linux-gpio@vger.kernel.org>; Tue,  7 Feb 2023 19:51:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675828309; x=1707364309;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=yuF6xllZE9BIlFb3CgUo6bG1zjl2Ru/D9Nk0/XjYgB8=;
  b=Gl1t7FTZtJEFp22FET40x2XPvtsrZVbVwMv08uHeMWEzAamo7k1+pfHd
   hqxm1O8idTajgu+n3ZbuM5hqvA7pnuEAbVTDhiBIgGHsjIdzAsxKZtqnx
   iwgGVfBxxGU+Kv+DIiHuvO++tfXIVvgveSbKT4z7mgRfG3MSguc2jpzJR
   VW+5c6UcUDOlS3I5vtQQhuzRe1iWwFDxaZvfEYZa1Gu641eJl1xW7EmFp
   3omgdIJSQwoS1qLf0trnwIDzr2jJzdY4n6LnSPl0p2tBdI2WGYVtdmqy8
   XOPiYOM4mEWfF7YvrpOBwgJ0fdF5j46ZFUZDPgYWfLVz7iPPfXNP5AAZ0
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="394294245"
X-IronPort-AV: E=Sophos;i="5.97,279,1669104000"; 
   d="scan'208";a="394294245"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2023 19:51:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="617059204"
X-IronPort-AV: E=Sophos;i="5.97,279,1669104000"; 
   d="scan'208";a="617059204"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 07 Feb 2023 19:51:48 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pPbUp-0004A4-2I;
        Wed, 08 Feb 2023 03:51:47 +0000
Date:   Wed, 08 Feb 2023 11:51:40 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 a72ea612cb949eeea7f4b783a642b34f55d630ff
Message-ID: <63e31c4c.h8A2hL8fQFjep9Nk%lkp@intel.com>
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
branch HEAD: a72ea612cb949eeea7f4b783a642b34f55d630ff  Merge branch 'devel' into for-next

elapsed time: 723m

configs tested: 72
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                            allnoconfig
powerpc                           allnoconfig
um                             i386_defconfig
um                           x86_64_defconfig
arm                                 defconfig
sh                               allmodconfig
x86_64                           rhel-8.3-bpf
arc                                 defconfig
x86_64               randconfig-a013-20230206
s390                             allmodconfig
x86_64               randconfig-a011-20230206
alpha                               defconfig
x86_64                           rhel-8.3-syz
x86_64               randconfig-a012-20230206
i386                                defconfig
x86_64                         rhel-8.3-kunit
arm64                            allyesconfig
x86_64                           rhel-8.3-kvm
x86_64               randconfig-a014-20230206
x86_64                              defconfig
arm                              allyesconfig
mips                             allyesconfig
x86_64               randconfig-a015-20230206
x86_64                               rhel-8.3
x86_64               randconfig-a016-20230206
s390                                defconfig
i386                 randconfig-a011-20230206
i386                 randconfig-a014-20230206
i386                 randconfig-a012-20230206
i386                 randconfig-a013-20230206
i386                 randconfig-a015-20230206
s390                             allyesconfig
i386                 randconfig-a016-20230206
powerpc                          allmodconfig
s390                 randconfig-r044-20230206
arc                  randconfig-r043-20230205
x86_64                           allyesconfig
arm                  randconfig-r046-20230205
arc                  randconfig-r043-20230206
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
riscv                randconfig-r042-20230206
ia64                             allmodconfig
m68k                             allmodconfig
alpha                            allyesconfig
m68k                             allyesconfig
arc                              allyesconfig
i386                             allyesconfig
i386                          randconfig-c001

clang tested configs:
x86_64               randconfig-a002-20230206
x86_64               randconfig-a004-20230206
i386                 randconfig-a002-20230206
x86_64               randconfig-a003-20230206
i386                 randconfig-a004-20230206
x86_64               randconfig-a001-20230206
i386                 randconfig-a003-20230206
i386                 randconfig-a001-20230206
i386                 randconfig-a006-20230206
hexagon              randconfig-r041-20230205
i386                 randconfig-a005-20230206
riscv                randconfig-r042-20230205
x86_64               randconfig-a005-20230206
hexagon              randconfig-r045-20230206
hexagon              randconfig-r041-20230206
arm                  randconfig-r046-20230206
s390                 randconfig-r044-20230205
x86_64               randconfig-a006-20230206
hexagon              randconfig-r045-20230205
x86_64                          rhel-8.3-rust
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
