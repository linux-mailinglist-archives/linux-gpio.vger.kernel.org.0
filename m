Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A5D157C3A4
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Jul 2022 06:52:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229671AbiGUEwi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Jul 2022 00:52:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229559AbiGUEwh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Jul 2022 00:52:37 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DFF177A6E
        for <linux-gpio@vger.kernel.org>; Wed, 20 Jul 2022 21:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658379157; x=1689915157;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=TQvCoVPe+7nGm75N7h3jxLXiGgZpQpTx39Eyc/0Aw/M=;
  b=E5TXQu+AlCGSN7F2M6g5E3g+k99CYvmXBEKggDadd0CnNRtWALd1DvdF
   cJmZsxQ2j++gcFAtQ6rJzSTMVdzSyRxRkxqQEBNjFiYo8JCUsIWd6y30I
   aZNFnZOpOydcUdnyQmcsqjP+QmKbkle8cO0oUJtexoAuk3ydp+uN75rJR
   ZllbSt0ffT0ruDqez3DycTTB+1llwu38V9pja6Bcj3HaCtCvuJaLsHq2w
   Gp+4d7pPQJaBTICspY63+/HQ1D5yI1AhAx/tDZgIUY5/t0ezkH3CjJK2+
   ma6U6V7StO/sAoRCJr+sH6ZX+/hKKEt32Ju+qIUZLtbmIKeJry59tG+w9
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10414"; a="269979658"
X-IronPort-AV: E=Sophos;i="5.92,288,1650956400"; 
   d="scan'208";a="269979658"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2022 21:52:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,288,1650956400"; 
   d="scan'208";a="844285739"
Received: from lkp-server01.sh.intel.com (HELO 7dfbdc7c7900) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 20 Jul 2022 21:52:34 -0700
Received: from kbuild by 7dfbdc7c7900 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1oEOAs-0001TK-9G;
        Thu, 21 Jul 2022 04:52:34 +0000
Date:   Thu, 21 Jul 2022 12:52:24 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 949506dc608f9820e0cee51b106c35fd3503bbb2
Message-ID: <62d8db88.Cu6OrFitbtx4+Qmb%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 949506dc608f9820e0cee51b106c35fd3503bbb2  gpio: gpio-mm: Implement and utilize register structures

elapsed time: 730m

configs tested: 104
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
xtensa                  audio_kc705_defconfig
powerpc                    adder875_defconfig
m68k                        m5272c3_defconfig
mips                         bigsur_defconfig
csky                              allnoconfig
um                             i386_defconfig
mips                           ci20_defconfig
arm                          lpd270_defconfig
arm                      integrator_defconfig
arm                        mvebu_v7_defconfig
m68k                           virt_defconfig
sh                           se7206_defconfig
sh                             shx3_defconfig
sh                                  defconfig
powerpc                        cell_defconfig
nios2                               defconfig
openrisc                 simple_smp_defconfig
arm                            hisi_defconfig
sh                           se7724_defconfig
arm                       aspeed_g5_defconfig
arm                            zeus_defconfig
powerpc                     tqm8548_defconfig
sh                   secureedge5410_defconfig
m68k                        mvme147_defconfig
nios2                         10m50_defconfig
xtensa                              defconfig
m68k                            mac_defconfig
arm                           viper_defconfig
powerpc                      ep88xc_defconfig
powerpc                      pcm030_defconfig
alpha                            allyesconfig
ia64                         bigsur_defconfig
arm                          exynos_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
loongarch                           defconfig
loongarch                         allnoconfig
ia64                             allmodconfig
alpha                             allnoconfig
arc                               allnoconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
i386                             allyesconfig
i386                                defconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
x86_64               randconfig-a012-20220718
x86_64               randconfig-a011-20220718
x86_64               randconfig-a014-20220718
x86_64               randconfig-a016-20220718
x86_64               randconfig-a013-20220718
x86_64               randconfig-a015-20220718
i386                 randconfig-a015-20220718
i386                 randconfig-a011-20220718
i386                 randconfig-a012-20220718
i386                 randconfig-a014-20220718
i386                 randconfig-a016-20220718
i386                 randconfig-a013-20220718
i386                          randconfig-a012
i386                          randconfig-a016
s390                 randconfig-r044-20220718
riscv                randconfig-r042-20220718
arc                  randconfig-r043-20220718
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit

clang tested configs:
arm                      tct_hammer_defconfig
mips                           ip28_defconfig
powerpc                 mpc8315_rdb_defconfig
powerpc                 mpc832x_mds_defconfig
powerpc                    gamecube_defconfig
mips                          ath25_defconfig
powerpc                      acadia_defconfig
x86_64                        randconfig-k001
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
i386                 randconfig-a001-20220718
i386                 randconfig-a006-20220718
i386                 randconfig-a002-20220718
i386                 randconfig-a004-20220718
i386                 randconfig-a005-20220718
i386                 randconfig-a003-20220718
hexagon              randconfig-r045-20220718
hexagon              randconfig-r041-20220718

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
