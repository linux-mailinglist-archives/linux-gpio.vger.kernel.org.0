Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99B905ABE9F
	for <lists+linux-gpio@lfdr.de>; Sat,  3 Sep 2022 13:06:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229923AbiICLGZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 3 Sep 2022 07:06:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229504AbiICLGY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 3 Sep 2022 07:06:24 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA9165B04A
        for <linux-gpio@vger.kernel.org>; Sat,  3 Sep 2022 04:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662203183; x=1693739183;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=FntPQx//pAMoCQqZgQv+xQznJoY6TaKpJ8nyLQIR82Q=;
  b=SlECpkSKZJFIAg06jE3S3YYjCLYeHJyHHAPr4M1G7O0p7WJ6UinWq3hu
   irTlLJime950BA4B30vaPu7iFWBuVYkh9+jd4v+qhZJY+cxahNp4thMhn
   gccejRohXsCeuo0v0HIJLUwCkY6P9GI+zsBVvOMMuhu1RfkUIcPxe1/4R
   YW/Hq6/dr1hFae0XDspzQLUFz2yFYcGzw96KWsPA2GibWW72m9XqZEI22
   fM5G3bvKKDak5fqR4J+G76DaxsXhQYf6qg+8j2627UhWmR8NFNp5pUKF3
   9CjTTTL35OthlfcU8JPpqM073nBQSBo18n+0StiBAaAt0qG9XezPiYZq9
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10458"; a="357864927"
X-IronPort-AV: E=Sophos;i="5.93,287,1654585200"; 
   d="scan'208";a="357864927"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2022 04:06:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,287,1654585200"; 
   d="scan'208";a="564235615"
Received: from lkp-server02.sh.intel.com (HELO 95dfd251caa2) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 03 Sep 2022 04:06:22 -0700
Received: from kbuild by 95dfd251caa2 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oUQyj-0001XB-1W;
        Sat, 03 Sep 2022 11:06:21 +0000
Date:   Sat, 03 Sep 2022 19:06:08 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 4e743cfcffa88e7cc2456e1f9fccbff8bbdfec0d
Message-ID: <63133520.Pxz43Lq5byPfKaw0%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 4e743cfcffa88e7cc2456e1f9fccbff8bbdfec0d  Merge branch 'devel' into for-next

elapsed time: 745m

configs tested: 85
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                  randconfig-r043-20220901
i386                          randconfig-a001
x86_64                        randconfig-a013
powerpc                          allmodconfig
x86_64                              defconfig
x86_64                        randconfig-a004
i386                          randconfig-a003
x86_64                        randconfig-a011
x86_64                        randconfig-a002
i386                                defconfig
i386                          randconfig-a005
sh                               allmodconfig
i386                          randconfig-a014
x86_64                               rhel-8.3
x86_64                        randconfig-a015
mips                             allyesconfig
x86_64                        randconfig-a006
i386                          randconfig-a012
powerpc                           allnoconfig
i386                          randconfig-a016
x86_64                           allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
arc                              alldefconfig
i386                             allyesconfig
sh                           sh2007_defconfig
m68k                             allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
arc                               allnoconfig
alpha                             allnoconfig
csky                              allnoconfig
riscv                             allnoconfig
i386                             alldefconfig
powerpc                 mpc85xx_cds_defconfig
m68k                        mvme16x_defconfig
arm                        multi_v7_defconfig
sh                           se7619_defconfig
loongarch                 loongson3_defconfig
sh                      rts7751r2d1_defconfig
arc                        nsim_700_defconfig
arm                          simpad_defconfig
arm                           sunxi_defconfig
arm                           sama5_defconfig
sparc64                             defconfig
sh                         microdev_defconfig
i386                          randconfig-c001
mips                 randconfig-c004-20220901
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
powerpc                    adder875_defconfig
powerpc                       ppc64_defconfig
mips                            ar7_defconfig
mips                    maltaup_xpa_defconfig
mips                           jazz_defconfig
um                               alldefconfig
mips                      loongson3_defconfig
arm                           tegra_defconfig
ia64                             allmodconfig

clang tested configs:
hexagon              randconfig-r045-20220901
hexagon              randconfig-r041-20220901
riscv                randconfig-r042-20220901
i386                          randconfig-a013
s390                 randconfig-r044-20220901
i386                          randconfig-a015
i386                          randconfig-a002
x86_64                        randconfig-a016
x86_64                        randconfig-a005
i386                          randconfig-a006
x86_64                        randconfig-a012
x86_64                        randconfig-a001
i386                          randconfig-a004
i386                          randconfig-a011
x86_64                        randconfig-a014
x86_64                        randconfig-a003
arm                         mv78xx0_defconfig
arm                          ixp4xx_defconfig
powerpc                      walnut_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
