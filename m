Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E11165344C7
	for <lists+linux-gpio@lfdr.de>; Wed, 25 May 2022 22:19:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234954AbiEYUTT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 25 May 2022 16:19:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232984AbiEYUTS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 25 May 2022 16:19:18 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B86D1180C
        for <linux-gpio@vger.kernel.org>; Wed, 25 May 2022 13:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653509957; x=1685045957;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=9LVvEHUYA+3huG3uMHo0hJqmmgqDRf1EjHEenC0OJqc=;
  b=cPjHTREmlo0JqoGtVJFyP6o1Fu9lq3yrwb0cVfK8E4NysiOsjSamDJAz
   SrPI7MZtNjYIz/4WRsdFHHcluM12CRBsAT6V3KBr4QXfZEpE1r5x+oktz
   HMsA1RimFeoZUrvs9+KjVcOsP5l3ytQQzjWMVVjf+IBoGRDeKfT3CHY3i
   z1IL+iML48/vyy1EOb3msBfjQQLPi6a0RujjTOkI8hp9hsHRhjQWGwte2
   DhLUPef5zYXwNlZ/Ft8dRrwBeTr/9CMyxXHh5gJfwCRn0zWbzlUs8rpgQ
   7+qOf6/cCOiKrMspSS5wALrN2jSYTMvjS3jYTVbaDGVUU4/99hgtlaz8L
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10358"; a="273929683"
X-IronPort-AV: E=Sophos;i="5.91,250,1647327600"; 
   d="scan'208";a="273929683"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2022 13:19:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,250,1647327600"; 
   d="scan'208";a="704164522"
Received: from lkp-server01.sh.intel.com (HELO db63a1be7222) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 25 May 2022 13:19:15 -0700
Received: from kbuild by db63a1be7222 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1ntxTP-0003IE-4e;
        Wed, 25 May 2022 20:19:15 +0000
Date:   Thu, 26 May 2022 04:18:26 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 83969805cc716a7dc6b296c3fb1bc7e5cd7ca321
Message-ID: <628e8f12.N4Kf/JaqQb9ticTE%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 83969805cc716a7dc6b296c3fb1bc7e5cd7ca321  pinctrl: apple: Use a raw spinlock for the regmap

elapsed time: 725m

configs tested: 81
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
mips                             allyesconfig
riscv                            allmodconfig
um                             i386_defconfig
mips                             allmodconfig
um                           x86_64_defconfig
riscv                            allyesconfig
sparc                            allyesconfig
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
csky                                defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                                defconfig
s390                             allmodconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                             allyesconfig
i386                                defconfig
sparc                               defconfig
i386                             allyesconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
powerpc                          allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arc                  randconfig-r043-20220524
s390                 randconfig-r044-20220524
riscv                randconfig-r042-20220524
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit

clang tested configs:
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64                        randconfig-a012
i386                          randconfig-a013
i386                          randconfig-a015
i386                          randconfig-a011
hexagon              randconfig-r045-20220524
hexagon              randconfig-r041-20220524

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
