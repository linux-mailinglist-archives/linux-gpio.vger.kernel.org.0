Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74E6765DE01
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Jan 2023 22:06:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240157AbjADVGd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Jan 2023 16:06:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240281AbjADVGN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Jan 2023 16:06:13 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C22C9AE47
        for <linux-gpio@vger.kernel.org>; Wed,  4 Jan 2023 13:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672866372; x=1704402372;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=BYBAMoCOfiB/S5fXrzK1qoty5yTSkNbv3bHsFjt6NLQ=;
  b=Qd1JBW/VpGvdS26uB6CrVPiNMs3GecQmpBpb3JLMgLEuXWFxKUSTH2qj
   YGaawZGSAwfoOeErnAV+zL3LiODcqR2iGJQpQZOg8RTdBvdErn+3JXx1n
   IeSzmWe4rf6TUHzG2eZ8fPRYyE25x4HEALw8N3NsUZ0p1KCMSiMt9uf+z
   NQJ5f7m+yxjrHbAnAGUZHHM1TLMaBLqqYWOv4ttJwM+Ct0wlMr4RoAnSi
   CNjXkbOnQXLlYeQ+/JSaBfdWg/v0h1Btr22nmb5PQHrThcKNcN3DjbgkK
   2wvxPpU5Zgb5N+wUfpyPbvtX0NbRCkxHqz0I0PiDWEefRRNRjp2+PgCcH
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="301734833"
X-IronPort-AV: E=Sophos;i="5.96,301,1665471600"; 
   d="scan'208";a="301734833"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2023 13:06:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="779336298"
X-IronPort-AV: E=Sophos;i="5.96,301,1665471600"; 
   d="scan'208";a="779336298"
Received: from lkp-server02.sh.intel.com (HELO f1920e93ebb5) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 04 Jan 2023 13:06:11 -0800
Received: from kbuild by f1920e93ebb5 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pDAxe-0000mH-0n;
        Wed, 04 Jan 2023 21:06:10 +0000
Date:   Thu, 05 Jan 2023 05:05:20 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 5bc3518dcb43178f69f650f50816be54c9ac4ddc
Message-ID: <63b5ea10.ajeWXgZx1mgqDMa6%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 5bc3518dcb43178f69f650f50816be54c9ac4ddc  gpiolib: sort header inclusion alphabetically

elapsed time: 720m

configs tested: 69
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
powerpc                           allnoconfig
x86_64                            allnoconfig
arc                                 defconfig
alpha                               defconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allmodconfig
s390                                defconfig
s390                             allmodconfig
m68k                             allyesconfig
sh                               allmodconfig
x86_64                           rhel-8.3-bpf
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
s390                             allyesconfig
mips                             allyesconfig
x86_64                              defconfig
powerpc                          allmodconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                               rhel-8.3
i386                 randconfig-a004-20230102
x86_64                           allyesconfig
i386                 randconfig-a003-20230102
x86_64                        randconfig-a006
i386                 randconfig-a001-20230102
i386                                defconfig
i386                 randconfig-a002-20230102
i386                 randconfig-a005-20230102
i386                 randconfig-a006-20230102
riscv                randconfig-r042-20230101
arc                  randconfig-r043-20230102
ia64                             allmodconfig
arm                  randconfig-r046-20230102
arc                  randconfig-r043-20230101
s390                 randconfig-r044-20230101
arm                                 defconfig
i386                             allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
arm64                            allyesconfig
arm                              allyesconfig
i386                          randconfig-c001

clang tested configs:
i386                 randconfig-a012-20230102
i386                 randconfig-a011-20230102
i386                 randconfig-a014-20230102
i386                 randconfig-a013-20230102
i386                 randconfig-a015-20230102
i386                 randconfig-a016-20230102
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
hexagon              randconfig-r041-20230102
s390                 randconfig-r044-20230102
hexagon              randconfig-r045-20230101
hexagon              randconfig-r045-20230102
arm                  randconfig-r046-20230101
riscv                randconfig-r042-20230102
hexagon              randconfig-r041-20230101
x86_64               randconfig-a011-20230102
x86_64               randconfig-a014-20230102
x86_64               randconfig-a012-20230102
x86_64               randconfig-a013-20230102
x86_64               randconfig-a015-20230102
x86_64               randconfig-a016-20230102
x86_64                          rhel-8.3-rust

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
