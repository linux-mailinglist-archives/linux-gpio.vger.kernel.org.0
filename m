Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5EB795B43CA
	for <lists+linux-gpio@lfdr.de>; Sat, 10 Sep 2022 04:56:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229552AbiIJC4a (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Sep 2022 22:56:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbiIJC43 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Sep 2022 22:56:29 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E996BC6B5A
        for <linux-gpio@vger.kernel.org>; Fri,  9 Sep 2022 19:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662778587; x=1694314587;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=2DH/Es7FyStI4cUnLQlASx7K5jgWbNAX9B/cu/d9ErE=;
  b=EGAIBHx8RI+zotc8nWwCrgeJW0y5aF8zoazbfXw9WTsYcpaB7brUtV9y
   S89z2UqGNEVGU7MV9+xDuwRBL8VRqafBt5mOvlUjByKmdy7+ss88vF03I
   Sdwn60MVBYD6bhoes9MkaYdL3vZ5FB1sFIXwRi7H12ingvkOjO9DdZ1WF
   wepAy7xAJh3LdjjzE3akqBofFJURIY0XOjyCWWpGggYE7FhvC7AOMGcFZ
   B36NyGDllf2ofrVpxXvssamA0GLWMe9rGnO1fUxThAWKT2CCFa2HDBHP+
   ixfzCJk9IVMVJ/uDxiu5RPBE8Z52MmwtFj/WbLc7eteIx/ZHB6kbxN6Zq
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10465"; a="361561599"
X-IronPort-AV: E=Sophos;i="5.93,304,1654585200"; 
   d="scan'208";a="361561599"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2022 19:56:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,304,1654585200"; 
   d="scan'208";a="592832581"
Received: from lkp-server02.sh.intel.com (HELO b2938d2e5c5a) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 09 Sep 2022 19:56:26 -0700
Received: from kbuild by b2938d2e5c5a with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oWqfR-00022n-2T;
        Sat, 10 Sep 2022 02:56:25 +0000
Date:   Sat, 10 Sep 2022 10:55:57 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 3af20d2723be5f70e1ce818504a4c093a81b21f5
Message-ID: <631bfcbd.wihr4flYxbOYDRGu%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 3af20d2723be5f70e1ce818504a4c093a81b21f5  dt-bindings: gpio: renesas,rcar-gpio: Add r8a779g0 support

elapsed time: 775m

configs tested: 106
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
powerpc                           allnoconfig
um                           x86_64_defconfig
arm                                 defconfig
i386                                defconfig
m68k                             allmodconfig
x86_64                              defconfig
arc                              allyesconfig
x86_64                               rhel-8.3
sh                               allmodconfig
alpha                            allyesconfig
powerpc                          allmodconfig
m68k                             allyesconfig
arm64                            allyesconfig
arc                  randconfig-r043-20220909
i386                          randconfig-a001
i386                             allyesconfig
x86_64                           rhel-8.3-kvm
mips                             allyesconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a004
arm                              allyesconfig
x86_64                          rhel-8.3-func
x86_64                        randconfig-a011
x86_64                           allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                        randconfig-a002
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
i386                          randconfig-a003
x86_64                        randconfig-a015
x86_64                        randconfig-a006
i386                          randconfig-a005
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
sh                             espt_defconfig
riscv             nommu_k210_sdcard_defconfig
arm                            mps2_defconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
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
ia64                             allmodconfig
mips                     decstation_defconfig
sh                         ecovec24_defconfig
sh                           se7712_defconfig

clang tested configs:
hexagon              randconfig-r041-20220909
s390                 randconfig-r044-20220909
hexagon              randconfig-r045-20220909
riscv                randconfig-r042-20220909
x86_64                        randconfig-a012
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a014
x86_64                        randconfig-a003
i386                          randconfig-a002
x86_64                        randconfig-a016
i386                          randconfig-a013
i386                          randconfig-a004
i386                          randconfig-a006
i386                          randconfig-a011
i386                          randconfig-a015
x86_64                        randconfig-k001
riscv                randconfig-r042-20220907
hexagon              randconfig-r041-20220907
hexagon              randconfig-r045-20220907
s390                 randconfig-r044-20220907
hexagon              randconfig-r041-20220908
hexagon              randconfig-r045-20220908

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
