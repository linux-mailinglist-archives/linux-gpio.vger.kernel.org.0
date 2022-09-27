Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE5285EB904
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Sep 2022 05:57:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229479AbiI0D51 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Sep 2022 23:57:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbiI0D50 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Sep 2022 23:57:26 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3D2B5D12B
        for <linux-gpio@vger.kernel.org>; Mon, 26 Sep 2022 20:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664251044; x=1695787044;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=H5X81LCs13ZW5R60IqcwwdETUuR5fI3mt014LPXueYo=;
  b=lywXkYf3y1YyDgEY/DQ1dQewtyElbk1Uf8hdUsCuDgezmogsOMnDgF6e
   lHSHmZrJf24u2tForNFC8OUPOqwYS7AeSnI8jV5WzP/GxX5aGm9EzXybL
   7j6w1hfRWXXmZfdNvrbJKaJvoDKm2b+WKVb/27tYqZRzlGcEnOcIAZNq7
   OOiF7ppkVwqzgJHaVvBiXCAzrJIBkjuSXRyoB2enl9h9XLHb4I7QWAKFG
   lLXoQF0/yQdftZMEye8HQDUGbxddrCxfPMQprnaXik7jilfdvin5j8PVE
   KYtRwuQzqnCKARw13AbAx50ebr4AhaC19VM9viCmEDwXv401nqFa5htHc
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="363041364"
X-IronPort-AV: E=Sophos;i="5.93,348,1654585200"; 
   d="scan'208";a="363041364"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2022 20:57:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="654568819"
X-IronPort-AV: E=Sophos;i="5.93,348,1654585200"; 
   d="scan'208";a="654568819"
Received: from lkp-server02.sh.intel.com (HELO dfa2c9fcd321) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 26 Sep 2022 20:57:23 -0700
Received: from kbuild by dfa2c9fcd321 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1od1ik-0000Zw-2h;
        Tue, 27 Sep 2022 03:57:22 +0000
Date:   Tue, 27 Sep 2022 11:56:54 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 0ae3109a839192920f09338e9abc4d5321107865
Message-ID: <63327486.HU9Rx6J2cQ0X+O0g%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 0ae3109a839192920f09338e9abc4d5321107865  gpiolib: cdev: add fdinfo output for line request file descriptors

elapsed time: 865m

configs tested: 63
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
alpha                               defconfig
s390                                defconfig
s390                             allmodconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
s390                             allyesconfig
x86_64                           rhel-8.3-syz
powerpc                           allnoconfig
x86_64                         rhel-8.3-kunit
powerpc                          allmodconfig
x86_64                           rhel-8.3-kvm
mips                             allyesconfig
x86_64                           allyesconfig
i386                                defconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allyesconfig
sh                               allmodconfig
arm                                 defconfig
i386                 randconfig-a001-20220926
i386                 randconfig-a002-20220926
arc                  randconfig-r043-20220925
x86_64                        randconfig-a013
i386                 randconfig-a003-20220926
x86_64                        randconfig-a011
i386                 randconfig-a004-20220926
i386                 randconfig-a006-20220926
x86_64                        randconfig-a015
i386                 randconfig-a005-20220926
riscv                randconfig-r042-20220925
x86_64                        randconfig-a004
arc                  randconfig-r043-20220926
x86_64                        randconfig-a002
s390                 randconfig-r044-20220925
x86_64                        randconfig-a006
i386                             allyesconfig
arm64                            allyesconfig
arm                              allyesconfig
ia64                             allmodconfig
m68k                             allmodconfig

clang tested configs:
hexagon              randconfig-r045-20220925
x86_64                        randconfig-a012
hexagon              randconfig-r041-20220926
x86_64                        randconfig-a014
hexagon              randconfig-r045-20220926
x86_64                        randconfig-a016
hexagon              randconfig-r041-20220925
riscv                randconfig-r042-20220926
x86_64                        randconfig-a001
s390                 randconfig-r044-20220926
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                 randconfig-a011-20220926
i386                 randconfig-a015-20220926
i386                 randconfig-a014-20220926
i386                 randconfig-a013-20220926
i386                 randconfig-a016-20220926
i386                 randconfig-a012-20220926

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
