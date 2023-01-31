Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5AD3468238D
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Jan 2023 05:54:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229764AbjAaEyj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Jan 2023 23:54:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbjAaEyi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Jan 2023 23:54:38 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C3D01423F
        for <linux-gpio@vger.kernel.org>; Mon, 30 Jan 2023 20:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675140877; x=1706676877;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=v0GG8S2n5m4t7mhgWrFfA/YN2F09oWOSZbMiJa7+N+E=;
  b=VkvwUiYqCHHPGw7UsLaPTD/lcS0SnRlz/iwLCNiYCq+ZAfCp0To+R+Mf
   RTNrIJNFIvsNx6FzYAlQqezmSa4tNOfhY4ru2S9Y2P82A+zK1ClyAgC3a
   3C2LE7fj2o6L6DVB4gpfP45jytaxNcg0Mj7zVOCXEZCBtvgi01/MNNBOv
   ErbG/SaT99qhAcGddC2ChJIWbdeD4wpAWnhYfT+akEiUqnq4d1u5LrMSR
   g6UkTCy5lLZCYy/fyqfLhkiHuzzc1jSzzzAWbujt+xn/Pr+iMwZHmDsr/
   sYl8QBF2RzAO8kCxp52wuCf250v1UmIm7mD2i7RVBWMYp8eQOgbeFzYAU
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="325446006"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; 
   d="scan'208";a="325446006"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2023 20:54:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="806966722"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; 
   d="scan'208";a="806966722"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 30 Jan 2023 20:54:35 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pMifD-0004Ax-0W;
        Tue, 31 Jan 2023 04:54:35 +0000
Date:   Tue, 31 Jan 2023 12:54:13 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 eed5a3bfafe6840494f7752b5cecd2a610b54fef
Message-ID: <63d89ef5.d3cgbH2eESz5RXxi%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: eed5a3bfafe6840494f7752b5cecd2a610b54fef  gpiolib: of: Move enum of_gpio_flags to its only user

elapsed time: 725m

configs tested: 81
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
alpha                               defconfig
s390                             allmodconfig
s390                                defconfig
i386                                defconfig
s390                             allyesconfig
powerpc                           allnoconfig
x86_64                            allnoconfig
um                             i386_defconfig
um                           x86_64_defconfig
alpha                            allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
sh                               allmodconfig
m68k                             allyesconfig
powerpc                          allmodconfig
i386                             allyesconfig
mips                             allyesconfig
ia64                             allmodconfig
x86_64                              defconfig
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
x86_64                               rhel-8.3
x86_64                           allyesconfig
x86_64               randconfig-a001-20230130
x86_64               randconfig-a003-20230130
x86_64               randconfig-a004-20230130
x86_64               randconfig-a002-20230130
x86_64               randconfig-a006-20230130
x86_64               randconfig-a005-20230130
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-bpf
arm                         s3c6400_defconfig
csky                                defconfig
sh                          r7785rp_defconfig
m68k                        stmark2_defconfig
i386                          randconfig-c001
arm                                 defconfig
powerpc                       maple_defconfig
sh                   sh7724_generic_defconfig
powerpc                  iss476-smp_defconfig
powerpc                 mpc8540_ads_defconfig
arm64                            allyesconfig
arm                              allyesconfig
i386                 randconfig-a003-20230130
i386                 randconfig-a001-20230130
i386                 randconfig-a004-20230130
i386                 randconfig-a006-20230130
i386                 randconfig-a002-20230130
i386                 randconfig-a005-20230130
m68k                            q40_defconfig
m68k                                defconfig
arm                            zeus_defconfig
openrisc                       virt_defconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func

clang tested configs:
x86_64                          rhel-8.3-rust
x86_64               randconfig-a014-20230130
x86_64               randconfig-a015-20230130
x86_64               randconfig-a016-20230130
x86_64               randconfig-a013-20230130
x86_64               randconfig-a011-20230130
x86_64               randconfig-a012-20230130
x86_64                        randconfig-k001
hexagon              randconfig-r045-20230130
s390                 randconfig-r044-20230130
riscv                randconfig-r042-20230129
hexagon              randconfig-r041-20230129
hexagon              randconfig-r045-20230129
hexagon              randconfig-r041-20230130
riscv                randconfig-r042-20230130
s390                 randconfig-r044-20230129
i386                 randconfig-a014-20230130
i386                 randconfig-a013-20230130
i386                 randconfig-a015-20230130
i386                 randconfig-a016-20230130
i386                 randconfig-a012-20230130
i386                 randconfig-a011-20230130

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
