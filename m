Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9677A701CE2
	for <lists+linux-gpio@lfdr.de>; Sun, 14 May 2023 12:38:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233366AbjENKi1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 14 May 2023 06:38:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233488AbjENKi0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 14 May 2023 06:38:26 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FEEE1715
        for <linux-gpio@vger.kernel.org>; Sun, 14 May 2023 03:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684060705; x=1715596705;
  h=date:from:to:cc:subject:message-id;
  bh=5jDsPLnZFXWzPwFQ/4VMS0fW/l+tOaXQqPDku3kbs5w=;
  b=C8CKuJBrOn+1sKXoW0jRf+JgNrChvn36OWHjvKhzd7K5gcpt9+L7zre9
   gPqQICBvG0aYAARhmoX7twVrfaM+SNsQAXqr5MRFPR5RHxT8rB8zoFZU5
   PQpZgmo0GEnpwNNmyaS8gJaTCj8Zu89s5dqvv7GE5sfpAnvOPRcrUjgwv
   7KZBb20JBysRbMNivDehVan0Nh6J5hcKz1aw1OlwkUiLxYQCfysgX8JT4
   4r6GJuR+Fg868ONr73gqvgzJ39A9ZV59YWc3GPtx6F2hzvBQ6LnG6mGH3
   HXVgwWTf739LFGvjCYQc9OTsdfcGBSgs94XHPJ5vnzhADqX+F8sRqwLkV
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10709"; a="340372151"
X-IronPort-AV: E=Sophos;i="5.99,274,1677571200"; 
   d="scan'208";a="340372151"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2023 03:38:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10709"; a="694723980"
X-IronPort-AV: E=Sophos;i="5.99,274,1677571200"; 
   d="scan'208";a="694723980"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 14 May 2023 03:38:23 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1py97P-0005vC-0Z;
        Sun, 14 May 2023 10:38:23 +0000
Date:   Sun, 14 May 2023 18:38:15 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-gpio:gpio-descriptors-omap] BUILD SUCCESS
 0d64391a391d8b6b25d4d04e34eff9aada77c659
Message-ID: <20230514103815.IcLJM%lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git gpio-descriptors-omap
branch HEAD: 0d64391a391d8b6b25d4d04e34eff9aada77c659  ARM/musb: omap2: Remove global GPIO numbers from TUSB6010

elapsed time: 721m

configs tested: 80
configs skipped: 52

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                randconfig-r021-20230514   gcc  
arc                      axs103_smp_defconfig   gcc  
arc                  randconfig-r023-20230514   gcc  
arc                  randconfig-r043-20230514   gcc  
arc                    vdk_hs38_smp_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm          buildonly-randconfig-r002-20230514   gcc  
arm                                 defconfig   gcc  
arm                          exynos_defconfig   gcc  
arm                         mv78xx0_defconfig   clang
arm                         nhk8815_defconfig   gcc  
arm                       omap2plus_defconfig   gcc  
arm                  randconfig-r046-20230514   gcc  
arm                           sama7_defconfig   clang
arm                        shmobile_defconfig   gcc  
arm64        buildonly-randconfig-r004-20230514   gcc  
csky                 randconfig-r016-20230514   gcc  
hexagon              randconfig-r003-20230514   clang
hexagon              randconfig-r022-20230514   clang
hexagon              randconfig-r025-20230514   clang
hexagon              randconfig-r034-20230514   clang
hexagon              randconfig-r041-20230514   clang
hexagon              randconfig-r045-20230514   clang
i386                          randconfig-a001   gcc  
i386                          randconfig-a002   clang
i386                          randconfig-a003   gcc  
i386                          randconfig-a004   clang
i386                          randconfig-a005   gcc  
i386                          randconfig-a006   clang
i386                          randconfig-a011   clang
i386                          randconfig-a012   gcc  
i386                          randconfig-a013   clang
i386                          randconfig-a014   gcc  
i386                          randconfig-a015   clang
i386                          randconfig-a016   gcc  
ia64                             alldefconfig   gcc  
loongarch    buildonly-randconfig-r003-20230514   gcc  
loongarch            randconfig-r011-20230514   gcc  
m68k         buildonly-randconfig-r001-20230514   gcc  
m68k                       m5275evb_defconfig   gcc  
mips                        bcm47xx_defconfig   gcc  
mips                  cavium_octeon_defconfig   clang
mips                     decstation_defconfig   gcc  
mips                      malta_kvm_defconfig   clang
mips                        qi_lb60_defconfig   clang
mips                 randconfig-r033-20230514   clang
nios2                         3c120_defconfig   gcc  
nios2                randconfig-r012-20230514   gcc  
nios2                randconfig-r035-20230514   gcc  
powerpc                 linkstation_defconfig   gcc  
powerpc                      pcm030_defconfig   gcc  
riscv                randconfig-r004-20230514   gcc  
riscv                randconfig-r042-20230514   clang
s390                 randconfig-r014-20230514   clang
s390                 randconfig-r044-20230514   clang
sh                         ecovec24_defconfig   gcc  
sh                          rsk7203_defconfig   gcc  
sh                           se7206_defconfig   gcc  
sparc                randconfig-r006-20230514   gcc  
sparc                randconfig-r015-20230514   gcc  
sparc                randconfig-r036-20230514   gcc  
sparc64      buildonly-randconfig-r006-20230514   gcc  
um                               alldefconfig   gcc  
um                                  defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                        randconfig-a001   clang
x86_64                        randconfig-a002   gcc  
x86_64                        randconfig-a003   clang
x86_64                        randconfig-a004   gcc  
x86_64                        randconfig-a005   clang
x86_64                        randconfig-a006   gcc  
x86_64                        randconfig-a011   gcc  
x86_64                        randconfig-a012   clang
x86_64                        randconfig-a013   gcc  
x86_64                        randconfig-a014   clang
x86_64                        randconfig-a015   gcc  
x86_64                        randconfig-a016   clang
xtensa                generic_kc705_defconfig   gcc  
xtensa                         virt_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
