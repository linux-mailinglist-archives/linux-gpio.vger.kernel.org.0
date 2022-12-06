Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8088A644E5C
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Dec 2022 23:09:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229850AbiLFWJY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Dec 2022 17:09:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229744AbiLFWJX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Dec 2022 17:09:23 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B7D12A413
        for <linux-gpio@vger.kernel.org>; Tue,  6 Dec 2022 14:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670364563; x=1701900563;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=qu0gvF9YLxVnpQGYEd2Q4LagAq6yG2E8uZA4ozXkR1o=;
  b=hbCcR2VMwzbYv/TPTQinHHrf2U46e7thoAiNZIFskXOR9HuQc8DTK5B2
   6RnRnjohWDx5xinepa/FbTMkB9DnfOSSPG2vXECpDIUyVGvv1ad/qMvPu
   b+Q99OOykCqK4W1JyCaRBwxEwab59FMy7QrPiPiZeBQxVVJ4xoFmhPfeo
   zcYGSyUxtD+lnKmNQUVzc2TgPQ3w5h76IhGMZcRSTxI0KVRXDEpuPUHnE
   IDYQfem1Szo0XcSqQgNRAYTLE1z2DtFm7yQVtH/l96jYfh25g5GEshqGQ
   2z98L9vj1o3EuSzDdJW2B1jpzN4wHHp9tyVqGO6rEBvGH3m63mcx1WTA2
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10553"; a="317886108"
X-IronPort-AV: E=Sophos;i="5.96,223,1665471600"; 
   d="scan'208";a="317886108"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2022 14:09:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10553"; a="677129138"
X-IronPort-AV: E=Sophos;i="5.96,223,1665471600"; 
   d="scan'208";a="677129138"
Received: from lkp-server01.sh.intel.com (HELO b3c45e08cbc1) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 06 Dec 2022 14:09:21 -0800
Received: from kbuild by b3c45e08cbc1 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1p2g7s-0001Hd-38;
        Tue, 06 Dec 2022 22:09:20 +0000
Date:   Wed, 07 Dec 2022 06:08:34 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 63ff545af73f759d1bd04198af8ed8577fb739fc
Message-ID: <638fbd62.Gdamw6QXjymWFEEV%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: 63ff545af73f759d1bd04198af8ed8577fb739fc  gpio/rockchip: fix refcount leak in rockchip_gpiolib_register()

elapsed time: 730m

configs tested: 83
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
alpha                               defconfig
ia64                             allmodconfig
s390                                defconfig
s390                             allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
m68k                             allmodconfig
x86_64                              defconfig
arc                              allyesconfig
i386                                defconfig
alpha                            allyesconfig
x86_64                    rhel-8.3-kselftests
powerpc                           allnoconfig
x86_64                         rhel-8.3-kunit
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-kvm
s390                             allyesconfig
x86_64                           rhel-8.3-syz
m68k                             allyesconfig
x86_64               randconfig-a011-20221205
x86_64                           allyesconfig
x86_64               randconfig-a012-20221205
arm                                 defconfig
x86_64               randconfig-a014-20221205
i386                 randconfig-a014-20221205
x86_64               randconfig-a013-20221205
i386                 randconfig-a013-20221205
x86_64               randconfig-a015-20221205
i386                 randconfig-a016-20221205
x86_64               randconfig-a016-20221205
i386                 randconfig-a012-20221205
arc                  randconfig-r043-20221205
arm                  randconfig-r046-20221204
i386                 randconfig-a015-20221205
i386                 randconfig-a011-20221205
sh                               allmodconfig
arm                              allyesconfig
i386                             allyesconfig
arm64                            allyesconfig
mips                             allyesconfig
s390                 randconfig-r044-20221205
arc                  randconfig-r043-20221204
powerpc                          allmodconfig
riscv                randconfig-r042-20221205
arm                  randconfig-r046-20221206
arc                  randconfig-r043-20221206
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
x86_64                          rhel-8.3-rust
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016

clang tested configs:
hexagon              randconfig-r041-20221204
hexagon              randconfig-r045-20221204
x86_64               randconfig-a003-20221205
x86_64               randconfig-a004-20221205
hexagon              randconfig-r045-20221205
x86_64               randconfig-a001-20221205
x86_64               randconfig-a002-20221205
arm                  randconfig-r046-20221205
x86_64               randconfig-a006-20221205
x86_64               randconfig-a005-20221205
hexagon              randconfig-r041-20221205
riscv                randconfig-r042-20221204
hexagon              randconfig-r041-20221206
hexagon              randconfig-r045-20221206
riscv                randconfig-r042-20221206
s390                 randconfig-r044-20221206
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
