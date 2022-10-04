Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6DA75F3D1D
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Oct 2022 09:19:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229573AbiJDHTb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 4 Oct 2022 03:19:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229486AbiJDHTa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Oct 2022 03:19:30 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0488440BEF
        for <linux-gpio@vger.kernel.org>; Tue,  4 Oct 2022 00:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664867969; x=1696403969;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=R38YFSkd52+mphgwNzXzJOm3gZnjDfIY6IaolHpbC64=;
  b=LBuf7AKqIGObyi8J4hnXK16Lq0RzRWLQvQJ1OLJ2WiXSw7y+3AGg/gc2
   YAQZgqfT5J6sYA305TUOx6PQbyluifHuZF/DzsomHTg50FQdki8nmiykY
   cjtpX2ejnb9AjbGOpQkoHTSWO7JaU5YmdF9/DfVegYGi3M71W9R94nnHc
   A453uoSZjFMOuvsr0qDJfJkbgKwOgZ14i6Wiq39WROWxPSDKwd747/bWq
   ydxg2yimPTpmoXb0QpJQZynaqQjfLPn9WqHNUboQHLBUICWbloeoScaX4
   36yxoa1xe5ZGmdRHjI1CeAOSGO5o7owYwOkOFYBHZNr7R8PDwMJmKE1oL
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10489"; a="304389139"
X-IronPort-AV: E=Sophos;i="5.93,367,1654585200"; 
   d="scan'208";a="304389139"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2022 00:19:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10489"; a="766238675"
X-IronPort-AV: E=Sophos;i="5.93,367,1654585200"; 
   d="scan'208";a="766238675"
Received: from lkp-server01.sh.intel.com (HELO 14cc182da2d0) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 04 Oct 2022 00:19:28 -0700
Received: from kbuild by 14cc182da2d0 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1ofcD9-0005QZ-1v;
        Tue, 04 Oct 2022 07:19:27 +0000
Date:   Tue, 04 Oct 2022 15:19:13 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 3c92506d86785967fd7e7933e04491b9276c2f00
Message-ID: <633bde71.b7uP6CzM0ffpAVb2%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 3c92506d86785967fd7e7933e04491b9276c2f00  gpio: tc3589x: Make irqchip immutable

Unverified Warning (likely false positive, please contact us if interested):

drivers/gpio/gpio-pca953x.c:478:24: warning: use of uninitialized value 'pinctrl' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]

Warning ids grouped by kconfigs:

gcc_recent_errors
`-- arm-randconfig-c002-20221002
    `-- drivers-gpio-gpio-pca953x.c:warning:use-of-uninitialized-value-pinctrl-CWE

elapsed time: 721m

configs tested: 84
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
arc                                 defconfig
alpha                               defconfig
s390                             allmodconfig
s390                                defconfig
x86_64                           rhel-8.3-kvm
x86_64                              defconfig
m68k                             allmodconfig
x86_64                           rhel-8.3-syz
arc                              allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                          rhel-8.3-func
x86_64                           allyesconfig
alpha                            allyesconfig
x86_64                    rhel-8.3-kselftests
s390                             allyesconfig
x86_64                               rhel-8.3
i386                                defconfig
m68k                             allyesconfig
powerpc                           allnoconfig
arm                                 defconfig
i386                 randconfig-a011-20221003
i386                 randconfig-a012-20221003
x86_64               randconfig-a011-20221003
riscv                randconfig-r042-20221003
i386                 randconfig-a013-20221003
i386                 randconfig-a015-20221003
arc                  randconfig-r043-20221003
x86_64               randconfig-a012-20221003
i386                 randconfig-a016-20221003
powerpc                          allmodconfig
sh                               allmodconfig
x86_64               randconfig-a013-20221003
i386                             allyesconfig
mips                             allyesconfig
x86_64               randconfig-a015-20221003
arc                  randconfig-r043-20221002
s390                 randconfig-r044-20221003
i386                 randconfig-a014-20221003
x86_64               randconfig-a014-20221003
x86_64               randconfig-a016-20221003
arm                              allyesconfig
arm64                            allyesconfig
ia64                             allmodconfig
arm                        realview_defconfig
xtensa                           alldefconfig
sh                          kfr2r09_defconfig
arm                          exynos_defconfig
sh                           se7619_defconfig
m68k                          sun3x_defconfig
powerpc                     tqm8548_defconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
powerpc                      mgcoge_defconfig
arc                 nsimosci_hs_smp_defconfig
powerpc                     mpc83xx_defconfig
sh                      rts7751r2d1_defconfig
nios2                               defconfig
m68k                          amiga_defconfig
arc                            hsdk_defconfig
loongarch                 loongson3_defconfig
powerpc                      cm5200_defconfig

clang tested configs:
hexagon              randconfig-r041-20221003
riscv                randconfig-r042-20221002
hexagon              randconfig-r041-20221002
s390                 randconfig-r044-20221002
i386                 randconfig-a004-20221003
i386                 randconfig-a003-20221003
i386                 randconfig-a002-20221003
i386                 randconfig-a001-20221003
x86_64               randconfig-a003-20221003
x86_64               randconfig-a002-20221003
hexagon              randconfig-r045-20221002
x86_64               randconfig-a001-20221003
hexagon              randconfig-r045-20221003
x86_64               randconfig-a004-20221003
i386                 randconfig-a005-20221003
i386                 randconfig-a006-20221003
x86_64               randconfig-a006-20221003
x86_64               randconfig-a005-20221003
x86_64                        randconfig-k001

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
