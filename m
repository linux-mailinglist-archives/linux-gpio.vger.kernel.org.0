Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9294B6C5BD3
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Mar 2023 02:26:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229734AbjCWB0X (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Mar 2023 21:26:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229928AbjCWB0W (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Mar 2023 21:26:22 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 489E52F073
        for <linux-gpio@vger.kernel.org>; Wed, 22 Mar 2023 18:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679534781; x=1711070781;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bca4rV0/SD5/IeJf0J1JNJdskFY4zNxqkHrZncUa/T4=;
  b=bPoMZByjHmeHO4D2e9ksW9fLNKq0EgYdMC4KDC04ZL3umuvFl0XJ+EhS
   j44RqZMGxHJ3YS5K9SYNe4/Bavd2FyrxBYWhsVusF1Z0t55Lu8kT9iAql
   WOqBKhVUMBrXTyBwuOwlYPsRizVPUw8qqszeEmoonO8RZW3p1NSv48uwQ
   oYhDpWsQb1FtT+vEGEmUcAZ+zv1uXKYcuptkhJzY2It62oErLBIx28Mqz
   zrEm6QMyApHSiCgkysuQ7gWU6eA2NRimbp0DP/DMXfkAVVsHlbj+WHGz1
   7QwMy4jsph6we6Q5+xesRC0zsjX5ayXjrNQTJ6khs1DxkTxn5yQ6UUP70
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="338090481"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="338090481"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2023 18:26:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="659390571"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="659390571"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 22 Mar 2023 18:26:08 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pf9iM-000DoI-3B;
        Thu, 23 Mar 2023 01:26:02 +0000
Date:   Thu, 23 Mar 2023 09:25:29 +0800
From:   kernel test robot <lkp@intel.com>
To:     William Breathitt Gray <william.gray@linaro.org>
Cc:     llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [brgl:gpio/for-next 55/68] drivers/gpio/gpio-pci-idio-16.c:32:23:
 error: field has incomplete type 'struct idio_16_state'
Message-ID: <202303230924.cF2c6S05-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
head:   16d6fa5a94b3873968941b701b99903abc4e5059
commit: 473b79057bbd9756f6969e6647e2d9ecababa7af [55/68] gpio: idio-16: Remove unused legacy interface
config: i386-randconfig-a013 (https://download.01.org/0day-ci/archive/20230323/202303230924.cF2c6S05-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git/commit/?id=473b79057bbd9756f6969e6647e2d9ecababa7af
        git remote add brgl https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git
        git fetch --no-tags brgl gpio/for-next
        git checkout 473b79057bbd9756f6969e6647e2d9ecababa7af
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpio/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303230924.cF2c6S05-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpio/gpio-pci-idio-16.c:32:23: error: field has incomplete type 'struct idio_16_state'
           struct idio_16_state state;
                                ^
   drivers/gpio/gpio-pci-idio-16.c:32:9: note: forward declaration of 'struct idio_16_state'
           struct idio_16_state state;
                  ^
>> drivers/gpio/gpio-pci-idio-16.c:39:6: error: implicit declaration of function 'idio_16_get_direction' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           if (idio_16_get_direction(offset))
               ^
   drivers/gpio/gpio-pci-idio-16.c:39:6: note: did you mean 'idio_16_gpio_get_direction'?
   drivers/gpio/gpio-pci-idio-16.c:36:12: note: 'idio_16_gpio_get_direction' declared here
   static int idio_16_gpio_get_direction(struct gpio_chip *chip,
              ^
>> drivers/gpio/gpio-pci-idio-16.c:62:9: error: implicit declaration of function 'idio_16_get' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           return idio_16_get(idio16gpio->reg, &idio16gpio->state, offset);
                  ^
>> drivers/gpio/gpio-pci-idio-16.c:70:2: error: implicit declaration of function 'idio_16_get_multiple' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           idio_16_get_multiple(idio16gpio->reg, &idio16gpio->state, mask, bits);
           ^
   drivers/gpio/gpio-pci-idio-16.c:70:2: note: did you mean 'idio_16_gpio_get_multiple'?
   drivers/gpio/gpio-pci-idio-16.c:65:12: note: 'idio_16_gpio_get_multiple' declared here
   static int idio_16_gpio_get_multiple(struct gpio_chip *chip,
              ^
>> drivers/gpio/gpio-pci-idio-16.c:79:2: error: implicit declaration of function 'idio_16_set' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           idio_16_set(idio16gpio->reg, &idio16gpio->state, offset, value);
           ^
>> drivers/gpio/gpio-pci-idio-16.c:87:2: error: implicit declaration of function 'idio_16_set_multiple' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           idio_16_set_multiple(idio16gpio->reg, &idio16gpio->state, mask, bits);
           ^
   drivers/gpio/gpio-pci-idio-16.c:87:2: note: did you mean 'idio_16_gpio_set_multiple'?
   drivers/gpio/gpio-pci-idio-16.c:82:13: note: 'idio_16_gpio_set_multiple' declared here
   static void idio_16_gpio_set_multiple(struct gpio_chip *chip,
               ^
>> drivers/gpio/gpio-pci-idio-16.c:106:31: error: incomplete definition of type 'struct idio_16'
                   iowrite8(0, &idio16gpio->reg->irq_ctl);
                                ~~~~~~~~~~~~~~~^
   drivers/gpio/gpio-pci-idio-16.c:31:9: note: forward declaration of 'struct idio_16'
           struct idio_16 __iomem *reg;
                  ^
   drivers/gpio/gpio-pci-idio-16.c:129:27: error: incomplete definition of type 'struct idio_16'
                   ioread8(&idio16gpio->reg->irq_ctl);
                            ~~~~~~~~~~~~~~~^
   drivers/gpio/gpio-pci-idio-16.c:31:9: note: forward declaration of 'struct idio_16'
           struct idio_16 __iomem *reg;
                  ^
   drivers/gpio/gpio-pci-idio-16.c:164:39: error: incomplete definition of type 'struct idio_16'
           irq_status = ioread8(&idio16gpio->reg->irq_status);
                                 ~~~~~~~~~~~~~~~^
   drivers/gpio/gpio-pci-idio-16.c:31:9: note: forward declaration of 'struct idio_16'
           struct idio_16 __iomem *reg;
                  ^
   drivers/gpio/gpio-pci-idio-16.c:178:30: error: incomplete definition of type 'struct idio_16'
           iowrite8(0, &idio16gpio->reg->in0_7);
                        ~~~~~~~~~~~~~~~^
   drivers/gpio/gpio-pci-idio-16.c:31:9: note: forward declaration of 'struct idio_16'
           struct idio_16 __iomem *reg;
                  ^
   drivers/gpio/gpio-pci-idio-16.c:198:30: error: incomplete definition of type 'struct idio_16'
           iowrite8(0, &idio16gpio->reg->irq_ctl);
                        ~~~~~~~~~~~~~~~^
   drivers/gpio/gpio-pci-idio-16.c:31:9: note: forward declaration of 'struct idio_16'
           struct idio_16 __iomem *reg;
                  ^
   drivers/gpio/gpio-pci-idio-16.c:199:30: error: incomplete definition of type 'struct idio_16'
           iowrite8(0, &idio16gpio->reg->in0_7);
                        ~~~~~~~~~~~~~~~^
   drivers/gpio/gpio-pci-idio-16.c:31:9: note: forward declaration of 'struct idio_16'
           struct idio_16 __iomem *reg;
                  ^
   drivers/gpio/gpio-pci-idio-16.c:232:30: error: incomplete definition of type 'struct idio_16'
           iowrite8(0, &idio16gpio->reg->filter_ctl);
                        ~~~~~~~~~~~~~~~^
   drivers/gpio/gpio-pci-idio-16.c:31:9: note: forward declaration of 'struct idio_16'
           struct idio_16 __iomem *reg;
                  ^
>> drivers/gpio/gpio-pci-idio-16.c:248:2: error: implicit declaration of function 'idio_16_state_init' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           idio_16_state_init(&idio16gpio->state);
           ^
   drivers/gpio/gpio-pci-idio-16.c:248:2: note: did you mean 'file_ra_state_init'?
   include/linux/fs.h:2750:1: note: 'file_ra_state_init' declared here
   file_ra_state_init(struct file_ra_state *ra, struct address_space *mapping);
   ^
   14 errors generated.


vim +32 drivers/gpio/gpio-pci-idio-16.c

02e74fc0401ae3 William Breathitt Gray 2017-02-01   19  
02e74fc0401ae3 William Breathitt Gray 2017-02-01   20  /**
02e74fc0401ae3 William Breathitt Gray 2017-02-01   21   * struct idio_16_gpio - GPIO device private data structure
02e74fc0401ae3 William Breathitt Gray 2017-02-01   22   * @chip:	instance of the gpio_chip
02e74fc0401ae3 William Breathitt Gray 2017-02-01   23   * @lock:	synchronization lock to prevent I/O race conditions
02e74fc0401ae3 William Breathitt Gray 2017-02-01   24   * @reg:	I/O address offset for the GPIO device registers
e7f758fa9b7fda William Breathitt Gray 2022-09-18   25   * @state:	ACCES IDIO-16 device state
02e74fc0401ae3 William Breathitt Gray 2017-02-01   26   * @irq_mask:	I/O bits affected by interrupts
02e74fc0401ae3 William Breathitt Gray 2017-02-01   27   */
02e74fc0401ae3 William Breathitt Gray 2017-02-01   28  struct idio_16_gpio {
02e74fc0401ae3 William Breathitt Gray 2017-02-01   29  	struct gpio_chip chip;
ea38ce081d1555 Julia Cartwright       2017-03-21   30  	raw_spinlock_t lock;
e7f758fa9b7fda William Breathitt Gray 2022-09-18   31  	struct idio_16 __iomem *reg;
e7f758fa9b7fda William Breathitt Gray 2022-09-18  @32  	struct idio_16_state state;
02e74fc0401ae3 William Breathitt Gray 2017-02-01   33  	unsigned long irq_mask;
02e74fc0401ae3 William Breathitt Gray 2017-02-01   34  };
02e74fc0401ae3 William Breathitt Gray 2017-02-01   35  
02e74fc0401ae3 William Breathitt Gray 2017-02-01   36  static int idio_16_gpio_get_direction(struct gpio_chip *chip,
02e74fc0401ae3 William Breathitt Gray 2017-02-01   37  	unsigned int offset)
02e74fc0401ae3 William Breathitt Gray 2017-02-01   38  {
e7f758fa9b7fda William Breathitt Gray 2022-09-18  @39  	if (idio_16_get_direction(offset))
e42615ec233b30 Matti Vaittinen        2019-11-06   40  		return GPIO_LINE_DIRECTION_IN;
02e74fc0401ae3 William Breathitt Gray 2017-02-01   41  
e42615ec233b30 Matti Vaittinen        2019-11-06   42  	return GPIO_LINE_DIRECTION_OUT;
02e74fc0401ae3 William Breathitt Gray 2017-02-01   43  }
02e74fc0401ae3 William Breathitt Gray 2017-02-01   44  
02e74fc0401ae3 William Breathitt Gray 2017-02-01   45  static int idio_16_gpio_direction_input(struct gpio_chip *chip,
02e74fc0401ae3 William Breathitt Gray 2017-02-01   46  	unsigned int offset)
02e74fc0401ae3 William Breathitt Gray 2017-02-01   47  {
02e74fc0401ae3 William Breathitt Gray 2017-02-01   48  	return 0;
02e74fc0401ae3 William Breathitt Gray 2017-02-01   49  }
02e74fc0401ae3 William Breathitt Gray 2017-02-01   50  
02e74fc0401ae3 William Breathitt Gray 2017-02-01   51  static int idio_16_gpio_direction_output(struct gpio_chip *chip,
02e74fc0401ae3 William Breathitt Gray 2017-02-01   52  	unsigned int offset, int value)
02e74fc0401ae3 William Breathitt Gray 2017-02-01   53  {
02e74fc0401ae3 William Breathitt Gray 2017-02-01   54  	chip->set(chip, offset, value);
02e74fc0401ae3 William Breathitt Gray 2017-02-01   55  	return 0;
02e74fc0401ae3 William Breathitt Gray 2017-02-01   56  }
02e74fc0401ae3 William Breathitt Gray 2017-02-01   57  
02e74fc0401ae3 William Breathitt Gray 2017-02-01   58  static int idio_16_gpio_get(struct gpio_chip *chip, unsigned int offset)
02e74fc0401ae3 William Breathitt Gray 2017-02-01   59  {
02e74fc0401ae3 William Breathitt Gray 2017-02-01   60  	struct idio_16_gpio *const idio16gpio = gpiochip_get_data(chip);
02e74fc0401ae3 William Breathitt Gray 2017-02-01   61  
e7f758fa9b7fda William Breathitt Gray 2022-09-18  @62  	return idio_16_get(idio16gpio->reg, &idio16gpio->state, offset);
02e74fc0401ae3 William Breathitt Gray 2017-02-01   63  }
02e74fc0401ae3 William Breathitt Gray 2017-02-01   64  
810ebfc5efca9a William Breathitt Gray 2018-03-22   65  static int idio_16_gpio_get_multiple(struct gpio_chip *chip,
810ebfc5efca9a William Breathitt Gray 2018-03-22   66  	unsigned long *mask, unsigned long *bits)
810ebfc5efca9a William Breathitt Gray 2018-03-22   67  {
810ebfc5efca9a William Breathitt Gray 2018-03-22   68  	struct idio_16_gpio *const idio16gpio = gpiochip_get_data(chip);
810ebfc5efca9a William Breathitt Gray 2018-03-22   69  
e7f758fa9b7fda William Breathitt Gray 2022-09-18  @70  	idio_16_get_multiple(idio16gpio->reg, &idio16gpio->state, mask, bits);
810ebfc5efca9a William Breathitt Gray 2018-03-22   71  	return 0;
810ebfc5efca9a William Breathitt Gray 2018-03-22   72  }
810ebfc5efca9a William Breathitt Gray 2018-03-22   73  
02e74fc0401ae3 William Breathitt Gray 2017-02-01   74  static void idio_16_gpio_set(struct gpio_chip *chip, unsigned int offset,
02e74fc0401ae3 William Breathitt Gray 2017-02-01   75  	int value)
02e74fc0401ae3 William Breathitt Gray 2017-02-01   76  {
02e74fc0401ae3 William Breathitt Gray 2017-02-01   77  	struct idio_16_gpio *const idio16gpio = gpiochip_get_data(chip);
02e74fc0401ae3 William Breathitt Gray 2017-02-01   78  
e7f758fa9b7fda William Breathitt Gray 2022-09-18  @79  	idio_16_set(idio16gpio->reg, &idio16gpio->state, offset, value);
02e74fc0401ae3 William Breathitt Gray 2017-02-01   80  }
02e74fc0401ae3 William Breathitt Gray 2017-02-01   81  
02e74fc0401ae3 William Breathitt Gray 2017-02-01   82  static void idio_16_gpio_set_multiple(struct gpio_chip *chip,
02e74fc0401ae3 William Breathitt Gray 2017-02-01   83  	unsigned long *mask, unsigned long *bits)
02e74fc0401ae3 William Breathitt Gray 2017-02-01   84  {
02e74fc0401ae3 William Breathitt Gray 2017-02-01   85  	struct idio_16_gpio *const idio16gpio = gpiochip_get_data(chip);
02e74fc0401ae3 William Breathitt Gray 2017-02-01   86  
e7f758fa9b7fda William Breathitt Gray 2022-09-18  @87  	idio_16_set_multiple(idio16gpio->reg, &idio16gpio->state, mask, bits);
2dc7c3c16daac7 William Breathitt Gray 2019-12-04   88  }
02e74fc0401ae3 William Breathitt Gray 2017-02-01   89  
02e74fc0401ae3 William Breathitt Gray 2017-02-01   90  static void idio_16_irq_ack(struct irq_data *data)
02e74fc0401ae3 William Breathitt Gray 2017-02-01   91  {
02e74fc0401ae3 William Breathitt Gray 2017-02-01   92  }
02e74fc0401ae3 William Breathitt Gray 2017-02-01   93  
02e74fc0401ae3 William Breathitt Gray 2017-02-01   94  static void idio_16_irq_mask(struct irq_data *data)
02e74fc0401ae3 William Breathitt Gray 2017-02-01   95  {
02e74fc0401ae3 William Breathitt Gray 2017-02-01   96  	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
02e74fc0401ae3 William Breathitt Gray 2017-02-01   97  	struct idio_16_gpio *const idio16gpio = gpiochip_get_data(chip);
02e74fc0401ae3 William Breathitt Gray 2017-02-01   98  	const unsigned long mask = BIT(irqd_to_hwirq(data));
02e74fc0401ae3 William Breathitt Gray 2017-02-01   99  	unsigned long flags;
02e74fc0401ae3 William Breathitt Gray 2017-02-01  100  
02e74fc0401ae3 William Breathitt Gray 2017-02-01  101  	idio16gpio->irq_mask &= ~mask;
02e74fc0401ae3 William Breathitt Gray 2017-02-01  102  
02e74fc0401ae3 William Breathitt Gray 2017-02-01  103  	if (!idio16gpio->irq_mask) {
ea38ce081d1555 Julia Cartwright       2017-03-21  104  		raw_spin_lock_irqsave(&idio16gpio->lock, flags);
02e74fc0401ae3 William Breathitt Gray 2017-02-01  105  
02e74fc0401ae3 William Breathitt Gray 2017-02-01 @106  		iowrite8(0, &idio16gpio->reg->irq_ctl);
02e74fc0401ae3 William Breathitt Gray 2017-02-01  107  
ea38ce081d1555 Julia Cartwright       2017-03-21  108  		raw_spin_unlock_irqrestore(&idio16gpio->lock, flags);
02e74fc0401ae3 William Breathitt Gray 2017-02-01  109  	}
141d5527568e92 Linus Walleij          2023-03-09  110  
141d5527568e92 Linus Walleij          2023-03-09  111  	gpiochip_disable_irq(chip, irqd_to_hwirq(data));
02e74fc0401ae3 William Breathitt Gray 2017-02-01  112  }
02e74fc0401ae3 William Breathitt Gray 2017-02-01  113  

:::::: The code at line 32 was first introduced by commit
:::::: e7f758fa9b7fda8b91f2e429b2be93ae0b88ac33 gpio: pci-idio-16: Utilize the idio-16 GPIO library

:::::: TO: William Breathitt Gray <william.gray@linaro.org>
:::::: CC: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
