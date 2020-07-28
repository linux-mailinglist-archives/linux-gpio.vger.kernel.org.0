Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F56C23130D
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Jul 2020 21:47:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730244AbgG1Trb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Jul 2020 15:47:31 -0400
Received: from mga02.intel.com ([134.134.136.20]:52983 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730048AbgG1Trb (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 28 Jul 2020 15:47:31 -0400
IronPort-SDR: zFmNnNpOs2N3+9Cj5DmmsBYS28MTNyfaAAN/DoW9NsxS4OJSthEGRh3GfwgdduhlzPHUBjZGnT
 LVl4lSW0Q9Gw==
X-IronPort-AV: E=McAfee;i="6000,8403,9696"; a="139324188"
X-IronPort-AV: E=Sophos;i="5.75,407,1589266800"; 
   d="scan'208";a="139324188"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2020 12:47:30 -0700
IronPort-SDR: DO8Ls/og6xoKZepN8xBzZS9oiTGNdWPDfmhZ4WpVCzOJmW/jGTwZXZA8B0C4CvvsSfqP94Xl5c
 5UequE8hzLWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,407,1589266800"; 
   d="scan'208";a="286275814"
Received: from lkp-server01.sh.intel.com (HELO d27eb53fc52b) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 28 Jul 2020 12:47:29 -0700
Received: from kbuild by d27eb53fc52b with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1k0VZQ-000128-GY; Tue, 28 Jul 2020 19:47:28 +0000
Date:   Wed, 29 Jul 2020 03:47:05 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [gpio:gpio-descriptors-spi] BUILD SUCCESS
 7ab02f437c564cc0145e7259a4c51b0d05224e98
Message-ID: <5f2080b9.kXDRR4CyT9E7+Omk%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git  gpio-descriptors-spi
branch HEAD: 7ab02f437c564cc0145e7259a4c51b0d05224e98  spi: mpc512x-psc: Convert to use GPIO descriptors

elapsed time: 1813m

configs tested: 53
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
nds32                            alldefconfig
arm                       imx_v4_v5_defconfig
mips                           gcw0_defconfig
mips                      fuloong2e_defconfig
arm                      pxa255-idp_defconfig
s390                                defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
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
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
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

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
