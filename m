Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2609E50539A
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Apr 2022 14:58:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239500AbiDRNAm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Apr 2022 09:00:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241663AbiDRM64 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Apr 2022 08:58:56 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1ADB92E0B5
        for <linux-gpio@vger.kernel.org>; Mon, 18 Apr 2022 05:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650285568; x=1681821568;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=cQipVwUqI2yUfDAUIcaF09860m8mOAZ19L3vXCN8Ikc=;
  b=VBHI0qCpUUoLc7Ht08wN/NOtaRSXjCjB1kZJMBTIiTdlDCqANj4gXtna
   +9jdnca7iMFcb5/olo038HgCXUrQwaTBhM0eB0C9gTFAfXdBGupexnr11
   VKJ+i4XmcWPKCPfN5auM+me40vgVJ1RmLNeKz0dS60YS1nmFnsZ/Z1nlL
   QqjqssOMQmEw5aqTpWUAIuQRWdk+iaNb2ThA3JVsfEDJFY0y6BLVlic/o
   684OqOYg/vGxWfRPb2oOch4bbAfsfdF/BWpWokjJSjjHB/JF2VHw/YE25
   G4OU23mWLg5/wy1cUeDgDTBoy7ekM+qPYTAFnfsKkNENC1cR3hUyoAyvl
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10320"; a="263267591"
X-IronPort-AV: E=Sophos;i="5.90,269,1643702400"; 
   d="scan'208";a="263267591"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2022 05:39:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,269,1643702400"; 
   d="scan'208";a="529496085"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 18 Apr 2022 05:39:26 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1ngQf7-0004dL-Uq;
        Mon, 18 Apr 2022 12:39:25 +0000
Date:   Mon, 18 Apr 2022 20:38:36 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:fixes] BUILD SUCCESS
 ef0beba1a5fb0c693ddf7d31246bd96c925ffd00
Message-ID: <625d5bcc.A/rziKzyU+D66uEx%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git fixes
branch HEAD: ef0beba1a5fb0c693ddf7d31246bd96c925ffd00  pinctrl: qcom: sm6350: fix order of UFS & SDC pins

elapsed time: 730m

