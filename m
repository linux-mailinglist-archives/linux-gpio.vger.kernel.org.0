Return-Path: <linux-gpio+bounces-9499-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABAED967295
	for <lists+linux-gpio@lfdr.de>; Sat, 31 Aug 2024 18:05:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6391D283147
	for <lists+linux-gpio@lfdr.de>; Sat, 31 Aug 2024 16:05:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00E2037708;
	Sat, 31 Aug 2024 16:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XRCaF3b4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500442B9D6
	for <linux-gpio@vger.kernel.org>; Sat, 31 Aug 2024 16:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725120339; cv=none; b=f9jLrjCqW6BY6PuKSbDVi3UAlF746xEA8tImO01FBGh3aUaTqQkQzE57S+fYwncaPLuo8bEdbHl/X2qYru8WzZDaFGhbwV0qJVEE+JBG3XmvtLiicT9Vqao7VkUldF46F9jnJOkvRD7Qx9yu/vyPCXQpC4VgNNvvEm3mcU/WbXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725120339; c=relaxed/simple;
	bh=rE0ut2sUqgxU8xov+GdcaHGXlKvhZFI7wcxAcxuYp38=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=dPxYMxwdJVc7FK5w55FkVdzgpkSWChVjBAn4giobbGv6GTG2YTGoAhlEQJdOljx8nivyHlz7FEMYeEo7OJ6FuirH3JZMduiLT8/Rf32pCwU5ig2A5N88MIR5Rwr9cJ/Z5AHgJCojj0C7OCva2q9gba/f1FoqRZ8nPt4bZSRybSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XRCaF3b4; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-42bb72a5e0bso23969175e9.1
        for <linux-gpio@vger.kernel.org>; Sat, 31 Aug 2024 09:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725120334; x=1725725134; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uRYZ1Clj8bSc5EVRMrTevTBI4DXI4o3me3WtcIgUDlI=;
        b=XRCaF3b4HqHnHPeNlpHYMjeC/BsANnWabzmAk9pvJZ6VcEgmlMeSpYNO41WTgriweJ
         LQWC6yX5YFpNU5lFAea8jTyAkvXHkUv3xse4mZFn76yLfywKpfvcGYpEQ+qY/hH5O5au
         0JmUZYT5UFSIynS3r6tl2M+sRaUmU49KzD8dIisq2PsczwFNmQQO3Yy569CGbq0IoK9J
         kNKJHawnaixQ6ixQvhKzqQ8SAsYFXj4WewiTDLr69/BpVx1j+m7LdyGtGMg/ymDXwzQ0
         d5Nyuk/v0LDJpLUs56pcGC2Zn14mDNwKZxQYqES4oieyF2qsNgpGRSHN6HWEl1RpwrfT
         V/VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725120334; x=1725725134;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uRYZ1Clj8bSc5EVRMrTevTBI4DXI4o3me3WtcIgUDlI=;
        b=Rrdsj80xFvdmSTO9LyuVjX9sDKD9lpfJ3M7DicB21RPgqJV2QsfrAu6SeIAeC3pqLa
         5urON50GHckTbWDT5/TXk1IdB3nn/H96/RjBRlbbZAZHsmPqHC0JS1KK8jwicycDqetu
         3n6UiVRpxmYq1kj+4YshJ7p0LstXvbL2AlLjnHEgh+mYpIExvsoVBFJbOB4RL8fgtOm4
         vYrzmyo6h50js2AqlaoKNl0BJ2jPRPHfkP0SAGlNTfjt0Axz51MzbGVwMIzeLE4nZkVm
         QLw1Z/0KA2t62Z33rIYazyLJESBF1b0nGgDRAEwE6OtaGx0M7ISVNfqwbOKdSNnoyXDz
         HKOQ==
X-Forwarded-Encrypted: i=1; AJvYcCU14AUDgljPH0jASMfoxR/+rjOYdoei2b121W8MqgYtADwG5bC4RdE5f7HuClbjXBIoGVSaOLlXQhhr@vger.kernel.org
X-Gm-Message-State: AOJu0YyvKY82XyeTgFIKRKspIBGpc191WKe1oJG22N3x7LAO/+2qj8UA
	gyWG2fp+SV3tbqGgv6Czb4MsIO1G7y2FKxqYcAu9uO1Dv1r/UuYifqsK0OGjcX4M5aGSUcWLpjL
	2
