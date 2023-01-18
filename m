Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D07496710ED
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jan 2023 03:13:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229569AbjARCNs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Jan 2023 21:13:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbjARCNr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Jan 2023 21:13:47 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B283D3F288
        for <linux-gpio@vger.kernel.org>; Tue, 17 Jan 2023 18:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674008026; x=1705544026;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=xupgtfUvgHIwWwWzChQK9gNtS9rGqsIZ5+D1q8FZ7hQ=;
  b=DAPyWoyv/e8avtLOe5pR1RfNYBhBXJuRcGzysCVTG4Mdq9LzkEdWjgGG
   SzdTJrgDM/8lzsZfshVhUlmgJrMHCBYXUxmZD9OUpzb1bnyGKQWpLis4S
   1e+YbQFP0gkUAWIcU6Tq+tnnisEJ9a0PYJdw7J9Pd9pG/viaTNWrv13wg
   foDcF+iT2H/4S+QP5DLxnEiL53n43M0zNQf+6IXBDyBulUu2d/fwaa41w
   CY/lyzaZubNxWSFaHYxCMsdpceRwvZo4r8x/hrOnyzGGXz71/oSQ6Di5I
   4cbTYzHZQr7J2MvjdqSadaOjXmrmHf1C9bHJcDOkUn9G9P4FvFC2B3ZqW
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="326956282"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; 
   d="scan'208";a="326956282"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2023 18:13:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="833378856"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; 
   d="scan'208";a="833378856"
Received: from lkp-server02.sh.intel.com (HELO f57cd993bc73) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 17 Jan 2023 18:13:44 -0800
Received: from kbuild by f57cd993bc73 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pHxxP-0001YQ-2B;
        Wed, 18 Jan 2023 02:13:43 +0000
Date:   Wed, 18 Jan 2023 10:12:46 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:fixes] BUILD SUCCESS
 431d1531466033909d2e8c754a7dc3704b70843f
Message-ID: <63c7559e.aF8SuvSCZNGXnVhR%lkp@intel.com>
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
branch HEAD: 431d1531466033909d2e8c754a7dc3704b70843f  pinctrl: rockchip: fix mux route data for rk3568

elapsed time: 720m

configs tested: 135
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
i386                                defconfig
um                             i386_defconfig
i386                             allyesconfig
um                           x86_64_defconfig
x86_64                            allnoconfig
powerpc                           allnoconfig
arc                                 defconfig
powerpc                          allmodconfig
alpha                               defconfig
mips                             allyesconfig
m68k                             allyesconfig
sh                               allmodconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
arm                                 defconfig
s390                                defconfig
s390                             allmodconfig
x86_64                              defconfig
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
x86_64                               rhel-8.3
i386                 randconfig-a014-20230116
i386                 randconfig-a013-20230116
i386                 randconfig-a012-20230116
arm                              allyesconfig
i386                 randconfig-a011-20230116
arm64                            allyesconfig
i386                 randconfig-a015-20230116
i386                 randconfig-a016-20230116
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-bpf
s390                 randconfig-r044-20230116
x86_64                           allyesconfig
s390                             allyesconfig
riscv                randconfig-r042-20230116
arc                  randconfig-r043-20230116
arm                  randconfig-r046-20230117
arc                  randconfig-r043-20230117
ia64                             allmodconfig
x86_64                        randconfig-a013
x86_64               randconfig-a011-20230116
x86_64               randconfig-a016-20230116
x86_64               randconfig-a014-20230116
x86_64               randconfig-a013-20230116
x86_64               randconfig-a015-20230116
x86_64               randconfig-a012-20230116
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                 randconfig-c001-20230116
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
riscv                randconfig-r042-20230118
s390                 randconfig-r044-20230118
arc                  randconfig-r043-20230118
xtensa                  cadence_csp_defconfig
sh                             shx3_defconfig
sh                          kfr2r09_defconfig
sh                     magicpanelr2_defconfig
m68k                            q40_defconfig
ia64                      gensparse_defconfig
mips                  decstation_64_defconfig
m68k                          multi_defconfig
powerpc                    sam440ep_defconfig
sh                         ap325rxa_defconfig
riscv                            allyesconfig
sparc                               defconfig
xtensa                           allyesconfig
csky                                defconfig
sparc                            allyesconfig
x86_64                                  kexec
i386                          randconfig-c001
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
nios2                            allyesconfig
nios2                               defconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
loongarch                           defconfig
loongarch                         allnoconfig
loongarch                        allmodconfig
arm                  randconfig-r046-20230115
arc                  randconfig-r043-20230115
m68k                          hp300_defconfig
arm                            lart_defconfig

clang tested configs:
x86_64                          rhel-8.3-rust
x86_64               randconfig-a001-20230116
x86_64               randconfig-a003-20230116
x86_64               randconfig-a002-20230116
x86_64               randconfig-a004-20230116
x86_64               randconfig-a005-20230116
x86_64               randconfig-a006-20230116
hexagon              randconfig-r041-20230116
hexagon              randconfig-r045-20230117
s390                 randconfig-r044-20230117
hexagon              randconfig-r041-20230117
arm                  randconfig-r046-20230116
hexagon              randconfig-r045-20230116
riscv                randconfig-r042-20230117
i386                 randconfig-a002-20230116
i386                 randconfig-a004-20230116
i386                 randconfig-a003-20230116
x86_64                        randconfig-k001
i386                 randconfig-a005-20230116
i386                 randconfig-a006-20230116
i386                 randconfig-a001-20230116
arm                          sp7021_defconfig
powerpc                     ppa8548_defconfig
x86_64                        randconfig-a012
x86_64                        randconfig-a014
powerpc                        fsp2_defconfig
mips                           rs90_defconfig
powerpc                 mpc836x_rdk_defconfig
x86_64                        randconfig-a016
powerpc                      acadia_defconfig
arm                        magician_defconfig
riscv                             allnoconfig
arm                         hackkit_defconfig
mips                          malta_defconfig
mips                        qi_lb60_defconfig
powerpc                     tqm8560_defconfig
mips                       lemote2f_defconfig
arm                            mmp2_defconfig
powerpc                 xes_mpc85xx_defconfig
powerpc                     kmeter1_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
