Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C8EF658E10
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Dec 2022 15:51:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233537AbiL2Ovt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Dec 2022 09:51:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233619AbiL2Ov0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Dec 2022 09:51:26 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0857913F79
        for <linux-gpio@vger.kernel.org>; Thu, 29 Dec 2022 06:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672325474; x=1703861474;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=oiTuIkUoMk33KrT2xqmClpoebWcbt9U5KHiPipbiMG0=;
  b=MzIwXOjQrImYlDJN5tq92Oj7xc6q6dtdAzJpx3xHmbmToM1Kh1JsewIE
   N/LnixZvvWWZmvcS+JMWQE989QRFPWrlgX6EygdT9eRLAEsd0oaj1aNWZ
   zcIyI/tgyb7IYQaaUzkAgawqmoCI0rkQ4KBbHfWnGiWL8hVXT1exex+tY
   yV15+m0L8eiSssru/3UiqqDgJEkFt6aqiV5FtRzGd/xvqnIqmjN6O/Xwh
   dKEE8fGGbu1CopGYIW5mXU7ddcCehsQI3CssG7Kdh5rqTXpsQwCErDjG0
   yLRgwIiLnIIDs1gSkr+QBtkT6epTN2evVfhHIJu1kBjREglQIcbTBLIy9
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10575"; a="323037626"
X-IronPort-AV: E=Sophos;i="5.96,284,1665471600"; 
   d="scan'208";a="323037626"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2022 06:51:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10575"; a="716936591"
X-IronPort-AV: E=Sophos;i="5.96,284,1665471600"; 
   d="scan'208";a="716936591"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 29 Dec 2022 06:51:11 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pAuFT-000GkT-0F;
        Thu, 29 Dec 2022 14:51:11 +0000
Date:   Thu, 29 Dec 2022 22:50:26 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 51a8f99718573b543197871a652b338c454806cd
Message-ID: <63ada932.xDvhnRd7EvtLOQ/g%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 51a8f99718573b543197871a652b338c454806cd  pinctrl: qcom: Add QDU1000/QRU1000 pinctrl driver

elapsed time: 726m

configs tested: 78
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
arm                                 defconfig
s390                             allyesconfig
x86_64                              defconfig
i386                                defconfig
arm64                            allyesconfig
um                             i386_defconfig
um                           x86_64_defconfig
arm                              allyesconfig
x86_64               randconfig-a012-20221226
x86_64               randconfig-a014-20221226
sh                               allmodconfig
x86_64                           rhel-8.3-bpf
x86_64               randconfig-a013-20221226
x86_64                               rhel-8.3
x86_64               randconfig-a011-20221226
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64               randconfig-a015-20221226
x86_64                           rhel-8.3-kvm
x86_64               randconfig-a016-20221226
x86_64                           allyesconfig
arc                  randconfig-r043-20221227
arm                  randconfig-r046-20221227
arc                  randconfig-r043-20221226
riscv                randconfig-r042-20221226
s390                 randconfig-r044-20221226
i386                             allyesconfig
mips                             allyesconfig
i386                 randconfig-a011-20221226
i386                 randconfig-a013-20221226
x86_64                            allnoconfig
i386                 randconfig-a014-20221226
i386                 randconfig-a012-20221226
i386                 randconfig-a015-20221226
i386                 randconfig-a016-20221226
powerpc                          allmodconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
i386                             alldefconfig
powerpc                         wii_defconfig
arm                        keystone_defconfig
sh                          rsk7201_defconfig
sh                     sh7710voipgw_defconfig
m68k                        m5307c3_defconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
arm                             pxa_defconfig
m68k                        m5407c3_defconfig
sh                        dreamcast_defconfig
nios2                         3c120_defconfig
i386                          randconfig-c001

clang tested configs:
x86_64                          rhel-8.3-rust
x86_64               randconfig-a002-20221226
x86_64               randconfig-a003-20221226
x86_64               randconfig-a001-20221226
x86_64               randconfig-a004-20221226
x86_64               randconfig-a005-20221226
x86_64               randconfig-a006-20221226
hexagon              randconfig-r041-20221227
hexagon              randconfig-r041-20221226
arm                  randconfig-r046-20221226
hexagon              randconfig-r045-20221226
hexagon              randconfig-r045-20221227
riscv                randconfig-r042-20221227
s390                 randconfig-r044-20221227
i386                 randconfig-a003-20221226
i386                 randconfig-a001-20221226
i386                 randconfig-a005-20221226
i386                 randconfig-a004-20221226
i386                 randconfig-a006-20221226
i386                 randconfig-a002-20221226

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
