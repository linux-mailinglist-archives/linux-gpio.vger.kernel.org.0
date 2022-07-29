Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43DC35849AB
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Jul 2022 04:17:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232706AbiG2CRK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Jul 2022 22:17:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbiG2CRJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Jul 2022 22:17:09 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E754E3DBEE
        for <linux-gpio@vger.kernel.org>; Thu, 28 Jul 2022 19:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659061028; x=1690597028;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=z2sIfy/J0j9EnY1uQBOXU0RRLr83o6Nr01wXm/Lom4Y=;
  b=bWt6SrfSG+hJQJCyTlhyHNOTTxODnHMAYu5opne7MaO5vDoA/jeBM3XI
   K22dUWNGwnG4A77ZGEPAHCLBoc1W+Vq0OPhm5erhADK1TafC9LIl3jw+H
   i6tcClVtg1nsv3qMk1hC7khGLDnbRLyhHERKzyXPp6I9wJZM8Z7PfH7FU
   RGFDcGcSqdykTIWh2u/aGU3V4sZmRd9b1vP6eq1eBVoxq487MXwq4NoEF
   vl4WUOz7xZafJYEee0vc+1lMrvonZrFVrJjmU0sx6subgeXnSTOarvOuk
   O0IUa2pBz7VrGyChnPlkmzFNGdyVaVbRRmkH8Z9E1uZmJ00IVjpY8YGH/
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10422"; a="271710728"
X-IronPort-AV: E=Sophos;i="5.93,200,1654585200"; 
   d="scan'208";a="271710728"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2022 19:17:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,200,1654585200"; 
   d="scan'208";a="690581454"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 28 Jul 2022 19:17:07 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oHFYo-000AuG-1w;
        Fri, 29 Jul 2022 02:17:06 +0000
Date:   Fri, 29 Jul 2022 10:16:08 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 c4f0d16daa6d1c5d862d063379c03310387095d5
Message-ID: <62e342e8.lnLNs0jR6/qGsHJw%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: c4f0d16daa6d1c5d862d063379c03310387095d5  dt-bindings: gpio: fsl-imx-gpio: Add i.MXRT compatibles

elapsed time: 721m

configs tested: 53
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
i386                          randconfig-a001
i386                          randconfig-a003
powerpc                           allnoconfig
i386                                defconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a011
i386                          randconfig-a005
x86_64                        randconfig-a002
i386                             allyesconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a015
sh                               allmodconfig
mips                             allyesconfig
powerpc                          allmodconfig
i386                          randconfig-a014
x86_64                        randconfig-a004
i386                          randconfig-a012
arm                                 defconfig
i386                          randconfig-a016
x86_64                           rhel-8.3-kvm
x86_64                    rhel-8.3-kselftests
arm                              allyesconfig
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
arm64                            allyesconfig
arc                  randconfig-r043-20220728
x86_64                           rhel-8.3-syz
riscv                randconfig-r042-20220728
s390                 randconfig-r044-20220728
ia64                             allmodconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig

clang tested configs:
i386                          randconfig-a002
i386                          randconfig-a004
x86_64                        randconfig-a014
x86_64                        randconfig-a005
x86_64                        randconfig-a001
i386                          randconfig-a006
x86_64                        randconfig-a012
i386                          randconfig-a013
i386                          randconfig-a015
x86_64                        randconfig-a016
x86_64                        randconfig-a003
i386                          randconfig-a011
hexagon              randconfig-r045-20220728
hexagon              randconfig-r041-20220728

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
