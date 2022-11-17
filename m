Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 208D662D049
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Nov 2022 01:58:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233825AbiKQA6a (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Nov 2022 19:58:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233637AbiKQA63 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Nov 2022 19:58:29 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8DC5E0A2
        for <linux-gpio@vger.kernel.org>; Wed, 16 Nov 2022 16:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668646707; x=1700182707;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ZZqCBzifwNeKwGotAnp4T/DVVzcMtQTj3IsjtpQm0mw=;
  b=MLoXhPDWwlrfUgFAawxsJ12SGAfDq+2yEZeRhS6gjTrMmhV51SfEhvig
   NTgvJKgWoIwY/DnWi0g25DMkNSSevQ06ooXDwdduhJVK4H8J+lej/cwNP
   LJUdGRGwa/h8XAYBSHLiLOGXpeKUL8mjXMeb1cnzT1SyXUcerOejx6j90
   k0+5quMtqoGuEDnTOFr63mZCQo+pW7xiuSF8t0QMZKGKQw0jXkhxpUdHq
   MAVt45sfzEemZ72X9j7q/L3/CZvv485ck80CMgnUR8etzejGK7HZtyKRp
   Q4IGVHzHpB5q7mnASc0BlZTZGDBAYNZ6mMebtDMxdPMxnWVhgnHdqAWYf
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="312727757"
X-IronPort-AV: E=Sophos;i="5.96,169,1665471600"; 
   d="scan'208";a="312727757"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2022 16:58:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="670711579"
X-IronPort-AV: E=Sophos;i="5.96,169,1665471600"; 
   d="scan'208";a="670711579"
Received: from lkp-server01.sh.intel.com (HELO ebd99836cbe0) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 16 Nov 2022 16:58:26 -0800
Received: from kbuild by ebd99836cbe0 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1ovTEX-0002tf-21;
        Thu, 17 Nov 2022 00:58:25 +0000
Date:   Thu, 17 Nov 2022 08:57:39 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 40059212f99c31f26c69763e560325e59eac02c6
Message-ID: <63758703.Hh/dfzLzOqxGNWLC%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 40059212f99c31f26c69763e560325e59eac02c6  dt-bindings: gpio: gpio-davinci: Increase maxItems in gpio-line-names

elapsed time: 844m

configs tested: 86
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
um                             i386_defconfig
um                           x86_64_defconfig
s390                             allyesconfig
arc                              allyesconfig
alpha                            allyesconfig
powerpc                           allnoconfig
m68k                             allyesconfig
m68k                             allmodconfig
sh                               allmodconfig
mips                             allyesconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
ia64                             allmodconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                           rhel-8.3-kvm
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-syz
x86_64                        randconfig-a006
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                              defconfig
i386                                defconfig
i386                          randconfig-a014
arc                  randconfig-r043-20221116
x86_64                               rhel-8.3
x86_64                        randconfig-a013
i386                          randconfig-a012
x86_64                        randconfig-a011
x86_64                           allyesconfig
x86_64                        randconfig-a015
sh                          r7785rp_defconfig
i386                             allyesconfig
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
powerpc                          allmodconfig
i386                          randconfig-a016
x86_64                            allnoconfig
i386                          randconfig-c001
microblaze                          defconfig
sh                          rsk7203_defconfig
sparc64                          alldefconfig
sh                            titan_defconfig
powerpc                 mpc85xx_cds_defconfig
mips                            ar7_defconfig
arm                            zeus_defconfig
arm                             ezx_defconfig
arm                         lubbock_defconfig
riscv             nommu_k210_sdcard_defconfig
powerpc                mpc7448_hpc2_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
s390                       zfcpdump_defconfig
sh                      rts7751r2d1_defconfig

clang tested configs:
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
riscv                randconfig-r042-20221116
i386                          randconfig-a013
hexagon              randconfig-r041-20221116
hexagon              randconfig-r045-20221116
x86_64                        randconfig-a014
s390                 randconfig-r044-20221116
i386                          randconfig-a011
x86_64                        randconfig-a016
i386                          randconfig-a015
x86_64                        randconfig-a012
powerpc                     pseries_defconfig
hexagon              randconfig-r041-20221117
hexagon              randconfig-r045-20221117

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
