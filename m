Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0F8160EA42
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Oct 2022 22:29:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234173AbiJZU3O (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Oct 2022 16:29:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233491AbiJZU3N (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Oct 2022 16:29:13 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4B36103DBA
        for <linux-gpio@vger.kernel.org>; Wed, 26 Oct 2022 13:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666816152; x=1698352152;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=LqEqYgcAT/bYGK25v4tK4rOA3cscJDAegSAQ9jNVsT0=;
  b=H1e/5jHNNMWbm5AOWlFPEsl/dXz/y314amRYreKHFP6ZpsuZH3SLk5dm
   L6Ph1pEsNVydlkzqNfZeyLutIFEO/ZSw4tPbrRvy9J6py7z1f9/xnizX2
   /MuqP0ZD+CS65XxPOxeMJ8eFwnstEgogDH1fehCOau5ZBgccRPvw2ogxH
   6JVOW3ZKXOT15X4y8ee8ErTU7kUOqLnWYnF8E1fKLGDbA9dYrNeSVytKM
   H442lqyEQBasvOiq+PG4r0XGZagyIefafDjPspDXj9VeoOl+2i7YT72Si
   kBDGvLVr8/nRmbp7Ho4p/sn7m4ZbMGaCSJ41j+LRozDF+q+2khV81bBzk
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="334676169"
X-IronPort-AV: E=Sophos;i="5.95,215,1661842800"; 
   d="scan'208";a="334676169"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2022 13:29:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="961367785"
X-IronPort-AV: E=Sophos;i="5.95,215,1661842800"; 
   d="scan'208";a="961367785"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 26 Oct 2022 13:29:11 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1onn1S-0007p0-2V;
        Wed, 26 Oct 2022 20:29:10 +0000
Date:   Thu, 27 Oct 2022 04:28:41 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 76f3768132eab2c26c9d67022b452358adc28b2c
Message-ID: <63599879.Cij9rSBHTnVhqz6a%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 76f3768132eab2c26c9d67022b452358adc28b2c  Merge tag 'intel-pinctrl-v6.1-2' of git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel into devel

elapsed time: 723m

configs tested: 92
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
s390                             allyesconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
ia64                             allmodconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
riscv                randconfig-r042-20221026
arc                  randconfig-r043-20221026
x86_64                        randconfig-a002
arm                                 defconfig
s390                 randconfig-r044-20221026
x86_64                           rhel-8.3-syz
i386                                defconfig
i386                          randconfig-a001
x86_64                        randconfig-a004
i386                          randconfig-a003
x86_64                        randconfig-a006
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
i386                 randconfig-a011-20221024
powerpc                          allmodconfig
i386                 randconfig-a014-20221024
mips                             allyesconfig
i386                          randconfig-a005
powerpc                           allnoconfig
i386                 randconfig-a013-20221024
arm                              allyesconfig
i386                 randconfig-a012-20221024
i386                 randconfig-a015-20221024
i386                 randconfig-a016-20221024
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allyesconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                             allyesconfig
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
sh                               allmodconfig
xtensa                         virt_defconfig
arm                          exynos_defconfig
arm                            qcom_defconfig
powerpc                       ppc64_defconfig
ia64                                defconfig
m68k                           virt_defconfig
mips                            gpr_defconfig
arm64                            allyesconfig
m68k                       m5475evb_defconfig
powerpc                 mpc837x_mds_defconfig
sh                 kfr2r09-romimage_defconfig
sh                          sdk7780_defconfig
sparc                               defconfig
arc                              alldefconfig
arm                            pleb_defconfig
mips                      maltasmvp_defconfig
powerpc                    amigaone_defconfig
sh                           se7724_defconfig
sh                          rsk7201_defconfig
i386                          randconfig-c001
mips                 randconfig-c004-20221026
powerpc                         wii_defconfig
arm                        multi_v7_defconfig
arc                           tb10x_defconfig
m68k                          sun3x_defconfig
powerpc                      ppc6xx_defconfig
arm                        keystone_defconfig
powerpc                     stx_gp3_defconfig
arm                         axm55xx_defconfig
powerpc                     redwood_defconfig
sh                      rts7751r2d1_defconfig
mips                        vocore2_defconfig

clang tested configs:
hexagon              randconfig-r041-20221026
hexagon              randconfig-r045-20221026
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a002
x86_64                        randconfig-a005
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
