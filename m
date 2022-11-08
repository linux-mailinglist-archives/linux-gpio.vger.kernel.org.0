Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40B97620CAE
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Nov 2022 10:50:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233438AbiKHJtx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Nov 2022 04:49:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233800AbiKHJtv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Nov 2022 04:49:51 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9300F63B4
        for <linux-gpio@vger.kernel.org>; Tue,  8 Nov 2022 01:49:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667900990; x=1699436990;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=5QurOS0PvKc66W1YxA8tXNeXlIJ1nnooovbtVVYmPXk=;
  b=U15gGVPU5h0ypEr/bc09XAlr6m9Aim1Li8lZDsfiwltC2W89jddR6sRJ
   pafbC+ykG77KNuao9acTsOpnSY/dev3IRxJOXBh1ScyMVm9KN7McsZVJH
   0msPu3oJGxAnxDYKPbrnw6+9TUnUJ7V2xDngH2IMGGkhjaoNdMfATF5s4
   A03IwMcx3QsZ0KNyzDGobTuZZobBj9pnSoeAir9Yug/c+MYnHqxh3hZXD
   Wdb16yULEZfyOUyx2rEeyNyAzpTnPMzwqTLnkSJiWsp6NY5duZRJAUG/E
   LzU/8rLfNAIk8t0/q5k0otWUf0G+rKMD/8LG6GHOzmAKQFkp5IhX1w1Q7
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="298170607"
X-IronPort-AV: E=Sophos;i="5.96,147,1665471600"; 
   d="scan'208";a="298170607"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2022 01:49:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="669493760"
X-IronPort-AV: E=Sophos;i="5.96,147,1665471600"; 
   d="scan'208";a="669493760"
Received: from lkp-server01.sh.intel.com (HELO e783503266e8) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 08 Nov 2022 01:49:48 -0800
Received: from kbuild by e783503266e8 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1osLEp-0000Go-2i;
        Tue, 08 Nov 2022 09:49:47 +0000
Date:   Tue, 08 Nov 2022 17:48:56 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 80280df758c1498485988b30cf6887fde7796056
Message-ID: <636a2608.CazWmgI4c2eAoOrB%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 80280df758c1498485988b30cf6887fde7796056  gpio: hisi: Add initial device tree support

elapsed time: 725m

configs tested: 43
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
powerpc                           allnoconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
sh                               allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
powerpc                          allmodconfig
mips                             allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
ia64                             allmodconfig
arc                  randconfig-r043-20221107
x86_64                               rhel-8.3
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                             allyesconfig
i386                                defconfig
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
um                           x86_64_defconfig

clang tested configs:
hexagon              randconfig-r041-20221107
riscv                randconfig-r042-20221107
hexagon              randconfig-r041-20221108
hexagon              randconfig-r045-20221108
s390                 randconfig-r044-20221107
hexagon              randconfig-r045-20221107
x86_64               randconfig-a014-20221107
x86_64               randconfig-a011-20221107
x86_64               randconfig-a013-20221107
x86_64               randconfig-a012-20221107
x86_64               randconfig-a015-20221107
x86_64               randconfig-a016-20221107
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
