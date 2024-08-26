Return-Path: <linux-gpio+bounces-9138-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E0C95E86D
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Aug 2024 08:21:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 341031F214D7
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Aug 2024 06:21:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FE9D823DE;
	Mon, 26 Aug 2024 06:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iagqMa6v"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6F078C89
	for <linux-gpio@vger.kernel.org>; Mon, 26 Aug 2024 06:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724653281; cv=none; b=KejUtBLjVy0LZcIl6RFE7Mxn+WyikhUsML7dJlKXCATo/BgUyU0DLp7WxLhsLpzbI+E0AGydJWmJlsquk/b1w8AL+X6Bm7K4juOA5+IIXRCcCacPRZwtC79rYVdyDD9BE+peS3st2muaQTEPagiIqz8QddUtNatfEwIUA87NrEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724653281; c=relaxed/simple;
	bh=Zt0viKBYBy3gsNexchxhAjrEq07N727RspPAJu7OtsY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=M/QUsUZb/J7UUerFo7G4JQhrkhmNV9zz2oDdErMQ07FrD8B2mWAgAWtsK0sTbnF0PZ/LeZntHW2T89lasJsc6bcKOvdU2glBtSEDZr8xwHSr4ZauJsxZLvrUzanGOT18QZchSWRagA0zfGlaGgdNPksT5ZchljgE9DI3FkzWBrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iagqMa6v; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5becc379f3fso4246007a12.3
        for <linux-gpio@vger.kernel.org>; Sun, 25 Aug 2024 23:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724653278; x=1725258078; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fB2CwcuX6Z1CCaY5iMgx/R66TH1mMnIMHICV7TYykXE=;
        b=iagqMa6v4CE2AYT217cvxxqHsipaqMT8h8omP4T9IA/AZ/InVdazeOtUs0lCB9jUWT
         1Vdtzc8GcqRVYw2OLqFfeQntKEJbkFj7J7loJOCTvfOJGsl1ot1zq1ysaUuILJo7TxjC
         WfRqSflwUDp2VoCXortLPJtzj0JZkXxNdt3Pxi60eHvEoy54fBO1tO1h3+1/gywFOSUS
         0ZSjV4D98ZpTfl+/SdupBGu+Fov+WZpUyVy5YuJQN0nIYJqwB/CQ3zDzEjHp2a31YdNg
         FJuI9IM2aRcr8Z/tS4X5bvBfOvMvv1wIh+/EZNAPjK0OdKtIdZr8+Rqr9QSHaP1jzSe3
         iMEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724653278; x=1725258078;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fB2CwcuX6Z1CCaY5iMgx/R66TH1mMnIMHICV7TYykXE=;
        b=FRP+qKPIlJI8T7Jgat6LvhS5HoRn17po4XIDonj4CSTENA0aIDvzMj/0JkUqdkbrB2
         CODDyMEKCExpkt+TzNUIRN29SvX7o8dTVu32N6R/VeZ74aKNV+kcNl5kG7ifWFU8/YlO
         8ockwG72PUrU0aw2O5Lktvb2PhC+Ggdu9kOqAZ3l84/QIB22oJGkASiZQKitP/ZZMrdU
         k0KAoEVmEFM3Q9pYyJEN0UrPgdLoKM9H3MY15odHV2c1ItskUahrYGtoD+oK7nhnlqIR
         jdeh3lnmmmcRZN30Ap4RFrIS7hpwYs3IlhfqcOhEOm9PmIGoppeE07N+ZuiP22lklrd0
         2r1g==
X-Forwarded-Encrypted: i=1; AJvYcCU7peGLcBROmAE3dXFf8GpmDgzCq+8D2QPy7N++4zhDaMvbdjnvMmbbwqcJw53hhGIUX1ViXMJisOuV@vger.kernel.org
X-Gm-Message-State: AOJu0YzYmscIS+K4/xJ/kC07nkx6FVRBIaagguKSVswVa47Ugfw5mSNK
	DQV5GHIrZZH8rWZwRHLRenw0ERtrgP648gj/TE90ZpNVyaP4RvdLmqi1eEJT7x8=
