Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C17A1518DC
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Feb 2020 11:33:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726726AbgBDKdT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 4 Feb 2020 05:33:19 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:42469 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726506AbgBDKdT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Feb 2020 05:33:19 -0500
Received: by mail-wr1-f67.google.com with SMTP id k11so22255509wrd.9
        for <linux-gpio@vger.kernel.org>; Tue, 04 Feb 2020 02:33:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=feC8pFmy5jztYI9yrDPCsF0ZmTp3ENBDnmmPXJ6c/54=;
        b=Y2FaLG/JEQBvlq9+nAVdVLsTL0IceN1pRd5Ol1HFcRmwFjTCSro/7ASx1g8klyv0tE
         diRA0EI0+hMQRyUxgFXU5gb2NUvtVT22+wTCl1CILQMqvMlYhkGMQ6knT9rWFoMvrxzE
         sGr9RFR1Md/43UmK1wauajdMQvrPxwRgP7eRNYfOwUgeuKZSSOsSWhBjVMWdfCzTT5rN
         CIkLTpiNdYWGH20OLnSoZu8RXTyg+sngGo9Ta7pnvnLSlmM3/MGbLysXRojNfpkbfTCe
         CsR4udDrLy1U9xX8MjMG1P3B4jVsd1UEsJmgzi+KRDNF/7wTfTAB4kOML44FOpKL8YN4
         Sr+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=feC8pFmy5jztYI9yrDPCsF0ZmTp3ENBDnmmPXJ6c/54=;
        b=C6CFCJqOYjv2bqsPsMrLSdPSUAJvDaafH3P2s44VE/MULQEWa7eXoC7X4EwpqKL7lg
         JmBdyEB/EKz+IpaNCSrM/6YssllQqXRQAoWRljckNAaSS7NEE5MtaG/0raqhfD8dBugd
         gOYmGvGrcxOGGaVy4d5GSzIPY3AhJxt13D/Lo7vSkKraXlHpcKvAWyU8J82L3LnvFtL4
         R40jrPBCb8FLJuFAEB7RSzBtHPuzNzqqLAQ7EMuTuUO8oAtP8WQS/IHzLypRnhNDUP8h
         BODWimHcyTtO6zUq+zIQX1HWmRJ9XR65R1YSR2DyOcBGtf4shX1bvjrcZWjqQOGa+0zS
         ogog==
X-Gm-Message-State: APjAAAWJ9x06uq+N1jjwarxkdh9Iq6W2hHo1kQFQekJJzwp3iSTUwTir
        Idqe4eTd9Q4Dh2V9cUqNfxAh48/7ybA=
X-Google-Smtp-Source: APXvYqwLR1PQrN4HdHQ+Qgsqn+HPQnBJka3ViQN3+pKqQYG/ZYeQEOyROjbmBWBrIO1ly9Iqx2kqTg==
X-Received: by 2002:a5d:4b88:: with SMTP id b8mr21663828wrt.343.1580812396780;
        Tue, 04 Feb 2020 02:33:16 -0800 (PST)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id r6sm30363112wrq.92.2020.02.04.02.33.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Feb 2020 02:33:16 -0800 (PST)
Subject: Re: [PATCH 2/2] gpio: wcd934x: Fix logic of wcd_gpio_get
To:     Axel Lin <axel.lin@ingics.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
References: <20200131122918.7127-1-axel.lin@ingics.com>
 <20200131122918.7127-2-axel.lin@ingics.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <f1968040-6ae9-8bb9-b47d-5e5ec3abf2a8@linaro.org>
Date:   Tue, 4 Feb 2020 10:33:15 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200131122918.7127-2-axel.lin@ingics.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Thanks for the patch!

On 31/01/2020 12:29, Axel Lin wrote:
> The check with register value and mask should be & rather than &&.
> While at it, also use "unsigned int" for value variable because
> regmap_read() takes unsigned int *val argument.
> 
> Signed-off-by: Axel Lin <axel.lin@ingics.com>

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


> ---
>   drivers/gpio/gpio-wcd934x.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-wcd934x.c b/drivers/gpio/gpio-wcd934x.c
> index 9d4ec8941b9b..1cbce5990855 100644
> --- a/drivers/gpio/gpio-wcd934x.c
> +++ b/drivers/gpio/gpio-wcd934x.c
> @@ -57,11 +57,11 @@ static int wcd_gpio_direction_output(struct gpio_chip *chip, unsigned int pin,
>   static int wcd_gpio_get(struct gpio_chip *chip, unsigned int pin)
>   {
>   	struct wcd_gpio_data *data = gpiochip_get_data(chip);
> -	int value;
> +	unsigned int value;
>   
>   	regmap_read(data->map, WCD_REG_VAL_CTL_OFFSET, &value);
>   
> -	return !!(value && WCD_PIN_MASK(pin));
> +	return !!(value & WCD_PIN_MASK(pin));
>   }
>   
>   static void wcd_gpio_set(struct gpio_chip *chip, unsigned int pin, int val)
> 
