Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 399F84A0237
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jan 2022 21:41:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349685AbiA1UlU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 Jan 2022 15:41:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351449AbiA1Ukj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Jan 2022 15:40:39 -0500
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com [IPv6:2607:f8b0:4864:20::c34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55BB3C061760;
        Fri, 28 Jan 2022 12:40:39 -0800 (PST)
Received: by mail-oo1-xc34.google.com with SMTP id o188-20020a4a44c5000000b002e6c0c05892so309ooa.13;
        Fri, 28 Jan 2022 12:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Fg9QaVeDlSVPFTJDgiWGqYioChAVJcY9O6iWSNFuU2s=;
        b=Xp5SRSRbuUVe8aVez9u9IeWplh6j1Q/UvjhKyENHpXHbKTbXzJ64fUc3Tqxl3MZcOv
         K7OHWqKY4wT+100+0V+8IyIcQ6Se8Up4V8H1F8GQOTVUrntzDEHl0El44pQBMNy6onBj
         tfVE7aSbw0VhG7vqUb//YA0JGi8iE0jMMgXoq0EO0TZROcAaGQ9XUaPiaQ+Z/RMn7AXu
         tgYicuut+lg9vETUtekjIf5g/oR0VKnBi0ogyFT5UGeIuUINweBRfirs/zICmYYduY11
         +9Vkaj9ManxBSH2LonV3lAWPX5e0KZSYPn9U+nd5/sFY7OLrwd9vtcl11ew9jEjp1T3K
         DAhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=Fg9QaVeDlSVPFTJDgiWGqYioChAVJcY9O6iWSNFuU2s=;
        b=Yo5EqIYtGKjbpo5EFk4o/xZMSEJSKKJi8M2Om+KFYaHSydMrZNmqyomHc7lw2LgP3c
         85WpjPG1sa3RJrcz6bYfXkaxI+Lvptcl/TmDjeDjmpvPWABEU3xWW8mgiRyTlUDCG9fg
         YFtW8gIV4FlkiCL9atqvxoWQhM6qUOQY1f/UuBsFSzuCToPdqPajsfoimec4PgYzR3Vo
         vTVb5SGfd+94Syp1PFMcd6d/UyrHxWydZ4J13762YOhRr2gBf/BlPOlyqkrcNYOlHX6t
         ndzKMMheHHHB0up9ZeeKH1ja51UqJbwzQa58ISMm2hCppnPXxG5NDKkrtDXf4vGvpbEK
         Qjcw==
X-Gm-Message-State: AOAM532cSfHs/f6F76xEzN1AkB8tG8jhDLwvHhWCXQvgGhwgb0ktEsLA
        6jTSLu5CWys/NcbEaa7TbZw=
X-Google-Smtp-Source: ABdhPJyYDk+MBJcku5rv4QX55U83Jdlo7+HrAdvMz/x+QLI1+YLJU8hDOvLPlfEUXL9K4cfYbEwBlg==
X-Received: by 2002:a4a:bc91:: with SMTP id m17mr5161876oop.86.1643402438711;
        Fri, 28 Jan 2022 12:40:38 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id p5sm5703516oou.39.2022.01.28.12.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jan 2022 12:40:37 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 28 Jan 2022 12:40:36 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>,
        Florian Fainelli <f.fainelli@gmail.com>, 5kft <5kft@5kft.org>,
        Corentin Labbe <clabbe.montjoie@gmail.com>
Subject: Re: [PATCH for 5.17] pinctrl-sunxi:
 sunxi_pinctrl_gpio_direction_in/output: use correct offset
Message-ID: <20220128204036.GA1798576@roeck-us.net>
References: <20211206131648.1521868-1-hverkuil-cisco@xs4all.nl>
 <0f536cd8-01db-5d16-2cec-ec6d19409a49@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0f536cd8-01db-5d16-2cec-ec6d19409a49@xs4all.nl>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jan 26, 2022 at 12:02:04PM +0100, Hans Verkuil wrote:
> The commit that sets the direction directly without calling
> pinctrl_gpio_direction(), forgot to add chip->base to the offset when
> calling sunxi_pmx_gpio_set_direction().
> 
> This caused failures for various Allwinner boards which have two
> GPIO blocks.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Reported-by: 5kft <5kft@5kft.org>
> Suggested-by: 5kft <5kft@5kft.org>
> Reported-by: Corentin Labbe <clabbe.montjoie@gmail.com>
> Fixes: 8df89a7cbc63 (pinctrl-sunxi: don't call pinctrl_gpio_direction())
> Tested-by: Corentin Labbe <clabbe.montjoie@gmail.com>
> Tested-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Tested-by: Guenter Roeck <linux@roeck-us.net>

Guenter

> ---
> Corentin, can you please test this patch to verify that this fixes your
> issue on the orangepiPC?
> ---
> 
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> index 80d6750c74a6..061323eab8b1 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> @@ -837,7 +837,8 @@ static int sunxi_pinctrl_gpio_direction_input(struct gpio_chip *chip,
>  {
>  	struct sunxi_pinctrl *pctl = gpiochip_get_data(chip);
> 
> -	return sunxi_pmx_gpio_set_direction(pctl->pctl_dev, NULL, offset, true);
> +	return sunxi_pmx_gpio_set_direction(pctl->pctl_dev, NULL,
> +					    chip->base + offset, true);
>  }
> 
>  static int sunxi_pinctrl_gpio_get(struct gpio_chip *chip, unsigned offset)
> @@ -890,7 +891,8 @@ static int sunxi_pinctrl_gpio_direction_output(struct gpio_chip *chip,
>  	struct sunxi_pinctrl *pctl = gpiochip_get_data(chip);
> 
>  	sunxi_pinctrl_gpio_set(chip, offset, value);
> -	return sunxi_pmx_gpio_set_direction(pctl->pctl_dev, NULL, offset, false);
> +	return sunxi_pmx_gpio_set_direction(pctl->pctl_dev, NULL,
> +					    chip->base + offset, false);
>  }
> 
>  static int sunxi_pinctrl_gpio_of_xlate(struct gpio_chip *gc,
