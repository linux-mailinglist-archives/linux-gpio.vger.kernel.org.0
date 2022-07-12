Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD7165712E7
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Jul 2022 09:16:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232285AbiGLHQJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Jul 2022 03:16:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229747AbiGLHQI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Jul 2022 03:16:08 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AE2874796
        for <linux-gpio@vger.kernel.org>; Tue, 12 Jul 2022 00:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657610167; x=1689146167;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=vQlaYRgJLbykbfqUJ+kvoPog0mHkICT3XPBbtH+PtNo=;
  b=Y1ax1xRj55dMmvLjN0M7mxA1oPOTrpR0D+thqQjpX2NieO2O4zTwpIrI
   ewknBdlsReLwJkuv6t49bjqmXKs0GQvt2wA+AcUo1DulWEbDh5dklGmlw
   xNSLU7Ks1AHRpyPMSCH8y1d/6xaaBNKivIAfAO/28elGlPCoYwXPxRHAA
   RJINGcY0E14upfMk6nDg/otgC7sDwNsi4ETafcRLOfqRi8KdmRYlJe3ki
   kUjhVM2eVcU+LX2GWwvMXt7UkVe+zSbujarthLmQ+j6w1T012pvCRjVqv
   2WwmB65cqK/lMnN0KArTxzV94m4bZNyI2HVwWkPvB1QJHK9hfG7B3O8/G
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10405"; a="265272029"
X-IronPort-AV: E=Sophos;i="5.92,265,1650956400"; 
   d="scan'208";a="265272029"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2022 00:16:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,265,1650956400"; 
   d="scan'208";a="622396510"
Received: from lkp-server02.sh.intel.com (HELO 8708c84be1ad) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 12 Jul 2022 00:16:04 -0700
Received: from kbuild by 8708c84be1ad with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1oBA7n-0001rT-Fj;
        Tue, 12 Jul 2022 07:16:03 +0000
Date:   Tue, 12 Jul 2022 15:15:59 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 5a65514c718527b95c0155fa24489916c16d42c3
Message-ID: <62cd1faf.MvLnS0+NckG0foK1%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 5a65514c718527b95c0155fa24489916c16d42c3  pinctrl: qcom: spmi-gpio: Add pm8226 compatibility

elapsed time: 1044m

configs tested: 50
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allyesconfig
arm64                            allyesconfig
ia64                             allmodconfig
arc                              allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
sh                               allmodconfig
mips                             allyesconfig
i386                                defconfig
i386                             allyesconfig
alpha                            allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a016
i386                          randconfig-a014
riscv                randconfig-r042-20220710
arc                  randconfig-r043-20220710
s390                 randconfig-r044-20220710
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-syz
x86_64                          rhel-8.3-func
x86_64                               rhel-8.3
x86_64                           allyesconfig

clang tested configs:
x86_64                        randconfig-a005
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64                        randconfig-a012
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
hexagon              randconfig-r041-20220710
hexagon              randconfig-r045-20220710

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
