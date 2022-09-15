Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 347E35B9244
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Sep 2022 03:43:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229890AbiIOBnN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Sep 2022 21:43:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229767AbiIOBnM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Sep 2022 21:43:12 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B3D58E0E1
        for <linux-gpio@vger.kernel.org>; Wed, 14 Sep 2022 18:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663206192; x=1694742192;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=N8uumNrv4a8UZ6+nbrN7YZcT70usUg44Dmi1v2e2lvw=;
  b=Hajyr90EiWv1gOUd2j7uy85GVYuX/fvml8f8CP36Q9HwFj6F8Q8e7aao
   pTjtSriLIjwIhlU3gz3z4Lm27KyY/P9x8s5BO6FpPRuvYGFIafboK5VHX
   ucruBj0+E7KONEKXEZpuuCYLWZH5Y4n2RQ7FC0/qtxayk1n6hNRjqzSwx
   lnuFWoTMiJsUA3RGR08AyodeaGwapBQlj/sP6N5eV6AZQjUkIWxA0I2K3
   jvFvWAN/TAP0j+o/SNYztF38vmLDA9uiQyYyN/vxOxEuipg5CP5QfycOS
   DpabWOcLyZ5JS3rlSowubtGTKfZ4LKQyHRE6Ro4Ct+IWIuAerNzzyIt48
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10470"; a="299946044"
X-IronPort-AV: E=Sophos;i="5.93,316,1654585200"; 
   d="scan'208";a="299946044"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2022 18:43:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,316,1654585200"; 
   d="scan'208";a="706164175"
Received: from lkp-server01.sh.intel.com (HELO d6e6b7c4e5a2) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 14 Sep 2022 18:43:06 -0700
Received: from kbuild by d6e6b7c4e5a2 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oYduE-0000mT-0c;
        Thu, 15 Sep 2022 01:43:06 +0000
Date:   Thu, 15 Sep 2022 09:42:56 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 92858eb6cb64cfafdc2b35c942d1812275f4205a
Message-ID: <63228320.sOEiX1t5UbRMxT0Z%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 92858eb6cb64cfafdc2b35c942d1812275f4205a  dt-bindings: pinctrl: update bindings for MT7986 SoC

elapsed time: 722m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
alpha                               defconfig
s390                             allmodconfig
s390                                defconfig
um                             i386_defconfig
um                           x86_64_defconfig
s390                             allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
powerpc                           allnoconfig
arc                              allyesconfig
arm                                 defconfig
x86_64                           allyesconfig
alpha                            allyesconfig
i386                                defconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a012
m68k                             allyesconfig
x86_64                        randconfig-a006
m68k                             allmodconfig
arm                              allyesconfig
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a016
arm64                            allyesconfig
i386                          randconfig-a014
i386                          randconfig-a005
i386                             allyesconfig
x86_64                           rhel-8.3-kvm
sh                               allmodconfig
x86_64                    rhel-8.3-kselftests
arc                  randconfig-r043-20220914
x86_64                           rhel-8.3-syz
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                        randconfig-a015
powerpc                          allmodconfig
x86_64                        randconfig-a013
mips                             allyesconfig
x86_64                        randconfig-a011
ia64                             allmodconfig

clang tested configs:
i386                          randconfig-a013
i386                          randconfig-a011
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a002
i386                          randconfig-a015
i386                          randconfig-a006
hexagon              randconfig-r041-20220914
i386                          randconfig-a004
riscv                randconfig-r042-20220914
s390                 randconfig-r044-20220914
hexagon              randconfig-r045-20220914
x86_64                        randconfig-a014
x86_64                        randconfig-a012
x86_64                        randconfig-a016

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
