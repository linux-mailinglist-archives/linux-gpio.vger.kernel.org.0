Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA94B15843C
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2020 21:28:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726563AbgBJU2o (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 Feb 2020 15:28:44 -0500
Received: from mga05.intel.com ([192.55.52.43]:48429 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727003AbgBJU2n (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 10 Feb 2020 15:28:43 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 10 Feb 2020 12:28:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,426,1574150400"; 
   d="gz'50?scan'50,208,50";a="405703365"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 10 Feb 2020 12:28:39 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1j1Ffb-0007hL-5U; Tue, 11 Feb 2020 04:28:39 +0800
Date:   Tue, 11 Feb 2020 04:28:15 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     kbuild-all@lists.01.org, linux-gpio@vger.kernel.org
Subject: [gpio:gpio-descriptors-extcon-cleanup 3/4]
 drivers/extcon/extcon-gpio.c:85:2: note: in expansion of macro 'if'
Message-ID: <202002110451.OyQqNeGg%lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="w4rmml7mxrigxtp2"
Content-Disposition: inline
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--w4rmml7mxrigxtp2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git gpio-descriptors-extcon-cleanup
head:   9409cd9bbfba06ffdeea264f2376f7bd0baee63a
commit: ab984ecf4e32c42e497dc38bb06d68b005c7e4d0 [3/4] extcon: gpio: Get connector type from device property
config: parisc-randconfig-a001-20200210 (attached as .config)
compiler: hppa-linux-gcc (GCC) 7.5.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout ab984ecf4e32c42e497dc38bb06d68b005c7e4d0
        # save the attached .config to linux build tree
        GCC_VERSION=7.5.0 make.cross ARCH=parisc 

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from include/linux/dev_printk.h:14:0,
                    from include/linux/device.h:15,
                    from include/linux/extcon.h:21,
                    from include/linux/extcon-provider.h:13,
                    from drivers/extcon/extcon-gpio.c:12:
   drivers/extcon/extcon-gpio.c: In function 'gpio_extcon_probe':
   drivers/extcon/extcon-gpio.c:85:10: error: 'struct gpio_extcon_data' has no member named 'extcon_id'
     if (data->extcon_id > EXTCON_NONE)
             ^
   include/linux/compiler.h:58:52: note: in definition of macro '__trace_if_var'
    #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                       ^~~~
>> drivers/extcon/extcon-gpio.c:85:2: note: in expansion of macro 'if'
     if (data->extcon_id > EXTCON_NONE)
     ^~
   drivers/extcon/extcon-gpio.c:85:10: error: 'struct gpio_extcon_data' has no member named 'extcon_id'
     if (data->extcon_id > EXTCON_NONE)
             ^
   include/linux/compiler.h:58:61: note: in definition of macro '__trace_if_var'
    #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                ^~~~
>> drivers/extcon/extcon-gpio.c:85:2: note: in expansion of macro 'if'
     if (data->extcon_id > EXTCON_NONE)
     ^~
   drivers/extcon/extcon-gpio.c:85:10: error: 'struct gpio_extcon_data' has no member named 'extcon_id'
     if (data->extcon_id > EXTCON_NONE)
             ^
   include/linux/compiler.h:69:3: note: in definition of macro '__trace_if_value'
     (cond) ?     \
      ^~~~
   include/linux/compiler.h:56:28: note: in expansion of macro '__trace_if_var'
    #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                               ^~~~~~~~~~~~~~
>> drivers/extcon/extcon-gpio.c:85:2: note: in expansion of macro 'if'
     if (data->extcon_id > EXTCON_NONE)
     ^~

vim +/if +85 drivers/extcon/extcon-gpio.c

176aa36012135d drivers/extcon/extcon-gpio.c Chanwoo Choi   2017-09-21  @12  #include <linux/extcon-provider.h>
de992acb93df41 drivers/extcon/extcon-gpio.c Chanwoo Choi   2015-09-30   13  #include <linux/gpio/consumer.h>
be48308a24c765 drivers/extcon/extcon_gpio.c MyungJoo Ham   2012-04-20   14  #include <linux/init.h>
be48308a24c765 drivers/extcon/extcon_gpio.c MyungJoo Ham   2012-04-20   15  #include <linux/interrupt.h>
62364357c184db drivers/extcon/extcon-gpio.c George Cherian 2014-09-09   16  #include <linux/kernel.h>
62364357c184db drivers/extcon/extcon-gpio.c George Cherian 2014-09-09   17  #include <linux/module.h>
be48308a24c765 drivers/extcon/extcon_gpio.c MyungJoo Ham   2012-04-20   18  #include <linux/platform_device.h>
17ca6c83c514ff drivers/extcon/extcon-gpio.c Linus Walleij  2017-09-24   19  #include <linux/property.h>
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
ab984ecf4e32c4 drivers/extcon/extcon-gpio.c Linus Walleij  2017-09-24   30   * @connector_type:	The connector type we're detecting on this extcon, terminated with EXTCON_NONE
ab984ecf4e32c4 drivers/extcon/extcon-gpio.c Linus Walleij  2017-09-24   31   *			One GPIO is one cable, so one type only.
66afdedf269cf4 drivers/extcon/extcon-gpio.c Linus Walleij  2018-02-12   32   * @check_on_resume:	Boolean describing whether to check the state of gpio
66afdedf269cf4 drivers/extcon/extcon-gpio.c Linus Walleij  2018-02-12   33   *			while resuming from sleep.
66afdedf269cf4 drivers/extcon/extcon-gpio.c Linus Walleij  2018-02-12   34   */
be48308a24c765 drivers/extcon/extcon_gpio.c MyungJoo Ham   2012-04-20   35  struct gpio_extcon_data {
60cd62d4f7d681 drivers/extcon/extcon-gpio.c Chanwoo Choi   2014-04-21   36  	struct extcon_dev *edev;
be48308a24c765 drivers/extcon/extcon_gpio.c MyungJoo Ham   2012-04-20   37  	struct delayed_work work;
be48308a24c765 drivers/extcon/extcon_gpio.c MyungJoo Ham   2012-04-20   38  	unsigned long debounce_jiffies;
d368e7de5e8bac drivers/extcon/extcon-gpio.c Linus Walleij  2018-02-12   39  	struct gpio_desc *gpiod;
ab984ecf4e32c4 drivers/extcon/extcon-gpio.c Linus Walleij  2017-09-24   40  	unsigned int connector_type[2];
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
ab984ecf4e32c4 drivers/extcon/extcon-gpio.c Linus Walleij  2017-09-24   52  	extcon_set_state_sync(data->edev, data->connector_type[0], state);
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
17ca6c83c514ff drivers/extcon/extcon-gpio.c Linus Walleij  2017-09-24   69  	u32 debounce_usecs;
ab984ecf4e32c4 drivers/extcon/extcon-gpio.c Linus Walleij  2017-09-24   70  	u32 connector_type;
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
ab984ecf4e32c4 drivers/extcon/extcon-gpio.c Linus Walleij  2017-09-24  106  	ret = device_property_read_u32(dev, "extcon-connector-types", &connector_type);
ab984ecf4e32c4 drivers/extcon/extcon-gpio.c Linus Walleij  2017-09-24  107  	if (ret || !connector_type) {
ab984ecf4e32c4 drivers/extcon/extcon-gpio.c Linus Walleij  2017-09-24  108  		dev_err(dev, "illegal cable type or undefined cable type\n");
ab984ecf4e32c4 drivers/extcon/extcon-gpio.c Linus Walleij  2017-09-24  109  		return -EINVAL;
ab984ecf4e32c4 drivers/extcon/extcon-gpio.c Linus Walleij  2017-09-24  110  	}
ab984ecf4e32c4 drivers/extcon/extcon-gpio.c Linus Walleij  2017-09-24  111  	data->connector_type[0] = connector_type;
ab984ecf4e32c4 drivers/extcon/extcon-gpio.c Linus Walleij  2017-09-24  112  	data->connector_type[1] = EXTCON_NONE;
ab984ecf4e32c4 drivers/extcon/extcon-gpio.c Linus Walleij  2017-09-24  113  
de992acb93df41 drivers/extcon/extcon-gpio.c Chanwoo Choi   2015-09-30  114  	/* Allocate the memory of extcon devie and register extcon device */
ab984ecf4e32c4 drivers/extcon/extcon-gpio.c Linus Walleij  2017-09-24  115  	data->edev = devm_extcon_dev_allocate(dev, data->connector_type);
de992acb93df41 drivers/extcon/extcon-gpio.c Chanwoo Choi   2015-09-30  116  	if (IS_ERR(data->edev)) {
d368e7de5e8bac drivers/extcon/extcon-gpio.c Linus Walleij  2018-02-12  117  		dev_err(dev, "failed to allocate extcon device\n");
de992acb93df41 drivers/extcon/extcon-gpio.c Chanwoo Choi   2015-09-30  118  		return -ENOMEM;
338de0ca682ca9 drivers/extcon/extcon-gpio.c Guenter Roeck  2013-09-10  119  	}
be48308a24c765 drivers/extcon/extcon_gpio.c MyungJoo Ham   2012-04-20  120  
17ca6c83c514ff drivers/extcon/extcon-gpio.c Linus Walleij  2017-09-24  121  	ret = device_property_read_u32(dev, "input-debounce", &debounce_usecs);
17ca6c83c514ff drivers/extcon/extcon-gpio.c Linus Walleij  2017-09-24  122  	if (ret || !debounce_usecs) {
17ca6c83c514ff drivers/extcon/extcon-gpio.c Linus Walleij  2017-09-24  123  		dev_err(dev, "illegal debounce value, set to 20 ms\n");
17ca6c83c514ff drivers/extcon/extcon-gpio.c Linus Walleij  2017-09-24  124  		debounce_usecs = 20000;
17ca6c83c514ff drivers/extcon/extcon-gpio.c Linus Walleij  2017-09-24  125  	}
17ca6c83c514ff drivers/extcon/extcon-gpio.c Linus Walleij  2017-09-24  126  	ret = gpiod_set_debounce(data->gpiod, debounce_usecs);
17ca6c83c514ff drivers/extcon/extcon-gpio.c Linus Walleij  2017-09-24  127  	if (ret)
17ca6c83c514ff drivers/extcon/extcon-gpio.c Linus Walleij  2017-09-24  128  		data->debounce_jiffies = msecs_to_jiffies(debounce_usecs * 1000);
17ca6c83c514ff drivers/extcon/extcon-gpio.c Linus Walleij  2017-09-24  129  
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
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--w4rmml7mxrigxtp2
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
b2H+B941o48LugEA

--w4rmml7mxrigxtp2--
