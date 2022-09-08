Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8AE55B13E7
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Sep 2022 07:14:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229822AbiIHFO5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Sep 2022 01:14:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229778AbiIHFO4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Sep 2022 01:14:56 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E74E5C9CD
        for <linux-gpio@vger.kernel.org>; Wed,  7 Sep 2022 22:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662614094; x=1694150094;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=1/20hzyJgkCvyrFbiT5BfuH/y2rm2cgRDxr0fIAIPxk=;
  b=ghBELVdPisvlSpjejdEKXO0IGhD4gKV8RkcXq9TESAuGms9fxDjUS3wA
   YLUGYgHGnozKURl7kKqSEFpzAEiIEW11gR59iA1tskxwyjGfnT744Ut+J
   uv5z/SA+IoRstfUgC0RO/r4mVzGIdpTQKKE2EUgR+u8VwDqxQnQtrNQ4u
   nzFzu4C21BT5pnOpARruyfKdfACc1w2p4BtubxCjwBhcrL29Xe8yhDoEk
   7snqRT8ElWfSpCzWOYKK2tK1kYkJSCbxnBaHhtfdI5HzvTPPjPIOgwEVK
   FWPckreB9ApREzagrpAoHB95WBB8h8TpIcZAaYgCcOAgzVjDv7idGxkiS
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10463"; a="297071319"
X-IronPort-AV: E=Sophos;i="5.93,299,1654585200"; 
   d="scan'208";a="297071319"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2022 22:14:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,299,1654585200"; 
   d="scan'208";a="592009755"
Received: from lkp-server02.sh.intel.com (HELO 95dfd251caa2) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 07 Sep 2022 22:14:52 -0700
Received: from kbuild by 95dfd251caa2 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oW9sJ-0007OP-2w;
        Thu, 08 Sep 2022 05:14:51 +0000
Date:   Thu, 08 Sep 2022 13:14:19 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 279c12df8d2efb28def9d037f288cbfb97c30fe2
Message-ID: <63197a2b.NKGPjWCBIbPMOKKl%lkp@intel.com>
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
branch HEAD: 279c12df8d2efb28def9d037f288cbfb97c30fe2  gpio: mpc8xxx: Fix support for IRQ_TYPE_LEVEL_LOW flow_type in mpc85xx

elapsed time: 1046m

configs tested: 138
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
arc                  randconfig-r043-20220907
x86_64                               rhel-8.3
x86_64                           allyesconfig
i386                                defconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
x86_64                        randconfig-a002
i386                             allyesconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
x86_64                           rhel-8.3-syz
i386                          randconfig-a016
x86_64                           rhel-8.3-kvm
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit
i386                          randconfig-a012
i386                          randconfig-a014
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
sh                               allmodconfig
x86_64                        randconfig-a015
powerpc                    sam440ep_defconfig
m68k                          amiga_defconfig
powerpc                      tqm8xx_defconfig
m68k                        stmark2_defconfig
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
xtensa                         virt_defconfig
ia64                         bigsur_defconfig
arm                        keystone_defconfig
sh                  sh7785lcr_32bit_defconfig
m68k                          multi_defconfig
sh                                  defconfig
m68k                                defconfig
mips                     loongson1b_defconfig
loongarch                           defconfig
loongarch                         allnoconfig
arm                             pxa_defconfig
arc                          axs103_defconfig
mips                           gcw0_defconfig
parisc64                         alldefconfig
i386                          randconfig-c001
sparc                               defconfig
sh                     sh7710voipgw_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                             alldefconfig
powerpc                     ep8248e_defconfig
m68k                          hp300_defconfig
m68k                        m5272c3_defconfig
arm                          exynos_defconfig
sparc                             allnoconfig
arm                        cerfcube_defconfig
powerpc                      arches_defconfig
openrisc                 simple_smp_defconfig
powerpc                     asp8347_defconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
sparc                            alldefconfig
arm                          pxa3xx_defconfig
arm                         s3c6400_defconfig
powerpc                     stx_gp3_defconfig
arm64                            alldefconfig
sh                           se7722_defconfig
sh                             sh03_defconfig
sh                           se7750_defconfig
s390                             allmodconfig
xtensa                       common_defconfig
sh                          r7785rp_defconfig
arm                          iop32x_defconfig
powerpc                     mpc83xx_defconfig
xtensa                generic_kc705_defconfig
csky                                defconfig
um                                  defconfig
sh                            titan_defconfig
arm                            mps2_defconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
sh                          r7780mp_defconfig
arm                            qcom_defconfig
ia64                          tiger_defconfig
arc                              alldefconfig
x86_64                        randconfig-a011
x86_64                        randconfig-a013
xtensa                           allyesconfig
sparc                            allyesconfig
x86_64                                  kexec
arm                        clps711x_defconfig
arc                           tb10x_defconfig
powerpc                       eiger_defconfig
s390                                defconfig
arc                                 defconfig
alpha                               defconfig
s390                             allyesconfig
nios2                            allyesconfig
nios2                               defconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
ia64                             allmodconfig

clang tested configs:
hexagon              randconfig-r041-20220907
hexagon              randconfig-r045-20220907
s390                 randconfig-r044-20220907
riscv                randconfig-r042-20220907
i386                          randconfig-a006
i386                          randconfig-a015
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a002
i386                          randconfig-a004
x86_64                        randconfig-k001
powerpc                     tqm8540_defconfig
arm                           spitz_defconfig
powerpc                 mpc8315_rdb_defconfig
mips                           ip22_defconfig
i386                          randconfig-a011
i386                          randconfig-a013
powerpc                     akebono_defconfig
mips                      malta_kvm_defconfig
arm                    vt8500_v6_v7_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
