Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52E7D55B21F
	for <lists+linux-gpio@lfdr.de>; Sun, 26 Jun 2022 15:20:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234511AbiFZNEb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 26 Jun 2022 09:04:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234583AbiFZNE3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 26 Jun 2022 09:04:29 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8DD412092
        for <linux-gpio@vger.kernel.org>; Sun, 26 Jun 2022 06:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656248655; x=1687784655;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=DcAYlTY7cV0NDtckWHOhVlACOysRPYdRTkOufoiswzU=;
  b=S1aL5wEZSMavhKVLtqVHFcB649BztOVrDLYE/D666krxK6lOGDa1TmI6
   movlrFgPjZYmFBahFNmyVRZ6gR9foeKMjOh5Zh81dL3VtZULxnxlIg9zA
   FwcrkhobySlH1TXtTntnDowhiT0r0abh9pqoiCUEmkSFm+3Wv/XH8XtJf
   eNrBPHL7EApeAqxnXDern8z27EjEa0al1EbZoBqvHXl/0VA4k2wftgenY
   CkzmMlppxcu0pPgI0lhKNAyeG0khQmiDZzyWNg8+VGytP38aTUb9o+rcs
   BIRvB7g1e8QxGqV/Wa7fOHPST07mRbPuKpjdU4Qr2n2GBbsYeiSR2/QfX
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10389"; a="306747946"
X-IronPort-AV: E=Sophos;i="5.92,224,1650956400"; 
   d="scan'208";a="306747946"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2022 06:04:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,224,1650956400"; 
   d="scan'208";a="539796137"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 26 Jun 2022 06:04:13 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1o5Rvw-0007IJ-GR;
        Sun, 26 Jun 2022 13:04:12 +0000
Date:   Sun, 26 Jun 2022 21:03:32 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS WITH WARNING
 2e0a5241577c8893757d4e86f38f26848c0ec4d0
Message-ID: <62b85924.ZqOkq1L6vHKT8dpT%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 2e0a5241577c8893757d4e86f38f26848c0ec4d0  pinctrl: mediatek: fix the pinconf definition of some GPIO pins

Warning: (recently discovered and may have been fixed)

drivers/pinctrl/mediatek/pinctrl-mt8192.c:1302:56: warning: "/*" within comment [-Wcomment]
drivers/pinctrl/mediatek/pinctrl-mt8192.c:1362:56: warning: "/*" within comment [-Wcomment]

Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   `-- drivers-pinctrl-mediatek-pinctrl-mt8192.c:warning:within-comment
|-- arc-allyesconfig
|   `-- drivers-pinctrl-mediatek-pinctrl-mt8192.c:warning:within-comment
|-- arm-allyesconfig
|   `-- drivers-pinctrl-mediatek-pinctrl-mt8192.c:warning:within-comment
|-- arm64-allyesconfig
|   `-- drivers-pinctrl-mediatek-pinctrl-mt8192.c:warning:within-comment
|-- csky-randconfig-r013-20220626
|   `-- drivers-pinctrl-mediatek-pinctrl-mt8192.c:warning:within-comment
|-- ia64-allmodconfig
|   `-- drivers-pinctrl-mediatek-pinctrl-mt8192.c:warning:within-comment
|-- m68k-allmodconfig
|   `-- drivers-pinctrl-mediatek-pinctrl-mt8192.c:warning:within-comment
|-- m68k-allyesconfig
|   `-- drivers-pinctrl-mediatek-pinctrl-mt8192.c:warning:within-comment
|-- mips-allyesconfig
|   `-- drivers-pinctrl-mediatek-pinctrl-mt8192.c:warning:within-comment
|-- powerpc-allmodconfig
|   `-- drivers-pinctrl-mediatek-pinctrl-mt8192.c:warning:within-comment
`-- sh-allmodconfig
    `-- drivers-pinctrl-mediatek-pinctrl-mt8192.c:warning:within-comment

elapsed time: 788m

configs tested: 52
configs skipped: 2

gcc tested configs:
arm                                 defconfig
arm                              allyesconfig
arm64                            allyesconfig
ia64                             allmodconfig
mips                             allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
sh                               allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
i386                                defconfig
i386                             allyesconfig
i386                          randconfig-a005
i386                          randconfig-a001
i386                          randconfig-a003
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
x86_64                        randconfig-a015
x86_64                        randconfig-a013
x86_64                        randconfig-a011
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
arc                  randconfig-r043-20220626
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-syz

clang tested configs:
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
hexagon              randconfig-r045-20220626
hexagon              randconfig-r041-20220626
riscv                randconfig-r042-20220626
s390                 randconfig-r044-20220626

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
