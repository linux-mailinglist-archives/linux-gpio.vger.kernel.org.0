Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76D525BF617
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Sep 2022 08:12:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229635AbiIUGMK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Sep 2022 02:12:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229612AbiIUGMJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Sep 2022 02:12:09 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A2117F0B9
        for <linux-gpio@vger.kernel.org>; Tue, 20 Sep 2022 23:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663740728; x=1695276728;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=yM1mtnTm+JKN+tcXNcPMtltVlKO0jk9jhnxWTzF+VIo=;
  b=cqcKgXWuAmWtBZjBCTZpxgEkAEIb6oBaHyp61HE+RGWfATDv+vOlvHBE
   JI2+bmw5QQ14PChBz7Y3xVj8Y0cucKiaEfCY/IDhSn1dcRthxK+t8PK/y
   CoWWn9xeNLyVj6NWBSXPfDNyvvPDBILH0mTUbdRVA8vw1ixqYmVo6qO/I
   UswhY7Ii1YOFC/c+vlLLAOXY8xiCg0FGYbtgOonmYjtiuzg03ZLl/RGDc
   OzoxOoik9VkZeRfMak+H8F4DTeHnFb5PCqDmUuX3K2X9Zsg39oUpLYkGf
   Qkco60v9y3wRoJCNO90cbl8xOc+fgy/hBjeyC+A3+VM/QZLvmIFOjaIin
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10476"; a="386196528"
X-IronPort-AV: E=Sophos;i="5.93,332,1654585200"; 
   d="scan'208";a="386196528"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2022 23:12:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,332,1654585200"; 
   d="scan'208";a="948003249"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 20 Sep 2022 23:12:07 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oasxq-0003J9-0o;
        Wed, 21 Sep 2022 06:12:06 +0000
Date:   Wed, 21 Sep 2022 14:11:54 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 ab637d48363d7b8ee67ae089808a8bc6051d53c4
Message-ID: <632aab2a.ukvReE9jWG1EseNT%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: ab637d48363d7b8ee67ae089808a8bc6051d53c4  gpio: ftgpio010: Make irqchip immutable

elapsed time: 723m

configs tested: 73
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                          allmodconfig
mips                             allyesconfig
um                           x86_64_defconfig
powerpc                           allnoconfig
um                             i386_defconfig
sh                               allmodconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
s390                             allyesconfig
m68k                             allyesconfig
i386                                defconfig
arc                  randconfig-r043-20220921
riscv                randconfig-r042-20220921
s390                 randconfig-r044-20220921
i386                             allyesconfig
ia64                        generic_defconfig
sh                   rts7751r2dplus_defconfig
sh                          rsk7203_defconfig
nios2                         3c120_defconfig
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
x86_64                           rhel-8.3-kvm
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
arm                          simpad_defconfig
powerpc                    sam440ep_defconfig
sh                             espt_defconfig
arm                            xcep_defconfig
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
x86_64                              defconfig
ia64                          tiger_defconfig
powerpc                  iss476-smp_defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
m68k                            q40_defconfig
sparc                       sparc64_defconfig
openrisc                         alldefconfig
ia64                             allmodconfig
i386                          randconfig-a003
i386                          randconfig-a001
i386                          randconfig-a005
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func

clang tested configs:
hexagon              randconfig-r041-20220921
hexagon              randconfig-r045-20220921
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64                        randconfig-k001
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
