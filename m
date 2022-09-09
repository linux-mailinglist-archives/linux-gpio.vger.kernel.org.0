Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D42B5B2D1F
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Sep 2022 05:55:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230314AbiIIDy6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Sep 2022 23:54:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230098AbiIIDyy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Sep 2022 23:54:54 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90AAF25C75
        for <linux-gpio@vger.kernel.org>; Thu,  8 Sep 2022 20:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662695691; x=1694231691;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=XRvsTDEPiPao/EWU8T6WIWodgbS1DiieNNe1FhU0lTk=;
  b=QYICvBMqxNwFskp5k5OVSxZLr8EFZfqJWM53DTWtsLLaSoGaOwyNhwPH
   aRhhI/SzsUVyT/cgI/u0khUOqML9DLLVjCVZvkF1bSmDht9EmIHQEybba
   dpf9mivHQTTyPnue527a9bl2v8xVa8oYTXWpmY2o08/zL339zSGIpqACG
   /xWszPaZRLHSjytzjqHgQ/rWXwvLbGIlUP6ZIPP9wGLwjFCrNeFolcxNJ
   WNpeldIyr/aJjDCXRBEZ+7OdqzezhpqzYxnXTLh4TVp29w11GSGvRjIkX
   Qit2jS1It1h8y45D++yPR6y95cb/2JSWqeHPan4nKF1dqIAnkpcDKCrot
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="359116197"
X-IronPort-AV: E=Sophos;i="5.93,302,1654585200"; 
   d="scan'208";a="359116197"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2022 20:54:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,302,1654585200"; 
   d="scan'208";a="683494870"
Received: from lkp-server02.sh.intel.com (HELO b2938d2e5c5a) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 08 Sep 2022 20:54:46 -0700
Received: from kbuild by b2938d2e5c5a with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oWV6L-0000gr-2a;
        Fri, 09 Sep 2022 03:54:45 +0000
Date:   Fri, 09 Sep 2022 11:54:16 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 827eb27ec2e508e1ef5dc36d29db73cbae1ccb40
Message-ID: <631ab8e8.plB6GisYOoQmVdyc%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 827eb27ec2e508e1ef5dc36d29db73cbae1ccb40  pinctrl: meson: Switch to use fwnode instead of of_node

elapsed time: 1134m

configs tested: 176
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
powerpc                           allnoconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
x86_64                        randconfig-a015
x86_64                        randconfig-a013
x86_64                        randconfig-a011
sh                               allmodconfig
x86_64                        randconfig-a002
microblaze                          defconfig
powerpc                        cell_defconfig
parisc64                         alldefconfig
powerpc                          allmodconfig
mips                             allyesconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a006
i386                             allyesconfig
i386                                defconfig
x86_64                          rhel-8.3-func
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
loongarch                           defconfig
loongarch                         allnoconfig
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
x86_64                           rhel-8.3-syz
x86_64                           rhel-8.3-kvm
sh                             sh03_defconfig
sh                           se7750_defconfig
s390                             allmodconfig
xtensa                       common_defconfig
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
powerpc                         wii_defconfig
arm                        cerfcube_defconfig
xtensa                  cadence_csp_defconfig
m68k                       m5275evb_defconfig
sh                         ap325rxa_defconfig
sparc                             allnoconfig
powerpc                      arches_defconfig
openrisc                 simple_smp_defconfig
powerpc                     asp8347_defconfig
i386                          randconfig-c001
i386                             alldefconfig
powerpc                     ep8248e_defconfig
m68k                          hp300_defconfig
m68k                        m5272c3_defconfig
arm                          exynos_defconfig
arm                          pxa3xx_defconfig
arm                         s3c6400_defconfig
powerpc                     stx_gp3_defconfig
arm64                            alldefconfig
sh                           se7722_defconfig
ia64                          tiger_defconfig
arc                              alldefconfig
sh                            titan_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
sh                          r7780mp_defconfig
arm                            qcom_defconfig
riscv                randconfig-r042-20220908
arc                  randconfig-r043-20220907
arc                  randconfig-r043-20220908
s390                 randconfig-r044-20220908
arm                        realview_defconfig
xtensa                              defconfig
arm                          iop32x_defconfig
parisc64                            defconfig
openrisc                            defconfig
sh                        sh7757lcr_defconfig
sparc                               defconfig
sh                     sh7710voipgw_defconfig
sh                          r7785rp_defconfig
powerpc                     mpc83xx_defconfig
xtensa                generic_kc705_defconfig
arm                      integrator_defconfig
sparc64                             defconfig
arc                     haps_hs_smp_defconfig
arm                         assabet_defconfig
arm                            zeus_defconfig
mips                            ar7_defconfig
mips                         rt305x_defconfig
arc                      axs103_smp_defconfig
openrisc                    or1ksim_defconfig
sh                             shx3_defconfig
mips                    maltaup_xpa_defconfig
mips                  maltasmvp_eva_defconfig
sh                        edosk7705_defconfig
arm                        mini2440_defconfig
sh                            shmin_defconfig
nios2                               defconfig
mips                 decstation_r4k_defconfig
mips                     decstation_defconfig
sh                          sdk7780_defconfig
arm                      footbridge_defconfig
parisc                           allyesconfig
arm                             pxa_defconfig
arm                           u8500_defconfig
powerpc                      mgcoge_defconfig
m68k                                defconfig
m68k                          multi_defconfig
nios2                            allyesconfig
sh                             espt_defconfig
sh                     magicpanelr2_defconfig
arm                            hisi_defconfig
xtensa                    smp_lx200_defconfig
m68k                          atari_defconfig
m68k                       m5475evb_defconfig
powerpc                 mpc834x_itx_defconfig
powerpc                     tqm8548_defconfig
parisc                              defconfig
powerpc                      ppc40x_defconfig
mips                      loongson3_defconfig
sh                         apsh4a3a_defconfig
parisc                           alldefconfig
sh                            migor_defconfig
arc                    vdk_hs38_smp_defconfig
sh                         microdev_defconfig
mips                           xway_defconfig
sparc64                          alldefconfig
arm                         nhk8815_defconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
x86_64                        randconfig-c001
arm                  randconfig-c002-20220908
ia64                             allmodconfig

clang tested configs:
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a001
x86_64                        randconfig-a016
x86_64                        randconfig-a003
x86_64                        randconfig-a005
powerpc                     tqm8540_defconfig
arm                           spitz_defconfig
riscv                randconfig-r042-20220907
hexagon              randconfig-r041-20220907
hexagon              randconfig-r045-20220907
s390                 randconfig-r044-20220907
powerpc                     akebono_defconfig
mips                      malta_kvm_defconfig
arm                    vt8500_v6_v7_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
hexagon              randconfig-r041-20220908
hexagon              randconfig-r045-20220908
x86_64                        randconfig-k001
arm                      pxa255-idp_defconfig
s390                             alldefconfig
powerpc                        fsp2_defconfig
powerpc                 mpc8272_ads_defconfig
mips                        qi_lb60_defconfig
arm                          pcm027_defconfig
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
mips                           mtx1_defconfig
mips                          ath79_defconfig
powerpc                     ppa8548_defconfig
mips                           ip22_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
