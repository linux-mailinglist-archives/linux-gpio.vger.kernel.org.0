Return-Path: <linux-gpio+bounces-3463-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D7C85B233
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Feb 2024 06:15:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 72903B21166
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Feb 2024 05:15:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA18956B78;
	Tue, 20 Feb 2024 05:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sabK4CuL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C94855E56
	for <linux-gpio@vger.kernel.org>; Tue, 20 Feb 2024 05:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708406108; cv=none; b=dXCJ892kvdgAvEaCeU9GF5WoreWJ9lXkRJgUy6HVJsYq2caKTukaQG/E4rS1VuXtTDBfKFao5dzYcPsOaOk0M7qR0Dnaq3YjBhydK4axQtzV4hrxotR6jzT9sLaA8prf/Ig5HJrsxE2gUBTQ//G76QkqGmwnYSQu7hRQD2cIyMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708406108; c=relaxed/simple;
	bh=lJ5eHoDO1q2KH+q2LYf17Mns667I/8oNXkiqviWmwUM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AalQuJhkIweckBWw6QZzjC0Ttx9tsaQBSSrg4FU6Axh4uK8fMsiaIt9dfj6CDKOkDdOOmSY9dlJNgBcCCVlxHnAXz+AEN9rbpioPfaLIIjcnuD0pBhnk/7L/tOBDDgmuDpd1YHbDHQ/gnOKmZlfmjiLvXc0TIISppg0UYalNQPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sabK4CuL; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a3e72ec566aso232952266b.2
        for <linux-gpio@vger.kernel.org>; Mon, 19 Feb 2024 21:15:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708406103; x=1709010903; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YHI3KbpgapQRx9GIeYIL4HFsWQEAsBDxc3rS4slc7Po=;
        b=sabK4CuL7wxKOKMNV1siDAG9DhZGry4O1cbo9GsWo1m0/apsjQPRZBp3qaL63ywOwc
         dibEfpnyzwx/Eigjb0aKCO/9ZWUXnYVsTnhmCZJjXSNibRvlUf5WysouGyoCbpyT8A1Q
         nxUWIxYfi8ehXCzHUYJiPwM4P+w5NLq3lVAC2KSrV2qkBMkKAHPSXX480SS58SzSqSBA
         P9eM+c56+XLuLpvptRwn7o8tIXR/3SFqr35OOZKFr0pQiJSAvZ7qmScfJXS5XfH3Sryu
         5ten3C9d0AVUbNpyoV6EaOdTGC5FCzJ8iWMiGKOomQN9212EtZ5gQnK7Tcgd8L062qOh
         po7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708406103; x=1709010903;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YHI3KbpgapQRx9GIeYIL4HFsWQEAsBDxc3rS4slc7Po=;
        b=OFRxjj4qo09nK9zqFfvO+gRiqe/gGgTP4bp19I55Syei86gF4czRn7PdJXl/8xpctr
         ptv7RmOlRbygNpUTQj2OK0vz6N5MQXUApXmA934WE5FwhQUaV+4Zub9aSI3vxeGlV1u9
         ILpfqZEFydX0No0dQnV9FMQTC7jnUrzkeZx7N1SkpGFPearxRomteZAy1VkUGRfX+yVZ
         CL00xE11MoP1IErjOn9R7e8Yei2sKEMMZ0Uwd47cXetZ/7i+j1d+l/Jxd1SxZg3WiP/A
         Zm5rWqbT62cY3Dq7PaJtyWa+aD/KwwsZmXksWgurfvPFq2Mbpw47yzgPN11+laZFoyCG
         f0wA==
X-Forwarded-Encrypted: i=1; AJvYcCXjBmw+djoXhpLMOwvoikLYuAzAB9TUIH7ZVdq6b7GKfH3c1wWN6n5n4UBG1ZfNa8MsiMEacCMOEEbUPzY43gv67MGSRIAwmsUaWg==
X-Gm-Message-State: AOJu0YzX/gwt22GODKct1sd8qpEgHKOkmMvXIQkhwG5LUR/Aa1vf8Zd9
	4hhPsnYfl2psP4zP0VbDEK1pKahLEnS85QRkd2nyQORsmR9O3nIbOL/BE9krDqc=
