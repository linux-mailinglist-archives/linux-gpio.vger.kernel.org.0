Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92863350BEF
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Apr 2021 03:27:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232555AbhDAB0n (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Mar 2021 21:26:43 -0400
Received: from mga12.intel.com ([192.55.52.136]:19988 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229959AbhDAB0M (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 31 Mar 2021 21:26:12 -0400
IronPort-SDR: dVL/cD37ktb66613wlkFrRCau+5EcBBwLZhUXUjaM7x2a69l8/vk84CwnjCDQFEitFEHZpB88c
 X6faKhF6tavQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9940"; a="171542703"
X-IronPort-AV: E=Sophos;i="5.81,295,1610438400"; 
   d="scan'208";a="171542703"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2021 18:26:12 -0700
IronPort-SDR: 3/TE4W6ydcZgHrMKjIXgUa7NB/kxmtxZ/nAvwVV1IaCI+l2QhaJpGTOkCu3aedWItzD76JdUMN
 Ff6N0ij44hAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,295,1610438400"; 
   d="scan'208";a="607402609"
Received: from lkp-server01.sh.intel.com (HELO 69d8fcc516b7) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 31 Mar 2021 18:26:11 -0700
Received: from kbuild by 69d8fcc516b7 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lRm66-0006E0-Q8; Thu, 01 Apr 2021 01:26:10 +0000
Date:   Thu, 01 Apr 2021 09:25:44 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [pinctrl:for-next] BUILD SUCCESS
 e331c184d3f13ae5aad22b601cc43ae3a37147b3
Message-ID: <60652118.QkDg4T6+ZRBP/hSv%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: e331c184d3f13ae5aad22b601cc43ae3a37147b3  Merge branch 'devel' into for-next

elapsed time: 725m

configs tested: 66
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
riscv                            allyesconfig
i386                             allyesconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
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
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a004-20210330
i386                 randconfig-a006-20210330
i386                 randconfig-a003-20210330
i386                 randconfig-a002-20210330
i386                 randconfig-a001-20210330
i386                 randconfig-a005-20210330
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a012-20210330
x86_64               randconfig-a015-20210330
x86_64               randconfig-a014-20210330
x86_64               randconfig-a016-20210330
x86_64               randconfig-a013-20210330
x86_64               randconfig-a011-20210330

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
