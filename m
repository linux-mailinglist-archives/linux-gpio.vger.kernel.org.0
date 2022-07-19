Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F21B57A99F
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Jul 2022 00:06:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232225AbiGSWGi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Jul 2022 18:06:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229784AbiGSWGh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Jul 2022 18:06:37 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 224CF39B9A
        for <linux-gpio@vger.kernel.org>; Tue, 19 Jul 2022 15:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658268397; x=1689804397;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ldZV69E7faWdJYPqj0vIraP/QgGqcT5Jg6SOut5aakI=;
  b=L0/7g0JNz+N5h/ClGCv0cCfUEkWwzavAdxF1r2qSDXoxHJWtwMYMtgxm
   OinnnvxGcUekrFQ8tPDaZth0FVBGFdXDQ7gI1kHvLV9/KLmuAbmuMWHvd
   EjRoTgPS8JrfTIRqP2tLiuI0Gz9DehN1ljIHwiBeeSbbTXn8h4ejSOjDo
   sIJFyLDBR1WUTjeED6AmRS1nUPqNBDKCPvHq65siUNInHjm91BfEvIcbi
   ql5701qdDrgVhkO60FlIrUtnlwa6tGueeJnfyPy17Spv8Gj25Eal6RjDM
   PCtNBjB0g5Z8sk8wUY9nWsvRWnquvDwAy/I2n5pJ0mQ+vYU3rNM4u7Uvy
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10413"; a="266397122"
X-IronPort-AV: E=Sophos;i="5.92,285,1650956400"; 
   d="scan'208";a="266397122"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2022 15:06:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,285,1650956400"; 
   d="scan'208";a="924966023"
Received: from lkp-server02.sh.intel.com (HELO ff137eb26ff1) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 19 Jul 2022 15:06:35 -0700
Received: from kbuild by ff137eb26ff1 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1oDvMR-00069O-9L;
        Tue, 19 Jul 2022 22:06:35 +0000
Date:   Wed, 20 Jul 2022 06:06:25 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 b8c768ccdd8338504fb78370747728d5002b1b5a
Message-ID: <62d72ae1.4WmLUgrJJyuq/Xe8%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: b8c768ccdd8338504fb78370747728d5002b1b5a  gpio: pca953x: use the correct register address when regcache sync during init

elapsed time: 728m

configs tested: 52
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
ia64                             allmodconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
mips                             allyesconfig
sh                               allmodconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allyesconfig
i386                                defconfig
i386                             allyesconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
x86_64               randconfig-a013-20220718
x86_64               randconfig-a012-20220718
x86_64               randconfig-a014-20220718
x86_64               randconfig-a011-20220718
x86_64               randconfig-a015-20220718
x86_64               randconfig-a016-20220718
i386                 randconfig-a011-20220718
i386                 randconfig-a013-20220718
i386                 randconfig-a012-20220718
i386                 randconfig-a016-20220718
i386                 randconfig-a015-20220718
i386                 randconfig-a014-20220718
arc                  randconfig-r043-20220718
riscv                randconfig-r042-20220718
s390                 randconfig-r044-20220718
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz

clang tested configs:
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                 randconfig-a003-20220718
i386                 randconfig-a001-20220718
i386                 randconfig-a002-20220718
i386                 randconfig-a006-20220718
i386                 randconfig-a004-20220718
i386                 randconfig-a005-20220718
hexagon              randconfig-r041-20220718
hexagon              randconfig-r045-20220718

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
