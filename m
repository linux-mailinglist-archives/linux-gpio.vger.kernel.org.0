Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCFC3307E25
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Jan 2021 19:39:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232141AbhA1Shy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Jan 2021 13:37:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232199AbhA1Sfu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Jan 2021 13:35:50 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A9DCC061573;
        Thu, 28 Jan 2021 10:35:09 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id 190so5102408wmz.0;
        Thu, 28 Jan 2021 10:35:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=p+3jXSCd3eL1lTApLBIZW/Smtaqjvne0P4IvWGEFRUM=;
        b=NWTarmKNM0dBAefoSzAgsf5drBqTcY1TePiVQFDTTqv6D00E+HQYOmj2ZxA3VWLXKu
         h6j1iNMbWNVeX0P9GbRG4Cxh/Cu6TOX0WrpDCY9hUGE7pg3yJrmg5Q+qy/4oMR0broAG
         D2/mqEhyTidNVIhEAsRdOuH8isvuVyZGoUusSQEKIfPB09v+d0884tHIKYqWqQQMXmzQ
         07p89LBlhaQG7SJOf9QccLQAucl4cXKOzHEQ8mMhehEScaDFVvnPwb5h1wbSd9NhA5u8
         ParofBtCPjm2m+IFXJnHNREKkxSCIALZK+PP4V9amu0syTGs/p7oIaABPl+przP6N0lp
         52Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=p+3jXSCd3eL1lTApLBIZW/Smtaqjvne0P4IvWGEFRUM=;
        b=jXDUX1WZF5jHmGOKV1aqGdX/J1Ya1SIKMxCuJxakCBtiUbZghsmQusNlIpXMqhwqRg
         nYaw+23ExE5ETVk/1jun6ZQfn84MXh/1Uxa6RaoacKMqe9MBVKxDD88B+Vl4828/jDe8
         As/PlO9VrK8lA1LAFYiGTXAh3t+lQYWymK9voK8nJFx89m6zSwGnbMmbQa1VxKvzfEUn
         lTBH1D9Qh4c+7fn6UcZvYdvWiAMLdwE92ucPuDp/ARHY/rdekF0F+WmobyojnHzIUlGB
         Z68a7KF4Fj5c5WXbu1U2AytBT3Nca88TXvNTYGSePdmxrufG2/E6wcvdxdQ2HpW+v6pX
         Tifg==
X-Gm-Message-State: AOAM532Lqzgmxk+aiD8xmqia7sM54EvairEgpyaqylMSWF141he1q6Jw
        Ab4x7zM9r01BjfjF2dfVR3U=
X-Google-Smtp-Source: ABdhPJymPOY0CEm1emRVDoDO+S7lOO1Pd3olB9JM+C9q1I0Y5knFcJ3erEf1BGxJNXshBbxqqlJa0A==
X-Received: by 2002:a1c:a145:: with SMTP id k66mr581258wme.18.1611858908266;
        Thu, 28 Jan 2021 10:35:08 -0800 (PST)
Received: from [192.168.1.21] ([195.245.17.255])
        by smtp.gmail.com with ESMTPSA id g12sm6581664wmh.14.2021.01.28.10.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jan 2021 10:35:07 -0800 (PST)
Message-ID: <48cb0173a139336fb5a188d95a9837f295c91f31.camel@gmail.com>
Subject: Re: [PATCH v3 3/7] gpio: gpio-ep93xx: Fix wrong irq numbers in port
 F
From:   Alexander Sverdlin <alexander.sverdlin@gmail.com>
To:     Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Thu, 28 Jan 2021 19:35:06 +0100
In-Reply-To: <20210128122123.25341-4-nikita.shubin@maquefel.me>
References: <20210128122123.25341-1-nikita.shubin@maquefel.me>
         <20210128122123.25341-4-nikita.shubin@maquefel.me>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi!

On Thu, 2021-01-28 at 15:21 +0300, Nikita Shubin wrote:
> Port F irq's should be statically mapped to EP93XX_GPIO_F_IRQ_BASE.
> 
> So we need to specify girq->first otherwise:
> 
> "If device tree is used, then first_irq will be 0 and
> irqs get mapped dynamically on the fly"
> 
> And that's not the thing we want.
> 
> Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>

Acked-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

> ---
>  drivers/gpio/gpio-ep93xx.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpio/gpio-ep93xx.c b/drivers/gpio/gpio-ep93xx.c
> index b990d37da143..dc88115e34da 100644
> --- a/drivers/gpio/gpio-ep93xx.c
> +++ b/drivers/gpio/gpio-ep93xx.c
> @@ -430,6 +430,7 @@ static int ep93xx_gpio_add_bank(struct gpio_chip
> *gc,
>                 girq->default_type = IRQ_TYPE_NONE;
>                 girq->handler = handle_level_irq;
>                 gc->to_irq = ep93xx_gpio_f_to_irq;
> +               girq->first = EP93XX_GPIO_F_IRQ_BASE;
>         }
>  
>         return devm_gpiochip_add_data(dev, gc, epg);

-- 
Alexander Sverdlin.


