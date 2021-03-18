Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 145D6341045
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Mar 2021 23:19:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231846AbhCRWTA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 Mar 2021 18:19:00 -0400
Received: from mga12.intel.com ([192.55.52.136]:7637 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231671AbhCRWS7 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 18 Mar 2021 18:18:59 -0400
IronPort-SDR: ZTKnjdI63jeE3kDqjuEA5i8Rvmyyi/NvgRddxBc2AGKSgSsxvQbA3AxywmjouRl3YZci6dWmcp
 f4H9mYHrubtw==
X-IronPort-AV: E=McAfee;i="6000,8403,9927"; a="169076801"
X-IronPort-AV: E=Sophos;i="5.81,259,1610438400"; 
   d="gz'50?scan'50,208,50";a="169076801"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2021 15:18:59 -0700
IronPort-SDR: lThA1bV8CZVfv5ZzILIaiooVG4ZexUDbKrf925bTI3gXUqWG7a4Pgt/AVwpQis5XZ61YviM3KZ
 UEk8YIvaROMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,259,1610438400"; 
   d="gz'50?scan'50,208,50";a="374726549"
Received: from lkp-server02.sh.intel.com (HELO 1c294c63cb86) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 18 Mar 2021 15:18:55 -0700
Received: from kbuild by 1c294c63cb86 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lN0yl-0001Rp-8H; Thu, 18 Mar 2021 22:18:55 +0000
Date:   Fri, 19 Mar 2021 06:17:53 +0800
From:   kernel test robot <lkp@intel.com>
To:     Alexander A Sverdlin <alexander.sverdlin@nokia.com>,
        linux-gpio@vger.kernel.org
Cc:     kbuild-all@lists.01.org,
        Alexander Sverdlin <alexander.sverdlin@nokia.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-kernel@vger.kernel.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2] gpio: pl061: Support implementations without GPIOINTR
 line
Message-ID: <202103190623.havoHNqq-lkp@intel.com>
References: <20210318191040.48575-1-alexander.sverdlin@nokia.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="M9NhX3UHpAaciwkO"
Content-Disposition: inline
In-Reply-To: <20210318191040.48575-1-alexander.sverdlin@nokia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--M9NhX3UHpAaciwkO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alexander,

I love your patch! Yet something to improve:

[auto build test ERROR on gpio/for-next]
[also build test ERROR on v5.12-rc3 next-20210318]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Alexander-A-Sverdlin/gpio-pl061-Support-implementations-without-GPIOINTR-line/20210319-031352
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git for-next
config: arm-randconfig-r006-20210318 (attached as .config)
compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/bbac642db33d1e12c5a11a9630822bf16706c988
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Alexander-A-Sverdlin/gpio-pl061-Support-implementations-without-GPIOINTR-line/20210319-031352
        git checkout bbac642db33d1e12c5a11a9630822bf16706c988
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=arm 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

