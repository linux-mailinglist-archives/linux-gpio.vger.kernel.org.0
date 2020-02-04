Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6D8F1518D9
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Feb 2020 11:32:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726965AbgBDKct (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 4 Feb 2020 05:32:49 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:39043 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726631AbgBDKct (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Feb 2020 05:32:49 -0500
Received: by mail-wm1-f66.google.com with SMTP id c84so2892723wme.4
        for <linux-gpio@vger.kernel.org>; Tue, 04 Feb 2020 02:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zdJKTowxArhHEkmwUy9N44C1J4/7uJ6nWxYZYEU6+kM=;
        b=GAfqQAiKAuc2NeQ4/Nepj0lF/6GVTkLD0X+wFMOj4E+uJwd31ZuUBwTUoM7+q+4aHp
         0Kx8mMyLh02oNVtPv4qwJZpE7pjppLMwoqa72qvOR7kqoQGSttKFyhQlOst+wVbaFd5N
         g2ltDIT4doZwUbg2pXKZuUfkYPyEJq9wDEaIDCsCKN060Y7B+YKdF3Xt8fnG051Xfqwl
         by2q1/Xy9GZrRUqX8M9ERBlK8w8F6UdeSNsFt1mu6PiOMMrMvqKyVzHBOOyw65uEsns3
         UkzVXr7/085E7iGanjA5RARyv9WyyBGQbR9ZuU9SMbX3bbII3xYSw+I/S/CqV3ApDJkp
         AdcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zdJKTowxArhHEkmwUy9N44C1J4/7uJ6nWxYZYEU6+kM=;
        b=s6VetFf5ye8LgapAVqqQn3bnZvJU/m9WleTjpWLPWK0hB5riCE0q3vOl16eyZGVcrW
         XsgJ/G7Hp5Ibs31cfLQ2wBFwagKP8rxBf8vLDc56kkE0WYJQOykj0jXIzgxmW0gShNmp
         /3n4PZPgxqlDJhOwiXODcCxetpb5LXxS+X59Rc4NFR0s0fQ8Ro9JLbzUv8p1e8vUBQIc
         md/85Dvz1n5RRGdBCqNBIrTb5RL8Fpc5dCl/eR+/rxwNo4Thr5cyfQ0uY7fO+VMUAOGP
         We7XFBO5/znfRu6c1mJz720LBv++VDPO7zvG4BTivzyAkpXBjwsbBSA84QOLB+2emzFl
         reGQ==
X-Gm-Message-State: APjAAAW2p/CHza6k6sPnWejMglGaduRQ/xLDfQQq0amvVsJoL0A7YLdN
        R5k0j+5bbECiwYym8cydHG8oQ/Jt5Ek=
X-Google-Smtp-Source: APXvYqxnoI8qVuETbiQGCitWD+UjiK//iokRrC9tJR5r3LzxmUla0cTrdpHYaOtO9X1PYqaQbBRtbw==
X-Received: by 2002:a1c:6755:: with SMTP id b82mr5243404wmc.126.1580812365761;
        Tue, 04 Feb 2020 02:32:45 -0800 (PST)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id t9sm19512394wrv.63.2020.02.04.02.32.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Feb 2020 02:32:44 -0800 (PST)
Subject: Re: [PATCH 1/2] gpio: wcd934x: Don't change gpio direction in
 wcd_gpio_set
To:     Axel Lin <axel.lin@ingics.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
References: <20200131122918.7127-1-axel.lin@ingics.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <6ca9f838-cca1-c168-334e-59c3e13ec43e@linaro.org>
Date:   Tue, 4 Feb 2020 10:32:44 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200131122918.7127-1-axel.lin@ingics.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Thanks for the patch!

On 31/01/2020 12:29, Axel Lin wrote:
> The .set callback should just set output value.
> 
> Signed-off-by: Axel Lin <axel.lin@ingics.com>

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

> ---
> Hi Srinivas,
> I don't have this h/w to test, so please help to review and test the patchs.
> Thanks,
> Axel
>   drivers/gpio/gpio-wcd934x.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpio/gpio-wcd934x.c b/drivers/gpio/gpio-wcd934x.c
> index 74913f2e5697..9d4ec8941b9b 100644
> --- a/drivers/gpio/gpio-wcd934x.c
> +++ b/drivers/gpio/gpio-wcd934x.c
> @@ -66,7 +66,10 @@ static int wcd_gpio_get(struct gpio_chip *chip, unsigned int pin)
>   
>   static void wcd_gpio_set(struct gpio_chip *chip, unsigned int pin, int val)
>   {
> -	wcd_gpio_direction_output(chip, pin, val);
> +	struct wcd_gpio_data *data = gpiochip_get_data(chip);
> +
> +	regmap_update_bits(data->map, WCD_REG_VAL_CTL_OFFSET,
> +			   WCD_PIN_MASK(pin), val ? WCD_PIN_MASK(pin) : 0);
>   }
>   
>   static int wcd_gpio_probe(struct platform_device *pdev)
> 
