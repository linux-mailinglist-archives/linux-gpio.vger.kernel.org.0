Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C99D67150B
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jan 2023 08:30:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229579AbjARHa3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 Jan 2023 02:30:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230186AbjARH0P (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Jan 2023 02:26:15 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A0B2875BE
        for <linux-gpio@vger.kernel.org>; Tue, 17 Jan 2023 22:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674024281; x=1705560281;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=BTUhRgVXGXYq3ghvqIaDzlRZAFDZRIkq18KEGunpYeM=;
  b=S6iC1i+Q5BP0ST7gUpzhbiFSYO1NlYD3/r5odW8XXOpln3808wuWA81I
   P5q9ZD5K3W9pdV8c1ODLSrceflkkeLnScexyO+/QF3eumuSwZY/GV+12h
   W+nsodyqd0vDI3IEbRvfN1whKd1nQRhU6JetNv6ba9t0zf8SdikiO4TGG
   IinEWkFq85CEcaEi+l46XduECOErxxfiSPz+0VCxn099NXNLaPqwgAyzq
   30kKYpHQ+IYEmfmoyGVzE21cdp3ZjRpTSIZiCgiV8+iSO5ywGeyssDGbZ
   3g82IplwyhJz+pNG0SnhOYr4luS4XL6bgDdrHR4umlCpsFOkfu/bwhhNn
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="323601064"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; 
   d="scan'208";a="323601064"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2023 22:44:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="904945978"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; 
   d="scan'208";a="904945978"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 17 Jan 2023 22:44:34 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pI2BV-00004Y-29;
        Wed, 18 Jan 2023 06:44:33 +0000
Date:   Wed, 18 Jan 2023 14:44:14 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 900a37df9d98e6868be71cdaf24f42b4d2b2d0a7
Message-ID: <63c7953e.TL+9CpJeXNGsgd0W%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 900a37df9d98e6868be71cdaf24f42b4d2b2d0a7  Merge branch 'devel' into for-next

elapsed time: 726m

configs tested: 94
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
powerpc                           allnoconfig
sh                               allmodconfig
mips                             allyesconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
ia64                             allmodconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
s390                             allyesconfig
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-bpf
i386                 randconfig-a014-20230116
powerpc                          allmodconfig
m68k                             allyesconfig
i386                 randconfig-a013-20230116
m68k                             allmodconfig
i386                 randconfig-a012-20230116
arc                              allyesconfig
i386                 randconfig-a011-20230116
alpha                            allyesconfig
x86_64                            allnoconfig
i386                 randconfig-a015-20230116
i386                 randconfig-a016-20230116
x86_64               randconfig-a011-20230116
x86_64               randconfig-a013-20230116
x86_64               randconfig-a012-20230116
x86_64               randconfig-a014-20230116
x86_64               randconfig-a015-20230116
x86_64               randconfig-a016-20230116
x86_64                              defconfig
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
i386                                defconfig
x86_64                               rhel-8.3
arm                                 defconfig
x86_64                           allyesconfig
arm                              allyesconfig
arm64                            allyesconfig
i386                             allyesconfig
i386                          randconfig-c001
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
riscv                randconfig-r042-20230116
arm                  randconfig-r046-20230117
s390                 randconfig-r044-20230116
arc                  randconfig-r043-20230117
arc                  randconfig-r043-20230116
arm                  randconfig-r046-20230115
arc                  randconfig-r043-20230115
m68k                          hp300_defconfig
arm                            lart_defconfig
i386                 randconfig-c001-20230116
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
powerpc                      bamboo_defconfig
arm                           imxrt_defconfig
powerpc                      makalu_defconfig
arm                        cerfcube_defconfig
ia64                        generic_defconfig
sh                 kfr2r09-romimage_defconfig
openrisc                         alldefconfig

clang tested configs:
x86_64                          rhel-8.3-rust
x86_64                        randconfig-k001
x86_64               randconfig-a003-20230116
x86_64               randconfig-a004-20230116
x86_64               randconfig-a006-20230116
x86_64               randconfig-a005-20230116
x86_64               randconfig-a001-20230116
x86_64               randconfig-a002-20230116
i386                 randconfig-a002-20230116
i386                 randconfig-a004-20230116
i386                 randconfig-a001-20230116
i386                 randconfig-a003-20230116
i386                 randconfig-a005-20230116
i386                 randconfig-a006-20230116
powerpc                      acadia_defconfig
arm                        magician_defconfig
riscv                             allnoconfig
arm                          sp7021_defconfig
powerpc                     ppa8548_defconfig
powerpc                     tqm8560_defconfig
arm                  colibri_pxa270_defconfig
arm                         hackkit_defconfig
mips                          malta_defconfig
mips                        qi_lb60_defconfig
arm                           sama7_defconfig
riscv                          rv32_defconfig
powerpc                    mvme5100_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
