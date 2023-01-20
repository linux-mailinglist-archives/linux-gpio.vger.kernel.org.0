Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B211F675FBB
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Jan 2023 22:46:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229700AbjATVqb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 Jan 2023 16:46:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbjATVqa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Jan 2023 16:46:30 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C694E7F99F
        for <linux-gpio@vger.kernel.org>; Fri, 20 Jan 2023 13:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674251189; x=1705787189;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=qbUXuxeVPVbF8WvsafPRAJXkjzT0KkWeUmO5HzyQMVE=;
  b=V4K4/CzJhkDc4ipwNAdI84ic+CP8YkgScUPbzYl9xoe4XVVkZFmO+1Qb
   lZ6JoRqCUTAGZ8HlICqV7ew3zLHsuo+tvbxjQKNhJnBNJcKw59j0wOD1z
   /m6MRWegV2VnFu01xoq9u80Zk43wypPv13X25mS0unVQQ3U25jPOlQTlI
   ezoc0KJoavhtD/J6EKt9EjazAC8hAJdccvVAjq8DirWgsZWp8s5nSjLVX
   OwOplWECQU9/urHokhEOeB8l9TVFGUmkFMIetwGaqHjGn7dRunNGN0Nzv
   UKB5HClfMIFNGPNpVcFUSE6yhhWQvbcu6pXeSlqfiY1swpC4wmTc+9N3h
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="313592464"
X-IronPort-AV: E=Sophos;i="5.97,233,1669104000"; 
   d="scan'208";a="313592464"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2023 13:46:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="989539405"
X-IronPort-AV: E=Sophos;i="5.97,233,1669104000"; 
   d="scan'208";a="989539405"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 20 Jan 2023 13:46:28 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pIzDP-000304-0s;
        Fri, 20 Jan 2023 21:46:27 +0000
Date:   Sat, 21 Jan 2023 05:45:47 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-gpio:gpiochip-no-driver-h] BUILD SUCCESS
 58fa5540f6be58a2c3cddd0b5794e09306002d4c
Message-ID: <63cb0b8b.jX9B9G2QpOcT1arS%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git gpiochip-no-driver-h
branch HEAD: 58fa5540f6be58a2c3cddd0b5794e09306002d4c  See what explodes if we apply this patch

elapsed time: 721m

configs tested: 71
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
alpha                            allyesconfig
arc                              allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
arc                                 defconfig
alpha                               defconfig
s390                             allmodconfig
x86_64                            allnoconfig
s390                                defconfig
s390                             allyesconfig
um                             i386_defconfig
i386                                defconfig
um                           x86_64_defconfig
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
arm                                 defconfig
arm64                            allyesconfig
arm                  randconfig-r046-20230119
arm                              allyesconfig
arc                  randconfig-r043-20230119
ia64                             allmodconfig
x86_64                              defconfig
i386                             allyesconfig
i386                          randconfig-a001
i386                          randconfig-a014
x86_64                               rhel-8.3
x86_64                           rhel-8.3-syz
i386                          randconfig-a012
i386                          randconfig-a003
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-bpf
x86_64                        randconfig-a002
i386                          randconfig-a016
i386                          randconfig-a005
x86_64                           allyesconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a006
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
powerpc                        warp_defconfig
ia64                             alldefconfig
powerpc                           allnoconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
sh                               allmodconfig
i386                          randconfig-c001
mips                             allyesconfig
powerpc                          allmodconfig

clang tested configs:
x86_64                          rhel-8.3-rust
hexagon              randconfig-r045-20230119
hexagon              randconfig-r041-20230119
riscv                randconfig-r042-20230119
s390                 randconfig-r044-20230119
i386                          randconfig-a013
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a011
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a015
x86_64                        randconfig-a005
i386                          randconfig-a006
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
