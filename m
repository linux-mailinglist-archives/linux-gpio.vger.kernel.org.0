Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 049916CD538
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Mar 2023 10:51:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231409AbjC2Iv1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Mar 2023 04:51:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231311AbjC2IvP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Mar 2023 04:51:15 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 663A646A8
        for <linux-gpio@vger.kernel.org>; Wed, 29 Mar 2023 01:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680079858; x=1711615858;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=I2wwxedT4VtcCFnYLMwPIlmp7+WjU4Ss3e5wI1Aw28E=;
  b=mRBsr+EGpNwdcLNBGvW5nIVqsZbpHdvQrsb5V34JFkbDAGZIt80ZRxRu
   UzFxyd4DcbVgO9DRjUr7DdUcmIk3YJI0xMcx89bKF8IPXXWYT+n5XV4jT
   /IRjUk/5HxsNaiWHAygnRqVAzHYmMzgmpNr/tAtyEv1aZpvrEsbqAZhG4
   KyA3TIomWccPXH5lsu8FpRJOUkIXLzOxjV2ylJDMxglBnqYGssuFhwDnl
   j9ZvO8h0kqsEb7lZQzC5iu6T0TLoUMOMdZVn703Xy2eN+ts/N+76iK8g1
   Srv9yziWrJLJ1hGP3xyrshtEBfZ6oCuQ7Dj04JIIdAJZ7M/2CVXD/ePEs
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="324724631"
X-IronPort-AV: E=Sophos;i="5.98,300,1673942400"; 
   d="scan'208";a="324724631"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2023 01:50:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="827809135"
X-IronPort-AV: E=Sophos;i="5.98,300,1673942400"; 
   d="scan'208";a="827809135"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 29 Mar 2023 01:50:44 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1phRVz-000JNc-0r;
        Wed, 29 Mar 2023 08:50:43 +0000
Date:   Wed, 29 Mar 2023 16:50:19 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 4b7e73b5db33a3f4d23e4648635a495a716d9fb5
Message-ID: <6423fbcb.DYc1oShqx4x/+I/h%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 4b7e73b5db33a3f4d23e4648635a495a716d9fb5  Merge branch 'devel' into for-next

elapsed time: 793m

configs tested: 132
configs skipped: 10

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r001-20230327   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r004-20230327   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r043-20230326   gcc  
arc                  randconfig-r043-20230327   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r001-20230326   gcc  
arm                  randconfig-r006-20230326   gcc  
arm                  randconfig-r025-20230326   clang
arm                  randconfig-r046-20230326   clang
arm                  randconfig-r046-20230327   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r003-20230326   gcc  
csky                 randconfig-r013-20230326   gcc  
csky                 randconfig-r022-20230326   gcc  
csky                 randconfig-r032-20230326   gcc  
csky                 randconfig-r032-20230327   gcc  
hexagon      buildonly-randconfig-r003-20230322   clang
hexagon              randconfig-r023-20230326   clang
hexagon              randconfig-r026-20230326   clang
hexagon              randconfig-r036-20230326   clang
hexagon              randconfig-r041-20230326   clang
hexagon              randconfig-r041-20230327   clang
hexagon              randconfig-r045-20230326   clang
hexagon              randconfig-r045-20230327   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230327   gcc  
i386                 randconfig-a002-20230327   gcc  
i386                 randconfig-a003-20230327   gcc  
i386                 randconfig-a004-20230327   gcc  
i386                 randconfig-a005-20230327   gcc  
i386                 randconfig-a006-20230327   gcc  
i386                 randconfig-a011-20230327   clang
i386                 randconfig-a012-20230327   clang
i386                 randconfig-a013-20230327   clang
i386                 randconfig-a014-20230327   clang
i386                 randconfig-a015-20230327   clang
i386                 randconfig-a016-20230327   clang
ia64                             allmodconfig   gcc  
ia64         buildonly-randconfig-r006-20230327   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r021-20230326   gcc  
ia64                 randconfig-r025-20230327   gcc  
ia64                 randconfig-r035-20230327   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r001-20230322   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r023-20230327   gcc  
loongarch            randconfig-r024-20230326   gcc  
loongarch            randconfig-r033-20230327   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r003-20230327   gcc  
m68k                 randconfig-r012-20230327   gcc  
m68k                 randconfig-r014-20230326   gcc  
m68k                 randconfig-r034-20230326   gcc  
microblaze   buildonly-randconfig-r006-20230322   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips         buildonly-randconfig-r004-20230327   clang
mips                 randconfig-r026-20230327   gcc  
nios2        buildonly-randconfig-r004-20230322   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r011-20230327   gcc  
nios2                randconfig-r016-20230327   gcc  
nios2                randconfig-r024-20230327   gcc  
nios2                randconfig-r031-20230327   gcc  
openrisc     buildonly-randconfig-r002-20230327   gcc  
openrisc             randconfig-r011-20230326   gcc  
openrisc             randconfig-r014-20230327   gcc  
openrisc             randconfig-r016-20230326   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r002-20230326   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r015-20230327   clang
riscv                randconfig-r042-20230326   gcc  
riscv                randconfig-r042-20230327   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r001-20230327   gcc  
s390                 randconfig-r044-20230326   gcc  
s390                 randconfig-r044-20230327   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r021-20230327   gcc  
sh                   randconfig-r031-20230326   gcc  
sparc        buildonly-randconfig-r003-20230327   gcc  
sparc        buildonly-randconfig-r005-20230327   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r004-20230326   gcc  
sparc                randconfig-r005-20230327   gcc  
sparc                randconfig-r015-20230326   gcc  
sparc                randconfig-r033-20230326   gcc  
sparc64              randconfig-r002-20230327   gcc  
sparc64              randconfig-r005-20230326   gcc  
sparc64              randconfig-r012-20230326   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230327   gcc  
x86_64               randconfig-a002-20230327   gcc  
x86_64               randconfig-a003-20230327   gcc  
x86_64               randconfig-a004-20230327   gcc  
x86_64               randconfig-a005-20230327   gcc  
x86_64               randconfig-a006-20230327   gcc  
x86_64               randconfig-a011-20230327   clang
x86_64               randconfig-a012-20230327   clang
x86_64               randconfig-a013-20230327   clang
x86_64               randconfig-a014-20230327   clang
x86_64               randconfig-a015-20230327   clang
x86_64               randconfig-a016-20230327   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r022-20230327   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