X-Google-Smtp-Source: AGHT+IHUSjMb5RuC0+VSxpdufeI4iE6ieLzMX2B6pOFhIZGPfaSr5tdYaNAGfMGB7ROmlJZqGyqKug==
X-Received: by 2002:adf:e88b:0:b0:374:ba3f:ad08 with SMTP id ffacd0b85a97d-374ba3faf72mr2060074f8f.55.1725120334341;
        Sat, 31 Aug 2024 09:05:34 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bb6deb27fsm80143365e9.10.2024.08.31.09.05.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Aug 2024 09:05:33 -0700 (PDT)
Date: Sat, 31 Aug 2024 19:05:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Billy Tsai <billy_tsai@aspeedtech.com>,
	linus.walleij@linaro.org, brgl@bgdev.pl, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au,
	andrew@codeconstruct.com.au, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	BMC-SW@aspeedtech.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 3/4] gpio: aspeed: Create llops to handle hardware
 access
Message-ID: <50920eea-7fff-4905-839e-7acd88f437cb@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240830034047.2251482-4-billy_tsai@aspeedtech.com>

Hi Billy,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Billy-Tsai/dt-bindings-gpio-aspeed-ast2400-gpio-Support-ast2700/20240830-114325
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20240830034047.2251482-4-billy_tsai%40aspeedtech.com
patch subject: [PATCH v2 3/4] gpio: aspeed: Create llops to handle hardware access
config: parisc-randconfig-r071-20240831 (https://download.01.org/0day-ci/archive/20240831/202408312313.HTx2vwvy-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202408312313.HTx2vwvy-lkp@intel.com/

smatch warnings:
drivers/gpio/gpio-aspeed.c:399 aspeed_gpio_set() error: uninitialized symbol 'copro'.
drivers/gpio/gpio-aspeed.c:418 aspeed_gpio_dir_in() error: uninitialized symbol 'copro'.
drivers/gpio/gpio-aspeed.c:443 aspeed_gpio_dir_out() error: uninitialized symbol 'copro'.
drivers/gpio/gpio-aspeed.c:507 aspeed_gpio_irq_ack() error: uninitialized symbol 'copro'.
drivers/gpio/gpio-aspeed.c:533 aspeed_gpio_irq_set_mask() error: uninitialized symbol 'copro'.
drivers/gpio/gpio-aspeed.c:596 aspeed_gpio_set_type() error: uninitialized symbol 'copro'.
drivers/gpio/gpio-aspeed.c:664 aspeed_gpio_reset_tolerance() error: uninitialized symbol 'copro'.

vim +/copro +399 drivers/gpio/gpio-aspeed.c

361b79119a4b7f Joel Stanley           2016-08-30  386  static void aspeed_gpio_set(struct gpio_chip *gc, unsigned int offset,
361b79119a4b7f Joel Stanley           2016-08-30  387  			    int val)
361b79119a4b7f Joel Stanley           2016-08-30  388  {
361b79119a4b7f Joel Stanley           2016-08-30  389  	struct aspeed_gpio *gpio = gpiochip_get_data(gc);
361b79119a4b7f Joel Stanley           2016-08-30  390  	unsigned long flags;
a7ca13826e478f Benjamin Herrenschmidt 2018-06-29  391  	bool copro;
361b79119a4b7f Joel Stanley           2016-08-30  392  
61a7904b6ace99 Iwona Winiarska        2021-12-04  393  	raw_spin_lock_irqsave(&gpio->lock, flags);
0e6ca482ec6e28 Billy Tsai             2024-08-30  394  	if (gpio->llops->copro_request)
0e6ca482ec6e28 Billy Tsai             2024-08-30  395  		copro = gpio->llops->copro_request(gpio, offset);

Uninitialized on else  path

361b79119a4b7f Joel Stanley           2016-08-30  396  
361b79119a4b7f Joel Stanley           2016-08-30  397  	__aspeed_gpio_set(gc, offset, val);
361b79119a4b7f Joel Stanley           2016-08-30  398  
0e6ca482ec6e28 Billy Tsai             2024-08-30 @399  	if (copro && gpio->llops->copro_release)
                                                            ^^^^^

0e6ca482ec6e28 Billy Tsai             2024-08-30  400  		gpio->llops->copro_release(gpio, offset);
61a7904b6ace99 Iwona Winiarska        2021-12-04  401  	raw_spin_unlock_irqrestore(&gpio->lock, flags);
361b79119a4b7f Joel Stanley           2016-08-30  402  }
361b79119a4b7f Joel Stanley           2016-08-30  403  
361b79119a4b7f Joel Stanley           2016-08-30  404  static int aspeed_gpio_dir_in(struct gpio_chip *gc, unsigned int offset)
361b79119a4b7f Joel Stanley           2016-08-30  405  {
361b79119a4b7f Joel Stanley           2016-08-30  406  	struct aspeed_gpio *gpio = gpiochip_get_data(gc);
361b79119a4b7f Joel Stanley           2016-08-30  407  	unsigned long flags;
a7ca13826e478f Benjamin Herrenschmidt 2018-06-29  408  	bool copro;
361b79119a4b7f Joel Stanley           2016-08-30  409  
1736f75d35e474 Andrew Jeffery         2017-01-24  410  	if (!have_input(gpio, offset))
1736f75d35e474 Andrew Jeffery         2017-01-24  411  		return -ENOTSUPP;
1736f75d35e474 Andrew Jeffery         2017-01-24  412  
61a7904b6ace99 Iwona Winiarska        2021-12-04  413  	raw_spin_lock_irqsave(&gpio->lock, flags);
361b79119a4b7f Joel Stanley           2016-08-30  414  
0e6ca482ec6e28 Billy Tsai             2024-08-30  415  	if (gpio->llops->copro_request)
0e6ca482ec6e28 Billy Tsai             2024-08-30  416  		copro = gpio->llops->copro_request(gpio, offset);
0e6ca482ec6e28 Billy Tsai             2024-08-30  417  	gpio->llops->reg_bits_set(gpio, offset, reg_dir, 0);
0e6ca482ec6e28 Billy Tsai             2024-08-30 @418  	if (copro && gpio->llops->copro_release)
0e6ca482ec6e28 Billy Tsai             2024-08-30  419  		gpio->llops->copro_release(gpio, offset);
361b79119a4b7f Joel Stanley           2016-08-30  420  
61a7904b6ace99 Iwona Winiarska        2021-12-04  421  	raw_spin_unlock_irqrestore(&gpio->lock, flags);
361b79119a4b7f Joel Stanley           2016-08-30  422  
361b79119a4b7f Joel Stanley           2016-08-30  423  	return 0;
361b79119a4b7f Joel Stanley           2016-08-30  424  }
361b79119a4b7f Joel Stanley           2016-08-30  425  
361b79119a4b7f Joel Stanley           2016-08-30  426  static int aspeed_gpio_dir_out(struct gpio_chip *gc,
361b79119a4b7f Joel Stanley           2016-08-30  427  			       unsigned int offset, int val)
361b79119a4b7f Joel Stanley           2016-08-30  428  {
361b79119a4b7f Joel Stanley           2016-08-30  429  	struct aspeed_gpio *gpio = gpiochip_get_data(gc);
361b79119a4b7f Joel Stanley           2016-08-30  430  	unsigned long flags;
a7ca13826e478f Benjamin Herrenschmidt 2018-06-29  431  	bool copro;
361b79119a4b7f Joel Stanley           2016-08-30  432  
1736f75d35e474 Andrew Jeffery         2017-01-24  433  	if (!have_output(gpio, offset))
1736f75d35e474 Andrew Jeffery         2017-01-24  434  		return -ENOTSUPP;
1736f75d35e474 Andrew Jeffery         2017-01-24  435  
61a7904b6ace99 Iwona Winiarska        2021-12-04  436  	raw_spin_lock_irqsave(&gpio->lock, flags);
361b79119a4b7f Joel Stanley           2016-08-30  437  
0e6ca482ec6e28 Billy Tsai             2024-08-30  438  	if (gpio->llops->copro_request)
0e6ca482ec6e28 Billy Tsai             2024-08-30  439  		copro = gpio->llops->copro_request(gpio, offset);
af7949284910a1 Benjamin Herrenschmidt 2018-05-17  440  	__aspeed_gpio_set(gc, offset, val);
0e6ca482ec6e28 Billy Tsai             2024-08-30  441  	gpio->llops->reg_bits_set(gpio, offset, reg_dir, 1);
361b79119a4b7f Joel Stanley           2016-08-30  442  
0e6ca482ec6e28 Billy Tsai             2024-08-30 @443  	if (copro && gpio->llops->copro_release)
0e6ca482ec6e28 Billy Tsai             2024-08-30  444  		gpio->llops->copro_release(gpio, offset);
61a7904b6ace99 Iwona Winiarska        2021-12-04  445  	raw_spin_unlock_irqrestore(&gpio->lock, flags);
361b79119a4b7f Joel Stanley           2016-08-30  446  
361b79119a4b7f Joel Stanley           2016-08-30  447  	return 0;
361b79119a4b7f Joel Stanley           2016-08-30  448  }
361b79119a4b7f Joel Stanley           2016-08-30  449  
361b79119a4b7f Joel Stanley           2016-08-30  450  static int aspeed_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
361b79119a4b7f Joel Stanley           2016-08-30  451  {
361b79119a4b7f Joel Stanley           2016-08-30  452  	struct aspeed_gpio *gpio = gpiochip_get_data(gc);
361b79119a4b7f Joel Stanley           2016-08-30  453  	unsigned long flags;
361b79119a4b7f Joel Stanley           2016-08-30  454  	u32 val;
361b79119a4b7f Joel Stanley           2016-08-30  455  
1736f75d35e474 Andrew Jeffery         2017-01-24  456  	if (!have_input(gpio, offset))
e42615ec233b30 Matti Vaittinen        2019-11-06  457  		return GPIO_LINE_DIRECTION_OUT;
1736f75d35e474 Andrew Jeffery         2017-01-24  458  
1736f75d35e474 Andrew Jeffery         2017-01-24  459  	if (!have_output(gpio, offset))
e42615ec233b30 Matti Vaittinen        2019-11-06  460  		return GPIO_LINE_DIRECTION_IN;
1736f75d35e474 Andrew Jeffery         2017-01-24  461  
61a7904b6ace99 Iwona Winiarska        2021-12-04  462  	raw_spin_lock_irqsave(&gpio->lock, flags);
361b79119a4b7f Joel Stanley           2016-08-30  463  
0e6ca482ec6e28 Billy Tsai             2024-08-30  464  	val = gpio->llops->reg_bits_read(gpio, offset, reg_dir);
361b79119a4b7f Joel Stanley           2016-08-30  465  
61a7904b6ace99 Iwona Winiarska        2021-12-04  466  	raw_spin_unlock_irqrestore(&gpio->lock, flags);
361b79119a4b7f Joel Stanley           2016-08-30  467  
e42615ec233b30 Matti Vaittinen        2019-11-06  468  	return val ? GPIO_LINE_DIRECTION_OUT : GPIO_LINE_DIRECTION_IN;
361b79119a4b7f Joel Stanley           2016-08-30  469  }
361b79119a4b7f Joel Stanley           2016-08-30  470  
361b79119a4b7f Joel Stanley           2016-08-30  471  static inline int irqd_to_aspeed_gpio_data(struct irq_data *d,
361b79119a4b7f Joel Stanley           2016-08-30  472  					   struct aspeed_gpio **gpio,
0e6ca482ec6e28 Billy Tsai             2024-08-30  473  					   int *offset)
361b79119a4b7f Joel Stanley           2016-08-30  474  {
1736f75d35e474 Andrew Jeffery         2017-01-24  475  	struct aspeed_gpio *internal;
361b79119a4b7f Joel Stanley           2016-08-30  476  
a7ca13826e478f Benjamin Herrenschmidt 2018-06-29  477  	*offset = irqd_to_hwirq(d);
361b79119a4b7f Joel Stanley           2016-08-30  478  
1736f75d35e474 Andrew Jeffery         2017-01-24  479  	internal = irq_data_get_irq_chip_data(d);
1736f75d35e474 Andrew Jeffery         2017-01-24  480  
1736f75d35e474 Andrew Jeffery         2017-01-24  481  	/* This might be a bit of a questionable place to check */
a7ca13826e478f Benjamin Herrenschmidt 2018-06-29  482  	if (!have_irq(internal, *offset))
1736f75d35e474 Andrew Jeffery         2017-01-24  483  		return -ENOTSUPP;
1736f75d35e474 Andrew Jeffery         2017-01-24  484  
1736f75d35e474 Andrew Jeffery         2017-01-24  485  	*gpio = internal;
361b79119a4b7f Joel Stanley           2016-08-30  486  
361b79119a4b7f Joel Stanley           2016-08-30  487  	return 0;
361b79119a4b7f Joel Stanley           2016-08-30  488  }
361b79119a4b7f Joel Stanley           2016-08-30  489  
361b79119a4b7f Joel Stanley           2016-08-30  490  static void aspeed_gpio_irq_ack(struct irq_data *d)
361b79119a4b7f Joel Stanley           2016-08-30  491  {
361b79119a4b7f Joel Stanley           2016-08-30  492  	struct aspeed_gpio *gpio;
361b79119a4b7f Joel Stanley           2016-08-30  493  	unsigned long flags;
a7ca13826e478f Benjamin Herrenschmidt 2018-06-29  494  	int rc, offset;
a7ca13826e478f Benjamin Herrenschmidt 2018-06-29  495  	bool copro;
361b79119a4b7f Joel Stanley           2016-08-30  496  
0e6ca482ec6e28 Billy Tsai             2024-08-30  497  	rc = irqd_to_aspeed_gpio_data(d, &gpio, &offset);
361b79119a4b7f Joel Stanley           2016-08-30  498  	if (rc)
361b79119a4b7f Joel Stanley           2016-08-30  499  		return;
361b79119a4b7f Joel Stanley           2016-08-30  500  
61a7904b6ace99 Iwona Winiarska        2021-12-04  501  	raw_spin_lock_irqsave(&gpio->lock, flags);
0e6ca482ec6e28 Billy Tsai             2024-08-30  502  	if (gpio->llops->copro_request)
0e6ca482ec6e28 Billy Tsai             2024-08-30  503  		copro = gpio->llops->copro_request(gpio, offset);
a7ca13826e478f Benjamin Herrenschmidt 2018-06-29  504  
0e6ca482ec6e28 Billy Tsai             2024-08-30  505  	gpio->llops->reg_bits_set(gpio, offset, reg_irq_status, 1);
a7ca13826e478f Benjamin Herrenschmidt 2018-06-29  506  
0e6ca482ec6e28 Billy Tsai             2024-08-30 @507  	if (copro && gpio->llops->copro_release)
0e6ca482ec6e28 Billy Tsai             2024-08-30  508  		gpio->llops->copro_release(gpio, offset);
61a7904b6ace99 Iwona Winiarska        2021-12-04  509  	raw_spin_unlock_irqrestore(&gpio->lock, flags);
361b79119a4b7f Joel Stanley           2016-08-30  510  }
361b79119a4b7f Joel Stanley           2016-08-30  511  
361b79119a4b7f Joel Stanley           2016-08-30  512  static void aspeed_gpio_irq_set_mask(struct irq_data *d, bool set)
361b79119a4b7f Joel Stanley           2016-08-30  513  {
361b79119a4b7f Joel Stanley           2016-08-30  514  	struct aspeed_gpio *gpio;
361b79119a4b7f Joel Stanley           2016-08-30  515  	unsigned long flags;
a7ca13826e478f Benjamin Herrenschmidt 2018-06-29  516  	int rc, offset;
a7ca13826e478f Benjamin Herrenschmidt 2018-06-29  517  	bool copro;
361b79119a4b7f Joel Stanley           2016-08-30  518  
0e6ca482ec6e28 Billy Tsai             2024-08-30  519  	rc = irqd_to_aspeed_gpio_data(d, &gpio, &offset);
361b79119a4b7f Joel Stanley           2016-08-30  520  	if (rc)
361b79119a4b7f Joel Stanley           2016-08-30  521  		return;
361b79119a4b7f Joel Stanley           2016-08-30  522  
061df08f063a97 Linus Walleij          2023-03-09  523  	/* Unmasking the IRQ */
061df08f063a97 Linus Walleij          2023-03-09  524  	if (set)
061df08f063a97 Linus Walleij          2023-03-09  525  		gpiochip_enable_irq(&gpio->chip, irqd_to_hwirq(d));
061df08f063a97 Linus Walleij          2023-03-09  526  
61a7904b6ace99 Iwona Winiarska        2021-12-04  527  	raw_spin_lock_irqsave(&gpio->lock, flags);
0e6ca482ec6e28 Billy Tsai             2024-08-30  528  	if (gpio->llops->copro_request)
0e6ca482ec6e28 Billy Tsai             2024-08-30  529  		copro = gpio->llops->copro_request(gpio, offset);
361b79119a4b7f Joel Stanley           2016-08-30  530  
0e6ca482ec6e28 Billy Tsai             2024-08-30  531  	gpio->llops->reg_bits_set(gpio, offset, reg_irq_enable, set);
361b79119a4b7f Joel Stanley           2016-08-30  532  
0e6ca482ec6e28 Billy Tsai             2024-08-30 @533  	if (copro && gpio->llops->copro_release)
0e6ca482ec6e28 Billy Tsai             2024-08-30  534  		gpio->llops->copro_release(gpio, offset);
61a7904b6ace99 Iwona Winiarska        2021-12-04  535  	raw_spin_unlock_irqrestore(&gpio->lock, flags);
061df08f063a97 Linus Walleij          2023-03-09  536  
061df08f063a97 Linus Walleij          2023-03-09  537  	/* Masking the IRQ */
061df08f063a97 Linus Walleij          2023-03-09  538  	if (!set)
061df08f063a97 Linus Walleij          2023-03-09  539  		gpiochip_disable_irq(&gpio->chip, irqd_to_hwirq(d));
361b79119a4b7f Joel Stanley           2016-08-30  540  }
361b79119a4b7f Joel Stanley           2016-08-30  541  
361b79119a4b7f Joel Stanley           2016-08-30  542  static void aspeed_gpio_irq_mask(struct irq_data *d)
361b79119a4b7f Joel Stanley           2016-08-30  543  {
361b79119a4b7f Joel Stanley           2016-08-30  544  	aspeed_gpio_irq_set_mask(d, false);
361b79119a4b7f Joel Stanley           2016-08-30  545  }
361b79119a4b7f Joel Stanley           2016-08-30  546  
361b79119a4b7f Joel Stanley           2016-08-30  547  static void aspeed_gpio_irq_unmask(struct irq_data *d)
361b79119a4b7f Joel Stanley           2016-08-30  548  {
361b79119a4b7f Joel Stanley           2016-08-30  549  	aspeed_gpio_irq_set_mask(d, true);
361b79119a4b7f Joel Stanley           2016-08-30  550  }
361b79119a4b7f Joel Stanley           2016-08-30  551  
361b79119a4b7f Joel Stanley           2016-08-30  552  static int aspeed_gpio_set_type(struct irq_data *d, unsigned int type)
361b79119a4b7f Joel Stanley           2016-08-30  553  {
361b79119a4b7f Joel Stanley           2016-08-30  554  	u32 type0 = 0;
361b79119a4b7f Joel Stanley           2016-08-30  555  	u32 type1 = 0;
361b79119a4b7f Joel Stanley           2016-08-30  556  	u32 type2 = 0;
361b79119a4b7f Joel Stanley           2016-08-30  557  	irq_flow_handler_t handler;
361b79119a4b7f Joel Stanley           2016-08-30  558  	struct aspeed_gpio *gpio;
361b79119a4b7f Joel Stanley           2016-08-30  559  	unsigned long flags;
a7ca13826e478f Benjamin Herrenschmidt 2018-06-29  560  	int rc, offset;
a7ca13826e478f Benjamin Herrenschmidt 2018-06-29  561  	bool copro;
361b79119a4b7f Joel Stanley           2016-08-30  562  
0e6ca482ec6e28 Billy Tsai             2024-08-30  563  	rc = irqd_to_aspeed_gpio_data(d, &gpio, &offset);
361b79119a4b7f Joel Stanley           2016-08-30  564  	if (rc)
361b79119a4b7f Joel Stanley           2016-08-30  565  		return -EINVAL;
361b79119a4b7f Joel Stanley           2016-08-30  566  
361b79119a4b7f Joel Stanley           2016-08-30  567  	switch (type & IRQ_TYPE_SENSE_MASK) {
361b79119a4b7f Joel Stanley           2016-08-30  568  	case IRQ_TYPE_EDGE_BOTH:
0e6ca482ec6e28 Billy Tsai             2024-08-30  569  		type2 = 1;
df561f6688fef7 Gustavo A. R. Silva    2020-08-23  570  		fallthrough;
361b79119a4b7f Joel Stanley           2016-08-30  571  	case IRQ_TYPE_EDGE_RISING:
0e6ca482ec6e28 Billy Tsai             2024-08-30  572  		type0 = 1;
df561f6688fef7 Gustavo A. R. Silva    2020-08-23  573  		fallthrough;
361b79119a4b7f Joel Stanley           2016-08-30  574  	case IRQ_TYPE_EDGE_FALLING:
361b79119a4b7f Joel Stanley           2016-08-30  575  		handler = handle_edge_irq;
361b79119a4b7f Joel Stanley           2016-08-30  576  		break;
361b79119a4b7f Joel Stanley           2016-08-30  577  	case IRQ_TYPE_LEVEL_HIGH:
0e6ca482ec6e28 Billy Tsai             2024-08-30  578  		type0 = 1;
df561f6688fef7 Gustavo A. R. Silva    2020-08-23  579  		fallthrough;
361b79119a4b7f Joel Stanley           2016-08-30  580  	case IRQ_TYPE_LEVEL_LOW:
0e6ca482ec6e28 Billy Tsai             2024-08-30  581  		type1 = 1;
361b79119a4b7f Joel Stanley           2016-08-30  582  		handler = handle_level_irq;
361b79119a4b7f Joel Stanley           2016-08-30  583  		break;
361b79119a4b7f Joel Stanley           2016-08-30  584  	default:
361b79119a4b7f Joel Stanley           2016-08-30  585  		return -EINVAL;
361b79119a4b7f Joel Stanley           2016-08-30  586  	}
361b79119a4b7f Joel Stanley           2016-08-30  587  
61a7904b6ace99 Iwona Winiarska        2021-12-04  588  	raw_spin_lock_irqsave(&gpio->lock, flags);
0e6ca482ec6e28 Billy Tsai             2024-08-30  589  	if (gpio->llops->copro_request)
0e6ca482ec6e28 Billy Tsai             2024-08-30  590  		copro = gpio->llops->copro_request(gpio, offset);
361b79119a4b7f Joel Stanley           2016-08-30  591  
0e6ca482ec6e28 Billy Tsai             2024-08-30  592  	gpio->llops->reg_bits_set(gpio, offset, reg_irq_type0, type0);
0e6ca482ec6e28 Billy Tsai             2024-08-30  593  	gpio->llops->reg_bits_set(gpio, offset, reg_irq_type1, type1);
0e6ca482ec6e28 Billy Tsai             2024-08-30  594  	gpio->llops->reg_bits_set(gpio, offset, reg_irq_type2, type2);
361b79119a4b7f Joel Stanley           2016-08-30  595  
0e6ca482ec6e28 Billy Tsai             2024-08-30 @596  	if (copro && gpio->llops->copro_release)
0e6ca482ec6e28 Billy Tsai             2024-08-30  597  		gpio->llops->copro_release(gpio, offset);
61a7904b6ace99 Iwona Winiarska        2021-12-04  598  	raw_spin_unlock_irqrestore(&gpio->lock, flags);
361b79119a4b7f Joel Stanley           2016-08-30  599  
361b79119a4b7f Joel Stanley           2016-08-30  600  	irq_set_handler_locked(d, handler);
361b79119a4b7f Joel Stanley           2016-08-30  601  
361b79119a4b7f Joel Stanley           2016-08-30  602  	return 0;
361b79119a4b7f Joel Stanley           2016-08-30  603  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


