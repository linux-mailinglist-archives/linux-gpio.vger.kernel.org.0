Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78E864E4791
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Mar 2022 21:33:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229692AbiCVUfC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Mar 2022 16:35:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229704AbiCVUfB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Mar 2022 16:35:01 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49760237DF
        for <linux-gpio@vger.kernel.org>; Tue, 22 Mar 2022 13:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647981213; x=1679517213;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=6bzgehzH6Bc++/SOTjr0Y4EQ+aQUGeT46qDi+fem3Qw=;
  b=X0B5Lf0Gqitsfn8vgQ8n5sPrxtNun9eyPCZRUaWIAMcH+XwZfPhCUjPa
   Qxrrl00wPa/kh2YpLyPt9JzJwZy/vZXDbdfS7oGvlGmALaROFy6l+fcWg
   8eHNzhK9hj3EsTusyCOePiiiQW59u2NsCmi+nRGC0Rlgr94zHkollevpR
   baw2+XkPlRkHL+bDI1IS5wxeKY9fSXxE+TveBbelsfRHTTj3Jp+CFqRYF
   AQcVEr8SdlvvBqOl5/gHQsTQdLA2Nf19ugelNYKAYH3xfHRtW0ylREKXZ
   h4gGCY3idCjNXkfYmT9duLgSh5hkmzycG6SGBNDdw37U+TLBSU1Htj0io
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10294"; a="282782664"
X-IronPort-AV: E=Sophos;i="5.90,202,1643702400"; 
   d="scan'208";a="282782664"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2022 13:33:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,202,1643702400"; 
   d="scan'208";a="543883246"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 22 Mar 2022 13:33:31 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nWlC6-000JGJ-Pz; Tue, 22 Mar 2022 20:33:30 +0000
Date:   Wed, 23 Mar 2022 04:33:25 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD REGRESSION
 4d3a82e4ec28e7956db55487eeb480407a002c37
Message-ID: <623a3295.t5hCWr8EUxxooaUU%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 4d3a82e4ec28e7956db55487eeb480407a002c37  pinctrl: pinctrl-aspeed-g6: add FWQSPI function-group

Error/Warning reports:

https://lore.kernel.org/linux-gpio/202203222145.UcCrXHfm-lkp@intel.com
https://lore.kernel.org/llvm/202203221951.it5LJ3eo-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

drivers/pinctrl/mediatek/pinctrl-mt8186.c:1254:39: error: too many arguments to function call, expected single argument 'pdev', have 2 arguments

Unverified Error/Warning (likely false positive, please contact us if interested):

drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:626:9: sparse: sparse: obsolete array initializer, use C99 syntax

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- m68k-allmodconfig
|   `-- drivers-pinctrl-nuvoton-pinctrl-wpcm450.c:sparse:sparse:obsolete-array-initializer-use-C99-syntax
|-- m68k-allyesconfig
|   `-- drivers-pinctrl-nuvoton-pinctrl-wpcm450.c:sparse:sparse:obsolete-array-initializer-use-C99-syntax
|-- openrisc-randconfig-c023-20220320
|   `-- drivers-pinctrl-mediatek-pinctrl-mtk-common.c:Unneeded-semicolon
|-- powerpc-allmodconfig
|   `-- drivers-pinctrl-nuvoton-pinctrl-wpcm450.c:sparse:sparse:obsolete-array-initializer-use-C99-syntax
|-- powerpc-allyesconfig
|   `-- drivers-pinctrl-nuvoton-pinctrl-wpcm450.c:sparse:sparse:obsolete-array-initializer-use-C99-syntax
`-- s390-allyesconfig
    `-- drivers-pinctrl-nuvoton-pinctrl-wpcm450.c:sparse:sparse:obsolete-array-initializer-use-C99-syntax

clang_recent_errors
`-- arm64-randconfig-r022-20220320
    `-- drivers-pinctrl-mediatek-pinctrl-mt8186.c:error:too-many-arguments-to-function-call-expected-single-argument-pdev-have-arguments

elapsed time: 724m

configs tested: 134
configs skipped: 3

gcc tested configs:
arm64                               defconfig
arm                                 defconfig
arm                              allmodconfig
arm                              allyesconfig
arm64                            allyesconfig
mips                             allmodconfig
riscv                            allmodconfig
mips                             allyesconfig
um                           x86_64_defconfig
um                             i386_defconfig
riscv                            allyesconfig
i386                          randconfig-c001
sparc                            allyesconfig
i386                 randconfig-c001-20220321
mips                 randconfig-c004-20220320
h8300                            allyesconfig
m68k                             alldefconfig
riscv                    nommu_k210_defconfig
sh                             sh03_defconfig
ia64                        generic_defconfig
sh                          urquell_defconfig
xtensa                           alldefconfig
arc                        vdk_hs38_defconfig
m68k                       m5475evb_defconfig
m68k                         apollo_defconfig
powerpc64                           defconfig
powerpc                 mpc837x_rdb_defconfig
sh                        sh7757lcr_defconfig
m68k                          sun3x_defconfig
sh                        apsh4ad0a_defconfig
parisc                generic-64bit_defconfig
sh                         microdev_defconfig
h8300                     edosk2674_defconfig
arc                 nsimosci_hs_smp_defconfig
sh                              ul2_defconfig
um                                  defconfig
arm                  randconfig-c002-20220320
arm                  randconfig-c002-20220321
ia64                             allmodconfig
ia64                             allyesconfig
ia64                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
nds32                               defconfig
alpha                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
xtensa                           allyesconfig
s390                                defconfig
parisc                              defconfig
parisc64                            defconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                             allyesconfig
i386                              debian-10.3
i386                             allyesconfig
i386                   debian-10.3-kselftests
sparc                               defconfig
i386                                defconfig
nds32                             allnoconfig
nios2                               defconfig
arc                              allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
x86_64               randconfig-a013-20220321
x86_64               randconfig-a012-20220321
x86_64               randconfig-a014-20220321
x86_64               randconfig-a011-20220321
x86_64               randconfig-a016-20220321
x86_64               randconfig-a015-20220321
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
i386                 randconfig-a013-20220321
i386                 randconfig-a011-20220321
i386                 randconfig-a012-20220321
i386                 randconfig-a014-20220321
i386                 randconfig-a016-20220321
i386                 randconfig-a015-20220321
arc                  randconfig-r043-20220320
arc                  randconfig-r043-20220321
riscv                randconfig-r042-20220321
s390                 randconfig-r044-20220321
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                    nommu_virt_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                                  kexec
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests

clang tested configs:
arm                     am200epdkit_defconfig
arm                        spear3xx_defconfig
mips                     loongson1c_defconfig
powerpc                     tqm8540_defconfig
powerpc                 mpc8272_ads_defconfig
arm                        neponset_defconfig
mips                  cavium_octeon_defconfig
arm                          ixp4xx_defconfig
i386                 randconfig-a003-20220321
i386                 randconfig-a004-20220321
i386                 randconfig-a001-20220321
i386                 randconfig-a002-20220321
i386                 randconfig-a005-20220321
i386                 randconfig-a006-20220321
x86_64               randconfig-a002-20220321
x86_64               randconfig-a003-20220321
x86_64               randconfig-a001-20220321
x86_64               randconfig-a006-20220321
x86_64               randconfig-a005-20220321
x86_64               randconfig-a004-20220321
x86_64                        randconfig-a012
x86_64                        randconfig-a016
x86_64                        randconfig-a014
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r041-20220321
hexagon              randconfig-r045-20220321
hexagon              randconfig-r045-20220320
hexagon              randconfig-r041-20220320
riscv                randconfig-r042-20220320
s390                 randconfig-r044-20220320

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
