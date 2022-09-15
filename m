Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B8065B9241
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Sep 2022 03:43:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229873AbiIOBnL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Sep 2022 21:43:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229910AbiIOBnK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Sep 2022 21:43:10 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB6108E0F9
        for <linux-gpio@vger.kernel.org>; Wed, 14 Sep 2022 18:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663206188; x=1694742188;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=EeuLywUjmVxWlBtO/ZKVaj5jbuEoW68RdyjNAVObHzw=;
  b=Tf19kThNFxsNVUcbDmycLsqcqHWd/MRH4DeoXB5/hSkQ4uvN58UYdNva
   6XTICqqmfxyIwbijnl4oaWKVxquV5nQW2NgCTGiuCNIzIb7y8ArJUCa+4
   bhVXVItZcwRFo6jRD59v3TLzKdC6cHzga0VCaEH5zELyuVLUCFfC6BXYs
   hoDMe9r83cMZGoLbaj9lTOmYg8aFcO9MQkZqw2ci3pfUPol/nBZIErqZ/
   fmbwVj0V4Tu0syivw4666sxjQv9ggrptXjYI6yWe/YGZUM+O0m8/broAm
   OChXO9CXhMe/tLodilOzmkW2pxQQCoqmuUD7BS7IDCjuSaa3XBQE2NucW
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10470"; a="296176258"
X-IronPort-AV: E=Sophos;i="5.93,316,1654585200"; 
   d="scan'208";a="296176258"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2022 18:43:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,316,1654585200"; 
   d="scan'208";a="862148113"
Received: from lkp-server01.sh.intel.com (HELO d6e6b7c4e5a2) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 14 Sep 2022 18:43:06 -0700
Received: from kbuild by d6e6b7c4e5a2 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oYduE-0000mZ-0z;
        Thu, 15 Sep 2022 01:43:06 +0000
Date:   Thu, 15 Sep 2022 09:42:46 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 f7d619e9ab851eb89ab50c9265504ed732d5bee2
Message-ID: <63228316.am9SG6kLvviGfIxO%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: f7d619e9ab851eb89ab50c9265504ed732d5bee2  gpio: mt7621: Switch to use platform_get_irq() function

elapsed time: 723m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
um                           x86_64_defconfig
um                             i386_defconfig
alpha                            allyesconfig
arc                              allyesconfig
powerpc                           allnoconfig
x86_64                              defconfig
powerpc                          allmodconfig
m68k                             allyesconfig
x86_64                               rhel-8.3
m68k                             allmodconfig
mips                             allyesconfig
arc                                 defconfig
s390                             allmodconfig
x86_64                           allyesconfig
alpha                               defconfig
sh                               allmodconfig
s390                                defconfig
arm                                 defconfig
s390                             allyesconfig
i386                                defconfig
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
x86_64                           rhel-8.3-kvm
arm                              allyesconfig
arm64                            allyesconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
arc                  randconfig-r043-20220914
x86_64                        randconfig-a006
x86_64                        randconfig-a011
i386                          randconfig-a014
ia64                             allmodconfig
i386                          randconfig-a012
i386                          randconfig-a016
i386                             allyesconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a015

clang tested configs:
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
hexagon              randconfig-r041-20220914
hexagon              randconfig-r045-20220914
x86_64                        randconfig-a001
x86_64                        randconfig-a003
riscv                randconfig-r042-20220914
x86_64                        randconfig-a005
s390                 randconfig-r044-20220914
i386                          randconfig-a013
i386                          randconfig-a015
i386                          randconfig-a011
x86_64                        randconfig-a012
x86_64                        randconfig-a016
x86_64                        randconfig-a014

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
