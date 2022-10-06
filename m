Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DADD75F711E
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Oct 2022 00:27:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230210AbiJFW1x (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 6 Oct 2022 18:27:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229683AbiJFW1x (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 6 Oct 2022 18:27:53 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31E9EF1905
        for <linux-gpio@vger.kernel.org>; Thu,  6 Oct 2022 15:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665095272; x=1696631272;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=QUwmQ8NVaTf+xtr0KE2GJ0MQ2FiQmMp929b9gvh2rWY=;
  b=BUlt4Mjzo2qx3x7Rt3ZwKj7ks2m3ps4jbthnwAq9RHaGJnoPWCQWlB5k
   +cUNOQV9YPmYPHoa6b3C5tHqalC6wQEusn/Oe2BF14/xUQuBhvwEVpadi
   d6y4Hnm/K+ohes0588dER76wECuitXkCRbXqnmL8Yh+uDEyBAEWC147J8
   q8+CQBFYoRHBrA7Qqow7xcfX3GCI54Lieczh8y11bkzkA+rRfujPINlJr
   IwP6IwZ6ReUx6k4o9OjR12NB9n1VQoc54ue6AWLA4xi6VI6kaBRwChbJh
   DpcKXg6cxnFLAkQr9c038A8LKF814qpa7v0k9v13CZ0SYjEC+ceda9xap
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10492"; a="330024413"
X-IronPort-AV: E=Sophos;i="5.95,164,1661842800"; 
   d="scan'208";a="330024413"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2022 15:27:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10492"; a="714025696"
X-IronPort-AV: E=Sophos;i="5.95,164,1661842800"; 
   d="scan'208";a="714025696"
Received: from lkp-server01.sh.intel.com (HELO 3c15167049b7) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 06 Oct 2022 15:27:50 -0700
Received: from kbuild by 3c15167049b7 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1ogZLK-0000Xj-0j;
        Thu, 06 Oct 2022 22:27:50 +0000
Date:   Fri, 07 Oct 2022 06:27:03 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 9d157c89c5569f0ef560b7a5b2d7bf59ae98499c
Message-ID: <633f5637.gzyxUMOJ/0VXh+qc%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 9d157c89c5569f0ef560b7a5b2d7bf59ae98499c  MAINTAINERS: adjust STARFIVE JH7100 PINCTRL DRIVER after file movement

elapsed time: 727m

configs tested: 145
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
i386                 randconfig-a016-20221003
i386                 randconfig-a015-20221003
arm                                 defconfig
sh                               allmodconfig
i386                 randconfig-a011-20221003
arc                  randconfig-r043-20221003
m68k                             allyesconfig
x86_64                              defconfig
i386                 randconfig-a012-20221003
arc                  randconfig-r043-20221002
i386                 randconfig-a013-20221003
i386                                defconfig
riscv                randconfig-r042-20221003
i386                 randconfig-a014-20221003
arc                                 defconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
s390                             allmodconfig
x86_64                               rhel-8.3
x86_64                           rhel-8.3-kvm
x86_64               randconfig-a011-20221003
s390                 randconfig-r044-20221003
x86_64               randconfig-a012-20221003
x86_64                          rhel-8.3-func
alpha                               defconfig
x86_64               randconfig-a013-20221003
s390                                defconfig
powerpc                           allnoconfig
arm                              allyesconfig
x86_64                           allyesconfig
powerpc                          allmodconfig
s390                             allyesconfig
x86_64               randconfig-a014-20221003
x86_64                    rhel-8.3-kselftests
mips                             allyesconfig
x86_64               randconfig-a015-20221003
x86_64               randconfig-a016-20221003
arm64                            allyesconfig
i386                             allyesconfig
alpha                            allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
ia64                             allmodconfig
mips                        bcm47xx_defconfig
arm                          simpad_defconfig
powerpc                      cm5200_defconfig
arm                           viper_defconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
arc                        nsim_700_defconfig
sh                          r7780mp_defconfig
xtensa                              defconfig
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
m68k                            q40_defconfig
mips                  decstation_64_defconfig
powerpc                     tqm8548_defconfig
mips                      loongson3_defconfig
xtensa                  nommu_kc705_defconfig
m68k                            mac_defconfig
powerpc                     taishan_defconfig
powerpc                       eiger_defconfig
loongarch                        alldefconfig
powerpc                 mpc85xx_cds_defconfig
parisc                generic-64bit_defconfig
i386                          randconfig-c001
arm                  randconfig-c002-20221002
x86_64                        randconfig-c001
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
powerpc                        warp_defconfig
powerpc                      makalu_defconfig
csky                             alldefconfig
arc                      axs103_smp_defconfig
mips                            gpr_defconfig
arm                     eseries_pxa_defconfig
mips                         cobalt_defconfig
openrisc                            defconfig
nios2                            alldefconfig
powerpc                      pcm030_defconfig
arm                      jornada720_defconfig
sh                            migor_defconfig
powerpc                      tqm8xx_defconfig
powerpc                     tqm8555_defconfig
arm                        clps711x_defconfig
arm                      integrator_defconfig
powerpc                     sequoia_defconfig
powerpc                  storcenter_defconfig
powerpc                     mpc83xx_defconfig
mips                  maltasmvp_eva_defconfig
sh                           se7619_defconfig
riscv                            allyesconfig
powerpc                  iss476-smp_defconfig
sparc                            alldefconfig
m68k                        stmark2_defconfig
loongarch                           defconfig
loongarch                         allnoconfig
loongarch                        allmodconfig
sparc64                             defconfig
microblaze                          defconfig
arm64                            alldefconfig
openrisc                    or1ksim_defconfig
parisc64                            defconfig
powerpc                    adder875_defconfig
riscv                            allmodconfig
mips                       bmips_be_defconfig
mips                 randconfig-c004-20221002
arm                         s3c6400_defconfig
mips                     loongson1b_defconfig
powerpc                     asp8347_defconfig

clang tested configs:
hexagon              randconfig-r041-20221002
riscv                randconfig-r042-20221002
hexagon              randconfig-r041-20221003
s390                 randconfig-r044-20221002
hexagon              randconfig-r045-20221002
hexagon              randconfig-r045-20221003
x86_64               randconfig-a005-20221003
x86_64               randconfig-a002-20221003
x86_64               randconfig-a001-20221003
x86_64               randconfig-a004-20221003
i386                 randconfig-a006-20221003
x86_64               randconfig-a006-20221003
i386                 randconfig-a003-20221003
x86_64               randconfig-a003-20221003
i386                 randconfig-a001-20221003
i386                 randconfig-a004-20221003
i386                 randconfig-a002-20221003
i386                 randconfig-a005-20221003
powerpc                    mvme5100_defconfig
powerpc                     ppa8548_defconfig
riscv                randconfig-r042-20221006
hexagon              randconfig-r041-20221006
s390                 randconfig-r044-20221006
hexagon              randconfig-r045-20221006
x86_64                        randconfig-k001
powerpc                   microwatt_defconfig
mips                malta_qemu_32r6_defconfig
powerpc                      obs600_defconfig
arm                       cns3420vb_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
