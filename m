Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85BBF710047
	for <lists+linux-gpio@lfdr.de>; Wed, 24 May 2023 23:58:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230138AbjEXV6Z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 May 2023 17:58:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229551AbjEXV6Y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 May 2023 17:58:24 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4216D3
        for <linux-gpio@vger.kernel.org>; Wed, 24 May 2023 14:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684965503; x=1716501503;
  h=date:from:to:cc:subject:message-id;
  bh=a+F++Xd6V1DGQ12VtlmamSNTl9MIu4ZyrbWlWRl/PJk=;
  b=e/eXTxd67QRxq0g7eTurBAnNnDS1tyC2L6nU9nWeSvc1TP7Fe3GX2+0F
   FfzvNk2R5Hb1hWQMfYloR09OqVuFPzwxNrYGMgWauaFBlpuOI4ZaTaZsR
   QKjv465WxTL6+228xkaTTdb8kumKLCTuF9gVIr7qc78JVs/C3hFEoXa+o
   Jc2I22dmiMI5WyTjD9qCvuAd/PglL5Xi6oa8Vq1N5+0Vmdlc4WWxdedoh
   K5QZdV7gADKHF+nP/d9uPVEVItXmDVFqrH0gbS9+p9Hc5SZwaOACkP5le
   iuxeMjzkJaehuxmqzN2lQdmRcNIU/HCLtHQa/11ppEtPOofKADXT2y/mx
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="440065110"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; 
   d="scan'208";a="440065110"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2023 14:58:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="774408006"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; 
   d="scan'208";a="774408006"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 24 May 2023 14:58:22 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1q1wUv-000FBn-3A;
        Wed, 24 May 2023 21:58:21 +0000
Date:   Thu, 25 May 2023 05:57:47 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 226d95a8668c256e4a8fc42018b75dcd115c4f6a
Message-ID: <20230524215747.ozREa%lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: INFO setup_repo_specs: /db/releases/20230524230549/lkp-src/repo/*/linusw-pinctrl
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 226d95a8668c256e4a8fc42018b75dcd115c4f6a  Merge branch 'devel' into for-next

elapsed time: 730m

configs tested: 140
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r005-20230524   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r043-20230524   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r046-20230524   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r006-20230524   gcc  
csky         buildonly-randconfig-r006-20230524   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r013-20230524   gcc  
hexagon              randconfig-r041-20230524   clang
hexagon              randconfig-r045-20230524   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i061-20230524   gcc  
i386                 randconfig-i062-20230524   gcc  
i386                 randconfig-i063-20230524   gcc  
i386                 randconfig-i064-20230524   gcc  
i386                 randconfig-i065-20230524   gcc  
i386                 randconfig-i066-20230524   gcc  
i386                 randconfig-i071-20230524   clang
i386                 randconfig-i072-20230524   clang
i386                 randconfig-i073-20230524   clang
i386                 randconfig-i074-20230524   clang
i386                 randconfig-i075-20230524   clang
i386                 randconfig-i076-20230524   clang
i386                 randconfig-i081-20230524   clang
i386                 randconfig-i082-20230524   clang
i386                 randconfig-i083-20230524   clang
i386                 randconfig-i084-20230524   clang
i386                 randconfig-i085-20230524   clang
i386                 randconfig-i086-20230524   clang
i386                 randconfig-i091-20230524   gcc  
i386                 randconfig-i092-20230524   gcc  
i386                 randconfig-i093-20230524   gcc  
i386                 randconfig-i094-20230524   gcc  
i386                 randconfig-i095-20230524   gcc  
i386                 randconfig-i096-20230524   gcc  
i386                 randconfig-r021-20230524   clang
ia64                             allmodconfig   gcc  
ia64         buildonly-randconfig-r001-20230524   gcc  
ia64                                defconfig   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r024-20230524   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
microblaze           randconfig-r012-20230524   gcc  
microblaze           randconfig-r015-20230524   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips         buildonly-randconfig-r003-20230524   clang
mips                 randconfig-r035-20230524   clang
nios2                               defconfig   gcc  
nios2                randconfig-r033-20230524   gcc  
openrisc             randconfig-r022-20230524   gcc  
parisc       buildonly-randconfig-r004-20230524   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r011-20230524   clang
powerpc              randconfig-r014-20230524   clang
powerpc              randconfig-r025-20230524   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r023-20230524   clang
riscv                randconfig-r042-20230524   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r002-20230524   clang
s390                                defconfig   gcc  
s390                 randconfig-r044-20230524   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r003-20230524   gcc  
sh                   randconfig-r004-20230524   gcc  
sparc        buildonly-randconfig-r005-20230524   gcc  
sparc                               defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230524   gcc  
x86_64               randconfig-a002-20230524   gcc  
x86_64               randconfig-a003-20230524   gcc  
x86_64               randconfig-a004-20230524   gcc  
x86_64               randconfig-a005-20230524   gcc  
x86_64               randconfig-a006-20230524   gcc  
x86_64               randconfig-a011-20230524   clang
x86_64               randconfig-a012-20230524   clang
x86_64               randconfig-a013-20230524   clang
x86_64               randconfig-a014-20230524   clang
x86_64               randconfig-a015-20230524   clang
x86_64               randconfig-a016-20230524   clang
x86_64               randconfig-r026-20230524   clang
x86_64               randconfig-x051-20230524   clang
x86_64               randconfig-x052-20230524   clang
x86_64               randconfig-x053-20230524   clang
x86_64               randconfig-x054-20230524   clang
x86_64               randconfig-x055-20230524   clang
x86_64               randconfig-x056-20230524   clang
x86_64               randconfig-x061-20230524   clang
x86_64               randconfig-x062-20230524   clang
x86_64               randconfig-x063-20230524   clang
x86_64               randconfig-x064-20230524   clang
x86_64               randconfig-x065-20230524   clang
x86_64               randconfig-x066-20230524   clang
x86_64               randconfig-x071-20230524   gcc  
x86_64               randconfig-x072-20230524   gcc  
x86_64               randconfig-x073-20230524   gcc  
x86_64               randconfig-x074-20230524   gcc  
x86_64               randconfig-x075-20230524   gcc  
x86_64               randconfig-x076-20230524   gcc  
x86_64               randconfig-x081-20230524   gcc  
x86_64               randconfig-x082-20230524   gcc  
x86_64               randconfig-x083-20230524   gcc  
x86_64               randconfig-x084-20230524   gcc  
x86_64               randconfig-x085-20230524   gcc  
x86_64               randconfig-x086-20230524   gcc  
x86_64               randconfig-x091-20230524   clang
x86_64               randconfig-x092-20230524   clang
x86_64               randconfig-x093-20230524   clang
x86_64               randconfig-x094-20230524   clang
x86_64               randconfig-x095-20230524   clang
x86_64               randconfig-x096-20230524   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r032-20230524   gcc  
xtensa               randconfig-r034-20230524   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
