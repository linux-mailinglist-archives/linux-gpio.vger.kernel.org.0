Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CEFC5EB1A3
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Sep 2022 21:51:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230269AbiIZTvn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Sep 2022 15:51:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230246AbiIZTvT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Sep 2022 15:51:19 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EB993718C
        for <linux-gpio@vger.kernel.org>; Mon, 26 Sep 2022 12:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664221872; x=1695757872;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=tn7OmDjWZt+VC5vbl3hgrFxkxVQYlp7Oc+xSoWj3x6s=;
  b=bFlK8fTcZ2urczT/Gw1IDlANJ1O3rtPXQTSj7vSbV+MyDph75m7X9naW
   vaxDTfSGYpPDZmulf68gA2oyqGkqUm+2OOKn9wbifHeUBD4aHgAysxkhO
   lCv0ODCr+vvK5gZP4V6ViLmbGCyqdSS2cd0ZmQSqxAVkN+Fea6BB4gCnh
   lZ6ecMBnsMQN+SmneeuwbW4J1ZtfKYpj+nx2pRAhtk1NkkFyivFQxSaQA
   jWkQng/flDp6v0t0vqCbQqt/D/+euJwNABxKGp9UIykyo02TmyG7fgwQf
   9jOJmpsLPcK0r3sEY+TcrVDeZVKfL+azo3gbkq2et7zqIJdK4yf75flBZ
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="280849515"
X-IronPort-AV: E=Sophos;i="5.93,347,1654585200"; 
   d="scan'208";a="280849515"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2022 12:51:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="949989602"
X-IronPort-AV: E=Sophos;i="5.93,347,1654585200"; 
   d="scan'208";a="949989602"
Received: from lkp-server02.sh.intel.com (HELO dfa2c9fcd321) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 26 Sep 2022 12:51:09 -0700
Received: from kbuild by dfa2c9fcd321 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1ocu8C-0000CC-30;
        Mon, 26 Sep 2022 19:51:08 +0000
Date:   Tue, 27 Sep 2022 03:51:07 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 4335417da2b8d6d9b2d4411b5f9e248e5bb2d380
Message-ID: <633202ab.619vdZLPQ6zaPFXQ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: 4335417da2b8d6d9b2d4411b5f9e248e5bb2d380  gpio: mvebu: Fix check for pwm support on non-A8K platforms

elapsed time: 726m

configs tested: 63
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
alpha                               defconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
s390                             allmodconfig
s390                                defconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
arc                  randconfig-r043-20220925
sh                               allmodconfig
riscv                randconfig-r042-20220925
arc                  randconfig-r043-20220926
m68k                             allmodconfig
s390                 randconfig-r044-20220925
arc                              allyesconfig
i386                                defconfig
alpha                            allyesconfig
s390                             allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
m68k                             allyesconfig
x86_64               randconfig-a002-20220926
i386                 randconfig-a001-20220926
x86_64               randconfig-a001-20220926
i386                 randconfig-a002-20220926
x86_64               randconfig-a003-20220926
i386                 randconfig-a003-20220926
x86_64               randconfig-a005-20220926
x86_64                           allyesconfig
x86_64               randconfig-a004-20220926
i386                 randconfig-a004-20220926
x86_64               randconfig-a006-20220926
i386                 randconfig-a005-20220926
i386                 randconfig-a006-20220926
arm                                 defconfig
i386                             allyesconfig
ia64                             allmodconfig
arm                              allyesconfig
arm64                            allyesconfig

clang tested configs:
hexagon              randconfig-r045-20220925
hexagon              randconfig-r041-20220926
hexagon              randconfig-r045-20220926
hexagon              randconfig-r041-20220925
riscv                randconfig-r042-20220926
s390                 randconfig-r044-20220926
i386                 randconfig-a012-20220926
i386                 randconfig-a011-20220926
i386                 randconfig-a013-20220926
x86_64               randconfig-a015-20220926
i386                 randconfig-a014-20220926
x86_64               randconfig-a012-20220926
x86_64               randconfig-a014-20220926
x86_64               randconfig-a013-20220926
x86_64               randconfig-a011-20220926
x86_64               randconfig-a016-20220926
i386                 randconfig-a016-20220926
i386                 randconfig-a015-20220926

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
