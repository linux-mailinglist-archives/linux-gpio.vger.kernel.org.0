Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3615652FCE9
	for <lists+linux-gpio@lfdr.de>; Sat, 21 May 2022 15:35:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239472AbiEUNfp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 21 May 2022 09:35:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231151AbiEUNfo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 21 May 2022 09:35:44 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 791BD6A067
        for <linux-gpio@vger.kernel.org>; Sat, 21 May 2022 06:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653140143; x=1684676143;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=g97E3iVNJWwqSLUUeuUsW85ktdKL8I2RdEplGxYvgSA=;
  b=GuuqE6eKMAgvAi+SDBsvxBq9qy0NvI4ko6LnORFP3OiL1Gi6oCUDEC+v
   Y440PSQmV5GYlbiIKpOS/yRO6IlWg3l/RAu4OBwo35j+GdCsrtDTWSS7v
   6Ncsug+4aFT8g4sWE0OoSh1PICyM9ooQzDeXtosJmHcjZyBnHdFeTX+Sg
   HdYXuPL0+gHg+qAIDfLmxWuJQD6s9dMieJVzOEpC0OO394PRgbu3PpMFh
   kiWTIiehRZCJFMEMGNOVZyhC7eBLG1HDfOUmYm/7KFfHOTGRYjb4gaggP
   UpcaoudA2AVITHmR/QsozmUVyETZjwFYHR26cUnSBTQwK/mcBD+hBX9FZ
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10354"; a="335906870"
X-IronPort-AV: E=Sophos;i="5.91,242,1647327600"; 
   d="scan'208";a="335906870"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2022 06:35:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,242,1647327600"; 
   d="scan'208";a="547130010"
Received: from lkp-server02.sh.intel.com (HELO 242b25809ac7) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 21 May 2022 06:35:41 -0700
Received: from kbuild by 242b25809ac7 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nsPGe-0006Ks-IX;
        Sat, 21 May 2022 13:35:40 +0000
Date:   Sat, 21 May 2022 21:35:04 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 933adebbbd2f3160451b55f915133cd4d1c4d8fd
Message-ID: <6288ea88./L1uBJGh3qApF7sI%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 933adebbbd2f3160451b55f915133cd4d1c4d8fd  dt-bindings: pinctrl: qcom: Drop 'maxItems' on 'wakeup-parent'

elapsed time: 2868m

configs tested: 151
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-c001
i386                             allyesconfig
ia64                             allmodconfig
x86_64                           allyesconfig
ia64                             allyesconfig
x86_64                    rhel-8.3-kselftests
mips                             allyesconfig
riscv                            allyesconfig
um                           x86_64_defconfig
riscv                            allmodconfig
um                             i386_defconfig
mips                             allmodconfig
m68k                             allyesconfig
s390                             allmodconfig
m68k                             allmodconfig
powerpc                          allmodconfig
s390                             allyesconfig
powerpc                          allyesconfig
sparc                            allyesconfig
parisc                           allyesconfig
sh                               allmodconfig
h8300                            allyesconfig
xtensa                           allyesconfig
arc                              allyesconfig
alpha                            allyesconfig
nios2                            allyesconfig
arm                      footbridge_defconfig
s390                          debug_defconfig
xtensa                    xip_kc705_defconfig
sh                               j2_defconfig
mips                           ci20_defconfig
xtensa                          iss_defconfig
powerpc                      pcm030_defconfig
sh                   sh7770_generic_defconfig
h8300                    h8300h-sim_defconfig
sh                        sh7763rdp_defconfig
sh                         microdev_defconfig
arm                      jornada720_defconfig
powerpc                     sequoia_defconfig
um                                  defconfig
powerpc                        cell_defconfig
sh                                  defconfig
powerpc                    klondike_defconfig
powerpc64                           defconfig
powerpc                        warp_defconfig
mips                       capcella_defconfig
powerpc                 linkstation_defconfig
xtensa                  audio_kc705_defconfig
arm                           h3600_defconfig
parisc                generic-64bit_defconfig
sh                           se7619_defconfig
sh                          landisk_defconfig
sh                           se7343_defconfig
sh                            migor_defconfig
nios2                            alldefconfig
powerpc                      ep88xc_defconfig
h8300                       h8s-sim_defconfig
powerpc                     mpc83xx_defconfig
powerpc                 mpc834x_mds_defconfig
m68k                       m5208evb_defconfig
mips                  decstation_64_defconfig
m68k                       bvme6000_defconfig
sh                          sdk7786_defconfig
mips                 decstation_r4k_defconfig
m68k                          hp300_defconfig
mips                         mpc30x_defconfig
powerpc                     rainier_defconfig
sh                   secureedge5410_defconfig
arm                        realview_defconfig
sh                   rts7751r2dplus_defconfig
sh                          urquell_defconfig
sh                        sh7757lcr_defconfig
m68k                          sun3x_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220519
ia64                                defconfig
riscv                             allnoconfig
m68k                                defconfig
nios2                               defconfig
csky                                defconfig
alpha                               defconfig
arc                                 defconfig
s390                                defconfig
parisc                              defconfig
parisc64                            defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                                defconfig
sparc                               defconfig
powerpc                           allnoconfig
x86_64                        randconfig-a002
x86_64                        randconfig-a004
x86_64                        randconfig-a006
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arc                  randconfig-r043-20220519
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
x86_64                                  kexec
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit

clang tested configs:
powerpc              randconfig-c003-20220519
x86_64                        randconfig-c007
riscv                randconfig-c006-20220519
mips                 randconfig-c004-20220519
i386                          randconfig-c001
arm                  randconfig-c002-20220519
powerpc                          g5_defconfig
hexagon                             defconfig
mips                     loongson2k_defconfig
powerpc                      pmac32_defconfig
powerpc                 mpc8272_ads_defconfig
powerpc                     tqm8540_defconfig
arm                         palmz72_defconfig
mips                            e55_defconfig
arm                  colibri_pxa300_defconfig
arm                        mvebu_v5_defconfig
arm                              alldefconfig
powerpc                  mpc885_ads_defconfig
powerpc                    gamecube_defconfig
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r045-20220519
riscv                randconfig-r042-20220519
hexagon              randconfig-r041-20220519
s390                 randconfig-r044-20220519

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
