Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9A474B2844
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Feb 2022 15:50:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239269AbiBKOt5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Feb 2022 09:49:57 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:45704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233880AbiBKOt4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Feb 2022 09:49:56 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A47A3FE
        for <linux-gpio@vger.kernel.org>; Fri, 11 Feb 2022 06:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644590995; x=1676126995;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=n1IGuX+Jx7VFUhr/uyH1675H9rC7C+vdVfiCk2TgGZg=;
  b=MnJ/gyaLknpNYzx0CemMJ1buLNzkPskDTxemdglh/SACX/kPa7oNWn/5
   jQqGkSXpmQ1K5g5Hjv48v4obGMzaQE84P1KaFOb61M3B0GJ2AtAXw8kB/
   lZZ688ae2jmXHlYL0xO2cnPk4/jQn5YRxKi6fgOHzh9z3okLIRZIuA9V2
   Huq/VvRDZ0+gW/vv8PfZxSwAHrp+WwJK0XyWdScMaz3UbNXfOZ9mLqRsh
   LTr9IgLQtUWa7p9FHH8TmsHl+jqw1sJe9+Wi3rkoJ718QRueAx3Zo0dkc
   q3GCpCtv/+2gW9q4flMmbe2YRyb+JC089h1ke0VMybYnDgz3G3LiKwCPD
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10254"; a="229708696"
X-IronPort-AV: E=Sophos;i="5.88,361,1635231600"; 
   d="scan'208";a="229708696"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2022 06:49:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,361,1635231600"; 
   d="scan'208";a="586369900"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 11 Feb 2022 06:49:54 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nIXFB-0004hd-Qa; Fri, 11 Feb 2022 14:49:53 +0000
Date:   Fri, 11 Feb 2022 22:49:42 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 f6aca46db6172a63331db0df99891e2c3c789a44
Message-ID: <62067786.o79Gk9cMLNDqIA/2%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: f6aca46db6172a63331db0df99891e2c3c789a44  Merge branch 'devel' into for-next

elapsed time: 726m

configs tested: 147
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                          randconfig-c001
arc                           tb10x_defconfig
mips                       bmips_be_defconfig
ia64                         bigsur_defconfig
powerpc                 mpc834x_mds_defconfig
m68k                             allyesconfig
arm                       aspeed_g5_defconfig
mips                        jmr3927_defconfig
mips                  decstation_64_defconfig
powerpc                     ep8248e_defconfig
arc                            hsdk_defconfig
m68k                         amcore_defconfig
mips                        vocore2_defconfig
nios2                            alldefconfig
powerpc                      pasemi_defconfig
sh                        sh7785lcr_defconfig
sh                          lboxre2_defconfig
openrisc                            defconfig
sparc64                          alldefconfig
powerpc                     mpc83xx_defconfig
m68k                           sun3_defconfig
sh                         ecovec24_defconfig
arm                          simpad_defconfig
m68k                          multi_defconfig
xtensa                          iss_defconfig
openrisc                 simple_smp_defconfig
powerpc                         ps3_defconfig
powerpc                      ep88xc_defconfig
h8300                    h8300h-sim_defconfig
arm                         at91_dt_defconfig
mips                  maltasmvp_eva_defconfig
arm                           stm32_defconfig
sh                           se7343_defconfig
sh                                  defconfig
arm                           corgi_defconfig
mips                     loongson1b_defconfig
sh                           se7721_defconfig
arm                     eseries_pxa_defconfig
alpha                            alldefconfig
mips                            gpr_defconfig
nds32                             allnoconfig
um                           x86_64_defconfig
sh                        apsh4ad0a_defconfig
arm                          iop32x_defconfig
sh                             shx3_defconfig
arm                          pxa910_defconfig
riscv                    nommu_k210_defconfig
h8300                     edosk2674_defconfig
s390                             allmodconfig
powerpc                      ppc40x_defconfig
parisc                           alldefconfig
m68k                          amiga_defconfig
powerpc                      makalu_defconfig
openrisc                         alldefconfig
sh                           se7724_defconfig
m68k                       m5275evb_defconfig
arm                  randconfig-c002-20220211
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
riscv                randconfig-c006-20220211
x86_64                        randconfig-c007
powerpc              randconfig-c003-20220211
arm                  randconfig-c002-20220211
i386                          randconfig-c001
mips                 randconfig-c004-20220211
powerpc                          allyesconfig
mips                          malta_defconfig
riscv                          rv32_defconfig
arm                        mvebu_v5_defconfig
powerpc                      katmai_defconfig
powerpc                     mpc5200_defconfig
powerpc                     akebono_defconfig
mips                     loongson2k_defconfig
mips                         tb0219_defconfig
arm                         lpc32xx_defconfig
arm                          pxa168_defconfig
powerpc                   bluestone_defconfig
mips                      pic32mzda_defconfig
hexagon                             defconfig
arm                         orion5x_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r045-20220211
hexagon              randconfig-r041-20220211
riscv                randconfig-r042-20220211

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
