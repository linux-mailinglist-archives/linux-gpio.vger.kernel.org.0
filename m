Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0D7F2E2589
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Dec 2020 09:51:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727114AbgLXIuy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Dec 2020 03:50:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726159AbgLXIux (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Dec 2020 03:50:53 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6365AC061794;
        Thu, 24 Dec 2020 00:50:13 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id h22so3366939lfu.2;
        Thu, 24 Dec 2020 00:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=EqRKqZ1wKfeGOjhauO4d9amiV8Bp4L3OX2mE1+BC348=;
        b=d2Ds7usvvNMSDVgFmTotvdD5YN5NYrE1RkyYcFLbtqSVbqRIzNYF0emr+VPWFKxXhs
         hRoMOe/vZ6AqYi3vwx5WLSeKxspiK0RaaLAwTHjU3mWgYxGqm9S1H104Zh0vQYods53a
         OUA1JoKzdFZ55deWbId8eDj957JcqDVEDriEvtSIL/OiMhin0p2Y+y07hMpecRWmKx9c
         fN0E6/59MBgA8v+q5NaPzd4cnX+SfkNVzR4C5aC+g6iDds1kJomvUHr1A0mRJbi8SH05
         9rRoydCqjqoY8/KX9yyfvLsGVWHpLxl0wLyCr3l6Uq93C8Grzx+yCWMQw897F/p9DQGA
         L3Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=EqRKqZ1wKfeGOjhauO4d9amiV8Bp4L3OX2mE1+BC348=;
        b=b1Q8KfjtyiYwiSIoySo9hmWPGakYj/h5Me9SntAbqg58R+5s22cYJxMQx7s9rfnGcJ
         74EGAygFzCsVHuyNgm+klUHL7F/oczjekC8e2ly6Lyv63Qt2TyUCeAHB+4eDVmH4GGdl
         ttG4qrgV/Mj3JgNQ3RNsiMJ+BIvn3Udjz9F+7/hzdpRrwqtOoHzUlFIaP8qOSuX0Shw0
         nLh4JVmLZ7v0wpe/6+mim4EC/wVuG8Bu4lkKo3pxcCrPuUlpkYGjDTfKjwytj3l9Jl6i
         a7nl6jh1NIBkdE5bCLLPmUpRWmlSNskso7mgk9/QeVSY96mmuD/19Vvv5kHN3tlnVvd9
         veKg==
X-Gm-Message-State: AOAM533+t7u9IRLxxGCFogtCDvojNCe8Y4nX9l05a1ycaHjIaYOGAqoE
        qmq8Lv5tMNffWf3fQOhihpL75hASSpYfnw==
X-Google-Smtp-Source: ABdhPJy6EKy0yK6iLnjvV2Z0jWd+01GIHGWgaG702oarK+Lcn29IWiNZr2Q9u/bPdT/g46n6Z5nLIA==
X-Received: by 2002:a05:6512:108b:: with SMTP id j11mr12833764lfg.44.1608799811725;
        Thu, 24 Dec 2020 00:50:11 -0800 (PST)
Received: from [192.168.1.100] ([31.173.81.247])
        by smtp.gmail.com with ESMTPSA id z14sm3580731lfq.130.2020.12.24.00.50.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Dec 2020 00:50:11 -0800 (PST)
Subject: Re: [PATCH v7 10/12] mfd: bd9571mwv: Use devm_regmap_add_irq_chip()
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        marek.vasut+renesas@gmail.com, lee.jones@linaro.org,
        matti.vaittinen@fi.rohmeurope.com, lgirdwood@gmail.com,
        broonie@kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com
Cc:     khiem.nguyen.xt@renesas.com, linux-power@fi.rohmeurope.com,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1608793457-11997-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1608793457-11997-11-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <53d2129e-966d-d28e-625a-962b0e3d5d43@gmail.com>
Date:   Thu, 24 Dec 2020 11:50:02 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <1608793457-11997-11-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello!

On 24.12.2020 10:04, Yoshihiro Shimoda wrote:

> Use dev_regmap_add_irq_chip() to simplify the code.

    devm_?

> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
> Reviewed-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>   drivers/mfd/bd9571mwv.c | 27 ++++++---------------------
>   1 file changed, 6 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/mfd/bd9571mwv.c b/drivers/mfd/bd9571mwv.c
> index e68c3fa..49e968e 100644
> --- a/drivers/mfd/bd9571mwv.c
> +++ b/drivers/mfd/bd9571mwv.c
> @@ -170,31 +170,17 @@ static int bd9571mwv_probe(struct i2c_client *client,
>   	if (ret)
>   		return ret;
>   
> -	ret = regmap_add_irq_chip(bd->regmap, bd->irq, IRQF_ONESHOT, 0,
> -				  &bd9571mwv_irq_chip, &bd->irq_data);
> +	ret = devm_regmap_add_irq_chip(bd->dev, bd->regmap, bd->irq,
> +				       IRQF_ONESHOT, 0, &bd9571mwv_irq_chip,
> +				       &bd->irq_data);
>   	if (ret) {
>   		dev_err(bd->dev, "Failed to register IRQ chip\n");
>   		return ret;
>   	}
>   
[...]

MBR, Sergei