>> drivers/gpio/gpio-pl061.c:305:6: warning: no previous prototype for 'pl061_populate_parent_fwspec' [-Wmissing-prototypes]
     305 | void pl061_populate_parent_fwspec(struct gpio_chip *gc,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-pl061.c: In function 'pl061_probe':
>> drivers/gpio/gpio-pl061.c:416:9: error: 'struct gpio_irq_chip' has no member named 'populate_parent_fwspec'; did you mean 'populate_parent_alloc_arg'?
     416 |   girq->populate_parent_fwspec = pl061_populate_parent_fwspec;
         |         ^~~~~~~~~~~~~~~~~~~~~~
         |         populate_parent_alloc_arg


vim +416 drivers/gpio/gpio-pl061.c

   303	
   304	#ifdef CONFIG_OF
 > 305	void pl061_populate_parent_fwspec(struct gpio_chip *gc,
   306					  struct irq_fwspec *fwspec,
   307					  unsigned int parent_hwirq,
   308					  unsigned int parent_type)
   309	{
   310		struct device_node *dn = to_of_node(gc->irq.fwnode);
   311		struct of_phandle_args pha;
   312		int i;
   313	
   314		fwspec->param_count = 0;
   315	
   316		if (WARN_ON(!dn))
   317			return;
   318	
   319		/*
   320		 * This brute-force here is because of the fact PL061 is often paired
   321		 * with GIC-v3, which has 3-cell IRQ specifier (SPI/PPI selection), and
   322		 * unexpected range shifts in hwirq mapping (SPI IRQs are shifted by
   323		 * 32). So this is about reversing of gic_irq_domain_translate().
   324		 */
   325		for (i = 0; i < PL061_GPIO_NR; i++) {
   326			unsigned int p, pt;
   327	
   328			if (pl061_child_to_parent_hwirq(gc, i, parent_type, &p, &pt))
   329				continue;
   330			if (p == parent_hwirq)
   331				break;
   332		}
   333		if (WARN_ON(i == PL061_GPIO_NR))
   334			return;
   335	
   336		if (WARN_ON(of_irq_parse_one(dn, i, &pha)))
   337			return;
   338	
   339		fwspec->param_count = pha.args_count;
   340		for (i = 0; i < pha.args_count; i++)
   341			fwspec->param[i] = pha.args[i];
   342	}
   343	#endif
   344	
   345	static int pl061_probe(struct amba_device *adev, const struct amba_id *id)
   346	{
   347		struct device *dev = &adev->dev;
   348		struct pl061 *pl061;
   349		struct gpio_irq_chip *girq;
   350		int ret, irq;
   351	
   352		pl061 = devm_kzalloc(dev, sizeof(*pl061), GFP_KERNEL);
   353		if (pl061 == NULL)
   354			return -ENOMEM;
   355	
   356		pl061->base = devm_ioremap_resource(dev, &adev->res);
   357		if (IS_ERR(pl061->base))
   358			return PTR_ERR(pl061->base);
   359	
   360		raw_spin_lock_init(&pl061->lock);
   361		pl061->gc.request = gpiochip_generic_request;
   362		pl061->gc.free = gpiochip_generic_free;
   363		pl061->gc.base = -1;
   364		pl061->gc.get_direction = pl061_get_direction;
   365		pl061->gc.direction_input = pl061_direction_input;
   366		pl061->gc.direction_output = pl061_direction_output;
   367		pl061->gc.get = pl061_get_value;
   368		pl061->gc.set = pl061_set_value;
   369		pl061->gc.ngpio = PL061_GPIO_NR;
   370		pl061->gc.label = dev_name(dev);
   371		pl061->gc.parent = dev;
   372		pl061->gc.owner = THIS_MODULE;
   373	
   374		/*
   375		 * irq_chip support
   376		 */
   377		pl061->irq_chip.name = dev_name(dev);
   378		pl061->irq_chip.irq_ack	= pl061_irq_ack;
   379		pl061->irq_chip.irq_mask = pl061_irq_mask;
   380		pl061->irq_chip.irq_unmask = pl061_irq_unmask;
   381		pl061->irq_chip.irq_set_type = pl061_irq_type;
   382		pl061->irq_chip.irq_set_wake = pl061_irq_set_wake;
   383	
   384		writeb(0, pl061->base + GPIOIE); /* disable irqs */
   385		irq = adev->irq[0];
   386		if (!irq)
   387			dev_warn(&adev->dev, "IRQ support disabled\n");
   388		pl061->parent_irq = irq;
   389	
   390		girq = &pl061->gc.irq;
   391		girq->chip = &pl061->irq_chip;
   392		girq->default_type = IRQ_TYPE_NONE;
   393		girq->handler = handle_bad_irq;
   394	
   395		/*
   396		 * There are some PL061 implementations which lack GPIOINTR in hardware
   397		 * and only have individual GPIOMIS[7:0] signals. We distinguish them by
   398		 * the number of IRQs assigned to the AMBA device.
   399		 */
   400		if (!adev->irq[PL061_GPIO_NR - 1]) {
   401			WARN_ON(adev->irq[1]);
   402	
   403			girq->parent_handler = pl061_irq_handler;
   404			girq->num_parents = 1;
   405			girq->parents = devm_kcalloc(dev, 1, sizeof(*girq->parents),
   406						     GFP_KERNEL);
   407			if (!girq->parents)
   408				return -ENOMEM;
   409			girq->parents[0] = irq;
   410		} else {
   411			girq->fwnode = dev->fwnode;
   412			girq->parent_domain =
   413				irq_get_irq_data(adev->irq[PL061_GPIO_NR - 1])->domain;
   414			girq->child_to_parent_hwirq = pl061_child_to_parent_hwirq;
   415	#ifdef CONFIG_OF
 > 416			girq->populate_parent_fwspec = pl061_populate_parent_fwspec;
   417	#endif
   418		}
   419	
   420		ret = devm_gpiochip_add_data(dev, &pl061->gc, pl061);
   421		if (ret)
   422			return ret;
   423	
   424		amba_set_drvdata(adev, pl061);
   425		dev_info(dev, "PL061 GPIO chip registered\n");
   426	
   427		return 0;
   428	}
   429	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--M9NhX3UHpAaciwkO
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--M9NhX3UHpAaciwkO--
