Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1E2862B1F9
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Nov 2022 04:55:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230522AbiKPDzb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Nov 2022 22:55:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229637AbiKPDzb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Nov 2022 22:55:31 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52868DB9
        for <linux-gpio@vger.kernel.org>; Tue, 15 Nov 2022 19:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668570930; x=1700106930;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=b+Do3JjhTAcmS4PhBV4tfqWNt+kLVugncrJOn0WX0T0=;
  b=R7qkp57dxlMJaYqJBpvOoDH24fZwwakMDOOQm10iVRhdeoJ+5+DZX1+x
   7grpzSRZZcBrZVcXQ53KhIDSLM+jkz6QOgn787CNbp+U8Q5A8m2pfcuVJ
   dGYjpMATCk6wwarN2GBaueMkn1tM0fQRnpvdEfhIRwu0yb50CoRfd0kI+
   vCimN94QysvfRa8+rqUzONgvmzXBqMljK6D1v0TtzRJeyU6Q/HyS+ItQ+
   ArFguyM2Bp8BHfe+UTupND9itiPTFu5tHFtRFW2BP8+qvD82ui6Hb39nG
   vDvTrQz6+qvKW4+d+nQb2J4B2VGjEpPsCF7MypYQl+lhtfCK03+whye1F
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="292148870"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; 
   d="scan'208";a="292148870"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2022 19:55:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="884227392"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; 
   d="scan'208";a="884227392"
Received: from lkp-server01.sh.intel.com (HELO ebd99836cbe0) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 15 Nov 2022 19:55:29 -0800
Received: from kbuild by ebd99836cbe0 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1ov9WK-0001xH-1P;
        Wed, 16 Nov 2022 03:55:28 +0000
Date:   Wed, 16 Nov 2022 11:55:21 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 739be9b6a84b23c40b0fb534b749602fb8285e70
Message-ID: <63745f29./Pbxcc+0LNvofNYJ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 739be9b6a84b23c40b0fb534b749602fb8285e70  gpio: sl28cpld: Replace irqchip mask_invert with unmask_base

elapsed time: 722m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
um                           x86_64_defconfig
um                             i386_defconfig
sh                               allmodconfig
arc                                 defconfig
s390                             allmodconfig
mips                             allyesconfig
alpha                               defconfig
x86_64                          rhel-8.3-func
powerpc                          allmodconfig
x86_64                    rhel-8.3-kselftests
arc                              allyesconfig
s390                                defconfig
alpha                            allyesconfig
s390                             allyesconfig
x86_64                              defconfig
ia64                             allmodconfig
arc                  randconfig-r043-20221115
riscv                randconfig-r042-20221115
s390                 randconfig-r044-20221115
m68k                             allyesconfig
x86_64                               rhel-8.3
i386                          randconfig-a001
m68k                             allmodconfig
i386                          randconfig-a003
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                           allyesconfig
x86_64                        randconfig-a004
i386                          randconfig-a014
x86_64                        randconfig-a002
x86_64                           rhel-8.3-syz
i386                          randconfig-a012
x86_64                         rhel-8.3-kunit
i386                          randconfig-a016
x86_64                        randconfig-a015
i386                                defconfig
x86_64                        randconfig-a006
x86_64                           rhel-8.3-kvm
i386                          randconfig-a005
arm                                 defconfig
i386                             allyesconfig
arm                              allyesconfig
arm64                            allyesconfig

clang tested configs:
hexagon              randconfig-r045-20221115
hexagon              randconfig-r041-20221115
i386                          randconfig-a013
i386                          randconfig-a002
x86_64                        randconfig-a012
i386                          randconfig-a004
x86_64                        randconfig-a014
x86_64                        randconfig-a001
i386                          randconfig-a011
x86_64                        randconfig-a003
x86_64                        randconfig-a016
x86_64                        randconfig-a005
i386                          randconfig-a015
i386                          randconfig-a006

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
