Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03D3415833C
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2020 20:05:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727079AbgBJTFR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 Feb 2020 14:05:17 -0500
Received: from mga12.intel.com ([192.55.52.136]:28853 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726831AbgBJTFQ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 10 Feb 2020 14:05:16 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 10 Feb 2020 11:05:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,425,1574150400"; 
   d="gz'50?scan'50,208,50";a="265966203"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 10 Feb 2020 11:05:12 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1j1EMq-000Fhb-C8; Tue, 11 Feb 2020 03:05:12 +0800
Date:   Tue, 11 Feb 2020 03:04:58 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     kbuild-all@lists.01.org, linux-gpio@vger.kernel.org
Subject: [gpio:devel-cleanup-irqchip-threaded 1/1]
 include/linux/gpio/driver.h:2:0: error: unterminated #ifndef
Message-ID: <202002110342.7Hdxrfob%lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="linftgxppmj5hop3"
Content-Disposition: inline
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--linftgxppmj5hop3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git devel-cleanup-irqchip-threaded
head:   bf5b241314ea9d338b03df6f54b7c02113ab0f87
commit: bf5b241314ea9d338b03df6f54b7c02113ab0f87 [1/1] gpio: Handle generic and threaded IRQs on gpio irqchips
config: microblaze-nommu_defconfig (attached as .config)
compiler: microblaze-linux-gcc (GCC) 7.5.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout bf5b241314ea9d338b03df6f54b7c02113ab0f87
        # save the attached .config to linux build tree
        GCC_VERSION=7.5.0 make.cross ARCH=microblaze 

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   In file included from include/asm-generic/gpio.h:13:0,
                    from include/linux/gpio.h:62,
                    from drivers//gpio/gpiolib.c:13:
>> include/linux/gpio/driver.h:2:0: error: unterminated #ifndef
    #ifndef __LINUX_GPIO_DRIVER_H
    
   In file included from include/linux/gpio.h:62:0,
                    from drivers//gpio/gpiolib.c:13:
   include/asm-generic/gpio.h: In function 'gpio_to_chip':
>> include/asm-generic/gpio.h:61:9: error: implicit declaration of function 'gpiod_to_chip'; did you mean 'gpio_to_chip'? [-Werror=implicit-function-declaration]
     return gpiod_to_chip(gpio_to_desc(gpio));
            ^~~~~~~~~~~~~
            gpio_to_chip
>> include/asm-generic/gpio.h:61:9: warning: return makes pointer from integer without a cast [-Wint-conversion]
     return gpiod_to_chip(gpio_to_desc(gpio));
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers//gpio/gpiolib.c:17:0:
   include/linux/gpio/driver.h: At top level:
>> include/linux/gpio/driver.h:2:0: error: unterminated #ifndef
    #ifndef __LINUX_GPIO_DRIVER_H
    
   In file included from drivers//gpio/gpiolib.h:12:0,
                    from drivers//gpio/gpiolib.c:31:
>> include/linux/gpio/driver.h:2:0: error: unterminated #ifndef
    #ifndef __LINUX_GPIO_DRIVER_H
    
   drivers//gpio/gpiolib.c: In function 'gpiochip_get_desc':
>> drivers//gpio/gpiolib.c:145:33: error: dereferencing pointer to incomplete type 'struct gpio_chip'
     struct gpio_device *gdev = chip->gpiodev;
                                    ^~
   drivers//gpio/gpiolib.c: At top level:
>> drivers//gpio/gpiolib.c:174:19: error: conflicting types for 'gpiod_to_chip'
    struct gpio_chip *gpiod_to_chip(const struct gpio_desc *desc)
                      ^~~~~~~~~~~~~
   In file included from include/linux/gpio.h:62:0,
                    from drivers//gpio/gpiolib.c:13:
   include/asm-generic/gpio.h:61:9: note: previous implicit declaration of 'gpiod_to_chip' was here
     return gpiod_to_chip(gpio_to_desc(gpio));
            ^~~~~~~~~~~~~
   In file included from include/asm-generic/bitops.h:14:0,
                    from ./arch/microblaze/include/generated/asm/bitops.h:1,
                    from include/linux/bitops.h:29,
                    from include/linux/bitmap.h:8,
                    from drivers//gpio/gpiolib.c:2:
   drivers//gpio/gpiolib.c: In function 'gpiochip_line_is_valid':
>> drivers//gpio/gpiolib.c:413:22: error: dereferencing pointer to incomplete type 'const struct gpio_chip'
     if (likely(!gpiochip->valid_mask))
                         ^
   include/linux/compiler.h:77:40: note: in definition of macro 'likely'
    # define likely(x) __builtin_expect(!!(x), 1)
                                           ^
   drivers//gpio/gpiolib.c: In function 'gpiochip_add_data_with_key':
>> drivers//gpio/gpiolib.c:1571:2: error: implicit declaration of function 'gpiochip_remove_pin_ranges'; did you mean 'gpiochip_add_pin_ranges'? [-Werror=implicit-function-declaration]
     gpiochip_remove_pin_ranges(chip);
     ^~~~~~~~~~~~~~~~~~~~~~~~~~
     gpiochip_add_pin_ranges
   drivers//gpio/gpiolib.c: In function 'devm_gpiochip_add_data':
>> drivers//gpio/gpiolib.c:1692:8: error: implicit declaration of function 'gpiochip_add_data'; did you mean 'gpiochip_get_data'? [-Werror=implicit-function-declaration]
     ret = gpiochip_add_data(chip, data);
           ^~~~~~~~~~~~~~~~~
           gpiochip_get_data
   drivers//gpio/gpiolib.c: In function 'gpiochip_line_is_valid':
>> drivers//gpio/gpiolib.c:416:1: warning: control reaches end of non-void function [-Wreturn-type]
    }
    ^
   drivers//gpio/gpiolib.c: In function 'gpiochip_get_data':
   drivers//gpio/gpiolib.c:1603:1: warning: control reaches end of non-void function [-Wreturn-type]
    }
    ^
   drivers//gpio/gpiolib.c: In function 'gpiochip_generic_request':
   drivers//gpio/gpiolib.c:2610:1: warning: control reaches end of non-void function [-Wreturn-type]
    }
    ^
   drivers//gpio/gpiolib.c: In function 'gpiochip_generic_config':
   drivers//gpio/gpiolib.c:2634:1: warning: control reaches end of non-void function [-Wreturn-type]
    }
    ^
   drivers//gpio/gpiolib.c: In function 'gpio_set_config':
   drivers//gpio/gpiolib.c:3045:1: warning: control reaches end of non-void function [-Wreturn-type]
    }
    ^
   drivers//gpio/gpiolib.c: In function 'gpiod_cansleep':
   drivers//gpio/gpiolib.c:3912:1: warning: control reaches end of non-void function [-Wreturn-type]
    }
    ^
   drivers//gpio/gpiolib.c: In function 'gpiochip_line_is_irq':
   drivers//gpio/gpiolib.c:4076:1: warning: control reaches end of non-void function [-Wreturn-type]
    }
    ^
   drivers//gpio/gpiolib.c: In function 'gpiochip_line_is_open_drain':
   drivers//gpio/gpiolib.c:4109:1: warning: control reaches end of non-void function [-Wreturn-type]
    }
    ^
   drivers//gpio/gpiolib.c: In function 'gpiochip_line_is_open_source':
   drivers//gpio/gpiolib.c:4118:1: warning: control reaches end of non-void function [-Wreturn-type]
    }
    ^
   drivers//gpio/gpiolib.c: In function 'gpiochip_line_is_persistent':
   drivers//gpio/gpiolib.c:4127:1: warning: control reaches end of non-void function [-Wreturn-type]
    }
    ^
   drivers//gpio/gpiolib.c: In function 'gpiochip_match_name':
   drivers//gpio/gpiolib.c:1742:1: warning: control reaches end of non-void function [-Wreturn-type]
    }
    ^
   cc1: some warnings being treated as errors
