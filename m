Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B01AA736316
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jun 2023 07:19:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230013AbjFTFTH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 20 Jun 2023 01:19:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230050AbjFTFS5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 20 Jun 2023 01:18:57 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6585910E4
        for <linux-gpio@vger.kernel.org>; Mon, 19 Jun 2023 22:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687238336; x=1718774336;
  h=date:from:to:cc:subject:message-id;
  bh=f36tFH2KxxifTXCqpreg84Jj5UYUiY9mv86vRa0LmHg=;
  b=fnKRT605MyXqR+HVVjvihj4BRglAM+YUOUbiLuELxPbtrFilsolELqV/
   4n/uAaAU0oefro/1+NwvWHcCP8E1WRenl8n7r7ihYQSmUCAL8TQ1xm02o
   mqVATMYh6wtKChQXqIOwA8wNNuXxEHb2Nku99IyJPV5RTEgS3/Ig4++DU
   maeG712bD3ymdCoo/kN5HHDhG0dDMQTcT5gOvsBaiaWGyQC2yNCw32GY6
   G1OR6DFQKDNzYUSUXWc9MMxEnn9XB5MmDzPt7xOXlI5znoWXQlOR9HXzJ
   2PvaVAhotxz4lEq4S7YO1rydzWACryM4bJ2Ho6MTXkKSiwfC5fHyzse84
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="358635906"
X-IronPort-AV: E=Sophos;i="6.00,256,1681196400"; 
   d="scan'208";a="358635906"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2023 22:18:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="717099173"
X-IronPort-AV: E=Sophos;i="6.00,256,1681196400"; 
   d="scan'208";a="717099173"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 19 Jun 2023 22:18:55 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qBTlW-0005Wu-2G;
        Tue, 20 Jun 2023 05:18:54 +0000
Date:   Tue, 20 Jun 2023 13:18:14 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 ff7a1790fbf92f1bdd0966d3f0da3ea808ede876
Message-ID: <202306201312.jgi7FvVN-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: ff7a1790fbf92f1bdd0966d3f0da3ea808ede876  gpiolib: Fix irq_domain resource tracking for gpiochip_irqchip_add_domain()

elapsed time: 731m

configs tested: 109
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r001-20230619   gcc  
alpha                randconfig-r004-20230619   gcc  
alpha                randconfig-r035-20230619   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r043-20230619   gcc  
arc                    vdk_hs38_smp_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                          gemini_defconfig   gcc  
arm                          moxart_defconfig   clang
arm                  randconfig-r046-20230619   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r016-20230619   gcc  
hexagon              randconfig-r041-20230619   clang
hexagon              randconfig-r045-20230619   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230619   gcc  
i386         buildonly-randconfig-r005-20230619   gcc  
i386         buildonly-randconfig-r006-20230619   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230619   gcc  
i386                 randconfig-i002-20230619   gcc  
i386                 randconfig-i003-20230619   gcc  
i386                 randconfig-i004-20230619   gcc  
i386                 randconfig-i005-20230619   gcc  
i386                 randconfig-i006-20230619   gcc  
i386                 randconfig-i011-20230619   clang
i386                 randconfig-i012-20230619   clang
i386                 randconfig-i013-20230619   clang
i386                 randconfig-i014-20230619   clang
i386                 randconfig-i015-20230619   clang
i386                 randconfig-i016-20230619   clang
i386                 randconfig-r002-20230619   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r015-20230619   gcc  
loongarch            randconfig-r036-20230619   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r013-20230619   gcc  
m68k                 randconfig-r034-20230619   gcc  
microblaze           randconfig-r031-20230619   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                            gpr_defconfig   gcc  
nios2                               defconfig   gcc  
openrisc             randconfig-r003-20230619   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                      bamboo_defconfig   gcc  
powerpc                     taishan_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r011-20230619   clang
riscv                randconfig-r042-20230619   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r032-20230619   gcc  
s390                 randconfig-r044-20230619   clang
sh                               allmodconfig   gcc  
sh                         microdev_defconfig   gcc  
sh                   randconfig-r012-20230619   gcc  
sh                   randconfig-r021-20230619   gcc  
sh                   randconfig-r026-20230619   gcc  
sh                   secureedge5410_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
um                               alldefconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230619   gcc  
x86_64       buildonly-randconfig-r002-20230619   gcc  
x86_64       buildonly-randconfig-r003-20230619   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230619   gcc  
x86_64               randconfig-a002-20230619   gcc  
x86_64               randconfig-a003-20230619   gcc  
x86_64               randconfig-a004-20230619   gcc  
x86_64               randconfig-a005-20230619   gcc  
x86_64               randconfig-a006-20230619   gcc  
x86_64               randconfig-a011-20230619   clang
x86_64               randconfig-a012-20230619   clang
x86_64               randconfig-a013-20230619   clang
x86_64               randconfig-a014-20230619   clang
x86_64               randconfig-a015-20230619   clang
x86_64               randconfig-a016-20230619   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r005-20230619   gcc  
xtensa               randconfig-r025-20230619   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
