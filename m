Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DE591F7370
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jun 2020 07:26:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725858AbgFLF0Q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Jun 2020 01:26:16 -0400
Received: from mga06.intel.com ([134.134.136.31]:8462 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725763AbgFLF0Q (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 12 Jun 2020 01:26:16 -0400
IronPort-SDR: 8sK+3kA0lypb55S+ZEuGNlHqLq0C2vfu9wQA+9747/PatDtmDHr11NAWU3EKWrhPuLr8mhdVxQ
 EKRYdF+qjOsw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2020 22:26:15 -0700
IronPort-SDR: 2nNTirBp+Dsa2qWeZb8I9SgYgUGkUpBVO5hcDq35NtWghadFafAI3sECT0dHtyhak9yX9Lc5bf
 FYYM3RhlKiaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,501,1583222400"; 
   d="scan'208";a="473944902"
Received: from lkp-server01.sh.intel.com (HELO b6eec31c25be) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 11 Jun 2020 22:26:14 -0700
Received: from kbuild by b6eec31c25be with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jjcCj-0000XF-I4; Fri, 12 Jun 2020 05:26:13 +0000
Date:   Fri, 12 Jun 2020 13:25:31 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [pinctrl:for-next] BUILD SUCCESS
 02e1254d7740d1df8cc5e760a442d3c835f73066
Message-ID: <5ee311cb.JNQdSbjYHml4UPTi%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git  for-next
branch HEAD: 02e1254d7740d1df8cc5e760a442d3c835f73066  pinctrl: qcom: ipq6018 Add missing pins in qpic pin group

elapsed time: 1035m

configs tested: 104
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

arm64                            allyesconfig
arm64                               defconfig
arm64                            allmodconfig
arm64                             allnoconfig
arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                               allnoconfig
i386                              allnoconfig
i386                             allyesconfig
i386                                defconfig
i386                              debian-10.3
ia64                             allmodconfig
ia64                                defconfig
ia64                              allnoconfig
ia64                             allyesconfig
m68k                           sun3_defconfig
m68k                             allmodconfig
m68k                              allnoconfig
m68k                                defconfig
m68k                             allyesconfig
openrisc                            defconfig
openrisc                         allyesconfig
nios2                               defconfig
nios2                            allyesconfig
c6x                              allyesconfig
c6x                               allnoconfig
nds32                               defconfig
nds32                             allnoconfig
csky                             allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                              defconfig
xtensa                           allyesconfig
h8300                            allyesconfig
h8300                            allmodconfig
arc                                 defconfig
arc                              allyesconfig
sh                               allmodconfig
sh                                allnoconfig
microblaze                        allnoconfig
mips                             allyesconfig
mips                              allnoconfig
mips                             allmodconfig
parisc                            allnoconfig
parisc                              defconfig
parisc                           allyesconfig
parisc                           allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
powerpc                             defconfig
powerpc                          rhel-kconfig
i386                 randconfig-a006-20200611
i386                 randconfig-a002-20200611
i386                 randconfig-a001-20200611
i386                 randconfig-a004-20200611
i386                 randconfig-a005-20200611
i386                 randconfig-a003-20200611
x86_64               randconfig-a015-20200611
x86_64               randconfig-a011-20200611
x86_64               randconfig-a016-20200611
x86_64               randconfig-a012-20200611
x86_64               randconfig-a014-20200611
x86_64               randconfig-a013-20200611
x86_64               randconfig-a001-20200612
x86_64               randconfig-a003-20200612
x86_64               randconfig-a002-20200612
x86_64               randconfig-a006-20200612
x86_64               randconfig-a005-20200612
x86_64               randconfig-a004-20200612
i386                 randconfig-a015-20200611
i386                 randconfig-a011-20200611
i386                 randconfig-a014-20200611
i386                 randconfig-a013-20200611
i386                 randconfig-a016-20200611
i386                 randconfig-a012-20200611
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
s390                                defconfig
s390                             allyesconfig
s390                              allnoconfig
s390                             allmodconfig
sparc                            allyesconfig
sparc                               defconfig
sparc64                             defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                          allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
um                               allmodconfig
x86_64                               rhel-7.6
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                                   rhel
x86_64                         rhel-7.2-clear
x86_64                                    lkp
x86_64                              fedora-25

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
