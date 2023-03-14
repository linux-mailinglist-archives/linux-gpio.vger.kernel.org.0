Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D13856B86E2
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Mar 2023 01:29:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230045AbjCNA3A (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Mar 2023 20:29:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229709AbjCNA27 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Mar 2023 20:28:59 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05A97498A6
        for <linux-gpio@vger.kernel.org>; Mon, 13 Mar 2023 17:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678753738; x=1710289738;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=6+6AxTiB7/wfuMCmztaO0EBnAxPXdKVZkSM8coHcJkQ=;
  b=avjDFv4qvzESO5DWD3gGLfPvEmUYIz7/0tU2GheWKwVRwDwSANRb7uz+
   9UeLB/g5cpBD0ROGNRGWKYgLqOdLZmOwOyT1MkDniYbV0NXfbPEV0XY2k
   dI8UsRzY9xZ1X5XhQJYlQOnllV5Lz19Dk836WfzaV0KhZk5jB2mZK2JGm
   Wwl39n4DIa6ajArTNdEP+XxkEinmIipD/Fp/uEggUbceiG3nQ4/RgKznD
   kEKGiKCjb2prpJ4xHtSH7eoJ1hpgmV5/of9F8F+uiwdB+0nX4TXog2Zzj
   d6puZoe4yw3Y7evj+83m5N6DGTnONV7cvuXfAlCyDTeuSoidei153Jxmx
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="316938280"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400"; 
   d="scan'208";a="316938280"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2023 17:28:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="924703645"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400"; 
   d="scan'208";a="924703645"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 13 Mar 2023 17:28:56 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pbsX9-0006J3-1L;
        Tue, 14 Mar 2023 00:28:55 +0000
Date:   Tue, 14 Mar 2023 08:28:28 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 10fe4a1399d259b380dafa0f669c0a209e4f8197
Message-ID: <640fbfac./TcBAfFwk5R0Yj1B%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 10fe4a1399d259b380dafa0f669c0a209e4f8197  pinctrl: qcom: sm8550-lpass-lpi: allow GPIO function

elapsed time: 733m

configs tested: 133
configs skipped: 9

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r004-20230313   gcc  
alpha                               defconfig   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r002-20230313   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r012-20230312   gcc  
arc                  randconfig-r026-20230312   gcc  
arc                  randconfig-r043-20230312   gcc  
arc                  randconfig-r043-20230313   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm          buildonly-randconfig-r005-20230313   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r046-20230312   clang
arm                  randconfig-r046-20230313   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r004-20230312   clang
arm64                randconfig-r034-20230312   clang
csky                                defconfig   gcc  
csky                 randconfig-r031-20230313   gcc  
hexagon              randconfig-r006-20230313   clang
hexagon              randconfig-r015-20230312   clang
hexagon              randconfig-r035-20230313   clang
hexagon              randconfig-r041-20230312   clang
hexagon              randconfig-r041-20230313   clang
hexagon              randconfig-r045-20230312   clang
hexagon              randconfig-r045-20230313   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230313   gcc  
i386                 randconfig-a002-20230313   gcc  
i386                 randconfig-a003-20230313   gcc  
i386                 randconfig-a004-20230313   gcc  
i386                 randconfig-a005-20230313   gcc  
i386                 randconfig-a006-20230313   gcc  
i386                 randconfig-a011-20230313   clang
i386                 randconfig-a012-20230313   clang
i386                 randconfig-a013-20230313   clang
i386                 randconfig-a014-20230313   clang
i386                 randconfig-a015-20230313   clang
i386                 randconfig-a016-20230313   clang
i386                 randconfig-r024-20230313   clang
i386                 randconfig-r026-20230313   clang
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r001-20230313   gcc  
loongarch    buildonly-randconfig-r006-20230313   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r021-20230312   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r005-20230312   gcc  
m68k                 randconfig-r032-20230313   gcc  
microblaze   buildonly-randconfig-r002-20230312   gcc  
microblaze           randconfig-r006-20230312   gcc  
microblaze           randconfig-r011-20230312   gcc  
microblaze           randconfig-r012-20230313   gcc  
microblaze           randconfig-r015-20230313   gcc  
microblaze           randconfig-r031-20230312   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r001-20230312   gcc  
mips                 randconfig-r003-20230313   clang
mips                 randconfig-r013-20230312   clang
mips                 randconfig-r021-20230313   gcc  
mips                 randconfig-r024-20230312   clang
mips                 randconfig-r034-20230313   clang
nios2        buildonly-randconfig-r003-20230312   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r014-20230312   gcc  
nios2                randconfig-r033-20230312   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r011-20230313   gcc  
parisc               randconfig-r022-20230312   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc      buildonly-randconfig-r001-20230312   gcc  
powerpc      buildonly-randconfig-r005-20230312   gcc  
powerpc              randconfig-r002-20230312   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r004-20230312   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r004-20230313   gcc  
riscv                randconfig-r033-20230313   gcc  
riscv                randconfig-r036-20230313   gcc  
riscv                randconfig-r042-20230312   gcc  
riscv                randconfig-r042-20230313   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r006-20230312   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r025-20230312   gcc  
s390                 randconfig-r044-20230312   gcc  
s390                 randconfig-r044-20230313   clang
sh                               allmodconfig   gcc  
sparc                               defconfig   gcc  
sparc64      buildonly-randconfig-r003-20230313   gcc  
sparc64              randconfig-r001-20230313   gcc  
sparc64              randconfig-r023-20230313   gcc  
sparc64              randconfig-r025-20230313   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230313   gcc  
x86_64               randconfig-a002-20230313   gcc  
x86_64               randconfig-a003-20230313   gcc  
x86_64               randconfig-a004-20230313   gcc  
x86_64               randconfig-a005-20230313   gcc  
x86_64               randconfig-a006-20230313   gcc  
x86_64               randconfig-a011-20230313   clang
x86_64               randconfig-a012-20230313   clang
x86_64               randconfig-a013-20230313   clang
x86_64               randconfig-a014-20230313   clang
x86_64               randconfig-a015-20230313   clang
x86_64               randconfig-a016-20230313   clang
x86_64               randconfig-r002-20230313   gcc  
x86_64               randconfig-r016-20230313   clang
x86_64               randconfig-r022-20230313   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r013-20230313   gcc  
xtensa               randconfig-r014-20230313   gcc  
xtensa               randconfig-r016-20230312   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
