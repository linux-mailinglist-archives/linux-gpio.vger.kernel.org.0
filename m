Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3EE3F561BA
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2019 07:33:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725790AbfFZFdT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Jun 2019 01:33:19 -0400
Received: from mga12.intel.com ([192.55.52.136]:51024 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725536AbfFZFdT (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 26 Jun 2019 01:33:19 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 25 Jun 2019 22:33:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,418,1557212400"; 
   d="scan'208";a="155755170"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 25 Jun 2019 22:33:17 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1hg0YW-000HWh-HF; Wed, 26 Jun 2019 13:33:16 +0800
Date:   Wed, 26 Jun 2019 13:32:56 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Enrico Weigelt <info@metux.net>
Cc:     kbuild-all@01.org, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [gpio:devel-hierarchical-irqchip 44/62]
 drivers/gpio/gpio-amd-fch.c:173:57: sparse: sparse: incorrect type in
 argument 2 (different modifiers)
Message-ID: <201906261354.IkP8zN1J%lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git devel-hierarchical-irqchip
head:   9b22e3be56602f4f7b2a1a05414d093ed607e6cf
commit: 9bb2e04525087b7d9f786aa5e68a167187576dbe [44/62] gpio: amd: Make resource struct const
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-rc1-7-g2b96cd8-dirty
        git checkout 9bb2e04525087b7d9f786aa5e68a167187576dbe
        make ARCH=x86_64 allmodconfig
        make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/gpio/gpio-amd-fch.c:173:57: sparse: sparse: incorrect type in argument 2 (different modifiers) @@    expected struct resource *res @@    got structstruct resource *res @@
>> drivers/gpio/gpio-amd-fch.c:173:57: sparse:    expected struct resource *res
>> drivers/gpio/gpio-amd-fch.c:173:57: sparse:    got struct resource const *

vim +173 drivers/gpio/gpio-amd-fch.c

e09d168f Enrico Weigelt, metux IT consult 2019-02-22  139  
e09d168f Enrico Weigelt, metux IT consult 2019-02-22  140  static int amd_fch_gpio_probe(struct platform_device *pdev)
e09d168f Enrico Weigelt, metux IT consult 2019-02-22  141  {
e09d168f Enrico Weigelt, metux IT consult 2019-02-22  142  	struct amd_fch_gpio_priv *priv;
e09d168f Enrico Weigelt, metux IT consult 2019-02-22  143  	struct amd_fch_gpio_pdata *pdata;
e09d168f Enrico Weigelt, metux IT consult 2019-02-22  144  
e09d168f Enrico Weigelt, metux IT consult 2019-02-22  145  	pdata = dev_get_platdata(&pdev->dev);
e09d168f Enrico Weigelt, metux IT consult 2019-02-22  146  	if (!pdata) {
e09d168f Enrico Weigelt, metux IT consult 2019-02-22  147  		dev_err(&pdev->dev, "no platform_data\n");
e09d168f Enrico Weigelt, metux IT consult 2019-02-22  148  		return -ENOENT;
e09d168f Enrico Weigelt, metux IT consult 2019-02-22  149  	}
e09d168f Enrico Weigelt, metux IT consult 2019-02-22  150  
e09d168f Enrico Weigelt, metux IT consult 2019-02-22  151  	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
e09d168f Enrico Weigelt, metux IT consult 2019-02-22  152  	if (!priv)
e09d168f Enrico Weigelt, metux IT consult 2019-02-22  153  		return -ENOMEM;
e09d168f Enrico Weigelt, metux IT consult 2019-02-22  154  
e09d168f Enrico Weigelt, metux IT consult 2019-02-22  155  	priv->pdata	= pdata;
e09d168f Enrico Weigelt, metux IT consult 2019-02-22  156  	priv->pdev	= pdev;
e09d168f Enrico Weigelt, metux IT consult 2019-02-22  157  
e09d168f Enrico Weigelt, metux IT consult 2019-02-22  158  	priv->gc.owner			= THIS_MODULE;
e09d168f Enrico Weigelt, metux IT consult 2019-02-22  159  	priv->gc.parent			= &pdev->dev;
e09d168f Enrico Weigelt, metux IT consult 2019-02-22  160  	priv->gc.label			= dev_name(&pdev->dev);
e09d168f Enrico Weigelt, metux IT consult 2019-02-22  161  	priv->gc.ngpio			= priv->pdata->gpio_num;
e09d168f Enrico Weigelt, metux IT consult 2019-02-22  162  	priv->gc.names			= priv->pdata->gpio_names;
e09d168f Enrico Weigelt, metux IT consult 2019-02-22  163  	priv->gc.base			= -1;
e09d168f Enrico Weigelt, metux IT consult 2019-02-22  164  	priv->gc.request		= amd_fch_gpio_request;
e09d168f Enrico Weigelt, metux IT consult 2019-02-22  165  	priv->gc.direction_input	= amd_fch_gpio_direction_input;
e09d168f Enrico Weigelt, metux IT consult 2019-02-22  166  	priv->gc.direction_output	= amd_fch_gpio_direction_output;
e09d168f Enrico Weigelt, metux IT consult 2019-02-22  167  	priv->gc.get_direction		= amd_fch_gpio_get_direction;
e09d168f Enrico Weigelt, metux IT consult 2019-02-22  168  	priv->gc.get			= amd_fch_gpio_get;
e09d168f Enrico Weigelt, metux IT consult 2019-02-22  169  	priv->gc.set			= amd_fch_gpio_set;
e09d168f Enrico Weigelt, metux IT consult 2019-02-22  170  
e09d168f Enrico Weigelt, metux IT consult 2019-02-22  171  	spin_lock_init(&priv->lock);
e09d168f Enrico Weigelt, metux IT consult 2019-02-22  172  
e09d168f Enrico Weigelt, metux IT consult 2019-02-22 @173  	priv->base = devm_ioremap_resource(&pdev->dev, &amd_fch_gpio_iores);
e09d168f Enrico Weigelt, metux IT consult 2019-02-22  174  	if (IS_ERR(priv->base))
e09d168f Enrico Weigelt, metux IT consult 2019-02-22  175  		return PTR_ERR(priv->base);
e09d168f Enrico Weigelt, metux IT consult 2019-02-22  176  
e09d168f Enrico Weigelt, metux IT consult 2019-02-22  177  	platform_set_drvdata(pdev, priv);
e09d168f Enrico Weigelt, metux IT consult 2019-02-22  178  
e09d168f Enrico Weigelt, metux IT consult 2019-02-22  179  	return devm_gpiochip_add_data(&pdev->dev, &priv->gc, priv);
e09d168f Enrico Weigelt, metux IT consult 2019-02-22  180  }
e09d168f Enrico Weigelt, metux IT consult 2019-02-22  181  

:::::: The code at line 173 was first introduced by commit
:::::: e09d168f13f0d63df7fe095d52be04c16cbe1cef gpio: AMD G-Series PCH gpio driver

:::::: TO: Enrico Weigelt, metux IT consult <info@metux.net>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
