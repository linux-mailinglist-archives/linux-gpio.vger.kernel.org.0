Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B8D45ACEF8
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Sep 2022 11:38:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234333AbiIEJhM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Sep 2022 05:37:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235312AbiIEJhL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Sep 2022 05:37:11 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D7F54AD6D
        for <linux-gpio@vger.kernel.org>; Mon,  5 Sep 2022 02:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662370630; x=1693906630;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=8ZdLbbDEtee6wWLp7oVk4M2hVEM6B/5Bv4lZU/94T3Q=;
  b=JFCxUgAZ8fWF4tSVQdE2q334EnGS15jaHVPtbKL/iVhe6fdviph+Hapa
   OgU/HKFKW5lCttYyhkdXHzpbmdSJtUsQ0bNgrM9CEVkbWfYV2v8s4HdzH
   +ntg36T6twsaPtT3XxCWifEZMX/BSbEBiKRZGqMCGWtv9hy4HRF1rlaK6
   T1q87LbfnEWrlimcN2iKbH6SYRLUEHbPddVyGe/Vt2b7wJHl0gQGbZHXP
   UaS8fDVnxjxQqY7HxiLA6Ak7VL/qZAdOAP5T1cZG1w0rXri6A5FVdqjJ1
   Ujuj8SwNEraLaq5l91F1JDLNonEvf5OosafpjTm3RGsAbvtaBfrf+uxD2
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10460"; a="279366585"
X-IronPort-AV: E=Sophos;i="5.93,290,1654585200"; 
   d="scan'208";a="279366585"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2022 02:37:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,290,1654585200"; 
   d="scan'208";a="942042690"
Received: from lkp-server02.sh.intel.com (HELO 95dfd251caa2) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 05 Sep 2022 02:37:08 -0700
Received: from kbuild by 95dfd251caa2 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oV8XU-00040o-0I;
        Mon, 05 Sep 2022 09:37:08 +0000
Date:   Mon, 05 Sep 2022 17:36:22 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 5134272f9f3f71d4e1f3aa15cb09321af49b3646
Message-ID: <6315c316.g7kHgzq1EEqZlLce%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 5134272f9f3f71d4e1f3aa15cb09321af49b3646  gpio: exar: access MPIO registers on cascaded chips

elapsed time: 727m

configs tested: 102
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
i386                                defconfig
x86_64                              defconfig
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
i386                 randconfig-a003-20220905
i386                 randconfig-a004-20220905
i386                 randconfig-a001-20220905
i386                 randconfig-a002-20220905
arc                  randconfig-r043-20220905
arc                  randconfig-r043-20220904
arm                                 defconfig
i386                 randconfig-a005-20220905
x86_64                               rhel-8.3
i386                 randconfig-a006-20220905
x86_64                           rhel-8.3-kvm
riscv                randconfig-r042-20220904
x86_64                          rhel-8.3-func
m68k                             allmodconfig
x86_64               randconfig-a003-20220905
x86_64               randconfig-a002-20220905
arc                              allyesconfig
i386                             allyesconfig
powerpc                           allnoconfig
x86_64                         rhel-8.3-kunit
x86_64               randconfig-a006-20220905
x86_64                    rhel-8.3-kselftests
x86_64                           allyesconfig
powerpc                          allmodconfig
x86_64                           rhel-8.3-syz
s390                 randconfig-r044-20220904
x86_64               randconfig-a004-20220905
alpha                            allyesconfig
arm64                            allyesconfig
sh                               allmodconfig
x86_64               randconfig-a005-20220905
mips                             allyesconfig
x86_64               randconfig-a001-20220905
m68k                             allyesconfig
arm                              allyesconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
i386                             alldefconfig
ia64                          tiger_defconfig
sh                         apsh4a3a_defconfig
ia64                             allmodconfig
mips                           jazz_defconfig
arm                        realview_defconfig
powerpc                mpc7448_hpc2_defconfig
mips                  maltasmvp_eva_defconfig
sh                           se7712_defconfig
powerpc                      makalu_defconfig
sh                          sdk7786_defconfig
sh                         microdev_defconfig
openrisc                       virt_defconfig
powerpc                     ep8248e_defconfig
powerpc                      ep88xc_defconfig
sh                   sh7770_generic_defconfig
sh                   secureedge5410_defconfig
powerpc                  iss476-smp_defconfig
mips                         db1xxx_defconfig
sh                           se7780_defconfig
xtensa                    xip_kc705_defconfig
arc                     nsimosci_hs_defconfig
arc                          axs101_defconfig
m68k                             alldefconfig
loongarch                         allnoconfig
arm                           viper_defconfig
i386                          randconfig-c001
sparc                               defconfig
arm                     eseries_pxa_defconfig
powerpc                      mgcoge_defconfig
sh                           se7751_defconfig
nios2                            allyesconfig
arm                           corgi_defconfig
m68k                         apollo_defconfig
powerpc                        warp_defconfig
riscv                    nommu_k210_defconfig
i386                 randconfig-c001-20220905

clang tested configs:
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
hexagon              randconfig-r045-20220905
hexagon              randconfig-r045-20220904
riscv                randconfig-r042-20220905
hexagon              randconfig-r041-20220904
x86_64               randconfig-a014-20220905
hexagon              randconfig-r041-20220905
x86_64               randconfig-a013-20220905
s390                 randconfig-r044-20220905
x86_64               randconfig-a011-20220905
x86_64               randconfig-a012-20220905
x86_64               randconfig-a016-20220905
x86_64               randconfig-a015-20220905
powerpc                        fsp2_defconfig
arm                              alldefconfig
hexagon                             defconfig
x86_64                        randconfig-k001

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
