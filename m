Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB24D6C5BD5
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Mar 2023 02:26:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229543AbjCWB0c (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Mar 2023 21:26:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbjCWB0b (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Mar 2023 21:26:31 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CC832FCD2
        for <linux-gpio@vger.kernel.org>; Wed, 22 Mar 2023 18:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679534789; x=1711070789;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZkGbgWWOqmguyF/qJk0Xfw0Ahx3qSoeIjrBaGvZWR+M=;
  b=SJnfDGe7ZT5B5k/Y9bBJ+4RwqZHNQjMKDMFfb9m9U4ZpNskFDSv+yFec
   dScfVbmdE2YGo9YkdzEucLQ5Os6z+6pTLr89vjqtL+lHkVTxcSl1UMBGZ
   iwgBChDex6ITLyOMauuwYQ+ZrzMKvAPY5R5CDkSM8/ayWuKsIl/N5D6ku
   sYR0lPQDPoP3xRE41WfVig2DlKUq9Vsc0CUBQe0+6MxlWyfRWa+ow7QZp
   2W5oD6aJB/OZwtDmt93biUxm1Ft73q1YIuXdaCdz663s8+NepYSbWUfq7
   3yZ8+DUFVuiy9aqJ8MLiRndnB3EprM8yh2ZygSOZ0jyOOPpUodk9qIKd4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="319022128"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="319022128"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2023 18:26:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="684513829"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="684513829"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 22 Mar 2023 18:26:08 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pf9iN-000DoQ-0C;
        Thu, 23 Mar 2023 01:26:03 +0000
Date:   Thu, 23 Mar 2023 09:25:40 +0800
From:   kernel test robot <lkp@intel.com>
To:     William Breathitt Gray <william.gray@linaro.org>
Cc:     oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [brgl:gpio/for-next 55/68] drivers/gpio/gpio-pci-idio-16.c:39:13:
 error: implicit declaration of function 'idio_16_get_direction'; did you
 mean 'idio_16_gpio_get_direction'?
Message-ID: <202303230922.hLLAnLQ6-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
head:   16d6fa5a94b3873968941b701b99903abc4e5059
commit: 473b79057bbd9756f6969e6647e2d9ecababa7af [55/68] gpio: idio-16: Remove unused legacy interface
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20230323/202303230922.hLLAnLQ6-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git/commit/?id=473b79057bbd9756f6969e6647e2d9ecababa7af
        git remote add brgl https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git
        git fetch --no-tags brgl gpio/for-next
        git checkout 473b79057bbd9756f6969e6647e2d9ecababa7af
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/gpio/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303230922.hLLAnLQ6-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpio/gpio-pci-idio-16.c:32:30: error: field 'state' has incomplete type
      32 |         struct idio_16_state state;
         |                              ^~~~~
   drivers/gpio/gpio-pci-idio-16.c: In function 'idio_16_gpio_get_direction':
>> drivers/gpio/gpio-pci-idio-16.c:39:13: error: implicit declaration of function 'idio_16_get_direction'; did you mean 'idio_16_gpio_get_direction'? [-Werror=implicit-function-declaration]
      39 |         if (idio_16_get_direction(offset))
         |             ^~~~~~~~~~~~~~~~~~~~~
         |             idio_16_gpio_get_direction
   drivers/gpio/gpio-pci-idio-16.c: In function 'idio_16_gpio_get':
>> drivers/gpio/gpio-pci-idio-16.c:62:16: error: implicit declaration of function 'idio_16_get'; did you mean 'idio_16_gpio_get'? [-Werror=implicit-function-declaration]
      62 |         return idio_16_get(idio16gpio->reg, &idio16gpio->state, offset);
         |                ^~~~~~~~~~~
         |                idio_16_gpio_get
   drivers/gpio/gpio-pci-idio-16.c: In function 'idio_16_gpio_get_multiple':
>> drivers/gpio/gpio-pci-idio-16.c:70:9: error: implicit declaration of function 'idio_16_get_multiple'; did you mean 'idio_16_gpio_get_multiple'? [-Werror=implicit-function-declaration]
      70 |         idio_16_get_multiple(idio16gpio->reg, &idio16gpio->state, mask, bits);
         |         ^~~~~~~~~~~~~~~~~~~~
         |         idio_16_gpio_get_multiple
   drivers/gpio/gpio-pci-idio-16.c: In function 'idio_16_gpio_set':
>> drivers/gpio/gpio-pci-idio-16.c:79:9: error: implicit declaration of function 'idio_16_set'; did you mean 'idio_16_gpio_set'? [-Werror=implicit-function-declaration]
      79 |         idio_16_set(idio16gpio->reg, &idio16gpio->state, offset, value);
         |         ^~~~~~~~~~~
         |         idio_16_gpio_set
   drivers/gpio/gpio-pci-idio-16.c: In function 'idio_16_gpio_set_multiple':
>> drivers/gpio/gpio-pci-idio-16.c:87:9: error: implicit declaration of function 'idio_16_set_multiple'; did you mean 'idio_16_gpio_set_multiple'? [-Werror=implicit-function-declaration]
      87 |         idio_16_set_multiple(idio16gpio->reg, &idio16gpio->state, mask, bits);
         |         ^~~~~~~~~~~~~~~~~~~~
         |         idio_16_gpio_set_multiple
   drivers/gpio/gpio-pci-idio-16.c: In function 'idio_16_irq_mask':
>> drivers/gpio/gpio-pci-idio-16.c:106:45: error: invalid use of undefined type 'struct idio_16'
     106 |                 iowrite8(0, &idio16gpio->reg->irq_ctl);
         |                                             ^~
   drivers/gpio/gpio-pci-idio-16.c: In function 'idio_16_irq_unmask':
   drivers/gpio/gpio-pci-idio-16.c:129:41: error: invalid use of undefined type 'struct idio_16'
     129 |                 ioread8(&idio16gpio->reg->irq_ctl);
         |                                         ^~
   drivers/gpio/gpio-pci-idio-16.c: In function 'idio_16_irq_handler':
   drivers/gpio/gpio-pci-idio-16.c:164:46: error: invalid use of undefined type 'struct idio_16'
     164 |         irq_status = ioread8(&idio16gpio->reg->irq_status);
         |                                              ^~
   drivers/gpio/gpio-pci-idio-16.c:178:37: error: invalid use of undefined type 'struct idio_16'
     178 |         iowrite8(0, &idio16gpio->reg->in0_7);
         |                                     ^~
   drivers/gpio/gpio-pci-idio-16.c: In function 'idio_16_irq_init_hw':
   drivers/gpio/gpio-pci-idio-16.c:198:37: error: invalid use of undefined type 'struct idio_16'
     198 |         iowrite8(0, &idio16gpio->reg->irq_ctl);
         |                                     ^~
   drivers/gpio/gpio-pci-idio-16.c:199:37: error: invalid use of undefined type 'struct idio_16'
     199 |         iowrite8(0, &idio16gpio->reg->in0_7);
         |                                     ^~
   drivers/gpio/gpio-pci-idio-16.c: In function 'idio_16_probe':
   drivers/gpio/gpio-pci-idio-16.c:232:37: error: invalid use of undefined type 'struct idio_16'
     232 |         iowrite8(0, &idio16gpio->reg->filter_ctl);
         |                                     ^~
>> drivers/gpio/gpio-pci-idio-16.c:248:9: error: implicit declaration of function 'idio_16_state_init'; did you mean 'file_ra_state_init'? [-Werror=implicit-function-declaration]
     248 |         idio_16_state_init(&idio16gpio->state);
         |         ^~~~~~~~~~~~~~~~~~
         |         file_ra_state_init
   drivers/gpio/gpio-pci-idio-16.c: In function 'idio_16_gpio_get':
   drivers/gpio/gpio-pci-idio-16.c:63:1: error: control reaches end of non-void function [-Werror=return-type]
      63 | }
         | ^
   cc1: some warnings being treated as errors


vim +39 drivers/gpio/gpio-pci-idio-16.c

02e74fc0401ae3f William Breathitt Gray 2017-02-01   19  
02e74fc0401ae3f William Breathitt Gray 2017-02-01   20  /**
02e74fc0401ae3f William Breathitt Gray 2017-02-01   21   * struct idio_16_gpio - GPIO device private data structure
02e74fc0401ae3f William Breathitt Gray 2017-02-01   22   * @chip:	instance of the gpio_chip
02e74fc0401ae3f William Breathitt Gray 2017-02-01   23   * @lock:	synchronization lock to prevent I/O race conditions
02e74fc0401ae3f William Breathitt Gray 2017-02-01   24   * @reg:	I/O address offset for the GPIO device registers
e7f758fa9b7fda8 William Breathitt Gray 2022-09-18   25   * @state:	ACCES IDIO-16 device state
02e74fc0401ae3f William Breathitt Gray 2017-02-01   26   * @irq_mask:	I/O bits affected by interrupts
02e74fc0401ae3f William Breathitt Gray 2017-02-01   27   */
02e74fc0401ae3f William Breathitt Gray 2017-02-01   28  struct idio_16_gpio {
02e74fc0401ae3f William Breathitt Gray 2017-02-01   29  	struct gpio_chip chip;
ea38ce081d15553 Julia Cartwright       2017-03-21   30  	raw_spinlock_t lock;
e7f758fa9b7fda8 William Breathitt Gray 2022-09-18   31  	struct idio_16 __iomem *reg;
e7f758fa9b7fda8 William Breathitt Gray 2022-09-18  @32  	struct idio_16_state state;
02e74fc0401ae3f William Breathitt Gray 2017-02-01   33  	unsigned long irq_mask;
02e74fc0401ae3f William Breathitt Gray 2017-02-01   34  };
02e74fc0401ae3f William Breathitt Gray 2017-02-01   35  
02e74fc0401ae3f William Breathitt Gray 2017-02-01   36  static int idio_16_gpio_get_direction(struct gpio_chip *chip,
02e74fc0401ae3f William Breathitt Gray 2017-02-01   37  	unsigned int offset)
02e74fc0401ae3f William Breathitt Gray 2017-02-01   38  {
e7f758fa9b7fda8 William Breathitt Gray 2022-09-18  @39  	if (idio_16_get_direction(offset))
e42615ec233b30d Matti Vaittinen        2019-11-06   40  		return GPIO_LINE_DIRECTION_IN;
02e74fc0401ae3f William Breathitt Gray 2017-02-01   41  
e42615ec233b30d Matti Vaittinen        2019-11-06   42  	return GPIO_LINE_DIRECTION_OUT;
02e74fc0401ae3f William Breathitt Gray 2017-02-01   43  }
02e74fc0401ae3f William Breathitt Gray 2017-02-01   44  
02e74fc0401ae3f William Breathitt Gray 2017-02-01   45  static int idio_16_gpio_direction_input(struct gpio_chip *chip,
02e74fc0401ae3f William Breathitt Gray 2017-02-01   46  	unsigned int offset)
02e74fc0401ae3f William Breathitt Gray 2017-02-01   47  {
02e74fc0401ae3f William Breathitt Gray 2017-02-01   48  	return 0;
02e74fc0401ae3f William Breathitt Gray 2017-02-01   49  }
02e74fc0401ae3f William Breathitt Gray 2017-02-01   50  
02e74fc0401ae3f William Breathitt Gray 2017-02-01   51  static int idio_16_gpio_direction_output(struct gpio_chip *chip,
02e74fc0401ae3f William Breathitt Gray 2017-02-01   52  	unsigned int offset, int value)
02e74fc0401ae3f William Breathitt Gray 2017-02-01   53  {
02e74fc0401ae3f William Breathitt Gray 2017-02-01   54  	chip->set(chip, offset, value);
02e74fc0401ae3f William Breathitt Gray 2017-02-01   55  	return 0;
02e74fc0401ae3f William Breathitt Gray 2017-02-01   56  }
02e74fc0401ae3f William Breathitt Gray 2017-02-01   57  
02e74fc0401ae3f William Breathitt Gray 2017-02-01   58  static int idio_16_gpio_get(struct gpio_chip *chip, unsigned int offset)
02e74fc0401ae3f William Breathitt Gray 2017-02-01   59  {
02e74fc0401ae3f William Breathitt Gray 2017-02-01   60  	struct idio_16_gpio *const idio16gpio = gpiochip_get_data(chip);
02e74fc0401ae3f William Breathitt Gray 2017-02-01   61  
e7f758fa9b7fda8 William Breathitt Gray 2022-09-18  @62  	return idio_16_get(idio16gpio->reg, &idio16gpio->state, offset);
02e74fc0401ae3f William Breathitt Gray 2017-02-01   63  }
02e74fc0401ae3f William Breathitt Gray 2017-02-01   64  
810ebfc5efca9a0 William Breathitt Gray 2018-03-22   65  static int idio_16_gpio_get_multiple(struct gpio_chip *chip,
810ebfc5efca9a0 William Breathitt Gray 2018-03-22   66  	unsigned long *mask, unsigned long *bits)
810ebfc5efca9a0 William Breathitt Gray 2018-03-22   67  {
810ebfc5efca9a0 William Breathitt Gray 2018-03-22   68  	struct idio_16_gpio *const idio16gpio = gpiochip_get_data(chip);
810ebfc5efca9a0 William Breathitt Gray 2018-03-22   69  
e7f758fa9b7fda8 William Breathitt Gray 2022-09-18  @70  	idio_16_get_multiple(idio16gpio->reg, &idio16gpio->state, mask, bits);
810ebfc5efca9a0 William Breathitt Gray 2018-03-22   71  	return 0;
810ebfc5efca9a0 William Breathitt Gray 2018-03-22   72  }
810ebfc5efca9a0 William Breathitt Gray 2018-03-22   73  
02e74fc0401ae3f William Breathitt Gray 2017-02-01   74  static void idio_16_gpio_set(struct gpio_chip *chip, unsigned int offset,
02e74fc0401ae3f William Breathitt Gray 2017-02-01   75  	int value)
02e74fc0401ae3f William Breathitt Gray 2017-02-01   76  {
02e74fc0401ae3f William Breathitt Gray 2017-02-01   77  	struct idio_16_gpio *const idio16gpio = gpiochip_get_data(chip);
02e74fc0401ae3f William Breathitt Gray 2017-02-01   78  
e7f758fa9b7fda8 William Breathitt Gray 2022-09-18  @79  	idio_16_set(idio16gpio->reg, &idio16gpio->state, offset, value);
02e74fc0401ae3f William Breathitt Gray 2017-02-01   80  }
02e74fc0401ae3f William Breathitt Gray 2017-02-01   81  
02e74fc0401ae3f William Breathitt Gray 2017-02-01   82  static void idio_16_gpio_set_multiple(struct gpio_chip *chip,
02e74fc0401ae3f William Breathitt Gray 2017-02-01   83  	unsigned long *mask, unsigned long *bits)
02e74fc0401ae3f William Breathitt Gray 2017-02-01   84  {
02e74fc0401ae3f William Breathitt Gray 2017-02-01   85  	struct idio_16_gpio *const idio16gpio = gpiochip_get_data(chip);
02e74fc0401ae3f William Breathitt Gray 2017-02-01   86  
e7f758fa9b7fda8 William Breathitt Gray 2022-09-18  @87  	idio_16_set_multiple(idio16gpio->reg, &idio16gpio->state, mask, bits);
2dc7c3c16daac73 William Breathitt Gray 2019-12-04   88  }
02e74fc0401ae3f William Breathitt Gray 2017-02-01   89  
02e74fc0401ae3f William Breathitt Gray 2017-02-01   90  static void idio_16_irq_ack(struct irq_data *data)
02e74fc0401ae3f William Breathitt Gray 2017-02-01   91  {
02e74fc0401ae3f William Breathitt Gray 2017-02-01   92  }
02e74fc0401ae3f William Breathitt Gray 2017-02-01   93  
02e74fc0401ae3f William Breathitt Gray 2017-02-01   94  static void idio_16_irq_mask(struct irq_data *data)
02e74fc0401ae3f William Breathitt Gray 2017-02-01   95  {
02e74fc0401ae3f William Breathitt Gray 2017-02-01   96  	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
02e74fc0401ae3f William Breathitt Gray 2017-02-01   97  	struct idio_16_gpio *const idio16gpio = gpiochip_get_data(chip);
02e74fc0401ae3f William Breathitt Gray 2017-02-01   98  	const unsigned long mask = BIT(irqd_to_hwirq(data));
02e74fc0401ae3f William Breathitt Gray 2017-02-01   99  	unsigned long flags;
02e74fc0401ae3f William Breathitt Gray 2017-02-01  100  
02e74fc0401ae3f William Breathitt Gray 2017-02-01  101  	idio16gpio->irq_mask &= ~mask;
02e74fc0401ae3f William Breathitt Gray 2017-02-01  102  
02e74fc0401ae3f William Breathitt Gray 2017-02-01  103  	if (!idio16gpio->irq_mask) {
ea38ce081d15553 Julia Cartwright       2017-03-21  104  		raw_spin_lock_irqsave(&idio16gpio->lock, flags);
02e74fc0401ae3f William Breathitt Gray 2017-02-01  105  
02e74fc0401ae3f William Breathitt Gray 2017-02-01 @106  		iowrite8(0, &idio16gpio->reg->irq_ctl);
02e74fc0401ae3f William Breathitt Gray 2017-02-01  107  
ea38ce081d15553 Julia Cartwright       2017-03-21  108  		raw_spin_unlock_irqrestore(&idio16gpio->lock, flags);
02e74fc0401ae3f William Breathitt Gray 2017-02-01  109  	}
141d5527568e923 Linus Walleij          2023-03-09  110  
141d5527568e923 Linus Walleij          2023-03-09  111  	gpiochip_disable_irq(chip, irqd_to_hwirq(data));
02e74fc0401ae3f William Breathitt Gray 2017-02-01  112  }
02e74fc0401ae3f William Breathitt Gray 2017-02-01  113  

:::::: The code at line 39 was first introduced by commit
:::::: e7f758fa9b7fda8b91f2e429b2be93ae0b88ac33 gpio: pci-idio-16: Utilize the idio-16 GPIO library

:::::: TO: William Breathitt Gray <william.gray@linaro.org>
:::::: CC: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
