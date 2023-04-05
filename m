Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C10B6D72AE
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Apr 2023 05:15:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236725AbjDEDO7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 4 Apr 2023 23:14:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236799AbjDEDO7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Apr 2023 23:14:59 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A24E30EF
        for <linux-gpio@vger.kernel.org>; Tue,  4 Apr 2023 20:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680664498; x=1712200498;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=t4C3rAcsN3mfn26rH64P0w/QAbA4xP0e00+FEq4afu0=;
  b=kuK9MSQARodFYq5vLmW9zx+sR+Ts1oDhWfhxz1Wko67P6WL1JF55NBR8
   BosQbB9SfYqQBkuJuJiLkYml7r27uJGXJptfbKMJX8rVwebS56iaP5fje
   H9Z33c5Ddtlzxq/faJPPwrtj05WpL0KWT6iqPxosSwIOTMP95FciPq7P/
   P7R/xLcddbczmfya/SzZgbe16R5L/WO2TxsTsVT1ZBsarRJJ/WlXT5NhE
   sw0fJQDSYCNa9FyQNZPma73MAVwoHdAc3GbSYNPExi4a4ayfWv6/0JRXE
   GvK85Q7WOB0/6pOEr19BumBKi30IPYHSENJ83VcfdipaMLs/Kt4xT/nFJ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="428643408"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; 
   d="scan'208";a="428643408"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2023 20:14:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="810479247"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; 
   d="scan'208";a="810479247"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 04 Apr 2023 20:14:56 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pjtbr-000QEu-1a;
        Wed, 05 Apr 2023 03:14:55 +0000
Date:   Wed, 05 Apr 2023 11:14:10 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 743d3336029ffe2bb38e982a3b572ced243c6d43
Message-ID: <642ce782.oq2wg9XY3OL8CYCT%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 743d3336029ffe2bb38e982a3b572ced243c6d43  pinctrl: mlxbf3: set varaiable mlxbf3_pmx_funcs storage-class-specifier to static

elapsed time: 720m

configs tested: 111
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r025-20230403   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r033-20230403   gcc  
arc                  randconfig-r034-20230404   gcc  
arc                  randconfig-r043-20230403   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r006-20230403   gcc  
arm                  randconfig-r015-20230403   clang
arm                  randconfig-r026-20230403   clang
arm                  randconfig-r046-20230403   clang
arm64                            allyesconfig   gcc  
arm64        buildonly-randconfig-r001-20230404   gcc  
arm64                               defconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r004-20230403   gcc  
csky                 randconfig-r021-20230403   gcc  
csky                 randconfig-r034-20230403   gcc  
hexagon      buildonly-randconfig-r003-20230404   clang
hexagon      buildonly-randconfig-r004-20230404   clang
hexagon              randconfig-r005-20230403   clang
hexagon              randconfig-r041-20230403   clang
hexagon              randconfig-r045-20230403   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230403   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230403   clang
i386                 randconfig-a002-20230403   clang
i386                 randconfig-a003-20230403   clang
i386                 randconfig-a004-20230403   clang
i386                 randconfig-a005-20230403   clang
i386                 randconfig-a006-20230403   clang
i386                 randconfig-a011-20230403   gcc  
i386                 randconfig-a012-20230403   gcc  
i386                 randconfig-a013-20230403   gcc  
i386                 randconfig-a014-20230403   gcc  
i386                 randconfig-a015-20230403   gcc  
i386                 randconfig-a016-20230403   gcc  
i386                 randconfig-r031-20230403   clang
ia64                             allmodconfig   gcc  
ia64         buildonly-randconfig-r001-20230403   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r002-20230403   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r003-20230403   gcc  
loongarch            randconfig-r013-20230403   gcc  
loongarch            randconfig-r035-20230404   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r012-20230403   gcc  
m68k                 randconfig-r023-20230403   gcc  
m68k                 randconfig-r033-20230404   gcc  
microblaze   buildonly-randconfig-r002-20230404   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips         buildonly-randconfig-r005-20230403   gcc  
mips                 randconfig-r024-20230403   clang
mips                 randconfig-r031-20230404   clang
nios2                               defconfig   gcc  
nios2                randconfig-r032-20230403   gcc  
nios2                randconfig-r035-20230403   gcc  
openrisc             randconfig-r011-20230403   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r032-20230404   gcc  
riscv                randconfig-r036-20230403   clang
riscv                randconfig-r042-20230403   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r006-20230404   clang
s390                                defconfig   gcc  
s390                 randconfig-r044-20230403   gcc  
sh                               allmodconfig   gcc  
sparc        buildonly-randconfig-r006-20230403   gcc  
sparc                               defconfig   gcc  
sparc64              randconfig-r014-20230403   gcc  
sparc64              randconfig-r022-20230403   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230403   clang
x86_64               randconfig-a002-20230403   clang
x86_64               randconfig-a003-20230403   clang
x86_64               randconfig-a004-20230403   clang
x86_64               randconfig-a005-20230403   clang
x86_64               randconfig-a006-20230403   clang
x86_64               randconfig-a011-20230403   gcc  
x86_64               randconfig-a012-20230403   gcc  
x86_64               randconfig-a013-20230403   gcc  
x86_64               randconfig-a014-20230403   gcc  
x86_64               randconfig-a015-20230403   gcc  
x86_64               randconfig-a016-20230403   gcc  
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r002-20230403   gcc  
xtensa       buildonly-randconfig-r003-20230403   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
