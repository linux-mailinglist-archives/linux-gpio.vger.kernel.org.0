Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA4F15A1E56
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Aug 2022 03:48:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244598AbiHZBsq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Aug 2022 21:48:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244595AbiHZBsp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Aug 2022 21:48:45 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E62FDC7BA9
        for <linux-gpio@vger.kernel.org>; Thu, 25 Aug 2022 18:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661478523; x=1693014523;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ohbesWMMQKmfg/+OawVUwdV+Ute97yaPImpb5eiSVLM=;
  b=oFhJOW7XUvOCQh7n6X218K0tbsLhHt+EHfiFkXTVFfKkOi1sf7STeX6H
   z1JzEzt7j/cFrcgw0i0DwrRubkkXbdF2fe6YcGxgMBQdfJxrGaqISqWDL
   AOq6154B7eL1pQxFmam3VfDUIXcjUo1zmXBbQ0VN+xOzVgcPgOZZVjGmv
   JcXsSleKUhKvtxWLAw14bmJcdJlOrNjZtSz6lLV7q0NddE1cLzLEpeMeR
   RVAoWnt+EZk7K5gE9hh8ynIeypmmSjzgAoYy9VHh5kDIVJLn5EBTSAY7J
   A4eSBMCD96adBjY3O8n6qEav8vH+koFoop8SoKOKT7jyzqdkht7FPvnu1
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10450"; a="295180040"
X-IronPort-AV: E=Sophos;i="5.93,264,1654585200"; 
   d="scan'208";a="295180040"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2022 18:48:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,264,1654585200"; 
   d="scan'208";a="561267365"
Received: from lkp-server02.sh.intel.com (HELO 34e741d32628) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 25 Aug 2022 18:48:42 -0700
Received: from kbuild by 34e741d32628 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oROSf-0003EW-38;
        Fri, 26 Aug 2022 01:48:41 +0000
Date:   Fri, 26 Aug 2022 09:48:35 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 0684bc79cd52edca88e430b177f06d980aed5779
Message-ID: <63082673.dcrlsaVawa5uoKpI%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 0684bc79cd52edca88e430b177f06d980aed5779  dt-bindings: pinctrl: mt8186: Fix 'reg-names' for pinctrl nodes

elapsed time: 722m

configs tested: 121
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
loongarch                         allnoconfig
um                             i386_defconfig
um                           x86_64_defconfig
loongarch                           defconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
arc                              allyesconfig
s390                                defconfig
alpha                            allyesconfig
powerpc                          allmodconfig
mips                             allyesconfig
s390                             allyesconfig
powerpc                           allnoconfig
m68k                             allmodconfig
sh                               allmodconfig
i386                                defconfig
m68k                             allyesconfig
x86_64                              defconfig
x86_64                        randconfig-a004
i386                             allyesconfig
x86_64                        randconfig-a002
x86_64                               rhel-8.3
x86_64                        randconfig-a006
x86_64                           allyesconfig
arm                                 defconfig
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a014
i386                          randconfig-a005
x86_64                        randconfig-a013
i386                          randconfig-a012
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a016
arm                              allyesconfig
arm64                            allyesconfig
arc                  randconfig-r043-20220824
riscv                randconfig-r042-20220824
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
x86_64                    rhel-8.3-kselftests
nios2                            allyesconfig
nios2                               defconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
arc                  randconfig-r043-20220825
x86_64                           rhel-8.3-syz
x86_64                           rhel-8.3-kvm
s390                 randconfig-r044-20220824
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
powerpc                          allyesconfig
riscv                               defconfig
riscv                            allmodconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
m68k                        m5272c3_defconfig
arm                          iop32x_defconfig
arm                          gemini_defconfig
powerpc                     tqm8548_defconfig
sparc                       sparc32_defconfig
sh                           se7750_defconfig
sh                         microdev_defconfig
arc                     nsimosci_hs_defconfig
sparc                               defconfig
xtensa                           allyesconfig
csky                                defconfig
sparc                            allyesconfig
x86_64                                  kexec
sh                            hp6xx_defconfig
m68k                           virt_defconfig
arm                            qcom_defconfig
m68k                       bvme6000_defconfig
i386                          randconfig-c001
arm                       imx_v6_v7_defconfig
ia64                             alldefconfig
powerpc                 mpc8540_ads_defconfig
mips                           gcw0_defconfig
sh                            shmin_defconfig
powerpc                 mpc85xx_cds_defconfig
mips                      fuloong2e_defconfig
ia64                             allmodconfig
arm64                               defconfig
arm                              allmodconfig
m68k                                defconfig
ia64                                defconfig
mips                             allmodconfig

clang tested configs:
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a006
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a015
hexagon              randconfig-r041-20220825
hexagon              randconfig-r045-20220825
hexagon              randconfig-r041-20220824
hexagon              randconfig-r045-20220824
riscv                randconfig-r042-20220825
s390                 randconfig-r044-20220825
x86_64                        randconfig-k001
hexagon              randconfig-r045-20220823
riscv                randconfig-r042-20220823
hexagon              randconfig-r041-20220823
s390                 randconfig-r044-20220823

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
