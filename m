Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86760664E26
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jan 2023 22:40:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232525AbjAJVkC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Jan 2023 16:40:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231596AbjAJVj6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Jan 2023 16:39:58 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93F002029
        for <linux-gpio@vger.kernel.org>; Tue, 10 Jan 2023 13:39:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673386797; x=1704922797;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=FTEysWCrfVF1MjY4TN+s5LcD+X6iFU6fM14AERoYrp0=;
  b=Bk0/dPJ6hATHFwTBUedeSpbRBGD1o2hbZ5osOwx0ANvcs7lOObU5fZOZ
   a2dkjwbzZMZ024DYH1bytQxzOVKvfqHwsW4O7DTKakco4RkbdLi9uUgeo
   /oH0pRPsrMYaZjVmTcaTG7tjCtMVuO90fTerXsqulBw5F+cKqiL2elBXJ
   0JuDtj4n2cPZl/DzdFTHrsQatNb0I+mreEnaArRLgwiuJ5vKDAlVkIKa0
   eeQI26gxZHYDAcg0ruP/+//LERUsz43ZGVS9m2CK3e+Ui4OVy4Mn/kE7p
   toZsHAbJOwPlURZaFKHvysrPy9H9Neof+y9mMRk+b/9zha9tD4ESxArH5
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="311069166"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; 
   d="scan'208";a="311069166"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2023 13:39:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="725681422"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; 
   d="scan'208";a="725681422"
Received: from lkp-server02.sh.intel.com (HELO f1920e93ebb5) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 10 Jan 2023 13:39:51 -0800
Received: from kbuild by f1920e93ebb5 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pFMLW-0008OO-1Y;
        Tue, 10 Jan 2023 21:39:50 +0000
Date:   Wed, 11 Jan 2023 05:39:01 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 697550668be5c1edbd0a7347ecbe6769dc54ccc9
Message-ID: <63bddaf5.qLal84LGFvfZeD4Z%lkp@intel.com>
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
branch HEAD: 697550668be5c1edbd0a7347ecbe6769dc54ccc9  dt-bindings: pinctrl: qcom,sm8450-lpass-lpi: add input-enable and bias-bus-hold

elapsed time: 721m

configs tested: 74
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
x86_64                            allnoconfig
um                           x86_64_defconfig
um                             i386_defconfig
alpha                            allyesconfig
arc                              allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                                 defconfig
powerpc                           allnoconfig
alpha                               defconfig
x86_64               randconfig-a011-20230109
x86_64               randconfig-a012-20230109
x86_64               randconfig-a014-20230109
i386                 randconfig-a011-20230109
x86_64               randconfig-a013-20230109
s390                                defconfig
i386                 randconfig-a013-20230109
sh                               allmodconfig
i386                 randconfig-a012-20230109
x86_64               randconfig-a016-20230109
x86_64               randconfig-a015-20230109
s390                             allmodconfig
i386                 randconfig-a014-20230109
i386                 randconfig-a016-20230109
i386                 randconfig-a015-20230109
powerpc                          allmodconfig
ia64                             allmodconfig
mips                             allyesconfig
x86_64                           rhel-8.3-bpf
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
s390                             allyesconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
i386                             allyesconfig
i386                                defconfig
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func

clang tested configs:
i386                 randconfig-a004-20230109
i386                 randconfig-a002-20230109
i386                 randconfig-a003-20230109
i386                 randconfig-a006-20230109
i386                 randconfig-a001-20230109
i386                 randconfig-a005-20230109
x86_64                          rhel-8.3-rust
x86_64                        randconfig-k001
x86_64               randconfig-a001-20230109
x86_64               randconfig-a002-20230109
x86_64               randconfig-a004-20230109
x86_64               randconfig-a003-20230109
x86_64               randconfig-a006-20230109
x86_64               randconfig-a005-20230109
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
riscv                          rv32_defconfig
powerpc                      ppc64e_defconfig
powerpc                      ppc44x_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
