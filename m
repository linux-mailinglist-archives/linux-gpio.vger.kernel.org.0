Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F337682E0D
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Jan 2023 14:34:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232300AbjAaNea (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 31 Jan 2023 08:34:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231600AbjAaNeW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 31 Jan 2023 08:34:22 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60CF06184
        for <linux-gpio@vger.kernel.org>; Tue, 31 Jan 2023 05:34:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675172055; x=1706708055;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=hVU/Oqqs7Z3Sqy87JYTTk3zknKXx0kliy0J2eUTxdsY=;
  b=lKG4I4CpIWuLU7noODsvTrFpymDu2oUd7f1hkjI3kthNZO8Z57UwnCBo
   rOyYY/cqEzjbR2OqhC6JvSe2M1Shkp89tMkD6ICAs7ErZGX9wTPfMdCDm
   8ucKoHa4dj6twzXeRKaN1xJZh9UIflPn2gMLgVeHCPHIY/yNb7UQfEQh4
   bf/BiPHma1YilR/aaSF52c1AfZOEjS0lIFb5FXu4BRlEkQCF8LPQUSL55
   ko8UNRI+u4JXmHZzXuvHZgN+xjqzMGB36ipeNh9rPMAm1bVMwG6mEh9Kk
   brIIj1h0LdDJQgAC5U0nxnMqqrVXmRdM4l3PLtm5x9yWsFgftsNNo2h2+
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="327855536"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; 
   d="scan'208";a="327855536"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2023 05:33:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="727948902"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; 
   d="scan'208";a="727948902"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 31 Jan 2023 05:33:54 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pMqll-0004SG-1m;
        Tue, 31 Jan 2023 13:33:53 +0000
Date:   Tue, 31 Jan 2023 21:33:28 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 5ab4909d0b2542cc31bba370dcba029261f392f3
Message-ID: <63d918a8.Ur9AJ1QmsjHAjZwD%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 5ab4909d0b2542cc31bba370dcba029261f392f3  Merge tag 'intel-pinctrl-v6.3-1' of git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel into devel

elapsed time: 815m

configs tested: 81
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                            allnoconfig
um                           x86_64_defconfig
um                             i386_defconfig
arc                                 defconfig
powerpc                           allnoconfig
alpha                               defconfig
s390                             allmodconfig
s390                                defconfig
sh                               allmodconfig
s390                             allyesconfig
mips                             allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
powerpc                          allmodconfig
ia64                             allmodconfig
x86_64                           allyesconfig
x86_64               randconfig-a001-20230130
x86_64                    rhel-8.3-kselftests
x86_64               randconfig-a003-20230130
x86_64                          rhel-8.3-func
x86_64               randconfig-a004-20230130
x86_64               randconfig-a002-20230130
x86_64               randconfig-a006-20230130
x86_64               randconfig-a005-20230130
m68k                             allyesconfig
alpha                            allyesconfig
arc                              allyesconfig
i386                 randconfig-a002-20230130
i386                 randconfig-a001-20230130
i386                 randconfig-a004-20230130
i386                 randconfig-a003-20230130
i386                 randconfig-a005-20230130
i386                 randconfig-a006-20230130
i386                                defconfig
arc                  randconfig-r043-20230129
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
arm                  randconfig-r046-20230129
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-bpf
arm                  randconfig-r046-20230130
arc                  randconfig-r043-20230130
arm                                 defconfig
i386                             allyesconfig
arm64                            allyesconfig
arm                              allyesconfig
i386                          randconfig-c001
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
m68k                             allmodconfig

clang tested configs:
x86_64                          rhel-8.3-rust
hexagon              randconfig-r041-20230129
riscv                randconfig-r042-20230129
riscv                randconfig-r042-20230130
hexagon              randconfig-r045-20230130
x86_64               randconfig-a014-20230130
hexagon              randconfig-r041-20230130
x86_64               randconfig-a012-20230130
hexagon              randconfig-r045-20230129
x86_64               randconfig-a013-20230130
x86_64               randconfig-a011-20230130
s390                 randconfig-r044-20230129
s390                 randconfig-r044-20230130
x86_64               randconfig-a016-20230130
x86_64               randconfig-a015-20230130
i386                 randconfig-a013-20230130
i386                 randconfig-a012-20230130
i386                 randconfig-a014-20230130
i386                 randconfig-a015-20230130
i386                 randconfig-a011-20230130
i386                 randconfig-a016-20230130
x86_64                        randconfig-k001
powerpc                 mpc8560_ads_defconfig
arm                          ixp4xx_defconfig
arm                         s5pv210_defconfig
powerpc                     skiroot_defconfig
powerpc                    gamecube_defconfig
powerpc                    mvme5100_defconfig
powerpc                      pmac32_defconfig
arm                         s3c2410_defconfig

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
