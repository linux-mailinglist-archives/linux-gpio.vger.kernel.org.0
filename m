Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF5DA5F50B4
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Oct 2022 10:18:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229462AbiJEISY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 5 Oct 2022 04:18:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbiJEISX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 5 Oct 2022 04:18:23 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 997976B664
        for <linux-gpio@vger.kernel.org>; Wed,  5 Oct 2022 01:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664957902; x=1696493902;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=dTXGmUP53OIVwsZFWMnvoQf0KiLDlEBDlU5dLoN/LrM=;
  b=K8AA1fjyRESD0fGK3zE2T3D9Rt0riA8s7GYBENw6L6Ny4pOguEs6Z/yE
   ZzRX1W8GCqetLJFKz0VA7v5LtUdKyeeOQTe/OPC7WAwq13i1fGdZolddh
   Vmz5NJCyll2xszos5Ld7q+VU9/H95h3C0nxuBxu4rYp86If1vRHWjEolH
   TQX5I0ZBF6ENgnZDkYQhnJVDgVCHQ+Id8TVyCf/EG5S2USozD8H9/zHAG
   MWYRdI3QDmtd8jkgY1W4S3HL5XsYAbFqqORxNYrrvnOcXWI9H5a8bmwOF
   TJn3RFjrW97dzfsgRQ/KGMGRKkUJcd5j8XHsUWU9OOBxJ58G8JQ6C2MKW
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10490"; a="304676590"
X-IronPort-AV: E=Sophos;i="5.95,159,1661842800"; 
   d="scan'208";a="304676590"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2022 01:18:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10490"; a="657437781"
X-IronPort-AV: E=Sophos;i="5.95,159,1661842800"; 
   d="scan'208";a="657437781"
Received: from lkp-server01.sh.intel.com (HELO d4f44333118a) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 05 Oct 2022 01:18:03 -0700
Received: from kbuild by d4f44333118a with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1ofzbO-00015X-20;
        Wed, 05 Oct 2022 08:18:02 +0000
Date:   Wed, 05 Oct 2022 16:17:04 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 ba99b756da178aa8c608c4499a91074466050c10
Message-ID: <633d3d80.27BfqfxRb0L/P9Su%lkp@intel.com>
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
branch HEAD: ba99b756da178aa8c608c4499a91074466050c10  pinctrl: starfive: Rename "pinctrl-starfive" to "pinctrl-starfive-jh7100"

elapsed time: 726m

configs tested: 101
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
um                             i386_defconfig
um                           x86_64_defconfig
s390                                defconfig
arc                                 defconfig
m68k                             allyesconfig
arm64                            allyesconfig
alpha                               defconfig
i386                 randconfig-a016-20221003
x86_64                              defconfig
x86_64                          rhel-8.3-func
riscv                randconfig-r042-20221003
arm                              allyesconfig
x86_64               randconfig-a011-20221003
x86_64                    rhel-8.3-kselftests
powerpc                          allmodconfig
x86_64                               rhel-8.3
s390                 randconfig-r044-20221003
x86_64               randconfig-a012-20221003
i386                                defconfig
mips                             allyesconfig
x86_64               randconfig-a013-20221003
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
sh                               allmodconfig
x86_64                           rhel-8.3-kvm
x86_64                           allyesconfig
arc                               allnoconfig
arm                       imx_v6_v7_defconfig
mips                            ar7_defconfig
x86_64               randconfig-a015-20221003
powerpc                           allnoconfig
i386                 randconfig-a014-20221003
m68k                                defconfig
alpha                             allnoconfig
sh                             shx3_defconfig
i386                 randconfig-a011-20221003
riscv                             allnoconfig
i386                 randconfig-a012-20221003
i386                 randconfig-a013-20221003
csky                              allnoconfig
x86_64               randconfig-a014-20221003
i386                 randconfig-a015-20221003
x86_64               randconfig-a016-20221003
arc                  randconfig-r043-20221003
s390                             allmodconfig
arm                      jornada720_defconfig
arc                  randconfig-r043-20221002
riscv                               defconfig
i386                             allyesconfig
s390                             allyesconfig
i386                          randconfig-c001
alpha                            allyesconfig
arc                              allyesconfig
m68k                             allmodconfig
powerpc                 mpc834x_itx_defconfig
arc                        nsim_700_defconfig
sh                          lboxre2_defconfig
sparc                               defconfig
sh                            titan_defconfig
mips                          rb532_defconfig
sh                         ap325rxa_defconfig
sh                           se7751_defconfig
riscv                            allmodconfig
arm                         cm_x300_defconfig
ia64                             allmodconfig
nios2                            alldefconfig
loongarch                 loongson3_defconfig
mips                            gpr_defconfig
sh                        sh7763rdp_defconfig
riscv                            allyesconfig
parisc                           allyesconfig
arm                            pleb_defconfig
arc                          axs101_defconfig
powerpc                 linkstation_defconfig
sparc64                             defconfig
sh                   sh7770_generic_defconfig

clang tested configs:
i386                 randconfig-a006-20221003
x86_64               randconfig-a005-20221003
x86_64               randconfig-a006-20221003
hexagon              randconfig-r045-20221003
arm                        neponset_defconfig
i386                 randconfig-a003-20221003
riscv                randconfig-r042-20221002
i386                 randconfig-a002-20221003
hexagon              randconfig-r041-20221002
i386                 randconfig-a001-20221003
i386                 randconfig-a004-20221003
hexagon              randconfig-r045-20221002
i386                 randconfig-a005-20221003
x86_64               randconfig-a001-20221003
x86_64               randconfig-a003-20221003
x86_64               randconfig-a002-20221003
hexagon              randconfig-r041-20221003
x86_64               randconfig-a004-20221003
s390                 randconfig-r044-20221002
arm                         s3c2410_defconfig
powerpc                   bluestone_defconfig
powerpc                     ksi8560_defconfig
mips                     loongson1c_defconfig
powerpc                 mpc8272_ads_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
