Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD816267CFF
	for <lists+linux-gpio@lfdr.de>; Sun, 13 Sep 2020 02:42:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725889AbgIMAmP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 12 Sep 2020 20:42:15 -0400
Received: from mga05.intel.com ([192.55.52.43]:13406 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725868AbgIMAmO (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 12 Sep 2020 20:42:14 -0400
IronPort-SDR: eRnQrDDWELqMyx/5ZKVlSIMMeT3Xmr4R+ic5fI+iaW6Ho4yl0XelFkjHklNCEZd6za2u3gJLZr
 2jHzr0ZTpZ5Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9742"; a="243776904"
X-IronPort-AV: E=Sophos;i="5.76,420,1592895600"; 
   d="scan'208";a="243776904"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2020 17:42:13 -0700
IronPort-SDR: citNq4d+wxVrGAqRdVQUDRcvyz/bU1eS4V6+hlkTCYSXZzYIOrcu5IH/JgK9n+mOYu2Lr2j92y
 FKcm1B9tP94Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,420,1592895600"; 
   d="scan'208";a="345003414"
Received: from lkp-server01.sh.intel.com (HELO a75722977aa5) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 12 Sep 2020 17:42:11 -0700
Received: from kbuild by a75722977aa5 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kHG5q-0000jA-Es; Sun, 13 Sep 2020 00:42:10 +0000
Date:   Sun, 13 Sep 2020 08:42:07 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [pinctrl:devel] BUILD SUCCESS
 0662e4a190cfdb50df7a00bbc9aebe3ed3f09474
Message-ID: <5f5d6adf.vcFefYS+Ej2+x/Qq%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git  devel
branch HEAD: 0662e4a190cfdb50df7a00bbc9aebe3ed3f09474  pinctrl: rockchip: depend on OF

elapsed time: 724m

configs tested: 153
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                  mpc866_ads_defconfig
powerpc                      pcm030_defconfig
arm                          gemini_defconfig
mips                      malta_kvm_defconfig
sh                            titan_defconfig
mips                           ci20_defconfig
arm                  colibri_pxa300_defconfig
parisc                generic-64bit_defconfig
powerpc                     tqm8555_defconfig
powerpc                 mpc85xx_cds_defconfig
arm                              alldefconfig
powerpc                  mpc885_ads_defconfig
sh                           se7724_defconfig
mips                           mtx1_defconfig
mips                             allyesconfig
arm                      pxa255-idp_defconfig
arm                         assabet_defconfig
powerpc                     akebono_defconfig
powerpc                      ppc64e_defconfig
sparc                       sparc64_defconfig
arm                            hisi_defconfig
arm                     am200epdkit_defconfig
mips                            e55_defconfig
arc                                 defconfig
arm                        shmobile_defconfig
parisc                              defconfig
arm                          tango4_defconfig
h8300                            alldefconfig
arc                          axs103_defconfig
arm                     eseries_pxa_defconfig
arm                        mvebu_v5_defconfig
arc                             nps_defconfig
sh                           sh2007_defconfig
arm                        trizeps4_defconfig
sh                          kfr2r09_defconfig
mips                     decstation_defconfig
um                             i386_defconfig
arm                           tegra_defconfig
mips                   sb1250_swarm_defconfig
nios2                               defconfig
powerpc                      obs600_defconfig
h8300                               defconfig
arm                          pxa3xx_defconfig
mips                          rm200_defconfig
arm                          iop32x_defconfig
sh                           se7722_defconfig
mips                         tb0287_defconfig
powerpc                      pasemi_defconfig
arc                 nsimosci_hs_smp_defconfig
sh                           se7712_defconfig
arm                           spitz_defconfig
mips                           ip27_defconfig
h8300                    h8300h-sim_defconfig
arm                            u300_defconfig
arm                           sunxi_defconfig
arm                      jornada720_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
sh                               allmodconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a004-20200911
i386                 randconfig-a006-20200911
i386                 randconfig-a001-20200911
i386                 randconfig-a003-20200911
i386                 randconfig-a002-20200911
i386                 randconfig-a005-20200911
i386                 randconfig-a004-20200912
i386                 randconfig-a006-20200912
i386                 randconfig-a003-20200912
i386                 randconfig-a001-20200912
i386                 randconfig-a002-20200912
i386                 randconfig-a005-20200912
i386                 randconfig-a004-20200913
i386                 randconfig-a006-20200913
i386                 randconfig-a003-20200913
i386                 randconfig-a001-20200913
i386                 randconfig-a002-20200913
i386                 randconfig-a005-20200913
x86_64               randconfig-a014-20200911
x86_64               randconfig-a011-20200911
x86_64               randconfig-a012-20200911
x86_64               randconfig-a016-20200911
x86_64               randconfig-a015-20200911
x86_64               randconfig-a013-20200911
x86_64               randconfig-a014-20200913
x86_64               randconfig-a011-20200913
x86_64               randconfig-a012-20200913
x86_64               randconfig-a016-20200913
x86_64               randconfig-a015-20200913
x86_64               randconfig-a013-20200913
i386                 randconfig-a015-20200911
i386                 randconfig-a014-20200911
i386                 randconfig-a011-20200911
i386                 randconfig-a013-20200911
i386                 randconfig-a016-20200911
i386                 randconfig-a012-20200911
i386                 randconfig-a015-20200913
i386                 randconfig-a014-20200913
i386                 randconfig-a011-20200913
i386                 randconfig-a013-20200913
i386                 randconfig-a016-20200913
i386                 randconfig-a012-20200913
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a004-20200911
x86_64               randconfig-a006-20200911
x86_64               randconfig-a003-20200911
x86_64               randconfig-a002-20200911
x86_64               randconfig-a005-20200911
x86_64               randconfig-a001-20200911
x86_64               randconfig-a006-20200913
x86_64               randconfig-a004-20200913
x86_64               randconfig-a003-20200913
x86_64               randconfig-a002-20200913
x86_64               randconfig-a005-20200913
x86_64               randconfig-a001-20200913

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
