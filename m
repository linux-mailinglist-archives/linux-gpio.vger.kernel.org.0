Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7653865A2B3
	for <lists+linux-gpio@lfdr.de>; Sat, 31 Dec 2022 05:40:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229906AbiLaEkz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Dec 2022 23:40:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229527AbiLaEkz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Dec 2022 23:40:55 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E7EE111D
        for <linux-gpio@vger.kernel.org>; Fri, 30 Dec 2022 20:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672461654; x=1703997654;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=4uNVOOUi860oribfPQvobg6JLgzkD+JKuw7m9zNoEQA=;
  b=JZeo/E2UWXZIYWO5hVJvRg1y3KRQpY5ZVpaWX2Cwf6/OufieiqmFqYOb
   6akdBXM9Aul2vzvtbgGCllnErORUyi2J1dA+J5qfDwa4kY9y14GDHoCZl
   cMMmvfRpSa4TXULms69QhAt29HSkT4fAfwYv5XlRSS6dxJ5KrwWEd9Rgc
   rOsebrX/Uv0soeIaezwFZ8DfHm6vPAYcmqTNQT8VBUG1TwoA2G1zwslZt
   WrqLJsZuxw202ffOQ02TSEJ9bE70rIc0SVBOqO0cLguiI8L6otFqIhsN+
   pFNTqfyWxQRrCKkws4BDy1Cx/bB2BQODBdnwtvV0HGZ1tueVxMLkautNr
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10576"; a="300972675"
X-IronPort-AV: E=Sophos;i="5.96,289,1665471600"; 
   d="scan'208";a="300972675"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2022 20:40:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10576"; a="982807960"
X-IronPort-AV: E=Sophos;i="5.96,289,1665471600"; 
   d="scan'208";a="982807960"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 30 Dec 2022 20:40:52 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pBTfw-000N1T-0L;
        Sat, 31 Dec 2022 04:40:52 +0000
Date:   Sat, 31 Dec 2022 12:40:27 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 9883ddf9d68db5332f08dfc7283db69f69f8d6d2
Message-ID: <63afbd3b.myrlbPOvJUhGC5EJ%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: 9883ddf9d68db5332f08dfc7283db69f69f8d6d2  gpio: sprd: Make the irqchip immutable

elapsed time: 725m

configs tested: 74
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
sh                               allmodconfig
arc                                 defconfig
mips                             allyesconfig
alpha                               defconfig
um                             i386_defconfig
um                           x86_64_defconfig
s390                             allmodconfig
s390                                defconfig
s390                             allyesconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-bpf
alpha                            allyesconfig
arc                              allyesconfig
m68k                             allyesconfig
powerpc                          allmodconfig
i386                                defconfig
m68k                             allmodconfig
ia64                             allmodconfig
x86_64                              defconfig
i386                 randconfig-a012-20221226
x86_64                    rhel-8.3-kselftests
i386                 randconfig-a016-20221226
x86_64                          rhel-8.3-func
i386                 randconfig-a011-20221226
i386                 randconfig-a015-20221226
i386                 randconfig-a013-20221226
i386                 randconfig-a014-20221226
x86_64                               rhel-8.3
x86_64                           allyesconfig
i386                             allyesconfig
x86_64               randconfig-a014-20221226
x86_64               randconfig-a013-20221226
arm                                 defconfig
x86_64               randconfig-a011-20221226
x86_64               randconfig-a012-20221226
x86_64               randconfig-a015-20221226
x86_64               randconfig-a016-20221226
arm64                            allyesconfig
arm                              allyesconfig
arm                  randconfig-r046-20221225
arc                  randconfig-r043-20221225
arc                  randconfig-r043-20221227
arm                  randconfig-r046-20221227
arc                  randconfig-r043-20221226
riscv                randconfig-r042-20221226
s390                 randconfig-r044-20221226
x86_64                            allnoconfig

clang tested configs:
x86_64                          rhel-8.3-rust
i386                 randconfig-a004-20221226
i386                 randconfig-a001-20221226
i386                 randconfig-a003-20221226
i386                 randconfig-a002-20221226
x86_64               randconfig-a002-20221226
x86_64               randconfig-a003-20221226
x86_64               randconfig-a001-20221226
i386                 randconfig-a005-20221226
x86_64               randconfig-a004-20221226
i386                 randconfig-a006-20221226
x86_64               randconfig-a005-20221226
x86_64               randconfig-a006-20221226
hexagon              randconfig-r045-20221225
riscv                randconfig-r042-20221227
hexagon              randconfig-r041-20221225
s390                 randconfig-r044-20221227
hexagon              randconfig-r041-20221227
hexagon              randconfig-r041-20221226
arm                  randconfig-r046-20221226
s390                 randconfig-r044-20221225
hexagon              randconfig-r045-20221226
riscv                randconfig-r042-20221225
hexagon              randconfig-r045-20221227

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
