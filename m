Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4EB865D4A4
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Jan 2023 14:46:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231886AbjADNp7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Jan 2023 08:45:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239281AbjADNpz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Jan 2023 08:45:55 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F38D186B0
        for <linux-gpio@vger.kernel.org>; Wed,  4 Jan 2023 05:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672839955; x=1704375955;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=IdsMhfTnBpJ3zQInTwkvEYSJlwODnsfJPLFPnCoFjj0=;
  b=GIAxtkrbxEfvsPYQXOWATi5ky0PBLIS0+WubslCHTvyI4baSqcPlud99
   9BSsGK8y8YldPtJfs80wd1pAfT3jQsvW0z+vIC9K3wmiIc9g/fV6RkJx0
   nVibwjwgDJNbZypOvUXiOTZS8iW7RbQo5RVRFn3C87FUNzFnrws+uH69C
   Ukqc1MJyUf98tnEGoWXAfhuZGKCfB7ucNOaDcOMuri1eaetFv49wwQh9g
   ya3aNg4s3d3tcXZfVfYMzsMQTT6APmhe2TjgJzxIvDOZR4xb/zPi2ckn8
   dbCAac47LPzsSCRDOKQe5N/t4grqHdeMXCY/1JXPhMrTG6nmp8q04r2Lm
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="320646279"
X-IronPort-AV: E=Sophos;i="5.96,300,1665471600"; 
   d="scan'208";a="320646279"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2023 05:45:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="779208925"
X-IronPort-AV: E=Sophos;i="5.96,300,1665471600"; 
   d="scan'208";a="779208925"
Received: from lkp-server02.sh.intel.com (HELO f1920e93ebb5) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 04 Jan 2023 05:45:53 -0800
Received: from kbuild by f1920e93ebb5 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pD45Y-0000PD-29;
        Wed, 04 Jan 2023 13:45:52 +0000
Date:   Wed, 04 Jan 2023 21:45:02 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:fixes] BUILD SUCCESS
 937e7a39068d806c1a951f19e38e1326be20f1b0
Message-ID: <63b582de.RtTpOSxuYlfFDxHG%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git fixes
branch HEAD: 937e7a39068d806c1a951f19e38e1326be20f1b0  pinctrl: nomadik: Add missing header(s)

elapsed time: 720m

configs tested: 68
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
x86_64                            allnoconfig
um                           x86_64_defconfig
arc                                 defconfig
powerpc                           allnoconfig
alpha                            allyesconfig
sh                               allmodconfig
alpha                               defconfig
arc                              allyesconfig
s390                             allmodconfig
mips                             allyesconfig
m68k                             allyesconfig
s390                                defconfig
m68k                             allmodconfig
i386                 randconfig-a004-20230102
i386                 randconfig-a003-20230102
i386                 randconfig-a001-20230102
i386                 randconfig-a002-20230102
arm                                 defconfig
ia64                             allmodconfig
i386                 randconfig-a005-20230102
arm64                            allyesconfig
s390                             allyesconfig
x86_64                              defconfig
i386                 randconfig-a006-20230102
x86_64                           rhel-8.3-bpf
x86_64                           rhel-8.3-syz
arm                              allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                               rhel-8.3
x86_64               randconfig-a001-20230102
x86_64               randconfig-a004-20230102
x86_64               randconfig-a002-20230102
x86_64               randconfig-a003-20230102
i386                                defconfig
powerpc                          allmodconfig
x86_64               randconfig-a006-20230102
x86_64               randconfig-a005-20230102
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
i386                             allyesconfig
x86_64                          rhel-8.3-func
riscv                randconfig-r042-20230101
arc                  randconfig-r043-20230102
arm                  randconfig-r046-20230102
arc                  randconfig-r043-20230101
s390                 randconfig-r044-20230101

clang tested configs:
i386                 randconfig-a013-20230102
i386                 randconfig-a012-20230102
i386                 randconfig-a011-20230102
i386                 randconfig-a014-20230102
i386                 randconfig-a016-20230102
i386                 randconfig-a015-20230102
x86_64                          rhel-8.3-rust
hexagon              randconfig-r041-20230102
x86_64               randconfig-a011-20230102
hexagon              randconfig-r045-20230101
x86_64               randconfig-a014-20230102
hexagon              randconfig-r045-20230102
x86_64               randconfig-a012-20230102
arm                  randconfig-r046-20230101
x86_64               randconfig-a013-20230102
x86_64               randconfig-a015-20230102
x86_64               randconfig-a016-20230102
riscv                randconfig-r042-20230102
hexagon              randconfig-r041-20230101
s390                 randconfig-r044-20230102

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