X-Google-Smtp-Source: AGHT+IEP+YoDwhEuY+D6G+dXMKEyvqAlvZi4hY8lJrZDhcxGQJ8Ux5nlJYdTcRxw5vTTdsfSLRVSEQ==
X-Received: by 2002:a17:906:b352:b0:a3e:6463:2fc7 with SMTP id cd18-20020a170906b35200b00a3e64632fc7mr3948486ejb.4.1708406103676;
        Mon, 19 Feb 2024 21:15:03 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id cu11-20020a170906ba8b00b00a3ee5c19ee5sm523401ejd.109.2024.02.19.21.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 21:15:03 -0800 (PST)
Date: Tue, 20 Feb 2024 08:15:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Linus Walleij <linus.walleij@linaro.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-gpio@vger.kernel.org
Subject: [linusw-gpio:b4/descriptors-regulators 3/6]
 drivers/regulator/da9055-regulator.c:481 da9055_gpio_init() error:
 uninitialized symbol 'ret'.
Message-ID: <64de8aad-9b6a-4c6c-b02c-58c163d4aadf@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git b4/descriptors-regulators
head:   70f1ac1c0e32e3d7fb546eac70f113bd57b659fa
commit: db93c3de09384ee1d48a99bb103a49938f80e046 [3/6] regulator: da9055: Fully convert to GPIO descriptors
config: nios2-randconfig-r071-20240219 (https://download.01.org/0day-ci/archive/20240220/202402200604.tilWhpaa-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202402200604.tilWhpaa-lkp@intel.com/

smatch warnings:
drivers/regulator/da9055-regulator.c:481 da9055_gpio_init() error: uninitialized symbol 'ret'.

vim +/ret +481 drivers/regulator/da9055-regulator.c

db93c3de09384e Linus Walleij 2024-02-15  415  static int da9055_gpio_init(struct device *dev,
db93c3de09384e Linus Walleij 2024-02-15  416  			    struct da9055_regulator *regulator,
f6130be652d0b4 Ashish Jangam 2012-11-01  417  			    struct regulator_config *config,
f6130be652d0b4 Ashish Jangam 2012-11-01  418  			    struct da9055_pdata *pdata, int id)
f6130be652d0b4 Ashish Jangam 2012-11-01  419  {
f6130be652d0b4 Ashish Jangam 2012-11-01  420  	struct da9055_regulator_info *info = regulator->info;
db93c3de09384e Linus Walleij 2024-02-15  421  	struct gpio_desc *ren;
db93c3de09384e Linus Walleij 2024-02-15  422  	struct gpio_desc *ena;
db93c3de09384e Linus Walleij 2024-02-15  423  	struct gpio_desc *rsel;
db93c3de09384e Linus Walleij 2024-02-15  424  	int ret;
f6130be652d0b4 Ashish Jangam 2012-11-01  425  
db93c3de09384e Linus Walleij 2024-02-15  426  	/* Look for "regulator-enable-gpios" GPIOs in the regulator node */
db93c3de09384e Linus Walleij 2024-02-15  427  	ren = devm_gpiod_get_optional(dev, "regulator-enable", GPIOD_IN);

If both devm_gpiod_get_optional() calls return NULL then "ret" ends up
being uninitialized.

db93c3de09384e Linus Walleij 2024-02-15  428  	if (IS_ERR(ren))
db93c3de09384e Linus Walleij 2024-02-15  429  		return PTR_ERR(ren);
8b61a28d616a34 Adam Thomson  2014-02-06  430  
db93c3de09384e Linus Walleij 2024-02-15  431  	if (ren) {
db93c3de09384e Linus Walleij 2024-02-15  432  		/* This GPIO is not optional at this point */
db93c3de09384e Linus Walleij 2024-02-15  433  		ena = devm_gpiod_get(dev, "enable", GPIOD_OUT_HIGH);
db93c3de09384e Linus Walleij 2024-02-15  434  		if (IS_ERR(ena))
db93c3de09384e Linus Walleij 2024-02-15  435  			return PTR_ERR(ena);
f6130be652d0b4 Ashish Jangam 2012-11-01  436  
db93c3de09384e Linus Walleij 2024-02-15  437  		config->ena_gpiod = ena;
f6130be652d0b4 Ashish Jangam 2012-11-01  438  
f6130be652d0b4 Ashish Jangam 2012-11-01  439  		/*
f6130be652d0b4 Ashish Jangam 2012-11-01  440  		 * GPI pin is muxed with regulator to control the
f6130be652d0b4 Ashish Jangam 2012-11-01  441  		 * regulator state.
f6130be652d0b4 Ashish Jangam 2012-11-01  442  		 */
db93c3de09384e Linus Walleij 2024-02-15  443  		gpiod_set_consumer_name(ren, "DA9055 ren GPI");
f6130be652d0b4 Ashish Jangam 2012-11-01  444  
f6130be652d0b4 Ashish Jangam 2012-11-01  445  		/*
f6130be652d0b4 Ashish Jangam 2012-11-01  446  		 * Let the regulator know that its state is controlled
f6130be652d0b4 Ashish Jangam 2012-11-01  447  		 * through GPI.
f6130be652d0b4 Ashish Jangam 2012-11-01  448  		 */
f6130be652d0b4 Ashish Jangam 2012-11-01  449  		ret = da9055_reg_update(regulator->da9055, info->conf.reg,
f6130be652d0b4 Ashish Jangam 2012-11-01  450  					DA9055_E_GPI_MASK,
f6130be652d0b4 Ashish Jangam 2012-11-01  451  					pdata->reg_ren[id]
f6130be652d0b4 Ashish Jangam 2012-11-01  452  					<< DA9055_E_GPI_SHIFT);
f6130be652d0b4 Ashish Jangam 2012-11-01  453  		if (ret < 0)
db93c3de09384e Linus Walleij 2024-02-15  454  			return ret;
f6130be652d0b4 Ashish Jangam 2012-11-01  455  	}
f6130be652d0b4 Ashish Jangam 2012-11-01  456  
db93c3de09384e Linus Walleij 2024-02-15  457  	/* Look for "regulator-select-gpios" GPIOs in the regulator node */
db93c3de09384e Linus Walleij 2024-02-15  458  	rsel = devm_gpiod_get_optional(dev, "regulator-select", GPIOD_IN);
db93c3de09384e Linus Walleij 2024-02-15  459  	if (IS_ERR(rsel))
db93c3de09384e Linus Walleij 2024-02-15  460  		return PTR_ERR(rsel);
f6130be652d0b4 Ashish Jangam 2012-11-01  461  
db93c3de09384e Linus Walleij 2024-02-15  462  	if (rsel) {
f6130be652d0b4 Ashish Jangam 2012-11-01  463  		regulator->reg_rselect = pdata->reg_rsel[id];
f6130be652d0b4 Ashish Jangam 2012-11-01  464  
f6130be652d0b4 Ashish Jangam 2012-11-01  465  		/*
f6130be652d0b4 Ashish Jangam 2012-11-01  466  		 * GPI pin is muxed with regulator to select the
f6130be652d0b4 Ashish Jangam 2012-11-01  467  		 * regulator register set A/B for voltage ramping.
f6130be652d0b4 Ashish Jangam 2012-11-01  468  		 */
db93c3de09384e Linus Walleij 2024-02-15  469  		gpiod_set_consumer_name(rsel, "DA9055 rsel GPI");
f6130be652d0b4 Ashish Jangam 2012-11-01  470  
f6130be652d0b4 Ashish Jangam 2012-11-01  471  		/*
f6130be652d0b4 Ashish Jangam 2012-11-01  472  		 * Let the regulator know that its register set A/B
f6130be652d0b4 Ashish Jangam 2012-11-01  473  		 * will be selected through GPI for voltage ramping.
f6130be652d0b4 Ashish Jangam 2012-11-01  474  		 */
f6130be652d0b4 Ashish Jangam 2012-11-01  475  		ret = da9055_reg_update(regulator->da9055, info->conf.reg,
f6130be652d0b4 Ashish Jangam 2012-11-01  476  					DA9055_V_GPI_MASK,
f6130be652d0b4 Ashish Jangam 2012-11-01  477  					pdata->reg_rsel[id]
f6130be652d0b4 Ashish Jangam 2012-11-01  478  					<< DA9055_V_GPI_SHIFT);
f6130be652d0b4 Ashish Jangam 2012-11-01  479  	}
f6130be652d0b4 Ashish Jangam 2012-11-01  480  
f6130be652d0b4 Ashish Jangam 2012-11-01 @481  	return ret;
f6130be652d0b4 Ashish Jangam 2012-11-01  482  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


