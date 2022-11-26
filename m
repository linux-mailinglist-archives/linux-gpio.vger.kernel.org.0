Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C74226395F5
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Nov 2022 13:18:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229464AbiKZMS3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 26 Nov 2022 07:18:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229548AbiKZMS2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 26 Nov 2022 07:18:28 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DECD1DF36
        for <linux-gpio@vger.kernel.org>; Sat, 26 Nov 2022 04:18:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669465108; x=1701001108;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=MrAdaDBVS5e+XGvX6DKpVzMRuUafgr7IqI26YlGs8YQ=;
  b=NMVaEF14GpOE64MNotpHr0hw0S6PnNYuDBCTUAddWwANCRS/OZr5lq++
   c1I1faAJjP2jsLx77MoFDMWWyvzF5yN0/jpRdC5ilMEAWX5t7gdIrtHjs
   83emuWN3k/TDs5Z1mKT2T525is9EJGJq6M8p/e++/xjFLWzQhUBPUv5yt
   oz5pr64IVvmsLBpZGLslmpcwkD+SNriFvYdNT0CJGqfy4LN8SxBlPpRlE
   FoDHrfTL/kHlYz5fYFcC4u3kbNItbvmlV33JP6ojlfEMC8MQhLQmgH4Ps
   wiU1UVAxM/w90auF/DCllVQdfLHkTC3DJnoR18n78JEbIlLxSlS+5ACOC
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10542"; a="312228701"
X-IronPort-AV: E=Sophos;i="5.96,196,1665471600"; 
   d="scan'208";a="312228701"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2022 04:18:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10542"; a="673749709"
X-IronPort-AV: E=Sophos;i="5.96,196,1665471600"; 
   d="scan'208";a="673749709"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 26 Nov 2022 04:18:26 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oyu8X-0006IP-2h;
        Sat, 26 Nov 2022 12:18:25 +0000
Date:   Sat, 26 Nov 2022 20:18:18 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 767d827a117bdd502d0f79ecdfadb9b5e4b40b71
Message-ID: <6382040a.1YbJfjCmViRr/Iy8%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: 767d827a117bdd502d0f79ecdfadb9b5e4b40b71  gpiolib: fix memory leak in gpiochip_setup_dev()

elapsed time: 870m

configs tested: 45
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
arc                  randconfig-r043-20221124
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
powerpc                          allmodconfig
s390                                defconfig
mips                             allyesconfig
powerpc                           allnoconfig
s390                             allyesconfig
sh                               allmodconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
ia64                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
x86_64                              defconfig
x86_64                            allnoconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
i386                             allyesconfig
i386                                defconfig
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig

clang tested configs:
riscv                randconfig-r042-20221124
hexagon              randconfig-r041-20221124
hexagon              randconfig-r045-20221124
s390                 randconfig-r044-20221124
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64                        randconfig-k001

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
