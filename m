Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C68855B4CE
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Jun 2022 02:57:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229468AbiF0A4Q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 26 Jun 2022 20:56:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbiF0A4P (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 26 Jun 2022 20:56:15 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB6B42BEB
        for <linux-gpio@vger.kernel.org>; Sun, 26 Jun 2022 17:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656291374; x=1687827374;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=7+lrCRYgImK0RJ7iPP+xRyEUdJKX38swJDG3wOMqf7M=;
  b=AcikPkeMKcFCvbqgLfb+oQ+QV+BW1wzczuuOlarqPGHApDvO4n6ACDVL
   nLknO52NeZ5ed+D6Nok5UMWYli75tIKe1XfH/hKx/b9RHAAM8H/JPq1QA
   1NACEd/LeWgBSX0H65kN5NWZ2qZbQK2IfqpRtK4HNwpPXCeRfsvBmG5cd
   h9Y8/KtI1worGkYTa2g10wr8x01bbwILHADg7yl4Ofu90NVW/uiABpnPd
   dIZEQ66fR4+ladBzJ3j8f/vVnUnRFoYeCSNd0YGczCdAfM2VRKx0ChbHA
   kzSs1YP/BZcoPYKyyKTGgW05ylOFv8MPAAHz8kFfOTiuCB1gbcZnAkDG7
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10390"; a="282061486"
X-IronPort-AV: E=Sophos;i="5.92,225,1650956400"; 
   d="scan'208";a="282061486"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2022 17:56:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,225,1650956400"; 
   d="scan'208";a="616594227"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 26 Jun 2022 17:56:13 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1o5d2y-00081X-Iq;
        Mon, 27 Jun 2022 00:56:12 +0000
Date:   Mon, 27 Jun 2022 08:55:24 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 8fad91bd5a6c63051ba8ffad6da0c81bf06c9308
Message-ID: <62b8fffc.isIiEVmx0wMLTmVc%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 8fad91bd5a6c63051ba8ffad6da0c81bf06c9308  Merge branch 'devel' into for-next

elapsed time: 1500m

configs tested: 50
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allyesconfig
arm64                            allyesconfig
mips                             allyesconfig
powerpc                           allnoconfig
sh                               allmodconfig
powerpc                          allmodconfig
m68k                             allyesconfig
alpha                            allyesconfig
arc                              allyesconfig
i386                                defconfig
i386                             allyesconfig
m68k                             allmodconfig
x86_64                        randconfig-a002
x86_64                        randconfig-a006
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a013
x86_64                        randconfig-a015
x86_64                        randconfig-a011
i386                          randconfig-a016
i386                          randconfig-a012
i386                          randconfig-a014
arc                  randconfig-r043-20220626
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-syz
x86_64                              defconfig
x86_64                           allyesconfig

clang tested configs:
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64                        randconfig-a012
i386                          randconfig-a013
i386                          randconfig-a015
i386                          randconfig-a011
hexagon              randconfig-r041-20220626
hexagon              randconfig-r045-20220626
riscv                randconfig-r042-20220626
s390                 randconfig-r044-20220626

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
