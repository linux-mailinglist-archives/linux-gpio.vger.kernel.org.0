Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F7A666D4E5
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Jan 2023 04:11:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235113AbjAQDLW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Jan 2023 22:11:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235228AbjAQDLU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Jan 2023 22:11:20 -0500
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 521D81CF7F
        for <linux-gpio@vger.kernel.org>; Mon, 16 Jan 2023 19:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673925080; x=1705461080;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=LwXPo7uT2EziMrnRl2THFKWevveWoRMjf9CrDtEauFw=;
  b=QLIpa/Oo1PrvgtaMoXTIxVLEHilhI3wjDn7F0idanVGnUbyX6QHDdYSY
   V36VgaBsaTObxhtxHzIRlP90P4NJYfkjeYAO4bPW5WrpyxzEhtTzk1TvS
   cApUZ2zlBgDpQUagUahu5o8MHjPLhmM8zg/Ezxd0kIQxcjMv48HraWTv0
   wr1pjYHNFJfRqFWaDdoj17YDeoYtsVeOe0emzr43wyyNQeCQlPjhS2unv
   TCSh2fOFfiAaPQrakEtCCePqo7FYBymHYThFJnInDfmsEkdMfgRKAVvVZ
   8os1tct845ZZ4xpUORCSEn/6NuqhCyz2DtCRUmIzLwy+hSbir503POjBQ
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="308161953"
X-IronPort-AV: E=Sophos;i="5.97,222,1669104000"; 
   d="scan'208";a="308161953"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2023 19:11:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="652419274"
X-IronPort-AV: E=Sophos;i="5.97,222,1669104000"; 
   d="scan'208";a="652419274"
Received: from lkp-server02.sh.intel.com (HELO f57cd993bc73) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 16 Jan 2023 19:10:54 -0800
Received: from kbuild by f57cd993bc73 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pHcNB-0000u8-1z;
        Tue, 17 Jan 2023 03:10:53 +0000
Date:   Tue, 17 Jan 2023 11:09:53 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 d20e767f7d62d11ce6609436ed95141bdb305660
Message-ID: <63c61181.VmzNjP4/x9VujNyF%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: d20e767f7d62d11ce6609436ed95141bdb305660  Merge branch 'devel' into for-next

elapsed time: 723m

configs tested: 123
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
x86_64                            allnoconfig
arc                  randconfig-r043-20230116
riscv                randconfig-r042-20230116
s390                 randconfig-r044-20230116
arm64                            allyesconfig
arm                              allyesconfig
x86_64               randconfig-a011-20230116
x86_64               randconfig-a016-20230116
x86_64               randconfig-a014-20230116
x86_64               randconfig-a013-20230116
x86_64               randconfig-a015-20230116
x86_64               randconfig-a012-20230116
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
x86_64                           rhel-8.3-bpf
x86_64                         rhel-8.3-kunit
ia64                             allmodconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
i386                             allyesconfig
i386                                defconfig
s390                                defconfig
s390                             allmodconfig
arc                                 defconfig
alpha                               defconfig
s390                             allyesconfig
i386                 randconfig-a013-20230116
i386                 randconfig-a012-20230116
i386                 randconfig-a016-20230116
i386                 randconfig-a014-20230116
i386                 randconfig-a015-20230116
i386                 randconfig-a011-20230116
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
mips                           jazz_defconfig
powerpc                      ep88xc_defconfig
powerpc                  storcenter_defconfig
arm                             ezx_defconfig
sh                        sh7785lcr_defconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
nios2                            allyesconfig
nios2                               defconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
mips                        bcm47xx_defconfig
mips                         bigsur_defconfig
powerpc                mpc7448_hpc2_defconfig
powerpc                       ppc64_defconfig
arm                         lpc18xx_defconfig
powerpc                 mpc834x_itx_defconfig
riscv                            allyesconfig
powerpc                       holly_defconfig
sparc                               defconfig
xtensa                           allyesconfig
csky                                defconfig
sparc                            allyesconfig
x86_64                                  kexec
powerpc                  iss476-smp_defconfig
sh                         apsh4a3a_defconfig
sh                                  defconfig
sh                 kfr2r09-romimage_defconfig
m68k                         apollo_defconfig
um                               alldefconfig
mips                         db1xxx_defconfig
powerpc                 mpc837x_rdb_defconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
arm                  randconfig-r046-20230117
arc                  randconfig-r043-20230117
i386                 randconfig-c001-20230116
sh                        sh7763rdp_defconfig
sh                         ap325rxa_defconfig
alpha                            alldefconfig
arc                         haps_hs_defconfig

clang tested configs:
arm                  randconfig-r046-20230116
hexagon              randconfig-r045-20230116
hexagon              randconfig-r041-20230116
x86_64               randconfig-a003-20230116
x86_64               randconfig-a004-20230116
x86_64               randconfig-a006-20230116
x86_64               randconfig-a005-20230116
x86_64               randconfig-a001-20230116
x86_64               randconfig-a002-20230116
i386                 randconfig-a002-20230116
i386                 randconfig-a004-20230116
i386                 randconfig-a001-20230116
i386                 randconfig-a003-20230116
i386                 randconfig-a005-20230116
i386                 randconfig-a006-20230116
arm                        vexpress_defconfig
powerpc                 mpc8315_rdb_defconfig
riscv                randconfig-r042-20230115
s390                 randconfig-r044-20230115
hexagon              randconfig-r041-20230115
hexagon              randconfig-r045-20230115
arm                          pxa168_defconfig
arm                     am200epdkit_defconfig
mips                           mtx1_defconfig
powerpc                     pseries_defconfig
x86_64                          rhel-8.3-rust
x86_64                        randconfig-k001
i386                              allnoconfig
powerpc                   lite5200b_defconfig
mips                  cavium_octeon_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
