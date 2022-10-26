Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EEABA60DA4D
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Oct 2022 06:29:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232691AbiJZE3l (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Oct 2022 00:29:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232748AbiJZE3k (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Oct 2022 00:29:40 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27C57E0FE
        for <linux-gpio@vger.kernel.org>; Tue, 25 Oct 2022 21:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666758579; x=1698294579;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=JDJXvFeDPWOKIB0MZifMjLKNhzWlbwDSQo8pEF5uNXE=;
  b=X3syXxatweKK6aOFS5fccMiz/zh12Gmnzy/XsNgDHOZZoKANspmpuWTt
   qKSUqQOGVjkqM56odY6tqDOapbZhMXoeJy2+6Nm8DA2C0JImhir6ReaGD
   WRJw9Gs+uh1Za930LUmGW7P/E8msEoqbecY/xPlk6gpP7q2y0+xV5ZUSQ
   BlBKAKSHEP8o1BR1fNetDgNDO5/TCkdr5+hzVFlFHEdwDZxUYwmS+HXzK
   H78xTUWAS0kmdCzXvZ75ZqF5ZLIlLEL9EnN9HuztzIsYtwNPse0Uaat5z
   XLfkA72TYY2TBHQc0n1H9ud3r/1o9B2Kto11RFveapzJ9EOeSXrrjNHIE
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10511"; a="291161093"
X-IronPort-AV: E=Sophos;i="5.95,213,1661842800"; 
   d="scan'208";a="291161093"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2022 21:29:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10511"; a="961074846"
X-IronPort-AV: E=Sophos;i="5.95,213,1661842800"; 
   d="scan'208";a="961074846"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 25 Oct 2022 21:29:37 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1onY2q-0006zo-39;
        Wed, 26 Oct 2022 04:29:36 +0000
Date:   Wed, 26 Oct 2022 12:28:54 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 95fbc61daca82c47bccd1970075e2a0c51f9da57
Message-ID: <6358b786.pK/tMafNYMvrDQfW%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 95fbc61daca82c47bccd1970075e2a0c51f9da57  gpio: exar: Allow IO port access

elapsed time: 730m

configs tested: 64
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
s390                             allmodconfig
um                             i386_defconfig
alpha                               defconfig
um                           x86_64_defconfig
i386                 randconfig-a011-20221024
i386                 randconfig-a014-20221024
i386                 randconfig-a013-20221024
i386                 randconfig-a012-20221024
s390                                defconfig
i386                 randconfig-a016-20221024
i386                 randconfig-a015-20221024
arc                  randconfig-r043-20221025
x86_64                              defconfig
i386                                defconfig
i386                          randconfig-a001
i386                          randconfig-a003
arm                                 defconfig
x86_64                           rhel-8.3-kvm
i386                          randconfig-a005
x86_64                         rhel-8.3-kunit
s390                             allyesconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
arm64                            allyesconfig
arm                              allyesconfig
x86_64                               rhel-8.3
m68k                             allmodconfig
i386                             allyesconfig
alpha                            allyesconfig
arc                              allyesconfig
powerpc                           allnoconfig
x86_64                           allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
mips                             allyesconfig
m68k                             allyesconfig
x86_64               randconfig-a014-20221024
x86_64               randconfig-a013-20221024
x86_64               randconfig-a012-20221024
x86_64               randconfig-a016-20221024
x86_64               randconfig-a011-20221024
x86_64               randconfig-a015-20221024
ia64                             allmodconfig

clang tested configs:
hexagon              randconfig-r041-20221025
hexagon              randconfig-r045-20221025
riscv                randconfig-r042-20221025
s390                 randconfig-r044-20221025
i386                          randconfig-a002
i386                          randconfig-a004
x86_64               randconfig-a001-20221024
x86_64               randconfig-a003-20221024
i386                          randconfig-a006
x86_64               randconfig-a004-20221024
x86_64               randconfig-a002-20221024
x86_64               randconfig-a005-20221024
x86_64               randconfig-a006-20221024
i386                 randconfig-a004-20221024
i386                 randconfig-a006-20221024
i386                 randconfig-a002-20221024
i386                 randconfig-a003-20221024
i386                 randconfig-a001-20221024
i386                 randconfig-a005-20221024

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
