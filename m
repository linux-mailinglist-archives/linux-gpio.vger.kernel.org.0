Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E8A963CD1C
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Nov 2022 03:06:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229580AbiK3CGl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Nov 2022 21:06:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbiK3CGk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Nov 2022 21:06:40 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDF97716FD
        for <linux-gpio@vger.kernel.org>; Tue, 29 Nov 2022 18:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669773999; x=1701309999;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=oPGq8Jul0suHQmVcbnSH4ft21OW0GcIfAtJkETO2z3M=;
  b=nRvArFvA8QRt+VnFYFAaqBEg3VcrUzYVBWBCIMbBPpbAg+Rkvwl9XU79
   TGuZ04m0luUQNOZxD5Nrjt2WvqCr3RH99dpnWdl5GqhSmRdNBjH7uedsD
   ECe72nd6y5DFNBGG3ITx5Ky80I9p9dpfFXD3yOuvkTSPNxQD7/QPKro0C
   xtu1M6z7I5AMct4JznaUGVBtffhiGeibrPBWaDAMiOlR9e3Rzmthlv5Pu
   CjWJdOm1XCY4G39YJbZUxhlOjE5Ht/t+Pcd7FXQ3Juku1/8Tadwo0VQVV
   yMaI/D9VTSpTUkOCV3R7ejsHfFe3nk3X8LuDq6CjazjaDTfi9Mdm93Pyt
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10546"; a="401565372"
X-IronPort-AV: E=Sophos;i="5.96,204,1665471600"; 
   d="scan'208";a="401565372"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2022 18:06:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10546"; a="644030014"
X-IronPort-AV: E=Sophos;i="5.96,204,1665471600"; 
   d="scan'208";a="644030014"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 29 Nov 2022 18:06:37 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1p0CUf-0009Ml-09;
        Wed, 30 Nov 2022 02:06:37 +0000
Date:   Wed, 30 Nov 2022 10:06:23 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:fixes] BUILD SUCCESS
 6989ea4881c8944fbf04378418bb1af63d875ef8
Message-ID: <6386ba9f.InbAH5F1nWwtxWj6%lkp@intel.com>
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
branch HEAD: 6989ea4881c8944fbf04378418bb1af63d875ef8  pinctrl: intel: Save and restore pins in "direct IRQ" mode

elapsed time: 1733m

configs tested: 56
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
s390                             allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-kvm
powerpc                           allnoconfig
powerpc                          allmodconfig
mips                             allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
sh                               allmodconfig
alpha                            allyesconfig
arc                  randconfig-r043-20221128
x86_64                              defconfig
i386                 randconfig-a002-20221128
i386                 randconfig-a003-20221128
i386                 randconfig-a001-20221128
i386                 randconfig-a004-20221128
i386                 randconfig-a005-20221128
ia64                             allmodconfig
i386                 randconfig-a006-20221128
x86_64                               rhel-8.3
x86_64                           allyesconfig
i386                                defconfig
i386                             allyesconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
arm                                 defconfig

clang tested configs:
hexagon              randconfig-r045-20221128
riscv                randconfig-r042-20221128
hexagon              randconfig-r041-20221128
s390                 randconfig-r044-20221128
x86_64               randconfig-a012-20221128
x86_64               randconfig-a014-20221128
x86_64               randconfig-a011-20221128
x86_64               randconfig-a013-20221128
x86_64               randconfig-a016-20221128
x86_64               randconfig-a015-20221128
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                 randconfig-a012-20221128
i386                 randconfig-a015-20221128
i386                 randconfig-a011-20221128
i386                 randconfig-a013-20221128
i386                 randconfig-a016-20221128
i386                 randconfig-a014-20221128

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