X-Google-Smtp-Source: AGHT+IFq/GdaLk62XwsiYr5/C05c0Lw6voqcTxYoq9s6d6E99IxrIwLr9lp5cQHlRsgyGExSiVIxYQ==
X-Received: by 2002:a05:6402:2549:b0:5a1:83c4:c5a8 with SMTP id 4fb4d7f45d1cf-5c08916a807mr4618588a12.14.1724653277766;
        Sun, 25 Aug 2024 23:21:17 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c04a4c9322sm5147752a12.60.2024.08.25.23.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Aug 2024 23:21:17 -0700 (PDT)
Date: Mon, 26 Aug 2024 09:21:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Ye Zhang <ye.zhang@rock-chips.com>,
	linus.walleij@linaro.org, brgl@bgdev.pl, heiko@sntech.de,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	tao.huang@rock-chips.com, finley.xiao@rock-chips.com,
	tim.chen@rock-chips.com, elaine.zhang@rock-chips.com,
	Ye Zhang <ye.zhang@rock-chips.com>
Subject: Re: [PATCH v1 1/5] gpio: rockchip: support acpi
Message-ID: <1cbf0ddf-d438-41e0-8344-9e63d4cd1a60@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240815071651.3645949-2-ye.zhang@rock-chips.com>

Hi Ye,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ye-Zhang/gpio-rockchip-support-acpi/20240815-154340
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git for-next
patch link:    https://lore.kernel.org/r/20240815071651.3645949-2-ye.zhang%40rock-chips.com
patch subject: [PATCH v1 1/5] gpio: rockchip: support acpi
config: arc-randconfig-r073-20240824 (https://download.01.org/0day-ci/archive/20240824/202408241538.j3g0NqRa-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202408241538.j3g0NqRa-lkp@intel.com/

smatch warnings:
drivers/gpio/gpio-rockchip.c:797 rockchip_gpio_probe() warn: can 'cfg' even be NULL?

vim +/cfg +797 drivers/gpio/gpio-rockchip.c

936ee2675eee1f Jianqun Xu     2021-08-16  699  static int rockchip_gpio_probe(struct platform_device *pdev)
936ee2675eee1f Jianqun Xu     2021-08-16  700  {
936ee2675eee1f Jianqun Xu     2021-08-16  701  	struct device *dev = &pdev->dev;
936ee2675eee1f Jianqun Xu     2021-08-16  702  	struct pinctrl_dev *pctldev = NULL;
936ee2675eee1f Jianqun Xu     2021-08-16  703  	struct rockchip_pin_bank *bank = NULL;
371a1b26dd7c7c Ye Zhang       2024-08-15  704  	int bank_id = 0;
371a1b26dd7c7c Ye Zhang       2024-08-15  705  	int ret;
936ee2675eee1f Jianqun Xu     2021-08-16  706  
371a1b26dd7c7c Ye Zhang       2024-08-15  707  	bank_id = rockchip_gpio_acpi_get_bank_id(dev);
371a1b26dd7c7c Ye Zhang       2024-08-15  708  	if (bank_id < 0) {
371a1b26dd7c7c Ye Zhang       2024-08-15  709  		bank_id = rockchip_gpio_of_get_bank_id(dev);
371a1b26dd7c7c Ye Zhang       2024-08-15  710  		if (bank_id < 0)
371a1b26dd7c7c Ye Zhang       2024-08-15  711  			return bank_id;
371a1b26dd7c7c Ye Zhang       2024-08-15  712  	}
371a1b26dd7c7c Ye Zhang       2024-08-15  713  
371a1b26dd7c7c Ye Zhang       2024-08-15  714  	if (!ACPI_COMPANION(dev)) {
371a1b26dd7c7c Ye Zhang       2024-08-15  715  		struct device_node *pctlnp = of_get_parent(dev->of_node);
936ee2675eee1f Jianqun Xu     2021-08-16  716  
936ee2675eee1f Jianqun Xu     2021-08-16  717  		pctldev = of_pinctrl_get(pctlnp);
371a1b26dd7c7c Ye Zhang       2024-08-15  718  		of_node_put(pctlnp);
936ee2675eee1f Jianqun Xu     2021-08-16  719  		if (!pctldev)
936ee2675eee1f Jianqun Xu     2021-08-16  720  			return -EPROBE_DEFER;
936ee2675eee1f Jianqun Xu     2021-08-16  721  
371a1b26dd7c7c Ye Zhang       2024-08-15  722  		bank = rockchip_gpio_find_bank(pctldev, bank_id);
371a1b26dd7c7c Ye Zhang       2024-08-15  723  		if (!bank)
371a1b26dd7c7c Ye Zhang       2024-08-15  724  			return -ENODEV;
371a1b26dd7c7c Ye Zhang       2024-08-15  725  	}
936ee2675eee1f Jianqun Xu     2021-08-16  726  
371a1b26dd7c7c Ye Zhang       2024-08-15  727  	if (!bank) {
371a1b26dd7c7c Ye Zhang       2024-08-15  728  		bank = devm_kzalloc(dev, sizeof(*bank), GFP_KERNEL);
936ee2675eee1f Jianqun Xu     2021-08-16  729  		if (!bank)
371a1b26dd7c7c Ye Zhang       2024-08-15  730  			return -ENOMEM;
371a1b26dd7c7c Ye Zhang       2024-08-15  731  	}
936ee2675eee1f Jianqun Xu     2021-08-16  732  
371a1b26dd7c7c Ye Zhang       2024-08-15  733  	bank->bank_num = bank_id;
936ee2675eee1f Jianqun Xu     2021-08-16  734  	bank->dev = dev;
371a1b26dd7c7c Ye Zhang       2024-08-15  735  
371a1b26dd7c7c Ye Zhang       2024-08-15  736  	bank->reg_base = devm_platform_ioremap_resource(pdev, 0);
371a1b26dd7c7c Ye Zhang       2024-08-15  737  	if (IS_ERR(bank->reg_base))
371a1b26dd7c7c Ye Zhang       2024-08-15  738  		return PTR_ERR(bank->reg_base);
371a1b26dd7c7c Ye Zhang       2024-08-15  739  
371a1b26dd7c7c Ye Zhang       2024-08-15  740  	bank->irq = platform_get_irq(pdev, 0);
371a1b26dd7c7c Ye Zhang       2024-08-15  741  	if (bank->irq < 0)
371a1b26dd7c7c Ye Zhang       2024-08-15  742  		return bank->irq;
936ee2675eee1f Jianqun Xu     2021-08-16  743  
936ee2675eee1f Jianqun Xu     2021-08-16  744  	raw_spin_lock_init(&bank->slock);
936ee2675eee1f Jianqun Xu     2021-08-16  745  
371a1b26dd7c7c Ye Zhang       2024-08-15  746  	if (!ACPI_COMPANION(dev)) {
371a1b26dd7c7c Ye Zhang       2024-08-15  747  		bank->clk = devm_clk_get(dev, "bus");
371a1b26dd7c7c Ye Zhang       2024-08-15  748  		if (IS_ERR(bank->clk)) {
371a1b26dd7c7c Ye Zhang       2024-08-15  749  			bank->clk = of_clk_get(dev->of_node, 0);
371a1b26dd7c7c Ye Zhang       2024-08-15  750  			if (IS_ERR(bank->clk)) {
371a1b26dd7c7c Ye Zhang       2024-08-15  751  				dev_err(dev, "fail to get apb clock\n");
371a1b26dd7c7c Ye Zhang       2024-08-15  752  				return PTR_ERR(bank->clk);
371a1b26dd7c7c Ye Zhang       2024-08-15  753  			}
371a1b26dd7c7c Ye Zhang       2024-08-15  754  		}
371a1b26dd7c7c Ye Zhang       2024-08-15  755  
371a1b26dd7c7c Ye Zhang       2024-08-15  756  		bank->db_clk = devm_clk_get(dev, "db");
371a1b26dd7c7c Ye Zhang       2024-08-15  757  		if (IS_ERR(bank->db_clk)) {
371a1b26dd7c7c Ye Zhang       2024-08-15  758  			bank->db_clk = of_clk_get(dev->of_node, 1);
371a1b26dd7c7c Ye Zhang       2024-08-15  759  			if (IS_ERR(bank->db_clk))
371a1b26dd7c7c Ye Zhang       2024-08-15  760  				bank->db_clk = NULL;
371a1b26dd7c7c Ye Zhang       2024-08-15  761  		}
371a1b26dd7c7c Ye Zhang       2024-08-15  762  	}
371a1b26dd7c7c Ye Zhang       2024-08-15  763  
371a1b26dd7c7c Ye Zhang       2024-08-15  764  	clk_prepare_enable(bank->clk);
371a1b26dd7c7c Ye Zhang       2024-08-15  765  	clk_prepare_enable(bank->db_clk);
371a1b26dd7c7c Ye Zhang       2024-08-15  766  
371a1b26dd7c7c Ye Zhang       2024-08-15  767  	rockchip_gpio_get_ver(bank);
936ee2675eee1f Jianqun Xu     2021-08-16  768  
59dd178e1d7cb6 Heiko Stuebner 2021-09-14  769  	/*
59dd178e1d7cb6 Heiko Stuebner 2021-09-14  770  	 * Prevent clashes with a deferred output setting
59dd178e1d7cb6 Heiko Stuebner 2021-09-14  771  	 * being added right at this moment.
59dd178e1d7cb6 Heiko Stuebner 2021-09-14  772  	 */
59dd178e1d7cb6 Heiko Stuebner 2021-09-14  773  	mutex_lock(&bank->deferred_lock);
59dd178e1d7cb6 Heiko Stuebner 2021-09-14  774  
936ee2675eee1f Jianqun Xu     2021-08-16  775  	ret = rockchip_gpiolib_register(bank);
936ee2675eee1f Jianqun Xu     2021-08-16  776  	if (ret) {
371a1b26dd7c7c Ye Zhang       2024-08-15  777  		dev_err(bank->dev, "Failed to register gpio %d\n", ret);
371a1b26dd7c7c Ye Zhang       2024-08-15  778  		goto err_unlock;
371a1b26dd7c7c Ye Zhang       2024-08-15  779  	}
371a1b26dd7c7c Ye Zhang       2024-08-15  780  
371a1b26dd7c7c Ye Zhang       2024-08-15  781  	if (!device_property_read_bool(bank->dev, "gpio-ranges") && pctldev) {
371a1b26dd7c7c Ye Zhang       2024-08-15  782  		struct gpio_chip *gc = &bank->gpio_chip;
371a1b26dd7c7c Ye Zhang       2024-08-15  783  
371a1b26dd7c7c Ye Zhang       2024-08-15  784  		ret = gpiochip_add_pin_range(gc, dev_name(pctldev->dev), 0,
371a1b26dd7c7c Ye Zhang       2024-08-15  785  					     gc->base, gc->ngpio);
371a1b26dd7c7c Ye Zhang       2024-08-15  786  		if (ret) {
371a1b26dd7c7c Ye Zhang       2024-08-15  787  			dev_err(bank->dev, "Failed to add pin range\n");
371a1b26dd7c7c Ye Zhang       2024-08-15  788  			goto err_unlock;
371a1b26dd7c7c Ye Zhang       2024-08-15  789  		}
936ee2675eee1f Jianqun Xu     2021-08-16  790  	}
936ee2675eee1f Jianqun Xu     2021-08-16  791  
8ce5ef64546850 Caleb Connolly 2022-03-28  792  	while (!list_empty(&bank->deferred_pins)) {
371a1b26dd7c7c Ye Zhang       2024-08-15  793  		struct rockchip_pin_deferred *cfg;
371a1b26dd7c7c Ye Zhang       2024-08-15  794  
8ce5ef64546850 Caleb Connolly 2022-03-28  795  		cfg = list_first_entry(&bank->deferred_pins,
8ce5ef64546850 Caleb Connolly 2022-03-28  796  				       struct rockchip_pin_deferred, head);
371a1b26dd7c7c Ye Zhang       2024-08-15 @797  		if (!cfg)
371a1b26dd7c7c Ye Zhang       2024-08-15  798  			break;

The patch adds a NULL check here, but list_first_entry() can never return NULL.

371a1b26dd7c7c Ye Zhang       2024-08-15  799  
59dd178e1d7cb6 Heiko Stuebner 2021-09-14  800  		list_del(&cfg->head);
59dd178e1d7cb6 Heiko Stuebner 2021-09-14  801  
8ce5ef64546850 Caleb Connolly 2022-03-28  802  		switch (cfg->param) {
8ce5ef64546850 Caleb Connolly 2022-03-28  803  		case PIN_CONFIG_OUTPUT:
59dd178e1d7cb6 Heiko Stuebner 2021-09-14  804  			ret = rockchip_gpio_direction_output(&bank->gpio_chip, cfg->pin, cfg->arg);
59dd178e1d7cb6 Heiko Stuebner 2021-09-14  805  			if (ret)
8ce5ef64546850 Caleb Connolly 2022-03-28  806  				dev_warn(dev, "setting output pin %u to %u failed\n", cfg->pin,
8ce5ef64546850 Caleb Connolly 2022-03-28  807  					 cfg->arg);
8ce5ef64546850 Caleb Connolly 2022-03-28  808  			break;
7ff11357810fd1 Caleb Connolly 2022-03-28  809  		case PIN_CONFIG_INPUT_ENABLE:
7ff11357810fd1 Caleb Connolly 2022-03-28  810  			ret = rockchip_gpio_direction_input(&bank->gpio_chip, cfg->pin);
7ff11357810fd1 Caleb Connolly 2022-03-28  811  			if (ret)
7ff11357810fd1 Caleb Connolly 2022-03-28  812  				dev_warn(dev, "setting input pin %u failed\n", cfg->pin);
7ff11357810fd1 Caleb Connolly 2022-03-28  813  			break;
8ce5ef64546850 Caleb Connolly 2022-03-28  814  		default:
8ce5ef64546850 Caleb Connolly 2022-03-28  815  			dev_warn(dev, "unknown deferred config param %d\n", cfg->param);
8ce5ef64546850 Caleb Connolly 2022-03-28  816  			break;
8ce5ef64546850 Caleb Connolly 2022-03-28  817  		}
59dd178e1d7cb6 Heiko Stuebner 2021-09-14  818  		kfree(cfg);
59dd178e1d7cb6 Heiko Stuebner 2021-09-14  819  	}
59dd178e1d7cb6 Heiko Stuebner 2021-09-14  820  
59dd178e1d7cb6 Heiko Stuebner 2021-09-14  821  	mutex_unlock(&bank->deferred_lock);
59dd178e1d7cb6 Heiko Stuebner 2021-09-14  822  
936ee2675eee1f Jianqun Xu     2021-08-16  823  	platform_set_drvdata(pdev, bank);
371a1b26dd7c7c Ye Zhang       2024-08-15  824  	dev_info(dev, "probed %pfw\n", dev_fwnode(dev));
936ee2675eee1f Jianqun Xu     2021-08-16  825  
936ee2675eee1f Jianqun Xu     2021-08-16  826  	return 0;
371a1b26dd7c7c Ye Zhang       2024-08-15  827  err_unlock:
371a1b26dd7c7c Ye Zhang       2024-08-15  828  	mutex_unlock(&bank->deferred_lock);
371a1b26dd7c7c Ye Zhang       2024-08-15  829  	clk_disable_unprepare(bank->clk);
371a1b26dd7c7c Ye Zhang       2024-08-15  830  	clk_disable_unprepare(bank->db_clk);
371a1b26dd7c7c Ye Zhang       2024-08-15  831  
371a1b26dd7c7c Ye Zhang       2024-08-15  832  	return ret;
936ee2675eee1f Jianqun Xu     2021-08-16  833  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


