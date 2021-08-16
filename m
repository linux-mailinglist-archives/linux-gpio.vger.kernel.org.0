Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C57A3ED3E0
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Aug 2021 14:26:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229676AbhHPM0z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Aug 2021 08:26:55 -0400
Received: from mga07.intel.com ([134.134.136.100]:50881 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229600AbhHPM0z (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 16 Aug 2021 08:26:55 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10077"; a="279590761"
X-IronPort-AV: E=Sophos;i="5.84,324,1620716400"; 
   d="scan'208";a="279590761"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2021 05:26:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,324,1620716400"; 
   d="scan'208";a="592735522"
Received: from lkp-server01.sh.intel.com (HELO d053b881505b) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 16 Aug 2021 05:26:19 -0700
Received: from kbuild by d053b881505b with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mFbh4-000QeA-U9; Mon, 16 Aug 2021 12:26:18 +0000
Date:   Mon, 16 Aug 2021 20:25:56 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [gpio:gpiochip-no-driver-h] BUILD REGRESSION
 3357a6b5d4c178fcbe95eb72c4e653b3a5b41569
Message-ID: <611a5954.JCw6KCj4iiIRDOFV%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git gpiochip-no-driver-h
branch HEAD: 3357a6b5d4c178fcbe95eb72c4e653b3a5b41569  See what explodes if we apply this patch

Error/Warning reports:

https://lore.kernel.org/linux-gpio/202108161000.8tMhP8zb-lkp@intel.com
https://lore.kernel.org/linux-gpio/202108161021.d0uh6KDo-lkp@intel.com
https://lore.kernel.org/linux-gpio/202108161032.H1ht6WyJ-lkp@intel.com

Error/Warning in current branch:

drivers/input/keyboard/adp5589-keys.c:391:23: warning: incompatible integer to pointer conversion initializing 'struct adp5589_kpad *' with an expression of type 'int' [-Wint-conversion]
drivers/media/dvb-frontends/cxd2820r_core.c:424:24: warning: incompatible integer to pointer conversion initializing 'struct cxd2820r_priv *' with an expression of type 'int' [-Wint-conversion]
drivers/media/dvb-frontends/cxd2820r_core.c:424:31: error: implicit declaration of function 'gpiochip_get_data' [-Werror,-Wimplicit-function-declaration]
drivers/media/dvb-frontends/cxd2820r_core.c:660:9: error: implicit declaration of function 'gpiochip_add_data' [-Werror,-Wimplicit-function-declaration]
drivers/media/dvb-frontends/cxd2820r_core.c:716:3: error: implicit declaration of function 'gpiochip_remove' [-Werror,-Wimplicit-function-declaration]
drivers/media/dvb-frontends/cxd2820r_priv.h:46:19: error: field has incomplete type 'struct gpio_chip'
include/linux/gpio/driver.h:704:19: error: conflicting types for 'gpiod_to_chip'; have 'struct gpio_chip *(const struct gpio_desc *)'

possible Error/Warning in current branch:

arch/arm/mach-s3c/h1940.h:28:41: warning: excess elements in struct initializer
arch/arm/mach-s3c/mach-h1940.c:159:15: error: variable 'h1940_latch_gpiochip' has initializer but incomplete type
arch/arm/mach-s3c/mach-h1940.c:159:25: error: storage size of 'h1940_latch_gpiochip' isn't known
arch/arm/mach-s3c/mach-h1940.c:160:10: error: 'struct gpio_chip' has no member named 'base'
arch/arm/mach-s3c/mach-h1940.c:161:10: error: 'struct gpio_chip' has no member named 'owner'
arch/arm/mach-s3c/mach-h1940.c:162:10: error: 'struct gpio_chip' has no member named 'label'
arch/arm/mach-s3c/mach-h1940.c:162:35: warning: excess elements in struct initializer
arch/arm/mach-s3c/mach-h1940.c:163:10: error: 'struct gpio_chip' has no member named 'ngpio'
arch/arm/mach-s3c/mach-h1940.c:164:10: error: 'struct gpio_chip' has no member named 'direction_output'
arch/arm/mach-s3c/mach-h1940.c:165:10: error: 'struct gpio_chip' has no member named 'set'
arch/arm/mach-s3c/mach-h1940.c:166:10: error: 'struct gpio_chip' has no member named 'get'
arch/arm/mach-s3c/mach-h1940.c:707:17: error: implicit declaration of function 'gpiochip_add_data' [-Werror=implicit-function-declaration]
arch/arm/mach-s3c/s3c64xx.c:212:13: error: implicit declaration of function 'of_have_populated_dt' [-Werror=implicit-function-declaration]
drivers/gpio/gpio-ucb1400.c:14:7: warning: incompatible integer to pointer conversion assigning to 'struct ucb1400_gpio *' from 'int' [-Wint-conversion]
drivers/gpio/gpio-ucb1400.c:14:9: error: implicit declaration of function 'gpiochip_get_data' [-Werror,-Wimplicit-function-declaration]
drivers/gpio/gpio-ucb1400.c:66:8: error: implicit declaration of function 'devm_gpiochip_add_data' [-Werror,-Wimplicit-function-declaration]
drivers/input/keyboard/adp5588-keys.c:213:10: error: implicit declaration of function 'gpiochip_add_data' [-Werror,-Wimplicit-function-declaration]
drivers/input/keyboard/adp5588-keys.c:213:10: error: implicit declaration of function 'gpiochip_add_data' [-Werror=implicit-function-declaration]
drivers/input/keyboard/adp5588-keys.c:213:17: error: implicit declaration of function 'gpiochip_add_data' [-Werror=implicit-function-declaration]
drivers/input/keyboard/adp5588-keys.c:254:2: error: implicit declaration of function 'gpiochip_remove' [-Werror,-Wimplicit-function-declaration]
drivers/input/keyboard/adp5588-keys.c:254:2: error: implicit declaration of function 'gpiochip_remove' [-Werror=implicit-function-declaration]
drivers/input/keyboard/adp5588-keys.c:254:9: error: implicit declaration of function 'gpiochip_remove' [-Werror=implicit-function-declaration]
drivers/input/keyboard/adp5588-keys.c:254:9: error: implicit declaration of function 'gpiochip_remove'; did you mean 'proc_remove'? [-Werror=implicit-function-declaration]
drivers/input/keyboard/adp5588-keys.c:51:19: error: field 'gc' has incomplete type
drivers/input/keyboard/adp5588-keys.c:51:19: error: field has incomplete type 'struct gpio_chip'
drivers/input/keyboard/adp5588-keys.c:51:26: error: field 'gc' has incomplete type
drivers/input/keyboard/adp5588-keys.c:76:23: warning: incompatible integer to pointer conversion initializing 'struct adp5588_kpad *' with an expression of type 'int' [-Wint-conversion]
drivers/input/keyboard/adp5588-keys.c:76:30: error: implicit declaration of function 'gpiochip_get_data' [-Werror,-Wimplicit-function-declaration]
drivers/input/keyboard/adp5588-keys.c:76:30: error: implicit declaration of function 'gpiochip_get_data'; did you mean 'acpi_get_data'? [-Werror=implicit-function-declaration]
drivers/input/keyboard/adp5588-keys.c:76:30: warning: initialization of 'struct adp5588_kpad *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
drivers/input/keyboard/adp5588-keys.c:76:37: error: implicit declaration of function 'gpiochip_get_data'; did you mean 'acpi_get_data'? [-Werror=implicit-function-declaration]
drivers/input/keyboard/adp5588-keys.c:76:37: warning: initialization of 'struct adp5588_kpad *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
drivers/input/keyboard/adp5589-keys.c:243:19: error: field 'gc' has incomplete type
drivers/input/keyboard/adp5589-keys.c:243:19: error: field has incomplete type 'struct gpio_chip'
drivers/input/keyboard/adp5589-keys.c:243:26: error: field 'gc' has incomplete type
drivers/input/keyboard/adp5589-keys.c:391:30: error: implicit declaration of function 'gpiochip_get_data' [-Werror,-Wimplicit-function-declaration]
drivers/input/keyboard/adp5589-keys.c:391:30: error: implicit declaration of function 'gpiochip_get_data'; did you mean 'acpi_get_data'? [-Werror=implicit-function-declaration]
drivers/input/keyboard/adp5589-keys.c:391:30: warning: initialization of 'struct adp5589_kpad *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
drivers/input/keyboard/adp5589-keys.c:391:37: error: implicit declaration of function 'gpiochip_get_data'; did you mean 'acpi_get_data'? [-Werror=implicit-function-declaration]
drivers/input/keyboard/adp5589-keys.c:391:37: warning: initialization of 'struct adp5589_kpad *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
drivers/input/keyboard/adp5589-keys.c:528:10: error: implicit declaration of function 'devm_gpiochip_add_data' [-Werror,-Wimplicit-function-declaration]
drivers/input/keyboard/adp5589-keys.c:528:10: error: implicit declaration of function 'devm_gpiochip_add_data' [-Werror=implicit-function-declaration]
drivers/input/keyboard/adp5589-keys.c:528:17: error: implicit declaration of function 'devm_gpiochip_add_data' [-Werror=implicit-function-declaration]
drivers/media/dvb-frontends/cxd2820r_core.c:424:31: error: implicit declaration of function 'gpiochip_get_data'; did you mean 'acpi_get_data'? [-Werror=implicit-function-declaration]
drivers/media/dvb-frontends/cxd2820r_core.c:424:31: warning: initialization of 'struct cxd2820r_priv *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
drivers/media/dvb-frontends/cxd2820r_core.c:424:38: error: implicit declaration of function 'gpiochip_get_data'; did you mean 'acpi_get_data'? [-Werror=implicit-function-declaration]
drivers/media/dvb-frontends/cxd2820r_core.c:424:38: warning: initialization of 'struct cxd2820r_priv *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
drivers/media/dvb-frontends/cxd2820r_core.c:660:23: error: implicit declaration of function 'gpiochip_add_data' [-Werror=implicit-function-declaration]
drivers/media/dvb-frontends/cxd2820r_core.c:660:9: error: implicit declaration of function 'gpiochip_add_data' [-Werror=implicit-function-declaration]
drivers/media/dvb-frontends/cxd2820r_core.c:716:17: error: implicit declaration of function 'gpiochip_remove' [-Werror=implicit-function-declaration]
drivers/media/dvb-frontends/cxd2820r_core.c:716:17: error: implicit declaration of function 'gpiochip_remove'; did you mean 'proc_remove'? [-Werror=implicit-function-declaration]
drivers/media/dvb-frontends/cxd2820r_core.c:716:3: error: implicit declaration of function 'gpiochip_remove' [-Werror=implicit-function-declaration]
drivers/media/dvb-frontends/cxd2820r_priv.h:46:19: error: field 'gpio_chip' has incomplete type
drivers/media/dvb-frontends/cxd2820r_priv.h:46:26: error: field 'gpio_chip' has incomplete type
drivers/mfd/htc-i2cpld.c:216:22: warning: incompatible integer to pointer conversion initializing 'struct htcpld_chip *' with an expression of type 'int' [-Wint-conversion]
drivers/mfd/htc-i2cpld.c:216:34: error: implicit declaration of function 'gpiochip_get_data'; did you mean 'acpi_get_data'? [-Werror=implicit-function-declaration]
drivers/mfd/htc-i2cpld.c:216:34: warning: initialization of 'struct htcpld_chip *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
drivers/mfd/htc-i2cpld.c:216:41: error: implicit declaration of function 'gpiochip_get_data'; did you mean 'acpi_get_data'? [-Werror=implicit-function-declaration]
drivers/mfd/htc-i2cpld.c:216:41: error: implicit declaration of function 'gpiochip_get_data'; did you mean 'ioasid_set_data'? [-Werror=implicit-function-declaration]
drivers/mfd/htc-i2cpld.c:216:41: warning: initialization of 'struct htcpld_chip *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
drivers/mfd/htc-i2cpld.c:248:26: error: invalid use of undefined type 'struct gpio_chip'
drivers/mfd/htc-i2cpld.c:37:26: error: field 'chip_out' has incomplete type
drivers/mfd/htc-i2cpld.c:37:33: error: field 'chip_out' has incomplete type
drivers/mfd/htc-i2cpld.c:41:26: error: field 'chip_in' has incomplete type
drivers/mfd/htc-i2cpld.c:41:33: error: field 'chip_in' has incomplete type
drivers/mfd/htc-i2cpld.c:436:15: error: implicit declaration of function 'gpiochip_add_data' [-Werror=implicit-function-declaration]
drivers/mfd/htc-i2cpld.c:436:8: error: implicit declaration of function 'gpiochip_add_data' [-Werror=implicit-function-declaration]
drivers/mfd/htc-i2cpld.c:447:17: error: implicit declaration of function 'gpiochip_remove' [-Werror=implicit-function-declaration]
drivers/mfd/htc-i2cpld.c:447:17: error: implicit declaration of function 'gpiochip_remove'; did you mean 'proc_remove'? [-Werror=implicit-function-declaration]
drivers/mfd/htc-i2cpld.c:447:3: error: implicit declaration of function 'gpiochip_remove' [-Werror=implicit-function-declaration]
drivers/net/ethernet/broadcom/tg3.c:17754:33: warning: shift count >= width of type [-Wshift-count-overflow]
include/asm-generic/gpio.h:58:16: error: implicit declaration of function 'gpiod_to_chip'; did you mean 'gpio_to_chip'? [-Werror=implicit-function-declaration]
include/asm-generic/gpio.h:58:16: warning: returning 'int' from a function with return type 'struct gpio_chip *' makes pointer from integer without a cast [-Wint-conversion]
include/asm-generic/gpio.h:58:9: error: implicit declaration of function 'gpiod_to_chip' [-Werror,-Wimplicit-function-declaration]
include/asm-generic/gpio.h:58:9: error: implicit declaration of function 'gpiod_to_chip'; did you mean 'gpio_to_chip'? [-Werror=implicit-function-declaration]
include/asm-generic/gpio.h:58:9: warning: incompatible integer to pointer conversion returning 'int' from a function with result type 'struct gpio_chip *' [-Wint-conversion]
include/asm-generic/gpio.h:58:9: warning: returning 'int' from a function with return type 'struct gpio_chip *' makes pointer from integer without a cast [-Wint-conversion]
include/linux/bcma/bcma_driver_chipcommon.h:647:19: error: field has incomplete type 'struct gpio_chip'
include/linux/export.h:19:21: warning: excess elements in struct initializer
include/linux/gpio/driver.h:704:19: error: conflicting types for 'gpiod_to_chip'
include/linux/gpio/driver.h:708:19: error: conflicting types for 'gpiod_to_chip'
include/linux/gpio/driver.h:708:19: error: conflicting types for 'gpiod_to_chip'; have 'struct gpio_chip *(const struct gpio_desc *)'
include/linux/spi/max7301.h:16:19: error: field 'chip' has incomplete type
include/linux/spi/max7301.h:16:19: error: field has incomplete type 'struct gpio_chip'
include/linux/spi/max7301.h:16:26: error: field 'chip' has incomplete type
include/linux/ssb/ssb.h:496:19: error: field has incomplete type 'struct gpio_chip'
include/linux/ucb1400.h:84:19: error: field has incomplete type 'struct gpio_chip'

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   |-- drivers-input-keyboard-adp5588-keys.c:error:field-gc-has-incomplete-type
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-input-keyboard-adp5588-keys.c:warning:initialization-of-struct-adp5588_kpad-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-input-keyboard-adp5589-keys.c:error:field-gc-has-incomplete-type
|   |-- drivers-input-keyboard-adp5589-keys.c:error:implicit-declaration-of-function-devm_gpiochip_add_data
|   |-- drivers-input-keyboard-adp5589-keys.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-input-keyboard-adp5589-keys.c:warning:initialization-of-struct-adp5589_kpad-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:warning:initialization-of-struct-cxd2820r_priv-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-media-dvb-frontends-cxd2820r_priv.h:error:field-gpio_chip-has-incomplete-type
|   |-- drivers-mfd-htc-i2cpld.c:error:field-chip_in-has-incomplete-type
|   |-- drivers-mfd-htc-i2cpld.c:error:field-chip_out-has-incomplete-type
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-mfd-htc-i2cpld.c:error:invalid-use-of-undefined-type-struct-gpio_chip
|   |-- drivers-mfd-htc-i2cpld.c:warning:initialization-of-struct-htcpld_chip-from-int-makes-pointer-from-integer-without-a-cast
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip
|   |-- include-asm-generic-gpio.h:warning:returning-int-from-a-function-with-return-type-struct-gpio_chip-makes-pointer-from-integer-without-a-cast
|   `-- include-linux-gpio-driver.h:error:conflicting-types-for-gpiod_to_chip-have-struct-gpio_chip-(const-struct-gpio_desc-)
|-- alpha-randconfig-s031-20210816
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip
|   |-- include-asm-generic-gpio.h:warning:returning-int-from-a-function-with-return-type-struct-gpio_chip-makes-pointer-from-integer-without-a-cast
|   `-- include-linux-gpio-driver.h:error:conflicting-types-for-gpiod_to_chip-have-struct-gpio_chip-(const-struct-gpio_desc-)
|-- arc-allyesconfig
|   |-- drivers-input-keyboard-adp5588-keys.c:error:field-gc-has-incomplete-type
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-input-keyboard-adp5588-keys.c:warning:initialization-of-struct-adp5588_kpad-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-input-keyboard-adp5589-keys.c:error:field-gc-has-incomplete-type
|   |-- drivers-input-keyboard-adp5589-keys.c:error:implicit-declaration-of-function-devm_gpiochip_add_data
|   |-- drivers-input-keyboard-adp5589-keys.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-input-keyboard-adp5589-keys.c:warning:initialization-of-struct-adp5589_kpad-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:warning:initialization-of-struct-cxd2820r_priv-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-media-dvb-frontends-cxd2820r_priv.h:error:field-gpio_chip-has-incomplete-type
|   |-- drivers-mfd-htc-i2cpld.c:error:field-chip_in-has-incomplete-type
|   |-- drivers-mfd-htc-i2cpld.c:error:field-chip_out-has-incomplete-type
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-mfd-htc-i2cpld.c:error:invalid-use-of-undefined-type-struct-gpio_chip
|   |-- drivers-mfd-htc-i2cpld.c:warning:initialization-of-struct-htcpld_chip-from-int-makes-pointer-from-integer-without-a-cast
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip
|   |-- include-asm-generic-gpio.h:warning:returning-int-from-a-function-with-return-type-struct-gpio_chip-makes-pointer-from-integer-without-a-cast
|   `-- include-linux-gpio-driver.h:error:conflicting-types-for-gpiod_to_chip-have-struct-gpio_chip-(const-struct-gpio_desc-)
|-- arc-randconfig-c023-20210816
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:warning:initialization-of-struct-cxd2820r_priv-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-media-dvb-frontends-cxd2820r_priv.h:error:field-gpio_chip-has-incomplete-type
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip
|   |-- include-asm-generic-gpio.h:warning:returning-int-from-a-function-with-return-type-struct-gpio_chip-makes-pointer-from-integer-without-a-cast
|   `-- include-linux-gpio-driver.h:error:conflicting-types-for-gpiod_to_chip-have-struct-gpio_chip-(const-struct-gpio_desc-)
|-- arc-randconfig-r006-20210816
|   |-- drivers-input-keyboard-adp5589-keys.c:error:field-gc-has-incomplete-type
|   |-- drivers-input-keyboard-adp5589-keys.c:error:implicit-declaration-of-function-devm_gpiochip_add_data
|   |-- drivers-input-keyboard-adp5589-keys.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-input-keyboard-adp5589-keys.c:warning:initialization-of-struct-adp5589_kpad-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-mfd-htc-i2cpld.c:error:field-chip_in-has-incomplete-type
|   |-- drivers-mfd-htc-i2cpld.c:error:field-chip_out-has-incomplete-type
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-mfd-htc-i2cpld.c:error:invalid-use-of-undefined-type-struct-gpio_chip
|   |-- drivers-mfd-htc-i2cpld.c:warning:initialization-of-struct-htcpld_chip-from-int-makes-pointer-from-integer-without-a-cast
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip
|   |-- include-asm-generic-gpio.h:warning:returning-int-from-a-function-with-return-type-struct-gpio_chip-makes-pointer-from-integer-without-a-cast
|   `-- include-linux-gpio-driver.h:error:conflicting-types-for-gpiod_to_chip-have-struct-gpio_chip-(const-struct-gpio_desc-)
|-- arc-randconfig-r043-20210816
|   |-- drivers-input-keyboard-adp5588-keys.c:error:field-gc-has-incomplete-type
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-input-keyboard-adp5588-keys.c:warning:initialization-of-struct-adp5588_kpad-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-input-keyboard-adp5589-keys.c:error:field-gc-has-incomplete-type
|   |-- drivers-input-keyboard-adp5589-keys.c:error:implicit-declaration-of-function-devm_gpiochip_add_data
|   |-- drivers-input-keyboard-adp5589-keys.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-input-keyboard-adp5589-keys.c:warning:initialization-of-struct-adp5589_kpad-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:warning:initialization-of-struct-cxd2820r_priv-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-media-dvb-frontends-cxd2820r_priv.h:error:field-gpio_chip-has-incomplete-type
|   |-- drivers-mfd-htc-i2cpld.c:error:field-chip_in-has-incomplete-type
|   |-- drivers-mfd-htc-i2cpld.c:error:field-chip_out-has-incomplete-type
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-mfd-htc-i2cpld.c:error:invalid-use-of-undefined-type-struct-gpio_chip
|   |-- drivers-mfd-htc-i2cpld.c:warning:initialization-of-struct-htcpld_chip-from-int-makes-pointer-from-integer-without-a-cast
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip
|   |-- include-asm-generic-gpio.h:warning:returning-int-from-a-function-with-return-type-struct-gpio_chip-makes-pointer-from-integer-without-a-cast
|   `-- include-linux-gpio-driver.h:error:conflicting-types-for-gpiod_to_chip-have-struct-gpio_chip-(const-struct-gpio_desc-)
|-- arm-allyesconfig
|   `-- arch-arm-mach-s3c-s3c64xx.c:error:implicit-declaration-of-function-of_have_populated_dt
|-- arm-colibri_pxa300_defconfig
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip
|   |-- include-asm-generic-gpio.h:warning:returning-int-from-a-function-with-return-type-struct-gpio_chip-makes-pointer-from-integer-without-a-cast
|   `-- include-linux-gpio-driver.h:error:conflicting-types-for-gpiod_to_chip-have-struct-gpio_chip-(const-struct-gpio_desc-)
|-- arm-palmz72_defconfig
|   `-- include-linux-gpio-driver.h:error:conflicting-types-for-gpiod_to_chip-have-struct-gpio_chip-(const-struct-gpio_desc-)
|-- arm-randconfig-c003-20210816
|   |-- drivers-input-keyboard-adp5588-keys.c:error:field-gc-has-incomplete-type
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-input-keyboard-adp5588-keys.c:warning:initialization-of-struct-adp5588_kpad-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-input-keyboard-adp5589-keys.c:error:field-gc-has-incomplete-type
|   |-- drivers-input-keyboard-adp5589-keys.c:error:implicit-declaration-of-function-devm_gpiochip_add_data
|   |-- drivers-input-keyboard-adp5589-keys.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-input-keyboard-adp5589-keys.c:warning:initialization-of-struct-adp5589_kpad-from-int-makes-pointer-from-integer-without-a-cast
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip
|   |-- include-asm-generic-gpio.h:warning:returning-int-from-a-function-with-return-type-struct-gpio_chip-makes-pointer-from-integer-without-a-cast
|   |-- include-linux-gpio-driver.h:error:conflicting-types-for-gpiod_to_chip-have-struct-gpio_chip-(const-struct-gpio_desc-)
|   `-- include-linux-spi-max7301.h:error:field-chip-has-incomplete-type
|-- arm-randconfig-r014-20210816
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip
|   |-- include-asm-generic-gpio.h:warning:returning-int-from-a-function-with-return-type-struct-gpio_chip-makes-pointer-from-integer-without-a-cast
|   `-- include-linux-gpio-driver.h:error:conflicting-types-for-gpiod_to_chip-have-struct-gpio_chip-(const-struct-gpio_desc-)
|-- arm-s3c2410_defconfig
|   |-- arch-arm-mach-s3c-h1940.h:warning:excess-elements-in-struct-initializer
|   |-- arch-arm-mach-s3c-mach-h1940.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- arch-arm-mach-s3c-mach-h1940.c:error:storage-size-of-h1940_latch_gpiochip-isn-t-known
|   |-- arch-arm-mach-s3c-mach-h1940.c:error:struct-gpio_chip-has-no-member-named-base
|   |-- arch-arm-mach-s3c-mach-h1940.c:error:struct-gpio_chip-has-no-member-named-direction_output
|   |-- arch-arm-mach-s3c-mach-h1940.c:error:struct-gpio_chip-has-no-member-named-get
|   |-- arch-arm-mach-s3c-mach-h1940.c:error:struct-gpio_chip-has-no-member-named-label
|   |-- arch-arm-mach-s3c-mach-h1940.c:error:struct-gpio_chip-has-no-member-named-ngpio
|   |-- arch-arm-mach-s3c-mach-h1940.c:error:struct-gpio_chip-has-no-member-named-owner
|   |-- arch-arm-mach-s3c-mach-h1940.c:error:struct-gpio_chip-has-no-member-named-set
|   |-- arch-arm-mach-s3c-mach-h1940.c:error:variable-h1940_latch_gpiochip-has-initializer-but-incomplete-type
|   |-- arch-arm-mach-s3c-mach-h1940.c:warning:excess-elements-in-struct-initializer
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip
|   |-- include-asm-generic-gpio.h:warning:returning-int-from-a-function-with-return-type-struct-gpio_chip-makes-pointer-from-integer-without-a-cast
|   |-- include-linux-export.h:warning:excess-elements-in-struct-initializer
|   `-- include-linux-gpio-driver.h:error:conflicting-types-for-gpiod_to_chip-have-struct-gpio_chip-(const-struct-gpio_desc-)
|-- arm-tegra_defconfig
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:warning:initialization-of-struct-cxd2820r_priv-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-media-dvb-frontends-cxd2820r_priv.h:error:field-gpio_chip-has-incomplete-type
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip
|   |-- include-asm-generic-gpio.h:warning:returning-int-from-a-function-with-return-type-struct-gpio_chip-makes-pointer-from-integer-without-a-cast
|   `-- include-linux-gpio-driver.h:error:conflicting-types-for-gpiod_to_chip-have-struct-gpio_chip-(const-struct-gpio_desc-)
|-- arm-zeus_defconfig
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip
|   |-- include-asm-generic-gpio.h:warning:returning-int-from-a-function-with-return-type-struct-gpio_chip-makes-pointer-from-integer-without-a-cast
|   `-- include-linux-gpio-driver.h:error:conflicting-types-for-gpiod_to_chip-have-struct-gpio_chip-(const-struct-gpio_desc-)
|-- h8300-allyesconfig
|   `-- include-linux-gpio-driver.h:error:conflicting-types-for-gpiod_to_chip-have-struct-gpio_chip-(const-struct-gpio_desc-)
|-- i386-allyesconfig
|   |-- drivers-input-keyboard-adp5588-keys.c:error:field-gc-has-incomplete-type
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-input-keyboard-adp5588-keys.c:warning:initialization-of-struct-adp5588_kpad-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-input-keyboard-adp5589-keys.c:error:field-gc-has-incomplete-type
|   |-- drivers-input-keyboard-adp5589-keys.c:error:implicit-declaration-of-function-devm_gpiochip_add_data
|   |-- drivers-input-keyboard-adp5589-keys.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-input-keyboard-adp5589-keys.c:warning:initialization-of-struct-adp5589_kpad-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:warning:initialization-of-struct-cxd2820r_priv-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-media-dvb-frontends-cxd2820r_priv.h:error:field-gpio_chip-has-incomplete-type
|   |-- drivers-mfd-htc-i2cpld.c:error:field-chip_in-has-incomplete-type
|   |-- drivers-mfd-htc-i2cpld.c:error:field-chip_out-has-incomplete-type
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-mfd-htc-i2cpld.c:warning:initialization-of-struct-htcpld_chip-from-int-makes-pointer-from-integer-without-a-cast
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip
|   `-- include-asm-generic-gpio.h:warning:returning-int-from-a-function-with-return-type-struct-gpio_chip-makes-pointer-from-integer-without-a-cast
|-- i386-randconfig-a001-20210816
|   |-- drivers-mfd-htc-i2cpld.c:error:field-chip_in-has-incomplete-type
|   |-- drivers-mfd-htc-i2cpld.c:error:field-chip_out-has-incomplete-type
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-mfd-htc-i2cpld.c:warning:initialization-of-struct-htcpld_chip-from-int-makes-pointer-from-integer-without-a-cast
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip
|   `-- include-asm-generic-gpio.h:warning:returning-int-from-a-function-with-return-type-struct-gpio_chip-makes-pointer-from-integer-without-a-cast
|-- i386-randconfig-a002-20210816
|   |-- drivers-input-keyboard-adp5588-keys.c:error:field-gc-has-incomplete-type
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-input-keyboard-adp5588-keys.c:warning:initialization-of-struct-adp5588_kpad-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:warning:initialization-of-struct-cxd2820r_priv-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-media-dvb-frontends-cxd2820r_priv.h:error:field-gpio_chip-has-incomplete-type
|   |-- drivers-mfd-htc-i2cpld.c:error:field-chip_in-has-incomplete-type
|   |-- drivers-mfd-htc-i2cpld.c:error:field-chip_out-has-incomplete-type
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-mfd-htc-i2cpld.c:warning:initialization-of-struct-htcpld_chip-from-int-makes-pointer-from-integer-without-a-cast
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip
|   `-- include-asm-generic-gpio.h:warning:returning-int-from-a-function-with-return-type-struct-gpio_chip-makes-pointer-from-integer-without-a-cast
|-- i386-randconfig-a003-20210816
|   |-- drivers-input-keyboard-adp5588-keys.c:error:field-gc-has-incomplete-type
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-input-keyboard-adp5588-keys.c:warning:initialization-of-struct-adp5588_kpad-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-input-keyboard-adp5589-keys.c:error:field-gc-has-incomplete-type
|   |-- drivers-input-keyboard-adp5589-keys.c:error:implicit-declaration-of-function-devm_gpiochip_add_data
|   |-- drivers-input-keyboard-adp5589-keys.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-input-keyboard-adp5589-keys.c:warning:initialization-of-struct-adp5589_kpad-from-int-makes-pointer-from-integer-without-a-cast
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip
|   `-- include-asm-generic-gpio.h:warning:returning-int-from-a-function-with-return-type-struct-gpio_chip-makes-pointer-from-integer-without-a-cast
|-- i386-randconfig-a004-20210816
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip
|   `-- include-asm-generic-gpio.h:warning:returning-int-from-a-function-with-return-type-struct-gpio_chip-makes-pointer-from-integer-without-a-cast
|-- i386-randconfig-a005-20210816
|   |-- drivers-input-keyboard-adp5589-keys.c:error:field-gc-has-incomplete-type
|   |-- drivers-input-keyboard-adp5589-keys.c:error:implicit-declaration-of-function-devm_gpiochip_add_data
|   |-- drivers-input-keyboard-adp5589-keys.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-input-keyboard-adp5589-keys.c:warning:initialization-of-struct-adp5589_kpad-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-mfd-htc-i2cpld.c:error:field-chip_in-has-incomplete-type
|   |-- drivers-mfd-htc-i2cpld.c:error:field-chip_out-has-incomplete-type
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-mfd-htc-i2cpld.c:warning:initialization-of-struct-htcpld_chip-from-int-makes-pointer-from-integer-without-a-cast
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip
|   `-- include-asm-generic-gpio.h:warning:returning-int-from-a-function-with-return-type-struct-gpio_chip-makes-pointer-from-integer-without-a-cast
|-- i386-randconfig-a006-20210816
|   |-- drivers-mfd-htc-i2cpld.c:error:field-chip_in-has-incomplete-type
|   |-- drivers-mfd-htc-i2cpld.c:error:field-chip_out-has-incomplete-type
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-mfd-htc-i2cpld.c:warning:initialization-of-struct-htcpld_chip-from-int-makes-pointer-from-integer-without-a-cast
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip
|   `-- include-asm-generic-gpio.h:warning:returning-int-from-a-function-with-return-type-struct-gpio_chip-makes-pointer-from-integer-without-a-cast
|-- i386-randconfig-c001-20210816
|   |-- drivers-mfd-htc-i2cpld.c:error:field-chip_in-has-incomplete-type
|   |-- drivers-mfd-htc-i2cpld.c:error:field-chip_out-has-incomplete-type
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-mfd-htc-i2cpld.c:warning:initialization-of-struct-htcpld_chip-from-int-makes-pointer-from-integer-without-a-cast
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip
|   |-- include-asm-generic-gpio.h:warning:returning-int-from-a-function-with-return-type-struct-gpio_chip-makes-pointer-from-integer-without-a-cast
|   `-- include-linux-spi-max7301.h:error:field-chip-has-incomplete-type
|-- i386-randconfig-c021-20210816
|   |-- drivers-input-keyboard-adp5588-keys.c:error:field-gc-has-incomplete-type
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-input-keyboard-adp5588-keys.c:warning:initialization-of-struct-adp5588_kpad-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-input-keyboard-adp5589-keys.c:error:field-gc-has-incomplete-type
|   |-- drivers-input-keyboard-adp5589-keys.c:error:implicit-declaration-of-function-devm_gpiochip_add_data
|   |-- drivers-input-keyboard-adp5589-keys.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-input-keyboard-adp5589-keys.c:warning:initialization-of-struct-adp5589_kpad-from-int-makes-pointer-from-integer-without-a-cast
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip
|   `-- include-asm-generic-gpio.h:warning:returning-int-from-a-function-with-return-type-struct-gpio_chip-makes-pointer-from-integer-without-a-cast
|-- i386-randconfig-p002-20210816
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip
|   `-- include-asm-generic-gpio.h:warning:returning-int-from-a-function-with-return-type-struct-gpio_chip-makes-pointer-from-integer-without-a-cast
|-- i386-randconfig-s002-20210816
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip
|   `-- include-asm-generic-gpio.h:warning:returning-int-from-a-function-with-return-type-struct-gpio_chip-makes-pointer-from-integer-without-a-cast
|-- ia64-allmodconfig
|   `-- include-linux-gpio-driver.h:error:conflicting-types-for-gpiod_to_chip-have-struct-gpio_chip-(const-struct-gpio_desc-)
|-- ia64-allyesconfig
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip
|   |-- include-asm-generic-gpio.h:warning:returning-int-from-a-function-with-return-type-struct-gpio_chip-makes-pointer-from-integer-without-a-cast
|   `-- include-linux-gpio-driver.h:error:conflicting-types-for-gpiod_to_chip-have-struct-gpio_chip-(const-struct-gpio_desc-)
|-- ia64-randconfig-r002-20210816
|   |-- drivers-input-keyboard-adp5588-keys.c:error:field-gc-has-incomplete-type
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-input-keyboard-adp5588-keys.c:warning:initialization-of-struct-adp5588_kpad-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-input-keyboard-adp5589-keys.c:error:field-gc-has-incomplete-type
|   |-- drivers-input-keyboard-adp5589-keys.c:error:implicit-declaration-of-function-devm_gpiochip_add_data
|   |-- drivers-input-keyboard-adp5589-keys.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-input-keyboard-adp5589-keys.c:warning:initialization-of-struct-adp5589_kpad-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:warning:initialization-of-struct-cxd2820r_priv-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-media-dvb-frontends-cxd2820r_priv.h:error:field-gpio_chip-has-incomplete-type
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip
|   |-- include-asm-generic-gpio.h:warning:returning-int-from-a-function-with-return-type-struct-gpio_chip-makes-pointer-from-integer-without-a-cast
|   `-- include-linux-gpio-driver.h:error:conflicting-types-for-gpiod_to_chip-have-struct-gpio_chip-(const-struct-gpio_desc-)
|-- ia64-randconfig-r005-20210816
|   |-- drivers-input-keyboard-adp5589-keys.c:error:field-gc-has-incomplete-type
|   |-- drivers-input-keyboard-adp5589-keys.c:error:implicit-declaration-of-function-devm_gpiochip_add_data
|   |-- drivers-input-keyboard-adp5589-keys.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-input-keyboard-adp5589-keys.c:warning:initialization-of-struct-adp5589_kpad-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:warning:initialization-of-struct-cxd2820r_priv-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-media-dvb-frontends-cxd2820r_priv.h:error:field-gpio_chip-has-incomplete-type
|   |-- drivers-mfd-htc-i2cpld.c:error:field-chip_in-has-incomplete-type
|   |-- drivers-mfd-htc-i2cpld.c:error:field-chip_out-has-incomplete-type
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-mfd-htc-i2cpld.c:error:invalid-use-of-undefined-type-struct-gpio_chip
|   |-- drivers-mfd-htc-i2cpld.c:warning:initialization-of-struct-htcpld_chip-from-int-makes-pointer-from-integer-without-a-cast
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip
|   |-- include-asm-generic-gpio.h:warning:returning-int-from-a-function-with-return-type-struct-gpio_chip-makes-pointer-from-integer-without-a-cast
|   `-- include-linux-gpio-driver.h:error:conflicting-types-for-gpiod_to_chip-have-struct-gpio_chip-(const-struct-gpio_desc-)
|-- ia64-randconfig-r013-20210816
|   |-- drivers-input-keyboard-adp5588-keys.c:error:field-gc-has-incomplete-type
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-input-keyboard-adp5588-keys.c:warning:initialization-of-struct-adp5588_kpad-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-input-keyboard-adp5589-keys.c:error:field-gc-has-incomplete-type
|   |-- drivers-input-keyboard-adp5589-keys.c:error:implicit-declaration-of-function-devm_gpiochip_add_data
|   |-- drivers-input-keyboard-adp5589-keys.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-input-keyboard-adp5589-keys.c:warning:initialization-of-struct-adp5589_kpad-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-mfd-htc-i2cpld.c:error:field-chip_in-has-incomplete-type
|   |-- drivers-mfd-htc-i2cpld.c:error:field-chip_out-has-incomplete-type
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-mfd-htc-i2cpld.c:error:invalid-use-of-undefined-type-struct-gpio_chip
|   |-- drivers-mfd-htc-i2cpld.c:warning:initialization-of-struct-htcpld_chip-from-int-makes-pointer-from-integer-without-a-cast
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip
|   |-- include-asm-generic-gpio.h:warning:returning-int-from-a-function-with-return-type-struct-gpio_chip-makes-pointer-from-integer-without-a-cast
|   `-- include-linux-gpio-driver.h:error:conflicting-types-for-gpiod_to_chip-have-struct-gpio_chip-(const-struct-gpio_desc-)
|-- m68k-allmodconfig
|   |-- drivers-input-keyboard-adp5588-keys.c:error:field-gc-has-incomplete-type
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-input-keyboard-adp5588-keys.c:warning:initialization-of-struct-adp5588_kpad-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-input-keyboard-adp5589-keys.c:error:field-gc-has-incomplete-type
|   |-- drivers-input-keyboard-adp5589-keys.c:error:implicit-declaration-of-function-devm_gpiochip_add_data
|   |-- drivers-input-keyboard-adp5589-keys.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-input-keyboard-adp5589-keys.c:warning:initialization-of-struct-adp5589_kpad-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:warning:initialization-of-struct-cxd2820r_priv-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-media-dvb-frontends-cxd2820r_priv.h:error:field-gpio_chip-has-incomplete-type
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip
|   |-- include-asm-generic-gpio.h:warning:returning-int-from-a-function-with-return-type-struct-gpio_chip-makes-pointer-from-integer-without-a-cast
|   |-- include-linux-gpio-driver.h:error:conflicting-types-for-gpiod_to_chip-have-struct-gpio_chip-(const-struct-gpio_desc-)
|   `-- include-linux-spi-max7301.h:error:field-chip-has-incomplete-type
|-- m68k-allyesconfig
|   |-- drivers-input-keyboard-adp5588-keys.c:error:field-gc-has-incomplete-type
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-input-keyboard-adp5588-keys.c:warning:initialization-of-struct-adp5588_kpad-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-input-keyboard-adp5589-keys.c:error:field-gc-has-incomplete-type
|   |-- drivers-input-keyboard-adp5589-keys.c:error:implicit-declaration-of-function-devm_gpiochip_add_data
|   |-- drivers-input-keyboard-adp5589-keys.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-input-keyboard-adp5589-keys.c:warning:initialization-of-struct-adp5589_kpad-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:warning:initialization-of-struct-cxd2820r_priv-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-media-dvb-frontends-cxd2820r_priv.h:error:field-gpio_chip-has-incomplete-type
|   |-- drivers-mfd-htc-i2cpld.c:error:field-chip_in-has-incomplete-type
|   |-- drivers-mfd-htc-i2cpld.c:error:field-chip_out-has-incomplete-type
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-mfd-htc-i2cpld.c:error:invalid-use-of-undefined-type-struct-gpio_chip
|   |-- drivers-mfd-htc-i2cpld.c:warning:initialization-of-struct-htcpld_chip-from-int-makes-pointer-from-integer-without-a-cast
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip
|   |-- include-asm-generic-gpio.h:warning:returning-int-from-a-function-with-return-type-struct-gpio_chip-makes-pointer-from-integer-without-a-cast
|   `-- include-linux-gpio-driver.h:error:conflicting-types-for-gpiod_to_chip-have-struct-gpio_chip-(const-struct-gpio_desc-)
|-- m68k-randconfig-r022-20210816
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip
|   |-- include-asm-generic-gpio.h:warning:returning-int-from-a-function-with-return-type-struct-gpio_chip-makes-pointer-from-integer-without-a-cast
|   `-- include-linux-gpio-driver.h:error:conflicting-types-for-gpiod_to_chip-have-struct-gpio_chip-(const-struct-gpio_desc-)
|-- m68k-randconfig-r025-20210816
|   |-- drivers-input-keyboard-adp5588-keys.c:error:field-gc-has-incomplete-type
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-input-keyboard-adp5588-keys.c:warning:initialization-of-struct-adp5588_kpad-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-input-keyboard-adp5589-keys.c:error:field-gc-has-incomplete-type
|   |-- drivers-input-keyboard-adp5589-keys.c:error:implicit-declaration-of-function-devm_gpiochip_add_data
|   |-- drivers-input-keyboard-adp5589-keys.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-input-keyboard-adp5589-keys.c:warning:initialization-of-struct-adp5589_kpad-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:warning:initialization-of-struct-cxd2820r_priv-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-media-dvb-frontends-cxd2820r_priv.h:error:field-gpio_chip-has-incomplete-type
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip
|   |-- include-asm-generic-gpio.h:warning:returning-int-from-a-function-with-return-type-struct-gpio_chip-makes-pointer-from-integer-without-a-cast
|   |-- include-linux-gpio-driver.h:error:conflicting-types-for-gpiod_to_chip-have-struct-gpio_chip-(const-struct-gpio_desc-)
|   `-- include-linux-spi-max7301.h:error:field-chip-has-incomplete-type
|-- mips-allmodconfig
|   |-- drivers-input-keyboard-adp5588-keys.c:error:field-gc-has-incomplete-type
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-input-keyboard-adp5588-keys.c:warning:initialization-of-struct-adp5588_kpad-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-input-keyboard-adp5589-keys.c:error:field-gc-has-incomplete-type
|   |-- drivers-input-keyboard-adp5589-keys.c:error:implicit-declaration-of-function-devm_gpiochip_add_data
|   |-- drivers-input-keyboard-adp5589-keys.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-input-keyboard-adp5589-keys.c:warning:initialization-of-struct-adp5589_kpad-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:warning:initialization-of-struct-cxd2820r_priv-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-media-dvb-frontends-cxd2820r_priv.h:error:field-gpio_chip-has-incomplete-type
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip
|   |-- include-asm-generic-gpio.h:warning:returning-int-from-a-function-with-return-type-struct-gpio_chip-makes-pointer-from-integer-without-a-cast
|   `-- include-linux-gpio-driver.h:error:conflicting-types-for-gpiod_to_chip-have-struct-gpio_chip-(const-struct-gpio_desc-)
|-- mips-allyesconfig
|   |-- drivers-input-keyboard-adp5588-keys.c:error:field-gc-has-incomplete-type
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-input-keyboard-adp5588-keys.c:warning:initialization-of-struct-adp5588_kpad-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-input-keyboard-adp5589-keys.c:error:field-gc-has-incomplete-type
|   |-- drivers-input-keyboard-adp5589-keys.c:error:implicit-declaration-of-function-devm_gpiochip_add_data
|   |-- drivers-input-keyboard-adp5589-keys.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-input-keyboard-adp5589-keys.c:warning:initialization-of-struct-adp5589_kpad-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:warning:initialization-of-struct-cxd2820r_priv-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-media-dvb-frontends-cxd2820r_priv.h:error:field-gpio_chip-has-incomplete-type
|   |-- drivers-mfd-htc-i2cpld.c:error:field-chip_in-has-incomplete-type
|   |-- drivers-mfd-htc-i2cpld.c:error:field-chip_out-has-incomplete-type
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-mfd-htc-i2cpld.c:error:invalid-use-of-undefined-type-struct-gpio_chip
|   |-- drivers-mfd-htc-i2cpld.c:warning:initialization-of-struct-htcpld_chip-from-int-makes-pointer-from-integer-without-a-cast
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip
|   |-- include-asm-generic-gpio.h:warning:returning-int-from-a-function-with-return-type-struct-gpio_chip-makes-pointer-from-integer-without-a-cast
|   `-- include-linux-gpio-driver.h:error:conflicting-types-for-gpiod_to_chip-have-struct-gpio_chip-(const-struct-gpio_desc-)
|-- mips-bcm63xx_defconfig
|   `-- include-linux-gpio-driver.h:error:conflicting-types-for-gpiod_to_chip-have-struct-gpio_chip-(const-struct-gpio_desc-)
|-- mips-capcella_defconfig
|   `-- include-linux-gpio-driver.h:error:conflicting-types-for-gpiod_to_chip-have-struct-gpio_chip-(const-struct-gpio_desc-)
|-- mips-pistachio_defconfig
|   `-- include-linux-gpio-driver.h:error:conflicting-types-for-gpiod_to_chip-have-struct-gpio_chip-(const-struct-gpio_desc-)
|-- mips-randconfig-c004-20210816
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:warning:initialization-of-struct-cxd2820r_priv-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-media-dvb-frontends-cxd2820r_priv.h:error:field-gpio_chip-has-incomplete-type
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip
|   |-- include-asm-generic-gpio.h:warning:returning-int-from-a-function-with-return-type-struct-gpio_chip-makes-pointer-from-integer-without-a-cast
|   |-- include-linux-gpio-driver.h:error:conflicting-types-for-gpiod_to_chip-have-struct-gpio_chip-(const-struct-gpio_desc-)
|   `-- include-linux-spi-max7301.h:error:field-chip-has-incomplete-type
|-- nds32-allyesconfig
|   |-- drivers-input-keyboard-adp5588-keys.c:error:field-gc-has-incomplete-type
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-input-keyboard-adp5588-keys.c:warning:initialization-of-struct-adp5588_kpad-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-input-keyboard-adp5589-keys.c:error:field-gc-has-incomplete-type
|   |-- drivers-input-keyboard-adp5589-keys.c:error:implicit-declaration-of-function-devm_gpiochip_add_data
|   |-- drivers-input-keyboard-adp5589-keys.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-input-keyboard-adp5589-keys.c:warning:initialization-of-struct-adp5589_kpad-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:warning:initialization-of-struct-cxd2820r_priv-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-media-dvb-frontends-cxd2820r_priv.h:error:field-gpio_chip-has-incomplete-type
|   |-- drivers-mfd-htc-i2cpld.c:error:field-chip_in-has-incomplete-type
|   |-- drivers-mfd-htc-i2cpld.c:error:field-chip_out-has-incomplete-type
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-mfd-htc-i2cpld.c:error:invalid-use-of-undefined-type-struct-gpio_chip
|   |-- drivers-mfd-htc-i2cpld.c:warning:initialization-of-struct-htcpld_chip-from-int-makes-pointer-from-integer-without-a-cast
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip
|   |-- include-asm-generic-gpio.h:warning:returning-int-from-a-function-with-return-type-struct-gpio_chip-makes-pointer-from-integer-without-a-cast
|   `-- include-linux-gpio-driver.h:error:conflicting-types-for-gpiod_to_chip-have-struct-gpio_chip-(const-struct-gpio_desc-)
|-- nds32-randconfig-r001-20210816
|   |-- drivers-input-keyboard-adp5588-keys.c:error:field-gc-has-incomplete-type
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-input-keyboard-adp5588-keys.c:warning:initialization-of-struct-adp5588_kpad-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-input-keyboard-adp5589-keys.c:error:field-gc-has-incomplete-type
|   |-- drivers-input-keyboard-adp5589-keys.c:error:implicit-declaration-of-function-devm_gpiochip_add_data
|   |-- drivers-input-keyboard-adp5589-keys.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-input-keyboard-adp5589-keys.c:warning:initialization-of-struct-adp5589_kpad-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-mfd-htc-i2cpld.c:error:field-chip_in-has-incomplete-type
|   |-- drivers-mfd-htc-i2cpld.c:error:field-chip_out-has-incomplete-type
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-mfd-htc-i2cpld.c:error:invalid-use-of-undefined-type-struct-gpio_chip
|   |-- drivers-mfd-htc-i2cpld.c:warning:initialization-of-struct-htcpld_chip-from-int-makes-pointer-from-integer-without-a-cast
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip
|   |-- include-asm-generic-gpio.h:warning:returning-int-from-a-function-with-return-type-struct-gpio_chip-makes-pointer-from-integer-without-a-cast
|   `-- include-linux-gpio-driver.h:error:conflicting-types-for-gpiod_to_chip-have-struct-gpio_chip-(const-struct-gpio_desc-)
|-- nios2-allyesconfig
|   |-- drivers-input-keyboard-adp5588-keys.c:error:field-gc-has-incomplete-type
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-input-keyboard-adp5588-keys.c:warning:initialization-of-struct-adp5588_kpad-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-input-keyboard-adp5589-keys.c:error:field-gc-has-incomplete-type
|   |-- drivers-input-keyboard-adp5589-keys.c:error:implicit-declaration-of-function-devm_gpiochip_add_data
|   |-- drivers-input-keyboard-adp5589-keys.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-input-keyboard-adp5589-keys.c:warning:initialization-of-struct-adp5589_kpad-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:warning:initialization-of-struct-cxd2820r_priv-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-media-dvb-frontends-cxd2820r_priv.h:error:field-gpio_chip-has-incomplete-type
|   |-- drivers-mfd-htc-i2cpld.c:error:field-chip_in-has-incomplete-type
|   |-- drivers-mfd-htc-i2cpld.c:error:field-chip_out-has-incomplete-type
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-mfd-htc-i2cpld.c:error:invalid-use-of-undefined-type-struct-gpio_chip
|   |-- drivers-mfd-htc-i2cpld.c:warning:initialization-of-struct-htcpld_chip-from-int-makes-pointer-from-integer-without-a-cast
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip
|   |-- include-asm-generic-gpio.h:warning:returning-int-from-a-function-with-return-type-struct-gpio_chip-makes-pointer-from-integer-without-a-cast
|   `-- include-linux-gpio-driver.h:error:conflicting-types-for-gpiod_to_chip-have-struct-gpio_chip-(const-struct-gpio_desc-)
|-- nios2-randconfig-s032-20210816
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip
|   |-- include-asm-generic-gpio.h:warning:returning-int-from-a-function-with-return-type-struct-gpio_chip-makes-pointer-from-integer-without-a-cast
|   `-- include-linux-gpio-driver.h:error:conflicting-types-for-gpiod_to_chip-have-struct-gpio_chip-(const-struct-gpio_desc-)
|-- openrisc-allnoconfig
|   `-- include-linux-gpio-driver.h:error:conflicting-types-for-gpiod_to_chip-have-struct-gpio_chip-(const-struct-gpio_desc-)
|-- openrisc-defconfig
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip
|   |-- include-asm-generic-gpio.h:warning:returning-int-from-a-function-with-return-type-struct-gpio_chip-makes-pointer-from-integer-without-a-cast
|   `-- include-linux-gpio-driver.h:error:conflicting-types-for-gpiod_to_chip-have-struct-gpio_chip-(const-struct-gpio_desc-)
|-- openrisc-randconfig-r012-20210816
|   |-- drivers-mfd-htc-i2cpld.c:error:field-chip_in-has-incomplete-type
|   |-- drivers-mfd-htc-i2cpld.c:error:field-chip_out-has-incomplete-type
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-mfd-htc-i2cpld.c:error:invalid-use-of-undefined-type-struct-gpio_chip
|   |-- drivers-mfd-htc-i2cpld.c:warning:initialization-of-struct-htcpld_chip-from-int-makes-pointer-from-integer-without-a-cast
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip
|   |-- include-asm-generic-gpio.h:warning:returning-int-from-a-function-with-return-type-struct-gpio_chip-makes-pointer-from-integer-without-a-cast
|   `-- include-linux-gpio-driver.h:error:conflicting-types-for-gpiod_to_chip-have-struct-gpio_chip-(const-struct-gpio_desc-)
|-- openrisc-randconfig-r015-20210816
|   `-- include-linux-gpio-driver.h:error:conflicting-types-for-gpiod_to_chip-have-struct-gpio_chip-(const-struct-gpio_desc-)
|-- parisc-allyesconfig
|   |-- drivers-input-keyboard-adp5588-keys.c:error:field-gc-has-incomplete-type
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-input-keyboard-adp5588-keys.c:warning:initialization-of-struct-adp5588_kpad-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-input-keyboard-adp5589-keys.c:error:field-gc-has-incomplete-type
|   |-- drivers-input-keyboard-adp5589-keys.c:error:implicit-declaration-of-function-devm_gpiochip_add_data
|   |-- drivers-input-keyboard-adp5589-keys.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-input-keyboard-adp5589-keys.c:warning:initialization-of-struct-adp5589_kpad-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:warning:initialization-of-struct-cxd2820r_priv-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-media-dvb-frontends-cxd2820r_priv.h:error:field-gpio_chip-has-incomplete-type
|   |-- drivers-mfd-htc-i2cpld.c:error:field-chip_in-has-incomplete-type
|   |-- drivers-mfd-htc-i2cpld.c:error:field-chip_out-has-incomplete-type
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-mfd-htc-i2cpld.c:error:invalid-use-of-undefined-type-struct-gpio_chip
|   |-- drivers-mfd-htc-i2cpld.c:warning:initialization-of-struct-htcpld_chip-from-int-makes-pointer-from-integer-without-a-cast
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip
|   |-- include-asm-generic-gpio.h:warning:returning-int-from-a-function-with-return-type-struct-gpio_chip-makes-pointer-from-integer-without-a-cast
|   `-- include-linux-gpio-driver.h:error:conflicting-types-for-gpiod_to_chip-have-struct-gpio_chip-(const-struct-gpio_desc-)
|-- parisc-randconfig-r003-20210816
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:warning:initialization-of-struct-cxd2820r_priv-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-media-dvb-frontends-cxd2820r_priv.h:error:field-gpio_chip-has-incomplete-type
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip
|   |-- include-asm-generic-gpio.h:warning:returning-int-from-a-function-with-return-type-struct-gpio_chip-makes-pointer-from-integer-without-a-cast
|   `-- include-linux-gpio-driver.h:error:conflicting-types-for-gpiod_to_chip-have-struct-gpio_chip-(const-struct-gpio_desc-)
|-- parisc-randconfig-r013-20210816
|   `-- include-linux-gpio-driver.h:error:conflicting-types-for-gpiod_to_chip-have-struct-gpio_chip-(const-struct-gpio_desc-)
|-- parisc-randconfig-r021-20210816
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:warning:initialization-of-struct-cxd2820r_priv-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-media-dvb-frontends-cxd2820r_priv.h:error:field-gpio_chip-has-incomplete-type
|   |-- drivers-mfd-htc-i2cpld.c:error:field-chip_in-has-incomplete-type
|   |-- drivers-mfd-htc-i2cpld.c:error:field-chip_out-has-incomplete-type
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-mfd-htc-i2cpld.c:error:invalid-use-of-undefined-type-struct-gpio_chip
|   |-- drivers-mfd-htc-i2cpld.c:warning:initialization-of-struct-htcpld_chip-from-int-makes-pointer-from-integer-without-a-cast
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip
|   |-- include-asm-generic-gpio.h:warning:returning-int-from-a-function-with-return-type-struct-gpio_chip-makes-pointer-from-integer-without-a-cast
|   `-- include-linux-gpio-driver.h:error:conflicting-types-for-gpiod_to_chip-have-struct-gpio_chip-(const-struct-gpio_desc-)
|-- powerpc-allmodconfig
|   |-- drivers-input-keyboard-adp5588-keys.c:error:field-gc-has-incomplete-type
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-input-keyboard-adp5588-keys.c:warning:initialization-of-struct-adp5588_kpad-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-input-keyboard-adp5589-keys.c:error:field-gc-has-incomplete-type
|   |-- drivers-input-keyboard-adp5589-keys.c:error:implicit-declaration-of-function-devm_gpiochip_add_data
|   |-- drivers-input-keyboard-adp5589-keys.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-input-keyboard-adp5589-keys.c:warning:initialization-of-struct-adp5589_kpad-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:warning:initialization-of-struct-cxd2820r_priv-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-media-dvb-frontends-cxd2820r_priv.h:error:field-gpio_chip-has-incomplete-type
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip
|   |-- include-asm-generic-gpio.h:warning:returning-int-from-a-function-with-return-type-struct-gpio_chip-makes-pointer-from-integer-without-a-cast
|   `-- include-linux-gpio-driver.h:error:conflicting-types-for-gpiod_to_chip-have-struct-gpio_chip-(const-struct-gpio_desc-)
|-- powerpc-allyesconfig
|   |-- drivers-input-keyboard-adp5588-keys.c:error:field-gc-has-incomplete-type
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-input-keyboard-adp5588-keys.c:warning:initialization-of-struct-adp5588_kpad-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-input-keyboard-adp5589-keys.c:error:field-gc-has-incomplete-type
|   |-- drivers-input-keyboard-adp5589-keys.c:error:implicit-declaration-of-function-devm_gpiochip_add_data
|   |-- drivers-input-keyboard-adp5589-keys.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-input-keyboard-adp5589-keys.c:warning:initialization-of-struct-adp5589_kpad-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:warning:initialization-of-struct-cxd2820r_priv-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-media-dvb-frontends-cxd2820r_priv.h:error:field-gpio_chip-has-incomplete-type
|   |-- drivers-mfd-htc-i2cpld.c:error:field-chip_in-has-incomplete-type
|   |-- drivers-mfd-htc-i2cpld.c:error:field-chip_out-has-incomplete-type
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-mfd-htc-i2cpld.c:error:invalid-use-of-undefined-type-struct-gpio_chip
|   |-- drivers-mfd-htc-i2cpld.c:warning:initialization-of-struct-htcpld_chip-from-int-makes-pointer-from-integer-without-a-cast
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip
|   |-- include-asm-generic-gpio.h:warning:returning-int-from-a-function-with-return-type-struct-gpio_chip-makes-pointer-from-integer-without-a-cast
|   `-- include-linux-gpio-driver.h:error:conflicting-types-for-gpiod_to_chip-have-struct-gpio_chip-(const-struct-gpio_desc-)
|-- riscv-allmodconfig
|   |-- drivers-input-keyboard-adp5588-keys.c:error:field-gc-has-incomplete-type
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-input-keyboard-adp5588-keys.c:warning:initialization-of-struct-adp5588_kpad-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-input-keyboard-adp5589-keys.c:error:field-gc-has-incomplete-type
|   |-- drivers-input-keyboard-adp5589-keys.c:error:implicit-declaration-of-function-devm_gpiochip_add_data
|   |-- drivers-input-keyboard-adp5589-keys.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-input-keyboard-adp5589-keys.c:warning:initialization-of-struct-adp5589_kpad-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:warning:initialization-of-struct-cxd2820r_priv-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-media-dvb-frontends-cxd2820r_priv.h:error:field-gpio_chip-has-incomplete-type
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip
|   |-- include-asm-generic-gpio.h:warning:returning-int-from-a-function-with-return-type-struct-gpio_chip-makes-pointer-from-integer-without-a-cast
|   `-- include-linux-gpio-driver.h:error:conflicting-types-for-gpiod_to_chip-have-struct-gpio_chip-(const-struct-gpio_desc-)
|-- riscv-allyesconfig
|   |-- drivers-input-keyboard-adp5588-keys.c:error:field-gc-has-incomplete-type
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-input-keyboard-adp5588-keys.c:warning:initialization-of-struct-adp5588_kpad-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-input-keyboard-adp5589-keys.c:error:field-gc-has-incomplete-type
|   |-- drivers-input-keyboard-adp5589-keys.c:error:implicit-declaration-of-function-devm_gpiochip_add_data
|   |-- drivers-input-keyboard-adp5589-keys.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-input-keyboard-adp5589-keys.c:warning:initialization-of-struct-adp5589_kpad-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:warning:initialization-of-struct-cxd2820r_priv-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-media-dvb-frontends-cxd2820r_priv.h:error:field-gpio_chip-has-incomplete-type
|   |-- drivers-mfd-htc-i2cpld.c:error:field-chip_in-has-incomplete-type
|   |-- drivers-mfd-htc-i2cpld.c:error:field-chip_out-has-incomplete-type
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-mfd-htc-i2cpld.c:error:invalid-use-of-undefined-type-struct-gpio_chip
|   |-- drivers-mfd-htc-i2cpld.c:warning:initialization-of-struct-htcpld_chip-from-int-makes-pointer-from-integer-without-a-cast
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip
|   |-- include-asm-generic-gpio.h:warning:returning-int-from-a-function-with-return-type-struct-gpio_chip-makes-pointer-from-integer-without-a-cast
|   `-- include-linux-gpio-driver.h:error:conflicting-types-for-gpiod_to_chip-have-struct-gpio_chip-(const-struct-gpio_desc-)
|-- riscv-defconfig
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip
|   |-- include-asm-generic-gpio.h:warning:returning-int-from-a-function-with-return-type-struct-gpio_chip-makes-pointer-from-integer-without-a-cast
|   `-- include-linux-gpio-driver.h:error:conflicting-types-for-gpiod_to_chip-have-struct-gpio_chip-(const-struct-gpio_desc-)
|-- riscv-nommu_k210_defconfig
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip
|   |-- include-asm-generic-gpio.h:warning:returning-int-from-a-function-with-return-type-struct-gpio_chip-makes-pointer-from-integer-without-a-cast
|   `-- include-linux-gpio-driver.h:error:conflicting-types-for-gpiod_to_chip-have-struct-gpio_chip-(const-struct-gpio_desc-)
|-- riscv-randconfig-p001-20210816
|   |-- drivers-mfd-htc-i2cpld.c:error:field-chip_in-has-incomplete-type
|   |-- drivers-mfd-htc-i2cpld.c:error:field-chip_out-has-incomplete-type
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-mfd-htc-i2cpld.c:error:invalid-use-of-undefined-type-struct-gpio_chip
|   |-- drivers-mfd-htc-i2cpld.c:warning:initialization-of-struct-htcpld_chip-from-int-makes-pointer-from-integer-without-a-cast
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip
|   |-- include-asm-generic-gpio.h:warning:returning-int-from-a-function-with-return-type-struct-gpio_chip-makes-pointer-from-integer-without-a-cast
|   `-- include-linux-gpio-driver.h:error:conflicting-types-for-gpiod_to_chip-have-struct-gpio_chip-(const-struct-gpio_desc-)
|-- s390-allmodconfig
|   |-- drivers-input-keyboard-adp5588-keys.c:error:field-gc-has-incomplete-type
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-input-keyboard-adp5588-keys.c:warning:initialization-of-struct-adp5588_kpad-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-input-keyboard-adp5589-keys.c:error:field-gc-has-incomplete-type
|   |-- drivers-input-keyboard-adp5589-keys.c:error:implicit-declaration-of-function-devm_gpiochip_add_data
|   |-- drivers-input-keyboard-adp5589-keys.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-input-keyboard-adp5589-keys.c:warning:initialization-of-struct-adp5589_kpad-from-int-makes-pointer-from-integer-without-a-cast
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip
|   |-- include-asm-generic-gpio.h:warning:returning-int-from-a-function-with-return-type-struct-gpio_chip-makes-pointer-from-integer-without-a-cast
|   `-- include-linux-gpio-driver.h:error:conflicting-types-for-gpiod_to_chip-have-struct-gpio_chip-(const-struct-gpio_desc-)
|-- s390-allyesconfig
|   |-- drivers-input-keyboard-adp5588-keys.c:error:field-gc-has-incomplete-type
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-input-keyboard-adp5588-keys.c:warning:initialization-of-struct-adp5588_kpad-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-input-keyboard-adp5589-keys.c:error:field-gc-has-incomplete-type
|   |-- drivers-input-keyboard-adp5589-keys.c:error:implicit-declaration-of-function-devm_gpiochip_add_data
|   |-- drivers-input-keyboard-adp5589-keys.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-input-keyboard-adp5589-keys.c:warning:initialization-of-struct-adp5589_kpad-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:warning:initialization-of-struct-cxd2820r_priv-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-media-dvb-frontends-cxd2820r_priv.h:error:field-gpio_chip-has-incomplete-type
|   |-- drivers-mfd-htc-i2cpld.c:error:field-chip_in-has-incomplete-type
|   |-- drivers-mfd-htc-i2cpld.c:error:field-chip_out-has-incomplete-type
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-mfd-htc-i2cpld.c:error:invalid-use-of-undefined-type-struct-gpio_chip
|   |-- drivers-mfd-htc-i2cpld.c:warning:initialization-of-struct-htcpld_chip-from-int-makes-pointer-from-integer-without-a-cast
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip
|   |-- include-asm-generic-gpio.h:warning:returning-int-from-a-function-with-return-type-struct-gpio_chip-makes-pointer-from-integer-without-a-cast
|   `-- include-linux-gpio-driver.h:error:conflicting-types-for-gpiod_to_chip-have-struct-gpio_chip-(const-struct-gpio_desc-)
|-- sh-allmodconfig
|   |-- drivers-input-keyboard-adp5588-keys.c:error:field-gc-has-incomplete-type
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-input-keyboard-adp5588-keys.c:warning:initialization-of-struct-adp5588_kpad-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-input-keyboard-adp5589-keys.c:error:field-gc-has-incomplete-type
|   |-- drivers-input-keyboard-adp5589-keys.c:error:implicit-declaration-of-function-devm_gpiochip_add_data
|   |-- drivers-input-keyboard-adp5589-keys.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-input-keyboard-adp5589-keys.c:warning:initialization-of-struct-adp5589_kpad-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:warning:initialization-of-struct-cxd2820r_priv-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-media-dvb-frontends-cxd2820r_priv.h:error:field-gpio_chip-has-incomplete-type
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip
|   |-- include-asm-generic-gpio.h:warning:returning-int-from-a-function-with-return-type-struct-gpio_chip-makes-pointer-from-integer-without-a-cast
|   `-- include-linux-gpio-driver.h:error:conflicting-types-for-gpiod_to_chip-have-struct-gpio_chip-(const-struct-gpio_desc-)
|-- sh-randconfig-p002-20210816
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:warning:initialization-of-struct-cxd2820r_priv-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-media-dvb-frontends-cxd2820r_priv.h:error:field-gpio_chip-has-incomplete-type
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip
|   |-- include-asm-generic-gpio.h:warning:returning-int-from-a-function-with-return-type-struct-gpio_chip-makes-pointer-from-integer-without-a-cast
|   `-- include-linux-gpio-driver.h:error:conflicting-types-for-gpiod_to_chip-have-struct-gpio_chip-(const-struct-gpio_desc-)
|-- sh-randconfig-r011-20210816
|   |-- drivers-input-keyboard-adp5588-keys.c:error:field-gc-has-incomplete-type
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-input-keyboard-adp5588-keys.c:warning:initialization-of-struct-adp5588_kpad-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:warning:initialization-of-struct-cxd2820r_priv-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-media-dvb-frontends-cxd2820r_priv.h:error:field-gpio_chip-has-incomplete-type
|   |-- drivers-mfd-htc-i2cpld.c:error:field-chip_in-has-incomplete-type
|   |-- drivers-mfd-htc-i2cpld.c:error:field-chip_out-has-incomplete-type
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-mfd-htc-i2cpld.c:error:invalid-use-of-undefined-type-struct-gpio_chip
|   |-- drivers-mfd-htc-i2cpld.c:warning:initialization-of-struct-htcpld_chip-from-int-makes-pointer-from-integer-without-a-cast
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip
|   |-- include-asm-generic-gpio.h:warning:returning-int-from-a-function-with-return-type-struct-gpio_chip-makes-pointer-from-integer-without-a-cast
|   `-- include-linux-gpio-driver.h:error:conflicting-types-for-gpiod_to_chip-have-struct-gpio_chip-(const-struct-gpio_desc-)
|-- sh-randconfig-r015-20210816
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip
|   |-- include-asm-generic-gpio.h:warning:returning-int-from-a-function-with-return-type-struct-gpio_chip-makes-pointer-from-integer-without-a-cast
|   `-- include-linux-gpio-driver.h:error:conflicting-types-for-gpiod_to_chip-have-struct-gpio_chip-(const-struct-gpio_desc-)
|-- sparc-allyesconfig
|   |-- drivers-input-keyboard-adp5588-keys.c:error:field-gc-has-incomplete-type
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-input-keyboard-adp5588-keys.c:warning:initialization-of-struct-adp5588_kpad-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-input-keyboard-adp5589-keys.c:error:field-gc-has-incomplete-type
|   |-- drivers-input-keyboard-adp5589-keys.c:error:implicit-declaration-of-function-devm_gpiochip_add_data
|   |-- drivers-input-keyboard-adp5589-keys.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-input-keyboard-adp5589-keys.c:warning:initialization-of-struct-adp5589_kpad-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:warning:initialization-of-struct-cxd2820r_priv-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-media-dvb-frontends-cxd2820r_priv.h:error:field-gpio_chip-has-incomplete-type
|   |-- drivers-mfd-htc-i2cpld.c:error:field-chip_in-has-incomplete-type
|   |-- drivers-mfd-htc-i2cpld.c:error:field-chip_out-has-incomplete-type
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-mfd-htc-i2cpld.c:error:invalid-use-of-undefined-type-struct-gpio_chip
|   |-- drivers-mfd-htc-i2cpld.c:warning:initialization-of-struct-htcpld_chip-from-int-makes-pointer-from-integer-without-a-cast
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip
|   |-- include-asm-generic-gpio.h:warning:returning-int-from-a-function-with-return-type-struct-gpio_chip-makes-pointer-from-integer-without-a-cast
|   `-- include-linux-gpio-driver.h:error:conflicting-types-for-gpiod_to_chip-have-struct-gpio_chip-(const-struct-gpio_desc-)
|-- sparc-randconfig-r026-20210816
|   |-- drivers-mfd-htc-i2cpld.c:error:field-chip_in-has-incomplete-type
|   |-- drivers-mfd-htc-i2cpld.c:error:field-chip_out-has-incomplete-type
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-mfd-htc-i2cpld.c:error:invalid-use-of-undefined-type-struct-gpio_chip
|   |-- drivers-mfd-htc-i2cpld.c:warning:initialization-of-struct-htcpld_chip-from-int-makes-pointer-from-integer-without-a-cast
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip
|   |-- include-asm-generic-gpio.h:warning:returning-int-from-a-function-with-return-type-struct-gpio_chip-makes-pointer-from-integer-without-a-cast
|   `-- include-linux-gpio-driver.h:error:conflicting-types-for-gpiod_to_chip-have-struct-gpio_chip-(const-struct-gpio_desc-)
|-- sparc64-randconfig-r016-20210816
|   `-- include-linux-gpio-driver.h:error:conflicting-types-for-gpiod_to_chip-have-struct-gpio_chip-(const-struct-gpio_desc-)
|-- x86_64-randconfig-a001-20210816
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:warning:initialization-of-struct-cxd2820r_priv-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-media-dvb-frontends-cxd2820r_priv.h:error:field-gpio_chip-has-incomplete-type
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip
|   `-- include-asm-generic-gpio.h:warning:returning-int-from-a-function-with-return-type-struct-gpio_chip-makes-pointer-from-integer-without-a-cast
|-- x86_64-randconfig-a002-20210816
|   |-- drivers-mfd-htc-i2cpld.c:error:field-chip_in-has-incomplete-type
|   |-- drivers-mfd-htc-i2cpld.c:error:field-chip_out-has-incomplete-type
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-mfd-htc-i2cpld.c:warning:initialization-of-struct-htcpld_chip-from-int-makes-pointer-from-integer-without-a-cast
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip
|   `-- include-asm-generic-gpio.h:warning:returning-int-from-a-function-with-return-type-struct-gpio_chip-makes-pointer-from-integer-without-a-cast
|-- x86_64-randconfig-a003-20210816
|   |-- drivers-input-keyboard-adp5588-keys.c:error:field-gc-has-incomplete-type
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-input-keyboard-adp5588-keys.c:warning:initialization-of-struct-adp5588_kpad-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-mfd-htc-i2cpld.c:error:field-chip_in-has-incomplete-type
|   |-- drivers-mfd-htc-i2cpld.c:error:field-chip_out-has-incomplete-type
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-mfd-htc-i2cpld.c:warning:initialization-of-struct-htcpld_chip-from-int-makes-pointer-from-integer-without-a-cast
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip
|   `-- include-asm-generic-gpio.h:warning:returning-int-from-a-function-with-return-type-struct-gpio_chip-makes-pointer-from-integer-without-a-cast
|-- x86_64-randconfig-a004-20210816
|   |-- drivers-mfd-htc-i2cpld.c:error:field-chip_in-has-incomplete-type
|   |-- drivers-mfd-htc-i2cpld.c:error:field-chip_out-has-incomplete-type
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-mfd-htc-i2cpld.c:warning:initialization-of-struct-htcpld_chip-from-int-makes-pointer-from-integer-without-a-cast
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip
|   `-- include-asm-generic-gpio.h:warning:returning-int-from-a-function-with-return-type-struct-gpio_chip-makes-pointer-from-integer-without-a-cast
|-- x86_64-randconfig-a005-20210816
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip
|   `-- include-asm-generic-gpio.h:warning:returning-int-from-a-function-with-return-type-struct-gpio_chip-makes-pointer-from-integer-without-a-cast
|-- x86_64-randconfig-a006-20210816
|   |-- drivers-input-keyboard-adp5588-keys.c:error:field-gc-has-incomplete-type
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-input-keyboard-adp5588-keys.c:warning:initialization-of-struct-adp5588_kpad-from-int-makes-pointer-from-integer-without-a-cast
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip
|   `-- include-asm-generic-gpio.h:warning:returning-int-from-a-function-with-return-type-struct-gpio_chip-makes-pointer-from-integer-without-a-cast
|-- x86_64-randconfig-c002-20210816
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:warning:initialization-of-struct-cxd2820r_priv-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-media-dvb-frontends-cxd2820r_priv.h:error:field-gpio_chip-has-incomplete-type
|   |-- drivers-mfd-htc-i2cpld.c:error:field-chip_in-has-incomplete-type
|   |-- drivers-mfd-htc-i2cpld.c:error:field-chip_out-has-incomplete-type
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-mfd-htc-i2cpld.c:warning:initialization-of-struct-htcpld_chip-from-int-makes-pointer-from-integer-without-a-cast
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip
|   |-- include-asm-generic-gpio.h:warning:returning-int-from-a-function-with-return-type-struct-gpio_chip-makes-pointer-from-integer-without-a-cast
|   `-- include-linux-spi-max7301.h:error:field-chip-has-incomplete-type
|-- x86_64-randconfig-c022-20210816
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip
|   `-- include-asm-generic-gpio.h:warning:returning-int-from-a-function-with-return-type-struct-gpio_chip-makes-pointer-from-integer-without-a-cast
|-- x86_64-randconfig-c024-20210816
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:warning:initialization-of-struct-cxd2820r_priv-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-media-dvb-frontends-cxd2820r_priv.h:error:field-gpio_chip-has-incomplete-type
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip
|   `-- include-asm-generic-gpio.h:warning:returning-int-from-a-function-with-return-type-struct-gpio_chip-makes-pointer-from-integer-without-a-cast
|-- x86_64-randconfig-r001-20210816
|   |-- drivers-mfd-htc-i2cpld.c:error:field-chip_in-has-incomplete-type
|   |-- drivers-mfd-htc-i2cpld.c:error:field-chip_out-has-incomplete-type
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-mfd-htc-i2cpld.c:warning:initialization-of-struct-htcpld_chip-from-int-makes-pointer-from-integer-without-a-cast
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip
|   `-- include-asm-generic-gpio.h:warning:returning-int-from-a-function-with-return-type-struct-gpio_chip-makes-pointer-from-integer-without-a-cast
|-- x86_64-randconfig-s021-20210816
|   |-- drivers-input-keyboard-adp5588-keys.c:error:field-gc-has-incomplete-type
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-input-keyboard-adp5588-keys.c:warning:initialization-of-struct-adp5588_kpad-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-input-keyboard-adp5589-keys.c:error:field-gc-has-incomplete-type
|   |-- drivers-input-keyboard-adp5589-keys.c:error:implicit-declaration-of-function-devm_gpiochip_add_data
|   |-- drivers-input-keyboard-adp5589-keys.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-input-keyboard-adp5589-keys.c:warning:initialization-of-struct-adp5589_kpad-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-mfd-htc-i2cpld.c:error:field-chip_in-has-incomplete-type
|   |-- drivers-mfd-htc-i2cpld.c:error:field-chip_out-has-incomplete-type
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-mfd-htc-i2cpld.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-mfd-htc-i2cpld.c:warning:initialization-of-struct-htcpld_chip-from-int-makes-pointer-from-integer-without-a-cast
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip
|   `-- include-asm-generic-gpio.h:warning:returning-int-from-a-function-with-return-type-struct-gpio_chip-makes-pointer-from-integer-without-a-cast
|-- x86_64-randconfig-s022-20210816
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:warning:initialization-of-struct-cxd2820r_priv-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-media-dvb-frontends-cxd2820r_priv.h:error:field-gpio_chip-has-incomplete-type
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip
|   `-- include-asm-generic-gpio.h:warning:returning-int-from-a-function-with-return-type-struct-gpio_chip-makes-pointer-from-integer-without-a-cast
|-- x86_64-rhel-8.3-kselftests
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:warning:initialization-of-struct-cxd2820r_priv-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-media-dvb-frontends-cxd2820r_priv.h:error:field-gpio_chip-has-incomplete-type
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip
|   `-- include-asm-generic-gpio.h:warning:returning-int-from-a-function-with-return-type-struct-gpio_chip-makes-pointer-from-integer-without-a-cast
|-- xtensa-allyesconfig
|   `-- include-linux-gpio-driver.h:error:conflicting-types-for-gpiod_to_chip-have-struct-gpio_chip-(const-struct-gpio_desc-)
|-- xtensa-randconfig-r005-20210816
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip
|   |-- include-asm-generic-gpio.h:warning:returning-int-from-a-function-with-return-type-struct-gpio_chip-makes-pointer-from-integer-without-a-cast
|   `-- include-linux-gpio-driver.h:error:conflicting-types-for-gpiod_to_chip-have-struct-gpio_chip-(const-struct-gpio_desc-)
`-- xtensa-randconfig-r024-20210816
    |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip
    |-- include-asm-generic-gpio.h:warning:returning-int-from-a-function-with-return-type-struct-gpio_chip-makes-pointer-from-integer-without-a-cast
    `-- include-linux-gpio-driver.h:error:conflicting-types-for-gpiod_to_chip-have-struct-gpio_chip-(const-struct-gpio_desc-)

clang_recent_errors
|-- arm-randconfig-r002-20210816
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_add_data-Werror-Wimplicit-function-declaration
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_get_data-Werror-Wimplicit-function-declaration
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_remove-Werror-Wimplicit-function-declaration
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:warning:incompatible-integer-to-pointer-conversion-initializing-struct-cxd2820r_priv-with-an-expression-of-type-int
|   `-- drivers-media-dvb-frontends-cxd2820r_priv.h:error:field-has-incomplete-type-struct-gpio_chip
|-- arm64-randconfig-r016-20210816
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_add_data-Werror-Wimplicit-function-declaration
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_get_data-Werror-Wimplicit-function-declaration
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_remove-Werror-Wimplicit-function-declaration
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:warning:incompatible-integer-to-pointer-conversion-initializing-struct-cxd2820r_priv-with-an-expression-of-type-int
|   |-- drivers-media-dvb-frontends-cxd2820r_priv.h:error:field-has-incomplete-type-struct-gpio_chip
|   |-- include-asm-generic-gpio.h:warning:incompatible-integer-to-pointer-conversion-returning-int-from-a-function-with-result-type-struct-gpio_chip
|   `-- include-linux-spi-max7301.h:error:field-has-incomplete-type-struct-gpio_chip
|-- hexagon-randconfig-r003-20210816
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip-Werror-Wimplicit-function-declaration
|   |-- include-asm-generic-gpio.h:warning:incompatible-integer-to-pointer-conversion-returning-int-from-a-function-with-result-type-struct-gpio_chip
|   `-- include-linux-ssb-ssb.h:error:field-has-incomplete-type-struct-gpio_chip
|-- hexagon-randconfig-r041-20210816
|   |-- drivers-gpio-gpio-ucb1400.c:error:implicit-declaration-of-function-devm_gpiochip_add_data-Werror-Wimplicit-function-declaration
|   |-- drivers-gpio-gpio-ucb1400.c:error:implicit-declaration-of-function-gpiochip_get_data-Werror-Wimplicit-function-declaration
|   |-- drivers-gpio-gpio-ucb1400.c:warning:incompatible-integer-to-pointer-conversion-assigning-to-struct-ucb1400_gpio-from-int
|   |-- drivers-input-keyboard-adp5589-keys.c:error:field-has-incomplete-type-struct-gpio_chip
|   |-- drivers-input-keyboard-adp5589-keys.c:error:implicit-declaration-of-function-devm_gpiochip_add_data-Werror-Wimplicit-function-declaration
|   |-- drivers-input-keyboard-adp5589-keys.c:error:implicit-declaration-of-function-gpiochip_get_data-Werror-Wimplicit-function-declaration
|   |-- drivers-input-keyboard-adp5589-keys.c:warning:incompatible-integer-to-pointer-conversion-initializing-struct-adp5589_kpad-with-an-expression-of-type-int
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip-Werror-Wimplicit-function-declaration
|   |-- include-asm-generic-gpio.h:warning:incompatible-integer-to-pointer-conversion-returning-int-from-a-function-with-result-type-struct-gpio_chip
|   |-- include-linux-bcma-bcma_driver_chipcommon.h:error:field-has-incomplete-type-struct-gpio_chip
|   |-- include-linux-gpio-driver.h:error:conflicting-types-for-gpiod_to_chip
|   |-- include-linux-spi-max7301.h:error:field-has-incomplete-type-struct-gpio_chip
|   `-- include-linux-ucb1400.h:error:field-has-incomplete-type-struct-gpio_chip
|-- hexagon-randconfig-r045-20210816
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip-Werror-Wimplicit-function-declaration
|   |-- include-asm-generic-gpio.h:warning:incompatible-integer-to-pointer-conversion-returning-int-from-a-function-with-result-type-struct-gpio_chip
|   |-- include-linux-bcma-bcma_driver_chipcommon.h:error:field-has-incomplete-type-struct-gpio_chip
|   |-- include-linux-gpio-driver.h:error:conflicting-types-for-gpiod_to_chip
|   `-- include-linux-spi-max7301.h:error:field-has-incomplete-type-struct-gpio_chip
|-- i386-randconfig-r022-20210816
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip-Werror-Wimplicit-function-declaration
|   |-- include-asm-generic-gpio.h:warning:incompatible-integer-to-pointer-conversion-returning-int-from-a-function-with-result-type-struct-gpio_chip
|   |-- include-linux-bcma-bcma_driver_chipcommon.h:error:field-has-incomplete-type-struct-gpio_chip
|   |-- include-linux-gpio-driver.h:error:conflicting-types-for-gpiod_to_chip
|   `-- include-linux-spi-max7301.h:error:field-has-incomplete-type-struct-gpio_chip
|-- powerpc-randconfig-r023-20210816
|   |-- drivers-input-keyboard-adp5588-keys.c:error:field-has-incomplete-type-struct-gpio_chip
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_add_data-Werror-Wimplicit-function-declaration
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_get_data-Werror-Wimplicit-function-declaration
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_remove-Werror-Wimplicit-function-declaration
|   |-- drivers-input-keyboard-adp5588-keys.c:warning:incompatible-integer-to-pointer-conversion-initializing-struct-adp5588_kpad-with-an-expression-of-type-int
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_add_data-Werror-Wimplicit-function-declaration
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_get_data-Werror-Wimplicit-function-declaration
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_remove-Werror-Wimplicit-function-declaration
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:warning:incompatible-integer-to-pointer-conversion-initializing-struct-cxd2820r_priv-with-an-expression-of-type-int
|   |-- drivers-media-dvb-frontends-cxd2820r_priv.h:error:field-has-incomplete-type-struct-gpio_chip
|   |-- drivers-mfd-htc-i2cpld.c:warning:incompatible-integer-to-pointer-conversion-initializing-struct-htcpld_chip-with-an-expression-of-type-int
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip-Werror-Wimplicit-function-declaration
|   |-- include-asm-generic-gpio.h:warning:incompatible-integer-to-pointer-conversion-returning-int-from-a-function-with-result-type-struct-gpio_chip
|   |-- include-linux-gpio-driver.h:error:conflicting-types-for-gpiod_to_chip
|   `-- include-linux-spi-max7301.h:error:field-has-incomplete-type-struct-gpio_chip
|-- riscv-randconfig-r012-20210816
|   |-- drivers-input-keyboard-adp5589-keys.c:warning:incompatible-integer-to-pointer-conversion-initializing-struct-adp5589_kpad-with-an-expression-of-type-int
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_add_data-Werror-Wimplicit-function-declaration
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_get_data-Werror-Wimplicit-function-declaration
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_remove-Werror-Wimplicit-function-declaration
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:warning:incompatible-integer-to-pointer-conversion-initializing-struct-cxd2820r_priv-with-an-expression-of-type-int
|   |-- drivers-media-dvb-frontends-cxd2820r_priv.h:error:field-has-incomplete-type-struct-gpio_chip
|   `-- include-asm-generic-gpio.h:warning:incompatible-integer-to-pointer-conversion-returning-int-from-a-function-with-result-type-struct-gpio_chip
|-- riscv-randconfig-r025-20210816
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip-Werror-Wimplicit-function-declaration
|   |-- include-asm-generic-gpio.h:warning:incompatible-integer-to-pointer-conversion-returning-int-from-a-function-with-result-type-struct-gpio_chip
|   |-- include-linux-bcma-bcma_driver_chipcommon.h:error:field-has-incomplete-type-struct-gpio_chip
|   |-- include-linux-gpio-driver.h:error:conflicting-types-for-gpiod_to_chip
|   `-- include-linux-spi-max7301.h:error:field-has-incomplete-type-struct-gpio_chip
|-- riscv-randconfig-r042-20210816
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip-Werror-Wimplicit-function-declaration
|   |-- include-asm-generic-gpio.h:warning:incompatible-integer-to-pointer-conversion-returning-int-from-a-function-with-result-type-struct-gpio_chip
|   |-- include-linux-gpio-driver.h:error:conflicting-types-for-gpiod_to_chip
|   `-- include-linux-spi-max7301.h:error:field-has-incomplete-type-struct-gpio_chip
|-- x86_64-randconfig-a011-20210816
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip-Werror-Wimplicit-function-declaration
|   |-- include-asm-generic-gpio.h:warning:incompatible-integer-to-pointer-conversion-returning-int-from-a-function-with-result-type-struct-gpio_chip
|   |-- include-linux-bcma-bcma_driver_chipcommon.h:error:field-has-incomplete-type-struct-gpio_chip
|   |-- include-linux-gpio-driver.h:error:conflicting-types-for-gpiod_to_chip
|   `-- include-linux-ssb-ssb.h:error:field-has-incomplete-type-struct-gpio_chip
|-- x86_64-randconfig-a012-20210816
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_add_data-Werror-Wimplicit-function-declaration
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_get_data-Werror-Wimplicit-function-declaration
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_remove-Werror-Wimplicit-function-declaration
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:warning:incompatible-integer-to-pointer-conversion-initializing-struct-cxd2820r_priv-with-an-expression-of-type-int
|   |-- drivers-media-dvb-frontends-cxd2820r_priv.h:error:field-has-incomplete-type-struct-gpio_chip
|   `-- include-asm-generic-gpio.h:warning:incompatible-integer-to-pointer-conversion-returning-int-from-a-function-with-result-type-struct-gpio_chip
|-- x86_64-randconfig-a013-20210816
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_add_data-Werror-Wimplicit-function-declaration
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_get_data-Werror-Wimplicit-function-declaration
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_remove-Werror-Wimplicit-function-declaration
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:warning:incompatible-integer-to-pointer-conversion-initializing-struct-cxd2820r_priv-with-an-expression-of-type-int
|   |-- drivers-media-dvb-frontends-cxd2820r_priv.h:error:field-has-incomplete-type-struct-gpio_chip
|   `-- drivers-mfd-htc-i2cpld.c:warning:incompatible-integer-to-pointer-conversion-initializing-struct-htcpld_chip-with-an-expression-of-type-int
|-- x86_64-randconfig-a014-20210816
|   |-- drivers-input-keyboard-adp5589-keys.c:warning:incompatible-integer-to-pointer-conversion-initializing-struct-adp5589_kpad-with-an-expression-of-type-int
|   `-- include-asm-generic-gpio.h:warning:incompatible-integer-to-pointer-conversion-returning-int-from-a-function-with-result-type-struct-gpio_chip
|-- x86_64-randconfig-a015-20210816
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_add_data-Werror-Wimplicit-function-declaration
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_get_data-Werror-Wimplicit-function-declaration
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_remove-Werror-Wimplicit-function-declaration
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:warning:incompatible-integer-to-pointer-conversion-initializing-struct-cxd2820r_priv-with-an-expression-of-type-int
|   |-- drivers-media-dvb-frontends-cxd2820r_priv.h:error:field-has-incomplete-type-struct-gpio_chip
|   |-- drivers-net-ethernet-broadcom-tg3.c:warning:shift-count-width-of-type
|   `-- include-asm-generic-gpio.h:warning:incompatible-integer-to-pointer-conversion-returning-int-from-a-function-with-result-type-struct-gpio_chip
|-- x86_64-randconfig-a016-20210816
|   |-- drivers-input-keyboard-adp5588-keys.c:error:field-has-incomplete-type-struct-gpio_chip
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_add_data-Werror-Wimplicit-function-declaration
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_get_data-Werror-Wimplicit-function-declaration
|   |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_remove-Werror-Wimplicit-function-declaration
|   |-- drivers-input-keyboard-adp5588-keys.c:warning:incompatible-integer-to-pointer-conversion-initializing-struct-adp5588_kpad-with-an-expression-of-type-int
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_add_data-Werror-Wimplicit-function-declaration
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_get_data-Werror-Wimplicit-function-declaration
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_remove-Werror-Wimplicit-function-declaration
|   |-- drivers-media-dvb-frontends-cxd2820r_core.c:warning:incompatible-integer-to-pointer-conversion-initializing-struct-cxd2820r_priv-with-an-expression-of-type-int
|   `-- drivers-media-dvb-frontends-cxd2820r_priv.h:error:field-has-incomplete-type-struct-gpio_chip
|-- x86_64-randconfig-c001-20210816
|   `-- drivers-input-keyboard-adp5589-keys.c:warning:incompatible-integer-to-pointer-conversion-initializing-struct-adp5589_kpad-with-an-expression-of-type-int
`-- x86_64-randconfig-r023-20210816
    |-- drivers-input-keyboard-adp5588-keys.c:error:field-has-incomplete-type-struct-gpio_chip
    |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_add_data-Werror-Wimplicit-function-declaration
    |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_get_data-Werror-Wimplicit-function-declaration
    |-- drivers-input-keyboard-adp5588-keys.c:error:implicit-declaration-of-function-gpiochip_remove-Werror-Wimplicit-function-declaration
    |-- drivers-input-keyboard-adp5588-keys.c:warning:incompatible-integer-to-pointer-conversion-initializing-struct-adp5588_kpad-with-an-expression-of-type-int
    |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_add_data-Werror-Wimplicit-function-declaration
    |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_get_data-Werror-Wimplicit-function-declaration
    |-- drivers-media-dvb-frontends-cxd2820r_core.c:error:implicit-declaration-of-function-gpiochip_remove-Werror-Wimplicit-function-declaration
    |-- drivers-media-dvb-frontends-cxd2820r_core.c:warning:incompatible-integer-to-pointer-conversion-initializing-struct-cxd2820r_priv-with-an-expression-of-type-int
    |-- drivers-media-dvb-frontends-cxd2820r_priv.h:error:field-has-incomplete-type-struct-gpio_chip
    |-- drivers-mfd-htc-i2cpld.c:warning:incompatible-integer-to-pointer-conversion-initializing-struct-htcpld_chip-with-an-expression-of-type-int
    |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip-Werror-Wimplicit-function-declaration
    |-- include-asm-generic-gpio.h:warning:incompatible-integer-to-pointer-conversion-returning-int-from-a-function-with-result-type-struct-gpio_chip
    |-- include-linux-gpio-driver.h:error:conflicting-types-for-gpiod_to_chip
    `-- include-linux-ssb-ssb.h:error:field-has-incomplete-type-struct-gpio_chip

elapsed time: 724m

configs tested: 98
configs skipped: 4

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20210816
alpha                            alldefconfig
mips                       capcella_defconfig
riscv             nommu_k210_sdcard_defconfig
powerpc                 mpc837x_rdb_defconfig
h8300                     edosk2674_defconfig
powerpc                    klondike_defconfig
riscv                    nommu_virt_defconfig
arm                        keystone_defconfig
arm                            zeus_defconfig
mips                      malta_kvm_defconfig
arm                         palmz72_defconfig
mips                      pistachio_defconfig
mips                        bcm63xx_defconfig
i386                             alldefconfig
powerpc                      pcm030_defconfig
openrisc                            defconfig
arm                           tegra_defconfig
arm                         s3c2410_defconfig
arm                           h5000_defconfig
powerpc                      pmac32_defconfig
sh                  sh7785lcr_32bit_defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a006-20210816
x86_64               randconfig-a004-20210816
x86_64               randconfig-a003-20210816
x86_64               randconfig-a001-20210816
x86_64               randconfig-a005-20210816
x86_64               randconfig-a002-20210816
i386                 randconfig-a004-20210816
i386                 randconfig-a003-20210816
i386                 randconfig-a002-20210816
i386                 randconfig-a001-20210816
i386                 randconfig-a006-20210816
i386                 randconfig-a005-20210816
i386                 randconfig-a011-20210816
i386                 randconfig-a015-20210816
i386                 randconfig-a013-20210816
i386                 randconfig-a014-20210816
i386                 randconfig-a016-20210816
i386                 randconfig-a012-20210816
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-c001-20210816
x86_64               randconfig-a011-20210816
x86_64               randconfig-a013-20210816
x86_64               randconfig-a016-20210816
x86_64               randconfig-a012-20210816
x86_64               randconfig-a015-20210816
x86_64               randconfig-a014-20210816

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
