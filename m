Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1C4665D4B3
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Jan 2023 14:52:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239116AbjADNwP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Jan 2023 08:52:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235169AbjADNv5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Jan 2023 08:51:57 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49A3517061
        for <linux-gpio@vger.kernel.org>; Wed,  4 Jan 2023 05:51:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672840316; x=1704376316;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=qocJkUD/ciYuzavfAeipNQN4K5+/cCoQcxWouObKcts=;
  b=ebceTWBzC6LPc0AYSCCTlzceiirOjHtssTM61bSCVM5iB5BO8D/JP4dl
   EKzkBl+Zp6xL9fXfGqr3cJeH6cmytbdF5FiuGV3BXC7MdcMx8nWxnkrt/
   Mi8BkRg6oQgVJg2VUNC/v2MwIBJwvPpZYgLsnnT3QJgAtjnlqEX5QN0nR
   2f5GnyFTx9D6/qWdkKTjA69rVHNlxoBe3t4/ZT41Jw1ARpOg725GIjv9Z
   uhGp+yPPlav7f6KM2NCkzOR2e/l/qQbZwMwXOVGGvhIa9blkJ2xvtFXoE
   /G1sBHuVIKB4AmqklwLsguo7C+AW/6Fu43ubyNRM/4iThD6F0+RrvV3x5
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="323172576"
X-IronPort-AV: E=Sophos;i="5.96,300,1665471600"; 
   d="scan'208";a="323172576"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2023 05:51:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="762676077"
X-IronPort-AV: E=Sophos;i="5.96,300,1665471600"; 
   d="scan'208";a="762676077"
Received: from lkp-server02.sh.intel.com (HELO f1920e93ebb5) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 04 Jan 2023 05:51:53 -0800
Received: from kbuild by f1920e93ebb5 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pD4BM-0000PP-2O;
        Wed, 04 Jan 2023 13:51:52 +0000
Date:   Wed, 04 Jan 2023 21:51:32 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 14277fa3ac144dc71390b7057bdffbc3889e7f03
Message-ID: <63b58464.pxlB5inWee+gwIcm%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 14277fa3ac144dc71390b7057bdffbc3889e7f03  Merge branch 'devel' into for-next

elapsed time: 726m

configs tested: 72
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                            allnoconfig
powerpc                           allnoconfig
sh                               allmodconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
mips                             allyesconfig
s390                                defconfig
um                             i386_defconfig
i386                 randconfig-a004-20230102
i386                 randconfig-a003-20230102
i386                 randconfig-a002-20230102
s390                             allyesconfig
i386                 randconfig-a001-20230102
um                           x86_64_defconfig
x86_64                              defconfig
i386                 randconfig-a006-20230102
i386                 randconfig-a005-20230102
powerpc                          allmodconfig
arm                                 defconfig
ia64                             allmodconfig
x86_64                               rhel-8.3
x86_64                           rhel-8.3-bpf
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                           allyesconfig
i386                                defconfig
alpha                            allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
arm64                            allyesconfig
arc                              allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
arm                              allyesconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
riscv                randconfig-r042-20230101
s390                 randconfig-r044-20230101
arc                  randconfig-r043-20230102
i386                             allyesconfig
arm                  randconfig-r046-20230102
arc                  randconfig-r043-20230101
powerpc                     redwood_defconfig
powerpc                 mpc8540_ads_defconfig
arm                        shmobile_defconfig
powerpc                    klondike_defconfig

clang tested configs:
i386                 randconfig-a012-20230102
i386                 randconfig-a011-20230102
i386                 randconfig-a014-20230102
i386                 randconfig-a013-20230102
i386                 randconfig-a015-20230102
i386                 randconfig-a016-20230102
x86_64               randconfig-a011-20230102
x86_64               randconfig-a014-20230102
x86_64               randconfig-a012-20230102
x86_64               randconfig-a013-20230102
x86_64               randconfig-a015-20230102
x86_64               randconfig-a016-20230102
x86_64                          rhel-8.3-rust
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

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