configs tested: 179
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
i386                 randconfig-c001-20220418
parisc                           allyesconfig
sh                               allmodconfig
h8300                            allyesconfig
xtensa                           allyesconfig
arc                              allyesconfig
alpha                            allyesconfig
nios2                            allyesconfig
arm                           stm32_defconfig
sh                        apsh4ad0a_defconfig
mips                         db1xxx_defconfig
sh                           se7750_defconfig
arm                             rpc_defconfig
powerpc                   motionpro_defconfig
sh                           se7705_defconfig
sh                ecovec24-romimage_defconfig
m68k                        m5272c3_defconfig
riscv                            allmodconfig
powerpc                           allnoconfig
sh                          rsk7203_defconfig
powerpc                     rainier_defconfig
ia64                          tiger_defconfig
h8300                            alldefconfig
m68k                          atari_defconfig
mips                         cobalt_defconfig
sh                            shmin_defconfig
sh                             espt_defconfig
riscv                               defconfig
m68k                                defconfig
i386                                defconfig
ia64                                defconfig
arm                          simpad_defconfig
arm                           sunxi_defconfig
ia64                             alldefconfig
ia64                        generic_defconfig
sh                           se7721_defconfig
m68k                        mvme16x_defconfig
powerpc                 mpc834x_itx_defconfig
mips                     loongson1b_defconfig
powerpc                        cell_defconfig
powerpc                     tqm8548_defconfig
ia64                         bigsur_defconfig
sh                         apsh4a3a_defconfig
powerpc                     asp8347_defconfig
powerpc                      ep88xc_defconfig
sh                          rsk7269_defconfig
arm                          iop32x_defconfig
powerpc                    sam440ep_defconfig
sh                                  defconfig
powerpc                       holly_defconfig
arm                        realview_defconfig
powerpc                     mpc83xx_defconfig
mips                  maltasmvp_eva_defconfig
arc                        nsim_700_defconfig
mips                             allyesconfig
powerpc                 mpc85xx_cds_defconfig
mips                         mpc30x_defconfig
arm                           corgi_defconfig
arm                        keystone_defconfig
sh                  sh7785lcr_32bit_defconfig
mips                         rt305x_defconfig
m68k                       bvme6000_defconfig
ia64                            zx1_defconfig
powerpc64                        alldefconfig
sh                           se7343_defconfig
mips                        vocore2_defconfig
mips                  decstation_64_defconfig
mips                            ar7_defconfig
m68k                          amiga_defconfig
mips                    maltaup_xpa_defconfig
arm                      integrator_defconfig
parisc                generic-32bit_defconfig
powerpc                     pq2fads_defconfig
sh                            hp6xx_defconfig
x86_64                           alldefconfig
m68k                        m5307c3_defconfig
m68k                        m5407c3_defconfig
mips                      loongson3_defconfig
arm                       aspeed_g5_defconfig
xtensa                    smp_lx200_defconfig
sh                             sh03_defconfig
sh                   rts7751r2dplus_defconfig
sparc                       sparc32_defconfig
powerpc                      pcm030_defconfig
arm                         lpc18xx_defconfig
openrisc                    or1ksim_defconfig
arm                  randconfig-c002-20220418
x86_64               randconfig-c001-20220418
arm                  randconfig-c002-20220417
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
nios2                               defconfig
csky                                defconfig
alpha                               defconfig
arc                                 defconfig
s390                                defconfig
s390                             allmodconfig
parisc                              defconfig
parisc64                            defconfig
s390                             allyesconfig
sparc                               defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
x86_64               randconfig-a003-20220418
x86_64               randconfig-a004-20220418
x86_64               randconfig-a006-20220418
x86_64               randconfig-a001-20220418
x86_64               randconfig-a002-20220418
x86_64               randconfig-a005-20220418
i386                 randconfig-a004-20220418
i386                 randconfig-a001-20220418
i386                 randconfig-a003-20220418
i386                 randconfig-a005-20220418
i386                 randconfig-a006-20220418
i386                 randconfig-a002-20220418
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allyesconfig
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                          rhel-8.3-func
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                               rhel-8.3

clang tested configs:
x86_64                        randconfig-c007
powerpc              randconfig-c003-20220417
arm                  randconfig-c002-20220417
i386                          randconfig-c001
riscv                randconfig-c006-20220417
mips                 randconfig-c004-20220417
powerpc              randconfig-c003-20220418
arm                  randconfig-c002-20220418
riscv                randconfig-c006-20220418
x86_64               randconfig-c007-20220418
mips                 randconfig-c004-20220418
i386                 randconfig-c001-20220418
mips                           rs90_defconfig
powerpc                     akebono_defconfig
riscv                          rv32_defconfig
arm                         shannon_defconfig
powerpc                    mvme5100_defconfig
arm                       versatile_defconfig
mips                        omega2p_defconfig
mips                     cu1830-neo_defconfig
powerpc                     tqm8540_defconfig
mips                            e55_defconfig
mips                           ip28_defconfig
arm                           spitz_defconfig
x86_64               randconfig-a016-20220418
x86_64               randconfig-a012-20220418
x86_64               randconfig-a013-20220418
x86_64               randconfig-a014-20220418
x86_64               randconfig-a015-20220418
x86_64               randconfig-a011-20220418
i386                 randconfig-a011-20220418
i386                 randconfig-a015-20220418
i386                 randconfig-a016-20220418
i386                 randconfig-a012-20220418
i386                 randconfig-a013-20220418
i386                 randconfig-a014-20220418
riscv                randconfig-r042-20220418
hexagon              randconfig-r041-20220417
hexagon              randconfig-r041-20220418
hexagon              randconfig-r045-20220417
hexagon              randconfig-r045-20220418
s390                 randconfig-r044-20220418

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
