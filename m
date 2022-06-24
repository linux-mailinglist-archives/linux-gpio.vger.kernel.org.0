Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CCB1055975D
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Jun 2022 12:08:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229480AbiFXKI4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 Jun 2022 06:08:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229641AbiFXKIz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 24 Jun 2022 06:08:55 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 517B17A1BD
        for <linux-gpio@vger.kernel.org>; Fri, 24 Jun 2022 03:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656065335; x=1687601335;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=fYFk5O+rKss6kTDIpXN5ZVv+CGcGQFfHvf/ZPPuq/iw=;
  b=lrlBDTg1EEYVbdlM4KxEMLmIs0kVJCNX+gsIoXkK5OoaH7GYVRnjZA6T
   1tMzJdKZ0fLmi/Eyec1RuvLW094HZuHKC8aTZ1um02RQjyO5C/jBxyCdh
   RUs+9GOh+B1S3mNAxFQJKrAdJu2duPIRv8IFY3dOV/+7zwcQxlpMYAYuV
   ewTd5jyodypJOPo32LEhGm6oFd0JFiiX6QuELdT/AgqnoCYR4kTJVArz/
   NEXOfzp+tHRGM+QJlIHXyInVtC0PFwTmkB2JuUMtRTrjRsfP/2JZRTFFi
   TNazuoc30BJ3Bl0zqWk1QWBaqz1xmpB3Z3fyFLctKJyZMob8NcAp6Ns92
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10387"; a="260786104"
X-IronPort-AV: E=Sophos;i="5.92,218,1650956400"; 
   d="scan'208";a="260786104"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2022 03:08:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,218,1650956400"; 
   d="scan'208";a="586528807"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 24 Jun 2022 03:08:53 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1o4gFA-0003yh-VJ;
        Fri, 24 Jun 2022 10:08:52 +0000
Date:   Fri, 24 Jun 2022 18:08:18 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 097c53a7281852422278568dde6132af1c23c97f
Message-ID: <62b58d12.lUg8DFA0OZqsJx37%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 097c53a7281852422278568dde6132af1c23c97f  gpio: xgs-iproc: Drop if with an always false condition

elapsed time: 724m

configs tested: 81
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-c001
mips                 randconfig-c004-20220622
arm                         lubbock_defconfig
arm                      jornada720_defconfig
arm                        realview_defconfig
arm                        keystone_defconfig
microblaze                          defconfig
arm                          iop32x_defconfig
m68k                            q40_defconfig
powerpc                      chrp32_defconfig
alpha                               defconfig
sh                         ecovec24_defconfig
arm                           viper_defconfig
ia64                             allmodconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
i386                             allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
i386                          randconfig-a014
i386                          randconfig-a016
i386                          randconfig-a012
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
arc                  randconfig-r043-20220622
riscv                             allnoconfig
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit

clang tested configs:
arm                                 defconfig
powerpc                 mpc8560_ads_defconfig
hexagon                             defconfig
powerpc                 mpc836x_mds_defconfig
x86_64                        randconfig-k001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a013
i386                          randconfig-a015
i386                          randconfig-a011
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
hexagon              randconfig-r041-20220622
hexagon              randconfig-r041-20220623
s390                 randconfig-r044-20220622
hexagon              randconfig-r045-20220622
hexagon              randconfig-r045-20220623
riscv                randconfig-r042-20220622
hexagon              randconfig-r041-20220624
s390                 randconfig-r044-20220624
hexagon              randconfig-r045-20220624
riscv                randconfig-r042-20220624

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
