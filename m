Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D856641952
	for <lists+linux-gpio@lfdr.de>; Sat,  3 Dec 2022 23:03:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229450AbiLCWC7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 3 Dec 2022 17:02:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbiLCWC5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 3 Dec 2022 17:02:57 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DB68AE74
        for <linux-gpio@vger.kernel.org>; Sat,  3 Dec 2022 14:02:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670104976; x=1701640976;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=qjwzL2YxENwY+wm5/qV6sGeYYSYrvjCGik8l+kQyqBQ=;
  b=kb+l7/11UKoeNir57GDL+CeE6byGfRDimEpLCeivimIp1qfeOAPS79Hr
   ZMvfkg/LCZyDZ3KjXEVEuQ1HQXCzTGcVPRGjMdMknK8IdQppOgALCgKIL
   +WVQihxTorD1LaSI450dS+VEAGLY5HmnpmLWDk+zxqPIbGDwVg1eIeu4g
   5o85SIQA7EKwJA3X5psLKfdFkc0FLOYloZD/HjSMcQTr1IGWFZNL4MI3W
   2lA67echtOOu0u3Q8sBDv5Wvhzrts7FdW4LAX3s+A7iqNkgkoqeN0BEdE
   KqakKYcUpcf4va2I5sY++lAIm5NKiWgCD2sk2kHaJPnuyweAr4GQDILAn
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10550"; a="303762027"
X-IronPort-AV: E=Sophos;i="5.96,216,1665471600"; 
   d="scan'208";a="303762027"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2022 14:02:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10550"; a="647533565"
X-IronPort-AV: E=Sophos;i="5.96,216,1665471600"; 
   d="scan'208";a="647533565"
Received: from lkp-server01.sh.intel.com (HELO 4d912534d779) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 03 Dec 2022 14:02:53 -0800
Received: from kbuild by 4d912534d779 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1p1aaz-0000Nd-0z;
        Sat, 03 Dec 2022 22:02:53 +0000
Date:   Sun, 04 Dec 2022 06:01:54 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 80b99ed74e234e82298531c459c29343d0a8bcf2
Message-ID: <638bc752.DX7tiLrxSgKNikrs%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 80b99ed74e234e82298531c459c29343d0a8bcf2  dt-bindings: pinctrl: st,stm32: Deprecate pins-are-numbered

elapsed time: 722m

configs tested: 59
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                        randconfig-a013
powerpc                           allnoconfig
x86_64                        randconfig-a011
x86_64                        randconfig-a015
arc                                 defconfig
alpha                               defconfig
s390                             allmodconfig
um                             i386_defconfig
x86_64                        randconfig-a002
um                           x86_64_defconfig
s390                                defconfig
x86_64                               rhel-8.3
x86_64                        randconfig-a006
x86_64                              defconfig
sh                               allmodconfig
x86_64                        randconfig-a004
mips                             allyesconfig
x86_64                    rhel-8.3-kselftests
powerpc                          allmodconfig
s390                             allyesconfig
x86_64                          rhel-8.3-func
ia64                             allmodconfig
i386                                defconfig
arc                  randconfig-r043-20221201
x86_64                           allyesconfig
arm                                 defconfig
s390                 randconfig-r044-20221201
i386                          randconfig-a014
m68k                             allmodconfig
i386                          randconfig-a012
riscv                randconfig-r042-20221201
alpha                            allyesconfig
m68k                             allyesconfig
arc                              allyesconfig
i386                          randconfig-a016
i386                             allyesconfig
arm64                            allyesconfig
arm                              allyesconfig
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                            allnoconfig

clang tested configs:
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64                        randconfig-a012
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
hexagon              randconfig-r045-20221201
hexagon              randconfig-r041-20221201
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
