Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A74C875ED45
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jul 2023 10:20:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229920AbjGXIUS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Jul 2023 04:20:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229721AbjGXIUS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Jul 2023 04:20:18 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51E7698
        for <linux-gpio@vger.kernel.org>; Mon, 24 Jul 2023 01:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690186815; x=1721722815;
  h=date:from:to:cc:subject:message-id;
  bh=o4JDASnxTxymbA036HgM/qJqHvM5c08qlIEUPmKkgkE=;
  b=YE9/aGdRhQBgIMNt/JOQ59x6vgFwbEbIyzGE9YXTLKKFcJ69KDuIH5ot
   t1UNcrvZjiTUFBNhtPLysz1EbQzyfLBVuY2UJYUJoqJFWrcfjYaWOC4rI
   FNdyBxnS15zx/7Qr478mXCua5knoJVLDQo4tXODZlGqm7fH7LlTmrEhGG
   hJvPk08jV2YYepX6EXrC01t+WGX7HcTw+ic8w8RlN02MkZA4WmMx4RQy4
   1qzgn3luPS9Z9opZHl35FFAmagGp//Usm9q0ZymOZP5pz6e7zeOvYa2SN
   U+IVkMCv0F4zED7B67GX7xALyETe2lkleY4FJxP95cMP5eARfAV2hsAZH
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="433623132"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="433623132"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2023 01:20:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="702778632"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="702778632"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 24 Jul 2023 01:20:15 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qNqne-0009ao-33;
        Mon, 24 Jul 2023 08:20:14 +0000
Date:   Mon, 24 Jul 2023 16:19:32 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 173b67f16e13d1b744c9984ffea57853f6fb9cad
Message-ID: <202307241630.R4rGlBdt-lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 173b67f16e13d1b744c9984ffea57853f6fb9cad  Merge branch 'devel' into for-next

elapsed time: 720m

configs tested: 107
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r006-20230724   gcc  
alpha                randconfig-r032-20230724   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r015-20230724   gcc  
arc                  randconfig-r043-20230724   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r024-20230724   gcc  
arm                  randconfig-r046-20230724   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r002-20230724   gcc  
csky                                defconfig   gcc  
hexagon              randconfig-r005-20230724   clang
hexagon              randconfig-r041-20230724   clang
hexagon              randconfig-r045-20230724   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230723   clang
i386         buildonly-randconfig-r005-20230723   clang
i386         buildonly-randconfig-r006-20230723   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230724   gcc  
i386                 randconfig-i002-20230724   gcc  
i386                 randconfig-i003-20230724   gcc  
i386                 randconfig-i004-20230724   gcc  
i386                 randconfig-i005-20230724   gcc  
i386                 randconfig-i006-20230724   gcc  
i386                 randconfig-i011-20230724   clang
i386                 randconfig-i012-20230724   clang
i386                 randconfig-i013-20230724   clang
i386                 randconfig-i014-20230724   clang
i386                 randconfig-i015-20230724   clang
i386                 randconfig-i016-20230724   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r012-20230724   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r016-20230724   gcc  
m68k                 randconfig-r031-20230724   gcc  
microblaze           randconfig-r004-20230724   gcc  
microblaze           randconfig-r011-20230724   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
nios2                               defconfig   gcc  
openrisc             randconfig-r014-20230724   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r036-20230724   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230724   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r044-20230724   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r003-20230724   gcc  
sh                   randconfig-r013-20230724   gcc  
sh                   randconfig-r026-20230724   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r022-20230724   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r035-20230724   clang
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230723   clang
x86_64       buildonly-randconfig-r002-20230723   clang
x86_64       buildonly-randconfig-r003-20230723   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-r021-20230724   clang
x86_64               randconfig-x001-20230724   clang
x86_64               randconfig-x002-20230724   clang
x86_64               randconfig-x003-20230724   clang
x86_64               randconfig-x004-20230724   clang
x86_64               randconfig-x005-20230724   clang
x86_64               randconfig-x006-20230724   clang
x86_64               randconfig-x011-20230724   gcc  
x86_64               randconfig-x012-20230724   gcc  
x86_64               randconfig-x013-20230724   gcc  
x86_64               randconfig-x014-20230724   gcc  
x86_64               randconfig-x015-20230724   gcc  
x86_64               randconfig-x016-20230724   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r023-20230724   gcc  
xtensa               randconfig-r033-20230724   gcc  
xtensa               randconfig-r034-20230724   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
