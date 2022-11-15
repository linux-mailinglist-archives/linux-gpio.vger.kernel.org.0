Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A952F629272
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Nov 2022 08:29:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232276AbiKOH3C (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Nov 2022 02:29:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232114AbiKOH3B (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Nov 2022 02:29:01 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7C0B1DDE4
        for <linux-gpio@vger.kernel.org>; Mon, 14 Nov 2022 23:28:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668497339; x=1700033339;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=sfeD59KHkMq7mmmKTMVqb/gpm7AulcITQ6AibsEc1R4=;
  b=IkNz201yBxT3LVhK0EiYxsZcCXZ9C3UQRg+u8hiIqXZiIa5Xmp1J7/+t
   kGlAU9b80q6HtSIQwH64+YCuv3On5wIVQ5w+BykruCV+a+64097Br1aCq
   MQBXsi4/Usc25CE8alNnKJ0m0W4YYsBVhVAoyk+f5ITRUI8Lyp/wrK2qb
   IKaJpl3Oc4g1tT3Rkgq5QlQpEEccHCgCBBoX2GL4VDOIiCvehqJsG2xHe
   SYsofDEXIal3LtOg22RhGYW5K47AHCTyDpppKzihBUsls3PFsh8Ygc5sH
   Vx98MCWPPpF8pM5HO+Nuww7jJDPiG6j35F+U+2uxJAbmT93Feabv9GHBh
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="310893692"
X-IronPort-AV: E=Sophos;i="5.96,165,1665471600"; 
   d="scan'208";a="310893692"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2022 23:28:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="702332559"
X-IronPort-AV: E=Sophos;i="5.96,165,1665471600"; 
   d="scan'208";a="702332559"
Received: from lkp-server01.sh.intel.com (HELO ebd99836cbe0) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 14 Nov 2022 23:28:58 -0800
Received: from kbuild by ebd99836cbe0 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1ouqNO-00019h-0G;
        Tue, 15 Nov 2022 07:28:58 +0000
Date:   Tue, 15 Nov 2022 15:27:58 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 06de519345f4af5b7ee48aaa30228fe5ac5de233
Message-ID: <63733f7e.C4FeKT6iMPMnm23I%lkp@intel.com>
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
branch HEAD: 06de519345f4af5b7ee48aaa30228fe5ac5de233  pinctrl: Move for_each_maps() to namespace and hide iterator inside

elapsed time: 917m

configs tested: 106
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
alpha                               defconfig
s390                                defconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
arc                  randconfig-r043-20221114
s390                             allmodconfig
i386                 randconfig-a001-20221114
i386                 randconfig-a004-20221114
i386                 randconfig-a002-20221114
i386                 randconfig-a005-20221114
i386                 randconfig-a006-20221114
s390                             allyesconfig
i386                 randconfig-a003-20221114
powerpc                           allnoconfig
powerpc                          allmodconfig
arc                              allyesconfig
mips                             allyesconfig
alpha                            allyesconfig
x86_64                              defconfig
i386                                defconfig
m68k                             allyesconfig
x86_64                               rhel-8.3
sh                               allmodconfig
x86_64                           rhel-8.3-syz
x86_64                           allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
i386                             allyesconfig
x86_64               randconfig-a002-20221114
x86_64               randconfig-a001-20221114
x86_64               randconfig-a004-20221114
x86_64               randconfig-a005-20221114
x86_64               randconfig-a003-20221114
x86_64               randconfig-a006-20221114
ia64                             allmodconfig
x86_64                            allnoconfig
arm                          pxa3xx_defconfig
m68k                       m5475evb_defconfig
sh                            hp6xx_defconfig
mips                  decstation_64_defconfig
powerpc                    sam440ep_defconfig
sparc64                          alldefconfig
arm                                 defconfig
i386                 randconfig-c001-20221114
m68k                             allmodconfig
sparc64                             defconfig
ia64                         bigsur_defconfig
ia64                             allyesconfig
arm                              allyesconfig
arm64                            allyesconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
parisc                generic-32bit_defconfig
sh                     magicpanelr2_defconfig
mips                           gcw0_defconfig
xtensa                         virt_defconfig
sh                            shmin_defconfig
xtensa                              defconfig
mips                        vocore2_defconfig
arm                           sunxi_defconfig
arm                               allnoconfig
loongarch                 loongson3_defconfig
arc                         haps_hs_defconfig
powerpc                     stx_gp3_defconfig
sh                           sh2007_defconfig
loongarch                        allmodconfig
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
sh                               j2_defconfig
arm                           stm32_defconfig
parisc                           alldefconfig
arm                         assabet_defconfig
arc                               allnoconfig
loongarch                           defconfig
loongarch                         allnoconfig

clang tested configs:
hexagon              randconfig-r045-20221114
hexagon              randconfig-r041-20221114
s390                 randconfig-r044-20221114
riscv                randconfig-r042-20221114
x86_64               randconfig-a014-20221114
x86_64               randconfig-a012-20221114
x86_64               randconfig-a015-20221114
x86_64               randconfig-a013-20221114
x86_64               randconfig-a011-20221114
x86_64               randconfig-a016-20221114
i386                 randconfig-a011-20221114
i386                 randconfig-a014-20221114
i386                 randconfig-a013-20221114
i386                 randconfig-a012-20221114
i386                 randconfig-a015-20221114
i386                 randconfig-a016-20221114
x86_64               randconfig-k001-20221114
hexagon              randconfig-r041-20221115
hexagon              randconfig-r045-20221115
arm                        magician_defconfig
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
arm                        multi_v5_defconfig
arm                       aspeed_g4_defconfig
powerpc                     kmeter1_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
