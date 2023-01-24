Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81EB467A578
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jan 2023 23:15:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235129AbjAXWP3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Jan 2023 17:15:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229932AbjAXWP2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Jan 2023 17:15:28 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D86E3D909
        for <linux-gpio@vger.kernel.org>; Tue, 24 Jan 2023 14:15:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674598527; x=1706134527;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=sM5RWYUw5uZ2Mn7EMvRMUdrIMlm9nrSpbTVCT257xRU=;
  b=CtkNeGlcF6K1mfSwb+n0Ax9CrbyqoG3lwHwkWcLpKIu1e2lyuVNf2DUo
   O8f16RxC9bgLGkZ9i0zsW4YCOjraXQVrrl9FIEGTZEw8TprLFJcKcODSg
   6boO/519jZM73wU8EIay0oUFWqKFhr/p1KbtS6+azohbqXoDaJMkESWDm
   0gTjafPwT0k6VS0DJEYUiKvcrZe85ah8PAM218BLnGh6l1F/9gD5hj/W5
   Zx9xaTEwYVYy4oaJ4JVVi4cBB3vWJd7IBx8jKSy91i9VtJORmKmbqjP27
   bBozXJxBdpGvhmLcc3SWH4QB5qRfrMHuLUx0YJhlTQGAZESJGwHtLERlJ
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="328506709"
X-IronPort-AV: E=Sophos;i="5.97,243,1669104000"; 
   d="scan'208";a="328506709"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 14:15:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="664260482"
X-IronPort-AV: E=Sophos;i="5.97,243,1669104000"; 
   d="scan'208";a="664260482"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 24 Jan 2023 14:15:23 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pKRZb-0006p4-0s;
        Tue, 24 Jan 2023 22:15:23 +0000
Date:   Wed, 25 Jan 2023 06:15:03 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 d63f11c02b8d3e54bdb65d8c309f73b7f474aec4
Message-ID: <63d05867.4ghfYjT5IRq/wg+2%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: d63f11c02b8d3e54bdb65d8c309f73b7f474aec4  gpiolib-acpi: Don't set GPIOs for wakeup in S3 mode

elapsed time: 731m

configs tested: 82
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                            allnoconfig
um                             i386_defconfig
um                           x86_64_defconfig
powerpc                           allnoconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
x86_64                              defconfig
s390                                defconfig
x86_64                               rhel-8.3
arm                                 defconfig
i386                 randconfig-a004-20230123
s390                             allyesconfig
i386                 randconfig-a003-20230123
x86_64                           allyesconfig
i386                 randconfig-a002-20230123
m68k                             allmodconfig
x86_64                           rhel-8.3-syz
m68k                             allyesconfig
x86_64                         rhel-8.3-kunit
arc                  randconfig-r043-20230123
alpha                            allyesconfig
x86_64                           rhel-8.3-kvm
arc                              allyesconfig
i386                 randconfig-a001-20230123
ia64                             allmodconfig
x86_64                           rhel-8.3-bpf
arm                  randconfig-r046-20230123
i386                 randconfig-a005-20230123
i386                 randconfig-a006-20230123
sh                               allmodconfig
mips                             allyesconfig
arm64                            allyesconfig
powerpc                          allmodconfig
i386                                defconfig
arm                              allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64               randconfig-a002-20230123
x86_64                          rhel-8.3-func
x86_64               randconfig-a001-20230123
x86_64               randconfig-a004-20230123
x86_64               randconfig-a003-20230123
x86_64               randconfig-a005-20230123
x86_64               randconfig-a006-20230123
i386                             allyesconfig
xtensa                  audio_kc705_defconfig
m68k                          atari_defconfig
powerpc                     stx_gp3_defconfig
arm                       aspeed_g5_defconfig
arc                        vdk_hs38_defconfig
powerpc                 mpc837x_rdb_defconfig
m68k                        stmark2_defconfig
mips                        vocore2_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                          randconfig-c001
sh                           se7724_defconfig
sh                          kfr2r09_defconfig

clang tested configs:
hexagon              randconfig-r041-20230123
hexagon              randconfig-r045-20230123
s390                 randconfig-r044-20230123
riscv                randconfig-r042-20230123
i386                 randconfig-a012-20230123
i386                 randconfig-a013-20230123
i386                 randconfig-a011-20230123
i386                 randconfig-a014-20230123
i386                 randconfig-a016-20230123
i386                 randconfig-a015-20230123
x86_64                          rhel-8.3-rust
x86_64               randconfig-a013-20230123
x86_64               randconfig-a011-20230123
x86_64               randconfig-a012-20230123
x86_64               randconfig-a015-20230123
x86_64               randconfig-a014-20230123
x86_64               randconfig-a016-20230123
x86_64               randconfig-k001-20230123
mips                   sb1250_swarm_defconfig
mips                     cu1000-neo_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
