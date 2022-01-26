Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28AC349CFD6
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jan 2022 17:38:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243175AbiAZQiY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Jan 2022 11:38:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243194AbiAZQiX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Jan 2022 11:38:23 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36AD2C06161C;
        Wed, 26 Jan 2022 08:38:23 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id f17so83020wrx.1;
        Wed, 26 Jan 2022 08:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8j/hotkBfcfAC9fYYJI4N9sX0l/gsHzV5UvDB38KzlI=;
        b=VXMrJJW+pQ42RG4deEVvp+yFWc6bkaLR9wDqTO5gHUjOT5VmjxbyheIeIVbFf7MR6f
         EvmVfpHadJ47gNlfj803NNiGTltsWtQA6UR7rO6DFAWUxEb5kb56jURIWjaGXWAydXDA
         uYfAn9Qvx7SJ4PHN54n3ddikbnyaCy6kOzDITttyZ5oKBSCp2llFa3pJnLOy1JCgFfuY
         kTXDxwpJBvAmJIOT9hRIBTOSiFtc+kPCbJ+KkJSL3g8fRq2iG1SofcwkPB8KKss56Cgc
         MMcvz+CT5jX0gV+ZCzSHVlSk6aKzUeSukaBh2Pqy5P0HZt58HDDLB/qZkYcIXn7u5bzC
         Xxcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8j/hotkBfcfAC9fYYJI4N9sX0l/gsHzV5UvDB38KzlI=;
        b=YcKrRLjlRncuSkOAyCk6CbqDboxhcgj+A7f4eg1acb0xOEjRk5WVcgOcyjvHd9kZDV
         YfFQSrrwGbhvnCCB0nZZB1/DaPrTGIPG9+sJfqTOmhgQr2EDx/ZiKNYQiC2RsjL/VVBg
         7ooXJ8s0E7zvXUD74Tf29mZ9cSr1YWVU0tqYZQp0ZuKeVAt9/KIZZSUfjFbLSC9VSzxm
         h6LxIVm7si4oUBOuhKlXwcGQdAd695m+Kar5tfMESwqCvE2IDRAH7gK3+7UhtcbJ4plt
         uz7xzvN/OcefX3g4or5KMuKiSRo+MH9wmLLpmYFvKyaNzDdecbb8cfooUOdJnIYxl37O
         hLQg==
X-Gm-Message-State: AOAM530XrKy87r4zNYIs7hMXMUWAw189ksdzEeOloK5fc3RTdAd1/7sd
        DmpDu7n3Mx1NaLxeqrnGV1rrLY8ve/0=
X-Google-Smtp-Source: ABdhPJwXkZ0z4nkzvw+UKERVJcFgweC/xWst69C+dJ+2zbylWTo/Pk2Fe7DTYafmMFwKaerx9Z4sSw==
X-Received: by 2002:a5d:64c8:: with SMTP id f8mr10223002wri.498.1643215101681;
        Wed, 26 Jan 2022 08:38:21 -0800 (PST)
Received: from kista.localnet (cpe-86-58-32-107.static.triera.net. [86.58.32.107])
        by smtp.gmail.com with ESMTPSA id o15sm4415607wms.9.2022.01.26.08.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jan 2022 08:38:21 -0800 (PST)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To:     linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>,
        Florian Fainelli <f.fainelli@gmail.com>, 5kft <5kft@5kft.org>,
        Corentin Labbe <clabbe.montjoie@gmail.com>
Subject: Re: [PATCH for 5.17] pinctrl-sunxi: sunxi_pinctrl_gpio_direction_in/output: use correct offset
Date:   Wed, 26 Jan 2022 17:38:20 +0100
Message-ID: <2613560.mvXUDI8C0e@kista>
In-Reply-To: <0f536cd8-01db-5d16-2cec-ec6d19409a49@xs4all.nl>
References: <20211206131648.1521868-1-hverkuil-cisco@xs4all.nl> <0f536cd8-01db-5d16-2cec-ec6d19409a49@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Hans!

Dne sreda, 26. januar 2022 ob 12:02:04 CET je Hans Verkuil napisal(a):
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

Next time please send to all sunxi maintainers/reviewers and mailing list.

Tested-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
> Corentin, can you please test this patch to verify that this fixes your
> issue on the orangepiPC?
> ---
> 
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/
pinctrl-sunxi.c
> index 80d6750c74a6..061323eab8b1 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> @@ -837,7 +837,8 @@ static int sunxi_pinctrl_gpio_direction_input(struct 
gpio_chip *chip,
>  {
>  	struct sunxi_pinctrl *pctl = gpiochip_get_data(chip);
> 
> -	return sunxi_pmx_gpio_set_direction(pctl->pctl_dev, NULL, offset, 
true);
> +	return sunxi_pmx_gpio_set_direction(pctl->pctl_dev, NULL,
> +					    chip->base + offset, 
true);
>  }
> 
>  static int sunxi_pinctrl_gpio_get(struct gpio_chip *chip, unsigned offset)
> @@ -890,7 +891,8 @@ static int sunxi_pinctrl_gpio_direction_output(struct 
gpio_chip *chip,
>  	struct sunxi_pinctrl *pctl = gpiochip_get_data(chip);
> 
>  	sunxi_pinctrl_gpio_set(chip, offset, value);
> -	return sunxi_pmx_gpio_set_direction(pctl->pctl_dev, NULL, offset, 
false);
> +	return sunxi_pmx_gpio_set_direction(pctl->pctl_dev, NULL,
> +					    chip->base + offset, 
false);
>  }
> 
>  static int sunxi_pinctrl_gpio_of_xlate(struct gpio_chip *gc,
> 


