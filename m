Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 497EB5A952E
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Sep 2022 12:57:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234206AbiIAK5I (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Sep 2022 06:57:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232791AbiIAK4o (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Sep 2022 06:56:44 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D21395E6C
        for <linux-gpio@vger.kernel.org>; Thu,  1 Sep 2022 03:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662029798; x=1693565798;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=/55kXPH/35nW22yt6zS7LqpsCnMiRLTPZONNGq5j5Ks=;
  b=aXCke7bYZbB/HUDcLWm/5pBDCYgyBMI8yMABIY1aGDU5BRi71rMr4NiY
   b/V1gW3E8gacs4NZCXKLefxszznJq8VVD3J4ClQDHi5aOxJDAF0+g2Q3p
   4mAm4tPAKvbmvwwpTIPY/BsjjcjSYmVPh5V8cKVJgPkK75YvgVBQsi7Dn
   dDUHnAG5qClPSU1aXv+Qyu5DnHf+tKLpuXKeGU0cYBnm4Ieu9SE0WSsIz
   NiPnLUsgROY/mVCBZ5ZBVQF69ghLOMaFauiyr25UnCMN8DIerWiu+wpxg
   4Ehv6YQ/y7FTwwztK2iPfBwkzgrEFyNMO/SrQEAUcHQx19P+KRt5fcXNy
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10456"; a="275431283"
X-IronPort-AV: E=Sophos;i="5.93,280,1654585200"; 
   d="scan'208";a="275431283"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2022 03:56:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,280,1654585200"; 
   d="scan'208";a="701698550"
Received: from lkp-server02.sh.intel.com (HELO b138c9e8658c) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 01 Sep 2022 03:56:21 -0700
Received: from kbuild by b138c9e8658c with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oThrw-0000Bf-1u;
        Thu, 01 Sep 2022 10:56:20 +0000
Date:   Thu, 01 Sep 2022 18:56:10 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 0e056f414e5b1b797886a90e77f6576f121c2a09
Message-ID: <63108fca.MXICk+y7sjQw31CR%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 0e056f414e5b1b797886a90e77f6576f121c2a09  dt-bindings: gpio: stmpe: Remove node name requirement

elapsed time: 828m

configs tested: 53
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                  randconfig-r043-20220831
riscv                randconfig-r042-20220831
s390                 randconfig-r044-20220831
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
powerpc                          allmodconfig
mips                             allyesconfig
powerpc                           allnoconfig
m68k                             allyesconfig
m68k                             allmodconfig
alpha                            allyesconfig
arc                              allyesconfig
sh                               allmodconfig
x86_64                        randconfig-a002
x86_64                        randconfig-a013
i386                          randconfig-a001
i386                                defconfig
x86_64                        randconfig-a011
i386                          randconfig-a003
i386                          randconfig-a014
x86_64                        randconfig-a015
x86_64                        randconfig-a006
i386                          randconfig-a005
x86_64                        randconfig-a004
x86_64                           rhel-8.3-kvm
i386                          randconfig-a012
x86_64                    rhel-8.3-kselftests
i386                          randconfig-a016
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-syz
i386                             allyesconfig
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
ia64                             allmodconfig

clang tested configs:
hexagon              randconfig-r041-20220831
hexagon              randconfig-r045-20220831
i386                          randconfig-a013
x86_64                        randconfig-a005
x86_64                        randconfig-a016
x86_64                        randconfig-a012
i386                          randconfig-a015
i386                          randconfig-a002
x86_64                        randconfig-a001
x86_64                        randconfig-a014
x86_64                        randconfig-a003
i386                          randconfig-a011
i386                          randconfig-a006
i386                          randconfig-a004

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
