Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7CB2120EA3
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2019 16:55:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727162AbfLPPz3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Dec 2019 10:55:29 -0500
Received: from mga07.intel.com ([134.134.136.100]:55141 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726996AbfLPPz3 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 16 Dec 2019 10:55:29 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 16 Dec 2019 07:55:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,322,1571727600"; 
   d="gz'50?scan'50,208,50";a="389498273"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 16 Dec 2019 07:55:25 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1igsiS-000CFW-M8; Mon, 16 Dec 2019 23:55:24 +0800
Date:   Mon, 16 Dec 2019 23:55:11 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     kbuild-all@lists.01.org, linux-gpio@vger.kernel.org
Subject: [gpio:gpio-descriptors-extcon-cleanup 3/4]
 drivers//extcon/extcon-gpio.c:85:2: note: in expansion of macro 'if'
Message-ID: <201912162314.1e8pcS35%lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="pteu5kh4y5utdwbi"
Content-Disposition: inline
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--pteu5kh4y5utdwbi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git gpio-descriptors-extcon-cleanup
head:   2a274a829acc697fccfb2d787cefd9e1f2fcbf68
commit: a7ed940e7a2516e72eb0f802dfd42936cd247ba9 [3/4] extcon: gpio: Get connector type from device property
config: sparc64-randconfig-a001-20191216 (attached as .config)
compiler: sparc64-linux-gcc (GCC) 7.5.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout a7ed940e7a2516e72eb0f802dfd42936cd247ba9
        # save the attached .config to linux build tree
        GCC_VERSION=7.5.0 make.cross ARCH=sparc64 

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from include/linux/ioport.h:13:0,
                    from include/linux/device.h:15,
                    from include/linux/extcon.h:21,
                    from include/linux/extcon-provider.h:13,
                    from drivers//extcon/extcon-gpio.c:12:
   drivers//extcon/extcon-gpio.c: In function 'gpio_extcon_probe':
   drivers//extcon/extcon-gpio.c:85:10: error: 'struct gpio_extcon_data' has no member named 'extcon_id'
     if (data->extcon_id > EXTCON_NONE)
             ^
   include/linux/compiler.h:58:52: note: in definition of macro '__trace_if_var'
    #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                       ^~~~
>> drivers//extcon/extcon-gpio.c:85:2: note: in expansion of macro 'if'
     if (data->extcon_id > EXTCON_NONE)
     ^~
   drivers//extcon/extcon-gpio.c:85:10: error: 'struct gpio_extcon_data' has no member named 'extcon_id'
     if (data->extcon_id > EXTCON_NONE)
             ^
   include/linux/compiler.h:58:61: note: in definition of macro '__trace_if_var'
    #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                ^~~~
>> drivers//extcon/extcon-gpio.c:85:2: note: in expansion of macro 'if'
     if (data->extcon_id > EXTCON_NONE)
     ^~
   drivers//extcon/extcon-gpio.c:85:10: error: 'struct gpio_extcon_data' has no member named 'extcon_id'
     if (data->extcon_id > EXTCON_NONE)
             ^
   include/linux/compiler.h:69:3: note: in definition of macro '__trace_if_value'
     (cond) ?     \
      ^~~~
   include/linux/compiler.h:56:28: note: in expansion of macro '__trace_if_var'
    #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                               ^~~~~~~~~~~~~~
>> drivers//extcon/extcon-gpio.c:85:2: note: in expansion of macro 'if'
     if (data->extcon_id > EXTCON_NONE)
     ^~

vim +/if +85 drivers//extcon/extcon-gpio.c

176aa36012135d drivers/extcon/extcon-gpio.c Chanwoo Choi   2017-09-21  @12  #include <linux/extcon-provider.h>
de992acb93df41 drivers/extcon/extcon-gpio.c Chanwoo Choi   2015-09-30   13  #include <linux/gpio/consumer.h>
be48308a24c765 drivers/extcon/extcon_gpio.c MyungJoo Ham   2012-04-20   14  #include <linux/init.h>
be48308a24c765 drivers/extcon/extcon_gpio.c MyungJoo Ham   2012-04-20   15  #include <linux/interrupt.h>
62364357c184db drivers/extcon/extcon-gpio.c George Cherian 2014-09-09   16  #include <linux/kernel.h>
62364357c184db drivers/extcon/extcon-gpio.c George Cherian 2014-09-09   17  #include <linux/module.h>
be48308a24c765 drivers/extcon/extcon_gpio.c MyungJoo Ham   2012-04-20   18  #include <linux/platform_device.h>
8ae797861610b9 drivers/extcon/extcon-gpio.c Linus Walleij  2017-09-24   19  #include <linux/property.h>
be48308a24c765 drivers/extcon/extcon_gpio.c MyungJoo Ham   2012-04-20   20  #include <linux/slab.h>
be48308a24c765 drivers/extcon/extcon_gpio.c MyungJoo Ham   2012-04-20   21  #include <linux/workqueue.h>
be48308a24c765 drivers/extcon/extcon_gpio.c MyungJoo Ham   2012-04-20   22  
66afdedf269cf4 drivers/extcon/extcon-gpio.c Linus Walleij  2018-02-12   23  /**
a62300d99f15c4 drivers/extcon/extcon-gpio.c Linus Walleij  2018-02-12   24   * struct gpio_extcon_data - A simple GPIO-controlled extcon device state container.
a62300d99f15c4 drivers/extcon/extcon-gpio.c Linus Walleij  2018-02-12   25   * @edev:		Extcon device.
a62300d99f15c4 drivers/extcon/extcon-gpio.c Linus Walleij  2018-02-12   26   * @work:		Work fired by the interrupt.
a62300d99f15c4 drivers/extcon/extcon-gpio.c Linus Walleij  2018-02-12   27   * @debounce_jiffies:	Number of jiffies to wait for the GPIO to stabilize, from the debounce
a62300d99f15c4 drivers/extcon/extcon-gpio.c Linus Walleij  2018-02-12   28   *			value.
d368e7de5e8bac drivers/extcon/extcon-gpio.c Linus Walleij  2018-02-12   29   * @gpiod:		GPIO descriptor for this external connector.
a7ed940e7a2516 drivers/extcon/extcon-gpio.c Linus Walleij  2017-09-24   30   * @connector_type:	The connector type we're detecting on this extcon, terminated with EXTCON_NONE
a7ed940e7a2516 drivers/extcon/extcon-gpio.c Linus Walleij  2017-09-24   31   *			One GPIO is one cable, so one type only.
66afdedf269cf4 drivers/extcon/extcon-gpio.c Linus Walleij  2018-02-12   32   * @check_on_resume:	Boolean describing whether to check the state of gpio
66afdedf269cf4 drivers/extcon/extcon-gpio.c Linus Walleij  2018-02-12   33   *			while resuming from sleep.
66afdedf269cf4 drivers/extcon/extcon-gpio.c Linus Walleij  2018-02-12   34   */
be48308a24c765 drivers/extcon/extcon_gpio.c MyungJoo Ham   2012-04-20   35  struct gpio_extcon_data {
60cd62d4f7d681 drivers/extcon/extcon-gpio.c Chanwoo Choi   2014-04-21   36  	struct extcon_dev *edev;
be48308a24c765 drivers/extcon/extcon_gpio.c MyungJoo Ham   2012-04-20   37  	struct delayed_work work;
be48308a24c765 drivers/extcon/extcon_gpio.c MyungJoo Ham   2012-04-20   38  	unsigned long debounce_jiffies;
d368e7de5e8bac drivers/extcon/extcon-gpio.c Linus Walleij  2018-02-12   39  	struct gpio_desc *gpiod;
a7ed940e7a2516 drivers/extcon/extcon-gpio.c Linus Walleij  2017-09-24   40  	unsigned int connector_type[2];
a62300d99f15c4 drivers/extcon/extcon-gpio.c Linus Walleij  2018-02-12   41  	bool check_on_resume;
be48308a24c765 drivers/extcon/extcon_gpio.c MyungJoo Ham   2012-04-20   42  };
be48308a24c765 drivers/extcon/extcon_gpio.c MyungJoo Ham   2012-04-20   43  
be48308a24c765 drivers/extcon/extcon_gpio.c MyungJoo Ham   2012-04-20   44  static void gpio_extcon_work(struct work_struct *work)
be48308a24c765 drivers/extcon/extcon_gpio.c MyungJoo Ham   2012-04-20   45  {
be48308a24c765 drivers/extcon/extcon_gpio.c MyungJoo Ham   2012-04-20   46  	int state;
be48308a24c765 drivers/extcon/extcon_gpio.c MyungJoo Ham   2012-04-20   47  	struct gpio_extcon_data	*data =
be48308a24c765 drivers/extcon/extcon_gpio.c MyungJoo Ham   2012-04-20   48  		container_of(to_delayed_work(work), struct gpio_extcon_data,
be48308a24c765 drivers/extcon/extcon_gpio.c MyungJoo Ham   2012-04-20   49  			     work);
be48308a24c765 drivers/extcon/extcon_gpio.c MyungJoo Ham   2012-04-20   50  
d368e7de5e8bac drivers/extcon/extcon-gpio.c Linus Walleij  2018-02-12   51  	state = gpiod_get_value_cansleep(data->gpiod);
a7ed940e7a2516 drivers/extcon/extcon-gpio.c Linus Walleij  2017-09-24   52  	extcon_set_state_sync(data->edev, data->connector_type[0], state);
be48308a24c765 drivers/extcon/extcon_gpio.c MyungJoo Ham   2012-04-20   53  }
be48308a24c765 drivers/extcon/extcon_gpio.c MyungJoo Ham   2012-04-20   54  
be48308a24c765 drivers/extcon/extcon_gpio.c MyungJoo Ham   2012-04-20   55  static irqreturn_t gpio_irq_handler(int irq, void *dev_id)
be48308a24c765 drivers/extcon/extcon_gpio.c MyungJoo Ham   2012-04-20   56  {
60f9b9e65c82cc drivers/extcon/extcon-gpio.c Chanwoo Choi   2015-09-29   57  	struct gpio_extcon_data *data = dev_id;
be48308a24c765 drivers/extcon/extcon_gpio.c MyungJoo Ham   2012-04-20   58  
60f9b9e65c82cc drivers/extcon/extcon-gpio.c Chanwoo Choi   2015-09-29   59  	queue_delayed_work(system_power_efficient_wq, &data->work,
60f9b9e65c82cc drivers/extcon/extcon-gpio.c Chanwoo Choi   2015-09-29   60  			      data->debounce_jiffies);
be48308a24c765 drivers/extcon/extcon_gpio.c MyungJoo Ham   2012-04-20   61  	return IRQ_HANDLED;
be48308a24c765 drivers/extcon/extcon_gpio.c MyungJoo Ham   2012-04-20   62  }
be48308a24c765 drivers/extcon/extcon_gpio.c MyungJoo Ham   2012-04-20   63  
44f34fd4a7f804 drivers/extcon/extcon-gpio.c Bill Pemberton 2012-11-19   64  static int gpio_extcon_probe(struct platform_device *pdev)
be48308a24c765 drivers/extcon/extcon_gpio.c MyungJoo Ham   2012-04-20   65  {
60f9b9e65c82cc drivers/extcon/extcon-gpio.c Chanwoo Choi   2015-09-29   66  	struct gpio_extcon_data *data;
d368e7de5e8bac drivers/extcon/extcon-gpio.c Linus Walleij  2018-02-12   67  	struct device *dev = &pdev->dev;
8bc4810b435a33 drivers/extcon/extcon-gpio.c Linus Walleij  2019-05-30   68  	unsigned long irq_flags;
8ae797861610b9 drivers/extcon/extcon-gpio.c Linus Walleij  2017-09-24   69  	u32 debounce_usecs;
a7ed940e7a2516 drivers/extcon/extcon-gpio.c Linus Walleij  2017-09-24   70  	u32 connector_type;
8bc4810b435a33 drivers/extcon/extcon-gpio.c Linus Walleij  2019-05-30   71  	int irq;
1073514b11c221 drivers/extcon/extcon-gpio.c Guenter Roeck  2013-08-29   72  	int ret;
be48308a24c765 drivers/extcon/extcon_gpio.c MyungJoo Ham   2012-04-20   73  
d368e7de5e8bac drivers/extcon/extcon-gpio.c Linus Walleij  2018-02-12   74  	data = devm_kzalloc(dev, sizeof(struct gpio_extcon_data), GFP_KERNEL);
60f9b9e65c82cc drivers/extcon/extcon-gpio.c Chanwoo Choi   2015-09-29   75  	if (!data)
be48308a24c765 drivers/extcon/extcon_gpio.c MyungJoo Ham   2012-04-20   76  		return -ENOMEM;
a62300d99f15c4 drivers/extcon/extcon-gpio.c Linus Walleij  2018-02-12   77  
a62300d99f15c4 drivers/extcon/extcon-gpio.c Linus Walleij  2018-02-12   78  	/*
a62300d99f15c4 drivers/extcon/extcon-gpio.c Linus Walleij  2018-02-12   79  	 * FIXME: extcon_id represents the unique identifier of external
a62300d99f15c4 drivers/extcon/extcon-gpio.c Linus Walleij  2018-02-12   80  	 * connectors such as EXTCON_USB, EXTCON_DISP_HDMI and so on. extcon_id
a62300d99f15c4 drivers/extcon/extcon-gpio.c Linus Walleij  2018-02-12   81  	 * is necessary to register the extcon device. But, it's not yet
a62300d99f15c4 drivers/extcon/extcon-gpio.c Linus Walleij  2018-02-12   82  	 * developed to get the extcon id from device-tree or others.
a62300d99f15c4 drivers/extcon/extcon-gpio.c Linus Walleij  2018-02-12   83  	 * On later, it have to be solved.
a62300d99f15c4 drivers/extcon/extcon-gpio.c Linus Walleij  2018-02-12   84  	 */
8bc4810b435a33 drivers/extcon/extcon-gpio.c Linus Walleij  2019-05-30  @85  	if (data->extcon_id > EXTCON_NONE)
a62300d99f15c4 drivers/extcon/extcon-gpio.c Linus Walleij  2018-02-12   86  		return -EINVAL;
60cd62d4f7d681 drivers/extcon/extcon-gpio.c Chanwoo Choi   2014-04-21   87  
d368e7de5e8bac drivers/extcon/extcon-gpio.c Linus Walleij  2018-02-12   88  	data->gpiod = devm_gpiod_get(dev, "extcon", GPIOD_IN);
d368e7de5e8bac drivers/extcon/extcon-gpio.c Linus Walleij  2018-02-12   89  	if (IS_ERR(data->gpiod))
d368e7de5e8bac drivers/extcon/extcon-gpio.c Linus Walleij  2018-02-12   90  		return PTR_ERR(data->gpiod);
8bc4810b435a33 drivers/extcon/extcon-gpio.c Linus Walleij  2019-05-30   91  	irq = gpiod_to_irq(data->gpiod);
8bc4810b435a33 drivers/extcon/extcon-gpio.c Linus Walleij  2019-05-30   92  	if (irq <= 0)
8bc4810b435a33 drivers/extcon/extcon-gpio.c Linus Walleij  2019-05-30   93  		return irq;
8bc4810b435a33 drivers/extcon/extcon-gpio.c Linus Walleij  2019-05-30   94  
8bc4810b435a33 drivers/extcon/extcon-gpio.c Linus Walleij  2019-05-30   95  	/*
8bc4810b435a33 drivers/extcon/extcon-gpio.c Linus Walleij  2019-05-30   96  	 * It is unlikely that this is an acknowledged interrupt that goes
8bc4810b435a33 drivers/extcon/extcon-gpio.c Linus Walleij  2019-05-30   97  	 * away after handling, what we are looking for are falling edges
8bc4810b435a33 drivers/extcon/extcon-gpio.c Linus Walleij  2019-05-30   98  	 * if the signal is active low, and rising edges if the signal is
8bc4810b435a33 drivers/extcon/extcon-gpio.c Linus Walleij  2019-05-30   99  	 * active high.
8bc4810b435a33 drivers/extcon/extcon-gpio.c Linus Walleij  2019-05-30  100  	 */
8bc4810b435a33 drivers/extcon/extcon-gpio.c Linus Walleij  2019-05-30  101  	if (gpiod_is_active_low(data->gpiod))
8bc4810b435a33 drivers/extcon/extcon-gpio.c Linus Walleij  2019-05-30  102  		irq_flags = IRQF_TRIGGER_FALLING;
8bc4810b435a33 drivers/extcon/extcon-gpio.c Linus Walleij  2019-05-30  103  	else
8bc4810b435a33 drivers/extcon/extcon-gpio.c Linus Walleij  2019-05-30  104  		irq_flags = IRQF_TRIGGER_RISING;
4288d9b8edcec7 drivers/extcon/extcon-gpio.c Guenter Roeck  2013-11-22  105  
a7ed940e7a2516 drivers/extcon/extcon-gpio.c Linus Walleij  2017-09-24  106  	ret = device_property_read_u32(dev, "extcon-connector-types", &connector_type);
a7ed940e7a2516 drivers/extcon/extcon-gpio.c Linus Walleij  2017-09-24  107  	if (ret || !connector_type) {
a7ed940e7a2516 drivers/extcon/extcon-gpio.c Linus Walleij  2017-09-24  108  		dev_err(dev, "illegal cable type or undefined cable type\n");
a7ed940e7a2516 drivers/extcon/extcon-gpio.c Linus Walleij  2017-09-24  109  		return -EINVAL;
a7ed940e7a2516 drivers/extcon/extcon-gpio.c Linus Walleij  2017-09-24  110  	}
a7ed940e7a2516 drivers/extcon/extcon-gpio.c Linus Walleij  2017-09-24  111  	data->connector_type[0] = connector_type;
a7ed940e7a2516 drivers/extcon/extcon-gpio.c Linus Walleij  2017-09-24  112  	data->connector_type[1] = EXTCON_NONE;
a7ed940e7a2516 drivers/extcon/extcon-gpio.c Linus Walleij  2017-09-24  113  
de992acb93df41 drivers/extcon/extcon-gpio.c Chanwoo Choi   2015-09-30  114  	/* Allocate the memory of extcon devie and register extcon device */
a7ed940e7a2516 drivers/extcon/extcon-gpio.c Linus Walleij  2017-09-24  115  	data->edev = devm_extcon_dev_allocate(dev, data->connector_type);
de992acb93df41 drivers/extcon/extcon-gpio.c Chanwoo Choi   2015-09-30  116  	if (IS_ERR(data->edev)) {
d368e7de5e8bac drivers/extcon/extcon-gpio.c Linus Walleij  2018-02-12  117  		dev_err(dev, "failed to allocate extcon device\n");
de992acb93df41 drivers/extcon/extcon-gpio.c Chanwoo Choi   2015-09-30  118  		return -ENOMEM;
338de0ca682ca9 drivers/extcon/extcon-gpio.c Guenter Roeck  2013-09-10  119  	}
be48308a24c765 drivers/extcon/extcon_gpio.c MyungJoo Ham   2012-04-20  120  
8ae797861610b9 drivers/extcon/extcon-gpio.c Linus Walleij  2017-09-24  121  	ret = device_property_read_u32(dev, "input-debounce", &debounce_usecs);
8ae797861610b9 drivers/extcon/extcon-gpio.c Linus Walleij  2017-09-24  122  	if (ret || !debounce_usecs) {
8ae797861610b9 drivers/extcon/extcon-gpio.c Linus Walleij  2017-09-24  123  		dev_err(dev, "illegal debounce value, set to 20 ms\n");
8ae797861610b9 drivers/extcon/extcon-gpio.c Linus Walleij  2017-09-24  124  		debounce_usecs = 20000;
8ae797861610b9 drivers/extcon/extcon-gpio.c Linus Walleij  2017-09-24  125  	}
8ae797861610b9 drivers/extcon/extcon-gpio.c Linus Walleij  2017-09-24  126  	ret = gpiod_set_debounce(data->gpiod, debounce_usecs);
8ae797861610b9 drivers/extcon/extcon-gpio.c Linus Walleij  2017-09-24  127  	if (ret)
8ae797861610b9 drivers/extcon/extcon-gpio.c Linus Walleij  2017-09-24  128  		data->debounce_jiffies = msecs_to_jiffies(debounce_usecs * 1000);
8ae797861610b9 drivers/extcon/extcon-gpio.c Linus Walleij  2017-09-24  129  
d368e7de5e8bac drivers/extcon/extcon-gpio.c Linus Walleij  2018-02-12  130  	ret = devm_extcon_dev_register(dev, data->edev);
be48308a24c765 drivers/extcon/extcon_gpio.c MyungJoo Ham   2012-04-20  131  	if (ret < 0)
01eaf2458773b2 drivers/extcon/extcon_gpio.c Axel Lin       2012-06-16  132  		return ret;
be48308a24c765 drivers/extcon/extcon_gpio.c MyungJoo Ham   2012-04-20  133  
60f9b9e65c82cc drivers/extcon/extcon-gpio.c Chanwoo Choi   2015-09-29  134  	INIT_DELAYED_WORK(&data->work, gpio_extcon_work);
be48308a24c765 drivers/extcon/extcon_gpio.c MyungJoo Ham   2012-04-20  135  
de992acb93df41 drivers/extcon/extcon-gpio.c Chanwoo Choi   2015-09-30  136  	/*
b51b387020ee1c drivers/extcon/extcon-gpio.c Moritz Fischer 2015-12-23  137  	 * Request the interrupt of gpio to detect whether external connector
de992acb93df41 drivers/extcon/extcon-gpio.c Chanwoo Choi   2015-09-30  138  	 * is attached or detached.
de992acb93df41 drivers/extcon/extcon-gpio.c Chanwoo Choi   2015-09-30  139  	 */
8bc4810b435a33 drivers/extcon/extcon-gpio.c Linus Walleij  2019-05-30  140  	ret = devm_request_any_context_irq(dev, irq,
8bc4810b435a33 drivers/extcon/extcon-gpio.c Linus Walleij  2019-05-30  141  					gpio_irq_handler, irq_flags,
60f9b9e65c82cc drivers/extcon/extcon-gpio.c Chanwoo Choi   2015-09-29  142  					pdev->name, data);
be48308a24c765 drivers/extcon/extcon_gpio.c MyungJoo Ham   2012-04-20  143  	if (ret < 0)
d92c2f12f8a940 drivers/extcon/extcon-gpio.c Sangjung Woo   2014-04-21  144  		return ret;
be48308a24c765 drivers/extcon/extcon_gpio.c MyungJoo Ham   2012-04-20  145  
60f9b9e65c82cc drivers/extcon/extcon-gpio.c Chanwoo Choi   2015-09-29  146  	platform_set_drvdata(pdev, data);
be48308a24c765 drivers/extcon/extcon_gpio.c MyungJoo Ham   2012-04-20  147  	/* Perform initial detection */
60f9b9e65c82cc drivers/extcon/extcon-gpio.c Chanwoo Choi   2015-09-29  148  	gpio_extcon_work(&data->work.work);
be48308a24c765 drivers/extcon/extcon_gpio.c MyungJoo Ham   2012-04-20  149  
be48308a24c765 drivers/extcon/extcon_gpio.c MyungJoo Ham   2012-04-20  150  	return 0;
be48308a24c765 drivers/extcon/extcon_gpio.c MyungJoo Ham   2012-04-20  151  }
be48308a24c765 drivers/extcon/extcon_gpio.c MyungJoo Ham   2012-04-20  152  

:::::: The code at line 85 was first introduced by commit
:::::: 8bc4810b435a3338346efd70e94c4d6fd0863635 extcon: gpio: Request reasonable interrupts

:::::: TO: Linus Walleij <linus.walleij@linaro.org>
:::::: CC: Chanwoo Choi <cw00.choi@samsung.com>

---
0-DAY kernel test infrastructure                 Open Source Technology Center
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org Intel Corporation

--pteu5kh4y5utdwbi
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
vAEA

--pteu5kh4y5utdwbi--
