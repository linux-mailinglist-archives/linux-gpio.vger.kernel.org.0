Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E97D63CCA5
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Nov 2022 01:51:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229845AbiK3Avw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Nov 2022 19:51:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229641AbiK3Avw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Nov 2022 19:51:52 -0500
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C77726A
        for <linux-gpio@vger.kernel.org>; Tue, 29 Nov 2022 16:51:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669769511; x=1701305511;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=2/LwrSN+rajkAnk8/6BvvPewvsYI+B7m96MMsQscd7s=;
  b=O/eMUHCRf8I6VYM88w5PRi7YFiQ6/ZS//my3BIVihC57Iv0ccwK94zkO
   +gbfSi0BPVoqs8Wqn1l2AFqtay/EsL/qeeio/FCtoMM2X5vSC7VFx4UJj
   9/uRctMDIOJHZoj10n0PfwL76h+cBVYh8oZNkTQ3771acZto2t2RBTlcP
   z8ARKeclbmWaIeAMpS++ILO6dwBGb02JMMiyQnwzuLuFJsNDaNu4eINf5
   p6VRvlsm9WrDFZ+iN2mFovfGPiX17Oid/yNe7rfvTZd34GfZCsa1ePmhg
   zsL/C7iNkkf5k7F43J7P1bH5cGAq1dtZueMIN8em8Q0rNdPLhe5ZtvKx2
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10546"; a="298637807"
X-IronPort-AV: E=Sophos;i="5.96,204,1665471600"; 
   d="scan'208";a="298637807"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2022 16:50:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10546"; a="889081117"
X-IronPort-AV: E=Sophos;i="5.96,204,1665471600"; 
   d="scan'208";a="889081117"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 29 Nov 2022 16:50:08 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1p0BId-0009ED-36;
        Wed, 30 Nov 2022 00:50:07 +0000
Date:   Wed, 30 Nov 2022 08:49:43 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 4ef339bc053a62dac9017f80f7bb8cff0412bd29
Message-ID: <6386a8a7.zGiBXK9yn7tG7dD9%lkp@intel.com>
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
branch HEAD: 4ef339bc053a62dac9017f80f7bb8cff0412bd29  gpiolib: Unify access to the device properties

elapsed time: 1732m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
powerpc                           allnoconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
sh                               allmodconfig
mips                             allyesconfig
arc                  randconfig-r043-20221128
powerpc                          allmodconfig
m68k                             allmodconfig
x86_64                              defconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allyesconfig
i386                 randconfig-a002-20221128
i386                 randconfig-a003-20221128
i386                 randconfig-a001-20221128
i386                 randconfig-a005-20221128
i386                 randconfig-a004-20221128
x86_64                               rhel-8.3
i386                 randconfig-a006-20221128
x86_64                           allyesconfig
i386                                defconfig
ia64                             allmodconfig
x86_64               randconfig-a001-20221128
x86_64               randconfig-a003-20221128
x86_64               randconfig-a004-20221128
x86_64               randconfig-a002-20221128
x86_64               randconfig-a005-20221128
x86_64               randconfig-a006-20221128
i386                             allyesconfig
arc                                 defconfig
alpha                               defconfig
s390                             allmodconfig
s390                                defconfig
s390                             allyesconfig
arm                                 defconfig
arm                              allyesconfig
arm64                            allyesconfig

clang tested configs:
hexagon              randconfig-r041-20221128
riscv                randconfig-r042-20221128
hexagon              randconfig-r045-20221128
s390                 randconfig-r044-20221128
x86_64               randconfig-a012-20221128
x86_64               randconfig-a014-20221128
x86_64               randconfig-a011-20221128
x86_64               randconfig-a013-20221128
x86_64               randconfig-a016-20221128
x86_64               randconfig-a015-20221128
i386                 randconfig-a012-20221128
i386                 randconfig-a015-20221128
i386                 randconfig-a011-20221128
i386                 randconfig-a013-20221128
i386                 randconfig-a014-20221128
i386                 randconfig-a016-20221128

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
