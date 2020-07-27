Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64D9A22F893
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Jul 2020 21:01:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728041AbgG0TBI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Jul 2020 15:01:08 -0400
Received: from mga03.intel.com ([134.134.136.65]:43396 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726967AbgG0TBI (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 27 Jul 2020 15:01:08 -0400
IronPort-SDR: vR59d2FRJZix5HA49IITiOIN/Use+05O+fdm4Bz21ljvrYOTo1qU+AR8kzU9up/fU6ytU242sG
 rPLXkWpFPKZQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9695"; a="151079319"
X-IronPort-AV: E=Sophos;i="5.75,403,1589266800"; 
   d="scan'208";a="151079319"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2020 12:01:07 -0700
IronPort-SDR: GsGhyVGFl9sWv8eTzoBbRYgv0DTdmNbWlgUlsqwKHh7ie23zRVU9IAv7fNYFUjX+/33z135maR
 boZ9VegTPXOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,403,1589266800"; 
   d="scan'208";a="289895215"
Received: from lkp-server01.sh.intel.com (HELO df0563f96c37) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 27 Jul 2020 12:01:05 -0700
Received: from kbuild by df0563f96c37 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1k08My-00020u-Uw; Mon, 27 Jul 2020 19:01:04 +0000
Date:   Tue, 28 Jul 2020 03:00:42 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [pinctrl:for-next] BUILD SUCCESS
 5a32a137edfe4744dde8acbeb6bab0338a48346a
Message-ID: <5f1f245a.nwpYP2/mkJy0YHYo%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git  for-next
branch HEAD: 5a32a137edfe4744dde8acbeb6bab0338a48346a  Merge branch 'devel' into for-next

elapsed time: 975m

configs tested: 62
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                             allyesconfig
i386                                defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
arc                              allyesconfig
nds32                             allnoconfig
nios2                            allyesconfig
nds32                               defconfig
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
sparc                            allyesconfig
sparc                               defconfig
nios2                               defconfig
openrisc                            defconfig
c6x                              allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a003-20200727
i386                 randconfig-a005-20200727
i386                 randconfig-a004-20200727
i386                 randconfig-a006-20200727
i386                 randconfig-a002-20200727
i386                 randconfig-a001-20200727
i386                 randconfig-a016-20200727
i386                 randconfig-a013-20200727
i386                 randconfig-a012-20200727
i386                 randconfig-a015-20200727
i386                 randconfig-a011-20200727
i386                 randconfig-a014-20200727
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
sparc64                             defconfig
x86_64                                   rhel
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                           allyesconfig
x86_64                              defconfig

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
