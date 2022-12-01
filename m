Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2181A63E925
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Dec 2022 05:58:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229534AbiLAE6H (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Nov 2022 23:58:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229513AbiLAE6G (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Nov 2022 23:58:06 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA1D39FEF2
        for <linux-gpio@vger.kernel.org>; Wed, 30 Nov 2022 20:58:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669870685; x=1701406685;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=CKhVx5TuBZl+DB3+HJ6emgp5bACCA08uMwsY4C+OkJ8=;
  b=HGMMmkZ5w1lRGe2mZ70bmR67ORF32uo/+vRCSUHaSXDb/XlrkX/YDnXM
   ZbnPU54xzO5UXr0veVsjv9vU2ydC50zm2MbWQQ3TQ9ywc67nQe2Xs3r5v
   3oj90IcB/DfEKDkQ2FrXmmFosogZhr4WKc9XWkM/W7n7Kq4uF1LLIwTg1
   ytkHJMJWpinrTLoQmhMSTop2SERaLoFcr5ruEb19xZ7nJ0LsvsHld9wZP
   VtVMLJ8Bz5/d4onVcFAUNg08uRPqc706qzpFxhmftJtZBzVvtmg4NXyCQ
   9o2WAJgEJ/bEVBk3ce1MHbI4m3p4RSxt6fqgn8oUtVH0kW0CF3Nxhamou
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="303190491"
X-IronPort-AV: E=Sophos;i="5.96,207,1665471600"; 
   d="scan'208";a="303190491"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2022 20:58:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="769096083"
X-IronPort-AV: E=Sophos;i="5.96,207,1665471600"; 
   d="scan'208";a="769096083"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 30 Nov 2022 20:58:04 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1p0be7-000CAq-28;
        Thu, 01 Dec 2022 04:58:03 +0000
Date:   Thu, 01 Dec 2022 12:57:55 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 45fecdb9f658d9c82960c98240bc0770ade19aca
Message-ID: <63883453.CuHFUcHs2v5bm74x%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: 45fecdb9f658d9c82960c98240bc0770ade19aca  gpio: amd8111: Fix PCI device reference count leak

elapsed time: 722m

configs tested: 50
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
powerpc                           allnoconfig
um                           x86_64_defconfig
arc                                 defconfig
alpha                               defconfig
sh                               allmodconfig
s390                             allmodconfig
s390                                defconfig
x86_64                           rhel-8.3-syz
mips                             allyesconfig
x86_64                         rhel-8.3-kunit
powerpc                          allmodconfig
x86_64                           rhel-8.3-kvm
s390                             allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
alpha                            allyesconfig
arc                              allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
arc                  randconfig-r043-20221128
x86_64                              defconfig
ia64                             allmodconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
x86_64                            allnoconfig
i386                             allyesconfig
i386                                defconfig
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig

clang tested configs:
hexagon              randconfig-r045-20221128
riscv                randconfig-r042-20221128
hexagon              randconfig-r041-20221128
s390                 randconfig-r044-20221128
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                 randconfig-a014-20221128
i386                 randconfig-a011-20221128
i386                 randconfig-a013-20221128
i386                 randconfig-a016-20221128
i386                 randconfig-a012-20221128
i386                 randconfig-a015-20221128

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
