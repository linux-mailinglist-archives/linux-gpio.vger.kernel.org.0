Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4725766D19C
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jan 2023 23:15:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235113AbjAPWPw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Jan 2023 17:15:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235063AbjAPWPn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Jan 2023 17:15:43 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B793714E97
        for <linux-gpio@vger.kernel.org>; Mon, 16 Jan 2023 14:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673907340; x=1705443340;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=4XP75OuBLFY9jV7KS/x7rccrvbCTkHukCMcrdPcahEk=;
  b=GNTME4JeOpm/8XYRwopOzR6OJoshKrJHD7P5QRaGMQvLzosr40lQ5RK6
   1C8jH5cw70mDiv74AOtln9GOJynqQuxomObMY61HvwFs2NjT34qA+v7MZ
   cxTjgvf2+7SKj2JB7IpnhLPzbMChhFOL4SWoxvcmj+NjIV8/DAKb9xDvf
   zz8A4otOk14m1KEAy0HlOGuPaMj0O6xSWwONqp8LbS+ZdedyMTBmfviAe
   EtoGDQ3OgIRKnPBXwjrLntHv1nUQnjpCc22luyh0gSWmBSy3aReWLx46o
   41rAjV+m699XcYuIooSAPgNYKcqBxo8JdJKXS+Lrc66aPE4bqWdFThj8t
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="325837181"
X-IronPort-AV: E=Sophos;i="5.97,221,1669104000"; 
   d="scan'208";a="325837181"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2023 14:14:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="609049932"
X-IronPort-AV: E=Sophos;i="5.97,221,1669104000"; 
   d="scan'208";a="609049932"
Received: from lkp-server02.sh.intel.com (HELO f57cd993bc73) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 16 Jan 2023 14:14:11 -0800
Received: from kbuild by f57cd993bc73 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pHXk2-0000kP-1F;
        Mon, 16 Jan 2023 22:14:10 +0000
Date:   Tue, 17 Jan 2023 06:13:56 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 8d0674c8888e970a6169c2f2259e2bb215314990
Message-ID: <63c5cc24.BjBPMPkvfWniJ4vB%lkp@intel.com>
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
branch HEAD: 8d0674c8888e970a6169c2f2259e2bb215314990  gpio: rockchip: Do not mention legacy API in the code

elapsed time: 726m

configs tested: 68
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                            allnoconfig
ia64                             allmodconfig
arc                  randconfig-r043-20230115
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
arc                  randconfig-r043-20230116
x86_64                    rhel-8.3-kselftests
arm                  randconfig-r046-20230115
x86_64                          rhel-8.3-func
i386                 randconfig-a013-20230116
i386                 randconfig-a012-20230116
i386                 randconfig-a016-20230116
i386                 randconfig-a014-20230116
i386                 randconfig-a015-20230116
i386                 randconfig-a011-20230116
s390                 randconfig-r044-20230116
riscv                randconfig-r042-20230116
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
x86_64                           rhel-8.3-bpf
x86_64                         rhel-8.3-kunit
x86_64               randconfig-a011-20230116
x86_64               randconfig-a016-20230116
x86_64               randconfig-a014-20230116
x86_64               randconfig-a013-20230116
x86_64               randconfig-a015-20230116
x86_64               randconfig-a012-20230116
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
s390                                defconfig
s390                             allmodconfig
arc                                 defconfig
alpha                               defconfig
s390                             allyesconfig
um                           x86_64_defconfig
um                             i386_defconfig
i386                             allyesconfig
i386                                defconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig

clang tested configs:
hexagon              randconfig-r041-20230116
x86_64               randconfig-a001-20230116
hexagon              randconfig-r045-20230115
x86_64                          rhel-8.3-rust
riscv                randconfig-r042-20230115
x86_64               randconfig-a003-20230116
x86_64               randconfig-a004-20230116
arm                  randconfig-r046-20230116
x86_64               randconfig-a002-20230116
s390                 randconfig-r044-20230115
x86_64               randconfig-a005-20230116
hexagon              randconfig-r045-20230116
x86_64               randconfig-a006-20230116
hexagon              randconfig-r041-20230115
i386                 randconfig-a002-20230116
i386                 randconfig-a004-20230116
i386                 randconfig-a001-20230116
i386                 randconfig-a003-20230116
i386                 randconfig-a005-20230116
i386                 randconfig-a006-20230116

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
