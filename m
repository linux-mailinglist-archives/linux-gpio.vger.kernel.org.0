Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1D862232D4
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jul 2020 07:15:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726056AbgGQFP0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jul 2020 01:15:26 -0400
Received: from mga18.intel.com ([134.134.136.126]:3876 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725922AbgGQFP0 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 17 Jul 2020 01:15:26 -0400
IronPort-SDR: u2AfuTdd2R2HIg4XK/2cH0WCc8nhrDtx05OgiD4GeRvHWK66fp22aztH/yLBv8O0HRseecwoSn
 uF2uKla7jYrg==
X-IronPort-AV: E=McAfee;i="6000,8403,9684"; a="137000171"
X-IronPort-AV: E=Sophos;i="5.75,361,1589266800"; 
   d="scan'208";a="137000171"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2020 22:15:25 -0700
IronPort-SDR: I5T20xL+DzeGdV4gY9xv/RfuoVHYDpaYaLAKApJs1s2CsTjZQV26skM7FBvkQGmZPUUyF39t2G
 57t1QO5kH6mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,361,1589266800"; 
   d="scan'208";a="325340683"
Received: from lkp-server02.sh.intel.com (HELO 50058c6ee6fc) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 16 Jul 2020 22:15:24 -0700
Received: from kbuild by 50058c6ee6fc with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jwIiR-00006V-FF; Fri, 17 Jul 2020 05:15:23 +0000
Date:   Fri, 17 Jul 2020 13:14:37 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [gpio:gpiochip-no-driver-h] BUILD SUCCESS
 2a52c17cc480d559ac9141cc028e2ded81ed0350
Message-ID: <5f1133bd.dierrX+c6ruCwlmd%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git  gpiochip-no-driver-h
branch HEAD: 2a52c17cc480d559ac9141cc028e2ded81ed0350  pcmcia: pxa2xx_viper: Include dependency

elapsed time: 778m

configs tested: 86
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                               allnoconfig
arm64                            allyesconfig
arm64                               defconfig
arm64                            allmodconfig
arm64                             allnoconfig
i386                              allnoconfig
i386                                defconfig
i386                              debian-10.3
i386                             allyesconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                              allnoconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                              allnoconfig
m68k                           sun3_defconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
nios2                            allyesconfig
openrisc                            defconfig
c6x                              allyesconfig
c6x                               allnoconfig
openrisc                         allyesconfig
nds32                               defconfig
nds32                             allnoconfig
csky                             allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
h8300                            allmodconfig
xtensa                              defconfig
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
powerpc                          rhel-kconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
powerpc                             defconfig
i386                 randconfig-a016-20200716
i386                 randconfig-a011-20200716
i386                 randconfig-a015-20200716
i386                 randconfig-a012-20200716
i386                 randconfig-a013-20200716
i386                 randconfig-a014-20200716
i386                 randconfig-a016-20200717
i386                 randconfig-a011-20200717
i386                 randconfig-a015-20200717
i386                 randconfig-a012-20200717
i386                 randconfig-a013-20200717
i386                 randconfig-a014-20200717
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
s390                             allyesconfig
s390                              allnoconfig
s390                             allmodconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
sparc64                             defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                          allmodconfig
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                                   rhel
x86_64                                    lkp
x86_64                              fedora-25

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
