Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48549641426
	for <lists+linux-gpio@lfdr.de>; Sat,  3 Dec 2022 05:41:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231154AbiLCElo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Dec 2022 23:41:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230430AbiLCEln (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Dec 2022 23:41:43 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FBF993A55
        for <linux-gpio@vger.kernel.org>; Fri,  2 Dec 2022 20:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670042503; x=1701578503;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=paeDhPUW4SmU3LgnK2ow0YMkzR60ou1SKp2ZM67IjuI=;
  b=PCWisTy5PXWG3u6kevbfF8DO1UD9l19nL60j/mGf/IKE98gj8rNP+w1g
   8y4+l/WAJSHGQCbYn+PRj3y1d/QbvKhfr07vRK+Xmqj61kTNBe0VnyfQs
   oQNbNg3K/9fFLk4BWWVeOjPrc/VCbqwjLkFqhOSD0mkTAUQCjbqoepKea
   N7fHggfxcsbbl8jqEBiQCyPJZJeqIBoR62jYYifb+gJUnYCarrVv9EbP6
   vK0K0Uwk1I+56mocp3J/9ESTn5AOihGgxEh+ICYXEcBIQw/WdqsC3VAXX
   WuqGYXb1fZ0KTxSYktbtbBMOVEmkJQypkx6S9R+GnaoABfqdNrepnGMDn
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10549"; a="303706962"
X-IronPort-AV: E=Sophos;i="5.96,214,1665471600"; 
   d="scan'208";a="303706962"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2022 20:41:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10549"; a="751520162"
X-IronPort-AV: E=Sophos;i="5.96,214,1665471600"; 
   d="scan'208";a="751520162"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 02 Dec 2022 20:41:39 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1p1KLK-000EHJ-1H;
        Sat, 03 Dec 2022 04:41:38 +0000
Date:   Sat, 03 Dec 2022 12:41:12 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 450571883735e9a7c3b38691225531d54773e9a2
Message-ID: <638ad368.7RgL/nR3RoOHBCE3%lkp@intel.com>
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
branch HEAD: 450571883735e9a7c3b38691225531d54773e9a2  gpiolib: protect the GPIO device against being dropped while in use by user-space

elapsed time: 725m

configs tested: 60
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
powerpc                           allnoconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
sh                               allmodconfig
mips                             allyesconfig
powerpc                          allmodconfig
x86_64                        randconfig-a004
arc                                 defconfig
x86_64                        randconfig-a002
alpha                               defconfig
s390                                defconfig
s390                             allmodconfig
x86_64                        randconfig-a006
x86_64                              defconfig
ia64                             allmodconfig
s390                             allyesconfig
x86_64                               rhel-8.3
arc                  randconfig-r043-20221201
riscv                randconfig-r042-20221201
s390                 randconfig-r044-20221201
x86_64                    rhel-8.3-kselftests
x86_64                           allyesconfig
x86_64                          rhel-8.3-func
m68k                             allmodconfig
m68k                             allyesconfig
alpha                            allyesconfig
arc                              allyesconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a011
i386                                defconfig
x86_64                        randconfig-a015
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
i386                             allyesconfig
arm                                 defconfig
x86_64                            allnoconfig
arm64                            allyesconfig
arm                              allyesconfig

clang tested configs:
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
hexagon              randconfig-r045-20221201
hexagon              randconfig-r041-20221201
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
x86_64                        randconfig-k001

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
