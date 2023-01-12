Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5FA346669E9
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Jan 2023 05:02:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235699AbjALECq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Jan 2023 23:02:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234552AbjALECo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Jan 2023 23:02:44 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A1B14BD6E
        for <linux-gpio@vger.kernel.org>; Wed, 11 Jan 2023 20:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673496164; x=1705032164;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=OmIG0dr20ACtt0XsdiyNHPkDn8bSZ+oR6irixTRSYSk=;
  b=DBcWFsCbKQScB63FVIPg1z76y9skMHPNbTZci/XcSchMx/JwQwFvlGTV
   dN7tui8+mBxnb3aJr10b80XQYjKGYgAt0oJgeRl6TeeLK8HV1gVH4L7dZ
   ECgCDrQG1gmek5Ll9bhWS/ReEtL/2l+Hga6Sr5uim4oNfhVlDPWeFAtSA
   3D61LfVfAG6sgmiDaXdIq1EiNQRXGSeywbULTrmsn7HFp/vGaUfEqyd6h
   Qsws3dUOrGIUC9NtgIKtrm7qY9EQQDDHu1ugdrEQpJEslwqJZO09BPWlb
   ZJ7lTq9Jh7Kk8LZdRhAXhZofiOBS7xUXDaR4mFgJEu7J555fvGGPBC2le
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="322309000"
X-IronPort-AV: E=Sophos;i="5.96,318,1665471600"; 
   d="scan'208";a="322309000"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2023 20:02:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="903025954"
X-IronPort-AV: E=Sophos;i="5.96,318,1665471600"; 
   d="scan'208";a="903025954"
Received: from lkp-server02.sh.intel.com (HELO f1920e93ebb5) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 11 Jan 2023 20:02:42 -0800
Received: from kbuild by f1920e93ebb5 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pFonV-0009mA-0I;
        Thu, 12 Jan 2023 04:02:37 +0000
Date:   Thu, 12 Jan 2023 12:02:29 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-gpio:gpio-descriptors-leds] BUILD SUCCESS
 fa735b86ac14b68a48a9a24ae23e34d24ebf03c7
Message-ID: <63bf8655.Rdp0JxcxNPbD+tiR%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git gpio-descriptors-leds
branch HEAD: fa735b86ac14b68a48a9a24ae23e34d24ebf03c7  ARM: OMAP1: Move h2 LEDs to GPIO lookup table

elapsed time: 726m

configs tested: 62
configs skipped: 94

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allyesconfig
i386                             allyesconfig
i386                                defconfig
x86_64                            allnoconfig
um                           x86_64_defconfig
um                             i386_defconfig
s390                                defconfig
s390                             allmodconfig
arc                                 defconfig
alpha                               defconfig
s390                             allyesconfig
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
x86_64                           rhel-8.3-bpf
x86_64                         rhel-8.3-kunit
arm64                            allyesconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
riscv                randconfig-r042-20230110
s390                 randconfig-r044-20230110
arc                  randconfig-r043-20230110
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
ia64                             allmodconfig
m68k                         amcore_defconfig
arm                        multi_v7_defconfig
sh                              ul2_defconfig
m68k                             alldefconfig
powerpc                 mpc85xx_cds_defconfig
powerpc                    klondike_defconfig
arm                          gemini_defconfig
powerpc                     tqm8548_defconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig

clang tested configs:
arm                  randconfig-r046-20230110
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
powerpc                        fsp2_defconfig
arm                         shannon_defconfig
hexagon              randconfig-r041-20230110
hexagon              randconfig-r045-20230110
arm                         s5pv210_defconfig
hexagon                          alldefconfig
powerpc                     ksi8560_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
