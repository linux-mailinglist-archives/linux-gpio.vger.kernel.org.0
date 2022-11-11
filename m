Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E9856254D8
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Nov 2022 09:04:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231625AbiKKIEF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Nov 2022 03:04:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231221AbiKKIEE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Nov 2022 03:04:04 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02DFD12AEA
        for <linux-gpio@vger.kernel.org>; Fri, 11 Nov 2022 00:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668153842; x=1699689842;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=+WswOLJKoR1N0FHknphnF7SS+4yma4HENKWGAS38dPc=;
  b=TCH1nb20g2MIP9FEvA/+87TmXJ2vbowLczTkztb+SBQVQmgd9o9VelWT
   ajBpCrbe/TDcgmWLilPK3TmjMxSNMaebKnDRHoI3iVOjZS9iPgCIAHXNv
   6wkXGwKvd5pGjt07quhM+3/sBfzyyl3vYsDuZ1/0/IiBcY0/laM/lOS7s
   2mzNw23qTvMT1Kf30xAFfeIwwiQUtnoW4jZnKsbOELS46H1mBrcSufiA+
   wsI1m+cLvNhWaR6rB7x4CJvIawqtRiHoYK2xqGZJakEidXl08ViCNRgJM
   FZLd2BU/E3zcFjSrkrPWyQGsFk8XTtNYbrez1PPINryRWSLoBOYneS/IZ
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="312697402"
X-IronPort-AV: E=Sophos;i="5.96,156,1665471600"; 
   d="scan'208";a="312697402"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2022 00:04:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="668737932"
X-IronPort-AV: E=Sophos;i="5.96,156,1665471600"; 
   d="scan'208";a="668737932"
Received: from lkp-server01.sh.intel.com (HELO e783503266e8) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 11 Nov 2022 00:03:59 -0800
Received: from kbuild by e783503266e8 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1otP14-0003kP-2s;
        Fri, 11 Nov 2022 08:03:58 +0000
Date:   Fri, 11 Nov 2022 16:03:10 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 8dab99c9eab3162bfb4326c35579a3388dbf68f2
Message-ID: <636e01be.IjVH1KLnpaicIU5d%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 8dab99c9eab3162bfb4326c35579a3388dbf68f2  gpio: davinci: add support of module build

elapsed time: 724m

configs tested: 75
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
s390                             allyesconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                            allnoconfig
alpha                            allyesconfig
ia64                             allmodconfig
arc                              allyesconfig
powerpc                           allnoconfig
mips                             allyesconfig
i386                                defconfig
powerpc                          allmodconfig
arc                        nsimosci_defconfig
sh                               allmodconfig
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
powerpc                       ppc64_defconfig
arm                          pxa910_defconfig
m68k                             allyesconfig
m68k                             allmodconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
s390                 randconfig-r044-20221111
sh                   secureedge5410_defconfig
powerpc                 mpc837x_rdb_defconfig
xtensa                    xip_kc705_defconfig
xtensa                          iss_defconfig
powerpc                 mpc834x_mds_defconfig
sh                           se7724_defconfig
parisc                           alldefconfig
powerpc                    amigaone_defconfig
arm                           viper_defconfig
i386                             allyesconfig
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
microblaze                          defconfig
i386                          randconfig-c001
powerpc              randconfig-c003-20221110
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
arc                           tb10x_defconfig
sh                         apsh4a3a_defconfig
powerpc              randconfig-c003-20221111

clang tested configs:
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a002
i386                          randconfig-a006
s390                 randconfig-r044-20221110
riscv                randconfig-r042-20221110
hexagon              randconfig-r041-20221110
hexagon              randconfig-r045-20221110
arm                       aspeed_g4_defconfig
mips                      pic32mzda_defconfig
arm                         lpc32xx_defconfig
powerpc                      obs600_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
