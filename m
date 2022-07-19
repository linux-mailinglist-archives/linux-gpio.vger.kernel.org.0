Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60CFF579A1C
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Jul 2022 14:10:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236479AbiGSMKz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Jul 2022 08:10:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239077AbiGSMKI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Jul 2022 08:10:08 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 361D951A35
        for <linux-gpio@vger.kernel.org>; Tue, 19 Jul 2022 05:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658232193; x=1689768193;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=GjZBmR2nbvvQiLlErqsInnngMl8hQ1Th94VPIxwsHec=;
  b=QiGQnZFoDu6cRGxQ4f+JWyQKAB1l6itSgt8eWHpdpFQrOZGjK7F0Drwp
   V+9c3Oxpl5zk73pKqiKrIvc9gIy8HczO7fzazd1Tusn8vqn4Mm3S6vwP1
   mVdnnVYVRXVaBjtnbdzulQmxiJKygRTIIg9yA9VMuRG5IaR/xVWPMg/Ex
   pAuB20TluLA3KWnbQQwWFqmF2PEpCzX62mE2OUViSyZaPm1yNEfi0aikM
   Aeb3dyOfQbF1UuXZUF0EgPoE2Xjh+Ur0qka77UWlrmtRSjTwPl1thWzrB
   6zbcmg6jk7JyFSmx31RFuhwgUmB4380YC4Broyk7RfsovKTARedXDeGai
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10412"; a="285225078"
X-IronPort-AV: E=Sophos;i="5.92,284,1650956400"; 
   d="scan'208";a="285225078"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2022 05:03:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,284,1650956400"; 
   d="scan'208";a="572821190"
Received: from lkp-server02.sh.intel.com (HELO ff137eb26ff1) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 19 Jul 2022 05:03:11 -0700
Received: from kbuild by ff137eb26ff1 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1oDlwU-0005d0-P4;
        Tue, 19 Jul 2022 12:03:10 +0000
Date:   Tue, 19 Jul 2022 20:02:39 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 1a24a177564af5336325fc5b610292efb134d27b
Message-ID: <62d69d5f.Z9VStejtJw9B+DTx%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 1a24a177564af5336325fc5b610292efb134d27b  Merge branch 'devel' into for-next

elapsed time: 727m

configs tested: 52
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
ia64                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
mips                             allyesconfig
powerpc                           allnoconfig
i386                                defconfig
i386                             allyesconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
x86_64               randconfig-a013-20220718
x86_64               randconfig-a012-20220718
x86_64               randconfig-a015-20220718
x86_64               randconfig-a014-20220718
x86_64               randconfig-a011-20220718
x86_64               randconfig-a016-20220718
i386                 randconfig-a014-20220718
i386                 randconfig-a011-20220718
i386                 randconfig-a013-20220718
i386                 randconfig-a016-20220718
i386                 randconfig-a012-20220718
i386                 randconfig-a015-20220718
arc                  randconfig-r043-20220718
s390                 randconfig-r044-20220718
riscv                randconfig-r042-20220718
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
x86_64                           rhel-8.3-syz
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests

clang tested configs:
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                 randconfig-a003-20220718
i386                 randconfig-a001-20220718
i386                 randconfig-a002-20220718
i386                 randconfig-a006-20220718
i386                 randconfig-a004-20220718
i386                 randconfig-a005-20220718
hexagon              randconfig-r045-20220718
hexagon              randconfig-r041-20220718

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
