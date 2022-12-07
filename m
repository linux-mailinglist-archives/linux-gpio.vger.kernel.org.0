Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 204186462F3
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Dec 2022 22:06:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229649AbiLGVGW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Dec 2022 16:06:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbiLGVGV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Dec 2022 16:06:21 -0500
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B60C4AF16
        for <linux-gpio@vger.kernel.org>; Wed,  7 Dec 2022 13:06:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670447180; x=1701983180;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=JTRLr9fXeBnl5n9+9gSKFo16dBbEZz57c2pf70BkjlU=;
  b=LtHjzkQMTZkJqPuOu6vWdlTpWSjWRrjw+EWr7jyuPeWf5jHL3j+lBu3v
   zouquYNJILf9mH/hCcKSYrOqxGlvqdL3pyyAvhRb36kRTsKhXoBEi9X2t
   CYe77HjH8Req4yTDSTN3AcAn0SG421ny+CaAiU+FEcuWBcmbvHC8eQSt9
   RU8NvMUlqBqchIimpzK0j3Gz9cwxxSyFap/toQvcxgipIFAGH8OjUu14J
   UQSFiJP8Ntm6xNqtcJxNGZLbGIltyPBhlWIqg/YWQgKHuYbjULfEmQJPh
   EPam73Rb1Q9GdHxpeuzytv8DowLs30F++cSrso8yNSIh7j4bpiD/n5dM7
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="379172399"
X-IronPort-AV: E=Sophos;i="5.96,225,1665471600"; 
   d="scan'208";a="379172399"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2022 13:06:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="624444832"
X-IronPort-AV: E=Sophos;i="5.96,225,1665471600"; 
   d="scan'208";a="624444832"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 07 Dec 2022 13:06:18 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1p31cP-0000Yt-1r;
        Wed, 07 Dec 2022 21:06:17 +0000
Date:   Thu, 08 Dec 2022 05:05:53 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 bdbbae241a04f387ba910b8609f95fad5f1470c7
Message-ID: <63910031.wwErjtZHYJH3Nt/v%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: bdbbae241a04f387ba910b8609f95fad5f1470c7  gpiolib: protect the GPIO device against being dropped while in use by user-space

elapsed time: 722m

configs tested: 83
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
um                             i386_defconfig
um                           x86_64_defconfig
i386                                defconfig
x86_64                              defconfig
x86_64                          rhel-8.3-rust
x86_64                    rhel-8.3-kselftests
arc                  randconfig-r043-20221207
x86_64                          rhel-8.3-func
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
riscv                randconfig-r042-20221207
s390                                defconfig
ia64                             allmodconfig
s390                 randconfig-r044-20221207
x86_64                           rhel-8.3-syz
arm                                 defconfig
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                               rhel-8.3
s390                             allyesconfig
m68k                             allyesconfig
x86_64                           allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
i386                             allyesconfig
arm64                            allyesconfig
arm                              allyesconfig
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
x86_64                            allnoconfig
sh                   sh7770_generic_defconfig
m68k                                defconfig
mips                          rb532_defconfig
sh                   sh7724_generic_defconfig
mips                         db1xxx_defconfig
sh                             espt_defconfig
arc                      axs103_smp_defconfig
nios2                               defconfig
m68k                          amiga_defconfig
arm                         cm_x300_defconfig
xtensa                    xip_kc705_defconfig
um                               alldefconfig
m68k                           sun3_defconfig
csky                                defconfig
ia64                        generic_defconfig
sh                           se7343_defconfig
mips                  decstation_64_defconfig
i386                          randconfig-c001
xtensa                           allyesconfig
arm                      footbridge_defconfig
powerpc                      pcm030_defconfig
arm                        shmobile_defconfig
ia64                      gensparse_defconfig
mips                     decstation_defconfig

clang tested configs:
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
x86_64                        randconfig-a016
arm                  randconfig-r046-20221207
hexagon              randconfig-r041-20221207
hexagon              randconfig-r045-20221207
i386                          randconfig-a006
i386                          randconfig-a002
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
powerpc                          allyesconfig
mips                       lemote2f_defconfig
powerpc                      ppc64e_defconfig
powerpc                     ppa8548_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
