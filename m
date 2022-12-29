Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2046658E11
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Dec 2022 15:52:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233575AbiL2Ov7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Dec 2022 09:51:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233595AbiL2Ov2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Dec 2022 09:51:28 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29A6014088
        for <linux-gpio@vger.kernel.org>; Thu, 29 Dec 2022 06:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672325475; x=1703861475;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=eLNlTh6raC/a/PcOdmr8f4v1MxByvCk+I8q7tjt78Gs=;
  b=FMsq9IWkzg3i2SFbQxmVT0Sqzj+LSLnqvaaE+zim+ijqt+88rkL50VqU
   lU+vznup+A7YxDvXs9Qgwo4aPkoLVi6fPRsLlZsNpa57raRYXF06EdlQE
   0VGzFrUeNb40Gi/dm6i8t8vBCaKF2+DFlbNf4knqOnJ40FJkCn9K1fyzf
   Ip88dKfVU+h5sX/HedJ3AFwMlhpHvsnDWRVXF+ETpeBy0uIFTcizdJ21m
   aRqJ50vl4C+qqbAb8N7pzy++DtgCl1O55bfltNlvEdALVFWm+615Obwel
   bcuimEc3mMbtrrmNBIC299bPp2lt+f8VP05yKJ/mmGh3I64SdkjBnsRqu
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10575"; a="323037628"
X-IronPort-AV: E=Sophos;i="5.96,284,1665471600"; 
   d="scan'208";a="323037628"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2022 06:51:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10575"; a="716936595"
X-IronPort-AV: E=Sophos;i="5.96,284,1665471600"; 
   d="scan'208";a="716936595"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 29 Dec 2022 06:51:12 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pAuFT-000GkZ-15;
        Thu, 29 Dec 2022 14:51:11 +0000
Date:   Thu, 29 Dec 2022 22:50:19 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:fixes] BUILD SUCCESS
 5626af8fc4322a972b59c7b1a6760767f7b58d4f
Message-ID: <63ada92b.XT40hUXnPuYIu0kL%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git fixes
branch HEAD: 5626af8fc4322a972b59c7b1a6760767f7b58d4f  pinctrl: sp7021: fix unused function warning

elapsed time: 726m

configs tested: 85
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
alpha                            allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
powerpc                           allnoconfig
um                             i386_defconfig
um                           x86_64_defconfig
i386                 randconfig-a012-20221226
i386                 randconfig-a011-20221226
i386                 randconfig-a013-20221226
i386                 randconfig-a014-20221226
i386                                defconfig
arm                                 defconfig
i386                 randconfig-a016-20221226
i386                 randconfig-a015-20221226
arc                                 defconfig
arm64                            allyesconfig
s390                             allmodconfig
x86_64               randconfig-a014-20221226
alpha                               defconfig
x86_64               randconfig-a013-20221226
arm                              allyesconfig
x86_64               randconfig-a011-20221226
s390                                defconfig
sh                               allmodconfig
x86_64                              defconfig
x86_64               randconfig-a012-20221226
x86_64               randconfig-a015-20221226
x86_64                               rhel-8.3
s390                             allyesconfig
x86_64               randconfig-a016-20221226
x86_64                           allyesconfig
mips                             allyesconfig
powerpc                          allmodconfig
ia64                             allmodconfig
arm                  randconfig-r046-20221225
arc                  randconfig-r043-20221225
arc                  randconfig-r043-20221227
arm                  randconfig-r046-20221227
arc                  randconfig-r043-20221226
riscv                randconfig-r042-20221226
s390                 randconfig-r044-20221226
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-bpf
x86_64                           rhel-8.3-syz
x86_64                            allnoconfig
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
i386                             allyesconfig
i386                             alldefconfig
powerpc                         wii_defconfig
arm                        keystone_defconfig
sh                          rsk7201_defconfig
sh                     sh7710voipgw_defconfig
m68k                        m5307c3_defconfig
arm                             pxa_defconfig
m68k                        m5407c3_defconfig
sh                        dreamcast_defconfig
nios2                         3c120_defconfig
i386                          randconfig-c001

clang tested configs:
x86_64               randconfig-a002-20221226
x86_64               randconfig-a003-20221226
x86_64               randconfig-a006-20221226
i386                 randconfig-a004-20221226
i386                 randconfig-a001-20221226
i386                 randconfig-a003-20221226
x86_64               randconfig-a001-20221226
i386                 randconfig-a002-20221226
x86_64               randconfig-a004-20221226
i386                 randconfig-a006-20221226
x86_64               randconfig-a005-20221226
i386                 randconfig-a005-20221226
hexagon              randconfig-r045-20221225
riscv                randconfig-r042-20221227
hexagon              randconfig-r041-20221225
hexagon              randconfig-r041-20221227
hexagon              randconfig-r041-20221226
arm                  randconfig-r046-20221226
s390                 randconfig-r044-20221225
hexagon              randconfig-r045-20221226
riscv                randconfig-r042-20221225
hexagon              randconfig-r045-20221227
s390                 randconfig-r044-20221227
x86_64                          rhel-8.3-rust

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
