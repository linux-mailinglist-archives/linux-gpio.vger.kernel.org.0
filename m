Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9E1763B505
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Nov 2022 23:57:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233678AbiK1W5E (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Nov 2022 17:57:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbiK1W5E (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Nov 2022 17:57:04 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A17FF2A436
        for <linux-gpio@vger.kernel.org>; Mon, 28 Nov 2022 14:57:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669676223; x=1701212223;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=THTWN/k2+GZeJ+TvXk5SuszPkUZhUUsflcyTBogm5wU=;
  b=k7HFsS4db3g6OZpdJzLyqMmvxAe7KRKgM6p5IILDQ7grv9EySKk9dY6C
   6dKIFi2F/WB9gonQoI7KOFhRwuDp0vIOMRVo7rRCa+o8Gd40ZmR6RGGe6
   3UKdxDdPkVJ3Nlz4NHoHsbpfW4f5fYmVuWG+KfG/LnWgKCakiOPkxY7Z1
   pSYPgk3zMLgnxx9/TWC3jLFvPCXgtaE3io6K+YGWU7z62k/2ylz+2FOrL
   LrrEXM7XP/AOJVP9fMMPUYLBbJGgrxlcqIO2FZQZRDZ4d9C3z+q9vXucF
   ac9zVSsHgMZm/I/GpHnCxGbUPupszmxvz2TOAr91oBLTGpcARFZcz8SFH
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="401253275"
X-IronPort-AV: E=Sophos;i="5.96,201,1665471600"; 
   d="scan'208";a="401253275"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2022 14:57:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="888612648"
X-IronPort-AV: E=Sophos;i="5.96,201,1665471600"; 
   d="scan'208";a="888612648"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 28 Nov 2022 14:57:01 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1ozn3d-0008MN-0Z;
        Mon, 28 Nov 2022 22:57:01 +0000
Date:   Tue, 29 Nov 2022 06:56:49 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 ec851b23084b3a0af8bf0f5e51d33a8d678bdc49
Message-ID: <63853cb1.utOEmBc4POrh3iFU%lkp@intel.com>
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
branch HEAD: ec851b23084b3a0af8bf0f5e51d33a8d678bdc49  gpiolib: fix memory leak in gpiochip_setup_dev()

elapsed time: 850m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
powerpc                           allnoconfig
um                             i386_defconfig
i386                                defconfig
x86_64                              defconfig
x86_64                          rhel-8.3-func
x86_64               randconfig-a001-20221128
x86_64               randconfig-a006-20221128
sh                               allmodconfig
x86_64                    rhel-8.3-kselftests
x86_64               randconfig-a003-20221128
i386                 randconfig-a002-20221128
i386                 randconfig-a003-20221128
x86_64               randconfig-a004-20221128
x86_64                           rhel-8.3-syz
x86_64                               rhel-8.3
arc                                 defconfig
x86_64                         rhel-8.3-kunit
s390                             allmodconfig
x86_64               randconfig-a002-20221128
mips                             allyesconfig
alpha                               defconfig
x86_64               randconfig-a005-20221128
s390                                defconfig
powerpc                          allmodconfig
arc                  randconfig-r043-20221128
s390                             allyesconfig
i386                 randconfig-a001-20221128
x86_64                           allyesconfig
i386                 randconfig-a005-20221128
x86_64                           rhel-8.3-kvm
ia64                             allmodconfig
i386                 randconfig-a006-20221128
i386                 randconfig-a004-20221128
i386                             allyesconfig
m68k                             allyesconfig
alpha                            allyesconfig
arc                              allyesconfig
arm                                 defconfig
m68k                             allmodconfig
arm                              allyesconfig
arm64                            allyesconfig

clang tested configs:
hexagon              randconfig-r045-20221128
riscv                randconfig-r042-20221128
i386                 randconfig-a012-20221128
i386                 randconfig-a011-20221128
hexagon              randconfig-r041-20221128
i386                 randconfig-a013-20221128
s390                 randconfig-r044-20221128
i386                 randconfig-a014-20221128
i386                 randconfig-a015-20221128
i386                 randconfig-a016-20221128
x86_64               randconfig-a013-20221128
x86_64               randconfig-a012-20221128
x86_64               randconfig-a011-20221128
x86_64               randconfig-a014-20221128
x86_64               randconfig-a016-20221128
x86_64               randconfig-a015-20221128

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
