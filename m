Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 421AC60CAFC
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Oct 2022 13:35:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229950AbiJYLfT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Oct 2022 07:35:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230179AbiJYLfR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Oct 2022 07:35:17 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3AB978BFC
        for <linux-gpio@vger.kernel.org>; Tue, 25 Oct 2022 04:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666697715; x=1698233715;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=oZ2dFocggJ+I0rTB2mDQ8DZ11g4T0qtoIqh0IixicOA=;
  b=I7DIEVDiqhQxlnGYFnultvLFF99NOtoF9bFAXGegr6Py7+AdliwS42vt
   6ZYK6N9BWWNS8HJmWK8RktGYgF3xeBNgSnUGwdPmFpeITkhtfSYHRvJUX
   mPe3oivKWyTjtWtM12K4Nqio/c9k7N3TZU5lZ8dhwp5i8ZauaTWyo3L2O
   AK+CBL1zifUO2d75lpI9Z1ZauQ+ADV11TH2kio+T9t9w54ltjSx75XFF+
   040a3CkDrAd/mXHl/vntxLHKOKNZSWyBk87IP6c5hzE+caYnMiQbz01hI
   5uP7/EcgngASBl7uIAQqmU28/cVySSlWxTflc0A7jGVjh7BCARMaiCCiw
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="287370150"
X-IronPort-AV: E=Sophos;i="5.95,212,1661842800"; 
   d="scan'208";a="287370150"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2022 04:35:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="662774669"
X-IronPort-AV: E=Sophos;i="5.95,212,1661842800"; 
   d="scan'208";a="662774669"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 25 Oct 2022 04:35:09 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1onID7-0006Dc-0T;
        Tue, 25 Oct 2022 11:35:09 +0000
Date:   Tue, 25 Oct 2022 19:34:57 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 4dd3330309001f8c9963979d2881b527fb18cbc4
Message-ID: <6357c9e1.OPAwVi/u07tKWQ0j%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 4dd3330309001f8c9963979d2881b527fb18cbc4  Merge branch 'devel' into for-next

elapsed time: 784m

configs tested: 108
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
alpha                            allyesconfig
m68k                             allyesconfig
i386                                defconfig
m68k                             allmodconfig
arc                              allyesconfig
arc                                 defconfig
x86_64                              defconfig
alpha                               defconfig
x86_64                               rhel-8.3
ia64                             allmodconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
i386                 randconfig-a011-20221024
x86_64                           rhel-8.3-kvm
i386                 randconfig-a014-20221024
s390                             allmodconfig
i386                 randconfig-a013-20221024
s390                                defconfig
i386                 randconfig-a012-20221024
i386                 randconfig-a016-20221024
i386                 randconfig-a015-20221024
i386                             allyesconfig
x86_64                           allyesconfig
s390                             allyesconfig
powerpc                           allnoconfig
i386                          randconfig-a001
i386                          randconfig-a003
mips                             allyesconfig
i386                          randconfig-a005
arc                  randconfig-r043-20221024
sh                               allmodconfig
riscv                randconfig-r042-20221024
arc                  randconfig-r043-20221023
s390                 randconfig-r044-20221024
arm                                 defconfig
arm                              allyesconfig
arm64                            allyesconfig
x86_64               randconfig-a013-20221024
x86_64               randconfig-a012-20221024
x86_64               randconfig-a011-20221024
x86_64               randconfig-a014-20221024
x86_64               randconfig-a015-20221024
x86_64               randconfig-a016-20221024
powerpc                          allmodconfig
x86_64               randconfig-k001-20221024
arc                  randconfig-r043-20221025
mips                     decstation_defconfig
arm                           h5000_defconfig
arm                       multi_v4t_defconfig
sh                           se7712_defconfig
sparc                               defconfig
arm                      footbridge_defconfig
sh                          landisk_defconfig
riscv                    nommu_k210_defconfig
openrisc                            defconfig
arm                        mini2440_defconfig
powerpc                      chrp32_defconfig
sh                          lboxre2_defconfig
m68k                           sun3_defconfig
sh                        dreamcast_defconfig
sh                          urquell_defconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
powerpc                   motionpro_defconfig
csky                             alldefconfig
powerpc                 mpc837x_rdb_defconfig
i386                          randconfig-c001
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arc                              alldefconfig
powerpc                 mpc85xx_cds_defconfig
sh                          polaris_defconfig
xtensa                    xip_kc705_defconfig
sh                             sh03_defconfig
arm                          pxa3xx_defconfig
powerpc                       ppc64_defconfig
powerpc                     sequoia_defconfig
powerpc                 mpc834x_itx_defconfig
arc                        vdk_hs38_defconfig
sparc                            allyesconfig

clang tested configs:
i386                          randconfig-a002
hexagon              randconfig-r045-20221023
i386                          randconfig-a004
hexagon              randconfig-r041-20221024
riscv                randconfig-r042-20221023
hexagon              randconfig-r045-20221024
s390                 randconfig-r044-20221023
i386                          randconfig-a006
hexagon              randconfig-r041-20221023
x86_64               randconfig-a001-20221024
x86_64               randconfig-a003-20221024
x86_64               randconfig-a004-20221024
x86_64               randconfig-a002-20221024
x86_64               randconfig-a005-20221024
x86_64               randconfig-a006-20221024
i386                 randconfig-a004-20221024
i386                 randconfig-a006-20221024
i386                 randconfig-a002-20221024
i386                 randconfig-a003-20221024
i386                 randconfig-a001-20221024
i386                 randconfig-a005-20221024
x86_64                        randconfig-k001

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
