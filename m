Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D70E968AD96
	for <lists+linux-gpio@lfdr.de>; Sun,  5 Feb 2023 01:28:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229800AbjBEA2G (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 4 Feb 2023 19:28:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230023AbjBEA2G (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 4 Feb 2023 19:28:06 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F1701BCB
        for <linux-gpio@vger.kernel.org>; Sat,  4 Feb 2023 16:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675556883; x=1707092883;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=9SLDQPyf59Vdm6QMoGWpcmt2YZ3csAFXGPpYIYD5DB4=;
  b=ILy05lfZl7CTVfTZ6dlNtO/glAkFDdSuUeJZZrzTilv8E+SXgtRF7RR7
   M8c7CbJx1WUVW5KiZo6j5GvSTF2CQIaEbbYWorOkq8LEX9pmXukVa1T55
   KVqDPVWUxKbE2tPkMEkCmLL8OKF/ZxWcF81e0w1Sd2LpdYNeRE44VtXcS
   qifrMuZDdrv1rQ12vvs5xzUMioom2MEuZDA9KKRx6et5lPWJ8/BtdepRA
   qCzQeLLxnm8BvNZ75q4Z7zv7GpPr01kvHiKR84hKRkpDsrfbLHFcIOXJH
   GkF2F96ZAZrNwPbld5vK6ObVdKsWrivSEclqXhV2syEQeLqOthtyhhowA
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="327637828"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="327637828"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 16:28:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="696502351"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="696502351"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 04 Feb 2023 16:28:01 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pOSsz-0001bK-0B;
        Sun, 05 Feb 2023 00:28:01 +0000
Date:   Sun, 05 Feb 2023 08:27:38 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 2e539b735d8683097846b486c0fb093da5f27fbb
Message-ID: <63def7fa.x8sPB4GGKtpoEI8+%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 2e539b735d8683097846b486c0fb093da5f27fbb  gpio: tegra186: remove unneeded loop in tegra186_gpio_init_route_mapping()

elapsed time: 1673m

configs tested: 60
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
alpha                               defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
powerpc                           allnoconfig
mips                             allyesconfig
s390                             allmodconfig
s390                                defconfig
um                           x86_64_defconfig
sh                               allmodconfig
um                             i386_defconfig
m68k                             allmodconfig
alpha                            allyesconfig
arc                              allyesconfig
powerpc                          allmodconfig
s390                             allyesconfig
m68k                             allyesconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           rhel-8.3-bpf
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                           allyesconfig
arc                  randconfig-r043-20230204
s390                 randconfig-r044-20230204
riscv                randconfig-r042-20230204
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
i386                          randconfig-a003
i386                          randconfig-a001
i386                          randconfig-a005
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                                defconfig
i386                             allyesconfig
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
arm                                 defconfig

clang tested configs:
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
hexagon              randconfig-r041-20230204
arm                  randconfig-r046-20230204
hexagon              randconfig-r045-20230204
x86_64                          rhel-8.3-rust
i386                          randconfig-a002
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a006
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