--
   In file included from include/asm-generic/gpio.h:13:0,
                    from include/linux/gpio.h:62,
                    from drivers//gpio/gpiolib-devres.c:11:
>> include/linux/gpio/driver.h:2:0: error: unterminated #ifndef
    #ifndef __LINUX_GPIO_DRIVER_H
    
   In file included from include/linux/gpio.h:62:0,
                    from drivers//gpio/gpiolib-devres.c:11:
   include/asm-generic/gpio.h: In function 'gpio_to_chip':
>> include/asm-generic/gpio.h:61:9: error: implicit declaration of function 'gpiod_to_chip'; did you mean 'gpio_to_chip'? [-Werror=implicit-function-declaration]
     return gpiod_to_chip(gpio_to_desc(gpio));
            ^~~~~~~~~~~~~
            gpio_to_chip
>> include/asm-generic/gpio.h:61:9: warning: return makes pointer from integer without a cast [-Wint-conversion]
     return gpiod_to_chip(gpio_to_desc(gpio));
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers//gpio/gpiolib.h:12:0,
                    from drivers//gpio/gpiolib-devres.c:16:
   include/linux/gpio/driver.h: At top level:
>> include/linux/gpio/driver.h:2:0: error: unterminated #ifndef
    #ifndef __LINUX_GPIO_DRIVER_H
    
   cc1: some warnings being treated as errors
