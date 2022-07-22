Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66DD157E781
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Jul 2022 21:37:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233585AbiGVThn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Jul 2022 15:37:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236441AbiGVThi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Jul 2022 15:37:38 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AA10528A8
        for <linux-gpio@vger.kernel.org>; Fri, 22 Jul 2022 12:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658518657; x=1690054657;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=VYGNykbd0Bb/WAmBQV+BxrL1XZwweYnOMQxtzz/+HtE=;
  b=FLQreRxix/2pDiDOA5WdbCg7kxMniji+4Rlh8RBeJRtmNmpxTLuo4Tk7
   bw+yVH/Zk2o9Z6sSMmp6P3Afs6XYhGtJsEz66vF9OmnhiMrHDog2e/m+F
   SW1i5fBX1jOivnsxO/ZAN2NF8ZKT2FlDJmQZ7SYsrCRyUnHcfX7AwJKJr
   VZ/n5S0nQlkZo7inpWbcw+5+4F4bzplWJBSNmJSIuew9Je4gkm1YG30nG
   UG759EJihahMeO7QtgQir/psa6iQlCIfYNbTunIK8p+UnuvIUjf8aGXIV
   3pe6SpiVDSuOUtThFIEDpbhwFuIP9m0uNAjKqj+J5Tr1oJzYGJgxn9M27
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10416"; a="288147461"
X-IronPort-AV: E=Sophos;i="5.93,186,1654585200"; 
   d="scan'208";a="288147461"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2022 12:37:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,186,1654585200"; 
   d="scan'208";a="725522185"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 22 Jul 2022 12:37:35 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oEySt-0001l9-0O;
        Fri, 22 Jul 2022 19:37:35 +0000
Date:   Sat, 23 Jul 2022 03:36:52 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 a0a2d10aad65afb1558d7b8ad5770dff75493d45
Message-ID: <62dafc54.X4aKciokPrHOCAHv%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: a0a2d10aad65afb1558d7b8ad5770dff75493d45  MAINTAINERS: Update Intel 8255 GPIO driver file list

elapsed time: 722m

configs tested: 111
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-c001
powerpc              randconfig-c003-20220722
sh                   sh7724_generic_defconfig
csky                                defconfig
powerpc                 mpc85xx_cds_defconfig
mips                     loongson1b_defconfig
sh                               j2_defconfig
arc                          axs101_defconfig
alpha                               defconfig
mips                         cobalt_defconfig
arm                      jornada720_defconfig
m68k                             allyesconfig
arm                        realview_defconfig
m68k                          atari_defconfig
parisc                              defconfig
arc                      axs103_smp_defconfig
sh                        apsh4ad0a_defconfig
csky                             alldefconfig
mips                           ip32_defconfig
arm                            xcep_defconfig
arm                           h5000_defconfig
mips                         db1xxx_defconfig
mips                            ar7_defconfig
loongarch                           defconfig
m68k                            mac_defconfig
nios2                         10m50_defconfig
sh                               alldefconfig
powerpc                     tqm8555_defconfig
powerpc                    amigaone_defconfig
arm                     eseries_pxa_defconfig
sh                        edosk7760_defconfig
sh                          rsk7203_defconfig
arc                        vdk_hs38_defconfig
powerpc                   currituck_defconfig
mips                      maltasmvp_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                              debian-10.3
i386                   debian-10.3-kselftests
loongarch                         allnoconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220721
arm                  randconfig-c002-20220722
ia64                             allmodconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
i386                             allyesconfig
i386                                defconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
arc                  randconfig-r043-20220721
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit

clang tested configs:
arm                         s3c2410_defconfig
arm                          ixp4xx_defconfig
powerpc                  mpc866_ads_defconfig
powerpc                          allyesconfig
powerpc                     akebono_defconfig
powerpc                    mvme5100_defconfig
mips                      malta_kvm_defconfig
arm                                 defconfig
arm                           spitz_defconfig
arm                          pxa168_defconfig
i386                             allyesconfig
x86_64                        randconfig-k001
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a013
i386                          randconfig-a015
i386                          randconfig-a011
hexagon              randconfig-r041-20220721
s390                 randconfig-r044-20220721
hexagon              randconfig-r045-20220721
riscv                randconfig-r042-20220721
hexagon              randconfig-r041-20220722
hexagon              randconfig-r045-20220722

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
