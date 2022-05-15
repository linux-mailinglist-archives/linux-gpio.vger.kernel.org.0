Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 013675278F9
	for <lists+linux-gpio@lfdr.de>; Sun, 15 May 2022 19:52:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237894AbiEORwX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 15 May 2022 13:52:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231983AbiEORwW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 15 May 2022 13:52:22 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBF9B11140
        for <linux-gpio@vger.kernel.org>; Sun, 15 May 2022 10:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652637140; x=1684173140;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=bDivBDzNlBLV23I9HQ7C5XnFHDpWPuyxeXVYxnHNXwQ=;
  b=Bdo0FDfCq9ySyN1f3zv1+nvXq3tGumYnzQd8cSoEHIzozbbbLqcxSzrO
   B3mqkdadovnl1SjdYxJxPDDNSBlRSQnz2j8RYIADK1ldapOvQcf/3vO3c
   qPS+4CUGSYMvJSuu47eGjY0SI7MaidDo2Ct3LCY+yFTiGcMtdhVYeuHmD
   bBxtcZqqdGgu2vrTVRu3Jntvf9NNaFraaOptzLGuKh+JJI2eSQ4gx0AgA
   EPDIVRSKmm4S6Suqa8RNJEJUZJzvhsrRZr2nE+Jgyrph0ld7+6TKKhOTF
   zHZxTQpQE/LhJ0TkoEAar+4xvGrOLZp60eoF1IXF6h5YLFdmHSA3zheS1
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10348"; a="333723384"
X-IronPort-AV: E=Sophos;i="5.91,228,1647327600"; 
   d="scan'208";a="333723384"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2022 10:52:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,228,1647327600"; 
   d="scan'208";a="699224451"
Received: from lkp-server01.sh.intel.com (HELO d1462bc4b09b) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 15 May 2022 10:52:14 -0700
Received: from kbuild by d1462bc4b09b with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nqIPd-0001rZ-Un;
        Sun, 15 May 2022 17:52:13 +0000
Date:   Mon, 16 May 2022 01:51:24 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 8b3dd882bfd2cf00da986bb0cf5c607e23c0f110
Message-ID: <62813d9c.uPhz3mlWT4EbNSVy%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 8b3dd882bfd2cf00da986bb0cf5c607e23c0f110  pinctrl: stm32: Unshadow np variable in stm32_pctl_probe()

elapsed time: 2480m

configs tested: 106
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-c001
mips                         tb0226_defconfig
arm                        trizeps4_defconfig
powerpc                      makalu_defconfig
sh                          r7785rp_defconfig
arm                         axm55xx_defconfig
nios2                         3c120_defconfig
m68k                       bvme6000_defconfig
sh                        sh7763rdp_defconfig
powerpc                           allnoconfig
powerpc                 mpc837x_mds_defconfig
mips                       capcella_defconfig
powerpc                  iss476-smp_defconfig
arm                     eseries_pxa_defconfig
arm                        cerfcube_defconfig
parisc                generic-64bit_defconfig
mips                           gcw0_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220512
ia64                             allmodconfig
ia64                             allyesconfig
ia64                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
csky                                defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                                defconfig
s390                             allmodconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                             allyesconfig
sparc                               defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
s390                 randconfig-r044-20220512
riscv                randconfig-r042-20220512
arc                  randconfig-r043-20220512
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                            allyesconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit
x86_64                               rhel-8.3

clang tested configs:
powerpc                          allmodconfig
mips                  cavium_octeon_defconfig
powerpc                     tqm8540_defconfig
riscv                             allnoconfig
mips                           rs90_defconfig
arm                        mvebu_v5_defconfig
powerpc                 mpc8315_rdb_defconfig
arm                          moxart_defconfig
powerpc                   lite5200b_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
hexagon              randconfig-r045-20220512
hexagon              randconfig-r041-20220512

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
