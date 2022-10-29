Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9037B611FB0
	for <lists+linux-gpio@lfdr.de>; Sat, 29 Oct 2022 05:16:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229473AbiJ2DQF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 Oct 2022 23:16:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229756AbiJ2DP6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Oct 2022 23:15:58 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93A776F253
        for <linux-gpio@vger.kernel.org>; Fri, 28 Oct 2022 20:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667013354; x=1698549354;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ju1xCFHBmtKAC+wQV/+jhs7B2jVm9kaAMtvoURGeQQ0=;
  b=NwiKHJfhuKIQFxmenB1Jxu37B8nlV0MnlSX0SDKrgpc2T95kqIdEiSMP
   LbWbyHMvfPnLDdz56p6Y6+sC/GVBUL9jFT+2vZ+7K/6P1+UCp4MhYL2Kh
   A0EOAh4bJJSmudSEi4Fwepw2KQCevFjNyjCQyCgHLVjBZlMEWlIOy1DCc
   eQwKiRRsPX3hMmOnddSekaPs5clPzW6RVsWm3+GtqgVEWak3cpYjkMXUO
   gZrRj1tPkrPpwBMEwiHs7ZCWBk05iwFQUygfPNQaEOzkFt0WG0z8Q4lGz
   M78VaBVaiE79JmtMNyJZjlEZycSBKk+a1Y1lJxY25FhvfzdmNmAPPQKc4
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10514"; a="308631973"
X-IronPort-AV: E=Sophos;i="5.95,222,1661842800"; 
   d="scan'208";a="308631973"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2022 20:15:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10514"; a="584130509"
X-IronPort-AV: E=Sophos;i="5.95,222,1661842800"; 
   d="scan'208";a="584130509"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 28 Oct 2022 20:15:52 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oocK8-000AVx-0y;
        Sat, 29 Oct 2022 03:15:52 +0000
Date:   Sat, 29 Oct 2022 11:15:03 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 fbb19fe17eaef7b6ba2e68dbf0600a97060f2909
Message-ID: <635c9ab7.FZO3hy/hd5aqrSRa%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: fbb19fe17eaef7b6ba2e68dbf0600a97060f2909  gpio: pca9570: add slg7xl45106 support

elapsed time: 724m

configs tested: 67
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
alpha                               defconfig
powerpc                           allnoconfig
s390                                defconfig
i386                                defconfig
s390                             allmodconfig
s390                             allyesconfig
i386                             allyesconfig
i386                          randconfig-a001
x86_64                          rhel-8.3-func
i386                          randconfig-a003
x86_64                           rhel-8.3-syz
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
arc                  randconfig-r043-20221028
i386                          randconfig-a005
m68k                             allmodconfig
ia64                             allmodconfig
arc                              allyesconfig
x86_64                        randconfig-a013
arm                                 defconfig
i386                          randconfig-a014
i386                          randconfig-a012
x86_64                        randconfig-a011
i386                          randconfig-a016
riscv                randconfig-r042-20221028
alpha                            allyesconfig
s390                 randconfig-r044-20221028
x86_64                        randconfig-a002
x86_64                        randconfig-a015
x86_64                        randconfig-a006
x86_64                        randconfig-a004
m68k                             allyesconfig
arm64                            allyesconfig
arm                              allyesconfig
x86_64                              defconfig
x86_64                           allyesconfig
mips                             allyesconfig
x86_64                               rhel-8.3
powerpc                          allmodconfig
sh                               allmodconfig
i386                          randconfig-c001
arm                            hisi_defconfig
xtensa                  cadence_csp_defconfig
m68k                           virt_defconfig
powerpc                       holly_defconfig

clang tested configs:
i386                          randconfig-a002
hexagon              randconfig-r041-20221028
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r045-20221028
i386                          randconfig-a011
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a012
x86_64                        randconfig-a001
x86_64                        randconfig-a014
x86_64                        randconfig-a003
x86_64                        randconfig-a016
x86_64                        randconfig-a005
s390                 randconfig-r044-20221029
hexagon              randconfig-r041-20221029
hexagon              randconfig-r045-20221029
riscv                randconfig-r042-20221029

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
