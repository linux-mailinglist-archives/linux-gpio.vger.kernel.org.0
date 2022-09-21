Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75E425E548A
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Sep 2022 22:36:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230019AbiIUUgx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Sep 2022 16:36:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229785AbiIUUgw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Sep 2022 16:36:52 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6802A4B29
        for <linux-gpio@vger.kernel.org>; Wed, 21 Sep 2022 13:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663792602; x=1695328602;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Ql7D0VgLtKKOa1afR3B8eAYNbz2rnTS0B3G5x6EF3IM=;
  b=bipAO6dJQS9AeAxh/ceijQ4iuCG+91UvIX+7vHdc1HwzEjBfuokZeFcl
   7LVhKMozL7Ux1W4lrOr+swOf147YJMfZ7dUcJu7X4Vp1VhutcMBbtglXe
   Lf8N82XGlwlVcp2cbJC4KVpa/0k3AazMFcSoymeLSaIpGx6e8C/4GcVei
   ABGzFE71wjFcC+pLWwXx5yWORtl07725nB+N5UvSG3XCe0nD1w2oIRYnp
   rZxCPHTtSrSHbtQWC4tcssqZgEeJmgeLoFsS8W9XRksgRvsgksKj1css1
   ot5ZiOPTHCKwy0ug71BZZK8jKNcZ6BGjOele26dooyOeOgFsAEivk75pM
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10477"; a="326435985"
X-IronPort-AV: E=Sophos;i="5.93,334,1654585200"; 
   d="scan'208";a="326435985"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2022 13:36:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,334,1654585200"; 
   d="scan'208";a="948314528"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 21 Sep 2022 13:36:41 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1ob6SW-0003wc-2V;
        Wed, 21 Sep 2022 20:36:40 +0000
Date:   Thu, 22 Sep 2022 04:35:41 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 69bef19d6b9700e96285f4b4e28691cda3dcd0d1
Message-ID: <632b759d.Z0rzNKskEWXQ2iMm%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: 69bef19d6b9700e96285f4b4e28691cda3dcd0d1  gpiolib: cdev: Set lineevent_state::irq after IRQ register successfully

elapsed time: 726m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
s390                             allmodconfig
um                             i386_defconfig
alpha                               defconfig
um                           x86_64_defconfig
x86_64                        randconfig-a015
x86_64                        randconfig-a013
x86_64                        randconfig-a011
s390                                defconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
mips                             allyesconfig
s390                             allyesconfig
sh                               allmodconfig
x86_64                              defconfig
i386                          randconfig-a001
x86_64                               rhel-8.3
arm                                 defconfig
x86_64                        randconfig-a002
x86_64                           allyesconfig
i386                                defconfig
i386                          randconfig-a003
arc                  randconfig-r043-20220921
riscv                randconfig-r042-20220921
x86_64                        randconfig-a006
i386                          randconfig-a005
x86_64                        randconfig-a004
s390                 randconfig-r044-20220921
x86_64                           rhel-8.3-kvm
x86_64                          rhel-8.3-func
i386                             allyesconfig
x86_64                         rhel-8.3-kunit
arm                              allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
arm64                            allyesconfig
ia64                             allmodconfig
i386                          randconfig-a012
i386                          randconfig-a014
alpha                            allyesconfig
arc                              allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
i386                          randconfig-a016

clang tested configs:
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64                        randconfig-a005
i386                          randconfig-a002
x86_64                        randconfig-a001
hexagon              randconfig-r041-20220921
x86_64                        randconfig-a003
i386                          randconfig-a006
i386                          randconfig-a004
hexagon              randconfig-r045-20220921
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
