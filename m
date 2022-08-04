Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D335658983D
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Aug 2022 09:19:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233676AbiHDHTu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Aug 2022 03:19:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229592AbiHDHTt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Aug 2022 03:19:49 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E24F45D0FC
        for <linux-gpio@vger.kernel.org>; Thu,  4 Aug 2022 00:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659597588; x=1691133588;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=p4MQzSe7rhqCd7Ay9RVoHXB7S5VmJkoWcDoWWta7Mg4=;
  b=BdD7kOBA7PJnX8CGHJOOnHrkmXXTMIbXU5gxBNZ8zSzgHExIqPm3lqRK
   /UMyRY4p9HwBc+x0JD40yg6iDxd66iDZ6pzX9oOvAgpfMgW6OeipiXvaM
   ukVqIH4tLZkuDflYDTynZg0LO1HZoRP9OGQ18CRG+olA75pL+LG7jX2Dm
   M7nrRVw+kVEeRd1E2IPov7uI7i2KbvtlM4j3qesOV2Qp5T8m3ubErIcSR
   S36WW3tsklct+LlpyrisVdc8sjv1/Lk1tJ+y/5ChT2B1Cl3HiBlEOVeFV
   2K1ltnndz4x0oUu/fWkd1DxkHbcBzMbaWVw1jnvSCpDdvXSNoDLLvEQ1W
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10428"; a="351573496"
X-IronPort-AV: E=Sophos;i="5.93,215,1654585200"; 
   d="scan'208";a="351573496"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2022 00:19:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,215,1654585200"; 
   d="scan'208";a="631470247"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 04 Aug 2022 00:19:42 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oJV8w-000I7D-0w;
        Thu, 04 Aug 2022 07:19:42 +0000
Date:   Thu, 04 Aug 2022 15:18:56 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 5b045200b53a9b95f87409b5c13f43adb6f1da6c
Message-ID: <62eb72e0.L0299XT53rPjbgoq%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 5b045200b53a9b95f87409b5c13f43adb6f1da6c  dt-bindings: pinctrl: qcom,pmic-gpio: add PM8226 constraints

elapsed time: 720m

configs tested: 105
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                              allyesconfig
i386                                defconfig
alpha                            allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
sh                               allmodconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
arc                  randconfig-r043-20220803
riscv                randconfig-r042-20220803
x86_64                        randconfig-a006
x86_64                        randconfig-a002
x86_64                        randconfig-a015
s390                 randconfig-r044-20220803
x86_64                           rhel-8.3-syz
x86_64                        randconfig-a004
x86_64                           rhel-8.3-kvm
x86_64                        randconfig-a013
arm                                 defconfig
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
i386                          randconfig-a016
powerpc                           allnoconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
i386                             allyesconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
xtensa                         virt_defconfig
arm                        multi_v7_defconfig
sh                          rsk7264_defconfig
loongarch                         allnoconfig
arm                            qcom_defconfig
um                                  defconfig
sh                          r7785rp_defconfig
sh                                  defconfig
mips                 decstation_r4k_defconfig
sh                        sh7757lcr_defconfig
arm64                            allyesconfig
arm                              allyesconfig
arc                  randconfig-r043-20220804
powerpc                          allmodconfig
mips                             allyesconfig
loongarch                           defconfig
i386                          randconfig-a012
i386                          randconfig-a014
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                          randconfig-c001
x86_64                         rhel-8.3-kunit
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
arc                           tb10x_defconfig
arc                     haps_hs_smp_defconfig
powerpc                 mpc8540_ads_defconfig
sh                        sh7785lcr_defconfig
x86_64                        randconfig-a011
x86_64                        randconfig-c001
arm                  randconfig-c002-20220804
arm                        cerfcube_defconfig
sh                           sh2007_defconfig
powerpc                     mpc83xx_defconfig
arc                         haps_hs_defconfig
arm                        mini2440_defconfig
powerpc                 mpc837x_rdb_defconfig
m68k                       bvme6000_defconfig
nios2                            allyesconfig
nios2                               defconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                                defconfig
s390                             allmodconfig
arc                                 defconfig
alpha                               defconfig
s390                             allyesconfig

clang tested configs:
x86_64                        randconfig-a005
x86_64                        randconfig-a014
hexagon              randconfig-r041-20220803
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a012
hexagon              randconfig-r045-20220803
x86_64                        randconfig-a016
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
i386                          randconfig-a013
i386                          randconfig-a015
i386                          randconfig-a011
mips                           rs90_defconfig
powerpc                      obs600_defconfig
x86_64                        randconfig-k001
mips                          malta_defconfig
arm                       cns3420vb_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
