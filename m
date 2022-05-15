Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4EB0E5278F8
	for <lists+linux-gpio@lfdr.de>; Sun, 15 May 2022 19:52:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237276AbiEORwW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 15 May 2022 13:52:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231983AbiEORwV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 15 May 2022 13:52:21 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8336910FF9
        for <linux-gpio@vger.kernel.org>; Sun, 15 May 2022 10:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652637140; x=1684173140;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=+f9RkfjYWs1acELuXgrwlwAf0ZwqYqLsdCw6hBkf4WI=;
  b=A7NBK0nBgIgICJQ5vKB7hZwyKLCt+kEj0BZXVqHirBXtAtn3O/P+DmYr
   CQvDOXg/TuLt1aQxa9uVhm7W51rIObaHWFq0J9o3SufQN7I/N7rriLlu7
   1Ou7+hxI+y3hJ4pEZH/TDtP9oesXNLo1M0fTYap0OKIcv5MLWiktCliSq
   pn8N+sPdv/JbzS/lxkhxvFyaqn4GoloQ9GwH1t75i8JqGv059duLzNf15
   eNtt7LqCclLZ7+PNm3SQv01wcY5VhRpthgrx6J2m5/WKIEbgYLvN3a5zF
   x+jQZBiDUfWvBvZIJlp/XrbJBSCJu9PbOFpmkUzpznaImTbps82nb9rdX
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10348"; a="268237626"
X-IronPort-AV: E=Sophos;i="5.91,228,1647327600"; 
   d="scan'208";a="268237626"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2022 10:52:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,228,1647327600"; 
   d="scan'208";a="659804516"
Received: from lkp-server01.sh.intel.com (HELO d1462bc4b09b) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 15 May 2022 10:52:14 -0700
Received: from kbuild by d1462bc4b09b with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nqIPe-0001re-0R;
        Sun, 15 May 2022 17:52:14 +0000
Date:   Mon, 16 May 2022 01:51:19 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 5f3841fafbb2cfab72977516d93b020349e0f474
Message-ID: <62813d97.p7SMVMXEf6Kh+auc%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 5f3841fafbb2cfab72977516d93b020349e0f474  Merge branch 'devel' into for-next

elapsed time: 2479m

configs tested: 105
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
arm                        trizeps4_defconfig
mips                         tb0226_defconfig
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
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
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
i386                              debian-10.3
i386                             allyesconfig
i386                   debian-10.3-kselftests
i386                                defconfig
sparc                               defconfig
sparc                            allyesconfig
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
