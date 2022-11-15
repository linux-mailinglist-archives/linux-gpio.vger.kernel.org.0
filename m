Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D37362A3EF
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Nov 2022 22:21:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238755AbiKOVV0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Nov 2022 16:21:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238760AbiKOVVE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Nov 2022 16:21:04 -0500
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFC9831DE2
        for <linux-gpio@vger.kernel.org>; Tue, 15 Nov 2022 13:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668547220; x=1700083220;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=JLdcwhhPbiznIPgsAJAAQj+Aurkkp1+j8cya2u+sjnA=;
  b=IodsVRwN9FHH9n/v0uornwwrmblqPOpIed0SMICJLiHGoqn0k5z+6JQj
   uyheQH5ZX8hr4ELu1sFoTdOiWAuLGJyb/PbQreMdGrNeSfsRoYQNoFUHE
   X9OuUPCq1QxcJn7rR6jfg2F9xRpCTTu9Al6Ym3Lw7jGUnuC37BZCNCgMO
   AtYXh10JLi4oLD28MAFbXNi1+8NnIfQ4O2X4Mjv5aCutn78VPe7bJ6W+v
   IbGMlKSSjXccwAWArMHkB7UiyXDuu8ZCr2DYzIcLiX593Ag129GbIRUFr
   ZPxApoVJmj5MktKfyoaWCXHW/+6BdyytJQ2p4612NzcVHwgexS5WjnkHT
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="376641157"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; 
   d="scan'208";a="376641157"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2022 13:20:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="589935848"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; 
   d="scan'208";a="589935848"
Received: from lkp-server01.sh.intel.com (HELO ebd99836cbe0) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 15 Nov 2022 13:20:19 -0800
Received: from kbuild by ebd99836cbe0 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1ov3Lu-0001fW-1l;
        Tue, 15 Nov 2022 21:20:18 +0000
Date:   Wed, 16 Nov 2022 05:19:48 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:fixes] BUILD SUCCESS
 2e35b25dd8e666b8619355fc3defb1b246a5dc02
Message-ID: <63740274.cpDGq8awzN7uUm9+%lkp@intel.com>
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
branch HEAD: 2e35b25dd8e666b8619355fc3defb1b246a5dc02  pinctrl: mediatek: Export debounce time tables

elapsed time: 720m

configs tested: 67
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
i386                                defconfig
x86_64                          rhel-8.3-func
arc                                 defconfig
x86_64                    rhel-8.3-kselftests
alpha                               defconfig
s390                                defconfig
s390                             allmodconfig
powerpc                          allmodconfig
x86_64               randconfig-a002-20221114
x86_64                        randconfig-a013
i386                 randconfig-a001-20221114
mips                             allyesconfig
x86_64               randconfig-a001-20221114
x86_64                               rhel-8.3
i386                 randconfig-a004-20221114
x86_64                        randconfig-a011
x86_64                              defconfig
x86_64                         rhel-8.3-kunit
powerpc                           allnoconfig
i386                 randconfig-a002-20221114
x86_64                           rhel-8.3-kvm
i386                 randconfig-a005-20221114
x86_64               randconfig-a004-20221114
x86_64                           rhel-8.3-syz
ia64                             allmodconfig
x86_64                        randconfig-a015
x86_64               randconfig-a005-20221114
i386                 randconfig-a006-20221114
sh                               allmodconfig
x86_64               randconfig-a003-20221114
i386                 randconfig-a003-20221114
s390                             allyesconfig
arc                  randconfig-r043-20221114
x86_64               randconfig-a006-20221114
alpha                            allyesconfig
i386                             allyesconfig
arc                              allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
arm                                 defconfig
x86_64                           allyesconfig
arm64                            allyesconfig
arm                              allyesconfig
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
x86_64                            allnoconfig

clang tested configs:
x86_64                        randconfig-a012
x86_64                        randconfig-a014
hexagon              randconfig-r041-20221114
x86_64                        randconfig-a016
riscv                randconfig-r042-20221114
hexagon              randconfig-r045-20221114
s390                 randconfig-r044-20221114
i386                 randconfig-a011-20221114
i386                 randconfig-a014-20221114
i386                 randconfig-a016-20221114
i386                 randconfig-a013-20221114
i386                 randconfig-a012-20221114
i386                 randconfig-a015-20221114
hexagon              randconfig-r041-20221115
hexagon              randconfig-r045-20221115
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
