Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B5D662911E
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Nov 2022 05:12:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229774AbiKOEMC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Nov 2022 23:12:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231835AbiKOEL4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Nov 2022 23:11:56 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3A021BEBA
        for <linux-gpio@vger.kernel.org>; Mon, 14 Nov 2022 20:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668485515; x=1700021515;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=vDG/Imb58Uo4b/ywBwjGBIaVIElC8h0xiwLcLbtrxLI=;
  b=e4o/7AfSHMEOzaY9RcnsN9xaG+Mkz0q8iQmwUFQbmO6uOsVcmYHJBvDN
   E6c8WzsD1QRzMwMbwbzUJz4Ehagbyde3rHSQzcdC9EbNb4C8OloiT5QFR
   5qRH+gULyeFWjYSSdTndQzeF+BDwoflTroqs2iiR11eiBxIMFlBzUkqZT
   VCw5+cA7Am5H+mifCDMHr07FuvsuPQij6Fv6wOfRJ8VvTrWcV7aoPKyuw
   Q8Vf4Ih0alBQHLTt26uFc0gQWI3mpX2ADGUIX6kRcx7mPXrh9c9pnNWey
   s1PUxGtQYD6rioYfYZ/1CBWL+Gcn8rtv/CzDNVoym+AXF3Q3e/c1XymJe
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="292551806"
X-IronPort-AV: E=Sophos;i="5.96,164,1665471600"; 
   d="scan'208";a="292551806"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2022 20:11:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="744422813"
X-IronPort-AV: E=Sophos;i="5.96,164,1665471600"; 
   d="scan'208";a="744422813"
Received: from lkp-server01.sh.intel.com (HELO ebd99836cbe0) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 14 Nov 2022 20:11:54 -0800
Received: from kbuild by ebd99836cbe0 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1ounIf-00011l-2i;
        Tue, 15 Nov 2022 04:11:53 +0000
Date:   Tue, 15 Nov 2022 12:11:34 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:fixes] BUILD SUCCESS
 e1ff91f9d2303cd4e706cc908bfca21cd17b9927
Message-ID: <63731176.W3inO/ErwQBZMym5%lkp@intel.com>
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
branch HEAD: e1ff91f9d2303cd4e706cc908bfca21cd17b9927  pinctrl: mediatek: Fix EINT pins input debounce time configuration

elapsed time: 721m

configs tested: 82
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
um                             i386_defconfig
um                           x86_64_defconfig
sh                               allmodconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                             allyesconfig
s390                                defconfig
powerpc                          allmodconfig
mips                             allyesconfig
arc                  randconfig-r043-20221114
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
alpha                            allyesconfig
arc                              allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64               randconfig-a002-20221114
x86_64               randconfig-a001-20221114
x86_64               randconfig-a004-20221114
x86_64                           allyesconfig
i386                                defconfig
x86_64               randconfig-a003-20221114
x86_64               randconfig-a005-20221114
x86_64               randconfig-a006-20221114
ia64                             allmodconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
i386                             allyesconfig
x86_64                            allnoconfig
arm                          pxa3xx_defconfig
m68k                       m5475evb_defconfig
sh                            hp6xx_defconfig
mips                  decstation_64_defconfig
powerpc                    sam440ep_defconfig
sparc64                          alldefconfig
arm                                 defconfig
i386                 randconfig-a002-20221114
i386                 randconfig-a004-20221114
i386                 randconfig-a003-20221114
i386                 randconfig-a005-20221114
i386                 randconfig-a006-20221114
i386                 randconfig-a001-20221114
i386                 randconfig-c001-20221114
sparc64                             defconfig
ia64                         bigsur_defconfig
ia64                             allyesconfig
arm                              allyesconfig
arm64                            allyesconfig
parisc                generic-32bit_defconfig
sh                     magicpanelr2_defconfig
mips                           gcw0_defconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func

clang tested configs:
hexagon              randconfig-r045-20221114
hexagon              randconfig-r041-20221114
riscv                randconfig-r042-20221114
s390                 randconfig-r044-20221114
x86_64               randconfig-a012-20221114
x86_64               randconfig-a016-20221114
x86_64               randconfig-a015-20221114
x86_64               randconfig-a013-20221114
x86_64               randconfig-a011-20221114
x86_64               randconfig-a014-20221114
x86_64               randconfig-k001-20221114
hexagon              randconfig-r041-20221115
hexagon              randconfig-r045-20221115
arm                        magician_defconfig
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                 randconfig-a015-20221114
i386                 randconfig-a013-20221114
i386                 randconfig-a011-20221114
i386                 randconfig-a016-20221114
i386                 randconfig-a012-20221114
i386                 randconfig-a014-20221114

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
