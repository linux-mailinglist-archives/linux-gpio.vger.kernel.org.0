Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79AF1530F95
	for <lists+linux-gpio@lfdr.de>; Mon, 23 May 2022 15:18:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234273AbiEWKsI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 May 2022 06:48:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234389AbiEWKsE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 May 2022 06:48:04 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 474D54CD5A
        for <linux-gpio@vger.kernel.org>; Mon, 23 May 2022 03:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653302878; x=1684838878;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=fJgg66b9jm9+gczMENkigikNQIHgxVB0H4V9HOUnnaI=;
  b=lp7f56DnaDwrQhLXWXTNfoq3oo5kINT/g9zSXNV887heVu21i63gfpIA
   Do/Pb59fRdW6D5jEXUsy3EtJvsaffKoP91tLCA9VO7Cvt2lcL0V/A97K1
   2Az1i/O0/5DKrfJILPHmpxobvowEWMUaIt0Xces4UBl8tOJDPXB6Iy24+
   cMRTVIuas+uKbFLpPiIpYHxnpA54I5W8IcfOO+HzBBmsk9DuUCy0259t+
   RN50QhlXAskMh5jONzZeW6Gg5iM7dwNqm1OC7WI2Nu7vm1Z8KgWxa18dy
   KQbTYiLbMm1Oay3ci7sTE8kcbHwpPPppirzTOMCguN5KN6ZL4fmohN6i4
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10355"; a="253057781"
X-IronPort-AV: E=Sophos;i="5.91,246,1647327600"; 
   d="scan'208";a="253057781"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2022 03:47:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,246,1647327600"; 
   d="scan'208";a="525864454"
Received: from lkp-server01.sh.intel.com (HELO db63a1be7222) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 23 May 2022 03:47:55 -0700
Received: from kbuild by db63a1be7222 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nt5bO-00015s-Ez;
        Mon, 23 May 2022 10:47:54 +0000
Date:   Mon, 23 May 2022 18:47:15 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 374e72d721d1b0c545d98d8767a346b9007278ef
Message-ID: <628b6633.2KyJDrEpyJ5+vj6O%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 374e72d721d1b0c545d98d8767a346b9007278ef  Merge tag 'intel-pinctrl-v5.19-2' of gitolite.kernel.org:pub/scm/linux/kernel/git/pinctrl/intel into devel

elapsed time: 720m

configs tested: 96
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                              allmodconfig
arm                                 defconfig
arm64                               defconfig
arm                              allyesconfig
arm64                            allyesconfig
mips                             allyesconfig
um                           x86_64_defconfig
riscv                            allmodconfig
um                             i386_defconfig
mips                             allmodconfig
riscv                            allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
s390                             allmodconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
s390                             allyesconfig
sparc                            allyesconfig
parisc                           allyesconfig
sh                               allmodconfig
h8300                            allyesconfig
xtensa                           allyesconfig
arc                              allyesconfig
alpha                            allyesconfig
nios2                            allyesconfig
arm                         lpc18xx_defconfig
mips                        bcm47xx_defconfig
m68k                        mvme16x_defconfig
powerpc                     asp8347_defconfig
powerpc                         ps3_defconfig
arm                           corgi_defconfig
mips                         tb0226_defconfig
arm                        clps711x_defconfig
arm                          pxa3xx_defconfig
mips                           jazz_defconfig
arm                        mvebu_v7_defconfig
sh                     magicpanelr2_defconfig
arm                          pxa910_defconfig
openrisc                         alldefconfig
mips                     decstation_defconfig
arm                           sunxi_defconfig
m68k                                defconfig
arm                            zeus_defconfig
arm                            qcom_defconfig
ia64                                defconfig
csky                                defconfig
alpha                               defconfig
arc                                 defconfig
s390                                defconfig
parisc                              defconfig
parisc64                            defconfig
nios2                               defconfig
sparc                               defconfig
i386                             allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
powerpc                           allnoconfig
i386                 randconfig-a001-20220523
i386                 randconfig-a006-20220523
i386                 randconfig-a002-20220523
i386                 randconfig-a005-20220523
i386                 randconfig-a003-20220523
i386                 randconfig-a004-20220523
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit

clang tested configs:
powerpc                          allyesconfig
powerpc                     mpc512x_defconfig
powerpc                      ppc44x_defconfig
arm                           omap1_defconfig
arm                            mmp2_defconfig
mips                     cu1830-neo_defconfig
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                 randconfig-a014-20220523
i386                 randconfig-a011-20220523
i386                 randconfig-a013-20220523
i386                 randconfig-a016-20220523
i386                 randconfig-a012-20220523
i386                 randconfig-a015-20220523
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
hexagon              randconfig-r045-20220522
hexagon              randconfig-r041-20220522

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
