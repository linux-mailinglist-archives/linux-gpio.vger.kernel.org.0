Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5856D4C5B59
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Feb 2022 14:36:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230453AbiB0NhN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 27 Feb 2022 08:37:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230371AbiB0NhM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 27 Feb 2022 08:37:12 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E29086D4D4
        for <linux-gpio@vger.kernel.org>; Sun, 27 Feb 2022 05:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645968995; x=1677504995;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=0wQ69qCxFQY3ed1iUxNUzMa9pjgtXTQ57QdE2KK0Ruc=;
  b=KFPLPm1VDR1ebrjkK3ldQ6qultZVUaJBygkHEGfz/RWOlU8uhQhMXtNA
   RuP9g5r2wjE8qepMFfqHefWce2SgHAYXJIa7XcuNOulhpv1X3zO9A3S//
   vobsJ90m6Vld6cEgN5G7hqjPA34ysanM0unWQGFi/8IuPdsEQlpQ3KE0c
   OlQKuAsQLrpnfXAZmQkl+q9ToFbBqf7dGtMeKRnnxEP7KbeL94se/qEa8
   7z3YC3FdJGB4JCf6SJoRG71mw2hQGx/W9zvvE3SZiOqDsAeMMKB/QkzSO
   AjOIvVG3QWrTsHZYx069ksdXHPWDoSVcX6HtSk5roSTa5ngVVYFHr5XKt
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10270"; a="233355896"
X-IronPort-AV: E=Sophos;i="5.90,141,1643702400"; 
   d="scan'208";a="233355896"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2022 05:36:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,141,1643702400"; 
   d="scan'208";a="534125207"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 27 Feb 2022 05:36:34 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nOJiz-0006X6-Jc; Sun, 27 Feb 2022 13:36:33 +0000
Date:   Sun, 27 Feb 2022 21:36:05 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 929229098efbc6dc64ac00b7f6c0e282bd73fd8a
Message-ID: <621b7e45.Hrrg2iKuiLY1NWU1%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 929229098efbc6dc64ac00b7f6c0e282bd73fd8a  Merge branch 'devel' into for-next

elapsed time: 723m

configs tested: 111
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                              allmodconfig
arm                              allyesconfig
arm                                 defconfig
arm64                               defconfig
arm64                            allyesconfig
i386                          randconfig-c001
um                             i386_defconfig
mips                             allmodconfig
riscv                            allmodconfig
um                           x86_64_defconfig
mips                             allyesconfig
riscv                            allyesconfig
sparc                            allyesconfig
alpha                            allyesconfig
arc                              allyesconfig
nios2                            allyesconfig
sh                           se7780_defconfig
mips                           ci20_defconfig
mips                  decstation_64_defconfig
openrisc                 simple_smp_defconfig
powerpc                      pcm030_defconfig
sh                          landisk_defconfig
m68k                        m5407c3_defconfig
mips                         mpc30x_defconfig
mips                      loongson3_defconfig
mips                            gpr_defconfig
arc                            hsdk_defconfig
sh                          r7785rp_defconfig
mips                     decstation_defconfig
sparc64                             defconfig
arm                  randconfig-c002-20220227
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
csky                                defconfig
alpha                               defconfig
nds32                               defconfig
arc                                 defconfig
sh                               allmodconfig
xtensa                           allyesconfig
h8300                            allyesconfig
parisc                              defconfig
parisc64                            defconfig
s390                             allmodconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
i386                              debian-10.3
i386                   debian-10.3-kselftests
i386                                defconfig
sparc                               defconfig
nds32                             allnoconfig
nios2                               defconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
i386                          randconfig-a003
i386                          randconfig-a001
i386                          randconfig-a005
x86_64                        randconfig-a015
x86_64                        randconfig-a013
x86_64                        randconfig-a011
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
x86_64                        randconfig-a006
x86_64                        randconfig-a002
x86_64                        randconfig-a004
arc                  randconfig-r043-20220227
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                                  kexec
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests

clang tested configs:
powerpc              randconfig-c003-20220227
x86_64                        randconfig-c007
arm                  randconfig-c002-20220227
mips                 randconfig-c004-20220227
s390                 randconfig-c005-20220227
i386                          randconfig-c001
riscv                randconfig-c006-20220227
powerpc                 mpc8560_ads_defconfig
powerpc                   microwatt_defconfig
powerpc               mpc834x_itxgp_defconfig
i386                             allyesconfig
mips                        omega2p_defconfig
arm                           sama7_defconfig
arm                         s5pv210_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a016
x86_64                        randconfig-a014
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
hexagon              randconfig-r045-20220227
hexagon              randconfig-r041-20220227
riscv                randconfig-r042-20220227
s390                 randconfig-r044-20220227

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
