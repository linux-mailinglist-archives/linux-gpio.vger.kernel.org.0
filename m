Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 859F5326AF
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2019 04:37:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726305AbfFCChb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 2 Jun 2019 22:37:31 -0400
Received: from mga11.intel.com ([192.55.52.93]:8356 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726270AbfFCChb (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 2 Jun 2019 22:37:31 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 02 Jun 2019 19:37:29 -0700
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 02 Jun 2019 19:37:27 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1hXcql-000BsR-CZ; Mon, 03 Jun 2019 10:37:27 +0800
Date:   Mon, 3 Jun 2019 10:36:59 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     kbuild-all@01.org, linux-gpio@vger.kernel.org
Subject: [gpio:devel-hierarchical 12/12] drivers/gpio/gpio-ixp4xx.c:235:17:
 error: 'ixp4xx_gpio_to_irq' undeclared; did you mean 'ixp4xx_init_irq'?
Message-ID: <201906031057.ihLJRjUQ%lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="liOOAslEiF7prFVr"
Content-Disposition: inline
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--liOOAslEiF7prFVr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git devel-hierarchical
head:   d545933b2ffdbd4ad98d45e899faf61180d3ffa7
commit: d545933b2ffdbd4ad98d45e899faf61180d3ffa7 [12/12] RFC: gpio: ixp4xx: Convert to hieararchical GPIOLIB_IRQCHIP
config: arm-ixp4xx_defconfig (attached as .config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.4.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout d545933b2ffdbd4ad98d45e899faf61180d3ffa7
        # save the attached .config to linux build tree
        GCC_VERSION=7.4.0 make.cross ARCH=arm 

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/gpio/gpio-ixp4xx.c: In function 'ixp4xx_gpio_probe':
>> drivers/gpio/gpio-ixp4xx.c:235:17: error: 'ixp4xx_gpio_to_irq' undeclared (first use in this function); did you mean 'ixp4xx_init_irq'?
     g->gc.to_irq = ixp4xx_gpio_to_irq;
                    ^~~~~~~~~~~~~~~~~~
                    ixp4xx_init_irq
   drivers/gpio/gpio-ixp4xx.c:235:17: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/gpio/gpio-ixp4xx.c:284:27: error: assignment from incompatible pointer type [-Werror=incompatible-pointer-types]
     g->gc.irq.parent_irq_map = &ixp4xx_gpiomap;
                              ^
   drivers/gpio/gpio-ixp4xx.c:187:6: warning: unused variable 'i' [-Wunused-variable]
     int i;
         ^
   cc1: some warnings being treated as errors

vim +235 drivers/gpio/gpio-ixp4xx.c

813e7d36f Linus Walleij 2019-01-25  222  
813e7d36f Linus Walleij 2019-01-25  223  	/* Populate and register gpio chip */
813e7d36f Linus Walleij 2019-01-25  224  	ret = bgpio_init(&g->gc, dev, 4,
813e7d36f Linus Walleij 2019-01-25  225  			 g->base + IXP4XX_REG_GPIN,
813e7d36f Linus Walleij 2019-01-25  226  			 g->base + IXP4XX_REG_GPOUT,
813e7d36f Linus Walleij 2019-01-25  227  			 NULL,
813e7d36f Linus Walleij 2019-01-25  228  			 NULL,
813e7d36f Linus Walleij 2019-01-25  229  			 g->base + IXP4XX_REG_GPOE,
813e7d36f Linus Walleij 2019-01-25  230  			 flags);
813e7d36f Linus Walleij 2019-01-25  231  	if (ret) {
813e7d36f Linus Walleij 2019-01-25  232  		dev_err(dev, "unable to init generic GPIO\n");
813e7d36f Linus Walleij 2019-01-25  233  		return ret;
813e7d36f Linus Walleij 2019-01-25  234  	}
813e7d36f Linus Walleij 2019-01-25 @235  	g->gc.to_irq = ixp4xx_gpio_to_irq;
813e7d36f Linus Walleij 2019-01-25  236  	g->gc.ngpio = 16;
813e7d36f Linus Walleij 2019-01-25  237  	g->gc.label = "IXP4XX_GPIO_CHIP";
813e7d36f Linus Walleij 2019-01-25  238  	/*
813e7d36f Linus Walleij 2019-01-25  239  	 * TODO: when we have migrated to device tree and all GPIOs
813e7d36f Linus Walleij 2019-01-25  240  	 * are fetched using phandles, set this to -1 to get rid of
813e7d36f Linus Walleij 2019-01-25  241  	 * the fixed gpiochip base.
813e7d36f Linus Walleij 2019-01-25  242  	 */
813e7d36f Linus Walleij 2019-01-25  243  	g->gc.base = 0;
813e7d36f Linus Walleij 2019-01-25  244  	g->gc.parent = &pdev->dev;
813e7d36f Linus Walleij 2019-01-25  245  	g->gc.owner = THIS_MODULE;
813e7d36f Linus Walleij 2019-01-25  246  
813e7d36f Linus Walleij 2019-01-25  247  	ret = devm_gpiochip_add_data(dev, &g->gc, g);
813e7d36f Linus Walleij 2019-01-25  248  	if (ret) {
813e7d36f Linus Walleij 2019-01-25  249  		dev_err(dev, "failed to add SoC gpiochip\n");
813e7d36f Linus Walleij 2019-01-25  250  		return ret;
813e7d36f Linus Walleij 2019-01-25  251  	}
813e7d36f Linus Walleij 2019-01-25  252  
813e7d36f Linus Walleij 2019-01-25  253  	/*
813e7d36f Linus Walleij 2019-01-25  254  	 * When we convert to device tree we will simply look up the
813e7d36f Linus Walleij 2019-01-25  255  	 * parent irqdomain using irq_find_host(parent) as parent comes
813e7d36f Linus Walleij 2019-01-25  256  	 * from IRQCHIP_DECLARE(), then use of_node_to_fwnode() to get
813e7d36f Linus Walleij 2019-01-25  257  	 * the fwnode. For now we need this boardfile style code.
813e7d36f Linus Walleij 2019-01-25  258  	 */
e4bfb0ff7 Linus Walleij 2019-01-28  259  	if (np) {
e4bfb0ff7 Linus Walleij 2019-01-28  260  		struct device_node *irq_parent;
e4bfb0ff7 Linus Walleij 2019-01-28  261  
e4bfb0ff7 Linus Walleij 2019-01-28  262  		irq_parent = of_irq_find_parent(np);
e4bfb0ff7 Linus Walleij 2019-01-28  263  		if (!irq_parent) {
e4bfb0ff7 Linus Walleij 2019-01-28  264  			dev_err(dev, "no IRQ parent node\n");
e4bfb0ff7 Linus Walleij 2019-01-28  265  			return -ENODEV;
e4bfb0ff7 Linus Walleij 2019-01-28  266  		}
e4bfb0ff7 Linus Walleij 2019-01-28  267  		parent = irq_find_host(irq_parent);
e4bfb0ff7 Linus Walleij 2019-01-28  268  		if (!parent) {
e4bfb0ff7 Linus Walleij 2019-01-28  269  			dev_err(dev, "no IRQ parent domain\n");
e4bfb0ff7 Linus Walleij 2019-01-28  270  			return -ENODEV;
e4bfb0ff7 Linus Walleij 2019-01-28  271  		}
e4bfb0ff7 Linus Walleij 2019-01-28  272  		g->fwnode = of_node_to_fwnode(np);
e4bfb0ff7 Linus Walleij 2019-01-28  273  	} else {
813e7d36f Linus Walleij 2019-01-25  274  		parent = ixp4xx_get_irq_domain();
813e7d36f Linus Walleij 2019-01-25  275  		g->fwnode = irq_domain_alloc_fwnode(g->base);
813e7d36f Linus Walleij 2019-01-25  276  		if (!g->fwnode) {
813e7d36f Linus Walleij 2019-01-25  277  			dev_err(dev, "no domain base\n");
813e7d36f Linus Walleij 2019-01-25  278  			return -ENODEV;
813e7d36f Linus Walleij 2019-01-25  279  		}
e4bfb0ff7 Linus Walleij 2019-01-28  280  	}
813e7d36f Linus Walleij 2019-01-25  281  
d545933b2 Linus Walleij 2019-06-02  282  	g->gc.irq.fwnode = g->fwnode;
d545933b2 Linus Walleij 2019-06-02  283  	g->gc.irq.parent_domain = parent;
d545933b2 Linus Walleij 2019-06-02 @284  	g->gc.irq.parent_irq_map = &ixp4xx_gpiomap;
d545933b2 Linus Walleij 2019-06-02  285  	g->gc.irq.parent_n_irq_maps = ARRAY_SIZE(ixp4xx_gpiomap);
d545933b2 Linus Walleij 2019-06-02  286  	ret = gpiochip_irqchip_add(&g->gc, &ixp4xx_gpio_irqchip,
d545933b2 Linus Walleij 2019-06-02  287  				   0, handle_bad_irq,
d545933b2 Linus Walleij 2019-06-02  288  				   IRQ_TYPE_NONE);
d545933b2 Linus Walleij 2019-06-02  289          if (ret) {
d545933b2 Linus Walleij 2019-06-02  290  		dev_info(dev, "could not add irqchip\n");
813e7d36f Linus Walleij 2019-01-25  291  		irq_domain_free_fwnode(g->fwnode);
d545933b2 Linus Walleij 2019-06-02  292  		return -ENODEV;
e4bfb0ff7 Linus Walleij 2019-01-28  293          }
d545933b2 Linus Walleij 2019-06-02  294  	gpiochip_set_hierarchical_irqchip(&g->gc, &ixp4xx_gpio_irqchip);
813e7d36f Linus Walleij 2019-01-25  295  
813e7d36f Linus Walleij 2019-01-25  296  	platform_set_drvdata(pdev, g);
813e7d36f Linus Walleij 2019-01-25  297  	dev_info(dev, "IXP4 GPIO @%p registered\n", g->base);
813e7d36f Linus Walleij 2019-01-25  298  
813e7d36f Linus Walleij 2019-01-25  299  	return 0;
813e7d36f Linus Walleij 2019-01-25  300  }
813e7d36f Linus Walleij 2019-01-25  301  

:::::: The code at line 235 was first introduced by commit
:::::: 813e7d36f22762f89856048a32446c8972309566 gpio: ixp4xx: Add driver for the IXP4xx GPIO

:::::: TO: Linus Walleij <linus.walleij@linaro.org>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

--liOOAslEiF7prFVr
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
AA==

--liOOAslEiF7prFVr--
