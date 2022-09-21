Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3259B5BF619
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Sep 2022 08:12:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229611AbiIUGML (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Sep 2022 02:12:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229631AbiIUGMJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Sep 2022 02:12:09 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B2FC7F27E
        for <linux-gpio@vger.kernel.org>; Tue, 20 Sep 2022 23:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663740729; x=1695276729;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=spjVJ+t7cF6cTOqJkJrl8wnytDnH8tAwra6vhpuKFW0=;
  b=kJyPCSrDSjQr1dFbFnppe40v3aiUpTT65ZVXSScvdn/vwhIayKCn3by7
   0DwjKSmglz5diWsdLKFCKgkkiV4TbnjzApj+mG9ZIm0iTfxcXYUNLJeF+
   AUZfzGxLBaB+LxNyTl5x7+9UYWJLjL6UpqSJ8jZgqG6FCEWkJRK7i+a72
   aSQuCkjIoX6MrQ40Sl5P32UiGMIJJsu9A4uwOb8XU4F5xNd5HlsPgKUoV
   yA1m2WKCtbZ0ztj4YtYCcke5FVkJrhTqy9qbJLnyNQA2dwDeBI/6gqcT2
   kBM0duR47vqctab6nXN5coD6zks2kKhNrIjEAeJIBdamrqZIiVrDpGSiS
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10476"; a="297507581"
X-IronPort-AV: E=Sophos;i="5.93,332,1654585200"; 
   d="scan'208";a="297507581"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2022 23:12:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,332,1654585200"; 
   d="scan'208";a="619217464"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 20 Sep 2022 23:12:07 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oasxq-0003JR-1A;
        Wed, 21 Sep 2022 06:12:06 +0000
Date:   Wed, 21 Sep 2022 14:11:46 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 361c1ca384c93013e08bd117e4fe23ca9739e3f7
Message-ID: <632aab22.afQzfhevWNktcTdq%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 361c1ca384c93013e08bd117e4fe23ca9739e3f7  Merge tag 'intel-gpio-v6.1-1' of gitolite.kernel.org:pub/scm/linux/kernel/git/andy/linux-gpio-intel into gpio/for-next

elapsed time: 723m

configs tested: 57
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
um                             i386_defconfig
um                           x86_64_defconfig
arm                              allyesconfig
arm64                            allyesconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
mips                             allyesconfig
sh                               allmodconfig
s390                             allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
i386                                defconfig
arc                  randconfig-r043-20220921
riscv                randconfig-r042-20220921
s390                 randconfig-r044-20220921
i386                             allyesconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
ia64                             allmodconfig
x86_64                           rhel-8.3-kvm
x86_64                              defconfig
x86_64                    rhel-8.3-kselftests
x86_64                               rhel-8.3
i386                          randconfig-a014
x86_64                           rhel-8.3-syz
x86_64                          rhel-8.3-func
i386                          randconfig-a012
x86_64                         rhel-8.3-kunit
i386                          randconfig-a016
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                           allyesconfig
x86_64                        randconfig-a015

clang tested configs:
hexagon              randconfig-r041-20220921
hexagon              randconfig-r045-20220921
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a013
i386                          randconfig-a015
i386                          randconfig-a011
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
