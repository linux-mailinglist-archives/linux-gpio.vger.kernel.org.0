Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BBE45A915A
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Sep 2022 09:57:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232661AbiIAH5U (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Sep 2022 03:57:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233224AbiIAH5T (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Sep 2022 03:57:19 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 784CFEA8A2
        for <linux-gpio@vger.kernel.org>; Thu,  1 Sep 2022 00:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662019038; x=1693555038;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=sYDKsL8Ygvl8zpqqocLQj344rlLPymhwTdr1AXlWeyc=;
  b=WZYrOiIjHcSIBrJTagJx32w7R7z+aojEI/SRcPCe/chNW05772AMuwcj
   OizZ568kV/7wvfNUurfX5opofX0sjQQkhRGEWw5uRPIpRGsjm7PmzlYB6
   T5bRlODNmwr3Ow/EQQ/V2erA3iV7hwlSfU/DrZeY9M2to2DWPkI3/7xzw
   bT0pJebu3CfJ7lYZWfIY1ZepvmTRZaGOQcG+yyBq72tVc2qECc/NB4HAD
   EhYINLi1Dfdgs2/KLX3pO+SF8SO8AGkUQmaCM/8QcavcA2U5lZUSApJj1
   nYJYOO/0FLgYArMbkah3h5qG4T8gMGuOnExhel4SjwEvQU12PI7mv7rNi
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10456"; a="381942943"
X-IronPort-AV: E=Sophos;i="5.93,280,1654585200"; 
   d="scan'208";a="381942943"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2022 00:57:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,280,1654585200"; 
   d="scan'208";a="612399919"
Received: from lkp-server02.sh.intel.com (HELO b138c9e8658c) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 01 Sep 2022 00:57:16 -0700
Received: from kbuild by b138c9e8658c with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oTf4e-00005l-0L;
        Thu, 01 Sep 2022 07:57:16 +0000
Date:   Thu, 01 Sep 2022 15:56:28 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:davinci/for-next] BUILD SUCCESS
 ed61629e4a165adac7a68f8ee5f717f4f1fefe5b
Message-ID: <631065ac.46jT03Ohd9cIqB7B%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git davinci/for-next
branch HEAD: ed61629e4a165adac7a68f8ee5f717f4f1fefe5b  ARM: davinci: fix repeated words in comments

elapsed time: 721m

configs tested: 87
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                  randconfig-r043-20220831
arc                              allyesconfig
alpha                            allyesconfig
riscv                randconfig-r042-20220831
s390                 randconfig-r044-20220831
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
i386                          randconfig-a001
i386                          randconfig-a003
i386                                defconfig
x86_64                        randconfig-a013
i386                          randconfig-a005
x86_64                        randconfig-a011
x86_64                        randconfig-a015
sh                               allmodconfig
arm                                 defconfig
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
i386                             allyesconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
arm                              allyesconfig
arm64                            allyesconfig
ia64                             allmodconfig
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
sh                   sh7724_generic_defconfig
sparc                       sparc32_defconfig
arc                 nsimosci_hs_smp_defconfig
sh                          rsk7203_defconfig
sh                               alldefconfig
arc                           tb10x_defconfig
arm                       multi_v4t_defconfig
parisc64                            defconfig
powerpc                      cm5200_defconfig
arm                            hisi_defconfig
powerpc                      pcm030_defconfig
sh                   rts7751r2dplus_defconfig
powerpc                     rainier_defconfig
arm                      jornada720_defconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
loongarch                           defconfig
loongarch                         allnoconfig
mips                         cobalt_defconfig
mips                           xway_defconfig
xtensa                         virt_defconfig
powerpc                        warp_defconfig
arm                        multi_v7_defconfig
arm64                            alldefconfig
i386                          randconfig-c001
mips                      loongson3_defconfig
sh                          r7780mp_defconfig
sh                           se7705_defconfig
sh                          lboxre2_defconfig

clang tested configs:
hexagon              randconfig-r041-20220831
hexagon              randconfig-r045-20220831
i386                          randconfig-a002
i386                          randconfig-a004
x86_64                        randconfig-a012
i386                          randconfig-a006
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
arm                         socfpga_defconfig
arm                        vexpress_defconfig
x86_64                        randconfig-k001

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
