Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 182C96953D2
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Feb 2023 23:22:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229604AbjBMWWW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Feb 2023 17:22:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231159AbjBMWWI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Feb 2023 17:22:08 -0500
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9147423302
        for <linux-gpio@vger.kernel.org>; Mon, 13 Feb 2023 14:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676326900; x=1707862900;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=D5m2L+jn5FzVwGyJGXazmx+wqyqsAFXggIAMg9LtB90=;
  b=TI9WjR3OYpbfWNXs+Lx9WoJ8kB2OcJm3huPkSjSJOtQNqjDJHW5oQ9E1
   QMd4zAXT8R2ZiX93xXFYlascoauBvHh9m7gFyg+wqKjwWhR+73AiKkpIX
   MPcmtLU+UOaNpU4PlJs6OS8/8oTxxPgEXNJTZcXCw/pjzJL8nYYUZASGZ
   eDBkFLlZS8l6Zooo3BYGdUvgz/VKRQ6zEqNWLtK64M5H2YtAkZRI+0D3D
   F9l8XmUR8R4R6fdcx+3pkcvbPrKT7HI4rb30x7Tbn956IzWBSfLpr1fmE
   k0TSi0EiLYD6ipHV10EUkq9ToYZ31bd6vnFE1b8IP0g0o84cPJjuOlot8
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="393416098"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="393416098"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2023 14:21:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="670997163"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="670997163"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 13 Feb 2023 14:21:37 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pRhCa-00082j-2E;
        Mon, 13 Feb 2023 22:21:36 +0000
Date:   Tue, 14 Feb 2023 06:21:04 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 099f37a539e616f762241ab999495fb8aa2f5971
Message-ID: <63eab7d0.WPuQ5/f4zxRWrj0b%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LONGWORDS,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 099f37a539e616f762241ab999495fb8aa2f5971  pinctrl: qcom: Add support for i2c specific pull feature

elapsed time: 724m

configs tested: 79
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
alpha                            allyesconfig
alpha                               defconfig
arc                              allyesconfig
arc                                 defconfig
arc                  randconfig-r043-20230212
arc                  randconfig-r043-20230213
arm                              allmodconfig
arm                              allyesconfig
arm                                 defconfig
arm                  randconfig-r046-20230212
arm64                            allyesconfig
arm64                               defconfig
csky                                defconfig
i386                             allyesconfig
i386                              debian-10.3
i386                                defconfig
i386                 randconfig-a011-20230213
i386                 randconfig-a012-20230213
i386                 randconfig-a013-20230213
i386                 randconfig-a014-20230213
i386                 randconfig-a015-20230213
i386                 randconfig-a016-20230213
ia64                             allmodconfig
ia64                                defconfig
loongarch                        allmodconfig
loongarch                         allnoconfig
loongarch                           defconfig
m68k                             allmodconfig
m68k                                defconfig
mips                             allmodconfig
mips                             allyesconfig
nios2                               defconfig
parisc                              defconfig
parisc64                            defconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
riscv                            allmodconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                randconfig-r042-20230213
riscv                          rv32_defconfig
s390                             allmodconfig
s390                             allyesconfig
s390                                defconfig
s390                 randconfig-r044-20230213
sh                               allmodconfig
sparc                               defconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                            allnoconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                                  kexec
x86_64               randconfig-a011-20230213
x86_64               randconfig-a012-20230213
x86_64               randconfig-a013-20230213
x86_64               randconfig-a014-20230213
x86_64               randconfig-a015-20230213
x86_64               randconfig-a016-20230213
x86_64                               rhel-8.3

clang tested configs:
arm                  randconfig-r046-20230213
hexagon              randconfig-r041-20230212
hexagon              randconfig-r041-20230213
hexagon              randconfig-r045-20230212
hexagon              randconfig-r045-20230213
i386                 randconfig-a001-20230213
i386                 randconfig-a002-20230213
i386                 randconfig-a003-20230213
i386                 randconfig-a004-20230213
i386                 randconfig-a005-20230213
i386                 randconfig-a006-20230213
riscv                randconfig-r042-20230212
s390                 randconfig-r044-20230212
x86_64               randconfig-a001-20230213
x86_64               randconfig-a002-20230213
x86_64               randconfig-a003-20230213
x86_64               randconfig-a004-20230213
x86_64               randconfig-a005-20230213
x86_64               randconfig-a006-20230213

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
