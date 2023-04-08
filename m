Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 452086DB847
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Apr 2023 04:49:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229483AbjDHCt3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 7 Apr 2023 22:49:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbjDHCt2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 7 Apr 2023 22:49:28 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5A47C176
        for <linux-gpio@vger.kernel.org>; Fri,  7 Apr 2023 19:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680922165; x=1712458165;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=IV9jM6K0W7FT2T/XjDNALrD8eXGHQIgLcR7mAEJpCz4=;
  b=TycO1GwbXXx5a5sk2Br8YiDUFXhLa+F4VaxCutTLd7ZBtDgTLucZYW91
   dRXtbWslvcI2lWfvQPK3vbMatHfTTHiJBFSu9YmeKk6d+i6V5/RpJYTMt
   n+7rY4k5SUN0VQEg9wOPj884DF1nTdwJKjzX196f8YMuK+gji+aSJ7wdy
   EOwb32z4GD0MMDAtcfnymDgpwrSqxAGyXJsrozb00L3xdX3LronVYpRe5
   vi0SkA0Vh7UgKWZU8eTEDOx7jkrxzs9qKHhAXIqiaJyw02UR8ghbU9jeo
   XAtoIG4UILd8kxy6B9QXz/gMLQHlD8Np6sDKl+4W0Z88TjrB41fieFwBT
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="370938463"
X-IronPort-AV: E=Sophos;i="5.98,328,1673942400"; 
   d="scan'208";a="370938463"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2023 19:49:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="752201412"
X-IronPort-AV: E=Sophos;i="5.98,328,1673942400"; 
   d="scan'208";a="752201412"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 07 Apr 2023 19:49:23 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pkydn-000TDa-0f;
        Sat, 08 Apr 2023 02:49:23 +0000
Date:   Sat, 08 Apr 2023 10:49:04 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 f09673770e767f862bd992b612f14018d0ab3857
Message-ID: <6430d620.KtMno3ni4zoV75+S%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: f09673770e767f862bd992b612f14018d0ab3857  Merge tag 'intel-gpio-v6.4-2' of git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel into gpio/for-next

elapsed time: 727m

configs tested: 132
configs skipped: 12

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r002-20230403   gcc  
alpha                randconfig-r005-20230403   gcc  
alpha                randconfig-r021-20230403   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r001-20230405   gcc  
arc                  randconfig-r002-20230403   gcc  
arc                  randconfig-r016-20230403   gcc  
arc                  randconfig-r025-20230407   gcc  
arc                  randconfig-r043-20230403   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r005-20230405   gcc  
arm                  randconfig-r025-20230403   clang
arm                  randconfig-r031-20230403   gcc  
arm                  randconfig-r046-20230403   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r015-20230403   gcc  
arm64                randconfig-r015-20230406   clang
arm64                randconfig-r016-20230406   clang
csky                                defconfig   gcc  
csky                 randconfig-r014-20230406   gcc  
csky                 randconfig-r023-20230407   gcc  
hexagon      buildonly-randconfig-r006-20230403   clang
hexagon              randconfig-r004-20230403   clang
hexagon              randconfig-r012-20230403   clang
hexagon              randconfig-r024-20230408   clang
hexagon              randconfig-r041-20230403   clang
hexagon              randconfig-r045-20230403   clang
i386                             allyesconfig   gcc  
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
ia64                             allmodconfig   gcc  
ia64         buildonly-randconfig-r001-20230405   gcc  
ia64         buildonly-randconfig-r002-20230403   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r013-20230406   gcc  
ia64                 randconfig-r024-20230403   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r006-20230403   gcc  
loongarch            randconfig-r013-20230403   gcc  
loongarch            randconfig-r026-20230403   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r001-20230403   gcc  
m68k                 randconfig-r012-20230403   gcc  
m68k                 randconfig-r035-20230403   gcc  
microblaze           randconfig-r005-20230403   gcc  
microblaze           randconfig-r024-20230407   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips         buildonly-randconfig-r004-20230403   gcc  
mips                 randconfig-r002-20230405   gcc  
mips                 randconfig-r023-20230403   clang
mips                 randconfig-r033-20230403   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r014-20230403   gcc  
openrisc             randconfig-r011-20230403   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r003-20230405   gcc  
parisc               randconfig-r011-20230403   gcc  
parisc               randconfig-r013-20230403   gcc  
parisc               randconfig-r015-20230403   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r013-20230403   gcc  
powerpc              randconfig-r021-20230407   gcc  
powerpc              randconfig-r026-20230407   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r002-20230405   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r012-20230406   clang
riscv                randconfig-r042-20230403   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r001-20230403   gcc  
s390         buildonly-randconfig-r003-20230403   gcc  
s390         buildonly-randconfig-r005-20230403   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r003-20230403   clang
s390                 randconfig-r016-20230403   gcc  
s390                 randconfig-r022-20230407   gcc  
s390                 randconfig-r044-20230403   gcc  
sh                               allmodconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r034-20230403   gcc  
sparc64              randconfig-r014-20230403   gcc  
sparc64              randconfig-r022-20230403   gcc  
sparc64              randconfig-r036-20230403   gcc  
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
x86_64               randconfig-k001-20230403   gcc  
x86_64               randconfig-r032-20230403   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r001-20230403   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
