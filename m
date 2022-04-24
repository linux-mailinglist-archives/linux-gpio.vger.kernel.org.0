Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 464C150D22F
	for <lists+linux-gpio@lfdr.de>; Sun, 24 Apr 2022 16:16:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236920AbiDXOTs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 24 Apr 2022 10:19:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233285AbiDXOTp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 24 Apr 2022 10:19:45 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAB102409B
        for <linux-gpio@vger.kernel.org>; Sun, 24 Apr 2022 07:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650809804; x=1682345804;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=VfZRLKRcI3HDLGYAWsRxwBvZGWupBcec89oxvzIhboM=;
  b=cByRvTz/JeocxCrP/HssgTL9qcMnCBCO8s3BtBNGpFxxZdrtHxqc7j8p
   xsPmnH8H4xWp1bFj/JC2fiKZtAE7R/P761HfW775tXtLKqcT101SqxKem
   a+ixCTN6voEgzYnQDaRfnumrMwVJJsYazLcgseq5w8/xHT+t77P9sSOsV
   pN1S9nEtQraQ+EI2JeWdzyJgN5Dro9c9T+SeMD6Y0Ek3gAmQ1WUDOc1Ea
   3KWaBmE8xP6Ww1jjnt7WOC5wbq0UvVrhu1kVtCB0J8HXkGO6nk00DeWT+
   d6YYillhPqi8wa1gL2whQSIP/GS7ElWhbqeRA1ncV7306UaSvq0IkDy9o
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10326"; a="246968725"
X-IronPort-AV: E=Sophos;i="5.90,286,1643702400"; 
   d="scan'208";a="246968725"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2022 07:16:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,286,1643702400"; 
   d="scan'208";a="531681843"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 24 Apr 2022 07:16:42 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nid2X-0001W7-RF;
        Sun, 24 Apr 2022 14:16:41 +0000
Date:   Sun, 24 Apr 2022 22:15:58 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 4402e215c42b40902323011de9cc9d1ba86b3e9c
Message-ID: <62655b9e.xt4ht9GSw7Ka5Raf%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 4402e215c42b40902323011de9cc9d1ba86b3e9c  Merge branch 'devel' into for-next

elapsed time: 3778m

configs tested: 152
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-c001
arm                             pxa_defconfig
sparc                       sparc64_defconfig
xtensa                          iss_defconfig
mips                 decstation_r4k_defconfig
powerpc                 mpc834x_mds_defconfig
sh                          rsk7269_defconfig
arm                        shmobile_defconfig
powerpc                       holly_defconfig
m68k                        mvme147_defconfig
sh                  sh7785lcr_32bit_defconfig
arm                           viper_defconfig
openrisc                    or1ksim_defconfig
mips                        bcm47xx_defconfig
sparc64                             defconfig
um                               alldefconfig
ia64                        generic_defconfig
sh                               j2_defconfig
mips                    maltaup_xpa_defconfig
powerpc                    klondike_defconfig
arm                          badge4_defconfig
sh                          polaris_defconfig
sh                           se7712_defconfig
arm                         lubbock_defconfig
sh                           sh2007_defconfig
powerpc                 mpc837x_mds_defconfig
xtensa                    xip_kc705_defconfig
mips                     loongson1b_defconfig
arc                         haps_hs_defconfig
sh                              ul2_defconfig
ia64                             allyesconfig
m68k                         amcore_defconfig
sh                          landisk_defconfig
m68k                          sun3x_defconfig
sparc64                          alldefconfig
arc                     nsimosci_hs_defconfig
arm                          iop32x_defconfig
arm                         assabet_defconfig
sh                           se7722_defconfig
arm                            xcep_defconfig
sh                           se7619_defconfig
arm                           stm32_defconfig
xtensa                    smp_lx200_defconfig
mips                           xway_defconfig
m68k                       m5475evb_defconfig
powerpc                   currituck_defconfig
powerpc                 canyonlands_defconfig
xtensa                  audio_kc705_defconfig
arm                            zeus_defconfig
riscv                            allyesconfig
arm                            mps2_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220422
ia64                                defconfig
ia64                             allmodconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
csky                                defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
h8300                            allyesconfig
xtensa                           allyesconfig
s390                                defconfig
s390                             allmodconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                             allyesconfig
sparc                               defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a015
x86_64                        randconfig-a013
x86_64                        randconfig-a011
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arc                  randconfig-r043-20220421
riscv                randconfig-r042-20220421
s390                 randconfig-r044-20220421
riscv                            allmodconfig
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
riscv                               defconfig
x86_64                           allyesconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                          rhel-8.3-func
x86_64                                  kexec
x86_64                              defconfig
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit
x86_64                               rhel-8.3

clang tested configs:
riscv                randconfig-c006-20220424
mips                 randconfig-c004-20220424
x86_64                        randconfig-c007
i386                          randconfig-c001
arm                  randconfig-c002-20220424
powerpc              randconfig-c003-20220424
s390                 randconfig-c005-20220424
powerpc                      walnut_defconfig
powerpc                     kilauea_defconfig
mips                           ip27_defconfig
powerpc                      ppc64e_defconfig
mips                           rs90_defconfig
s390                             alldefconfig
mips                           mtx1_defconfig
arm                          ixp4xx_defconfig
powerpc                        icon_defconfig
arm                          pxa168_defconfig
powerpc                    mvme5100_defconfig
powerpc                  mpc885_ads_defconfig
mips                      maltaaprp_defconfig
mips                       rbtx49xx_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
hexagon              randconfig-r041-20220422
s390                 randconfig-r044-20220422
riscv                randconfig-r042-20220422
hexagon              randconfig-r045-20220422
hexagon              randconfig-r041-20220421
hexagon              randconfig-r045-20220421

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
