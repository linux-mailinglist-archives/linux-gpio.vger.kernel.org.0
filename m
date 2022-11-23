Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9430E63521B
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Nov 2022 09:18:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236472AbiKWIST (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Nov 2022 03:18:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236483AbiKWISN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Nov 2022 03:18:13 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A052242F50
        for <linux-gpio@vger.kernel.org>; Wed, 23 Nov 2022 00:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669191487; x=1700727487;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=qxiMW1cO0tZVcF0/qrwXkURAuuucAMdpLze/u6hTqv4=;
  b=jFi4SrV4W2ybKki/Si5lWti8GJI7Xanq4nSpYIqb1Y/2EPIBxbJPc1Pf
   0BWvlxerOXOvXWmFmDW2SdVdH89CDHejUKrqz8Vd+fffU8jFLCv3fZ28x
   VNogT+9fJCbd0Dqjyw7mrhB+Y8YWLeoItK3HqMzISeDrfWw4x9O917/vj
   qePdD7stmtUCohnsX2Lnj9fcbyLmcsQjHrWeNqXDIKRzJP6TRFHaxUDkb
   00V+5AYNiPY9pJs4Pv9MLURRtHb3fjSuHLkkcGIemTahywZc6kMOPLmM/
   cx105s7h7qMouu7jqgob++HRM1mb0O5ZE722pqFBI5JYcWplYf9nt9cxv
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="311639569"
X-IronPort-AV: E=Sophos;i="5.96,186,1665471600"; 
   d="scan'208";a="311639569"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2022 00:18:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="816395504"
X-IronPort-AV: E=Sophos;i="5.96,186,1665471600"; 
   d="scan'208";a="816395504"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 23 Nov 2022 00:18:03 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oxkxG-0002Um-2C;
        Wed, 23 Nov 2022 08:18:02 +0000
Date:   Wed, 23 Nov 2022 16:17:10 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 a8acc11643082a706de86a19f1f824712d971984
Message-ID: <637dd706.UMyrER0Me5vdoDsh%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: a8acc11643082a706de86a19f1f824712d971984  pinctrl: k210: call of_node_put()

elapsed time: 1375m

configs tested: 101
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
i386                 randconfig-a011-20221121
i386                 randconfig-a013-20221121
i386                 randconfig-a014-20221121
i386                 randconfig-a015-20221121
i386                 randconfig-a016-20221121
i386                 randconfig-a012-20221121
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64               randconfig-a012-20221121
x86_64                              defconfig
x86_64               randconfig-a011-20221121
x86_64               randconfig-a014-20221121
x86_64               randconfig-a016-20221121
x86_64               randconfig-a013-20221121
x86_64               randconfig-a015-20221121
x86_64                               rhel-8.3
powerpc                           allnoconfig
powerpc                          allmodconfig
mips                             allyesconfig
arc                                 defconfig
s390                             allmodconfig
sh                               allmodconfig
alpha                               defconfig
x86_64                           allyesconfig
s390                                defconfig
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
i386                                defconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
ia64                             allmodconfig
s390                             allyesconfig
m68k                             allyesconfig
arc                  randconfig-r043-20221120
riscv                randconfig-r042-20221121
arc                  randconfig-r043-20221121
s390                 randconfig-r044-20221121
i386                             allyesconfig
x86_64                            allnoconfig
m68k                       m5208evb_defconfig
arm                          gemini_defconfig
arm                            pleb_defconfig
parisc                generic-64bit_defconfig
sh                     sh7710voipgw_defconfig
i386                          randconfig-c001
arm                                 defconfig
powerpc                      pcm030_defconfig
powerpc                mpc7448_hpc2_defconfig
arc                         haps_hs_defconfig
arc                      axs103_smp_defconfig
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
powerpc                      makalu_defconfig
ia64                      gensparse_defconfig
xtensa                          iss_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
loongarch                           defconfig
loongarch                         allnoconfig
nios2                               defconfig
parisc                              defconfig
parisc64                            defconfig
sparc                               defconfig
csky                                defconfig
x86_64                                  kexec
arm                              allyesconfig
arm64                            allyesconfig

clang tested configs:
x86_64               randconfig-a004-20221121
x86_64               randconfig-a001-20221121
x86_64               randconfig-a003-20221121
x86_64               randconfig-a002-20221121
x86_64               randconfig-a005-20221121
x86_64               randconfig-a006-20221121
i386                 randconfig-a001-20221121
i386                 randconfig-a003-20221121
i386                 randconfig-a005-20221121
i386                 randconfig-a002-20221121
i386                 randconfig-a006-20221121
i386                 randconfig-a004-20221121
hexagon              randconfig-r041-20221120
hexagon              randconfig-r041-20221121
hexagon              randconfig-r045-20221120
hexagon              randconfig-r045-20221121
riscv                randconfig-r042-20221120
s390                 randconfig-r044-20221120
x86_64                        randconfig-k001
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
