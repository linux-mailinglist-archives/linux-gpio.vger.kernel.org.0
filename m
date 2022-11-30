Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00C6563CDBD
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Nov 2022 04:18:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232420AbiK3DSu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Nov 2022 22:18:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232206AbiK3DSu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Nov 2022 22:18:50 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F6EB201A6
        for <linux-gpio@vger.kernel.org>; Tue, 29 Nov 2022 19:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669778329; x=1701314329;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=8ngjkzaAyWFE12Y93ZSXqnxsYxcBSgFTxtGFKuI/KVY=;
  b=Gpb6gGPZPuaclwTCCpTRNQSXtPlH11lKZbCeM9zV6ZbtvIHwvBYX6HAm
   VZ76RMg/m2sXUOs56mSt1wraingB4uzvu/kCAJ/+VOWhQqkl+69NbetHZ
   HUqozdwNaqiTd54zrrZjR7JR8hPKhmB8JTNjSSwmoqlowrb4LUFqgDrH6
   SyssOXfntRJAvc9hh+dL5Zn3iWtZrGzlHIO0demal0j9+iKky/NUqkCa+
   CDlYhlnlsUJrfm/jLEHtYeSRRznzhpmvUC4dzgfCCWiPz3FvgD/tKOp6I
   Dh+m8NOjeVNXIiQLpnbtlAPvx2uJnPJIMkzl1BWYOVx8i/1Sb19cLmR7E
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10546"; a="317144065"
X-IronPort-AV: E=Sophos;i="5.96,205,1665471600"; 
   d="scan'208";a="317144065"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2022 19:18:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10546"; a="768674041"
X-IronPort-AV: E=Sophos;i="5.96,205,1665471600"; 
   d="scan'208";a="768674041"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 29 Nov 2022 19:18:47 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1p0DcU-0009Rj-1s;
        Wed, 30 Nov 2022 03:18:46 +0000
Date:   Wed, 30 Nov 2022 11:17:55 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 cf2fc8f8b2cbe7ca091fa6a1d6b3b6ec644d7651
Message-ID: <6386cb63.5GXk5i8yb4Qq9n+x%lkp@intel.com>
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
branch HEAD: cf2fc8f8b2cbe7ca091fa6a1d6b3b6ec644d7651  pinctrl: qcom: remove duplicate included header files

elapsed time: 1805m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
arc                                 defconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
alpha                               defconfig
s390                                defconfig
s390                             allmodconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
m68k                             allmodconfig
sh                               allmodconfig
alpha                            allyesconfig
s390                             allyesconfig
arc                              allyesconfig
m68k                             allyesconfig
arc                  randconfig-r043-20221128
x86_64                               rhel-8.3
mips                             allyesconfig
powerpc                          allmodconfig
x86_64                              defconfig
x86_64                           allyesconfig
i386                 randconfig-a002-20221128
i386                 randconfig-a003-20221128
i386                 randconfig-a001-20221128
i386                 randconfig-a004-20221128
i386                 randconfig-a005-20221128
i386                 randconfig-a006-20221128
ia64                             allmodconfig
i386                                defconfig
x86_64               randconfig-a001-20221128
x86_64               randconfig-a003-20221128
x86_64               randconfig-a004-20221128
x86_64               randconfig-a002-20221128
x86_64               randconfig-a005-20221128
x86_64               randconfig-a006-20221128
i386                             allyesconfig
um                             i386_defconfig
um                           x86_64_defconfig
arm                                 defconfig
arm                              allyesconfig
arm64                            allyesconfig

clang tested configs:
hexagon              randconfig-r045-20221128
riscv                randconfig-r042-20221128
s390                 randconfig-r044-20221128
hexagon              randconfig-r041-20221128
x86_64               randconfig-a013-20221128
x86_64               randconfig-a012-20221128
x86_64               randconfig-a014-20221128
x86_64               randconfig-a011-20221128
x86_64               randconfig-a015-20221128
x86_64               randconfig-a016-20221128
i386                 randconfig-a012-20221128
i386                 randconfig-a011-20221128
i386                 randconfig-a015-20221128
i386                 randconfig-a013-20221128
i386                 randconfig-a016-20221128
i386                 randconfig-a014-20221128

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
