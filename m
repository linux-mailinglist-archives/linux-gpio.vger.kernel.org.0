Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8EF74678F31
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jan 2023 05:14:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229589AbjAXEOo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Jan 2023 23:14:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229502AbjAXEOn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Jan 2023 23:14:43 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9D152ED4F
        for <linux-gpio@vger.kernel.org>; Mon, 23 Jan 2023 20:14:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674533680; x=1706069680;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Vuu9SgHwdEBrxeL+iF8R3mcA5c6+CeKO2TvHf3NmuDc=;
  b=ARNT8+8xlBUQRMRrQtJO/32IFMlnU6kLj6fFWseQxSkVaLA+Zw4Jn8tB
   bzskg6QdWP1YnVZ/n17lcQShXs2tP8oKekCYgqNUPmmqtKW4B1nkBoy1i
   A+F40AlxPZDNrXOzI0F00CE55r7MYEHUC5oTTu8YHh0wyxZRfsDO/dzob
   +ZdVb/NQVlJqJBcAefpJJ7MHSnSWERCUcl/fQpTGLiKLvSX/+hZtRIIVv
   hDlqXm2Z9SHXxAzxpOEPKMt2C7bsnnEzLB0XyWV8Wb/civqYz0knNRTZU
   LNzuWnYbsSR+lNBmAE9CFCs+BS0LdkJZ5wMXPdMhS3zTo3W6S2AHB/9Eo
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="323918311"
X-IronPort-AV: E=Sophos;i="5.97,241,1669104000"; 
   d="scan'208";a="323918311"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 20:14:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="770179894"
X-IronPort-AV: E=Sophos;i="5.97,241,1669104000"; 
   d="scan'208";a="770179894"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 23 Jan 2023 20:14:39 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pKAhi-00067x-1h;
        Tue, 24 Jan 2023 04:14:38 +0000
Date:   Tue, 24 Jan 2023 12:14:10 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD REGRESSION
 de5f701724ac1078deaf19ca2aa8dbf4bcd4b04f
Message-ID: <63cf5b12.C/oyCJCz2CUOmJ9r%lkp@intel.com>
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
branch HEAD: de5f701724ac1078deaf19ca2aa8dbf4bcd4b04f  gpiolib: fix linker errors when GPIOLIB is disabled

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202301240409.tZdm0o0a-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202301240439.wYz6uU0k-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

include/linux/gpio/driver.h:779:33: error: function declaration isn't a prototype [-Werror=strict-prototypes]
include/linux/gpio/driver.h:782:33: error: variable has incomplete type 'enum gpio_lookup_flags'
include/linux/gpio/driver.h:782:68: error: parameter 4 ('lflags') has incomplete type
include/linux/gpio/driver.h:783:27: error: variable has incomplete type 'enum gpiod_flags'
include/linux/gpio/driver.h:783:62: error: parameter 5 ('dflags') has incomplete type

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- i386-defconfig
|   |-- include-linux-gpio-driver.h:error:function-declaration-isn-t-a-prototype
|   |-- include-linux-gpio-driver.h:error:parameter-(-dflags-)-has-incomplete-type
|   `-- include-linux-gpio-driver.h:error:parameter-(-lflags-)-has-incomplete-type
|-- nios2-defconfig
|   |-- include-linux-gpio-driver.h:error:function-declaration-isn-t-a-prototype
|   `-- include-linux-gpio-driver.h:error:parameter-(-lflags-)-has-incomplete-type
|-- powerpc-eiger_defconfig
|   |-- include-linux-gpio-driver.h:error:function-declaration-isn-t-a-prototype
|   `-- include-linux-gpio-driver.h:error:parameter-(-lflags-)-has-incomplete-type
|-- powerpc-ps3_defconfig
|   |-- include-linux-gpio-driver.h:error:function-declaration-isn-t-a-prototype
|   `-- include-linux-gpio-driver.h:error:parameter-(-lflags-)-has-incomplete-type
|-- powerpc-sam440ep_defconfig
|   |-- include-linux-gpio-driver.h:error:function-declaration-isn-t-a-prototype
|   `-- include-linux-gpio-driver.h:error:parameter-(-lflags-)-has-incomplete-type
`-- x86_64-defconfig
    |-- include-linux-gpio-driver.h:error:function-declaration-isn-t-a-prototype
    |-- include-linux-gpio-driver.h:error:parameter-(-dflags-)-has-incomplete-type
    `-- include-linux-gpio-driver.h:error:parameter-(-lflags-)-has-incomplete-type
clang_recent_errors
`-- i386-randconfig-a014-20230123
    |-- include-linux-gpio-driver.h:error:variable-has-incomplete-type-enum-gpio_lookup_flags
    `-- include-linux-gpio-driver.h:error:variable-has-incomplete-type-enum-gpiod_flags

elapsed time: 741m

configs tested: 67
configs skipped: 3

gcc tested configs:
x86_64                            allnoconfig
arc                                 defconfig
alpha                               defconfig
um                             i386_defconfig
um                           x86_64_defconfig
s390                                defconfig
powerpc                           allnoconfig
s390                             allmodconfig
s390                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
x86_64                              defconfig
m68k                             allyesconfig
sh                               allmodconfig
x86_64                               rhel-8.3
i386                                defconfig
x86_64               randconfig-a002-20230123
arm                                 defconfig
i386                 randconfig-a003-20230123
mips                             allyesconfig
x86_64                           allyesconfig
x86_64               randconfig-a005-20230123
powerpc                          allmodconfig
i386                 randconfig-a002-20230123
x86_64               randconfig-a001-20230123
x86_64               randconfig-a006-20230123
i386                 randconfig-a001-20230123
i386                 randconfig-a005-20230123
x86_64               randconfig-a004-20230123
i386                 randconfig-a006-20230123
arc                  randconfig-r043-20230123
x86_64               randconfig-a003-20230123
i386                 randconfig-a004-20230123
arm                              allyesconfig
arm                  randconfig-r046-20230123
arm64                            allyesconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-bpf
i386                             allyesconfig
ia64                             allmodconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests

clang tested configs:
i386                 randconfig-a012-20230123
i386                 randconfig-a013-20230123
x86_64               randconfig-a013-20230123
i386                 randconfig-a011-20230123
hexagon              randconfig-r041-20230123
x86_64               randconfig-a011-20230123
i386                 randconfig-a014-20230123
x86_64               randconfig-a012-20230123
i386                 randconfig-a016-20230123
hexagon              randconfig-r045-20230123
i386                 randconfig-a015-20230123
x86_64               randconfig-a014-20230123
x86_64               randconfig-a015-20230123
x86_64               randconfig-a016-20230123
s390                 randconfig-r044-20230123
riscv                randconfig-r042-20230123
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                          rhel-8.3-rust
powerpc                  mpc885_ads_defconfig
x86_64               randconfig-k001-20230123

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