--
   In file included from drivers//gpio/gpiolib-devprop.c:12:0:
>> include/linux/gpio/driver.h:2:0: error: unterminated #ifndef
    #ifndef __LINUX_GPIO_DRIVER_H
    
   In file included from drivers//gpio/gpiolib.h:12:0,
                    from drivers//gpio/gpiolib-devprop.c:15:
>> include/linux/gpio/driver.h:2:0: error: unterminated #ifndef
    #ifndef __LINUX_GPIO_DRIVER_H
    
   drivers//gpio/gpiolib-devprop.c: In function 'devprop_gpiochip_set_names':
>> drivers//gpio/gpiolib-devprop.c:30:33: error: dereferencing pointer to incomplete type 'struct gpio_chip'
     struct gpio_device *gdev = chip->gpiodev;
                                    ^~
--
   In file included from drivers//gpio/gpiolib-sysfs.c:7:0:
>> include/linux/gpio/driver.h:2:0: error: unterminated #ifndef
    #ifndef __LINUX_GPIO_DRIVER_H
    
   In file included from drivers//gpio/gpiolib.h:12:0,
                    from drivers//gpio/gpiolib-sysfs.c:13:
>> include/linux/gpio/driver.h:2:0: error: unterminated #ifndef
    #ifndef __LINUX_GPIO_DRIVER_H
    
   drivers//gpio/gpiolib-sysfs.c: In function 'gpio_sysfs_request_irq':
>> drivers//gpio/gpiolib-sysfs.c:195:8: error: implicit declaration of function 'gpiochip_lock_as_irq'; did you mean 'spin_lock_irq'? [-Werror=implicit-function-declaration]
     ret = gpiochip_lock_as_irq(desc->gdev->chip, gpio_chip_hwgpio(desc));
           ^~~~~~~~~~~~~~~~~~~~
           spin_lock_irq
>> drivers//gpio/gpiolib-sysfs.c:209:2: error: implicit declaration of function 'gpiochip_unlock_as_irq'; did you mean 'spin_unlock_irq'? [-Werror=implicit-function-declaration]
     gpiochip_unlock_as_irq(desc->gdev->chip, gpio_chip_hwgpio(desc));
     ^~~~~~~~~~~~~~~~~~~~~~
     spin_unlock_irq
   drivers//gpio/gpiolib-sysfs.c: In function 'base_show':
