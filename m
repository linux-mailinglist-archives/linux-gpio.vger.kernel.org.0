Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32E11624E92
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Nov 2022 00:47:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229667AbiKJXrt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Nov 2022 18:47:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229528AbiKJXrs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Nov 2022 18:47:48 -0500
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 777ED5E9FA
        for <linux-gpio@vger.kernel.org>; Thu, 10 Nov 2022 15:47:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668124066; x=1699660066;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=+v9kEgcJfazMlASb8pmreBFtrNT+w08aR/p/bXtrqBE=;
  b=P0GtJyE9zwDEGo63/uzg11TfS0sW6Z68+PmCvFGB79eIMahb4lrxM7W8
   Wd6rfrUdbjg3FiXZiJEmX1r3y9oiaJOtCju9MJ2t8NPYPzgcB88Du/h+r
   U/7Q0dqZCQH4fzfmgN47vnc4om/teWUDOGYRV7UHi28r0uzZ66VEjqQ6x
   zSvGKswW36UlMQTEWtDiRe8/U1S+mbzyRnwdgUSM3lfxbSKzRVyJS1d/F
   xwgzi3CN4LmwvAl3Gd4BYTjzmF8aPFNMAQ6dhadbVV2zRY3rMWIOstP2g
   xY1hw2vbm0Ll8UcO7VXXqeKK6+bEVXG19yjcJ899XtaSPqTplD+Gz65pG
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="373598165"
X-IronPort-AV: E=Sophos;i="5.96,155,1665471600"; 
   d="scan'208";a="373598165"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2022 15:47:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="670548313"
X-IronPort-AV: E=Sophos;i="5.96,155,1665471600"; 
   d="scan'208";a="670548313"
Received: from lkp-server01.sh.intel.com (HELO e783503266e8) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 10 Nov 2022 15:47:44 -0800
Received: from kbuild by e783503266e8 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1otHGq-0003NN-0g;
        Thu, 10 Nov 2022 23:47:44 +0000
Date:   Fri, 11 Nov 2022 07:46:56 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:fixes] BUILD SUCCESS
 91d5c5060ee24fe8da88cd585bb43b843d2f0dce
Message-ID: <636d8d70.6DzTtxVbybODN5y5%lkp@intel.com>
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
branch HEAD: 91d5c5060ee24fe8da88cd585bb43b843d2f0dce  pinctrl: devicetree: fix null pointer dereferencing in pinctrl_dt_to_map

elapsed time: 726m

configs tested: 107
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                            allnoconfig
s390                       zfcpdump_defconfig
powerpc                      arches_defconfig
powerpc                     sequoia_defconfig
mips                         cobalt_defconfig
arm                      footbridge_defconfig
xtensa                  cadence_csp_defconfig
mips                         db1xxx_defconfig
arm                        spear6xx_defconfig
powerpc                      pasemi_defconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
powerpc                           allnoconfig
ia64                             allmodconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
powerpc              randconfig-c003-20221110
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
i386                                defconfig
i386                             allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
s390                                defconfig
s390                             allmodconfig
arc                                 defconfig
s390                             allyesconfig
alpha                               defconfig
sh                           se7722_defconfig
arm                         lpc18xx_defconfig
nios2                         10m50_defconfig
powerpc                 mpc837x_rdb_defconfig
sh                      rts7751r2d1_defconfig
sh                   secureedge5410_defconfig
xtensa                    xip_kc705_defconfig
xtensa                          iss_defconfig
powerpc                 mpc834x_mds_defconfig
arm64                               defconfig
powerpc                 linkstation_defconfig
parisc                generic-64bit_defconfig
loongarch                           defconfig
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
arm                             rpc_defconfig
m68k                          multi_defconfig
arc                         haps_hs_defconfig
powerpc                    amigaone_defconfig
arc                        nsimosci_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
powerpc                       ppc64_defconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
sh                           se7724_defconfig
microblaze                          defconfig
parisc                           alldefconfig
arm                          pxa910_defconfig
arm                         cm_x300_defconfig
xtensa                           alldefconfig
parisc                generic-32bit_defconfig
loongarch                         allnoconfig
loongarch                        allmodconfig
i386                          randconfig-c001
ia64                        generic_defconfig
openrisc                         alldefconfig
sparc                               defconfig
csky                                defconfig
sparc                            allyesconfig
x86_64                                  kexec

clang tested configs:
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a004
s390                 randconfig-r044-20221110
riscv                randconfig-r042-20221110
hexagon              randconfig-r041-20221110
hexagon              randconfig-r045-20221110
x86_64                        randconfig-a003
powerpc                        fsp2_defconfig
powerpc                    gamecube_defconfig
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
x86_64                        randconfig-a012
x86_64                        randconfig-a005
mips                     loongson2k_defconfig
riscv                             allnoconfig
x86_64                        randconfig-k001

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
