Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE1A62152C4
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jul 2020 08:43:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725889AbgGFGnF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Jul 2020 02:43:05 -0400
Received: from mga04.intel.com ([192.55.52.120]:40545 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727923AbgGFGnE (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 6 Jul 2020 02:43:04 -0400
IronPort-SDR: ek/wL2hReIDBDDXOXxxK4qN9qQfEZYoq93A1zBtfvJ80zZwcoT+OzmT5lcdo8jH1/p3IiPZB02
 BpycaV9jGa0A==
X-IronPort-AV: E=McAfee;i="6000,8403,9673"; a="144868624"
X-IronPort-AV: E=Sophos;i="5.75,318,1589266800"; 
   d="scan'208";a="144868624"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2020 23:42:56 -0700
IronPort-SDR: nMHhDJiQzeWkRDGDANrXvp+tBsLY0P9HeTn9mWiQ9+98t+VeCtq2ofzrj1WGXdJhOKtaENP7yr
 LeMnWmxRA1vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,318,1589266800"; 
   d="scan'208";a="456591848"
Received: from lkp-server01.sh.intel.com (HELO 82346ce9ac16) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 05 Jul 2020 23:42:54 -0700
Received: from kbuild by 82346ce9ac16 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jsKq2-00006s-85; Mon, 06 Jul 2020 06:42:50 +0000
Date:   Mon, 06 Jul 2020 14:42:06 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [gpio:gpiochip-no-driver-h] BUILD REGRESSION
 2ade795a7e0399423f07a9b077b820792be52f5c
Message-ID: <5f02c7be.QzvJyAFU2S6U0KKw%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git  gpiochip-no-driver-h
branch HEAD: 2ade795a7e0399423f07a9b077b820792be52f5c  See what explodes if we apply this patch

Error/Warning in current branch:

arch/mips/alchemy/common/gpiolib.c:145:15: error: variable 'au1300_gpiochip' has initializer but incomplete type
arch/mips/alchemy/common/gpiolib.c:145:25: error: storage size of 'au1300_gpiochip' isn't known
arch/mips/alchemy/common/gpiolib.c:146:13: warning: excess elements in struct initializer
arch/mips/alchemy/common/gpiolib.c:146:3: error: 'struct gpio_chip' has no member named 'label'
arch/mips/alchemy/common/gpiolib.c:147:3: error: 'struct gpio_chip' has no member named 'direction_input'
arch/mips/alchemy/common/gpiolib.c:148:3: error: 'struct gpio_chip' has no member named 'direction_output'
arch/mips/alchemy/common/gpiolib.c:149:3: error: 'struct gpio_chip' has no member named 'get'
arch/mips/alchemy/common/gpiolib.c:150:3: error: 'struct gpio_chip' has no member named 'set'
arch/mips/alchemy/common/gpiolib.c:151:3: error: 'struct gpio_chip' has no member named 'to_irq'
arch/mips/alchemy/common/gpiolib.c:152:12: note: in expansion of macro 'AU1300_GPIO_BASE'
arch/mips/alchemy/common/gpiolib.c:152:3: error: 'struct gpio_chip' has no member named 'base'
arch/mips/alchemy/common/gpiolib.c:153:13: note: in expansion of macro 'AU1300_GPIO_NUM'
arch/mips/alchemy/common/gpiolib.c:153:3: error: 'struct gpio_chip' has no member named 'ngpio'
arch/mips/alchemy/common/gpiolib.c:162:9: error: implicit declaration of function 'gpiochip_add_data' [-Werror=implicit-function-declaration]
arch/mips/alchemy/common/gpiolib.c:96:18: error: array type has incomplete element type 'struct gpio_chip'
arch/mips/alchemy/common/gpiolib.c:97:3: error: array index in non-array initializer
arch/mips/alchemy/common/gpiolib.c:98:3: error: field name not in record or union initializer
arch/mips/include/asm/mach-au1x00/gpio-au1300.h:22:26: warning: excess elements in struct initializer
drivers/input/keyboard/adp5588-keys.c:76:30: warning: initialization makes pointer from integer without a cast [-Wint-conversion]
drivers/net/wireless/broadcom/brcm80211/brcmsmac/led.c:71:44: error: dereferencing pointer to incomplete type 'struct gpio_chip'
drivers/pcmcia/pxa2xx_viper.c:164:34: error: array type has incomplete element type 'struct platform_device_id'
drivers/pcmcia/pxa2xx_viper.c:165:4: error: field name not in record or union initializer
drivers/power/supply/sbs-manager.c:195:27: warning: initialization makes pointer from integer without a cast [-Wint-conversion]
drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c:541:2: error: implicit declaration of function 'of_node_put' [-Werror=implicit-function-declaration]
drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c:541:2: error: implicit declaration of function 'of_node_put'; did you mean 'bpf_module_put'? [-Werror=implicit-function-declaration]
drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c:543:2: error: implicit declaration of function 'of_node_put' [-Werror=implicit-function-declaration]
drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c:789:34: error: array type has incomplete element type 'struct of_device_id'
drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c:790:4: error: field name not in record or union initializer
drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c:791:34: error: array type has incomplete element type 'struct of_device_id'
drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c:792:4: error: field name not in record or union initializer
drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c:573:2: error: implicit declaration of function 'of_node_put' [-Werror=implicit-function-declaration]
drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c:573:2: error: implicit declaration of function 'of_node_put'; did you mean 'bpf_module_put'? [-Werror=implicit-function-declaration]
drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c:830:34: error: array type has incomplete element type 'struct of_device_id'
drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c:831:4: error: field name not in record or union initializer
include/asm-generic/gpio.h:58:9: error: returning 'int' from a function with return type 'struct gpio_chip *' makes pointer from integer without a cast [-Werror=int-conversion]
include/asm-generic/gpio.h:58:9: warning: return makes pointer from integer without a cast [-Wint-conversion]
include/linux/ssb/ssb.h:496:19: error: field 'gpio' has incomplete type

Error/Warning ids grouped by kconfigs:

recent_errors
|-- alpha-allyesconfig
|   |-- drivers-net-wireless-broadcom-brcm80211-brcmsmac-led.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi4.c:error:array-type-has-incomplete-element-type-struct-of_device_id
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi4.c:error:field-name-not-in-record-or-union-initializer
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi4.c:error:implicit-declaration-of-function-of_node_put
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi5.c:error:array-type-has-incomplete-element-type-struct-of_device_id
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi5.c:error:field-name-not-in-record-or-union-initializer
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi5.c:error:implicit-declaration-of-function-of_node_put
|   `-- include-linux-ssb-ssb.h:error:field-gpio-has-incomplete-type
|-- arc-allmodconfig
|   |-- drivers-net-wireless-broadcom-brcm80211-brcmsmac-led.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi4.c:error:array-type-has-incomplete-element-type-struct-of_device_id
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi4.c:error:field-name-not-in-record-or-union-initializer
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi4.c:error:implicit-declaration-of-function-of_node_put
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi5.c:error:array-type-has-incomplete-element-type-struct-of_device_id
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi5.c:error:field-name-not-in-record-or-union-initializer
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi5.c:error:implicit-declaration-of-function-of_node_put
|   `-- include-linux-ssb-ssb.h:error:field-gpio-has-incomplete-type
|-- arc-allyesconfig
|   |-- drivers-net-wireless-broadcom-brcm80211-brcmsmac-led.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi4.c:error:array-type-has-incomplete-element-type-struct-of_device_id
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi4.c:error:field-name-not-in-record-or-union-initializer
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi4.c:error:implicit-declaration-of-function-of_node_put
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi5.c:error:array-type-has-incomplete-element-type-struct-of_device_id
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi5.c:error:field-name-not-in-record-or-union-initializer
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi5.c:error:implicit-declaration-of-function-of_node_put
|   `-- include-linux-ssb-ssb.h:error:field-gpio-has-incomplete-type
|-- arc-randconfig-c003-20200705
|   `-- include-linux-ssb-ssb.h:error:field-gpio-has-incomplete-type
|-- arc-randconfig-c024-20200706
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi5.c:error:array-type-has-incomplete-element-type-struct-of_device_id
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi5.c:error:field-name-not-in-record-or-union-initializer
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi5.c:error:implicit-declaration-of-function-of_node_put
|   `-- include-linux-ssb-ssb.h:error:field-gpio-has-incomplete-type
|-- arm-allmodconfig
|   |-- drivers-net-wireless-broadcom-brcm80211-brcmsmac-led.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   `-- include-linux-ssb-ssb.h:error:field-gpio-has-incomplete-type
|-- arm-allyesconfig
|   |-- drivers-net-wireless-broadcom-brcm80211-brcmsmac-led.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   `-- include-linux-ssb-ssb.h:error:field-gpio-has-incomplete-type
|-- arm-pxa_defconfig
|   |-- drivers-pcmcia-pxa2xx_viper.c:error:array-type-has-incomplete-element-type-struct-platform_device_id
|   `-- drivers-pcmcia-pxa2xx_viper.c:error:field-name-not-in-record-or-union-initializer
|-- arm-viper_defconfig
|   |-- drivers-pcmcia-pxa2xx_viper.c:error:array-type-has-incomplete-element-type-struct-platform_device_id
|   `-- drivers-pcmcia-pxa2xx_viper.c:error:field-name-not-in-record-or-union-initializer
|-- arm64-allmodconfig
|   |-- drivers-net-wireless-broadcom-brcm80211-brcmsmac-led.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi4.c:error:array-type-has-incomplete-element-type-struct-of_device_id
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi4.c:error:field-name-not-in-record-or-union-initializer
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi4.c:error:implicit-declaration-of-function-of_node_put
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi5.c:error:array-type-has-incomplete-element-type-struct-of_device_id
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi5.c:error:field-name-not-in-record-or-union-initializer
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi5.c:error:implicit-declaration-of-function-of_node_put
|   `-- include-linux-ssb-ssb.h:error:field-gpio-has-incomplete-type
|-- arm64-allyesconfig
|   |-- drivers-net-wireless-broadcom-brcm80211-brcmsmac-led.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi4.c:error:array-type-has-incomplete-element-type-struct-of_device_id
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi4.c:error:field-name-not-in-record-or-union-initializer
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi4.c:error:implicit-declaration-of-function-of_node_put
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi5.c:error:array-type-has-incomplete-element-type-struct-of_device_id
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi5.c:error:field-name-not-in-record-or-union-initializer
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi5.c:error:implicit-declaration-of-function-of_node_put
|   `-- include-linux-ssb-ssb.h:error:field-gpio-has-incomplete-type
|-- arm64-randconfig-c023-20200706
|   `-- include-linux-ssb-ssb.h:error:field-gpio-has-incomplete-type
|-- c6x-allmodconfig
|   |-- drivers-net-wireless-broadcom-brcm80211-brcmsmac-led.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   `-- include-linux-ssb-ssb.h:error:field-gpio-has-incomplete-type
|-- c6x-allyesconfig
|   |-- drivers-net-wireless-broadcom-brcm80211-brcmsmac-led.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   `-- include-linux-ssb-ssb.h:error:field-gpio-has-incomplete-type
|-- c6x-randconfig-c024-20200705
|   `-- include-linux-ssb-ssb.h:error:field-gpio-has-incomplete-type
|-- h8300-allmodconfig
|   |-- drivers-net-wireless-broadcom-brcm80211-brcmsmac-led.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   `-- include-linux-ssb-ssb.h:error:field-gpio-has-incomplete-type
|-- h8300-allyesconfig
|   |-- drivers-net-wireless-broadcom-brcm80211-brcmsmac-led.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   `-- include-linux-ssb-ssb.h:error:field-gpio-has-incomplete-type
|-- h8300-randconfig-r013-20200701
|   `-- include-linux-ssb-ssb.h:error:field-gpio-has-incomplete-type
|-- i386-allmodconfig
|   |-- drivers-net-wireless-broadcom-brcm80211-brcmsmac-led.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi4.c:error:array-type-has-incomplete-element-type-struct-of_device_id
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi4.c:error:field-name-not-in-record-or-union-initializer
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi4.c:error:implicit-declaration-of-function-of_node_put
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi5.c:error:array-type-has-incomplete-element-type-struct-of_device_id
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi5.c:error:field-name-not-in-record-or-union-initializer
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi5.c:error:implicit-declaration-of-function-of_node_put
|   `-- include-linux-ssb-ssb.h:error:field-gpio-has-incomplete-type
|-- i386-allyesconfig
|   |-- drivers-net-wireless-broadcom-brcm80211-brcmsmac-led.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi4.c:error:array-type-has-incomplete-element-type-struct-of_device_id
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi4.c:error:field-name-not-in-record-or-union-initializer
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi4.c:error:implicit-declaration-of-function-of_node_put
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi5.c:error:array-type-has-incomplete-element-type-struct-of_device_id
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi5.c:error:field-name-not-in-record-or-union-initializer
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi5.c:error:implicit-declaration-of-function-of_node_put
|   `-- include-linux-ssb-ssb.h:error:field-gpio-has-incomplete-type
|-- i386-randconfig-c001-20200705
|   `-- include-linux-ssb-ssb.h:error:field-gpio-has-incomplete-type
|-- i386-randconfig-r023-20200705
|   |-- drivers-input-keyboard-adp5588-keys.c:warning:initialization-makes-pointer-from-integer-without-a-cast
|   |-- drivers-power-supply-sbs-manager.c:warning:initialization-makes-pointer-from-integer-without-a-cast
|   `-- include-asm-generic-gpio.h:warning:return-makes-pointer-from-integer-without-a-cast
|-- i386-randconfig-s001-20200702
|   `-- include-linux-ssb-ssb.h:error:field-gpio-has-incomplete-type
|-- i386-randconfig-s002-20200704
|   `-- include-linux-ssb-ssb.h:error:field-gpio-has-incomplete-type
|-- ia64-allmodconfig
|   |-- drivers-net-wireless-broadcom-brcm80211-brcmsmac-led.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi4.c:error:array-type-has-incomplete-element-type-struct-of_device_id
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi4.c:error:field-name-not-in-record-or-union-initializer
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi4.c:error:implicit-declaration-of-function-of_node_put
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi5.c:error:array-type-has-incomplete-element-type-struct-of_device_id
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi5.c:error:field-name-not-in-record-or-union-initializer
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi5.c:error:implicit-declaration-of-function-of_node_put
|   `-- include-linux-ssb-ssb.h:error:field-gpio-has-incomplete-type
|-- ia64-allyesconfig
|   |-- drivers-net-wireless-broadcom-brcm80211-brcmsmac-led.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi4.c:error:array-type-has-incomplete-element-type-struct-of_device_id
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi4.c:error:field-name-not-in-record-or-union-initializer
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi4.c:error:implicit-declaration-of-function-of_node_put
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi5.c:error:array-type-has-incomplete-element-type-struct-of_device_id
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi5.c:error:field-name-not-in-record-or-union-initializer
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi5.c:error:implicit-declaration-of-function-of_node_put
|   `-- include-linux-ssb-ssb.h:error:field-gpio-has-incomplete-type
|-- ia64-randconfig-r034-20200706
|   `-- include-linux-ssb-ssb.h:error:field-gpio-has-incomplete-type
|-- m68k-allmodconfig
|   |-- drivers-net-wireless-broadcom-brcm80211-brcmsmac-led.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi4.c:error:array-type-has-incomplete-element-type-struct-of_device_id
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi4.c:error:field-name-not-in-record-or-union-initializer
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi4.c:error:implicit-declaration-of-function-of_node_put
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi5.c:error:array-type-has-incomplete-element-type-struct-of_device_id
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi5.c:error:field-name-not-in-record-or-union-initializer
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi5.c:error:implicit-declaration-of-function-of_node_put
|   `-- include-linux-ssb-ssb.h:error:field-gpio-has-incomplete-type
|-- m68k-allyesconfig
|   |-- drivers-net-wireless-broadcom-brcm80211-brcmsmac-led.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi4.c:error:array-type-has-incomplete-element-type-struct-of_device_id
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi4.c:error:field-name-not-in-record-or-union-initializer
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi4.c:error:implicit-declaration-of-function-of_node_put
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi5.c:error:array-type-has-incomplete-element-type-struct-of_device_id
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi5.c:error:field-name-not-in-record-or-union-initializer
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi5.c:error:implicit-declaration-of-function-of_node_put
|   `-- include-linux-ssb-ssb.h:error:field-gpio-has-incomplete-type
|-- m68k-randconfig-r026-20200702
|   `-- include-linux-ssb-ssb.h:error:field-gpio-has-incomplete-type
|-- microblaze-randconfig-c022-20200705
|   `-- include-linux-ssb-ssb.h:error:field-gpio-has-incomplete-type
|-- mips-allmodconfig
|   |-- drivers-net-wireless-broadcom-brcm80211-brcmsmac-led.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   `-- include-linux-ssb-ssb.h:error:field-gpio-has-incomplete-type
|-- mips-allyesconfig
|   |-- drivers-net-wireless-broadcom-brcm80211-brcmsmac-led.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   `-- include-linux-ssb-ssb.h:error:field-gpio-has-incomplete-type
|-- mips-db1xxx_defconfig
|   |-- arch-mips-alchemy-common-gpiolib.c:error:array-index-in-non-array-initializer
|   |-- arch-mips-alchemy-common-gpiolib.c:error:array-type-has-incomplete-element-type-struct-gpio_chip
|   |-- arch-mips-alchemy-common-gpiolib.c:error:field-name-not-in-record-or-union-initializer
|   |-- arch-mips-alchemy-common-gpiolib.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- arch-mips-alchemy-common-gpiolib.c:error:storage-size-of-au1300_gpiochip-isn-t-known
|   |-- arch-mips-alchemy-common-gpiolib.c:error:struct-gpio_chip-has-no-member-named-base
|   |-- arch-mips-alchemy-common-gpiolib.c:error:struct-gpio_chip-has-no-member-named-direction_input
|   |-- arch-mips-alchemy-common-gpiolib.c:error:struct-gpio_chip-has-no-member-named-direction_output
|   |-- arch-mips-alchemy-common-gpiolib.c:error:struct-gpio_chip-has-no-member-named-get
|   |-- arch-mips-alchemy-common-gpiolib.c:error:struct-gpio_chip-has-no-member-named-label
|   |-- arch-mips-alchemy-common-gpiolib.c:error:struct-gpio_chip-has-no-member-named-ngpio
|   |-- arch-mips-alchemy-common-gpiolib.c:error:struct-gpio_chip-has-no-member-named-set
|   |-- arch-mips-alchemy-common-gpiolib.c:error:struct-gpio_chip-has-no-member-named-to_irq
|   |-- arch-mips-alchemy-common-gpiolib.c:error:variable-au1300_gpiochip-has-initializer-but-incomplete-type
|   |-- arch-mips-alchemy-common-gpiolib.c:note:in-expansion-of-macro-AU1300_GPIO_BASE
|   |-- arch-mips-alchemy-common-gpiolib.c:note:in-expansion-of-macro-AU1300_GPIO_NUM
|   |-- arch-mips-alchemy-common-gpiolib.c:warning:excess-elements-in-struct-initializer
|   `-- arch-mips-include-asm-mach-au1x00-gpio-au1300.h:warning:excess-elements-in-struct-initializer
|-- mips-randconfig-c021-20200705
|   |-- drivers-net-wireless-broadcom-brcm80211-brcmsmac-led.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   `-- include-linux-ssb-ssb.h:error:field-gpio-has-incomplete-type
|-- nds32-allmodconfig
|   |-- drivers-net-wireless-broadcom-brcm80211-brcmsmac-led.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi4.c:error:array-type-has-incomplete-element-type-struct-of_device_id
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi4.c:error:field-name-not-in-record-or-union-initializer
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi4.c:error:implicit-declaration-of-function-of_node_put
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi5.c:error:array-type-has-incomplete-element-type-struct-of_device_id
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi5.c:error:field-name-not-in-record-or-union-initializer
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi5.c:error:implicit-declaration-of-function-of_node_put
|   `-- include-linux-ssb-ssb.h:error:field-gpio-has-incomplete-type
|-- nios2-allyesconfig
|   |-- drivers-net-wireless-broadcom-brcm80211-brcmsmac-led.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   `-- include-linux-ssb-ssb.h:error:field-gpio-has-incomplete-type
|-- openrisc-allyesconfig
|   |-- drivers-net-wireless-broadcom-brcm80211-brcmsmac-led.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi4.c:error:array-type-has-incomplete-element-type-struct-of_device_id
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi4.c:error:field-name-not-in-record-or-union-initializer
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi4.c:error:implicit-declaration-of-function-of_node_put
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi5.c:error:array-type-has-incomplete-element-type-struct-of_device_id
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi5.c:error:field-name-not-in-record-or-union-initializer
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi5.c:error:implicit-declaration-of-function-of_node_put
|   `-- include-linux-ssb-ssb.h:error:field-gpio-has-incomplete-type
|-- parisc-allmodconfig
|   |-- drivers-net-wireless-broadcom-brcm80211-brcmsmac-led.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi4.c:error:implicit-declaration-of-function-of_node_put
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi5.c:error:implicit-declaration-of-function-of_node_put
|   `-- include-linux-ssb-ssb.h:error:field-gpio-has-incomplete-type
|-- parisc-allyesconfig
|   |-- drivers-net-wireless-broadcom-brcm80211-brcmsmac-led.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi4.c:error:implicit-declaration-of-function-of_node_put
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi5.c:error:implicit-declaration-of-function-of_node_put
|   `-- include-linux-ssb-ssb.h:error:field-gpio-has-incomplete-type
|-- parisc-randconfig-c003-20200706
|   `-- include-linux-ssb-ssb.h:error:field-gpio-has-incomplete-type
|-- parisc-randconfig-r016-20200706
|   `-- include-linux-ssb-ssb.h:error:field-gpio-has-incomplete-type
|-- powerpc-allmodconfig
|   |-- drivers-net-wireless-broadcom-brcm80211-brcmsmac-led.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   `-- include-linux-ssb-ssb.h:error:field-gpio-has-incomplete-type
|-- powerpc-allyesconfig
|   |-- drivers-net-wireless-broadcom-brcm80211-brcmsmac-led.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   `-- include-linux-ssb-ssb.h:error:field-gpio-has-incomplete-type
|-- powerpc-ppc6xx_defconfig
|   `-- include-asm-generic-gpio.h:error:returning-int-from-a-function-with-return-type-struct-gpio_chip-makes-pointer-from-integer-without-a-cast
|-- riscv-allmodconfig
|   |-- drivers-net-wireless-broadcom-brcm80211-brcmsmac-led.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi4.c:error:array-type-has-incomplete-element-type-struct-of_device_id
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi4.c:error:field-name-not-in-record-or-union-initializer
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi4.c:error:implicit-declaration-of-function-of_node_put
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi5.c:error:array-type-has-incomplete-element-type-struct-of_device_id
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi5.c:error:field-name-not-in-record-or-union-initializer
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi5.c:error:implicit-declaration-of-function-of_node_put
|   `-- include-linux-ssb-ssb.h:error:field-gpio-has-incomplete-type
|-- riscv-allyesconfig
|   |-- drivers-net-wireless-broadcom-brcm80211-brcmsmac-led.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi4.c:error:array-type-has-incomplete-element-type-struct-of_device_id
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi4.c:error:field-name-not-in-record-or-union-initializer
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi4.c:error:implicit-declaration-of-function-of_node_put
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi5.c:error:array-type-has-incomplete-element-type-struct-of_device_id
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi5.c:error:field-name-not-in-record-or-union-initializer
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi5.c:error:implicit-declaration-of-function-of_node_put
|   `-- include-linux-ssb-ssb.h:error:field-gpio-has-incomplete-type
|-- riscv-randconfig-r021-20200705
|   `-- include-linux-ssb-ssb.h:error:field-gpio-has-incomplete-type
|-- s390-allmodconfig
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi4.c:error:array-type-has-incomplete-element-type-struct-of_device_id
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi4.c:error:field-name-not-in-record-or-union-initializer
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi4.c:error:implicit-declaration-of-function-of_node_put
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi5.c:error:array-type-has-incomplete-element-type-struct-of_device_id
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi5.c:error:field-name-not-in-record-or-union-initializer
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi5.c:error:implicit-declaration-of-function-of_node_put
|   `-- include-linux-ssb-ssb.h:error:field-gpio-has-incomplete-type
|-- s390-allyesconfig
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi4.c:error:array-type-has-incomplete-element-type-struct-of_device_id
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi4.c:error:field-name-not-in-record-or-union-initializer
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi4.c:error:implicit-declaration-of-function-of_node_put
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi5.c:error:array-type-has-incomplete-element-type-struct-of_device_id
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi5.c:error:field-name-not-in-record-or-union-initializer
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi5.c:error:implicit-declaration-of-function-of_node_put
|   `-- include-linux-ssb-ssb.h:error:field-gpio-has-incomplete-type
|-- sh-allmodconfig
|   |-- drivers-net-wireless-broadcom-brcm80211-brcmsmac-led.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi4.c:error:array-type-has-incomplete-element-type-struct-of_device_id
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi4.c:error:field-name-not-in-record-or-union-initializer
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi4.c:error:implicit-declaration-of-function-of_node_put
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi5.c:error:array-type-has-incomplete-element-type-struct-of_device_id
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi5.c:error:field-name-not-in-record-or-union-initializer
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi5.c:error:implicit-declaration-of-function-of_node_put
|   `-- include-linux-ssb-ssb.h:error:field-gpio-has-incomplete-type
|-- sh-randconfig-c003-20200705
|   `-- include-linux-ssb-ssb.h:error:field-gpio-has-incomplete-type
|-- sparc-allyesconfig
|   |-- drivers-net-wireless-broadcom-brcm80211-brcmsmac-led.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   `-- include-linux-ssb-ssb.h:error:field-gpio-has-incomplete-type
|-- sparc-randconfig-c004-20200705
|   `-- include-linux-ssb-ssb.h:error:field-gpio-has-incomplete-type
|-- sparc-randconfig-r024-20200705
|   `-- include-linux-ssb-ssb.h:error:field-gpio-has-incomplete-type
|-- sparc-randconfig-r025-20200705
|   `-- include-linux-ssb-ssb.h:error:field-gpio-has-incomplete-type
|-- sparc64-allmodconfig
|   |-- drivers-net-wireless-broadcom-brcm80211-brcmsmac-led.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   `-- include-linux-ssb-ssb.h:error:field-gpio-has-incomplete-type
|-- sparc64-allyesconfig
|   |-- drivers-net-wireless-broadcom-brcm80211-brcmsmac-led.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   `-- include-linux-ssb-ssb.h:error:field-gpio-has-incomplete-type
|-- sparc64-randconfig-c003-20200706
|   `-- include-linux-ssb-ssb.h:error:field-gpio-has-incomplete-type
|-- x86_64-allmodconfig
|   |-- drivers-net-wireless-broadcom-brcm80211-brcmsmac-led.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi4.c:error:array-type-has-incomplete-element-type-struct-of_device_id
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi4.c:error:field-name-not-in-record-or-union-initializer
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi4.c:error:implicit-declaration-of-function-of_node_put
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi5.c:error:array-type-has-incomplete-element-type-struct-of_device_id
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi5.c:error:field-name-not-in-record-or-union-initializer
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi5.c:error:implicit-declaration-of-function-of_node_put
|   `-- include-linux-ssb-ssb.h:error:field-gpio-has-incomplete-type
|-- x86_64-allyesconfig
|   |-- drivers-net-wireless-broadcom-brcm80211-brcmsmac-led.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi4.c:error:array-type-has-incomplete-element-type-struct-of_device_id
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi4.c:error:field-name-not-in-record-or-union-initializer
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi4.c:error:implicit-declaration-of-function-of_node_put
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi5.c:error:array-type-has-incomplete-element-type-struct-of_device_id
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi5.c:error:field-name-not-in-record-or-union-initializer
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi5.c:error:implicit-declaration-of-function-of_node_put
|   `-- include-linux-ssb-ssb.h:error:field-gpio-has-incomplete-type
|-- x86_64-fedora-25
|   `-- include-linux-ssb-ssb.h:error:field-gpio-has-incomplete-type
|-- x86_64-randconfig-c002-20200705
|   `-- include-linux-ssb-ssb.h:error:field-gpio-has-incomplete-type
|-- x86_64-randconfig-c002-20200706
|   `-- include-linux-ssb-ssb.h:error:field-gpio-has-incomplete-type
|-- x86_64-randconfig-c022-20200701
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi4.c:error:array-type-has-incomplete-element-type-struct-of_device_id
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi4.c:error:field-name-not-in-record-or-union-initializer
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi4.c:error:implicit-declaration-of-function-of_node_put
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi5.c:error:array-type-has-incomplete-element-type-struct-of_device_id
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi5.c:error:field-name-not-in-record-or-union-initializer
|   `-- drivers-video-fbdev-omap2-omapfb-dss-hdmi5.c:error:implicit-declaration-of-function-of_node_put
|-- x86_64-randconfig-c023-20200705
|   `-- include-linux-ssb-ssb.h:error:field-gpio-has-incomplete-type
|-- x86_64-randconfig-s021-20200705
|   `-- include-linux-ssb-ssb.h:error:field-gpio-has-incomplete-type
|-- x86_64-randconfig-s021-20200706
|   `-- include-linux-ssb-ssb.h:error:field-gpio-has-incomplete-type
|-- x86_64-rhel-7.6
|   `-- include-linux-ssb-ssb.h:error:field-gpio-has-incomplete-type
|-- x86_64-rhel-7.6-kselftests
|   `-- include-linux-ssb-ssb.h:error:field-gpio-has-incomplete-type
|-- xtensa-allyesconfig
|   |-- drivers-net-wireless-broadcom-brcm80211-brcmsmac-led.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi4.c:error:array-type-has-incomplete-element-type-struct-of_device_id
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi4.c:error:field-name-not-in-record-or-union-initializer
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi4.c:error:implicit-declaration-of-function-of_node_put
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi5.c:error:array-type-has-incomplete-element-type-struct-of_device_id
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi5.c:error:field-name-not-in-record-or-union-initializer
|   |-- drivers-video-fbdev-omap2-omapfb-dss-hdmi5.c:error:implicit-declaration-of-function-of_node_put
|   `-- include-linux-ssb-ssb.h:error:field-gpio-has-incomplete-type
|-- xtensa-randconfig-c024-20200705
|   `-- include-linux-ssb-ssb.h:error:field-gpio-has-incomplete-type
`-- xtensa-randconfig-r022-20200705
    `-- include-linux-ssb-ssb.h:error:field-gpio-has-incomplete-type

elapsed time: 3934m

configs tested: 220
configs skipped: 29

arm                                 defconfig
arm                              allmodconfig
arm                               allnoconfig
arm                              allyesconfig
arm64                            allyesconfig
arm64                               defconfig
arm64                            allmodconfig
arm64                             allnoconfig
arm                       aspeed_g4_defconfig
m68k                       m5249evb_defconfig
arm                            mmp2_defconfig
sh                            shmin_defconfig
powerpc                      pmac32_defconfig
sh                                  defconfig
arm                          moxart_defconfig
arm                            qcom_defconfig
arm                          iop32x_defconfig
mips                           ip28_defconfig
powerpc                     pq2fads_defconfig
arm                         at91_dt_defconfig
sh                           cayman_defconfig
h8300                       h8s-sim_defconfig
arc                        nsim_700_defconfig
c6x                        evmc6472_defconfig
m68k                        m5272c3_defconfig
arc                        nsimosci_defconfig
mips                      malta_kvm_defconfig
arm                          ep93xx_defconfig
openrisc                 simple_smp_defconfig
arm                         cm_x300_defconfig
sh                 kfr2r09-romimage_defconfig
mips                         tb0219_defconfig
sh                               j2_defconfig
arm                          lpd270_defconfig
h8300                     edosk2674_defconfig
nios2                         10m50_defconfig
arm                          pxa3xx_defconfig
arm                       imx_v6_v7_defconfig
powerpc                      ppc6xx_defconfig
mips                          ath25_defconfig
arm                         assabet_defconfig
arm                      jornada720_defconfig
xtensa                              defconfig
powerpc                       maple_defconfig
mips                      pistachio_defconfig
h8300                               defconfig
arm                          simpad_defconfig
xtensa                         virt_defconfig
sh                          landisk_defconfig
m68k                        stmark2_defconfig
sh                           se7780_defconfig
arm                           efm32_defconfig
sh                               alldefconfig
powerpc                    mvme5100_defconfig
mips                          rb532_defconfig
xtensa                          iss_defconfig
powerpc                  mpc885_ads_defconfig
arm                   milbeaut_m10v_defconfig
sh                        dreamcast_defconfig
openrisc                    or1ksim_defconfig
arm                             pxa_defconfig
powerpc                      mgcoge_defconfig
arm                         bcm2835_defconfig
mips                        maltaup_defconfig
m68k                            mac_defconfig
sh                     magicpanelr2_defconfig
sh                         apsh4a3a_defconfig
arc                           tb10x_defconfig
ia64                         bigsur_defconfig
powerpc                     mpc5200_defconfig
s390                          debug_defconfig
ia64                                defconfig
s390                             alldefconfig
sh                           se7705_defconfig
arc                        vdk_hs38_defconfig
parisc                           alldefconfig
arm                          imote2_defconfig
nios2                               defconfig
arm                        clps711x_defconfig
xtensa                    xip_kc705_defconfig
mips                         rt305x_defconfig
sparc64                          alldefconfig
powerpc                         wii_defconfig
sparc                            alldefconfig
arm                           viper_defconfig
arm                         orion5x_defconfig
m68k                          multi_defconfig
arm                         socfpga_defconfig
mips                            e55_defconfig
powerpc                     powernv_defconfig
arm                         s3c6400_defconfig
m68k                          atari_defconfig
arm                           u8500_defconfig
mips                    maltaup_xpa_defconfig
arm                              zx_defconfig
powerpc                          g5_defconfig
arc                          axs103_defconfig
powerpc                      tqm8xx_defconfig
mips                     loongson1b_defconfig
powerpc                    gamecube_defconfig
arm                        trizeps4_defconfig
arc                                 defconfig
arm                          prima2_defconfig
powerpc                      ppc64e_defconfig
h8300                            alldefconfig
sh                      rts7751r2d1_defconfig
arm                         ebsa110_defconfig
powerpc                       ppc64_defconfig
m68k                       bvme6000_defconfig
sh                     sh7710voipgw_defconfig
mips                           xway_defconfig
ia64                              allnoconfig
arm                         vf610m4_defconfig
arm                          tango4_defconfig
mips                     cu1000-neo_defconfig
alpha                            allyesconfig
powerpc                      ppc44x_defconfig
powerpc                        cell_defconfig
um                            kunit_defconfig
powerpc                          alldefconfig
arm                           stm32_defconfig
arc                            hsdk_defconfig
mips                        jmr3927_defconfig
i386                             alldefconfig
mips                      fuloong2e_defconfig
mips                           jazz_defconfig
parisc                generic-64bit_defconfig
arm                           spitz_defconfig
powerpc                          allyesconfig
mips                         db1xxx_defconfig
arm                         lubbock_defconfig
mips                        vocore2_defconfig
mips                      pic32mzda_defconfig
sh                           se7619_defconfig
mips                        nlm_xlp_defconfig
powerpc                  storcenter_defconfig
sh                          r7785rp_defconfig
arm                      footbridge_defconfig
arm                          badge4_defconfig
m68k                            q40_defconfig
arc                    vdk_hs38_smp_defconfig
arc                     nsimosci_hs_defconfig
sh                              ul2_defconfig
arm                          pxa168_defconfig
powerpc                          allmodconfig
mips                           gcw0_defconfig
nios2                         3c120_defconfig
c6x                        evmc6678_defconfig
sh                   sh7770_generic_defconfig
ia64                        generic_defconfig
um                             i386_defconfig
arm                           sunxi_defconfig
powerpc                      chrp32_defconfig
mips                 pnx8335_stb225_defconfig
riscv                             allnoconfig
sh                         ecovec24_defconfig
mips                 decstation_r4k_defconfig
i386                              allnoconfig
i386                             allyesconfig
i386                                defconfig
i386                              debian-10.3
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                              allnoconfig
m68k                           sun3_defconfig
m68k                                defconfig
m68k                             allyesconfig
openrisc                            defconfig
c6x                              allyesconfig
c6x                               allnoconfig
nds32                               defconfig
nds32                             allnoconfig
csky                             allyesconfig
csky                                defconfig
alpha                               defconfig
xtensa                           allyesconfig
h8300                            allyesconfig
h8300                            allmodconfig
nios2                            allyesconfig
openrisc                         allyesconfig
sh                                allnoconfig
microblaze                        allnoconfig
arc                              allyesconfig
sh                               allmodconfig
mips                              allnoconfig
mips                             allyesconfig
mips                             allmodconfig
parisc                           allyesconfig
parisc                           allmodconfig
parisc                            allnoconfig
parisc                              defconfig
powerpc                             defconfig
powerpc                          rhel-kconfig
powerpc                           allnoconfig
riscv                               defconfig
riscv                            allyesconfig
riscv                            allmodconfig
s390                              allnoconfig
s390                             allmodconfig
s390                                defconfig
s390                             allyesconfig
sparc                               defconfig
sparc64                             defconfig
sparc64                           allnoconfig
sparc                            allyesconfig
sparc64                          allyesconfig
sparc64                          allmodconfig
um                                allnoconfig
um                                  defconfig
um                               allmodconfig
um                               allyesconfig
x86_64                               rhel-7.6
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                                   rhel
x86_64                         rhel-7.2-clear
x86_64                                    lkp
x86_64                              fedora-25

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
