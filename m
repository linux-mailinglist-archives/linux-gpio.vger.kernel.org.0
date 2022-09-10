Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BE3D5B43CC
	for <lists+linux-gpio@lfdr.de>; Sat, 10 Sep 2022 05:09:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229690AbiIJDJh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Sep 2022 23:09:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229585AbiIJDJf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Sep 2022 23:09:35 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4AF510C8
        for <linux-gpio@vger.kernel.org>; Fri,  9 Sep 2022 20:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662779372; x=1694315372;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=DX7DyZ7u5FtuvXtQW0P9dsRD1geZAvHw08iuNmeZ5uQ=;
  b=W81gOO3K4oXIbTtHx7KLZ7rCeAsG9J4BzgnakkhjF2Ih7NpFLL4Hrkqp
   LBzhSIaPv+z9jZvPRpO2yKn11IsqOI6Dcix8DfZjFjWHO0RK8JOBLPDIf
   Bwg8pzmqSUrd3r5LR4jcLzKxWLUvggDUar64YCT3UlhrZIpCXnz34lPc8
   vFcW4rC9rFMYY0onMZOzkOYM3g5oFnrx+6z+SMO6/TLqUi5oS9KD4BIiG
   3Ve/2WZCq8RM5L1nV24KVknc0c+PrANDigcsuXPR/VUCpEgkEuC+ATaE9
   b/fAE3QCrSnx9tLtx9D3a3fgZGwOU7ETkT65Whu7W7K2FjK1apchJovLe
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10465"; a="297610375"
X-IronPort-AV: E=Sophos;i="5.93,304,1654585200"; 
   d="scan'208";a="297610375"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2022 20:09:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,304,1654585200"; 
   d="scan'208";a="791012259"
Received: from lkp-server02.sh.intel.com (HELO b2938d2e5c5a) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 09 Sep 2022 20:09:31 -0700
Received: from kbuild by b2938d2e5c5a with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oWqs6-00023V-1O;
        Sat, 10 Sep 2022 03:09:30 +0000
Date:   Sat, 10 Sep 2022 11:08:34 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 826e0f2b3ba952bbcf54e0d616f8af29743d2c76
Message-ID: <631bffb2.eofK3m2ZzE6qm5BL%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: 826e0f2b3ba952bbcf54e0d616f8af29743d2c76  MAINTAINERS: Update HiSilicon GPIO Driver maintainer

elapsed time: 788m

configs tested: 108
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
i386                                defconfig
arm                                 defconfig
x86_64                           allyesconfig
arm                              allyesconfig
i386                             allyesconfig
arm64                            allyesconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a001
i386                          randconfig-a003
x86_64                        randconfig-a006
i386                          randconfig-a005
x86_64                        randconfig-a013
x86_64                        randconfig-a011
arc                  randconfig-r043-20220908
x86_64                        randconfig-a015
s390                 randconfig-r044-20220908
riscv                randconfig-r042-20220908
i386                          randconfig-a014
x86_64                          rhel-8.3-func
i386                          randconfig-a012
x86_64                         rhel-8.3-kunit
i386                          randconfig-a016
x86_64                           rhel-8.3-kvm
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
m68k                             allmodconfig
powerpc                           allnoconfig
arc                              allyesconfig
mips                             allyesconfig
alpha                            allyesconfig
powerpc                          allmodconfig
m68k                             allyesconfig
sh                               allmodconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
sh                             espt_defconfig
riscv             nommu_k210_sdcard_defconfig
arm                            mps2_defconfig
powerpc                      ppc40x_defconfig
arm                         axm55xx_defconfig
mips                         db1xxx_defconfig
arm                            zeus_defconfig
parisc                              defconfig
sh                     sh7710voipgw_defconfig
arm                        keystone_defconfig
x86_64                           alldefconfig
xtensa                    xip_kc705_defconfig
mips                    maltaup_xpa_defconfig
mips                      maltasmvp_defconfig
i386                          randconfig-c001
m68k                        m5407c3_defconfig
nios2                         3c120_defconfig
loongarch                           defconfig
loongarch                         allnoconfig
arm                         cm_x300_defconfig
powerpc                    klondike_defconfig
arm                          badge4_defconfig
mips                      fuloong2e_defconfig
s390                       zfcpdump_defconfig
mips                        bcm47xx_defconfig
arm                            pleb_defconfig
riscv                               defconfig
nios2                         10m50_defconfig
powerpc                 mpc837x_rdb_defconfig
arc                              alldefconfig
sh                              ul2_defconfig
arm                           sunxi_defconfig
arm                          exynos_defconfig
sh                   secureedge5410_defconfig
arm                         lubbock_defconfig
sh                          rsk7264_defconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
mips                     decstation_defconfig
sh                         ecovec24_defconfig
sh                           se7712_defconfig
ia64                             allmodconfig

clang tested configs:
x86_64                        randconfig-a001
i386                          randconfig-a002
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
i386                          randconfig-a006
hexagon              randconfig-r041-20220908
hexagon              randconfig-r045-20220908
x86_64                        randconfig-a016
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
riscv                randconfig-r042-20220909
hexagon              randconfig-r041-20220909
hexagon              randconfig-r045-20220909
s390                 randconfig-r044-20220909
x86_64                        randconfig-k001
riscv                randconfig-r042-20220907
hexagon              randconfig-r041-20220907
hexagon              randconfig-r045-20220907
s390                 randconfig-r044-20220907

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
