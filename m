Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53B69656972
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Dec 2022 11:25:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229550AbiL0KY7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Dec 2022 05:24:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229824AbiL0KY2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Dec 2022 05:24:28 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EA01A198
        for <linux-gpio@vger.kernel.org>; Tue, 27 Dec 2022 02:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672136663; x=1703672663;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=WXxspvfFurjWgZ9FGrUHpwYzzEFIPplmUQp+AWmkt3Y=;
  b=UYC3pEWbbW/CIUALS3OqrlzgbfWyaxbi6jV0mLKdqUu4Yu0qQI4xk3ir
   1AWs0Cirb87PKOKXzSHi5pbl/zmlx2JQARab6VgKPCxo0vTHxjnaPOJ+3
   Q0bnfuD+tk8hH25cJqBoS2+4yp7s9xBrH4W0JFsLWDDQPGEV5DOMqRL14
   U1sbQUpbEfYwWz/luTUqg1Dgp61Vu5j8bq0Qxh4E+CQuRPodxWwPrHV6M
   Ct93Q2+UH0RXHayVdzUcSpB+Vl5SNVipZ4FAN5ffbWjYtVxvVtFVhuSZJ
   9DJNKD4DGzA/H1b/VDxHF8Mu5P4/pGbTbUMkc0yXlgVdvUQb6DhJxDfHN
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10572"; a="300367481"
X-IronPort-AV: E=Sophos;i="5.96,278,1665471600"; 
   d="scan'208";a="300367481"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2022 02:24:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10572"; a="653001061"
X-IronPort-AV: E=Sophos;i="5.96,278,1665471600"; 
   d="scan'208";a="653001061"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 27 Dec 2022 02:24:21 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pA788-000Eyf-2t;
        Tue, 27 Dec 2022 10:24:20 +0000
Date:   Tue, 27 Dec 2022 18:23:21 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:davinci/for-next] BUILD SUCCESS
 84bde55c050b2ca6b1a71ba8bc322a7813ea475d
Message-ID: <63aac799.VdWpZyg3dBDoFZoR%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git davinci/for-next
branch HEAD: 84bde55c050b2ca6b1a71ba8bc322a7813ea475d  ARM: davinci: fix repeated words in comments

elapsed time: 724m

configs tested: 103
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                            allnoconfig
um                           x86_64_defconfig
um                             i386_defconfig
i386                 randconfig-a012-20221226
x86_64                           rhel-8.3-bpf
x86_64                              defconfig
i386                 randconfig-a011-20221226
x86_64               randconfig-a014-20221226
x86_64                           rhel-8.3-syz
i386                 randconfig-a013-20221226
x86_64                         rhel-8.3-kunit
x86_64               randconfig-a013-20221226
i386                 randconfig-a014-20221226
ia64                             allmodconfig
powerpc                           allnoconfig
mips                             allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-kvm
i386                 randconfig-a016-20221226
x86_64                          rhel-8.3-func
arc                                 defconfig
i386                 randconfig-a015-20221226
sh                               allmodconfig
alpha                               defconfig
s390                                defconfig
x86_64               randconfig-a011-20221226
s390                             allmodconfig
s390                             allyesconfig
mips                     decstation_defconfig
x86_64               randconfig-a012-20221226
x86_64                               rhel-8.3
x86_64               randconfig-a015-20221226
x86_64               randconfig-a016-20221226
powerpc                          allmodconfig
mips                  maltasmvp_eva_defconfig
m68k                             allmodconfig
arm                                 defconfig
alpha                            allyesconfig
m68k                             allyesconfig
arm64                            allyesconfig
arc                              allyesconfig
arm                              allyesconfig
arm                  randconfig-r046-20221225
arc                  randconfig-r043-20221225
arc                  randconfig-r043-20221227
arm                  randconfig-r046-20221227
i386                                defconfig
arc                  randconfig-r043-20221226
riscv                randconfig-r042-20221226
x86_64                           allyesconfig
s390                 randconfig-r044-20221226
arm                          exynos_defconfig
arm                       omap2plus_defconfig
arm                             rpc_defconfig
sh                  sh7785lcr_32bit_defconfig
powerpc                mpc7448_hpc2_defconfig
arm                           stm32_defconfig
arm                        spear6xx_defconfig
s390                       zfcpdump_defconfig
i386                             allyesconfig
sh                ecovec24-romimage_defconfig
arm                         lpc18xx_defconfig
m68k                                defconfig
powerpc                     tqm8541_defconfig
ia64                        generic_defconfig
powerpc                 mpc837x_mds_defconfig
i386                          randconfig-c001
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3

clang tested configs:
x86_64                          rhel-8.3-rust
i386                 randconfig-a004-20221226
i386                 randconfig-a001-20221226
i386                 randconfig-a003-20221226
i386                 randconfig-a002-20221226
i386                 randconfig-a006-20221226
i386                 randconfig-a005-20221226
s390                             alldefconfig
x86_64               randconfig-a002-20221226
mips                      maltaaprp_defconfig
x86_64               randconfig-a003-20221226
x86_64               randconfig-a001-20221226
x86_64               randconfig-a004-20221226
x86_64               randconfig-a005-20221226
hexagon              randconfig-r045-20221225
hexagon              randconfig-r041-20221225
x86_64               randconfig-a006-20221226
hexagon              randconfig-r041-20221227
hexagon              randconfig-r041-20221226
arm                  randconfig-r046-20221226
s390                 randconfig-r044-20221225
hexagon              randconfig-r045-20221226
riscv                randconfig-r042-20221225
hexagon              randconfig-r045-20221227
hexagon                          alldefconfig
riscv                randconfig-r042-20221227
s390                 randconfig-r044-20221227
mips                        qi_lb60_defconfig
powerpc                     pseries_defconfig
x86_64                        randconfig-k001

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
