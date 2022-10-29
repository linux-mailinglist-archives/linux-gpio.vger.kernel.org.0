Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6332C611FAF
	for <lists+linux-gpio@lfdr.de>; Sat, 29 Oct 2022 05:16:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229379AbiJ2DQC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 Oct 2022 23:16:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229877AbiJ2DP5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Oct 2022 23:15:57 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53C5C6EF2F
        for <linux-gpio@vger.kernel.org>; Fri, 28 Oct 2022 20:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667013354; x=1698549354;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=wZrJvM6DDIgs5XFnN0I9ZwX6xXp7I5EgLhQQAHQC0+c=;
  b=ZTbY7WtvcXq85dCLDgs9dDiYdcZTvXjK/a5gFTNM7E163/vJYmQ992In
   cFP9ArlmtioxQGMXcpjq5wTzP0s6j2mvQrYOFXH9vvawu1q4GTYxbbTFE
   STY2n9+Q0nP++IAtI+2hHKoXe/Bgyn9A7LUh1F1z8nn78g0EIdkVfR6K3
   nJtWqlMQt/E3G8DI+AyWChjQQTIKsvNe5zFXMVS5HUoo96SsNuD+ZKjpy
   qiF+dJ4FUnnhFRvq7OcnCPszasLm9R/ETD4nQ23vY3qBI63D3p7CrZIiq
   9IhzIlkH5IOgFytP32WotPjEWyQ1nsSjIYXUwj8/AKYM04pmZZ8w1+FQ7
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10514"; a="394948141"
X-IronPort-AV: E=Sophos;i="5.95,222,1661842800"; 
   d="scan'208";a="394948141"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2022 20:15:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10514"; a="664232570"
X-IronPort-AV: E=Sophos;i="5.95,222,1661842800"; 
   d="scan'208";a="664232570"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 28 Oct 2022 20:15:52 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oocK8-000AVj-0d;
        Sat, 29 Oct 2022 03:15:52 +0000
Date:   Sat, 29 Oct 2022 11:15:09 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 9ed88fcfb1b08c41bde0381dece84d152d53774c
Message-ID: <635c9abd.vtBw4K9/EMbJFhik%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: 9ed88fcfb1b08c41bde0381dece84d152d53774c  MAINTAINERS: Change myself to a maintainer

elapsed time: 725m

configs tested: 69
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
mips                             allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
sh                               allmodconfig
s390                                defconfig
x86_64                              defconfig
i386                                defconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit
ia64                             allmodconfig
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
i386                          randconfig-a014
s390                             allyesconfig
i386                          randconfig-a012
i386                          randconfig-a016
m68k                             allyesconfig
m68k                             allmodconfig
alpha                            allyesconfig
i386                          randconfig-a001
arc                              allyesconfig
i386                          randconfig-a003
arc                  randconfig-r043-20221028
i386                             allyesconfig
x86_64                        randconfig-a013
arm                                 defconfig
i386                          randconfig-a005
x86_64                        randconfig-a011
x86_64                        randconfig-a004
x86_64                        randconfig-a002
riscv                randconfig-r042-20221028
s390                 randconfig-r044-20221028
x86_64                        randconfig-a006
x86_64                        randconfig-a015
arm64                            allyesconfig
arm                              allyesconfig
arc                                 defconfig
alpha                               defconfig
s390                             allmodconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
i386                          randconfig-c001
arm                            hisi_defconfig
xtensa                  cadence_csp_defconfig
m68k                           virt_defconfig
powerpc                       holly_defconfig
arm                          pxa3xx_defconfig
sh                        dreamcast_defconfig

clang tested configs:
i386                          randconfig-a013
i386                          randconfig-a015
i386                          randconfig-a011
i386                          randconfig-a002
hexagon              randconfig-r041-20221028
hexagon              randconfig-r045-20221028
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a014
x86_64                        randconfig-a016
s390                 randconfig-r044-20221029
hexagon              randconfig-r041-20221029
hexagon              randconfig-r045-20221029
riscv                randconfig-r042-20221029

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
