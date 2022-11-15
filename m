Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77E1F62911F
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Nov 2022 05:12:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229872AbiKOEMD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Nov 2022 23:12:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231954AbiKOEL7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Nov 2022 23:11:59 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D383B1B9C8
        for <linux-gpio@vger.kernel.org>; Mon, 14 Nov 2022 20:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668485516; x=1700021516;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=G3fjd8i/3XbCbz8idm+1T17jPD8uy9oXTEBayu3l2/8=;
  b=Isr0q6LPKNftBpKtnJk5R/4zFXTwzKmBplOIGT/Bz14jzddOt7v26L0T
   d0EBlXhWbrJ2/qEsDz7tKHVcy9ztPD5GLcc5XTNXM9+VZxq0xTylo5qDO
   IUCZkfzOG+gUBCidV2ZspRVy9uPZWW/dU0Cfrar/oCPJSoez+wm8snfto
   5HU91tXoBwW6ah79/qIzBiSG9D8SqvOr9bThthhDXzZO+rTzYtbbJSoqE
   zEW4pilVcTrpKaIW8pn/64zgjzEH9mOYf116n0AmAcrm15MC3MnJi+kmP
   1Ho+hglAcV1stg3FZaZEjJj+DLyiiN2zSjugCQnqpNXf6CohJ5U7v8VtW
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="292551808"
X-IronPort-AV: E=Sophos;i="5.96,164,1665471600"; 
   d="scan'208";a="292551808"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2022 20:11:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="781193469"
X-IronPort-AV: E=Sophos;i="5.96,164,1665471600"; 
   d="scan'208";a="781193469"
Received: from lkp-server01.sh.intel.com (HELO ebd99836cbe0) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 14 Nov 2022 20:11:54 -0800
Received: from kbuild by ebd99836cbe0 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1ounIf-00011y-3B;
        Tue, 15 Nov 2022 04:11:53 +0000
Date:   Tue, 15 Nov 2022 12:11:41 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD REGRESSION
 43f71206fa12976e422919b8a54ff797c8aeeeb4
Message-ID: <6373117d.T1PqNhGcy15gMcps%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 43f71206fa12976e422919b8a54ff797c8aeeeb4  Merge branch 'devel' into for-next

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202211150935.KfTmjWeC-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

ERROR: modpost: "debounce_time_mt2701" [drivers/pinctrl/mediatek/pinctrl-mt6779.ko] undefined!
ERROR: modpost: "debounce_time_mt6765" [drivers/pinctrl/mediatek/pinctrl-mt6765.ko] undefined!

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
`-- powerpc-allmodconfig
    |-- ERROR:debounce_time_mt2701-drivers-pinctrl-mediatek-pinctrl-mt6779.ko-undefined
    `-- ERROR:debounce_time_mt6765-drivers-pinctrl-mediatek-pinctrl-mt6765.ko-undefined

elapsed time: 720m

configs tested: 76
configs skipped: 2

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
powerpc                           allnoconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
s390                                defconfig
sh                               allmodconfig
mips                             allyesconfig
powerpc                          allmodconfig
arc                  randconfig-r043-20221114
s390                             allyesconfig
alpha                            allyesconfig
arc                              allyesconfig
i386                                defconfig
m68k                             allmodconfig
x86_64                              defconfig
m68k                             allyesconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
i386                             allyesconfig
x86_64               randconfig-a002-20221114
x86_64               randconfig-a001-20221114
x86_64               randconfig-a004-20221114
x86_64               randconfig-a003-20221114
x86_64                           rhel-8.3-kvm
x86_64               randconfig-a006-20221114
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-syz
x86_64               randconfig-a005-20221114
x86_64                        randconfig-a013
x86_64                        randconfig-a011
i386                 randconfig-a001-20221114
i386                 randconfig-a004-20221114
i386                 randconfig-a002-20221114
i386                 randconfig-a005-20221114
i386                 randconfig-a003-20221114
i386                 randconfig-a006-20221114
x86_64                        randconfig-a015
x86_64                            allnoconfig
arm                          pxa3xx_defconfig
m68k                       m5475evb_defconfig
sh                            hp6xx_defconfig
mips                  decstation_64_defconfig
powerpc                    sam440ep_defconfig
sparc64                          alldefconfig
ia64                             allmodconfig
arm                                 defconfig
i386                 randconfig-c001-20221114
sparc64                             defconfig
ia64                         bigsur_defconfig
ia64                             allyesconfig
arm                              allyesconfig
arm64                            allyesconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func

clang tested configs:
hexagon              randconfig-r041-20221114
riscv                randconfig-r042-20221114
s390                 randconfig-r044-20221114
hexagon              randconfig-r045-20221114
x86_64                        randconfig-a012
x86_64                        randconfig-a016
x86_64                        randconfig-a014
i386                 randconfig-a011-20221114
i386                 randconfig-a014-20221114
i386                 randconfig-a013-20221114
i386                 randconfig-a012-20221114
i386                 randconfig-a015-20221114
i386                 randconfig-a016-20221114
x86_64               randconfig-k001-20221114
hexagon              randconfig-r041-20221115
hexagon              randconfig-r045-20221115
arm                        magician_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
