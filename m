Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93B0715AC95
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2020 17:01:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728094AbgBLQBh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 Feb 2020 11:01:37 -0500
Received: from mga03.intel.com ([134.134.136.65]:5911 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728052AbgBLQBh (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 12 Feb 2020 11:01:37 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Feb 2020 08:01:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,433,1574150400"; 
   d="scan'208";a="226905944"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 12 Feb 2020 08:01:31 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1j1uSA-0009fq-Qt; Thu, 13 Feb 2020 00:01:30 +0800
Date:   Thu, 13 Feb 2020 00:00:37 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [gpio:devel-cleanup-irqchip-threaded] BUILD REGRESSION
 bf5b241314ea9d338b03df6f54b7c02113ab0f87
Message-ID: <5e442125.FWqJGgZoc4oU7Bgg%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git  devel-cleanup-irqchip-threaded
branch HEAD: bf5b241314ea9d338b03df6f54b7c02113ab0f87  gpio: Handle generic and threaded IRQs on gpio irqchips

Regressions in current branch:

arch/m68k/coldfire/gpio.c:154:15: error: variable 'mcfgpio_chip' has initializer but incomplete type
arch/m68k/coldfire/gpio.c:154:25: error: storage size of 'mcfgpio_chip' isn't known
arch/m68k/coldfire/gpio.c:155:13: warning: excess elements in struct initializer
arch/m68k/coldfire/gpio.c:155:3: error: 'struct gpio_chip' has no member named 'label'
arch/m68k/coldfire/gpio.c:156:3: error: 'struct gpio_chip' has no member named 'request'
arch/m68k/coldfire/gpio.c:157:3: error: 'struct gpio_chip' has no member named 'free'
arch/m68k/coldfire/gpio.c:158:3: error: 'struct gpio_chip' has no member named 'direction_input'
arch/m68k/coldfire/gpio.c:159:3: error: 'struct gpio_chip' has no member named 'direction_output'
arch/m68k/coldfire/gpio.c:160:3: error: 'struct gpio_chip' has no member named 'get'
arch/m68k/coldfire/gpio.c:161:3: error: 'struct gpio_chip' has no member named 'set'
arch/m68k/coldfire/gpio.c:162:3: error: 'struct gpio_chip' has no member named 'to_irq'
arch/m68k/coldfire/gpio.c:163:3: error: 'struct gpio_chip' has no member named 'base'
arch/m68k/coldfire/gpio.c:164:13: note: in expansion of macro 'MCFGPIO_PIN_MAX'
arch/m68k/coldfire/gpio.c:164:3: error: 'struct gpio_chip' has no member named 'ngpio'
arch/m68k/coldfire/gpio.c:169:9: error: implicit declaration of function 'gpiochip_add_data' [-Werror=implicit-function-declaration]
arch/m68k/include/asm/m525xsim.h:209:26: warning: excess elements in struct initializer
arch/m68k/include/asm/m5307sim.h:131:26: warning: excess elements in struct initializer
arch/m68k/include/asm/m5441xsim.h:279:26: warning: excess elements in struct initializer
arch/m68k/include/asm/m54xxsim.h:70:26: warning: excess elements in struct initializer
arch/powerpc/sysdev/cpm_common.c:130:37: error: implicit declaration of function 'gpiochip_get_data'; did you mean 'gpio_get_value'? [-Werror=implicit-function-declaration]
arch/powerpc/sysdev/cpm_common.c:144:37: error: initialization makes pointer from integer without a cast [-Werror=int-conversion]
drivers//gpio/gpio-104-dio-48e.c:413:23: error: assignment from incompatible pointer type [-Werror=incompatible-pointer-types]
drivers//gpio/gpio-xilinx.c:147:20: error: dereferencing pointer to incomplete type 'struct gpio_chip'
drivers//gpio/gpio-xilinx.c:338:11: error: implicit declaration of function 'devm_gpiochip_add_data'; did you mean 'irq_get_chip_data'? [-Werror=implicit-function-declaration]
drivers//gpio/gpio-xilinx.c:43:19: error: field 'gc' has incomplete type
drivers//gpio/gpio-xilinx.c:88:32: error: implicit declaration of function 'gpiochip_get_data' [-Werror=implicit-function-declaration]
drivers//gpio/gpio-xilinx.c:88:32: warning: initialization makes pointer from integer without a cast [-Wint-conversion]
drivers//gpio/gpiolib-devprop.c:30:33: error: dereferencing pointer to incomplete type 'struct gpio_chip'
drivers//gpio/gpiolib-of.c:121:29: error: dereferencing pointer to incomplete type 'const struct gpio_chip'
drivers//gpio/gpiolib-of.c:725:8: error: implicit declaration of function 'gpiochip_add_data'; did you mean 'gpiochip_get_desc'? [-Werror=implicit-function-declaration]
drivers//gpio/gpiolib-of.c:751:2: error: implicit declaration of function 'gpiochip_remove'; did you mean 'of_gpiochip_remove'? [-Werror=implicit-function-declaration]
drivers//gpio/gpiolib-of.c:87:1: warning: control reaches end of non-void function [-Wreturn-type]
drivers//gpio/gpiolib-of.c:888:3: error: implicit declaration of function 'devprop_gpiochip_set_names'; did you mean 'of_gpiochip_scan_gpios'? [-Werror=implicit-function-declaration]
drivers//gpio/gpiolib-of.c:889:9: note: in expansion of macro 'of_fwnode_handle'
drivers//gpio/gpiolib-of.c:92:9: error: implicit declaration of function 'gpiochip_find'; did you mean 'of_gpiochip_add'? [-Werror=implicit-function-declaration]
drivers//gpio/gpiolib-of.c:92:9: warning: return makes pointer from integer without a cast [-Wint-conversion]
drivers//gpio/gpiolib-sysfs.c:195:8: error: implicit declaration of function 'gpiochip_lock_as_irq'; did you mean 'spin_lock_irq'? [-Werror=implicit-function-declaration]
drivers//gpio/gpiolib-sysfs.c:209:2: error: implicit declaration of function 'gpiochip_unlock_as_irq'; did you mean 'spin_unlock_irq'? [-Werror=implicit-function-declaration]
drivers//gpio/gpiolib-sysfs.c:417:34: error: dereferencing pointer to incomplete type 'const struct gpio_chip'
drivers//gpio/gpiolib-sysfs.c:620:10: error: dereferencing pointer to incomplete type 'struct gpio_chip'
drivers//gpio/gpiolib.c:145:33: error: dereferencing pointer to incomplete type 'struct gpio_chip'
drivers//gpio/gpiolib.c:1571:2: error: implicit declaration of function 'gpiochip_remove_pin_ranges'; did you mean 'gpiochip_add_pin_ranges'? [-Werror=implicit-function-declaration]
drivers//gpio/gpiolib.c:1692:8: error: implicit declaration of function 'gpiochip_add_data'; did you mean 'gpiochip_get_data'? [-Werror=implicit-function-declaration]
drivers//gpio/gpiolib.c:174:19: error: conflicting types for 'gpiod_to_chip'
drivers//gpio/gpiolib.c:413:22: error: dereferencing pointer to incomplete type 'const struct gpio_chip'
drivers//gpio/gpiolib.c:416:1: warning: control reaches end of non-void function [-Wreturn-type]
drivers/gpio/gpio-104-dio-48e.c:413:23: error: assignment from incompatible pointer type [-Werror=incompatible-pointer-types]
drivers/gpio/gpio-mmio.c:127:8: error: dereferencing pointer to incomplete type 'struct gpio_chip'
drivers/gpio/gpio-mmio.c:502:21: error: 'BGPIOF_NO_OUTPUT' undeclared (first use in this function)
drivers/gpio/gpio-mmio.c:510:16: error: 'BGPIOF_UNREADABLE_REG_SET' undeclared (first use in this function)
drivers/gpio/gpio-mmio.c:511:15: error: 'BGPIOF_READ_OUTPUT_REG_SET' undeclared (first use in this function); did you mean 'BGPIOF_UNREADABLE_REG_SET'?
drivers/gpio/gpio-mmio.c:610:27: error: 'BGPIOF_BIG_ENDIAN' undeclared (first use in this function); did you mean '_TIF_SIGPENDING'?
drivers/gpio/gpio-mmio.c:610:27: error: 'BGPIOF_BIG_ENDIAN' undeclared (first use in this function); did you mean '__BIG_ENDIAN'?
drivers/gpio/gpio-mmio.c:616:47: error: 'BGPIOF_BIG_ENDIAN_BYTE_ORDER' undeclared (first use in this function); did you mean 'BGPIOF_BIG_ENDIAN'?
drivers/gpio/gpio-mmio.c:629:14: error: 'BGPIOF_UNREADABLE_REG_DIR' undeclared (first use in this function); did you mean 'BGPIOF_UNREADABLE_REG_SET'?
drivers/gpio/gpio-mmio.c:692:42: error: invalid application of 'sizeof' to incomplete type 'struct bgpio_pdata'
drivers/gpio/gpio-mmio.c:697:7: error: dereferencing pointer to incomplete type 'struct bgpio_pdata'
drivers/gpio/gpio-mmio.c:700:13: error: 'BGPIOF_BIG_ENDIAN_BYTE_ORDER' undeclared (first use in this function)
drivers/gpio/gpio-mmio.c:774:12: error: dereferencing pointer to incomplete type 'struct bgpio_pdata'
drivers/gpio/gpio-mmio.c:783:9: error: implicit declaration of function 'devm_gpiochip_add_data'; did you mean 'irq_get_chip_data'? [-Werror=implicit-function-declaration]
drivers/gpio/gpio-mmio.c:792:18: error: 'BGPIOF_BIG_ENDIAN' undeclared here (not in a function); did you mean '_TIF_SIGPENDING'?
drivers/gpio/gpio-mmio.c:792:18: error: 'BGPIOF_BIG_ENDIAN' undeclared here (not in a function); did you mean '__BIG_ENDIAN'?
drivers/gpio/gpio-pch.c:100:26: error: implicit declaration of function 'gpiochip_get_data' [-Werror=implicit-function-declaration]
drivers/gpio/gpio-pch.c:100:26: warning: initialization makes pointer from integer without a cast [-Wint-conversion]
drivers/gpio/gpio-pch.c:206:6: error: dereferencing pointer to incomplete type 'struct gpio_chip'
drivers/gpio/gpio-pch.c:380:8: error: implicit declaration of function 'devm_gpiochip_add_data' [-Werror=implicit-function-declaration]
drivers/gpio/gpio-pch.c:90:19: error: field 'gpio' has incomplete type
drivers/gpio/gpio-pxa.c:155:35: error: implicit declaration of function 'gpiochip_get_data' [-Werror=implicit-function-declaration]
drivers/gpio/gpio-pxa.c:155:35: warning: initialization makes pointer from integer without a cast [-Wint-conversion]
drivers/gpio/gpio-pxa.c:268:42: error: dereferencing pointer to incomplete type 'struct gpio_chip'
drivers/gpio/gpio-pxa.c:366:25: error: 'gpiochip_generic_request' undeclared (first use in this function); did you mean 'pinctrl_gpio_request'?
drivers/gpio/gpio-pxa.c:367:22: error: 'gpiochip_generic_free' undeclared (first use in this function); did you mean 'gpiochip_generic_request'?
drivers/gpio/gpio-pxa.c:381:9: error: implicit declaration of function 'gpiochip_add_data' [-Werror=implicit-function-declaration]
drivers/gpio/gpio-pxa.c:382:1: warning: control reaches end of non-void function [-Wreturn-type]
drivers/gpio/gpio-pxa.c:81:19: error: field 'chip' has incomplete type
drivers/gpio/gpio-sa1100.c:17:19: error: field 'chip' has incomplete type
drivers/gpio/gpio-sa1100.c:26:29: note: in expansion of macro 'container_of'
drivers/gpio/gpio-sa1100.c:319:2: error: implicit declaration of function 'gpiochip_add_data' [-Werror=implicit-function-declaration]
drivers/gpio/gpio-sa1100.c:41:23: note: in expansion of macro 'sa1100_gpio_chip'
drivers/gpio/gpio-sa1100.c:41:9: note: in expansion of macro 'readl_relaxed'
drivers/gpio/gpio-sa1100.c:94:3: error: field name not in record or union initializer
drivers/gpio/gpio-vr41xx.c:130:8: error: implicit declaration of function 'gpiochip_lock_as_irq' [-Werror=implicit-function-declaration]
drivers/gpio/gpio-vr41xx.c:132:3: error: invalid use of undefined type 'struct gpio_chip'
drivers/gpio/gpio-vr41xx.c:146:2: error: implicit declaration of function 'gpiochip_unlock_as_irq' [-Werror=implicit-function-declaration]
drivers/gpio/gpio-vr41xx.c:331:17: error: dereferencing pointer to incomplete type 'struct gpio_chip'
drivers/gpio/gpio-vr41xx.c:458:15: error: variable 'vr41xx_gpio_chip' has initializer but incomplete type
drivers/gpio/gpio-vr41xx.c:459:13: warning: excess elements in struct initializer
drivers/gpio/gpio-vr41xx.c:459:2: error: unknown field 'label' specified in initializer
drivers/gpio/gpio-vr41xx.c:460:13: note: in expansion of macro 'THIS_MODULE'
drivers/gpio/gpio-vr41xx.c:460:2: error: unknown field 'owner' specified in initializer
drivers/gpio/gpio-vr41xx.c:461:2: error: unknown field 'direction_input' specified in initializer
drivers/gpio/gpio-vr41xx.c:462:2: error: unknown field 'get' specified in initializer
drivers/gpio/gpio-vr41xx.c:463:2: error: unknown field 'direction_output' specified in initializer
drivers/gpio/gpio-vr41xx.c:464:2: error: unknown field 'set' specified in initializer
drivers/gpio/gpio-vr41xx.c:465:2: error: unknown field 'to_irq' specified in initializer
drivers/gpio/gpio-vr41xx.c:497:6: error: implicit declaration of function 'gpiochip_add_data' [-Werror=implicit-function-declaration]
drivers/gpio/gpio-wm8994.c:193:22: error: dereferencing pointer to incomplete type 'struct gpio_chip'
drivers/gpio/gpio-wm8994.c:203:11: error: implicit declaration of function 'gpiochip_is_requested'; did you mean 'pinctrl_gpio_request'? [-Werror=implicit-function-declaration]
drivers/gpio/gpio-wm8994.c:203:9: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
drivers/gpio/gpio-wm8994.c:247:21: error: variable 'template_chip' has initializer but incomplete type
drivers/gpio/gpio-wm8994.c:247:31: error: storage size of 'template_chip' isn't known
drivers/gpio/gpio-wm8994.c:248:13: warning: excess elements in struct initializer
drivers/gpio/gpio-wm8994.c:248:3: error: 'const struct gpio_chip' has no member named 'label'
drivers/gpio/gpio-wm8994.c:249:13: note: in expansion of macro 'THIS_MODULE'
drivers/gpio/gpio-wm8994.c:249:3: error: 'const struct gpio_chip' has no member named 'owner'
drivers/gpio/gpio-wm8994.c:250:3: error: 'const struct gpio_chip' has no member named 'request'
drivers/gpio/gpio-wm8994.c:251:3: error: 'const struct gpio_chip' has no member named 'direction_input'
drivers/gpio/gpio-wm8994.c:252:3: error: 'const struct gpio_chip' has no member named 'get'
drivers/gpio/gpio-wm8994.c:253:3: error: 'const struct gpio_chip' has no member named 'direction_output'
drivers/gpio/gpio-wm8994.c:254:3: error: 'const struct gpio_chip' has no member named 'set'
drivers/gpio/gpio-wm8994.c:255:3: error: 'const struct gpio_chip' has no member named 'set_config'
drivers/gpio/gpio-wm8994.c:256:3: error: 'const struct gpio_chip' has no member named 'to_irq'
drivers/gpio/gpio-wm8994.c:257:3: error: 'const struct gpio_chip' has no member named 'dbg_show'
drivers/gpio/gpio-wm8994.c:258:3: error: 'const struct gpio_chip' has no member named 'can_sleep'
drivers/gpio/gpio-wm8994.c:27:19: error: field 'gpio_chip' has incomplete type
drivers/gpio/gpio-wm8994.c:282:8: error: implicit declaration of function 'devm_gpiochip_add_data'; did you mean 'irq_get_chip_data'? [-Werror=implicit-function-declaration]
drivers/gpio/gpio-wm8994.c:32:36: error: implicit declaration of function 'gpiochip_get_data' [-Werror=implicit-function-declaration]
drivers/gpio/gpio-wm8994.c:32:36: warning: initialization makes pointer from integer without a cast [-Wint-conversion]
drivers/gpio/gpio-xilinx.c:147:20: error: dereferencing pointer to incomplete type 'struct gpio_chip'
drivers/gpio/gpio-xilinx.c:339:11: error: implicit declaration of function 'devm_gpiochip_add_data'; did you mean 'irq_get_chip_data'? [-Werror=implicit-function-declaration]
drivers/gpio/gpio-xilinx.c:43:19: error: field 'gc' has incomplete type
drivers/gpio/gpio-xilinx.c:88:32: error: implicit declaration of function 'gpiochip_get_data' [-Werror=implicit-function-declaration]
drivers/gpio/gpio-xilinx.c:88:32: warning: initialization makes pointer from integer without a cast [-Wint-conversion]
drivers/gpio/gpiolib-devprop.c:30:33: error: dereferencing pointer to incomplete type 'struct gpio_chip'
drivers/gpio/gpiolib-of.c:121:29: error: dereferencing pointer to incomplete type 'const struct gpio_chip'
drivers/gpio/gpiolib-of.c:725:8: error: implicit declaration of function 'gpiochip_add_data' [-Werror=implicit-function-declaration]
drivers/gpio/gpiolib-of.c:725:8: error: implicit declaration of function 'gpiochip_add_data'; did you mean 'gpiochip_get_desc'? [-Werror=implicit-function-declaration]
drivers/gpio/gpiolib-of.c:751:2: error: implicit declaration of function 'gpiochip_remove' [-Werror=implicit-function-declaration]
drivers/gpio/gpiolib-of.c:751:2: error: implicit declaration of function 'gpiochip_remove'; did you mean 'of_gpiochip_remove'? [-Werror=implicit-function-declaration]
drivers/gpio/gpiolib-of.c:768:8: error: implicit declaration of function 'gpiochip_add_data' [-Werror=implicit-function-declaration]
drivers/gpio/gpiolib-of.c:768:8: error: implicit declaration of function 'gpiochip_add_data'; did you mean 'gpiochip_get_desc'? [-Werror=implicit-function-declaration]
drivers/gpio/gpiolib-of.c:794:2: error: implicit declaration of function 'gpiochip_remove'; did you mean 'of_gpiochip_remove'? [-Werror=implicit-function-declaration]
drivers/gpio/gpiolib-of.c:87:1: warning: control reaches end of non-void function [-Wreturn-type]
drivers/gpio/gpiolib-of.c:888:3: error: implicit declaration of function 'devprop_gpiochip_set_names' [-Werror=implicit-function-declaration]
drivers/gpio/gpiolib-of.c:888:3: error: implicit declaration of function 'devprop_gpiochip_set_names'; did you mean 'of_gpiochip_scan_gpios'? [-Werror=implicit-function-declaration]
drivers/gpio/gpiolib-of.c:889:9: note: in expansion of macro 'of_fwnode_handle'
drivers/gpio/gpiolib-of.c:92:9: error: implicit declaration of function 'gpiochip_find' [-Werror=implicit-function-declaration]
drivers/gpio/gpiolib-of.c:92:9: error: implicit declaration of function 'gpiochip_find'; did you mean 'of_gpiochip_add'? [-Werror=implicit-function-declaration]
drivers/gpio/gpiolib-of.c:92:9: warning: return makes pointer from integer without a cast [-Wint-conversion]
drivers/gpio/gpiolib-of.c:92:9: warning: returning 'int' from a function with return type 'struct gpio_chip *' makes pointer from integer without a cast [-Wint-conversion]
drivers/gpio/gpiolib-of.c:931:3: error: implicit declaration of function 'devprop_gpiochip_set_names' [-Werror=implicit-function-declaration]
drivers/gpio/gpiolib-of.c:931:3: error: implicit declaration of function 'devprop_gpiochip_set_names'; did you mean 'of_gpiochip_scan_gpios'? [-Werror=implicit-function-declaration]
drivers/gpio/gpiolib-of.c:932:9: note: in expansion of macro 'of_fwnode_handle'
drivers/gpio/gpiolib-sysfs.c:195:8: error: implicit declaration of function 'gpiochip_lock_as_irq' [-Werror=implicit-function-declaration]
drivers/gpio/gpiolib-sysfs.c:195:8: error: implicit declaration of function 'gpiochip_lock_as_irq'; did you mean 'spin_lock_irq'? [-Werror=implicit-function-declaration]
drivers/gpio/gpiolib-sysfs.c:209:2: error: implicit declaration of function 'gpiochip_unlock_as_irq' [-Werror=implicit-function-declaration]
drivers/gpio/gpiolib-sysfs.c:209:2: error: implicit declaration of function 'gpiochip_unlock_as_irq'; did you mean 'spin_unlock_irq'? [-Werror=implicit-function-declaration]
drivers/gpio/gpiolib-sysfs.c:417:34: error: dereferencing pointer to incomplete type 'const struct gpio_chip'
drivers/gpio/gpiolib-sysfs.c:620:10: error: dereferencing pointer to incomplete type 'struct gpio_chip'
drivers/gpio/gpiolib.c:145:33: error: dereferencing pointer to incomplete type 'struct gpio_chip'
drivers/gpio/gpiolib.c:1571:2: error: implicit declaration of function 'gpiochip_remove_pin_ranges' [-Werror=implicit-function-declaration]
drivers/gpio/gpiolib.c:1571:2: error: implicit declaration of function 'gpiochip_remove_pin_ranges'; did you mean 'gpiochip_add_pin_ranges'? [-Werror=implicit-function-declaration]
drivers/gpio/gpiolib.c:1692:8: error: implicit declaration of function 'gpiochip_add_data' [-Werror=implicit-function-declaration]
drivers/gpio/gpiolib.c:1692:8: error: implicit declaration of function 'gpiochip_add_data'; did you mean 'gpiochip_get_data'? [-Werror=implicit-function-declaration]
drivers/gpio/gpiolib.c:174:19: error: conflicting types for 'gpiod_to_chip'
drivers/gpio/gpiolib.c:1756:2: error: implicit declaration of function 'gpiochip_remove_pin_ranges'; did you mean 'gpiochip_add_pin_ranges'? [-Werror=implicit-function-declaration]
drivers/gpio/gpiolib.c:1877:8: error: implicit declaration of function 'gpiochip_add_data'; did you mean 'gpiochip_get_data'? [-Werror=implicit-function-declaration]
drivers/gpio/gpiolib.c:2659:29: error: dereferencing pointer to incomplete type 'struct gpio_pin_range'
drivers/gpio/gpiolib.c:2753:6: warning: conflicting types for 'gpiochip_remove_pin_ranges'
drivers/gpio/gpiolib.c:2758:2: note: in expansion of macro 'list_for_each_entry_safe'
drivers/gpio/gpiolib.c:413:22: error: dereferencing pointer to incomplete type 'const struct gpio_chip'
drivers/gpio/gpiolib.c:416:1: warning: control reaches end of non-void function [-Wreturn-type]
drivers/mfd/vexpress-sysreg.c:112:23: error: invalid application of 'sizeof' to incomplete type 'struct bgpio_pdata'
drivers/mfd/vexpress-sysreg.c:191:43: warning: passing argument 2 of 'devm_kzalloc' makes integer from pointer without a cast [-Wint-conversion]
drivers/mfd/vexpress-sysreg.c:191:50: error: dereferencing pointer to incomplete type 'struct gpio_chip'
drivers/mfd/vexpress-sysreg.c:195:2: error: implicit declaration of function 'bgpio_init'; did you mean 'cpu_init'? [-Werror=implicit-function-declaration]
drivers/mfd/vexpress-sysreg.c:197:15: error: request for member 'ngpio' in something not a structure or union
drivers/mfd/vexpress-sysreg.c:198:2: error: implicit declaration of function 'gpiochip_add_data' [-Werror=implicit-function-declaration]
drivers/mfd/vexpress-sysreg.c:69:15: error: variable 'vexpress_sysreg_sys_led_pdata' has initializer but incomplete type
drivers/mfd/vexpress-sysreg.c:69:27: error: storage size of 'vexpress_sysreg_sys_led_pdata' isn't known
drivers/mfd/vexpress-sysreg.c:70:11: warning: excess elements in struct initializer
drivers/mfd/vexpress-sysreg.c:70:3: error: 'struct bgpio_pdata' has no member named 'label'
drivers/mfd/vexpress-sysreg.c:71:3: error: 'struct bgpio_pdata' has no member named 'base'
drivers/mfd/vexpress-sysreg.c:72:3: error: 'struct bgpio_pdata' has no member named 'ngpio'
drivers/mfd/vexpress-sysreg.c:75:15: error: variable 'vexpress_sysreg_sys_mci_pdata' has initializer but incomplete type
drivers/mfd/vexpress-sysreg.c:75:27: error: storage size of 'vexpress_sysreg_sys_mci_pdata' isn't known
drivers/mfd/vexpress-sysreg.c:81:15: error: variable 'vexpress_sysreg_sys_flash_pdata' has initializer but incomplete type
drivers/mfd/vexpress-sysreg.c:81:27: error: storage size of 'vexpress_sysreg_sys_flash_pdata' isn't known
drivers/pinctrl/core.c:338:45: error: dereferencing pointer to incomplete type 'struct gpio_chip'
drivers/pinctrl/samsung/pinctrl-exynos.c:158:8: error: implicit declaration of function 'gpiochip_lock_as_irq'; did you mean 'spin_lock_irq'? [-Werror=implicit-function-declaration]
drivers/pinctrl/samsung/pinctrl-exynos.c:202:2: error: implicit declaration of function 'gpiochip_unlock_as_irq'; did you mean 'spin_unlock_irq'? [-Werror=implicit-function-declaration]
drivers/pinctrl/samsung/pinctrl-samsung.c:544:34: error: implicit declaration of function 'gpiochip_get_data' [-Werror=implicit-function-declaration]
drivers/pinctrl/samsung/pinctrl-samsung.c:544:34: warning: initialization makes pointer from integer without a cast [-Wint-conversion]
drivers/pinctrl/samsung/pinctrl-samsung.c:599:7: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
drivers/pinctrl/samsung/pinctrl-samsung.c:942:21: error: variable 'samsung_gpiolib_chip' has initializer but incomplete type
drivers/pinctrl/samsung/pinctrl-samsung.c:942:31: error: storage size of 'samsung_gpiolib_chip' isn't known
drivers/pinctrl/samsung/pinctrl-samsung.c:943:13: error: 'gpiochip_generic_request' undeclared here (not in a function); did you mean 'pinctrl_gpio_request'?
drivers/pinctrl/samsung/pinctrl-samsung.c:943:13: warning: excess elements in struct initializer
drivers/pinctrl/samsung/pinctrl-samsung.c:943:3: error: 'const struct gpio_chip' has no member named 'request'
drivers/pinctrl/samsung/pinctrl-samsung.c:944:10: error: 'gpiochip_generic_free' undeclared here (not in a function); did you mean 'gpiochip_generic_request'?
drivers/pinctrl/samsung/pinctrl-samsung.c:944:3: error: 'const struct gpio_chip' has no member named 'free'
drivers/pinctrl/samsung/pinctrl-samsung.c:945:3: error: 'const struct gpio_chip' has no member named 'set'
drivers/pinctrl/samsung/pinctrl-samsung.c:946:3: error: 'const struct gpio_chip' has no member named 'get'
drivers/pinctrl/samsung/pinctrl-samsung.c:947:3: error: 'const struct gpio_chip' has no member named 'direction_input'
drivers/pinctrl/samsung/pinctrl-samsung.c:948:3: error: 'const struct gpio_chip' has no member named 'direction_output'
drivers/pinctrl/samsung/pinctrl-samsung.c:949:3: error: 'const struct gpio_chip' has no member named 'to_irq'
drivers/pinctrl/samsung/pinctrl-samsung.c:950:11: note: in expansion of macro 'THIS_MODULE'
drivers/pinctrl/samsung/pinctrl-samsung.c:950:3: error: 'const struct gpio_chip' has no member named 'owner'
drivers/pinctrl/samsung/pinctrl-samsung.c:966:5: error: dereferencing pointer to incomplete type 'struct gpio_chip'
drivers/pinctrl/samsung/pinctrl-samsung.c:972:9: error: implicit declaration of function 'devm_gpiochip_add_data'; did you mean 'irq_get_chip_data'? [-Werror=implicit-function-declaration]
drivers/pinctrl/samsung/pinctrl-samsung.h:171:19: error: field 'gpio_chip' has incomplete type
drivers/pinctrl/sh-pfc/gpio.c:174:21: warning: passing argument 1 of 'gpio_pin_set_value' makes pointer from integer without a cast [-Wint-conversion]
drivers/pinctrl/sh-pfc/gpio.c:234:4: error: dereferencing pointer to incomplete type 'struct gpio_chip'
drivers/pinctrl/sh-pfc/gpio.c:314:8: error: implicit declaration of function 'devm_gpiochip_add_data'; did you mean 'irq_get_chip_data'? [-Werror=implicit-function-declaration]
drivers/pinctrl/sh-pfc/gpio.c:31:20: error: field 'gpio_chip' has incomplete type
drivers/pinctrl/sh-pfc/gpio.c:381:9: error: implicit declaration of function 'gpiochip_add_pin_range'; did you mean 'pinctrl_add_gpio_range'? [-Werror=implicit-function-declaration]
drivers/pinctrl/sh-pfc/gpio.c:40:29: error: implicit declaration of function 'gpiochip_get_data' [-Werror=implicit-function-declaration]
drivers/pinctrl/sh-pfc/gpio.c:40:29: warning: initialization makes pointer from integer without a cast [-Wint-conversion]
drivers/pinctrl/sunxi/pinctrl-sunxi.c:1469:24: error: 'gpiochip_generic_request' undeclared (first use in this function); did you mean 'pinctrl_gpio_request'?
drivers/pinctrl/sunxi/pinctrl-sunxi.c:1470:21: error: 'gpiochip_generic_free' undeclared (first use in this function); did you mean 'gpiochip_generic_request'?
drivers/pinctrl/sunxi/pinctrl-sunxi.c:1471:27: error: 'gpiochip_generic_config' undeclared (first use in this function); did you mean 'gpiochip_generic_free'?
drivers/pinctrl/sunxi/pinctrl-sunxi.c:1486:8: error: implicit declaration of function 'gpiochip_add_data' [-Werror=implicit-function-declaration]
drivers/pinctrl/sunxi/pinctrl-sunxi.c:1493:9: error: implicit declaration of function 'gpiochip_add_pin_range'; did you mean 'pinctrl_add_gpio_range'? [-Werror=implicit-function-declaration]
drivers/pinctrl/sunxi/pinctrl-sunxi.c:1568:2: error: implicit declaration of function 'gpiochip_remove'; did you mean 'klist_remove'? [-Werror=implicit-function-declaration]
drivers/pinctrl/sunxi/pinctrl-sunxi.c:837:42: error: dereferencing pointer to incomplete type 'struct gpio_chip'
drivers/pinctrl/sunxi/pinctrl-sunxi.c:842:31: error: implicit declaration of function 'gpiochip_get_data' [-Werror=implicit-function-declaration]
drivers/pinctrl/sunxi/pinctrl-sunxi.c:842:31: warning: initialization makes pointer from integer without a cast [-Wint-conversion]
drivers/pinctrl/sunxi/pinctrl-sunxi.c:846:3: error: implicit declaration of function 'gpiochip_line_is_irq'; did you mean 'cache_line_size'? [-Werror=implicit-function-declaration]
drivers/pinctrl/sunxi/pinctrl-sunxi.c:942:8: error: implicit declaration of function 'gpiochip_lock_as_irq'; did you mean 'spin_lock_irq'? [-Werror=implicit-function-declaration]
drivers/pinctrl/sunxi/pinctrl-sunxi.c:960:2: error: implicit declaration of function 'gpiochip_unlock_as_irq'; did you mean 'spin_unlock_irq'? [-Werror=implicit-function-declaration]
drivers/usb/serial/ftdi_sio.c:1834:33: error: implicit declaration of function 'gpiochip_get_data' [-Werror=implicit-function-declaration]
drivers/usb/serial/ftdi_sio.c:1834:33: warning: initialization makes pointer from integer without a cast [-Wint-conversion]
drivers/usb/serial/ftdi_sio.c:2179:11: error: implicit declaration of function 'gpiochip_add_data'; did you mean 'tty_audit_add_data'? [-Werror=implicit-function-declaration]
drivers/usb/serial/ftdi_sio.c:2191:3: error: implicit declaration of function 'gpiochip_remove'; did you mean 'ftdi_gpio_remove'? [-Werror=implicit-function-declaration]
drivers/usb/serial/ftdi_sio.c:77:19: error: field 'gc' has incomplete type
include/asm-generic/gpio.h:59:9: error: implicit declaration of function 'gpiod_to_chip'; did you mean 'gpio_to_chip'? [-Werror=implicit-function-declaration]
include/asm-generic/gpio.h:59:9: warning: return makes pointer from integer without a cast [-Wint-conversion]
include/asm-generic/gpio.h:59:9: warning: returning 'int' from a function with return type 'struct gpio_chip *' makes pointer from integer without a cast [-Wint-conversion]
include/asm-generic/gpio.h:61:9: error: implicit declaration of function 'gpiod_to_chip' [-Werror=implicit-function-declaration]
include/asm-generic/gpio.h:61:9: error: implicit declaration of function 'gpiod_to_chip'; did you mean 'gpio_to_chip'? [-Werror=implicit-function-declaration]
include/asm-generic/gpio.h:61:9: error: return makes pointer from integer without a cast [-Werror=int-conversion]
include/asm-generic/gpio.h:61:9: warning: return makes pointer from integer without a cast [-Wint-conversion]
include/asm-generic/gpio.h:61:9: warning: returning 'int' from a function with return type 'struct gpio_chip *' makes pointer from integer without a cast [-Wint-conversion]
include/linux/export.h:19:21: warning: excess elements in struct initializer
include/linux/gpio/driver.h:2: error: unterminated #ifndef
include/linux/gpio/driver.h:2:0: error: unterminated #ifndef
include/linux/kernel.h:1005:32: error: dereferencing pointer to incomplete type 'struct gpio_chip'
include/linux/kernel.h:987:32: error: dereferencing pointer to incomplete type 'struct gpio_chip'
include/linux/list.h:493:2: note: in expansion of macro 'container_of'
include/linux/list.h:504:2: note: in expansion of macro 'list_entry'
include/linux/list.h:520:2: note: in expansion of macro 'container_of'
include/linux/list.h:531:2: note: in expansion of macro 'list_entry'
include/linux/list.h:688:13: note: in expansion of macro 'list_first_entry'
include/linux/list.h:688:43: error: dereferencing pointer to incomplete type 'struct gpio_pin_range'
include/linux/list.h:715:13: note: in expansion of macro 'list_first_entry'
include/linux/list.h:715:43: error: dereferencing pointer to incomplete type 'struct gpio_pin_range'
include/linux/of.h:175:28: error: invalid type argument of '->' (have 'int')
include/linux/of_gpio.h:41:19: error: field 'gc' has incomplete type
include/linux/of_gpio.h:42:19: error: field 'gc' has incomplete type
include/linux/of_gpio.h:48:9: note: in expansion of macro 'container_of'
include/linux/of_gpio.h:49:9: note: in expansion of macro 'container_of'
include/linux/ucb1400.h:84:19: error: field 'gc' has incomplete type

Error ids grouped by kconfigs:

recent_errors
|-- alpha-allmodconfig
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- alpha-allyesconfig
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- alpha-randconfig-a001-20200212
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- arc-randconfig-a001-20200210
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- arc-randconfig-a001-20200211
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- arc-randconfig-a001-20200212
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- arm-allmodconfig
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- arm-allyesconfig
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- arm-aspeed_g4_defconfig
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- arm-at91_dt_defconfig
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- arm-cerfcube_defconfig
|   |-- drivers-gpio-gpio-sa1100.c:error:field-chip-has-incomplete-type
|   |-- drivers-gpio-gpio-sa1100.c:error:field-name-not-in-record-or-union-initializer
|   |-- drivers-gpio-gpio-sa1100.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-gpio-gpio-sa1100.c:note:in-expansion-of-macro-container_of
|   |-- drivers-gpio-gpio-sa1100.c:note:in-expansion-of-macro-readl_relaxed
|   |-- drivers-gpio-gpio-sa1100.c:note:in-expansion-of-macro-sa1100_gpio_chip
|   |-- drivers-gpio-gpiolib-devprop.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpiolib.c:error:conflicting-types-for-gpiod_to_chip
|   |-- drivers-gpio-gpiolib.c:error:dereferencing-pointer-to-incomplete-type-const-struct-gpio_chip
|   |-- drivers-gpio-gpiolib.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpiolib.c:error:implicit-declaration-of-function-gpiochip_add_data-did-you-mean-gpiochip_get_data
|   |-- drivers-gpio-gpiolib.c:error:implicit-declaration-of-function-gpiochip_remove_pin_ranges-did-you-mean-gpiochip_add_pin_ranges
|   |-- drivers-gpio-gpiolib.c:warning:control-reaches-end-of-non-void-function
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip-did-you-mean-gpio_to_chip
|   |-- include-asm-generic-gpio.h:warning:return-makes-pointer-from-integer-without-a-cast
|   |-- include-linux-gpio-driver.h:error:unterminated-ifndef
|   `-- include-linux-kernel.h:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|-- arm-cm_x2xx_defconfig
|   |-- drivers-gpio-gpio-pxa.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpio-pxa.c:error:field-chip-has-incomplete-type
|   |-- drivers-gpio-gpio-pxa.c:error:gpiochip_generic_free-undeclared-(first-use-in-this-function)-did-you-mean-gpiochip_generic_request
|   |-- drivers-gpio-gpio-pxa.c:error:gpiochip_generic_request-undeclared-(first-use-in-this-function)-did-you-mean-pinctrl_gpio_request
|   |-- drivers-gpio-gpio-pxa.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-gpio-gpio-pxa.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-gpio-gpio-pxa.c:warning:control-reaches-end-of-non-void-function
|   |-- drivers-gpio-gpio-pxa.c:warning:initialization-makes-pointer-from-integer-without-a-cast
|   |-- drivers-gpio-gpiolib-devprop.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpiolib.c:error:conflicting-types-for-gpiod_to_chip
|   |-- drivers-gpio-gpiolib.c:error:dereferencing-pointer-to-incomplete-type-const-struct-gpio_chip
|   |-- drivers-gpio-gpiolib.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpiolib.c:error:implicit-declaration-of-function-gpiochip_add_data-did-you-mean-gpiochip_get_data
|   |-- drivers-gpio-gpiolib.c:error:implicit-declaration-of-function-gpiochip_remove_pin_ranges-did-you-mean-gpiochip_add_pin_ranges
|   |-- drivers-gpio-gpiolib.c:warning:control-reaches-end-of-non-void-function
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip-did-you-mean-gpio_to_chip
|   |-- include-asm-generic-gpio.h:warning:return-makes-pointer-from-integer-without-a-cast
|   |-- include-linux-gpio-driver.h:error:unterminated-ifndef
|   `-- include-linux-ucb1400.h:error:field-gc-has-incomplete-type
|-- arm-corgi_defconfig
|   |-- drivers-gpio-gpio-pxa.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpio-pxa.c:error:field-chip-has-incomplete-type
|   |-- drivers-gpio-gpio-pxa.c:error:gpiochip_generic_free-undeclared-(first-use-in-this-function)-did-you-mean-gpiochip_generic_request
|   |-- drivers-gpio-gpio-pxa.c:error:gpiochip_generic_request-undeclared-(first-use-in-this-function)-did-you-mean-pinctrl_gpio_request
|   |-- drivers-gpio-gpio-pxa.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-gpio-gpio-pxa.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-gpio-gpio-pxa.c:warning:control-reaches-end-of-non-void-function
|   |-- drivers-gpio-gpio-pxa.c:warning:initialization-makes-pointer-from-integer-without-a-cast
|   |-- drivers-gpio-gpiolib-devprop.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpiolib.c:error:conflicting-types-for-gpiod_to_chip
|   |-- drivers-gpio-gpiolib.c:error:dereferencing-pointer-to-incomplete-type-const-struct-gpio_chip
|   |-- drivers-gpio-gpiolib.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpiolib.c:error:implicit-declaration-of-function-gpiochip_add_data-did-you-mean-gpiochip_get_data
|   |-- drivers-gpio-gpiolib.c:error:implicit-declaration-of-function-gpiochip_remove_pin_ranges-did-you-mean-gpiochip_add_pin_ranges
|   |-- drivers-gpio-gpiolib.c:warning:control-reaches-end-of-non-void-function
|   |-- drivers-usb-serial-ftdi_sio.c:error:field-gc-has-incomplete-type
|   |-- drivers-usb-serial-ftdi_sio.c:error:implicit-declaration-of-function-gpiochip_add_data-did-you-mean-tty_audit_add_data
|   |-- drivers-usb-serial-ftdi_sio.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-usb-serial-ftdi_sio.c:error:implicit-declaration-of-function-gpiochip_remove-did-you-mean-ftdi_gpio_remove
|   |-- drivers-usb-serial-ftdi_sio.c:warning:initialization-makes-pointer-from-integer-without-a-cast
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip-did-you-mean-gpio_to_chip
|   |-- include-asm-generic-gpio.h:warning:return-makes-pointer-from-integer-without-a-cast
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- arm-efm32_defconfig
|   |-- drivers-gpio-gpiolib-devprop.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpiolib-of.c:error:dereferencing-pointer-to-incomplete-type-const-struct-gpio_chip
|   |-- drivers-gpio-gpiolib-of.c:error:implicit-declaration-of-function-devprop_gpiochip_set_names-did-you-mean-of_gpiochip_scan_gpios
|   |-- drivers-gpio-gpiolib-of.c:error:implicit-declaration-of-function-gpiochip_add_data-did-you-mean-gpiochip_get_desc
|   |-- drivers-gpio-gpiolib-of.c:error:implicit-declaration-of-function-gpiochip_find-did-you-mean-of_gpiochip_add
|   |-- drivers-gpio-gpiolib-of.c:error:implicit-declaration-of-function-gpiochip_remove-did-you-mean-of_gpiochip_remove
|   |-- drivers-gpio-gpiolib-of.c:note:in-expansion-of-macro-of_fwnode_handle
|   |-- drivers-gpio-gpiolib-of.c:warning:control-reaches-end-of-non-void-function
|   |-- drivers-gpio-gpiolib-of.c:warning:return-makes-pointer-from-integer-without-a-cast
|   |-- drivers-gpio-gpiolib-sysfs.c:error:dereferencing-pointer-to-incomplete-type-const-struct-gpio_chip
|   |-- drivers-gpio-gpiolib-sysfs.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpiolib-sysfs.c:error:implicit-declaration-of-function-gpiochip_lock_as_irq-did-you-mean-spin_lock_irq
|   |-- drivers-gpio-gpiolib-sysfs.c:error:implicit-declaration-of-function-gpiochip_unlock_as_irq-did-you-mean-spin_unlock_irq
|   |-- drivers-gpio-gpiolib.c:error:conflicting-types-for-gpiod_to_chip
|   |-- drivers-gpio-gpiolib.c:error:dereferencing-pointer-to-incomplete-type-const-struct-gpio_chip
|   |-- drivers-gpio-gpiolib.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpiolib.c:error:implicit-declaration-of-function-gpiochip_add_data-did-you-mean-gpiochip_get_data
|   |-- drivers-gpio-gpiolib.c:error:implicit-declaration-of-function-gpiochip_remove_pin_ranges-did-you-mean-gpiochip_add_pin_ranges
|   |-- drivers-gpio-gpiolib.c:warning:control-reaches-end-of-non-void-function
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip-did-you-mean-gpio_to_chip
|   |-- include-asm-generic-gpio.h:warning:return-makes-pointer-from-integer-without-a-cast
|   |-- include-linux-gpio-driver.h:error:unterminated-ifndef
|   |-- include-linux-kernel.h:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- include-linux-of.h:error:invalid-type-argument-of-(have-int-)
|   |-- include-linux-of_gpio.h:error:field-gc-has-incomplete-type
|   `-- include-linux-of_gpio.h:note:in-expansion-of-macro-container_of
|-- arm-ep93xx_defconfig
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- arm-exynos_defconfig
|   |-- drivers-gpio-gpio-wm8994.c:error:const-struct-gpio_chip-has-no-member-named-can_sleep
|   |-- drivers-gpio-gpio-wm8994.c:error:const-struct-gpio_chip-has-no-member-named-dbg_show
|   |-- drivers-gpio-gpio-wm8994.c:error:const-struct-gpio_chip-has-no-member-named-direction_input
|   |-- drivers-gpio-gpio-wm8994.c:error:const-struct-gpio_chip-has-no-member-named-direction_output
|   |-- drivers-gpio-gpio-wm8994.c:error:const-struct-gpio_chip-has-no-member-named-get
|   |-- drivers-gpio-gpio-wm8994.c:error:const-struct-gpio_chip-has-no-member-named-label
|   |-- drivers-gpio-gpio-wm8994.c:error:const-struct-gpio_chip-has-no-member-named-owner
|   |-- drivers-gpio-gpio-wm8994.c:error:const-struct-gpio_chip-has-no-member-named-request
|   |-- drivers-gpio-gpio-wm8994.c:error:const-struct-gpio_chip-has-no-member-named-set
|   |-- drivers-gpio-gpio-wm8994.c:error:const-struct-gpio_chip-has-no-member-named-set_config
|   |-- drivers-gpio-gpio-wm8994.c:error:const-struct-gpio_chip-has-no-member-named-to_irq
|   |-- drivers-gpio-gpio-wm8994.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpio-wm8994.c:error:field-gpio_chip-has-incomplete-type
|   |-- drivers-gpio-gpio-wm8994.c:error:implicit-declaration-of-function-devm_gpiochip_add_data-did-you-mean-irq_get_chip_data
|   |-- drivers-gpio-gpio-wm8994.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-gpio-gpio-wm8994.c:error:implicit-declaration-of-function-gpiochip_is_requested-did-you-mean-pinctrl_gpio_request
|   |-- drivers-gpio-gpio-wm8994.c:error:storage-size-of-template_chip-isn-t-known
|   |-- drivers-gpio-gpio-wm8994.c:error:variable-template_chip-has-initializer-but-incomplete-type
|   |-- drivers-gpio-gpio-wm8994.c:note:in-expansion-of-macro-THIS_MODULE
|   |-- drivers-gpio-gpio-wm8994.c:warning:assignment-makes-pointer-from-integer-without-a-cast
|   |-- drivers-gpio-gpio-wm8994.c:warning:excess-elements-in-struct-initializer
|   |-- drivers-gpio-gpio-wm8994.c:warning:initialization-makes-pointer-from-integer-without-a-cast
|   |-- drivers-gpio-gpiolib-devprop.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpiolib-of.c:error:dereferencing-pointer-to-incomplete-type-const-struct-gpio_chip
|   |-- drivers-gpio-gpiolib-of.c:error:implicit-declaration-of-function-devprop_gpiochip_set_names-did-you-mean-of_gpiochip_scan_gpios
|   |-- drivers-gpio-gpiolib-of.c:error:implicit-declaration-of-function-gpiochip_add_data-did-you-mean-gpiochip_get_desc
|   |-- drivers-gpio-gpiolib-of.c:error:implicit-declaration-of-function-gpiochip_find-did-you-mean-of_gpiochip_add
|   |-- drivers-gpio-gpiolib-of.c:error:implicit-declaration-of-function-gpiochip_remove-did-you-mean-of_gpiochip_remove
|   |-- drivers-gpio-gpiolib-of.c:note:in-expansion-of-macro-of_fwnode_handle
|   |-- drivers-gpio-gpiolib-of.c:warning:control-reaches-end-of-non-void-function
|   |-- drivers-gpio-gpiolib-of.c:warning:return-makes-pointer-from-integer-without-a-cast
|   |-- drivers-gpio-gpiolib.c:error:conflicting-types-for-gpiod_to_chip
|   |-- drivers-gpio-gpiolib.c:error:dereferencing-pointer-to-incomplete-type-const-struct-gpio_chip
|   |-- drivers-gpio-gpiolib.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpiolib.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_pin_range
|   |-- drivers-gpio-gpiolib.c:error:implicit-declaration-of-function-gpiochip_add_data-did-you-mean-gpiochip_get_data
|   |-- drivers-gpio-gpiolib.c:error:implicit-declaration-of-function-gpiochip_remove_pin_ranges-did-you-mean-gpiochip_add_pin_ranges
|   |-- drivers-gpio-gpiolib.c:note:in-expansion-of-macro-list_for_each_entry_safe
|   |-- drivers-gpio-gpiolib.c:warning:conflicting-types-for-gpiochip_remove_pin_ranges
|   |-- drivers-gpio-gpiolib.c:warning:control-reaches-end-of-non-void-function
|   |-- drivers-pinctrl-core.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-pinctrl-samsung-pinctrl-exynos.c:error:implicit-declaration-of-function-gpiochip_lock_as_irq-did-you-mean-spin_lock_irq
|   |-- drivers-pinctrl-samsung-pinctrl-exynos.c:error:implicit-declaration-of-function-gpiochip_unlock_as_irq-did-you-mean-spin_unlock_irq
|   |-- drivers-pinctrl-samsung-pinctrl-samsung.c:error:const-struct-gpio_chip-has-no-member-named-direction_input
|   |-- drivers-pinctrl-samsung-pinctrl-samsung.c:error:const-struct-gpio_chip-has-no-member-named-direction_output
|   |-- drivers-pinctrl-samsung-pinctrl-samsung.c:error:const-struct-gpio_chip-has-no-member-named-free
|   |-- drivers-pinctrl-samsung-pinctrl-samsung.c:error:const-struct-gpio_chip-has-no-member-named-get
|   |-- drivers-pinctrl-samsung-pinctrl-samsung.c:error:const-struct-gpio_chip-has-no-member-named-owner
|   |-- drivers-pinctrl-samsung-pinctrl-samsung.c:error:const-struct-gpio_chip-has-no-member-named-request
|   |-- drivers-pinctrl-samsung-pinctrl-samsung.c:error:const-struct-gpio_chip-has-no-member-named-set
|   |-- drivers-pinctrl-samsung-pinctrl-samsung.c:error:const-struct-gpio_chip-has-no-member-named-to_irq
|   |-- drivers-pinctrl-samsung-pinctrl-samsung.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-pinctrl-samsung-pinctrl-samsung.c:error:gpiochip_generic_free-undeclared-here-(not-in-a-function)-did-you-mean-gpiochip_generic_request
|   |-- drivers-pinctrl-samsung-pinctrl-samsung.c:error:gpiochip_generic_request-undeclared-here-(not-in-a-function)-did-you-mean-pinctrl_gpio_request
|   |-- drivers-pinctrl-samsung-pinctrl-samsung.c:error:implicit-declaration-of-function-devm_gpiochip_add_data-did-you-mean-irq_get_chip_data
|   |-- drivers-pinctrl-samsung-pinctrl-samsung.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-pinctrl-samsung-pinctrl-samsung.c:error:storage-size-of-samsung_gpiolib_chip-isn-t-known
|   |-- drivers-pinctrl-samsung-pinctrl-samsung.c:error:variable-samsung_gpiolib_chip-has-initializer-but-incomplete-type
|   |-- drivers-pinctrl-samsung-pinctrl-samsung.c:note:in-expansion-of-macro-THIS_MODULE
|   |-- drivers-pinctrl-samsung-pinctrl-samsung.c:warning:assignment-makes-pointer-from-integer-without-a-cast
|   |-- drivers-pinctrl-samsung-pinctrl-samsung.c:warning:excess-elements-in-struct-initializer
|   |-- drivers-pinctrl-samsung-pinctrl-samsung.c:warning:initialization-makes-pointer-from-integer-without-a-cast
|   |-- drivers-pinctrl-samsung-pinctrl-samsung.h:error:field-gpio_chip-has-incomplete-type
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip-did-you-mean-gpio_to_chip
|   |-- include-asm-generic-gpio.h:warning:return-makes-pointer-from-integer-without-a-cast
|   |-- include-linux-export.h:warning:excess-elements-in-struct-initializer
|   |-- include-linux-gpio-driver.h:error:unterminated-ifndef
|   |-- include-linux-kernel.h:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- include-linux-list.h:error:dereferencing-pointer-to-incomplete-type-struct-gpio_pin_range
|   |-- include-linux-list.h:note:in-expansion-of-macro-container_of
|   |-- include-linux-list.h:note:in-expansion-of-macro-list_entry
|   |-- include-linux-list.h:note:in-expansion-of-macro-list_first_entry
|   |-- include-linux-of.h:error:invalid-type-argument-of-(have-int-)
|   |-- include-linux-of_gpio.h:error:field-gc-has-incomplete-type
|   `-- include-linux-of_gpio.h:note:in-expansion-of-macro-container_of
|-- arm-ezx_defconfig
|   |-- drivers-gpio-gpio-pxa.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpio-pxa.c:error:field-chip-has-incomplete-type
|   |-- drivers-gpio-gpio-pxa.c:error:gpiochip_generic_free-undeclared-(first-use-in-this-function)-did-you-mean-gpiochip_generic_request
|   |-- drivers-gpio-gpio-pxa.c:error:gpiochip_generic_request-undeclared-(first-use-in-this-function)-did-you-mean-pinctrl_gpio_request
|   |-- drivers-gpio-gpio-pxa.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-gpio-gpio-pxa.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-gpio-gpio-pxa.c:warning:control-reaches-end-of-non-void-function
|   |-- drivers-gpio-gpio-pxa.c:warning:initialization-makes-pointer-from-integer-without-a-cast
|   |-- drivers-gpio-gpiolib-devprop.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpiolib-sysfs.c:error:dereferencing-pointer-to-incomplete-type-const-struct-gpio_chip
|   |-- drivers-gpio-gpiolib-sysfs.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpiolib-sysfs.c:error:implicit-declaration-of-function-gpiochip_lock_as_irq-did-you-mean-spin_lock_irq
|   |-- drivers-gpio-gpiolib-sysfs.c:error:implicit-declaration-of-function-gpiochip_unlock_as_irq-did-you-mean-spin_unlock_irq
|   |-- drivers-gpio-gpiolib.c:error:conflicting-types-for-gpiod_to_chip
|   |-- drivers-gpio-gpiolib.c:error:dereferencing-pointer-to-incomplete-type-const-struct-gpio_chip
|   |-- drivers-gpio-gpiolib.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpiolib.c:error:implicit-declaration-of-function-gpiochip_add_data-did-you-mean-gpiochip_get_data
|   |-- drivers-gpio-gpiolib.c:error:implicit-declaration-of-function-gpiochip_remove_pin_ranges-did-you-mean-gpiochip_add_pin_ranges
|   |-- drivers-gpio-gpiolib.c:warning:control-reaches-end-of-non-void-function
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip-did-you-mean-gpio_to_chip
|   |-- include-asm-generic-gpio.h:warning:return-makes-pointer-from-integer-without-a-cast
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- arm-h3600_defconfig
|   |-- drivers-gpio-gpio-sa1100.c:error:field-chip-has-incomplete-type
|   |-- drivers-gpio-gpio-sa1100.c:error:field-name-not-in-record-or-union-initializer
|   |-- drivers-gpio-gpio-sa1100.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-gpio-gpio-sa1100.c:note:in-expansion-of-macro-container_of
|   |-- drivers-gpio-gpio-sa1100.c:note:in-expansion-of-macro-readl_relaxed
|   |-- drivers-gpio-gpio-sa1100.c:note:in-expansion-of-macro-sa1100_gpio_chip
|   |-- drivers-gpio-gpiolib-devprop.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpiolib.c:error:conflicting-types-for-gpiod_to_chip
|   |-- drivers-gpio-gpiolib.c:error:dereferencing-pointer-to-incomplete-type-const-struct-gpio_chip
|   |-- drivers-gpio-gpiolib.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpiolib.c:error:implicit-declaration-of-function-gpiochip_add_data-did-you-mean-gpiochip_get_data
|   |-- drivers-gpio-gpiolib.c:error:implicit-declaration-of-function-gpiochip_remove_pin_ranges-did-you-mean-gpiochip_add_pin_ranges
|   |-- drivers-gpio-gpiolib.c:warning:control-reaches-end-of-non-void-function
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip-did-you-mean-gpio_to_chip
|   |-- include-asm-generic-gpio.h:warning:return-makes-pointer-from-integer-without-a-cast
|   |-- include-linux-gpio-driver.h:error:unterminated-ifndef
|   `-- include-linux-kernel.h:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|-- arm-h5000_defconfig
|   |-- drivers-gpio-gpio-pxa.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpio-pxa.c:error:field-chip-has-incomplete-type
|   |-- drivers-gpio-gpio-pxa.c:error:gpiochip_generic_free-undeclared-(first-use-in-this-function)-did-you-mean-gpiochip_generic_request
|   |-- drivers-gpio-gpio-pxa.c:error:gpiochip_generic_request-undeclared-(first-use-in-this-function)-did-you-mean-pinctrl_gpio_request
|   |-- drivers-gpio-gpio-pxa.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-gpio-gpio-pxa.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-gpio-gpio-pxa.c:warning:control-reaches-end-of-non-void-function
|   |-- drivers-gpio-gpio-pxa.c:warning:initialization-makes-pointer-from-integer-without-a-cast
|   |-- drivers-gpio-gpiolib-devprop.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpiolib.c:error:conflicting-types-for-gpiod_to_chip
|   |-- drivers-gpio-gpiolib.c:error:dereferencing-pointer-to-incomplete-type-const-struct-gpio_chip
|   |-- drivers-gpio-gpiolib.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpiolib.c:error:implicit-declaration-of-function-gpiochip_add_data-did-you-mean-gpiochip_get_data
|   |-- drivers-gpio-gpiolib.c:error:implicit-declaration-of-function-gpiochip_remove_pin_ranges-did-you-mean-gpiochip_add_pin_ranges
|   |-- drivers-gpio-gpiolib.c:warning:control-reaches-end-of-non-void-function
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip-did-you-mean-gpio_to_chip
|   |-- include-asm-generic-gpio.h:warning:return-makes-pointer-from-integer-without-a-cast
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- arm-imote2_defconfig
|   |-- drivers-gpio-gpio-pxa.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpio-pxa.c:error:field-chip-has-incomplete-type
|   |-- drivers-gpio-gpio-pxa.c:error:gpiochip_generic_free-undeclared-(first-use-in-this-function)-did-you-mean-gpiochip_generic_request
|   |-- drivers-gpio-gpio-pxa.c:error:gpiochip_generic_request-undeclared-(first-use-in-this-function)-did-you-mean-pinctrl_gpio_request
|   |-- drivers-gpio-gpio-pxa.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-gpio-gpio-pxa.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-gpio-gpio-pxa.c:warning:control-reaches-end-of-non-void-function
|   |-- drivers-gpio-gpio-pxa.c:warning:initialization-makes-pointer-from-integer-without-a-cast
|   |-- drivers-gpio-gpiolib-devprop.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpiolib-sysfs.c:error:dereferencing-pointer-to-incomplete-type-const-struct-gpio_chip
|   |-- drivers-gpio-gpiolib-sysfs.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpiolib-sysfs.c:error:implicit-declaration-of-function-gpiochip_lock_as_irq-did-you-mean-spin_lock_irq
|   |-- drivers-gpio-gpiolib-sysfs.c:error:implicit-declaration-of-function-gpiochip_unlock_as_irq-did-you-mean-spin_unlock_irq
|   |-- drivers-gpio-gpiolib.c:error:conflicting-types-for-gpiod_to_chip
|   |-- drivers-gpio-gpiolib.c:error:dereferencing-pointer-to-incomplete-type-const-struct-gpio_chip
|   |-- drivers-gpio-gpiolib.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpiolib.c:error:implicit-declaration-of-function-gpiochip_add_data-did-you-mean-gpiochip_get_data
|   |-- drivers-gpio-gpiolib.c:error:implicit-declaration-of-function-gpiochip_remove_pin_ranges-did-you-mean-gpiochip_add_pin_ranges
|   |-- drivers-gpio-gpiolib.c:warning:control-reaches-end-of-non-void-function
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip-did-you-mean-gpio_to_chip
|   |-- include-asm-generic-gpio.h:warning:return-makes-pointer-from-integer-without-a-cast
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- arm-imx_v6_v7_defconfig
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- arm-ixp4xx_defconfig
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- arm-jornada720_defconfig
|   |-- drivers-gpio-gpio-sa1100.c:error:field-chip-has-incomplete-type
|   |-- drivers-gpio-gpio-sa1100.c:error:field-name-not-in-record-or-union-initializer
|   |-- drivers-gpio-gpio-sa1100.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-gpio-gpio-sa1100.c:note:in-expansion-of-macro-container_of
|   |-- drivers-gpio-gpio-sa1100.c:note:in-expansion-of-macro-readl_relaxed
|   |-- drivers-gpio-gpio-sa1100.c:note:in-expansion-of-macro-sa1100_gpio_chip
|   |-- drivers-gpio-gpiolib-devprop.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpiolib.c:error:conflicting-types-for-gpiod_to_chip
|   |-- drivers-gpio-gpiolib.c:error:dereferencing-pointer-to-incomplete-type-const-struct-gpio_chip
|   |-- drivers-gpio-gpiolib.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpiolib.c:error:implicit-declaration-of-function-gpiochip_add_data-did-you-mean-gpiochip_get_data
|   |-- drivers-gpio-gpiolib.c:error:implicit-declaration-of-function-gpiochip_remove_pin_ranges-did-you-mean-gpiochip_add_pin_ranges
|   |-- drivers-gpio-gpiolib.c:warning:control-reaches-end-of-non-void-function
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip-did-you-mean-gpio_to_chip
|   |-- include-asm-generic-gpio.h:warning:return-makes-pointer-from-integer-without-a-cast
|   |-- include-linux-gpio-driver.h:error:unterminated-ifndef
|   `-- include-linux-kernel.h:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|-- arm-lpc18xx_defconfig
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- arm-magician_defconfig
|   |-- drivers-gpio-gpio-pxa.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpio-pxa.c:error:field-chip-has-incomplete-type
|   |-- drivers-gpio-gpio-pxa.c:error:gpiochip_generic_free-undeclared-(first-use-in-this-function)-did-you-mean-gpiochip_generic_request
|   |-- drivers-gpio-gpio-pxa.c:error:gpiochip_generic_request-undeclared-(first-use-in-this-function)-did-you-mean-pinctrl_gpio_request
|   |-- drivers-gpio-gpio-pxa.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-gpio-gpio-pxa.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-gpio-gpio-pxa.c:warning:control-reaches-end-of-non-void-function
|   |-- drivers-gpio-gpio-pxa.c:warning:initialization-makes-pointer-from-integer-without-a-cast
|   |-- drivers-gpio-gpiolib-devprop.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpiolib.c:error:conflicting-types-for-gpiod_to_chip
|   |-- drivers-gpio-gpiolib.c:error:dereferencing-pointer-to-incomplete-type-const-struct-gpio_chip
|   |-- drivers-gpio-gpiolib.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpiolib.c:error:implicit-declaration-of-function-gpiochip_add_data-did-you-mean-gpiochip_get_data
|   |-- drivers-gpio-gpiolib.c:error:implicit-declaration-of-function-gpiochip_remove_pin_ranges-did-you-mean-gpiochip_add_pin_ranges
|   |-- drivers-gpio-gpiolib.c:warning:control-reaches-end-of-non-void-function
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip-did-you-mean-gpio_to_chip
|   |-- include-asm-generic-gpio.h:warning:return-makes-pointer-from-integer-without-a-cast
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- arm-mainstone_defconfig
|   |-- drivers-gpio-gpio-pxa.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpio-pxa.c:error:field-chip-has-incomplete-type
|   |-- drivers-gpio-gpio-pxa.c:error:gpiochip_generic_free-undeclared-(first-use-in-this-function)-did-you-mean-gpiochip_generic_request
|   |-- drivers-gpio-gpio-pxa.c:error:gpiochip_generic_request-undeclared-(first-use-in-this-function)-did-you-mean-pinctrl_gpio_request
|   |-- drivers-gpio-gpio-pxa.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-gpio-gpio-pxa.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-gpio-gpio-pxa.c:warning:control-reaches-end-of-non-void-function
|   |-- drivers-gpio-gpio-pxa.c:warning:initialization-makes-pointer-from-integer-without-a-cast
|   |-- drivers-gpio-gpiolib-devprop.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpiolib.c:error:conflicting-types-for-gpiod_to_chip
|   |-- drivers-gpio-gpiolib.c:error:dereferencing-pointer-to-incomplete-type-const-struct-gpio_chip
|   |-- drivers-gpio-gpiolib.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpiolib.c:error:implicit-declaration-of-function-gpiochip_add_data-did-you-mean-gpiochip_get_data
|   |-- drivers-gpio-gpiolib.c:error:implicit-declaration-of-function-gpiochip_remove_pin_ranges-did-you-mean-gpiochip_add_pin_ranges
|   |-- drivers-gpio-gpiolib.c:warning:control-reaches-end-of-non-void-function
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip-did-you-mean-gpio_to_chip
|   |-- include-asm-generic-gpio.h:warning:return-makes-pointer-from-integer-without-a-cast
|   |-- include-linux-gpio-driver.h:error:unterminated-ifndef
|   `-- include-linux-kernel.h:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|-- arm-multi_v5_defconfig
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- arm-multi_v7_defconfig
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- arm-mv78xx0_defconfig
|   |-- drivers-gpio-gpiolib-devprop.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpiolib-of.c:error:dereferencing-pointer-to-incomplete-type-const-struct-gpio_chip
|   |-- drivers-gpio-gpiolib-of.c:error:implicit-declaration-of-function-devprop_gpiochip_set_names-did-you-mean-of_gpiochip_scan_gpios
|   |-- drivers-gpio-gpiolib-of.c:error:implicit-declaration-of-function-gpiochip_add_data-did-you-mean-gpiochip_get_desc
|   |-- drivers-gpio-gpiolib-of.c:error:implicit-declaration-of-function-gpiochip_find-did-you-mean-of_gpiochip_add
|   |-- drivers-gpio-gpiolib-of.c:error:implicit-declaration-of-function-gpiochip_remove-did-you-mean-of_gpiochip_remove
|   |-- drivers-gpio-gpiolib-of.c:note:in-expansion-of-macro-of_fwnode_handle
|   |-- drivers-gpio-gpiolib-of.c:warning:control-reaches-end-of-non-void-function
|   |-- drivers-gpio-gpiolib-of.c:warning:return-makes-pointer-from-integer-without-a-cast
|   |-- drivers-gpio-gpiolib.c:error:conflicting-types-for-gpiod_to_chip
|   |-- drivers-gpio-gpiolib.c:error:dereferencing-pointer-to-incomplete-type-const-struct-gpio_chip
|   |-- drivers-gpio-gpiolib.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpiolib.c:error:implicit-declaration-of-function-gpiochip_add_data-did-you-mean-gpiochip_get_data
|   |-- drivers-gpio-gpiolib.c:error:implicit-declaration-of-function-gpiochip_remove_pin_ranges-did-you-mean-gpiochip_add_pin_ranges
|   |-- drivers-gpio-gpiolib.c:warning:control-reaches-end-of-non-void-function
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip-did-you-mean-gpio_to_chip
|   |-- include-asm-generic-gpio.h:warning:return-makes-pointer-from-integer-without-a-cast
|   |-- include-linux-gpio-driver.h:error:unterminated-ifndef
|   |-- include-linux-kernel.h:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- include-linux-of.h:error:invalid-type-argument-of-(have-int-)
|   |-- include-linux-of_gpio.h:error:field-gc-has-incomplete-type
|   `-- include-linux-of_gpio.h:note:in-expansion-of-macro-container_of
|-- arm-mvebu_v7_defconfig
|   |-- drivers-gpio-gpiolib-devprop.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpiolib-of.c:error:dereferencing-pointer-to-incomplete-type-const-struct-gpio_chip
|   |-- drivers-gpio-gpiolib-of.c:error:implicit-declaration-of-function-devprop_gpiochip_set_names-did-you-mean-of_gpiochip_scan_gpios
|   |-- drivers-gpio-gpiolib-of.c:error:implicit-declaration-of-function-gpiochip_add_data-did-you-mean-gpiochip_get_desc
|   |-- drivers-gpio-gpiolib-of.c:error:implicit-declaration-of-function-gpiochip_find-did-you-mean-of_gpiochip_add
|   |-- drivers-gpio-gpiolib-of.c:error:implicit-declaration-of-function-gpiochip_remove-did-you-mean-of_gpiochip_remove
|   |-- drivers-gpio-gpiolib-of.c:note:in-expansion-of-macro-of_fwnode_handle
|   |-- drivers-gpio-gpiolib-of.c:warning:control-reaches-end-of-non-void-function
|   |-- drivers-gpio-gpiolib-of.c:warning:return-makes-pointer-from-integer-without-a-cast
|   |-- drivers-gpio-gpiolib-sysfs.c:error:dereferencing-pointer-to-incomplete-type-const-struct-gpio_chip
|   |-- drivers-gpio-gpiolib-sysfs.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpiolib-sysfs.c:error:implicit-declaration-of-function-gpiochip_lock_as_irq-did-you-mean-spin_lock_irq
|   |-- drivers-gpio-gpiolib-sysfs.c:error:implicit-declaration-of-function-gpiochip_unlock_as_irq-did-you-mean-spin_unlock_irq
|   |-- drivers-gpio-gpiolib.c:error:conflicting-types-for-gpiod_to_chip
|   |-- drivers-gpio-gpiolib.c:error:dereferencing-pointer-to-incomplete-type-const-struct-gpio_chip
|   |-- drivers-gpio-gpiolib.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpiolib.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_pin_range
|   |-- drivers-gpio-gpiolib.c:error:implicit-declaration-of-function-gpiochip_add_data-did-you-mean-gpiochip_get_data
|   |-- drivers-gpio-gpiolib.c:error:implicit-declaration-of-function-gpiochip_remove_pin_ranges-did-you-mean-gpiochip_add_pin_ranges
|   |-- drivers-gpio-gpiolib.c:note:in-expansion-of-macro-list_for_each_entry_safe
|   |-- drivers-gpio-gpiolib.c:warning:conflicting-types-for-gpiochip_remove_pin_ranges
|   |-- drivers-gpio-gpiolib.c:warning:control-reaches-end-of-non-void-function
|   |-- drivers-pinctrl-core.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip-did-you-mean-gpio_to_chip
|   |-- include-asm-generic-gpio.h:warning:return-makes-pointer-from-integer-without-a-cast
|   |-- include-linux-gpio-driver.h:error:unterminated-ifndef
|   |-- include-linux-kernel.h:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- include-linux-list.h:error:dereferencing-pointer-to-incomplete-type-struct-gpio_pin_range
|   |-- include-linux-list.h:note:in-expansion-of-macro-container_of
|   |-- include-linux-list.h:note:in-expansion-of-macro-list_entry
|   |-- include-linux-list.h:note:in-expansion-of-macro-list_first_entry
|   |-- include-linux-of.h:error:invalid-type-argument-of-(have-int-)
|   |-- include-linux-of_gpio.h:error:field-gc-has-incomplete-type
|   `-- include-linux-of_gpio.h:note:in-expansion-of-macro-container_of
|-- arm-omap1_defconfig
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- arm-omap2plus_defconfig
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- arm-prima2_defconfig
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- arm-pxa910_defconfig
|   |-- drivers-gpio-gpio-pxa.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpio-pxa.c:error:field-chip-has-incomplete-type
|   |-- drivers-gpio-gpio-pxa.c:error:gpiochip_generic_free-undeclared-(first-use-in-this-function)-did-you-mean-gpiochip_generic_request
|   |-- drivers-gpio-gpio-pxa.c:error:gpiochip_generic_request-undeclared-(first-use-in-this-function)-did-you-mean-pinctrl_gpio_request
|   |-- drivers-gpio-gpio-pxa.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-gpio-gpio-pxa.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-gpio-gpio-pxa.c:warning:control-reaches-end-of-non-void-function
|   |-- drivers-gpio-gpio-pxa.c:warning:initialization-makes-pointer-from-integer-without-a-cast
|   |-- drivers-gpio-gpiolib-devprop.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpiolib-of.c:error:dereferencing-pointer-to-incomplete-type-const-struct-gpio_chip
|   |-- drivers-gpio-gpiolib-of.c:error:implicit-declaration-of-function-devprop_gpiochip_set_names-did-you-mean-of_gpiochip_scan_gpios
|   |-- drivers-gpio-gpiolib-of.c:error:implicit-declaration-of-function-gpiochip_add_data-did-you-mean-gpiochip_get_desc
|   |-- drivers-gpio-gpiolib-of.c:error:implicit-declaration-of-function-gpiochip_find-did-you-mean-of_gpiochip_add
|   |-- drivers-gpio-gpiolib-of.c:error:implicit-declaration-of-function-gpiochip_remove-did-you-mean-of_gpiochip_remove
|   |-- drivers-gpio-gpiolib-of.c:note:in-expansion-of-macro-of_fwnode_handle
|   |-- drivers-gpio-gpiolib-of.c:warning:control-reaches-end-of-non-void-function
|   |-- drivers-gpio-gpiolib-of.c:warning:return-makes-pointer-from-integer-without-a-cast
|   |-- drivers-gpio-gpiolib.c:error:conflicting-types-for-gpiod_to_chip
|   |-- drivers-gpio-gpiolib.c:error:dereferencing-pointer-to-incomplete-type-const-struct-gpio_chip
|   |-- drivers-gpio-gpiolib.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpiolib.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_pin_range
|   |-- drivers-gpio-gpiolib.c:error:implicit-declaration-of-function-gpiochip_add_data-did-you-mean-gpiochip_get_data
|   |-- drivers-gpio-gpiolib.c:error:implicit-declaration-of-function-gpiochip_remove_pin_ranges-did-you-mean-gpiochip_add_pin_ranges
|   |-- drivers-gpio-gpiolib.c:note:in-expansion-of-macro-list_for_each_entry_safe
|   |-- drivers-gpio-gpiolib.c:warning:conflicting-types-for-gpiochip_remove_pin_ranges
|   |-- drivers-gpio-gpiolib.c:warning:control-reaches-end-of-non-void-function
|   |-- drivers-pinctrl-core.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip-did-you-mean-gpio_to_chip
|   |-- include-asm-generic-gpio.h:warning:return-makes-pointer-from-integer-without-a-cast
|   |-- include-linux-gpio-driver.h:error:unterminated-ifndef
|   |-- include-linux-kernel.h:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- include-linux-list.h:error:dereferencing-pointer-to-incomplete-type-struct-gpio_pin_range
|   |-- include-linux-list.h:note:in-expansion-of-macro-container_of
|   |-- include-linux-list.h:note:in-expansion-of-macro-list_entry
|   |-- include-linux-list.h:note:in-expansion-of-macro-list_first_entry
|   |-- include-linux-of.h:error:invalid-type-argument-of-(have-int-)
|   |-- include-linux-of_gpio.h:error:field-gc-has-incomplete-type
|   `-- include-linux-of_gpio.h:note:in-expansion-of-macro-container_of
|-- arm-randconfig-a001-20200210
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- arm-randconfig-a001-20200211
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- arm-shannon_defconfig
|   |-- drivers-gpio-gpio-sa1100.c:error:field-chip-has-incomplete-type
|   |-- drivers-gpio-gpio-sa1100.c:error:field-name-not-in-record-or-union-initializer
|   |-- drivers-gpio-gpio-sa1100.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-gpio-gpio-sa1100.c:note:in-expansion-of-macro-container_of
|   |-- drivers-gpio-gpio-sa1100.c:note:in-expansion-of-macro-readl_relaxed
|   |-- drivers-gpio-gpio-sa1100.c:note:in-expansion-of-macro-sa1100_gpio_chip
|   |-- drivers-gpio-gpiolib-devprop.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpiolib.c:error:conflicting-types-for-gpiod_to_chip
|   |-- drivers-gpio-gpiolib.c:error:dereferencing-pointer-to-incomplete-type-const-struct-gpio_chip
|   |-- drivers-gpio-gpiolib.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpiolib.c:error:implicit-declaration-of-function-gpiochip_add_data-did-you-mean-gpiochip_get_data
|   |-- drivers-gpio-gpiolib.c:error:implicit-declaration-of-function-gpiochip_remove_pin_ranges-did-you-mean-gpiochip_add_pin_ranges
|   |-- drivers-gpio-gpiolib.c:warning:control-reaches-end-of-non-void-function
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip-did-you-mean-gpio_to_chip
|   |-- include-asm-generic-gpio.h:warning:return-makes-pointer-from-integer-without-a-cast
|   |-- include-linux-gpio-driver.h:error:unterminated-ifndef
|   `-- include-linux-kernel.h:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|-- arm-shmobile_defconfig
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- arm-spear13xx_defconfig
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- arm-sunxi_defconfig
|   |-- drivers-gpio-gpiolib-devprop.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpiolib-of.c:error:dereferencing-pointer-to-incomplete-type-const-struct-gpio_chip
|   |-- drivers-gpio-gpiolib-of.c:error:implicit-declaration-of-function-devprop_gpiochip_set_names-did-you-mean-of_gpiochip_scan_gpios
|   |-- drivers-gpio-gpiolib-of.c:error:implicit-declaration-of-function-gpiochip_add_data-did-you-mean-gpiochip_get_desc
|   |-- drivers-gpio-gpiolib-of.c:error:implicit-declaration-of-function-gpiochip_find-did-you-mean-of_gpiochip_add
|   |-- drivers-gpio-gpiolib-of.c:error:implicit-declaration-of-function-gpiochip_remove-did-you-mean-of_gpiochip_remove
|   |-- drivers-gpio-gpiolib-of.c:note:in-expansion-of-macro-of_fwnode_handle
|   |-- drivers-gpio-gpiolib-of.c:warning:control-reaches-end-of-non-void-function
|   |-- drivers-gpio-gpiolib-of.c:warning:return-makes-pointer-from-integer-without-a-cast
|   |-- drivers-gpio-gpiolib-sysfs.c:error:dereferencing-pointer-to-incomplete-type-const-struct-gpio_chip
|   |-- drivers-gpio-gpiolib-sysfs.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpiolib-sysfs.c:error:implicit-declaration-of-function-gpiochip_lock_as_irq-did-you-mean-spin_lock_irq
|   |-- drivers-gpio-gpiolib-sysfs.c:error:implicit-declaration-of-function-gpiochip_unlock_as_irq-did-you-mean-spin_unlock_irq
|   |-- drivers-gpio-gpiolib.c:error:conflicting-types-for-gpiod_to_chip
|   |-- drivers-gpio-gpiolib.c:error:dereferencing-pointer-to-incomplete-type-const-struct-gpio_chip
|   |-- drivers-gpio-gpiolib.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpiolib.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_pin_range
|   |-- drivers-gpio-gpiolib.c:error:implicit-declaration-of-function-gpiochip_add_data-did-you-mean-gpiochip_get_data
|   |-- drivers-gpio-gpiolib.c:error:implicit-declaration-of-function-gpiochip_remove_pin_ranges-did-you-mean-gpiochip_add_pin_ranges
|   |-- drivers-gpio-gpiolib.c:note:in-expansion-of-macro-list_for_each_entry_safe
|   |-- drivers-gpio-gpiolib.c:warning:conflicting-types-for-gpiochip_remove_pin_ranges
|   |-- drivers-gpio-gpiolib.c:warning:control-reaches-end-of-non-void-function
|   |-- drivers-pinctrl-core.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-pinctrl-sunxi-pinctrl-sunxi.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-pinctrl-sunxi-pinctrl-sunxi.c:error:gpiochip_generic_config-undeclared-(first-use-in-this-function)-did-you-mean-gpiochip_generic_free
|   |-- drivers-pinctrl-sunxi-pinctrl-sunxi.c:error:gpiochip_generic_free-undeclared-(first-use-in-this-function)-did-you-mean-gpiochip_generic_request
|   |-- drivers-pinctrl-sunxi-pinctrl-sunxi.c:error:gpiochip_generic_request-undeclared-(first-use-in-this-function)-did-you-mean-pinctrl_gpio_request
|   |-- drivers-pinctrl-sunxi-pinctrl-sunxi.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-pinctrl-sunxi-pinctrl-sunxi.c:error:implicit-declaration-of-function-gpiochip_add_pin_range-did-you-mean-pinctrl_add_gpio_range
|   |-- drivers-pinctrl-sunxi-pinctrl-sunxi.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-pinctrl-sunxi-pinctrl-sunxi.c:error:implicit-declaration-of-function-gpiochip_line_is_irq-did-you-mean-cache_line_size
|   |-- drivers-pinctrl-sunxi-pinctrl-sunxi.c:error:implicit-declaration-of-function-gpiochip_lock_as_irq-did-you-mean-spin_lock_irq
|   |-- drivers-pinctrl-sunxi-pinctrl-sunxi.c:error:implicit-declaration-of-function-gpiochip_remove-did-you-mean-klist_remove
|   |-- drivers-pinctrl-sunxi-pinctrl-sunxi.c:error:implicit-declaration-of-function-gpiochip_unlock_as_irq-did-you-mean-spin_unlock_irq
|   |-- drivers-pinctrl-sunxi-pinctrl-sunxi.c:warning:initialization-makes-pointer-from-integer-without-a-cast
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip-did-you-mean-gpio_to_chip
|   |-- include-asm-generic-gpio.h:warning:return-makes-pointer-from-integer-without-a-cast
|   |-- include-linux-gpio-driver.h:error:unterminated-ifndef
|   |-- include-linux-kernel.h:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- include-linux-list.h:error:dereferencing-pointer-to-incomplete-type-struct-gpio_pin_range
|   |-- include-linux-list.h:note:in-expansion-of-macro-container_of
|   |-- include-linux-list.h:note:in-expansion-of-macro-list_entry
|   |-- include-linux-list.h:note:in-expansion-of-macro-list_first_entry
|   |-- include-linux-of.h:error:invalid-type-argument-of-(have-int-)
|   |-- include-linux-of_gpio.h:error:field-gc-has-incomplete-type
|   `-- include-linux-of_gpio.h:note:in-expansion-of-macro-container_of
|-- arm-tango4_defconfig
|   |-- drivers-gpio-gpiolib-devprop.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpiolib-of.c:error:dereferencing-pointer-to-incomplete-type-const-struct-gpio_chip
|   |-- drivers-gpio-gpiolib-of.c:error:implicit-declaration-of-function-devprop_gpiochip_set_names-did-you-mean-of_gpiochip_scan_gpios
|   |-- drivers-gpio-gpiolib-of.c:error:implicit-declaration-of-function-gpiochip_add_data-did-you-mean-gpiochip_get_desc
|   |-- drivers-gpio-gpiolib-of.c:error:implicit-declaration-of-function-gpiochip_find-did-you-mean-of_gpiochip_add
|   |-- drivers-gpio-gpiolib-of.c:error:implicit-declaration-of-function-gpiochip_remove-did-you-mean-of_gpiochip_remove
|   |-- drivers-gpio-gpiolib-of.c:note:in-expansion-of-macro-of_fwnode_handle
|   |-- drivers-gpio-gpiolib-of.c:warning:control-reaches-end-of-non-void-function
|   |-- drivers-gpio-gpiolib-of.c:warning:return-makes-pointer-from-integer-without-a-cast
|   |-- drivers-gpio-gpiolib.c:error:conflicting-types-for-gpiod_to_chip
|   |-- drivers-gpio-gpiolib.c:error:dereferencing-pointer-to-incomplete-type-const-struct-gpio_chip
|   |-- drivers-gpio-gpiolib.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpiolib.c:error:implicit-declaration-of-function-gpiochip_add_data-did-you-mean-gpiochip_get_data
|   |-- drivers-gpio-gpiolib.c:error:implicit-declaration-of-function-gpiochip_remove_pin_ranges-did-you-mean-gpiochip_add_pin_ranges
|   |-- drivers-gpio-gpiolib.c:warning:control-reaches-end-of-non-void-function
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip-did-you-mean-gpio_to_chip
|   |-- include-asm-generic-gpio.h:warning:return-makes-pointer-from-integer-without-a-cast
|   |-- include-linux-gpio-driver.h:error:unterminated-ifndef
|   |-- include-linux-kernel.h:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- include-linux-of.h:error:invalid-type-argument-of-(have-int-)
|   |-- include-linux-of_gpio.h:error:field-gc-has-incomplete-type
|   `-- include-linux-of_gpio.h:note:in-expansion-of-macro-container_of
|-- arm-tegra_defconfig
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- arm-vexpress_defconfig
|   |-- drivers-gpio-gpio-mmio.c:error:BGPIOF_BIG_ENDIAN-undeclared-(first-use-in-this-function)-did-you-mean-_TIF_SIGPENDING
|   |-- drivers-gpio-gpio-mmio.c:error:BGPIOF_BIG_ENDIAN-undeclared-here-(not-in-a-function)-did-you-mean-_TIF_SIGPENDING
|   |-- drivers-gpio-gpio-mmio.c:error:BGPIOF_BIG_ENDIAN_BYTE_ORDER-undeclared-(first-use-in-this-function)
|   |-- drivers-gpio-gpio-mmio.c:error:BGPIOF_BIG_ENDIAN_BYTE_ORDER-undeclared-(first-use-in-this-function)-did-you-mean-BGPIOF_BIG_ENDIAN
|   |-- drivers-gpio-gpio-mmio.c:error:BGPIOF_NO_OUTPUT-undeclared-(first-use-in-this-function)
|   |-- drivers-gpio-gpio-mmio.c:error:BGPIOF_READ_OUTPUT_REG_SET-undeclared-(first-use-in-this-function)-did-you-mean-BGPIOF_UNREADABLE_REG_SET
|   |-- drivers-gpio-gpio-mmio.c:error:BGPIOF_UNREADABLE_REG_DIR-undeclared-(first-use-in-this-function)-did-you-mean-BGPIOF_UNREADABLE_REG_SET
|   |-- drivers-gpio-gpio-mmio.c:error:BGPIOF_UNREADABLE_REG_SET-undeclared-(first-use-in-this-function)
|   |-- drivers-gpio-gpio-mmio.c:error:dereferencing-pointer-to-incomplete-type-struct-bgpio_pdata
|   |-- drivers-gpio-gpio-mmio.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpio-mmio.c:error:implicit-declaration-of-function-devm_gpiochip_add_data-did-you-mean-irq_get_chip_data
|   |-- drivers-gpio-gpio-mmio.c:error:invalid-application-of-sizeof-to-incomplete-type-struct-bgpio_pdata
|   |-- drivers-gpio-gpiolib-devprop.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpiolib-of.c:error:dereferencing-pointer-to-incomplete-type-const-struct-gpio_chip
|   |-- drivers-gpio-gpiolib-of.c:error:implicit-declaration-of-function-devprop_gpiochip_set_names-did-you-mean-of_gpiochip_scan_gpios
|   |-- drivers-gpio-gpiolib-of.c:error:implicit-declaration-of-function-gpiochip_add_data-did-you-mean-gpiochip_get_desc
|   |-- drivers-gpio-gpiolib-of.c:error:implicit-declaration-of-function-gpiochip_find-did-you-mean-of_gpiochip_add
|   |-- drivers-gpio-gpiolib-of.c:error:implicit-declaration-of-function-gpiochip_remove-did-you-mean-of_gpiochip_remove
|   |-- drivers-gpio-gpiolib-of.c:note:in-expansion-of-macro-of_fwnode_handle
|   |-- drivers-gpio-gpiolib-of.c:warning:control-reaches-end-of-non-void-function
|   |-- drivers-gpio-gpiolib-of.c:warning:return-makes-pointer-from-integer-without-a-cast
|   |-- drivers-gpio-gpiolib.c:error:conflicting-types-for-gpiod_to_chip
|   |-- drivers-gpio-gpiolib.c:error:dereferencing-pointer-to-incomplete-type-const-struct-gpio_chip
|   |-- drivers-gpio-gpiolib.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpiolib.c:error:implicit-declaration-of-function-gpiochip_add_data-did-you-mean-gpiochip_get_data
|   |-- drivers-gpio-gpiolib.c:error:implicit-declaration-of-function-gpiochip_remove_pin_ranges-did-you-mean-gpiochip_add_pin_ranges
|   |-- drivers-gpio-gpiolib.c:warning:control-reaches-end-of-non-void-function
|   |-- drivers-mfd-vexpress-sysreg.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-mfd-vexpress-sysreg.c:error:implicit-declaration-of-function-bgpio_init-did-you-mean-cpu_init
|   |-- drivers-mfd-vexpress-sysreg.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-mfd-vexpress-sysreg.c:error:invalid-application-of-sizeof-to-incomplete-type-struct-bgpio_pdata
|   |-- drivers-mfd-vexpress-sysreg.c:error:request-for-member-ngpio-in-something-not-a-structure-or-union
|   |-- drivers-mfd-vexpress-sysreg.c:error:storage-size-of-vexpress_sysreg_sys_flash_pdata-isn-t-known
|   |-- drivers-mfd-vexpress-sysreg.c:error:storage-size-of-vexpress_sysreg_sys_led_pdata-isn-t-known
|   |-- drivers-mfd-vexpress-sysreg.c:error:storage-size-of-vexpress_sysreg_sys_mci_pdata-isn-t-known
|   |-- drivers-mfd-vexpress-sysreg.c:error:struct-bgpio_pdata-has-no-member-named-base
|   |-- drivers-mfd-vexpress-sysreg.c:error:struct-bgpio_pdata-has-no-member-named-label
|   |-- drivers-mfd-vexpress-sysreg.c:error:struct-bgpio_pdata-has-no-member-named-ngpio
|   |-- drivers-mfd-vexpress-sysreg.c:error:variable-vexpress_sysreg_sys_flash_pdata-has-initializer-but-incomplete-type
|   |-- drivers-mfd-vexpress-sysreg.c:error:variable-vexpress_sysreg_sys_led_pdata-has-initializer-but-incomplete-type
|   |-- drivers-mfd-vexpress-sysreg.c:error:variable-vexpress_sysreg_sys_mci_pdata-has-initializer-but-incomplete-type
|   |-- drivers-mfd-vexpress-sysreg.c:warning:excess-elements-in-struct-initializer
|   |-- drivers-mfd-vexpress-sysreg.c:warning:passing-argument-of-devm_kzalloc-makes-integer-from-pointer-without-a-cast
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip-did-you-mean-gpio_to_chip
|   |-- include-asm-generic-gpio.h:warning:return-makes-pointer-from-integer-without-a-cast
|   |-- include-linux-gpio-driver.h:error:unterminated-ifndef
|   |-- include-linux-kernel.h:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- include-linux-of.h:error:invalid-type-argument-of-(have-int-)
|   |-- include-linux-of_gpio.h:error:field-gc-has-incomplete-type
|   `-- include-linux-of_gpio.h:note:in-expansion-of-macro-container_of
|-- arm-viper_defconfig
|   |-- drivers-gpio-gpio-pxa.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpio-pxa.c:error:field-chip-has-incomplete-type
|   |-- drivers-gpio-gpio-pxa.c:error:gpiochip_generic_free-undeclared-(first-use-in-this-function)-did-you-mean-gpiochip_generic_request
|   |-- drivers-gpio-gpio-pxa.c:error:gpiochip_generic_request-undeclared-(first-use-in-this-function)-did-you-mean-pinctrl_gpio_request
|   |-- drivers-gpio-gpio-pxa.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-gpio-gpio-pxa.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-gpio-gpio-pxa.c:warning:control-reaches-end-of-non-void-function
|   |-- drivers-gpio-gpio-pxa.c:warning:initialization-makes-pointer-from-integer-without-a-cast
|   |-- drivers-gpio-gpiolib-devprop.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpiolib-sysfs.c:error:dereferencing-pointer-to-incomplete-type-const-struct-gpio_chip
|   |-- drivers-gpio-gpiolib-sysfs.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpiolib-sysfs.c:error:implicit-declaration-of-function-gpiochip_lock_as_irq-did-you-mean-spin_lock_irq
|   |-- drivers-gpio-gpiolib-sysfs.c:error:implicit-declaration-of-function-gpiochip_unlock_as_irq-did-you-mean-spin_unlock_irq
|   |-- drivers-gpio-gpiolib.c:error:conflicting-types-for-gpiod_to_chip
|   |-- drivers-gpio-gpiolib.c:error:dereferencing-pointer-to-incomplete-type-const-struct-gpio_chip
|   |-- drivers-gpio-gpiolib.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpiolib.c:error:implicit-declaration-of-function-gpiochip_add_data-did-you-mean-gpiochip_get_data
|   |-- drivers-gpio-gpiolib.c:error:implicit-declaration-of-function-gpiochip_remove_pin_ranges-did-you-mean-gpiochip_add_pin_ranges
|   |-- drivers-gpio-gpiolib.c:warning:control-reaches-end-of-non-void-function
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip-did-you-mean-gpio_to_chip
|   |-- include-asm-generic-gpio.h:warning:return-makes-pointer-from-integer-without-a-cast
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- arm64-allmodconfig
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- arm64-allyesconfig
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- arm64-defconfig
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- arm64-randconfig-a001-20200210
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- arm64-randconfig-a001-20200211
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- arm64-randconfig-a001-20200212
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- c6x-allmodconfig
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- c6x-allyesconfig
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- c6x-randconfig-a001-20200211
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- c6x-randconfig-a001-20200212
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- h8300-allyesconfig
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- h8300-randconfig-a001-20200211
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- i386-allmodconfig
|   |-- drivers-gpio-gpio-dio-48e.c:error:assignment-from-incompatible-pointer-type
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- i386-allyesconfig
|   |-- drivers-gpio-gpio-dio-48e.c:error:assignment-from-incompatible-pointer-type
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- i386-defconfig
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- i386-randconfig-b001-20200212
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- i386-randconfig-b002-20200212
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- i386-randconfig-b003-20200212
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- i386-randconfig-c001-20200211
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- i386-randconfig-c001-20200212
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- i386-randconfig-c002-20200211
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- i386-randconfig-c002-20200212
|   |-- drivers-gpio-gpio-dio-48e.c:error:assignment-from-incompatible-pointer-type
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- i386-randconfig-c003-20200211
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- i386-randconfig-c003-20200212
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- i386-randconfig-d001-20200211
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- i386-randconfig-d001-20200212
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- i386-randconfig-d002-20200211
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- i386-randconfig-d002-20200212
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- i386-randconfig-d003-20200211
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- i386-randconfig-d003-20200212
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- i386-randconfig-e001-20200211
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- i386-randconfig-e001-20200212
|   |-- drivers-gpio-gpio-dio-48e.c:error:assignment-from-incompatible-pointer-type
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- i386-randconfig-e002-20200211
|   |-- drivers-gpio-gpio-dio-48e.c:error:assignment-from-incompatible-pointer-type
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- i386-randconfig-e002-20200212
|   |-- drivers-gpio-gpio-dio-48e.c:error:assignment-from-incompatible-pointer-type
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- i386-randconfig-e003-20200211
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- i386-randconfig-e003-20200212
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- i386-randconfig-f001-20200212
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- i386-randconfig-f002-20200212
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- i386-randconfig-f003-20200212
|   |-- drivers-gpio-gpio-dio-48e.c:error:assignment-from-incompatible-pointer-type
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- i386-randconfig-g001-20200212
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- i386-randconfig-g002-20200212
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- i386-randconfig-g003-20200212
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- i386-randconfig-h001-20200211
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- i386-randconfig-h001-20200212
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- i386-randconfig-h002-20200211
|   |-- drivers-gpio-gpio-dio-48e.c:error:assignment-from-incompatible-pointer-type
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- i386-randconfig-h002-20200212
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- i386-randconfig-h003-20200211
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- i386-randconfig-h003-20200212
|   |-- drivers-gpio-gpio-dio-48e.c:error:assignment-from-incompatible-pointer-type
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- ia64-allmodconfig
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- ia64-allyesconfig
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- ia64-defconfig
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- ia64-randconfig-a001-20200210
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- ia64-randconfig-a001-20200211
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- ia64-randconfig-a001-20200212
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- m68k-allmodconfig
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- m68k-allyesconfig
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- m68k-m5249evb_defconfig
|   |-- arch-m68k-coldfire-gpio.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- arch-m68k-coldfire-gpio.c:error:storage-size-of-mcfgpio_chip-isn-t-known
|   |-- arch-m68k-coldfire-gpio.c:error:struct-gpio_chip-has-no-member-named-base
|   |-- arch-m68k-coldfire-gpio.c:error:struct-gpio_chip-has-no-member-named-direction_input
|   |-- arch-m68k-coldfire-gpio.c:error:struct-gpio_chip-has-no-member-named-direction_output
|   |-- arch-m68k-coldfire-gpio.c:error:struct-gpio_chip-has-no-member-named-free
|   |-- arch-m68k-coldfire-gpio.c:error:struct-gpio_chip-has-no-member-named-get
|   |-- arch-m68k-coldfire-gpio.c:error:struct-gpio_chip-has-no-member-named-label
|   |-- arch-m68k-coldfire-gpio.c:error:struct-gpio_chip-has-no-member-named-ngpio
|   |-- arch-m68k-coldfire-gpio.c:error:struct-gpio_chip-has-no-member-named-request
|   |-- arch-m68k-coldfire-gpio.c:error:struct-gpio_chip-has-no-member-named-set
|   |-- arch-m68k-coldfire-gpio.c:error:struct-gpio_chip-has-no-member-named-to_irq
|   |-- arch-m68k-coldfire-gpio.c:error:variable-mcfgpio_chip-has-initializer-but-incomplete-type
|   |-- arch-m68k-coldfire-gpio.c:note:in-expansion-of-macro-MCFGPIO_PIN_MAX
|   |-- arch-m68k-coldfire-gpio.c:warning:excess-elements-in-struct-initializer
|   |-- arch-m68k-include-asm-m525xsim.h:warning:excess-elements-in-struct-initializer
|   |-- drivers-gpio-gpiolib-devprop.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpiolib.c:error:conflicting-types-for-gpiod_to_chip
|   |-- drivers-gpio-gpiolib.c:error:dereferencing-pointer-to-incomplete-type-const-struct-gpio_chip
|   |-- drivers-gpio-gpiolib.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpiolib.c:error:implicit-declaration-of-function-gpiochip_add_data-did-you-mean-gpiochip_get_data
|   |-- drivers-gpio-gpiolib.c:error:implicit-declaration-of-function-gpiochip_remove_pin_ranges-did-you-mean-gpiochip_add_pin_ranges
|   |-- drivers-gpio-gpiolib.c:warning:control-reaches-end-of-non-void-function
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip-did-you-mean-gpio_to_chip
|   |-- include-asm-generic-gpio.h:warning:return-makes-pointer-from-integer-without-a-cast
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- m68k-m5307c3_defconfig
|   |-- arch-m68k-coldfire-gpio.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- arch-m68k-coldfire-gpio.c:error:storage-size-of-mcfgpio_chip-isn-t-known
|   |-- arch-m68k-coldfire-gpio.c:error:struct-gpio_chip-has-no-member-named-base
|   |-- arch-m68k-coldfire-gpio.c:error:struct-gpio_chip-has-no-member-named-direction_input
|   |-- arch-m68k-coldfire-gpio.c:error:struct-gpio_chip-has-no-member-named-direction_output
|   |-- arch-m68k-coldfire-gpio.c:error:struct-gpio_chip-has-no-member-named-free
|   |-- arch-m68k-coldfire-gpio.c:error:struct-gpio_chip-has-no-member-named-get
|   |-- arch-m68k-coldfire-gpio.c:error:struct-gpio_chip-has-no-member-named-label
|   |-- arch-m68k-coldfire-gpio.c:error:struct-gpio_chip-has-no-member-named-ngpio
|   |-- arch-m68k-coldfire-gpio.c:error:struct-gpio_chip-has-no-member-named-request
|   |-- arch-m68k-coldfire-gpio.c:error:struct-gpio_chip-has-no-member-named-set
|   |-- arch-m68k-coldfire-gpio.c:error:struct-gpio_chip-has-no-member-named-to_irq
|   |-- arch-m68k-coldfire-gpio.c:error:variable-mcfgpio_chip-has-initializer-but-incomplete-type
|   |-- arch-m68k-coldfire-gpio.c:note:in-expansion-of-macro-MCFGPIO_PIN_MAX
|   |-- arch-m68k-coldfire-gpio.c:warning:excess-elements-in-struct-initializer
|   |-- arch-m68k-include-asm-m5307sim.h:warning:excess-elements-in-struct-initializer
|   |-- drivers-gpio-gpiolib-devprop.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpiolib.c:error:conflicting-types-for-gpiod_to_chip
|   |-- drivers-gpio-gpiolib.c:error:dereferencing-pointer-to-incomplete-type-const-struct-gpio_chip
|   |-- drivers-gpio-gpiolib.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpiolib.c:error:implicit-declaration-of-function-gpiochip_add_data-did-you-mean-gpiochip_get_data
|   |-- drivers-gpio-gpiolib.c:error:implicit-declaration-of-function-gpiochip_remove_pin_ranges-did-you-mean-gpiochip_add_pin_ranges
|   |-- drivers-gpio-gpiolib.c:warning:control-reaches-end-of-non-void-function
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip-did-you-mean-gpio_to_chip
|   |-- include-asm-generic-gpio.h:warning:return-makes-pointer-from-integer-without-a-cast
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- m68k-m5475evb_defconfig
|   |-- arch-m68k-coldfire-gpio.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- arch-m68k-coldfire-gpio.c:error:storage-size-of-mcfgpio_chip-isn-t-known
|   |-- arch-m68k-coldfire-gpio.c:error:struct-gpio_chip-has-no-member-named-base
|   |-- arch-m68k-coldfire-gpio.c:error:struct-gpio_chip-has-no-member-named-direction_input
|   |-- arch-m68k-coldfire-gpio.c:error:struct-gpio_chip-has-no-member-named-direction_output
|   |-- arch-m68k-coldfire-gpio.c:error:struct-gpio_chip-has-no-member-named-free
|   |-- arch-m68k-coldfire-gpio.c:error:struct-gpio_chip-has-no-member-named-get
|   |-- arch-m68k-coldfire-gpio.c:error:struct-gpio_chip-has-no-member-named-label
|   |-- arch-m68k-coldfire-gpio.c:error:struct-gpio_chip-has-no-member-named-ngpio
|   |-- arch-m68k-coldfire-gpio.c:error:struct-gpio_chip-has-no-member-named-request
|   |-- arch-m68k-coldfire-gpio.c:error:struct-gpio_chip-has-no-member-named-set
|   |-- arch-m68k-coldfire-gpio.c:error:struct-gpio_chip-has-no-member-named-to_irq
|   |-- arch-m68k-coldfire-gpio.c:error:variable-mcfgpio_chip-has-initializer-but-incomplete-type
|   |-- arch-m68k-coldfire-gpio.c:note:in-expansion-of-macro-MCFGPIO_PIN_MAX
|   |-- arch-m68k-coldfire-gpio.c:warning:excess-elements-in-struct-initializer
|   |-- arch-m68k-include-asm-m54xxsim.h:warning:excess-elements-in-struct-initializer
|   |-- drivers-gpio-gpiolib-devprop.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpiolib.c:error:conflicting-types-for-gpiod_to_chip
|   |-- drivers-gpio-gpiolib.c:error:dereferencing-pointer-to-incomplete-type-const-struct-gpio_chip
|   |-- drivers-gpio-gpiolib.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpiolib.c:error:implicit-declaration-of-function-gpiochip_add_data-did-you-mean-gpiochip_get_data
|   |-- drivers-gpio-gpiolib.c:error:implicit-declaration-of-function-gpiochip_remove_pin_ranges-did-you-mean-gpiochip_add_pin_ranges
|   |-- drivers-gpio-gpiolib.c:warning:control-reaches-end-of-non-void-function
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip-did-you-mean-gpio_to_chip
|   |-- include-asm-generic-gpio.h:warning:return-makes-pointer-from-integer-without-a-cast
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- m68k-multi_defconfig
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- m68k-randconfig-a001-20200212
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- m68k-stmark2_defconfig
|   |-- arch-m68k-coldfire-gpio.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- arch-m68k-coldfire-gpio.c:error:storage-size-of-mcfgpio_chip-isn-t-known
|   |-- arch-m68k-coldfire-gpio.c:error:struct-gpio_chip-has-no-member-named-base
|   |-- arch-m68k-coldfire-gpio.c:error:struct-gpio_chip-has-no-member-named-direction_input
|   |-- arch-m68k-coldfire-gpio.c:error:struct-gpio_chip-has-no-member-named-direction_output
|   |-- arch-m68k-coldfire-gpio.c:error:struct-gpio_chip-has-no-member-named-free
|   |-- arch-m68k-coldfire-gpio.c:error:struct-gpio_chip-has-no-member-named-get
|   |-- arch-m68k-coldfire-gpio.c:error:struct-gpio_chip-has-no-member-named-label
|   |-- arch-m68k-coldfire-gpio.c:error:struct-gpio_chip-has-no-member-named-ngpio
|   |-- arch-m68k-coldfire-gpio.c:error:struct-gpio_chip-has-no-member-named-request
|   |-- arch-m68k-coldfire-gpio.c:error:struct-gpio_chip-has-no-member-named-set
|   |-- arch-m68k-coldfire-gpio.c:error:struct-gpio_chip-has-no-member-named-to_irq
|   |-- arch-m68k-coldfire-gpio.c:error:variable-mcfgpio_chip-has-initializer-but-incomplete-type
|   |-- arch-m68k-coldfire-gpio.c:note:in-expansion-of-macro-MCFGPIO_PIN_MAX
|   |-- arch-m68k-coldfire-gpio.c:warning:excess-elements-in-struct-initializer
|   |-- arch-m68k-include-asm-m5441xsim.h:warning:excess-elements-in-struct-initializer
|   |-- drivers-gpio-gpio-mmio.c:error:BGPIOF_BIG_ENDIAN-undeclared-(first-use-in-this-function)-did-you-mean-__BIG_ENDIAN
|   |-- drivers-gpio-gpio-mmio.c:error:BGPIOF_BIG_ENDIAN-undeclared-here-(not-in-a-function)-did-you-mean-__BIG_ENDIAN
|   |-- drivers-gpio-gpio-mmio.c:error:BGPIOF_BIG_ENDIAN_BYTE_ORDER-undeclared-(first-use-in-this-function)-did-you-mean-BGPIOF_BIG_ENDIAN
|   |-- drivers-gpio-gpio-mmio.c:error:BGPIOF_NO_OUTPUT-undeclared-(first-use-in-this-function)
|   |-- drivers-gpio-gpio-mmio.c:error:BGPIOF_READ_OUTPUT_REG_SET-undeclared-(first-use-in-this-function)-did-you-mean-BGPIOF_UNREADABLE_REG_SET
|   |-- drivers-gpio-gpio-mmio.c:error:BGPIOF_UNREADABLE_REG_DIR-undeclared-(first-use-in-this-function)-did-you-mean-BGPIOF_UNREADABLE_REG_SET
|   |-- drivers-gpio-gpio-mmio.c:error:BGPIOF_UNREADABLE_REG_SET-undeclared-(first-use-in-this-function)
|   |-- drivers-gpio-gpio-mmio.c:error:dereferencing-pointer-to-incomplete-type-struct-bgpio_pdata
|   |-- drivers-gpio-gpio-mmio.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpio-mmio.c:error:implicit-declaration-of-function-devm_gpiochip_add_data-did-you-mean-irq_get_chip_data
|   |-- drivers-gpio-gpiolib-devprop.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpiolib-sysfs.c:error:dereferencing-pointer-to-incomplete-type-const-struct-gpio_chip
|   |-- drivers-gpio-gpiolib-sysfs.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpiolib-sysfs.c:error:implicit-declaration-of-function-gpiochip_lock_as_irq-did-you-mean-spin_lock_irq
|   |-- drivers-gpio-gpiolib-sysfs.c:error:implicit-declaration-of-function-gpiochip_unlock_as_irq-did-you-mean-spin_unlock_irq
|   |-- drivers-gpio-gpiolib.c:error:conflicting-types-for-gpiod_to_chip
|   |-- drivers-gpio-gpiolib.c:error:dereferencing-pointer-to-incomplete-type-const-struct-gpio_chip
|   |-- drivers-gpio-gpiolib.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpiolib.c:error:implicit-declaration-of-function-gpiochip_add_data-did-you-mean-gpiochip_get_data
|   |-- drivers-gpio-gpiolib.c:error:implicit-declaration-of-function-gpiochip_remove_pin_ranges-did-you-mean-gpiochip_add_pin_ranges
|   |-- drivers-gpio-gpiolib.c:warning:control-reaches-end-of-non-void-function
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip-did-you-mean-gpio_to_chip
|   |-- include-asm-generic-gpio.h:warning:return-makes-pointer-from-integer-without-a-cast
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- microblaze-mmu_defconfig
|   |-- drivers-gpio-gpio-xilinx.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpio-xilinx.c:error:field-gc-has-incomplete-type
|   |-- drivers-gpio-gpio-xilinx.c:error:implicit-declaration-of-function-devm_gpiochip_add_data-did-you-mean-irq_get_chip_data
|   |-- drivers-gpio-gpio-xilinx.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-gpio-gpio-xilinx.c:warning:initialization-makes-pointer-from-integer-without-a-cast
|   |-- drivers-gpio-gpiolib-devprop.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpiolib-of.c:error:dereferencing-pointer-to-incomplete-type-const-struct-gpio_chip
|   |-- drivers-gpio-gpiolib-of.c:error:implicit-declaration-of-function-devprop_gpiochip_set_names-did-you-mean-of_gpiochip_scan_gpios
|   |-- drivers-gpio-gpiolib-of.c:error:implicit-declaration-of-function-gpiochip_add_data-did-you-mean-gpiochip_get_desc
|   |-- drivers-gpio-gpiolib-of.c:error:implicit-declaration-of-function-gpiochip_find-did-you-mean-of_gpiochip_add
|   |-- drivers-gpio-gpiolib-of.c:error:implicit-declaration-of-function-gpiochip_remove-did-you-mean-of_gpiochip_remove
|   |-- drivers-gpio-gpiolib-of.c:note:in-expansion-of-macro-of_fwnode_handle
|   |-- drivers-gpio-gpiolib-of.c:warning:control-reaches-end-of-non-void-function
|   |-- drivers-gpio-gpiolib-of.c:warning:return-makes-pointer-from-integer-without-a-cast
|   |-- drivers-gpio-gpiolib-sysfs.c:error:dereferencing-pointer-to-incomplete-type-const-struct-gpio_chip
|   |-- drivers-gpio-gpiolib-sysfs.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpiolib-sysfs.c:error:implicit-declaration-of-function-gpiochip_lock_as_irq-did-you-mean-spin_lock_irq
|   |-- drivers-gpio-gpiolib-sysfs.c:error:implicit-declaration-of-function-gpiochip_unlock_as_irq-did-you-mean-spin_unlock_irq
|   |-- drivers-gpio-gpiolib.c:error:conflicting-types-for-gpiod_to_chip
|   |-- drivers-gpio-gpiolib.c:error:dereferencing-pointer-to-incomplete-type-const-struct-gpio_chip
|   |-- drivers-gpio-gpiolib.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpiolib.c:error:implicit-declaration-of-function-gpiochip_add_data-did-you-mean-gpiochip_get_data
|   |-- drivers-gpio-gpiolib.c:error:implicit-declaration-of-function-gpiochip_remove_pin_ranges-did-you-mean-gpiochip_add_pin_ranges
|   |-- drivers-gpio-gpiolib.c:warning:control-reaches-end-of-non-void-function
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip-did-you-mean-gpio_to_chip
|   |-- include-asm-generic-gpio.h:warning:return-makes-pointer-from-integer-without-a-cast
|   |-- include-linux-gpio-driver.h:error:unterminated-ifndef
|   |-- include-linux-kernel.h:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- include-linux-of.h:error:invalid-type-argument-of-(have-int-)
|   |-- include-linux-of_gpio.h:error:field-gc-has-incomplete-type
|   `-- include-linux-of_gpio.h:note:in-expansion-of-macro-container_of
|-- microblaze-nommu_defconfig
|   |-- drivers-gpio-gpio-xilinx.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpio-xilinx.c:error:field-gc-has-incomplete-type
|   |-- drivers-gpio-gpio-xilinx.c:error:implicit-declaration-of-function-devm_gpiochip_add_data-did-you-mean-irq_get_chip_data
|   |-- drivers-gpio-gpio-xilinx.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-gpio-gpio-xilinx.c:warning:initialization-makes-pointer-from-integer-without-a-cast
|   |-- drivers-gpio-gpiolib-devprop.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpiolib-of.c:error:dereferencing-pointer-to-incomplete-type-const-struct-gpio_chip
|   |-- drivers-gpio-gpiolib-of.c:error:implicit-declaration-of-function-devprop_gpiochip_set_names-did-you-mean-of_gpiochip_scan_gpios
|   |-- drivers-gpio-gpiolib-of.c:error:implicit-declaration-of-function-gpiochip_add_data-did-you-mean-gpiochip_get_desc
|   |-- drivers-gpio-gpiolib-of.c:error:implicit-declaration-of-function-gpiochip_find-did-you-mean-of_gpiochip_add
|   |-- drivers-gpio-gpiolib-of.c:error:implicit-declaration-of-function-gpiochip_remove-did-you-mean-of_gpiochip_remove
|   |-- drivers-gpio-gpiolib-of.c:note:in-expansion-of-macro-of_fwnode_handle
|   |-- drivers-gpio-gpiolib-of.c:warning:control-reaches-end-of-non-void-function
|   |-- drivers-gpio-gpiolib-of.c:warning:return-makes-pointer-from-integer-without-a-cast
|   |-- drivers-gpio-gpiolib-sysfs.c:error:dereferencing-pointer-to-incomplete-type-const-struct-gpio_chip
|   |-- drivers-gpio-gpiolib-sysfs.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpiolib-sysfs.c:error:implicit-declaration-of-function-gpiochip_lock_as_irq-did-you-mean-spin_lock_irq
|   |-- drivers-gpio-gpiolib-sysfs.c:error:implicit-declaration-of-function-gpiochip_unlock_as_irq-did-you-mean-spin_unlock_irq
|   |-- drivers-gpio-gpiolib.c:error:conflicting-types-for-gpiod_to_chip
|   |-- drivers-gpio-gpiolib.c:error:dereferencing-pointer-to-incomplete-type-const-struct-gpio_chip
|   |-- drivers-gpio-gpiolib.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpiolib.c:error:implicit-declaration-of-function-gpiochip_add_data-did-you-mean-gpiochip_get_data
|   |-- drivers-gpio-gpiolib.c:error:implicit-declaration-of-function-gpiochip_remove_pin_ranges-did-you-mean-gpiochip_add_pin_ranges
|   |-- drivers-gpio-gpiolib.c:warning:control-reaches-end-of-non-void-function
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip-did-you-mean-gpio_to_chip
|   |-- include-asm-generic-gpio.h:warning:return-makes-pointer-from-integer-without-a-cast
|   |-- include-linux-gpio-driver.h:error:unterminated-ifndef
|   |-- include-linux-kernel.h:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- include-linux-of.h:error:invalid-type-argument-of-(have-int-)
|   |-- include-linux-of_gpio.h:error:field-gc-has-incomplete-type
|   `-- include-linux-of_gpio.h:note:in-expansion-of-macro-container_of
|-- microblaze-randconfig-a001-20200211
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- mips-32r2_defconfig
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- mips-64r6el_defconfig
|   |-- drivers-gpio-gpio-pch.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpio-pch.c:error:field-gpio-has-incomplete-type
|   |-- drivers-gpio-gpio-pch.c:error:implicit-declaration-of-function-devm_gpiochip_add_data
|   |-- drivers-gpio-gpio-pch.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-gpio-gpio-pch.c:warning:initialization-makes-pointer-from-integer-without-a-cast
|   |-- drivers-gpio-gpiolib-devprop.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpiolib-of.c:error:dereferencing-pointer-to-incomplete-type-const-struct-gpio_chip
|   |-- drivers-gpio-gpiolib-of.c:error:implicit-declaration-of-function-devprop_gpiochip_set_names
|   |-- drivers-gpio-gpiolib-of.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-gpio-gpiolib-of.c:error:implicit-declaration-of-function-gpiochip_find
|   |-- drivers-gpio-gpiolib-of.c:error:implicit-declaration-of-function-gpiochip_remove
|   |-- drivers-gpio-gpiolib-of.c:note:in-expansion-of-macro-of_fwnode_handle
|   |-- drivers-gpio-gpiolib-of.c:warning:control-reaches-end-of-non-void-function
|   |-- drivers-gpio-gpiolib-of.c:warning:return-makes-pointer-from-integer-without-a-cast
|   |-- drivers-gpio-gpiolib-sysfs.c:error:dereferencing-pointer-to-incomplete-type-const-struct-gpio_chip
|   |-- drivers-gpio-gpiolib-sysfs.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpiolib-sysfs.c:error:implicit-declaration-of-function-gpiochip_lock_as_irq
|   |-- drivers-gpio-gpiolib-sysfs.c:error:implicit-declaration-of-function-gpiochip_unlock_as_irq
|   |-- drivers-gpio-gpiolib.c:error:conflicting-types-for-gpiod_to_chip
|   |-- drivers-gpio-gpiolib.c:error:dereferencing-pointer-to-incomplete-type-const-struct-gpio_chip
|   |-- drivers-gpio-gpiolib.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpiolib.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-gpio-gpiolib.c:error:implicit-declaration-of-function-gpiochip_remove_pin_ranges
|   |-- drivers-gpio-gpiolib.c:warning:control-reaches-end-of-non-void-function
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip
|   |-- include-asm-generic-gpio.h:warning:return-makes-pointer-from-integer-without-a-cast
|   |-- include-linux-gpio-driver.h:error:unterminated-ifndef
|   |-- include-linux-kernel.h:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- include-linux-of.h:error:invalid-type-argument-of-(have-int-)
|   |-- include-linux-of_gpio.h:error:field-gc-has-incomplete-type
|   `-- include-linux-of_gpio.h:note:in-expansion-of-macro-container_of
|-- mips-allmodconfig
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- mips-allyesconfig
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- mips-fuloong2e_defconfig
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- mips-ip22_defconfig
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- mips-malta_kvm_defconfig
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- mips-nlm_xlp_defconfig
|   |-- drivers-gpio-gpiolib-devprop.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpiolib-of.c:error:dereferencing-pointer-to-incomplete-type-const-struct-gpio_chip
|   |-- drivers-gpio-gpiolib-of.c:error:implicit-declaration-of-function-devprop_gpiochip_set_names-did-you-mean-of_gpiochip_scan_gpios
|   |-- drivers-gpio-gpiolib-of.c:error:implicit-declaration-of-function-gpiochip_add_data-did-you-mean-gpiochip_get_desc
|   |-- drivers-gpio-gpiolib-of.c:error:implicit-declaration-of-function-gpiochip_find-did-you-mean-of_gpiochip_add
|   |-- drivers-gpio-gpiolib-of.c:error:implicit-declaration-of-function-gpiochip_remove-did-you-mean-of_gpiochip_remove
|   |-- drivers-gpio-gpiolib-of.c:note:in-expansion-of-macro-of_fwnode_handle
|   |-- drivers-gpio-gpiolib-of.c:warning:control-reaches-end-of-non-void-function
|   |-- drivers-gpio-gpiolib-of.c:warning:return-makes-pointer-from-integer-without-a-cast
|   |-- drivers-gpio-gpiolib.c:error:conflicting-types-for-gpiod_to_chip
|   |-- drivers-gpio-gpiolib.c:error:dereferencing-pointer-to-incomplete-type-const-struct-gpio_chip
|   |-- drivers-gpio-gpiolib.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpiolib.c:error:implicit-declaration-of-function-gpiochip_add_data-did-you-mean-gpiochip_get_data
|   |-- drivers-gpio-gpiolib.c:error:implicit-declaration-of-function-gpiochip_remove_pin_ranges-did-you-mean-gpiochip_add_pin_ranges
|   |-- drivers-gpio-gpiolib.c:warning:control-reaches-end-of-non-void-function
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip-did-you-mean-gpio_to_chip
|   |-- include-asm-generic-gpio.h:warning:return-makes-pointer-from-integer-without-a-cast
|   |-- include-linux-gpio-driver.h:error:unterminated-ifndef
|   |-- include-linux-kernel.h:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- include-linux-of.h:error:invalid-type-argument-of-(have-int-)
|   |-- include-linux-of_gpio.h:error:field-gc-has-incomplete-type
|   `-- include-linux-of_gpio.h:note:in-expansion-of-macro-container_of
|-- mips-randconfig-a001-20200212
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- mips-rt305x_defconfig
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- mips-workpad_defconfig
|   |-- drivers-gpio-gpio-vr41xx.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpio-vr41xx.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-gpio-gpio-vr41xx.c:error:implicit-declaration-of-function-gpiochip_lock_as_irq
|   |-- drivers-gpio-gpio-vr41xx.c:error:implicit-declaration-of-function-gpiochip_unlock_as_irq
|   |-- drivers-gpio-gpio-vr41xx.c:error:invalid-use-of-undefined-type-struct-gpio_chip
|   |-- drivers-gpio-gpio-vr41xx.c:error:unknown-field-direction_input-specified-in-initializer
|   |-- drivers-gpio-gpio-vr41xx.c:error:unknown-field-direction_output-specified-in-initializer
|   |-- drivers-gpio-gpio-vr41xx.c:error:unknown-field-get-specified-in-initializer
|   |-- drivers-gpio-gpio-vr41xx.c:error:unknown-field-label-specified-in-initializer
|   |-- drivers-gpio-gpio-vr41xx.c:error:unknown-field-owner-specified-in-initializer
|   |-- drivers-gpio-gpio-vr41xx.c:error:unknown-field-set-specified-in-initializer
|   |-- drivers-gpio-gpio-vr41xx.c:error:unknown-field-to_irq-specified-in-initializer
|   |-- drivers-gpio-gpio-vr41xx.c:error:variable-vr41xx_gpio_chip-has-initializer-but-incomplete-type
|   |-- drivers-gpio-gpio-vr41xx.c:note:in-expansion-of-macro-THIS_MODULE
|   |-- drivers-gpio-gpio-vr41xx.c:warning:excess-elements-in-struct-initializer
|   |-- drivers-gpio-gpiolib-devprop.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpiolib.c:error:conflicting-types-for-gpiod_to_chip
|   |-- drivers-gpio-gpiolib.c:error:dereferencing-pointer-to-incomplete-type-const-struct-gpio_chip
|   |-- drivers-gpio-gpiolib.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpiolib.c:warning:control-reaches-end-of-non-void-function
|   |-- include-asm-generic-gpio.h:warning:return-makes-pointer-from-integer-without-a-cast
|   |-- include-linux-export.h:warning:excess-elements-in-struct-initializer
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- nds32-allmodconfig
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- nds32-allyesconfig
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- nds32-randconfig-a001-20200212
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- nios2-10m50_defconfig
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- nios2-3c120_defconfig
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- nios2-allyesconfig
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- nios2-randconfig-a001-20200211
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- openrisc-alldefconfig
|   |-- drivers-gpio-gpiolib-devprop.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpiolib-of.c:error:dereferencing-pointer-to-incomplete-type-const-struct-gpio_chip
|   |-- drivers-gpio-gpiolib-of.c:error:implicit-declaration-of-function-devprop_gpiochip_set_names
|   |-- drivers-gpio-gpiolib-of.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-gpio-gpiolib-of.c:error:implicit-declaration-of-function-gpiochip_find
|   |-- drivers-gpio-gpiolib-of.c:error:implicit-declaration-of-function-gpiochip_remove-did-you-mean-of_gpiochip_remove
|   |-- drivers-gpio-gpiolib-of.c:note:in-expansion-of-macro-of_fwnode_handle
|   |-- drivers-gpio-gpiolib-of.c:warning:control-reaches-end-of-non-void-function
|   |-- drivers-gpio-gpiolib-of.c:warning:returning-int-from-a-function-with-return-type-struct-gpio_chip-makes-pointer-from-integer-without-a-cast
|   |-- drivers-gpio-gpiolib.c:error:conflicting-types-for-gpiod_to_chip
|   |-- drivers-gpio-gpiolib.c:error:dereferencing-pointer-to-incomplete-type-const-struct-gpio_chip
|   |-- drivers-gpio-gpiolib.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpiolib.c:error:implicit-declaration-of-function-gpiochip_add_data-did-you-mean-gpiochip_get_data
|   |-- drivers-gpio-gpiolib.c:error:implicit-declaration-of-function-gpiochip_remove_pin_ranges-did-you-mean-gpiochip_add_pin_ranges
|   |-- drivers-gpio-gpiolib.c:warning:control-reaches-end-of-non-void-function
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip-did-you-mean-gpio_to_chip
|   |-- include-asm-generic-gpio.h:warning:returning-int-from-a-function-with-return-type-struct-gpio_chip-makes-pointer-from-integer-without-a-cast
|   |-- include-linux-gpio-driver.h:error:unterminated-ifndef
|   |-- include-linux-kernel.h:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- include-linux-of.h:error:invalid-type-argument-of-(have-int-)
|   |-- include-linux-of_gpio.h:error:field-gc-has-incomplete-type
|   `-- include-linux-of_gpio.h:note:in-expansion-of-macro-container_of
|-- openrisc-or1ksim_defconfig
|   |-- drivers-gpio-gpiolib-devprop.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpiolib-of.c:error:dereferencing-pointer-to-incomplete-type-const-struct-gpio_chip
|   |-- drivers-gpio-gpiolib-of.c:error:implicit-declaration-of-function-devprop_gpiochip_set_names
|   |-- drivers-gpio-gpiolib-of.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-gpio-gpiolib-of.c:error:implicit-declaration-of-function-gpiochip_find
|   |-- drivers-gpio-gpiolib-of.c:error:implicit-declaration-of-function-gpiochip_remove-did-you-mean-of_gpiochip_remove
|   |-- drivers-gpio-gpiolib-of.c:note:in-expansion-of-macro-of_fwnode_handle
|   |-- drivers-gpio-gpiolib-of.c:warning:control-reaches-end-of-non-void-function
|   |-- drivers-gpio-gpiolib-of.c:warning:returning-int-from-a-function-with-return-type-struct-gpio_chip-makes-pointer-from-integer-without-a-cast
|   |-- drivers-gpio-gpiolib.c:error:conflicting-types-for-gpiod_to_chip
|   |-- drivers-gpio-gpiolib.c:error:dereferencing-pointer-to-incomplete-type-const-struct-gpio_chip
|   |-- drivers-gpio-gpiolib.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpiolib.c:error:implicit-declaration-of-function-gpiochip_add_data-did-you-mean-gpiochip_get_data
|   |-- drivers-gpio-gpiolib.c:error:implicit-declaration-of-function-gpiochip_remove_pin_ranges-did-you-mean-gpiochip_add_pin_ranges
|   |-- drivers-gpio-gpiolib.c:warning:control-reaches-end-of-non-void-function
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip-did-you-mean-gpio_to_chip
|   |-- include-asm-generic-gpio.h:warning:returning-int-from-a-function-with-return-type-struct-gpio_chip-makes-pointer-from-integer-without-a-cast
|   |-- include-linux-gpio-driver.h:error:unterminated-ifndef
|   |-- include-linux-kernel.h:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- include-linux-of.h:error:invalid-type-argument-of-(have-int-)
|   |-- include-linux-of_gpio.h:error:field-gc-has-incomplete-type
|   `-- include-linux-of_gpio.h:note:in-expansion-of-macro-container_of
|-- openrisc-randconfig-a001-20200211
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- openrisc-randconfig-a001-20200212
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- openrisc-simple_smp_defconfig
|   |-- drivers-gpio-gpiolib-devprop.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpiolib-of.c:error:dereferencing-pointer-to-incomplete-type-const-struct-gpio_chip
|   |-- drivers-gpio-gpiolib-of.c:error:implicit-declaration-of-function-devprop_gpiochip_set_names
|   |-- drivers-gpio-gpiolib-of.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- drivers-gpio-gpiolib-of.c:error:implicit-declaration-of-function-gpiochip_find
|   |-- drivers-gpio-gpiolib-of.c:error:implicit-declaration-of-function-gpiochip_remove-did-you-mean-of_gpiochip_remove
|   |-- drivers-gpio-gpiolib-of.c:note:in-expansion-of-macro-of_fwnode_handle
|   |-- drivers-gpio-gpiolib-of.c:warning:control-reaches-end-of-non-void-function
|   |-- drivers-gpio-gpiolib-of.c:warning:returning-int-from-a-function-with-return-type-struct-gpio_chip-makes-pointer-from-integer-without-a-cast
|   |-- drivers-gpio-gpiolib.c:error:conflicting-types-for-gpiod_to_chip
|   |-- drivers-gpio-gpiolib.c:error:dereferencing-pointer-to-incomplete-type-const-struct-gpio_chip
|   |-- drivers-gpio-gpiolib.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpiolib.c:error:implicit-declaration-of-function-gpiochip_add_data-did-you-mean-gpiochip_get_data
|   |-- drivers-gpio-gpiolib.c:error:implicit-declaration-of-function-gpiochip_remove_pin_ranges-did-you-mean-gpiochip_add_pin_ranges
|   |-- drivers-gpio-gpiolib.c:warning:control-reaches-end-of-non-void-function
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip-did-you-mean-gpio_to_chip
|   |-- include-asm-generic-gpio.h:warning:returning-int-from-a-function-with-return-type-struct-gpio_chip-makes-pointer-from-integer-without-a-cast
|   |-- include-linux-gpio-driver.h:error:unterminated-ifndef
|   |-- include-linux-kernel.h:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- include-linux-of.h:error:invalid-type-argument-of-(have-int-)
|   |-- include-linux-of_gpio.h:error:field-gc-has-incomplete-type
|   `-- include-linux-of_gpio.h:note:in-expansion-of-macro-container_of
|-- parisc-allmodconfig
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- parisc-allyesconfig
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- parisc-randconfig-a001-20200212
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- powerpc-allyesconfig
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- powerpc-bluestone_defconfig
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- powerpc-defconfig
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- powerpc-kilauea_defconfig
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- powerpc-linkstation_defconfig
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- powerpc-obs600_defconfig
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- powerpc-ppc64_defconfig
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- powerpc-rhel-kconfig
|   |-- drivers-gpio-gpiolib-devprop.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpiolib-of.c:error:dereferencing-pointer-to-incomplete-type-const-struct-gpio_chip
|   |-- drivers-gpio-gpiolib-of.c:error:implicit-declaration-of-function-devprop_gpiochip_set_names-did-you-mean-of_gpiochip_scan_gpios
|   |-- drivers-gpio-gpiolib-of.c:error:implicit-declaration-of-function-gpiochip_add_data-did-you-mean-gpiochip_get_desc
|   |-- drivers-gpio-gpiolib-of.c:error:implicit-declaration-of-function-gpiochip_find-did-you-mean-of_gpiochip_add
|   |-- drivers-gpio-gpiolib-of.c:error:implicit-declaration-of-function-gpiochip_remove-did-you-mean-of_gpiochip_remove
|   |-- drivers-gpio-gpiolib-of.c:note:in-expansion-of-macro-of_fwnode_handle
|   |-- drivers-gpio-gpiolib-of.c:warning:control-reaches-end-of-non-void-function
|   |-- drivers-gpio-gpiolib-of.c:warning:return-makes-pointer-from-integer-without-a-cast
|   |-- drivers-gpio-gpiolib.c:error:conflicting-types-for-gpiod_to_chip
|   |-- drivers-gpio-gpiolib.c:error:dereferencing-pointer-to-incomplete-type-const-struct-gpio_chip
|   |-- drivers-gpio-gpiolib.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpiolib.c:error:implicit-declaration-of-function-gpiochip_add_data-did-you-mean-gpiochip_get_data
|   |-- drivers-gpio-gpiolib.c:error:implicit-declaration-of-function-gpiochip_remove_pin_ranges-did-you-mean-gpiochip_add_pin_ranges
|   |-- drivers-gpio-gpiolib.c:warning:control-reaches-end-of-non-void-function
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip-did-you-mean-gpio_to_chip
|   |-- include-asm-generic-gpio.h:warning:return-makes-pointer-from-integer-without-a-cast
|   |-- include-linux-gpio-driver.h:error:unterminated-ifndef
|   |-- include-linux-kernel.h:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- include-linux-of.h:error:invalid-type-argument-of-(have-int-)
|   |-- include-linux-of_gpio.h:error:field-gc-has-incomplete-type
|   `-- include-linux-of_gpio.h:note:in-expansion-of-macro-container_of
|-- powerpc-stx_gp3_defconfig
|   |-- arch-powerpc-sysdev-cpm_common.c:error:implicit-declaration-of-function-gpiochip_get_data-did-you-mean-gpio_get_value
|   |-- arch-powerpc-sysdev-cpm_common.c:error:initialization-makes-pointer-from-integer-without-a-cast
|   |-- drivers-gpio-gpiolib-devprop.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpiolib-of.c:error:dereferencing-pointer-to-incomplete-type-const-struct-gpio_chip
|   |-- drivers-gpio-gpiolib-of.c:error:implicit-declaration-of-function-devprop_gpiochip_set_names-did-you-mean-of_gpiochip_scan_gpios
|   |-- drivers-gpio-gpiolib-of.c:error:implicit-declaration-of-function-gpiochip_add_data-did-you-mean-gpiochip_get_desc
|   |-- drivers-gpio-gpiolib-of.c:error:implicit-declaration-of-function-gpiochip_find-did-you-mean-of_gpiochip_add
|   |-- drivers-gpio-gpiolib-of.c:error:implicit-declaration-of-function-gpiochip_remove-did-you-mean-of_gpiochip_remove
|   |-- drivers-gpio-gpiolib-of.c:note:in-expansion-of-macro-of_fwnode_handle
|   |-- drivers-gpio-gpiolib-of.c:warning:control-reaches-end-of-non-void-function
|   |-- drivers-gpio-gpiolib-of.c:warning:return-makes-pointer-from-integer-without-a-cast
|   |-- drivers-gpio-gpiolib.c:error:conflicting-types-for-gpiod_to_chip
|   |-- drivers-gpio-gpiolib.c:error:dereferencing-pointer-to-incomplete-type-const-struct-gpio_chip
|   |-- drivers-gpio-gpiolib.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpiolib.c:error:implicit-declaration-of-function-gpiochip_add_data-did-you-mean-gpiochip_get_data
|   |-- drivers-gpio-gpiolib.c:error:implicit-declaration-of-function-gpiochip_remove_pin_ranges-did-you-mean-gpiochip_add_pin_ranges
|   |-- drivers-gpio-gpiolib.c:warning:control-reaches-end-of-non-void-function
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip-did-you-mean-gpio_to_chip
|   |-- include-asm-generic-gpio.h:error:return-makes-pointer-from-integer-without-a-cast
|   |-- include-asm-generic-gpio.h:warning:return-makes-pointer-from-integer-without-a-cast
|   |-- include-linux-gpio-driver.h:error:unterminated-ifndef
|   |-- include-linux-kernel.h:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- include-linux-of.h:error:invalid-type-argument-of-(have-int-)
|   |-- include-linux-of_gpio.h:error:field-gc-has-incomplete-type
|   `-- include-linux-of_gpio.h:note:in-expansion-of-macro-container_of
|-- riscv-allmodconfig
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- riscv-allyesconfig
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- riscv-defconfig
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- riscv-randconfig-a001-20200212
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- riscv-rv32_defconfig
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- s390-allmodconfig
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- s390-allyesconfig
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- s390-randconfig-a001-20200211
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- sh-allmodconfig
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- sh-allyesconfig
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- sh-randconfig-a001-20200211
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- sh-rsk7203_defconfig
|   |-- drivers-gpio-gpiolib-devprop.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpiolib.c:error:conflicting-types-for-gpiod_to_chip
|   |-- drivers-gpio-gpiolib.c:error:dereferencing-pointer-to-incomplete-type-const-struct-gpio_chip
|   |-- drivers-gpio-gpiolib.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpiolib.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_pin_range
|   |-- drivers-gpio-gpiolib.c:error:implicit-declaration-of-function-gpiochip_add_data-did-you-mean-gpiochip_get_data
|   |-- drivers-gpio-gpiolib.c:error:implicit-declaration-of-function-gpiochip_remove_pin_ranges-did-you-mean-gpiochip_add_pin_ranges
|   |-- drivers-gpio-gpiolib.c:note:in-expansion-of-macro-list_for_each_entry_safe
|   |-- drivers-gpio-gpiolib.c:warning:conflicting-types-for-gpiochip_remove_pin_ranges
|   |-- drivers-gpio-gpiolib.c:warning:control-reaches-end-of-non-void-function
|   |-- drivers-pinctrl-core.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-pinctrl-sh-pfc-gpio.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-pinctrl-sh-pfc-gpio.c:error:field-gpio_chip-has-incomplete-type
|   |-- drivers-pinctrl-sh-pfc-gpio.c:error:implicit-declaration-of-function-devm_gpiochip_add_data-did-you-mean-irq_get_chip_data
|   |-- drivers-pinctrl-sh-pfc-gpio.c:error:implicit-declaration-of-function-gpiochip_add_pin_range-did-you-mean-pinctrl_add_gpio_range
|   |-- drivers-pinctrl-sh-pfc-gpio.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-pinctrl-sh-pfc-gpio.c:warning:initialization-makes-pointer-from-integer-without-a-cast
|   |-- drivers-pinctrl-sh-pfc-gpio.c:warning:passing-argument-of-gpio_pin_set_value-makes-pointer-from-integer-without-a-cast
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip-did-you-mean-gpio_to_chip
|   |-- include-asm-generic-gpio.h:warning:return-makes-pointer-from-integer-without-a-cast
|   |-- include-linux-gpio-driver.h:error:unterminated-ifndef
|   |-- include-linux-list.h:error:dereferencing-pointer-to-incomplete-type-struct-gpio_pin_range
|   |-- include-linux-list.h:note:in-expansion-of-macro-container_of
|   |-- include-linux-list.h:note:in-expansion-of-macro-list_entry
|   `-- include-linux-list.h:note:in-expansion-of-macro-list_first_entry
|-- sh-rsk7269_defconfig
|   |-- drivers-gpio-gpiolib-devprop.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpiolib.c:error:conflicting-types-for-gpiod_to_chip
|   |-- drivers-gpio-gpiolib.c:error:dereferencing-pointer-to-incomplete-type-const-struct-gpio_chip
|   |-- drivers-gpio-gpiolib.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpiolib.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_pin_range
|   |-- drivers-gpio-gpiolib.c:error:implicit-declaration-of-function-gpiochip_add_data-did-you-mean-gpiochip_get_data
|   |-- drivers-gpio-gpiolib.c:error:implicit-declaration-of-function-gpiochip_remove_pin_ranges-did-you-mean-gpiochip_add_pin_ranges
|   |-- drivers-gpio-gpiolib.c:note:in-expansion-of-macro-list_for_each_entry_safe
|   |-- drivers-gpio-gpiolib.c:warning:conflicting-types-for-gpiochip_remove_pin_ranges
|   |-- drivers-gpio-gpiolib.c:warning:control-reaches-end-of-non-void-function
|   |-- drivers-pinctrl-core.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-pinctrl-sh-pfc-gpio.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-pinctrl-sh-pfc-gpio.c:error:field-gpio_chip-has-incomplete-type
|   |-- drivers-pinctrl-sh-pfc-gpio.c:error:implicit-declaration-of-function-devm_gpiochip_add_data-did-you-mean-irq_get_chip_data
|   |-- drivers-pinctrl-sh-pfc-gpio.c:error:implicit-declaration-of-function-gpiochip_add_pin_range-did-you-mean-pinctrl_add_gpio_range
|   |-- drivers-pinctrl-sh-pfc-gpio.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- drivers-pinctrl-sh-pfc-gpio.c:warning:initialization-makes-pointer-from-integer-without-a-cast
|   |-- drivers-pinctrl-sh-pfc-gpio.c:warning:passing-argument-of-gpio_pin_set_value-makes-pointer-from-integer-without-a-cast
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip-did-you-mean-gpio_to_chip
|   |-- include-asm-generic-gpio.h:warning:return-makes-pointer-from-integer-without-a-cast
|   |-- include-linux-gpio-driver.h:error:unterminated-ifndef
|   |-- include-linux-list.h:error:dereferencing-pointer-to-incomplete-type-struct-gpio_pin_range
|   |-- include-linux-list.h:note:in-expansion-of-macro-container_of
|   |-- include-linux-list.h:note:in-expansion-of-macro-list_entry
|   `-- include-linux-list.h:note:in-expansion-of-macro-list_first_entry
|-- sh-se7712_defconfig
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- sparc-allmodconfig
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- sparc-allyesconfig
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- sparc-defconfig
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- sparc-randconfig-a001-20200210
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- sparc-randconfig-a001-20200211
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- sparc-randconfig-a001-20200212
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- sparc-sparc32_defconfig
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- sparc64-allmodconfig
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- sparc64-allyesconfig
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- sparc64-defconfig
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- sparc64-randconfig-a001-20200211
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- x86_64-allmodconfig
|   |-- drivers-gpio-gpio-dio-48e.c:error:assignment-from-incompatible-pointer-type
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- x86_64-allyesconfig
|   |-- drivers-gpio-gpio-dio-48e.c:error:assignment-from-incompatible-pointer-type
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- x86_64-defconfig
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- x86_64-fedora-25
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- x86_64-kexec
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- x86_64-lkp
|   |-- drivers-gpio-gpiolib-devprop.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpiolib.c:error:conflicting-types-for-gpiod_to_chip
|   |-- drivers-gpio-gpiolib.c:error:dereferencing-pointer-to-incomplete-type-const-struct-gpio_chip
|   |-- drivers-gpio-gpiolib.c:error:dereferencing-pointer-to-incomplete-type-struct-gpio_chip
|   |-- drivers-gpio-gpiolib.c:error:implicit-declaration-of-function-gpiochip_add_data-did-you-mean-gpiochip_get_data
|   |-- drivers-gpio-gpiolib.c:error:implicit-declaration-of-function-gpiochip_remove_pin_ranges-did-you-mean-gpiochip_add_pin_ranges
|   |-- drivers-gpio-gpiolib.c:warning:control-reaches-end-of-non-void-function
|   |-- include-asm-generic-gpio.h:error:implicit-declaration-of-function-gpiod_to_chip-did-you-mean-gpio_to_chip
|   |-- include-asm-generic-gpio.h:warning:return-makes-pointer-from-integer-without-a-cast
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- x86_64-randconfig-b001-20200212
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- x86_64-randconfig-b002-20200212
|   |-- drivers-gpio-gpio-dio-48e.c:error:assignment-from-incompatible-pointer-type
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- x86_64-randconfig-b003-20200212
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- x86_64-randconfig-c001-20200211
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- x86_64-randconfig-c001-20200212
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- x86_64-randconfig-c002-20200211
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- x86_64-randconfig-c002-20200212
|   |-- drivers-gpio-gpio-dio-48e.c:error:assignment-from-incompatible-pointer-type
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- x86_64-randconfig-c003-20200211
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- x86_64-randconfig-c003-20200212
|   |-- drivers-gpio-gpio-dio-48e.c:error:assignment-from-incompatible-pointer-type
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- x86_64-randconfig-d001-20200211
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- x86_64-randconfig-d001-20200212
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- x86_64-randconfig-d002-20200211
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- x86_64-randconfig-d002-20200212
|   |-- drivers-gpio-gpio-dio-48e.c:error:assignment-from-incompatible-pointer-type
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- x86_64-randconfig-d003-20200211
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- x86_64-randconfig-d003-20200212
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- x86_64-randconfig-e001-20200211
|   |-- drivers-gpio-gpio-dio-48e.c:error:assignment-from-incompatible-pointer-type
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- x86_64-randconfig-e001-20200212
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- x86_64-randconfig-e002-20200211
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- x86_64-randconfig-e002-20200212
|   |-- drivers-gpio-gpio-dio-48e.c:error:assignment-from-incompatible-pointer-type
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- x86_64-randconfig-e003-20200211
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- x86_64-randconfig-e003-20200212
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- x86_64-randconfig-f001-20200212
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- x86_64-randconfig-f002-20200212
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- x86_64-randconfig-f003-20200212
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- x86_64-randconfig-g001-20200212
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- x86_64-randconfig-g002-20200212
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- x86_64-randconfig-g003-20200212
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- x86_64-randconfig-h001-20200211
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- x86_64-randconfig-h001-20200212
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- x86_64-randconfig-h002-20200211
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- x86_64-randconfig-h002-20200212
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- x86_64-randconfig-h003-20200211
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- x86_64-randconfig-h003-20200212
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- x86_64-randconfig-s0-20200211
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- x86_64-randconfig-s0-20200212
|   |-- drivers-gpio-gpio-dio-48e.c:error:assignment-from-incompatible-pointer-type
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- x86_64-randconfig-s1-20200211
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- x86_64-randconfig-s1-20200212
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- x86_64-randconfig-s2-20200211
|   |-- drivers-gpio-gpio-dio-48e.c:error:assignment-from-incompatible-pointer-type
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- x86_64-randconfig-s2-20200212
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- x86_64-rhel
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- x86_64-rhel-7.2-clear
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- x86_64-rhel-7.6
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- xtensa-allmodconfig
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
|-- xtensa-allyesconfig
|   `-- include-linux-gpio-driver.h:error:unterminated-ifndef
`-- xtensa-randconfig-a001-20200211
    `-- include-linux-gpio-driver.h:error:unterminated-ifndef

elapsed time: 2891m

configs tested: 217
configs skipped: 0

arm                              allmodconfig
arm                               allnoconfig
arm                              allyesconfig
arm                         at91_dt_defconfig
arm                           efm32_defconfig
arm                          exynos_defconfig
arm                        multi_v5_defconfig
arm                        multi_v7_defconfig
arm                        shmobile_defconfig
arm                           sunxi_defconfig
arm64                            allmodconfig
arm64                             allnoconfig
arm64                            allyesconfig
arm64                               defconfig
sparc                            allyesconfig
riscv                    nommu_virt_defconfig
sparc                               defconfig
nds32                             allnoconfig
riscv                          rv32_defconfig
s390                             allyesconfig
riscv                               defconfig
powerpc                             defconfig
i386                              allnoconfig
ia64                                defconfig
um                             i386_defconfig
um                           x86_64_defconfig
i386                             alldefconfig
m68k                          multi_defconfig
um                                  defconfig
alpha                               defconfig
microblaze                    nommu_defconfig
mips                      malta_kvm_defconfig
m68k                           sun3_defconfig
xtensa                       common_defconfig
i386                             allyesconfig
i386                                defconfig
ia64                             alldefconfig
ia64                             allmodconfig
ia64                              allnoconfig
ia64                             allyesconfig
c6x                              allyesconfig
c6x                        evmc6678_defconfig
nios2                         10m50_defconfig
nios2                         3c120_defconfig
openrisc                    or1ksim_defconfig
openrisc                 simple_smp_defconfig
xtensa                          iss_defconfig
csky                                defconfig
nds32                               defconfig
h8300                     edosk2674_defconfig
h8300                    h8300h-sim_defconfig
h8300                       h8s-sim_defconfig
m68k                             allmodconfig
m68k                       m5475evb_defconfig
arc                              allyesconfig
arc                                 defconfig
microblaze                      mmu_defconfig
powerpc                           allnoconfig
powerpc                       ppc64_defconfig
powerpc                          rhel-kconfig
mips                           32r2_defconfig
mips                         64r6el_defconfig
mips                             allmodconfig
mips                              allnoconfig
mips                             allyesconfig
mips                      fuloong2e_defconfig
parisc                         b180_defconfig
parisc                            allnoconfig
parisc                              defconfig
parisc                        c3000_defconfig
parisc                           allyesconfig
x86_64               randconfig-a001-20200212
x86_64               randconfig-a002-20200212
x86_64               randconfig-a003-20200212
i386                 randconfig-a001-20200212
i386                 randconfig-a002-20200212
i386                 randconfig-a003-20200212
alpha                randconfig-a001-20200212
m68k                 randconfig-a001-20200212
nds32                randconfig-a001-20200212
parisc               randconfig-a001-20200212
riscv                randconfig-a001-20200212
alpha                randconfig-a001-20200210
m68k                 randconfig-a001-20200210
mips                 randconfig-a001-20200210
nds32                randconfig-a001-20200210
parisc               randconfig-a001-20200210
riscv                randconfig-a001-20200210
c6x                  randconfig-a001-20200211
h8300                randconfig-a001-20200211
microblaze           randconfig-a001-20200211
nios2                randconfig-a001-20200211
sparc64              randconfig-a001-20200211
csky                 randconfig-a001-20200212
openrisc             randconfig-a001-20200212
s390                 randconfig-a001-20200212
sh                   randconfig-a001-20200212
xtensa               randconfig-a001-20200212
csky                 randconfig-a001-20200211
openrisc             randconfig-a001-20200211
s390                 randconfig-a001-20200211
sh                   randconfig-a001-20200211
xtensa               randconfig-a001-20200211
x86_64               randconfig-b001-20200212
x86_64               randconfig-b002-20200212
x86_64               randconfig-b003-20200212
i386                 randconfig-b001-20200212
i386                 randconfig-b002-20200212
i386                 randconfig-b003-20200212
x86_64               randconfig-c001-20200212
x86_64               randconfig-c002-20200212
x86_64               randconfig-c003-20200212
i386                 randconfig-c001-20200212
i386                 randconfig-c002-20200212
i386                 randconfig-c003-20200212
x86_64               randconfig-c001-20200211
x86_64               randconfig-c002-20200211
x86_64               randconfig-c003-20200211
i386                 randconfig-c001-20200211
i386                 randconfig-c002-20200211
i386                 randconfig-c003-20200211
x86_64               randconfig-c001-20200210
x86_64               randconfig-c002-20200210
x86_64               randconfig-c003-20200210
i386                 randconfig-c001-20200210
i386                 randconfig-c002-20200210
i386                 randconfig-c003-20200210
x86_64               randconfig-d001-20200212
x86_64               randconfig-d002-20200212
x86_64               randconfig-d003-20200212
i386                 randconfig-d001-20200212
i386                 randconfig-d002-20200212
i386                 randconfig-d003-20200212
x86_64               randconfig-d001-20200211
x86_64               randconfig-d002-20200211
x86_64               randconfig-d003-20200211
i386                 randconfig-d001-20200211
i386                 randconfig-d002-20200211
i386                 randconfig-d003-20200211
x86_64               randconfig-e001-20200212
x86_64               randconfig-e002-20200212
x86_64               randconfig-e003-20200212
i386                 randconfig-e001-20200212
i386                 randconfig-e002-20200212
i386                 randconfig-e003-20200212
x86_64               randconfig-e001-20200211
x86_64               randconfig-e002-20200211
x86_64               randconfig-e003-20200211
i386                 randconfig-e001-20200211
i386                 randconfig-e002-20200211
i386                 randconfig-e003-20200211
x86_64               randconfig-f001-20200212
x86_64               randconfig-f002-20200212
x86_64               randconfig-f003-20200212
i386                 randconfig-f001-20200212
i386                 randconfig-f002-20200212
i386                 randconfig-f003-20200212
x86_64               randconfig-g001-20200212
x86_64               randconfig-g002-20200212
x86_64               randconfig-g003-20200212
i386                 randconfig-g001-20200212
i386                 randconfig-g002-20200212
i386                 randconfig-g003-20200212
x86_64               randconfig-h001-20200212
x86_64               randconfig-h002-20200212
x86_64               randconfig-h003-20200212
i386                 randconfig-h001-20200212
i386                 randconfig-h002-20200212
i386                 randconfig-h003-20200212
x86_64               randconfig-h001-20200211
x86_64               randconfig-h002-20200211
x86_64               randconfig-h003-20200211
i386                 randconfig-h001-20200211
i386                 randconfig-h002-20200211
i386                 randconfig-h003-20200211
arc                  randconfig-a001-20200211
arm                  randconfig-a001-20200211
arm64                randconfig-a001-20200211
ia64                 randconfig-a001-20200211
powerpc              randconfig-a001-20200211
sparc                randconfig-a001-20200211
arc                  randconfig-a001-20200210
arm                  randconfig-a001-20200210
arm64                randconfig-a001-20200210
ia64                 randconfig-a001-20200210
powerpc              randconfig-a001-20200210
sparc                randconfig-a001-20200210
arc                  randconfig-a001-20200212
arm                  randconfig-a001-20200212
arm64                randconfig-a001-20200212
ia64                 randconfig-a001-20200212
powerpc              randconfig-a001-20200212
sparc                randconfig-a001-20200212
riscv                            allmodconfig
riscv                             allnoconfig
riscv                            allyesconfig
s390                             alldefconfig
s390                             allmodconfig
s390                              allnoconfig
s390                          debug_defconfig
s390                                defconfig
s390                       zfcpdump_defconfig
sh                               allmodconfig
sh                                allnoconfig
sh                          rsk7269_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                            titan_defconfig
sparc64                          allmodconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                             defconfig
x86_64                              fedora-25
x86_64                                  kexec
x86_64                                    lkp
x86_64                                   rhel
x86_64                         rhel-7.2-clear
x86_64                               rhel-7.6

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