>> drivers//gpio/gpiolib-sysfs.c:417:34: error: dereferencing pointer to incomplete type 'const struct gpio_chip'
     return sprintf(buf, "%d\n", chip->base);
                                     ^~
   drivers//gpio/gpiolib-sysfs.c: In function 'gpiod_export':
>> drivers//gpio/gpiolib-sysfs.c:620:10: error: dereferencing pointer to incomplete type 'struct gpio_chip'
     if (chip->direction_input && chip->direction_output)
             ^~
   cc1: some warnings being treated as errors
--
   In file included from drivers//gpio/gpiolib-legacy.c:3:0:
>> include/linux/gpio/driver.h:2:0: error: unterminated #ifndef
    #ifndef __LINUX_GPIO_DRIVER_H
    
   In file included from include/asm-generic/gpio.h:13:0,
                    from include/linux/gpio.h:62,
                    from drivers//gpio/gpiolib-legacy.c:5:
>> include/linux/gpio/driver.h:2:0: error: unterminated #ifndef
    #ifndef __LINUX_GPIO_DRIVER_H
    
   In file included from include/linux/gpio.h:62:0,
                    from drivers//gpio/gpiolib-legacy.c:5:
   include/asm-generic/gpio.h: In function 'gpio_to_chip':
>> include/asm-generic/gpio.h:61:9: error: implicit declaration of function 'gpiod_to_chip'; did you mean 'gpio_to_chip'? [-Werror=implicit-function-declaration]
     return gpiod_to_chip(gpio_to_desc(gpio));
            ^~~~~~~~~~~~~
            gpio_to_chip
>> include/asm-generic/gpio.h:61:9: warning: return makes pointer from integer without a cast [-Wint-conversion]
     return gpiod_to_chip(gpio_to_desc(gpio));
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers//gpio/gpiolib.h:12:0,
                    from drivers//gpio/gpiolib-legacy.c:7:
   include/linux/gpio/driver.h: At top level:
>> include/linux/gpio/driver.h:2:0: error: unterminated #ifndef
    #ifndef __LINUX_GPIO_DRIVER_H
    
   cc1: some warnings being treated as errors
--
   In file included from drivers//gpio/gpio-xilinx.c:15:0:
>> include/linux/gpio/driver.h:2:0: error: unterminated #ifndef
    #ifndef __LINUX_GPIO_DRIVER_H
    
>> drivers//gpio/gpio-xilinx.c:43:19: error: field 'gc' has incomplete type
     struct gpio_chip gc;
                      ^~
   drivers//gpio/gpio-xilinx.c: In function 'xgpio_get':
>> drivers//gpio/gpio-xilinx.c:88:32: error: implicit declaration of function 'gpiochip_get_data' [-Werror=implicit-function-declaration]
     struct xgpio_instance *chip = gpiochip_get_data(gc);
                                   ^~~~~~~~~~~~~~~~~
>> drivers//gpio/gpio-xilinx.c:88:32: warning: initialization makes pointer from integer without a cast [-Wint-conversion]
   drivers//gpio/gpio-xilinx.c: In function 'xgpio_set':
   drivers//gpio/gpio-xilinx.c:109:32: warning: initialization makes pointer from integer without a cast [-Wint-conversion]
     struct xgpio_instance *chip = gpiochip_get_data(gc);
                                   ^~~~~~~~~~~~~~~~~
   drivers//gpio/gpio-xilinx.c: In function 'xgpio_set_multiple':
   drivers//gpio/gpio-xilinx.c:140:32: warning: initialization makes pointer from integer without a cast [-Wint-conversion]
     struct xgpio_instance *chip = gpiochip_get_data(gc);
                                   ^~~~~~~~~~~~~~~~~
