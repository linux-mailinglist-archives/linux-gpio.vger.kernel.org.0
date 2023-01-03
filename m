Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52AC065B9D6
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Jan 2023 04:38:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236670AbjACDip (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Jan 2023 22:38:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236783AbjACDi1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Jan 2023 22:38:27 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51984D13A
        for <linux-gpio@vger.kernel.org>; Mon,  2 Jan 2023 19:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672717097; x=1704253097;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=6e1W8hGcuH6ZXpr+mkkwXaxX2N5J+Brc0CdforWFm84=;
  b=eK9e5i0/iU4MNiB8S1AkaOrEsI5y3h2aJfjYihJ/aU21eSWZcYW/l1lI
   TaSZcxrC0Tpmk0R3YyTuhjLrvg+ioVpa+Lin5t4KDA/wrcub4qE5iDoZ8
   CbZXaRiecSqxMp7lxZt8qxIQ8YZEfTlzJUDn1YS09hHwOp7mrrxlvhR75
   gqEFogZtCEa1mLylvaBIhLUUex76LXn2hZftwvzY6N/dnoGWtfnLR1X6O
   LLc04gqdwHgElpdDW77Op0MHmXshLenINkHdvJlB0436DEsEBh/o3Gm8H
   6IRKr6GhwC9qnHFObo+TLAmoW7JKl9l7XVUBZs9bHAy/oHPqXK23yU+ii
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10578"; a="348796840"
X-IronPort-AV: E=Sophos;i="5.96,295,1665471600"; 
   d="scan'208";a="348796840"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2023 19:38:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10578"; a="828722016"
X-IronPort-AV: E=Sophos;i="5.96,295,1665471600"; 
   d="scan'208";a="828722016"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 02 Jan 2023 19:38:15 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pCY7y-000Rjr-3B;
        Tue, 03 Jan 2023 03:38:14 +0000
Date:   Tue, 03 Jan 2023 11:37:15 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 694175cd8a1643cde3acb45c9294bca44a8e08e9
Message-ID: <63b3a2eb.LMRwnbgr7qTt5kxC%lkp@intel.com>
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
branch HEAD: 694175cd8a1643cde3acb45c9294bca44a8e08e9  gpio: sifive: Fix refcount leak in sifive_gpio_probe

elapsed time: 722m

configs tested: 67
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
alpha                               defconfig
arc                                 defconfig
s390                             allmodconfig
s390                                defconfig
s390                             allyesconfig
powerpc                           allnoconfig
um                             i386_defconfig
um                           x86_64_defconfig
alpha                            allyesconfig
arc                              allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
ia64                             allmodconfig
sh                               allmodconfig
mips                             allyesconfig
x86_64                              defconfig
powerpc                          allmodconfig
x86_64                           rhel-8.3-bpf
x86_64                               rhel-8.3
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                           allyesconfig
arm                                 defconfig
i386                 randconfig-a004-20230102
i386                 randconfig-a003-20230102
i386                 randconfig-a001-20230102
i386                 randconfig-a002-20230102
x86_64               randconfig-a003-20230102
i386                 randconfig-a005-20230102
x86_64               randconfig-a001-20230102
i386                 randconfig-a006-20230102
x86_64               randconfig-a004-20230102
i386                                defconfig
x86_64               randconfig-a002-20230102
x86_64               randconfig-a006-20230102
x86_64               randconfig-a005-20230102
arm64                            allyesconfig
arm                              allyesconfig
riscv                randconfig-r042-20230101
arc                  randconfig-r043-20230102
arm                  randconfig-r046-20230102
arc                  randconfig-r043-20230101
s390                 randconfig-r044-20230101
x86_64                    rhel-8.3-kselftests
i386                             allyesconfig
x86_64                          rhel-8.3-func

clang tested configs:
i386                 randconfig-a013-20230102
i386                 randconfig-a012-20230102
i386                 randconfig-a011-20230102
i386                 randconfig-a014-20230102
i386                 randconfig-a015-20230102
i386                 randconfig-a016-20230102
hexagon              randconfig-r041-20230102
s390                 randconfig-r044-20230102
hexagon              randconfig-r045-20230101
hexagon              randconfig-r045-20230102
arm                  randconfig-r046-20230101
riscv                randconfig-r042-20230102
hexagon              randconfig-r041-20230101
x86_64                          rhel-8.3-rust
x86_64               randconfig-a011-20230102
x86_64               randconfig-a014-20230102
x86_64               randconfig-a012-20230102
x86_64               randconfig-a013-20230102
x86_64               randconfig-a015-20230102
x86_64               randconfig-a016-20230102

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
