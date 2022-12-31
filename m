Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B52B65A2B4
	for <lists+linux-gpio@lfdr.de>; Sat, 31 Dec 2022 05:40:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229527AbiLaEk4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Dec 2022 23:40:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229755AbiLaEkz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Dec 2022 23:40:55 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 157A2219A
        for <linux-gpio@vger.kernel.org>; Fri, 30 Dec 2022 20:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672461655; x=1703997655;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=KeWnOzVuUxeIAwqnqJTYb4LMe26wO/aEkOtVTPg5UsQ=;
  b=bPrt+pwC4V7HtHnx6aUlSm7JVK2BCNKnLmzhNiHolg6EsqfEa7bQpoGY
   xtZCqg4UN0hU1yaPjFOEaTEUjztNFUWcLs3KZTyNnmvzzns480/BBE7WI
   +dcVKhjKs8AoJvCuzlxjRRnYKYO1aclJKgvWy8J8AxyPqQU/IeW2eu4tb
   jLLWrTHj5T3jWZ9d2ItHtluW1so0sRHXD4aM1nWDpiOMyqOl0yJ9ITxey
   +mftN+Ifet7Re0bkq6/UUWaIXxQYcALg28GB1VxBpURGboWPz57YkUgCD
   /qSfAp2gzajqrLSk96w+EFwPxQwsx9e/MVIvY4mskgQ+E5EYfUfgj6PP1
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10576"; a="300972679"
X-IronPort-AV: E=Sophos;i="5.96,289,1665471600"; 
   d="scan'208";a="300972679"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2022 20:40:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10576"; a="982807963"
X-IronPort-AV: E=Sophos;i="5.96,289,1665471600"; 
   d="scan'208";a="982807963"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 30 Dec 2022 20:40:52 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pBTfw-000N1f-0o;
        Sat, 31 Dec 2022 04:40:52 +0000
Date:   Sat, 31 Dec 2022 12:40:13 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 4da65c5cab3e0419d9d923eee0d6bf801fb40877
Message-ID: <63afbd2d.8NFKU17PV6e26w6H%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 4da65c5cab3e0419d9d923eee0d6bf801fb40877  gpiolib: of: remove [devm_]gpiod_get_from_of_node() APIs

elapsed time: 724m

configs tested: 76
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
alpha                               defconfig
s390                             allmodconfig
s390                                defconfig
s390                             allyesconfig
powerpc                           allnoconfig
sh                               allmodconfig
um                             i386_defconfig
mips                             allyesconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-bpf
x86_64                    rhel-8.3-kselftests
powerpc                          allmodconfig
m68k                             allyesconfig
x86_64                           rhel-8.3-syz
m68k                             allmodconfig
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
arc                              allyesconfig
i386                                defconfig
i386                             allyesconfig
alpha                            allyesconfig
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
ia64                             allmodconfig
i386                          randconfig-a001
i386                          randconfig-a003
x86_64               randconfig-a013-20221226
x86_64               randconfig-a011-20221226
x86_64               randconfig-a014-20221226
x86_64               randconfig-a012-20221226
i386                          randconfig-a005
x86_64               randconfig-a016-20221226
x86_64               randconfig-a015-20221226
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
arc                  randconfig-r043-20221227
arm                  randconfig-r046-20221227
arc                  randconfig-r043-20221226
riscv                randconfig-r042-20221226
s390                 randconfig-r044-20221226
x86_64                            allnoconfig
i386                          randconfig-c001

clang tested configs:
x86_64               randconfig-a002-20221226
x86_64                          rhel-8.3-rust
x86_64               randconfig-a003-20221226
x86_64               randconfig-a006-20221226
x86_64               randconfig-a001-20221226
x86_64               randconfig-a004-20221226
x86_64               randconfig-a005-20221226
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
hexagon              randconfig-r041-20221227
hexagon              randconfig-r041-20221226
arm                  randconfig-r046-20221226
hexagon              randconfig-r045-20221226
hexagon              randconfig-r045-20221227
riscv                randconfig-r042-20221227
s390                 randconfig-r044-20221227
i386                 randconfig-a004-20221226
i386                 randconfig-a001-20221226
i386                 randconfig-a006-20221226
i386                 randconfig-a003-20221226
i386                 randconfig-a005-20221226
i386                 randconfig-a002-20221226
x86_64                        randconfig-k001

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
