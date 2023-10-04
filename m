Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 349DE7B7794
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Oct 2023 08:01:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232604AbjJDGBw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Oct 2023 02:01:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229541AbjJDGBv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Oct 2023 02:01:51 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6B33B0
        for <linux-gpio@vger.kernel.org>; Tue,  3 Oct 2023 23:01:44 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1c735473d1aso13218585ad.1
        for <linux-gpio@vger.kernel.org>; Tue, 03 Oct 2023 23:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696399304; x=1697004104; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2AsdbIyv3XcAYC3suv1NhcQN7xXYxXg8ts9w0KLbx0U=;
        b=XQhOi5E1pijdvUgbDCU75RzHrMPix5eiY8c8kIJ3EIjwY3qEqbpyx06ck6VMfIZ1+X
         6JryMG7ke4C0MmDo6xULb7hJuUn9zaSpEfdTmnGQCxUVLKlEqFMbdj6s0B4ZsYDZihrh
         EyadvtTDfr6s+JVwIlac96IupSqtgHSp7EYb/C1x/57XHAIzGdp4AOQd0EZtin0r3RND
         d2PRw2xwfsvT+gFM9XmCPQgB9pvQPffS2kIOYFH8/FYgYq3NdrFvvSyhh/lU88McPXeF
         o6F5WcMeTMF4zcIkscIeCOtfk5xc5+miqQBnG5tH4Fjl2SFf1y9baBtQt1W1BM6lUTHo
         ZEng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696399304; x=1697004104;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2AsdbIyv3XcAYC3suv1NhcQN7xXYxXg8ts9w0KLbx0U=;
        b=Rxy55zpw1X8a97hq/Ol5WzxuC7klj/Y9KTlA0W92LhfjmZLwwIOJTzPOdeaUFzAE09
         k51CpVjG7zfAeTpRP+t2KIXTypP4onO2LUMBOiJ2V5a8w39AdFR/ixe7QZRyw8A7Rusr
         i7ZD624Ej1llvZZVJHfpfBowy2NmKEVQodmfCf+Mzs3XIm/aLREmqIN36/w+jJveiIeD
         G4kfo8c9WCx/jf1D2otq+FqlDXW+KfODzjv8Gmi7koVQORtMJv2zM6alLY/35r4eGlCc
         V28sd7ByQDMil2rLZfd+lB+8YiW9IDlmn4rXtqCmSoxHt4H2p2tuu8m8upYEhuuHP4gc
         MIEw==
X-Gm-Message-State: AOJu0Yyc41Gum7YZTQ3oflEYtG9PRo7mjp1W2GSpwlD9meERboodOHar
        BW7+B7EzFaeMQGyU1BfDWMNjUg==
X-Google-Smtp-Source: AGHT+IGCj5ut6r5kBF2Dhj8lVGxq0KhDKOo/FWs618LaeYnXFGYjKIhGppdpnZOvRt2vIMJ/oCWYMw==
X-Received: by 2002:a17:902:d485:b0:1c8:791c:d782 with SMTP id c5-20020a170902d48500b001c8791cd782mr502820plg.29.1696399304145;
        Tue, 03 Oct 2023 23:01:44 -0700 (PDT)
Received: from localhost ([122.172.81.92])
        by smtp.gmail.com with ESMTPSA id w9-20020a1709026f0900b001c73f52dbb6sm2752530plk.17.2023.10.03.23.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 23:01:43 -0700 (PDT)
Date:   Wed, 4 Oct 2023 11:31:40 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Viresh Kumar <vireshk@kernel.org>,
        Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org
Subject: Re: [PATCH 17/36] pinctrl: spear: use new pinctrl GPIO helpers
Message-ID: <20231004060140.ivkvtabblqesleow@vireshk-i7>
References: <20231003145114.21637-1-brgl@bgdev.pl>
 <20231003145114.21637-18-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231003145114.21637-18-brgl@bgdev.pl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 03-10-23, 16:50, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Replace the pinctrl helpers taking the global GPIO number as argument
> with the improved variants that instead take a pointer to the GPIO chip
> and the controller-relative offset.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/pinctrl/spear/pinctrl-plgpio.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/pinctrl/spear/pinctrl-plgpio.c b/drivers/pinctrl/spear/pinctrl-plgpio.c
> index 722681e0b89b..7488f6394318 100644
> --- a/drivers/pinctrl/spear/pinctrl-plgpio.c
> +++ b/drivers/pinctrl/spear/pinctrl-plgpio.c
> @@ -204,14 +204,13 @@ static void plgpio_set_value(struct gpio_chip *chip, unsigned offset, int value)
>  static int plgpio_request(struct gpio_chip *chip, unsigned offset)
>  {
>  	struct plgpio *plgpio = gpiochip_get_data(chip);
> -	int gpio = chip->base + offset;
>  	unsigned long flags;
>  	int ret = 0;
>  
>  	if (offset >= chip->ngpio)
>  		return -EINVAL;
>  
> -	ret = pinctrl_gpio_request(gpio);
> +	ret = pinctrl_gpio_request_new(chip, offset);
>  	if (ret)
>  		return ret;
>  
> @@ -249,14 +248,13 @@ static int plgpio_request(struct gpio_chip *chip, unsigned offset)
>  	if (!IS_ERR(plgpio->clk))
>  		clk_disable(plgpio->clk);
>  err0:
> -	pinctrl_gpio_free(gpio);
> +	pinctrl_gpio_free_new(chip, offset);
>  	return ret;
>  }
>  
>  static void plgpio_free(struct gpio_chip *chip, unsigned offset)
>  {
>  	struct plgpio *plgpio = gpiochip_get_data(chip);
> -	int gpio = chip->base + offset;
>  	unsigned long flags;
>  
>  	if (offset >= chip->ngpio)
> @@ -280,7 +278,7 @@ static void plgpio_free(struct gpio_chip *chip, unsigned offset)
>  	if (!IS_ERR(plgpio->clk))
>  		clk_disable(plgpio->clk);
>  
> -	pinctrl_gpio_free(gpio);
> +	pinctrl_gpio_free_new(chip, offset);
>  }

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
