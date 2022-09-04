Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5CD165AC3A5
	for <lists+linux-gpio@lfdr.de>; Sun,  4 Sep 2022 11:36:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230163AbiIDJgs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 4 Sep 2022 05:36:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229597AbiIDJgr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 4 Sep 2022 05:36:47 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D1013FA1F
        for <linux-gpio@vger.kernel.org>; Sun,  4 Sep 2022 02:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662284207; x=1693820207;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=5o05SOyojSLsPwP0ZXkVMfrJafnZYbXbCUfCpPYmquQ=;
  b=a7E3kp5znwMWlpLrcRvZqThCbEx65RsykQLIamA5l90URUxIZsif/od9
   CrqFBRo936igp65k+cFNHaOn7kGklH9nIPZjmyUCYjSHNe7htTI4o0BFX
   X/QpZkO4j8XrtHwmnj6W/O3ik0zntbeh5lxt5AFZJNuFAFtMVbk+5xBN+
   kms2D9FZcjsLLL44kr5HdPx53O4CNdOrHZU7NoLAp6vf0U45BpK8MWdlW
   fbnFxRPVe5eBtzs6Jwj0hsHKxvKU3rYsRnRSCA8mPf5ik3UscpEZVxPCo
   63huaO5o1m6SD4cJdV10dLDy6xRcB3K3l+pPKJJ9r7C46XduKYX0h8HJR
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10459"; a="275970454"
X-IronPort-AV: E=Sophos;i="5.93,289,1654585200"; 
   d="scan'208";a="275970454"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2022 02:36:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,289,1654585200"; 
   d="scan'208";a="941772245"
Received: from lkp-server02.sh.intel.com (HELO 95dfd251caa2) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 04 Sep 2022 02:36:45 -0700
Received: from kbuild by 95dfd251caa2 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oUm3Z-0002tN-09;
        Sun, 04 Sep 2022 09:36:45 +0000
Date:   Sun, 04 Sep 2022 17:36:14 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS WITH WARNING
 6890381720b27a41f2d9e68cce241336342ea3b7
Message-ID: <6314718e.SJJd43cKBkhRjAd3%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: 6890381720b27a41f2d9e68cce241336342ea3b7  gpio: ws16c48: Make irq_chip immutable

Warning reports:

https://lore.kernel.org/linux-doc/202208211933.F50Nni98-lkp@intel.com

Warning: (recently discovered and may have been fixed)

Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/gpio/xlnx,gpio-xilinx.yaml

Warning ids grouped by kconfigs:

gcc_recent_errors
`-- x86_64-allnoconfig
    `-- Warning:MAINTAINERS-references-a-file-that-doesn-t-exist:Documentation-devicetree-bindings-gpio-xlnx-gpio-xilinx.yaml

elapsed time: 721m

configs tested: 80
configs skipped: 3

gcc tested configs:
arc                  randconfig-r043-20220904
riscv                randconfig-r042-20220904
s390                 randconfig-r044-20220904
um                             i386_defconfig
um                           x86_64_defconfig
arm                                 defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                               rhel-8.3
ia64                             allmodconfig
arc                              allyesconfig
arm                              allyesconfig
powerpc                           allnoconfig
x86_64                        randconfig-a006
i386                                defconfig
powerpc                          allmodconfig
alpha                            allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
i386                          randconfig-a014
sh                               allmodconfig
mips                             allyesconfig
arm64                            allyesconfig
i386                          randconfig-a001
i386                          randconfig-a012
i386                          randconfig-a016
x86_64                        randconfig-a013
i386                          randconfig-a003
x86_64                        randconfig-a011
x86_64                    rhel-8.3-kselftests
i386                          randconfig-a005
x86_64                          rhel-8.3-func
x86_64                        randconfig-a015
i386                             allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
microblaze                      mmu_defconfig
sh                           se7712_defconfig
arm                         lpc18xx_defconfig
sparc                               defconfig
arc                               allnoconfig
alpha                             allnoconfig
riscv                             allnoconfig
csky                              allnoconfig
m68k                        m5272c3_defconfig
sh                               j2_defconfig
arc                         haps_hs_defconfig
mips                        bcm47xx_defconfig
s390                       zfcpdump_defconfig
arm                      integrator_defconfig
parisc64                         alldefconfig
ia64                      gensparse_defconfig
sh                            shmin_defconfig
i386                          randconfig-c001
arm                         assabet_defconfig
mips                       bmips_be_defconfig
m68k                             alldefconfig
sh                          sdk7780_defconfig
mips                      fuloong2e_defconfig

clang tested configs:
hexagon              randconfig-r045-20220904
hexagon              randconfig-r041-20220904
x86_64                        randconfig-a005
i386                          randconfig-a013
x86_64                        randconfig-a001
i386                          randconfig-a015
x86_64                        randconfig-a003
i386                          randconfig-a011
i386                          randconfig-a002
x86_64                        randconfig-a012
i386                          randconfig-a004
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a006
powerpc                 mpc8272_ads_defconfig
mips                      malta_kvm_defconfig
riscv                          rv32_defconfig
x86_64                        randconfig-k001

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