>> drivers//gpio/gpio-xilinx.c:147:20: error: dereferencing pointer to incomplete type 'struct gpio_chip'
     for (i = 0; i < gc->ngpio; i++) {
                       ^~
   drivers//gpio/gpio-xilinx.c: In function 'xgpio_dir_in':
   drivers//gpio/gpio-xilinx.c:185:32: warning: initialization makes pointer from integer without a cast [-Wint-conversion]
     struct xgpio_instance *chip = gpiochip_get_data(gc);
                                   ^~~~~~~~~~~~~~~~~
   drivers//gpio/gpio-xilinx.c: In function 'xgpio_dir_out':
   drivers//gpio/gpio-xilinx.c:216:32: warning: initialization makes pointer from integer without a cast [-Wint-conversion]
     struct xgpio_instance *chip = gpiochip_get_data(gc);
                                   ^~~~~~~~~~~~~~~~~
   drivers//gpio/gpio-xilinx.c: In function 'xgpio_probe':
>> drivers//gpio/gpio-xilinx.c:338:11: error: implicit declaration of function 'devm_gpiochip_add_data'; did you mean 'irq_get_chip_data'? [-Werror=implicit-function-declaration]
     status = devm_gpiochip_add_data(&pdev->dev, &chip->gc, chip);
              ^~~~~~~~~~~~~~~~~~~~~~
              irq_get_chip_data
   cc1: some warnings being treated as errors
--
   In file included from include/asm-generic/gpio.h:13:0,
                    from include/linux/gpio.h:62,
                    from include/linux/of_gpio.h:16,
                    from drivers//gpio/gpiolib-of.c:18:
>> include/linux/gpio/driver.h:2:0: error: unterminated #ifndef
    #ifndef __LINUX_GPIO_DRIVER_H
    
   In file included from include/linux/gpio.h:62:0,
                    from include/linux/of_gpio.h:16,
                    from drivers//gpio/gpiolib-of.c:18:
   include/asm-generic/gpio.h: In function 'gpio_to_chip':
>> include/asm-generic/gpio.h:61:9: error: implicit declaration of function 'gpiod_to_chip'; did you mean 'gpio_to_chip'? [-Werror=implicit-function-declaration]
     return gpiod_to_chip(gpio_to_desc(gpio));
            ^~~~~~~~~~~~~
            gpio_to_chip
>> include/asm-generic/gpio.h:61:9: warning: return makes pointer from integer without a cast [-Wint-conversion]
     return gpiod_to_chip(gpio_to_desc(gpio));
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers//gpio/gpiolib-of.c:18:0:
   include/linux/of_gpio.h: At top level:
>> include/linux/of_gpio.h:41:19: error: field 'gc' has incomplete type
     struct gpio_chip gc;
                      ^~
   In file included from include/linux/dev_printk.h:14:0,
                    from include/linux/device.h:15,
                    from drivers//gpio/gpiolib-of.c:10:
   include/linux/of_gpio.h: In function 'to_of_mm_gpio_chip':
>> include/linux/kernel.h:987:32: error: dereferencing pointer to incomplete type 'struct gpio_chip'
     BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) && \
                                   ^~~~~~
   include/linux/compiler.h:330:9: note: in definition of macro '__compiletime_assert'
      if (!(condition))     \
            ^~~~~~~~~
   include/linux/compiler.h:350:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:987:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) && \
     ^~~~~~~~~~~~~~~~
   include/linux/kernel.h:987:20: note: in expansion of macro '__same_type'
     BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) && \
                       ^~~~~~~~~~~
>> include/linux/of_gpio.h:48:9: note: in expansion of macro 'container_of'
     return container_of(gc, struct of_mm_gpio_chip, gc);
            ^~~~~~~~~~~~
   In file included from drivers//gpio/gpiolib.h:12:0,
                    from drivers//gpio/gpiolib-of.c:23:
   include/linux/gpio/driver.h: At top level:
