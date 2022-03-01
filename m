Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 985004C93E3
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Mar 2022 20:05:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229785AbiCATFp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Mar 2022 14:05:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbiCATFn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Mar 2022 14:05:43 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0F6C3DDE8
        for <linux-gpio@vger.kernel.org>; Tue,  1 Mar 2022 11:05:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646161501; x=1677697501;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=NkxSjgXwuiZMHu7GzkVo3JQd3FJ2VlNdQyR9Zm2cDLs=;
  b=PB3I4RWaZiycwBsRI5iL9EOtWen/lA8Qn1qM4AR2xq3kA3V+eSX5JFC8
   FTT3E1OBCHpu4e1vEr7gHS3Pep+iJc6CNsO45EJhF75c0UjEfj3UKNufb
   jJI8HhvHUht9SWn2Tj6+/+tYnDLaOVCtAxOgp0+d8wCbG8BxNKOAJd3R9
   QWV9Y+rB392VgplTkDyLJquz7pCNKBv8XrE51AGo51HQn+fz00q/XruU5
   VqrEkxwB9dAVzdpbn8vUV5j7sU2Cf8dqsO5PBeQCIdJBcJNZmUMEjTSt4
   6YeBNK5ceblBSTYDL/nQ9Cif8jG/83d8JmPwZRrtProE49oE8mlXFLjHg
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10273"; a="233833097"
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; 
   d="scan'208";a="233833097"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2022 11:05:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; 
   d="scan'208";a="593705322"
Received: from lkp-server01.sh.intel.com (HELO 2146afe809fb) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 01 Mar 2022 11:05:00 -0800
Received: from kbuild by 2146afe809fb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nP7nw-0000uR-3W; Tue, 01 Mar 2022 19:05:00 +0000
Date:   Wed, 02 Mar 2022 03:04:21 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 842366d7cb68321b33920f859d0772fc16bc8a33
Message-ID: <621e6e35.ANUJQ34HP96iN3NN%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 842366d7cb68321b33920f859d0772fc16bc8a33  Merge branch 'devel' into for-next

elapsed time: 727m

configs tested: 125
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                          randconfig-c001
sh                          kfr2r09_defconfig
mips                     loongson1b_defconfig
powerpc                 mpc837x_mds_defconfig
sh                     magicpanelr2_defconfig
arm                            lart_defconfig
m68k                        m5407c3_defconfig
sh                            migor_defconfig
sh                              ul2_defconfig
parisc64                            defconfig
powerpc                         ps3_defconfig
arm                       multi_v4t_defconfig
mips                            gpr_defconfig
arc                        nsim_700_defconfig
arm                        keystone_defconfig
powerpc                      bamboo_defconfig
openrisc                  or1klitex_defconfig
ia64                            zx1_defconfig
powerpc                       holly_defconfig
arm                            hisi_defconfig
powerpc                   motionpro_defconfig
m68k                        m5307c3_defconfig
arm                          iop32x_defconfig
sh                                  defconfig
arm                         axm55xx_defconfig
powerpc                        warp_defconfig
sh                         ecovec24_defconfig
sh                           se7780_defconfig
arm                  randconfig-c002-20220301
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
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
s390                             allmodconfig
s390                                defconfig
parisc                           allyesconfig
s390                             allyesconfig
i386                             allyesconfig
i386                              debian-10.3
i386                   debian-10.3-kselftests
i386                                defconfig
sparc                               defconfig
sparc                            allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a003
i386                          randconfig-a001
i386                          randconfig-a005
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
arc                  randconfig-r043-20220301
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                                  kexec
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests

clang tested configs:
powerpc                        icon_defconfig
arm                         orion5x_defconfig
s390                             alldefconfig
mips                           ip28_defconfig
powerpc                  mpc866_ads_defconfig
powerpc                      walnut_defconfig
arm                         bcm2835_defconfig
arm                         palmz72_defconfig
arm                        neponset_defconfig
arm                   milbeaut_m10v_defconfig
arm                         lpc32xx_defconfig
arm                     am200epdkit_defconfig
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a016
x86_64                        randconfig-a014
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
hexagon              randconfig-r045-20220301
hexagon              randconfig-r041-20220301
riscv                randconfig-r042-20220301
s390                 randconfig-r044-20220301

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
