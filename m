Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2ED45678F22
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jan 2023 04:55:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230294AbjAXDzq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Jan 2023 22:55:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229896AbjAXDzp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Jan 2023 22:55:45 -0500
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 937BA13D5F
        for <linux-gpio@vger.kernel.org>; Mon, 23 Jan 2023 19:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674532544; x=1706068544;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=5/yoRyUiehCyMa6uIxeau+WY1UmAsIvohx4DrpCh0yc=;
  b=XnEl+KtLoN60g4UFcuI+NApSmjD+ANCtVxEYlFSEi6rs9dVQIudxPyWx
   uhDMnDM9IJQ1jmO/aVrk+UE7WZDOCGOiUD4MwHMTq+o+73vZd+N2XslAr
   Xdr59YzbICgC7FV9sfk6cIC1dYkAcEwus35CBRdcjHjsHKj80uUJk4Qz1
   1AGWNpulFXbE0L9qEFPfPCoyyYi6FWskYQTm/vkAIsgOSgMZY3DVbe3zY
   LZagr14b9tTqwWlyv7Osxfv1gSGOAW8v7yODCbUXtb3n2AkCUwp2FgPjG
   j2mhohIh90lj5E+KxNvxj1T9w65buGGr6ipbUMC6CF8AgFY3WLTHtwKpU
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="309801654"
X-IronPort-AV: E=Sophos;i="5.97,241,1669104000"; 
   d="scan'208";a="309801654"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 19:55:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="694200046"
X-IronPort-AV: E=Sophos;i="5.97,241,1669104000"; 
   d="scan'208";a="694200046"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 23 Jan 2023 19:55:42 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pKAPJ-00066v-0Q;
        Tue, 24 Jan 2023 03:55:37 +0000
Date:   Tue, 24 Jan 2023 11:54:48 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 5bb837ebcfe30c49fd68c4879fa086e8da71e0c5
Message-ID: <63cf5688.kTTfdtK3jbUH/Quo%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 5bb837ebcfe30c49fd68c4879fa086e8da71e0c5  gpio: mvebu: Use IS_REACHABLE instead of IS_ENABLED for CONFIG_PWM

elapsed time: 721m

configs tested: 62
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                            allnoconfig
powerpc                           allnoconfig
alpha                            allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
sh                               allmodconfig
arc                              allyesconfig
arc                                 defconfig
s390                             allmodconfig
mips                             allyesconfig
alpha                               defconfig
s390                                defconfig
s390                             allyesconfig
powerpc                          allmodconfig
ia64                             allmodconfig
arc                  randconfig-r043-20230123
arm                  randconfig-r046-20230123
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-bpf
arm                                 defconfig
i386                                defconfig
x86_64               randconfig-a002-20230123
x86_64               randconfig-a001-20230123
x86_64               randconfig-a004-20230123
x86_64               randconfig-a003-20230123
x86_64               randconfig-a005-20230123
x86_64               randconfig-a006-20230123
arm64                            allyesconfig
arm                              allyesconfig
i386                             allyesconfig
i386                 randconfig-a004-20230123
i386                 randconfig-a003-20230123
i386                 randconfig-a002-20230123
i386                 randconfig-a001-20230123
i386                 randconfig-a005-20230123
i386                 randconfig-a006-20230123

clang tested configs:
hexagon              randconfig-r041-20230123
hexagon              randconfig-r045-20230123
s390                 randconfig-r044-20230123
riscv                randconfig-r042-20230123
x86_64                          rhel-8.3-rust
i386                 randconfig-a012-20230123
x86_64               randconfig-a013-20230123
i386                 randconfig-a013-20230123
x86_64               randconfig-a011-20230123
i386                 randconfig-a011-20230123
x86_64               randconfig-a012-20230123
i386                 randconfig-a014-20230123
x86_64               randconfig-a014-20230123
x86_64               randconfig-a016-20230123
x86_64               randconfig-a015-20230123
i386                 randconfig-a015-20230123
i386                 randconfig-a016-20230123

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