>> include/linux/gpio/driver.h:2:0: error: unterminated #ifndef
    #ifndef __LINUX_GPIO_DRIVER_H
    
   drivers//gpio/gpiolib-of.c: In function 'of_find_gpiochip_by_xlate':
>> drivers//gpio/gpiolib-of.c:92:9: error: implicit declaration of function 'gpiochip_find'; did you mean 'of_gpiochip_add'? [-Werror=implicit-function-declaration]
     return gpiochip_find(gpiospec, of_gpiochip_match_node_and_xlate);
            ^~~~~~~~~~~~~
            of_gpiochip_add
>> drivers//gpio/gpiolib-of.c:92:9: warning: return makes pointer from integer without a cast [-Wint-conversion]
     return gpiochip_find(gpiospec, of_gpiochip_match_node_and_xlate);
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers//gpio/gpiolib-of.c: In function 'of_gpio_need_valid_mask':
>> drivers//gpio/gpiolib-of.c:121:29: error: dereferencing pointer to incomplete type 'const struct gpio_chip'
     struct device_node *np = gc->of_node;
                                ^~
   drivers//gpio/gpiolib-of.c: In function 'of_mm_gpiochip_add_data':
>> drivers//gpio/gpiolib-of.c:725:8: error: implicit declaration of function 'gpiochip_add_data'; did you mean 'gpiochip_get_desc'? [-Werror=implicit-function-declaration]
     ret = gpiochip_add_data(gc, data);
           ^~~~~~~~~~~~~~~~~
           gpiochip_get_desc
   drivers//gpio/gpiolib-of.c: In function 'of_mm_gpiochip_remove':
>> drivers//gpio/gpiolib-of.c:751:2: error: implicit declaration of function 'gpiochip_remove'; did you mean 'of_gpiochip_remove'? [-Werror=implicit-function-declaration]
     gpiochip_remove(gc);
     ^~~~~~~~~~~~~~~
     of_gpiochip_remove
   drivers//gpio/gpiolib-of.c: In function 'of_gpiochip_add':
>> drivers//gpio/gpiolib-of.c:888:3: error: implicit declaration of function 'devprop_gpiochip_set_names'; did you mean 'of_gpiochip_scan_gpios'? [-Werror=implicit-function-declaration]
      devprop_gpiochip_set_names(chip,
      ^~~~~~~~~~~~~~~~~~~~~~~~~~
      of_gpiochip_scan_gpios
   In file included from drivers//gpio/gpiolib-of.c:16:0:
>> include/linux/of.h:175:28: error: invalid type argument of '->' (have 'int')
       &__of_fwnode_handle_node->fwnode : NULL; \
                               ^
>> drivers//gpio/gpiolib-of.c:889:9: note: in expansion of macro 'of_fwnode_handle'
            of_fwnode_handle(chip->of_node));
            ^~~~~~~~~~~~~~~~
   drivers//gpio/gpiolib-of.c: In function 'of_gpiochip_match_node_and_xlate':
>> drivers//gpio/gpiolib-of.c:87:1: warning: control reaches end of non-void function [-Wreturn-type]
    }
    ^
   cc1: some warnings being treated as errors
..

vim +2 include/linux/gpio/driver.h

79a9becda8940d Alexandre Courbot 2013-10-17 @2  #ifndef __LINUX_GPIO_DRIVER_H
79a9becda8940d Alexandre Courbot 2013-10-17  3  #define __LINUX_GPIO_DRIVER_H
79a9becda8940d Alexandre Courbot 2013-10-17  4  

:::::: The code at line 2 was first introduced by commit
:::::: 79a9becda8940deb2274b5aa4577c86d52ee7ecb gpiolib: export descriptor-based GPIO interface

:::::: TO: Alexandre Courbot <acourbot@nvidia.com>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--linftgxppmj5hop3
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--linftgxppmj5hop3--
