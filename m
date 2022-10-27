Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C773E60ED83
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Oct 2022 03:37:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233926AbiJ0Bh2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Oct 2022 21:37:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233858AbiJ0Bh1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Oct 2022 21:37:27 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2E19F418F
        for <linux-gpio@vger.kernel.org>; Wed, 26 Oct 2022 18:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666834646; x=1698370646;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=JZvChV1aZvUfhUyWjdpuZGuN0Af0y0wHJpDoganPJpM=;
  b=XyTVm5oRv76uHgzAY1JEqxl06XVsNV+bJVK6KAWMhxP2gSvbO8rTmda7
   ET7m3DeK5pA8KlnI1I6doM6bvgPjQmVHhcIH2WuqYLHgDpuP0ON2wuhST
   6ctiq3ckzEN/isrl9lGwhwp3w5La3WwaYVpR4wL7eHYByZRgqCskg/jjf
   W3he6g5wOQMglc7fjan50Od2qevgGspSBCqtfswPHjfyeeyrPsffnIMLt
   fey5HnNH3mQhuenK7UTr8Czo0AZOba0VkzuFHhJVdLI6IKVCouyH/1VFN
   sLOHOfXs0RTh+Sd/gTHJhxlaHy1bC5cdgZdcFOBeqjaxltES9FlAPnCYJ
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="394420543"
X-IronPort-AV: E=Sophos;i="5.95,215,1661842800"; 
   d="scan'208";a="394420543"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2022 18:37:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="632232087"
X-IronPort-AV: E=Sophos;i="5.95,215,1661842800"; 
   d="scan'208";a="632232087"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 26 Oct 2022 18:37:25 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1onrpk-00086C-1d;
        Thu, 27 Oct 2022 01:37:24 +0000
Date:   Thu, 27 Oct 2022 09:37:03 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 b4e83d369015e3045418ca86984c3cd8dcf5a365
Message-ID: <6359e0bf.1oJjtrbLesTN/qUT%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: b4e83d369015e3045418ca86984c3cd8dcf5a365  gpio: exar: Allow IO port access

elapsed time: 724m

configs tested: 90
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
s390                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
um                             i386_defconfig
alpha                            allyesconfig
um                           x86_64_defconfig
m68k                             allyesconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
ia64                             allmodconfig
i386                                defconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
i386                          randconfig-a003
x86_64                        randconfig-a013
x86_64                           rhel-8.3-kvm
x86_64                        randconfig-a011
x86_64                        randconfig-a002
i386                             allyesconfig
x86_64                          rhel-8.3-func
x86_64                        randconfig-a015
x86_64                    rhel-8.3-kselftests
i386                          randconfig-a001
riscv                randconfig-r042-20221026
arc                  randconfig-r043-20221026
s390                 randconfig-r044-20221026
x86_64                        randconfig-a004
x86_64                        randconfig-a006
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
arm                                 defconfig
i386                          randconfig-a005
arm64                            allyesconfig
arm                              allyesconfig
m68k                            q40_defconfig
arm                           imxrt_defconfig
arm                         assabet_defconfig
arm                          gemini_defconfig
sparc                             allnoconfig
m68k                        m5272c3_defconfig
xtensa                    smp_lx200_defconfig
powerpc                    amigaone_defconfig
sh                           se7724_defconfig
sh                          rsk7201_defconfig
i386                          randconfig-c001
arm                        keystone_defconfig
powerpc                     stx_gp3_defconfig
arm                         axm55xx_defconfig
powerpc                     redwood_defconfig
sh                      rts7751r2d1_defconfig
mips                        vocore2_defconfig
mips                            ar7_defconfig
arc                            hsdk_defconfig
arm                             ezx_defconfig
sh                            migor_defconfig
nios2                         3c120_defconfig
mips                 randconfig-c004-20221026
arm                           h5000_defconfig
m68k                          hp300_defconfig
alpha                            alldefconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
mips                  decstation_64_defconfig
riscv             nommu_k210_sdcard_defconfig

clang tested configs:
x86_64                        randconfig-a014
i386                          randconfig-a002
i386                          randconfig-a004
hexagon              randconfig-r045-20221026
x86_64                        randconfig-a016
x86_64                        randconfig-a012
hexagon              randconfig-r041-20221026
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
i386                          randconfig-a006
x86_64                        randconfig-k001

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
