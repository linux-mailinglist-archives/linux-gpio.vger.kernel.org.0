Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2CA0255842
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Aug 2020 12:04:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728532AbgH1KD4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 Aug 2020 06:03:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728269AbgH1KDy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Aug 2020 06:03:54 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A7A0C061264;
        Fri, 28 Aug 2020 03:03:54 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id u128so409982pfb.6;
        Fri, 28 Aug 2020 03:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JeATIG32mt8GW6hG8YQG7ME9WIX0ZVokl8LGrdLF2VI=;
        b=npg/pMc4xABa6t0kSPLrj5t0jRwEpQAQYUmdQOPQPG6nINTTJP69y7uqI6mM/VpPxw
         cYwVEFkyQ7quMqgaUMVLWeW+z1heNIuuVUg0LO2Yh8US7xawckT7OOo8gYFxeHNrrDO1
         lYpQkCVocyE8tAEt2sZIz4RMKbIvC7khbR7gX9s2l9yQsr6iHWCysgEUqDQpWHGqc2Gq
         aGLDUQj2JBpUGPzpZzp4/repGsJQbDsdIgWFVHpkH1yAbBdltOFaQtfPr74096y8mqXY
         LPfh0ght00BoCZ7ujUc5gzR/x7AWjzC7pUN1TpLkvDfS0w4JVfAjpOnIRzVHrozs7t1Z
         yV4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JeATIG32mt8GW6hG8YQG7ME9WIX0ZVokl8LGrdLF2VI=;
        b=nHkFUTVFEOuET7Fb8n6NS7Is3HcB62Ye/wzBGKGVAgXbzeF3LQyMWXnkW5WWkqzO1h
         P+K7yFYVqZWJLjb+x+nLa4hukShJYIA0tK6F9xLWMmnc2UdcgrbPhd1MVcIJE4/SU8N9
         Ola0iLyftTZs1t3ofvVDIz2g16IhYjjl9qjKbne0OeCliYzFWVzCiAS7hf83ccQcRpPm
         L6r/1GFHwy4SdS5G/TGGM/48huRlNULCD0EYAArXVSpYXXX73BNFktrkWKlxZcbYGaS+
         8FS8yCkqoAzwr5lFFm6DVlRTSUZNTYM4P9QlRRmZHoi5FY03u7Il1NBKqB3vq0Zubeye
         z6Cg==
X-Gm-Message-State: AOAM533cXBTTNUPHatN9qxCx/u6H40x/IsEnJNSbXC0fUM7v/aqTSG/D
        sjBaYF9NqhA5edqsSSQ/e+Iuh+D2kgpwmAdTfds=
X-Google-Smtp-Source: ABdhPJxsTwYbt3QLI1AYzLLB4HUv6BawDn4RGcqcVV9H9EDxrPfXt+vJuJyh8mufFdOb+FW6DoXr6LBLNzKRIzpPV1g=
X-Received: by 2002:a63:ec18:: with SMTP id j24mr677384pgh.74.1598609033963;
 Fri, 28 Aug 2020 03:03:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200827200827.26462-1-krzk@kernel.org>
In-Reply-To: <20200827200827.26462-1-krzk@kernel.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 28 Aug 2020 13:03:37 +0300
Message-ID: <CAHp75Veu+EpM-OY7TOHfBg-HteAmN+vbSfqmkO-2O2-qA4VQTA@mail.gmail.com>
Subject: Re: [PATCH 1/6] gpio: bcm-kona: Simplify with dev_err_probe()
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Ray Jui <rjui@broadcom.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Keerthy <j-keerthy@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux OMAP Mailing List <linux-omap@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 27, 2020 at 11:09 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and also it prints the error value.
>

I believe you are doing this right (after we have discussed previous
series and approaches).
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
for entire series (Linus!)

> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/gpio/gpio-bcm-kona.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/gpio/gpio-bcm-kona.c b/drivers/gpio/gpio-bcm-kona.c
> index cf3687a7925f..1e6b427f2c4a 100644
> --- a/drivers/gpio/gpio-bcm-kona.c
> +++ b/drivers/gpio/gpio-bcm-kona.c
> @@ -590,10 +590,7 @@ static int bcm_kona_gpio_probe(struct platform_device *pdev)
>                 dev_err(dev, "Couldn't determine # GPIO banks\n");
>                 return -ENOENT;
>         } else if (ret < 0) {
> -               if (ret != -EPROBE_DEFER)
> -                       dev_err(dev, "Couldn't determine GPIO banks: (%pe)\n",
> -                               ERR_PTR(ret));
> -               return ret;
> +               return dev_err_probe(dev, ret, "Couldn't determine GPIO banks\n");
>         }
>         kona_gpio->num_bank = ret;
>
> --
> 2.17.1
>


-- 
With Best Regards,
Andy Shevchenko
