Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 742BC77B20C
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Aug 2023 09:07:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230302AbjHNHHM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Aug 2023 03:07:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234039AbjHNHHI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Aug 2023 03:07:08 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16375AB
        for <linux-gpio@vger.kernel.org>; Mon, 14 Aug 2023 00:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691996828; x=1723532828;
  h=date:from:to:cc:subject:message-id;
  bh=cLQHsHwZICZyX9u7wxqS+LPCkcgGQqAT0dO8HWT9z3s=;
  b=fqT51oORIbQnoAFck7vzRrJGW1wxCXJ/0ZMN01Ukdw3KMCjkziWZ4TtY
   wgcKqSillv+dluZJ/EOoJJ56WUrjkfS2NPGMlVljpYQxFfCNVQNfbpR+C
   txjPgXIbsNdj9+RLk77yPY9YvdmIwMxUz2wDinFjuD9rRcw2ToLQxph67
   G96J41IJlVZc5guo3RPCzvxzeqBopOb7+WhD5i54EucJVAGSjGRtBTdk0
   lqh+u+wW/P6CX/yi9fbj1PV25ARcdSEp6wK5BM6pIoRm10lJhqCQTciX9
   +6VxZWxMOUCq8nTIpfAS327RqMa4JXT8aq1h4HN5YOOLpoA8n2eqstoGz
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10801"; a="370878115"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="370878115"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 00:07:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10801"; a="1063962523"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; 
   d="scan'208";a="1063962523"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 14 Aug 2023 00:06:44 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qVRf1-0009P5-2W;
        Mon, 14 Aug 2023 07:06:43 +0000
Date:   Mon, 14 Aug 2023 15:05:55 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 2fc8d02058dbec258039c3253ebd1f124766a796
Message-ID: <202308141554.G9BMuTOv-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: 2fc8d02058dbec258039c3253ebd1f124766a796  MAINTAINERS: add content regex for gpio-regmap

elapsed time: 723m

configs tested: 106
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r002-20230814   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r021-20230814   gcc  
arc                  randconfig-r043-20230814   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r022-20230814   gcc  
arm                  randconfig-r046-20230814   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r014-20230814   clang
csky                                defconfig   gcc  
csky                 randconfig-r035-20230814   gcc  
hexagon              randconfig-r041-20230814   clang
hexagon              randconfig-r045-20230814   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230814   gcc  
i386         buildonly-randconfig-r005-20230814   gcc  
i386         buildonly-randconfig-r006-20230814   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230814   gcc  
i386                 randconfig-i002-20230814   gcc  
i386                 randconfig-i003-20230814   gcc  
i386                 randconfig-i004-20230814   gcc  
i386                 randconfig-i005-20230814   gcc  
i386                 randconfig-i006-20230814   gcc  
i386                 randconfig-i011-20230814   clang
i386                 randconfig-i012-20230814   clang
i386                 randconfig-i013-20230814   clang
i386                 randconfig-i014-20230814   clang
i386                 randconfig-i015-20230814   clang
i386                 randconfig-i016-20230814   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r032-20230814   gcc  
microblaze           randconfig-r015-20230814   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r003-20230814   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r023-20230814   gcc  
parisc               randconfig-r026-20230814   gcc  
parisc               randconfig-r034-20230814   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r024-20230814   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r004-20230814   gcc  
riscv                randconfig-r011-20230814   clang
riscv                randconfig-r013-20230814   clang
riscv                randconfig-r042-20230814   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r006-20230814   gcc  
s390                 randconfig-r044-20230814   clang
sh                               allmodconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r031-20230814   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r005-20230814   clang
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230814   gcc  
x86_64       buildonly-randconfig-r002-20230814   gcc  
x86_64       buildonly-randconfig-r003-20230814   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-r025-20230814   clang
x86_64               randconfig-x001-20230814   clang
x86_64               randconfig-x002-20230814   clang
x86_64               randconfig-x003-20230814   clang
x86_64               randconfig-x004-20230814   clang
x86_64               randconfig-x005-20230814   clang
x86_64               randconfig-x006-20230814   clang
x86_64               randconfig-x011-20230814   gcc  
x86_64               randconfig-x012-20230814   gcc  
x86_64               randconfig-x013-20230814   gcc  
x86_64               randconfig-x014-20230814   gcc  
x86_64               randconfig-x015-20230814   gcc  
x86_64               randconfig-x016-20230814   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r001-20230814   gcc  
xtensa               randconfig-r016-20230814   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
