Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3203769782C
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Feb 2023 09:29:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233613AbjBOI3y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Feb 2023 03:29:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233482AbjBOI3x (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Feb 2023 03:29:53 -0500
Received: from mail-ua1-x935.google.com (mail-ua1-x935.google.com [IPv6:2607:f8b0:4864:20::935])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC019C67B
        for <linux-gpio@vger.kernel.org>; Wed, 15 Feb 2023 00:29:47 -0800 (PST)
Received: by mail-ua1-x935.google.com with SMTP id b18so3390877uan.11
        for <linux-gpio@vger.kernel.org>; Wed, 15 Feb 2023 00:29:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FXSI5E+3HvE6BYqHUHdzgDWtPGtSlXeME4AX7iotPWY=;
        b=eMqKPTBZcGtq+ABL3ek1LxQUWDBIoO+kWpBdqjZE8z9N4TIEUEPL6VidC5wHfiIVDa
         VFUdPROmFShkuyqqvvZa4ZgrLHVFa0/H98CvEPiY1dTNlbbK5JxH7QSEUym9vNob59Tr
         AAB5K2JuSQm0l5rJxLXpLKIKes4bFIK/1t9mVlsiQFiAQNsI43nD2yuEWyIT1mMYbvPn
         mEm80WqSl/A0HBcT6fUg0wfa3+sFnMyz0XyXpJVDfSlo2ZQfMekE/T9MaYehA9/Pt5T2
         /C70d6gZ0bZTEofzof7/Fjk+3UkfIZua0uCzITBsQpnJ7idT8K49c3T/YLi+7/TE2JbB
         nlkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FXSI5E+3HvE6BYqHUHdzgDWtPGtSlXeME4AX7iotPWY=;
        b=utWVrgCu8E39ZJyBuZwSHl4C2F3bigORPdMYBWn2K8hdJJDNh9JPDGIEtZFFkxdiNQ
         /zFDir5OmtOEbUpRRCISCyuBBolVoeEeT5F5ZJNmbC8Vmo6kF6jS4XrgrGcCkL1Ecz71
         nTXgA5Bsb7F/9hV9T8lK9dP2bs35XF1WKHVFngL1rSqzkkoBlkStwUtxffn6RSb8+3fO
         yg0YtOGmYT6sBvZXqkwTkN33Xzz9vvC61Ja1ei7RWjZJuu50uDrfY8jRas70if2H/uBu
         Bt/XJvqzEg1REpdOPAVrGWiK1Wm5sm0KUgwROikB7UuWckxmM0F5mxla6DlXgzy/IG6S
         /cbQ==
X-Gm-Message-State: AO0yUKWS3xlLMhNa1iAUkJVifSYVbR4lvf/FEvv5Cqxn+Aw50TCY2biH
        FQ0j7tokTTNNBy6fc0DswQuudzv8TyUeAE5tZckRMA==
X-Google-Smtp-Source: AK7set/wOEKEM8x4UYollg4KJQQP4EGoy6F8kT5TGE7GywLwIdPiGDrNXiA0jX0JuHOPcsHW/TmCPUwYOhet75U92k0=
X-Received: by 2002:ab0:654d:0:b0:68a:7054:58a6 with SMTP id
 x13-20020ab0654d000000b0068a705458a6mr170019uap.22.1676449786783; Wed, 15 Feb
 2023 00:29:46 -0800 (PST)
MIME-Version: 1.0
References: <20230214224642.3804927-1-shenwei.wang@nxp.com>
In-Reply-To: <20230214224642.3804927-1-shenwei.wang@nxp.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 15 Feb 2023 09:29:36 +0100
Message-ID: <CAMRc=Mfv-fQPa6Sz9jQ-2BgcZkAsTN=T6UKKnLUUs=exRHiZsA@mail.gmail.com>
Subject: Re: [PATCH 1/1] gpio: mxc: remove static allocation of GPIO base
To:     Shenwei Wang <shenwei.wang@nxp.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Feb 14, 2023 at 11:47 PM Shenwei Wang <shenwei.wang@nxp.com> wrote:
>
> The latest gpio driver framework will give the following warning
> when it detects the static allocation of the GPIO bases.
>
> "[    1.329312] gpio gpiochip0: Static allocation of GPIO base is
> deprecated, use dynamic allocation."
>
> This patch removes the static allocation of GPIO base to get rid
> of the warning message.
>
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> ---
>  drivers/gpio/gpio-mxc.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
> index d5626c572d24..07948175441c 100644
> --- a/drivers/gpio/gpio-mxc.c
> +++ b/drivers/gpio/gpio-mxc.c
> @@ -450,8 +450,6 @@ static int mxc_gpio_probe(struct platform_device *pdev)
>         port->gc.request = gpiochip_generic_request;
>         port->gc.free = gpiochip_generic_free;
>         port->gc.to_irq = mxc_gpio_to_irq;
> -       port->gc.base = (pdev->id < 0) ? of_alias_get_id(np, "gpio") * 32 :
> -                                            pdev->id * 32;
>
>         err = devm_gpiochip_add_data(&pdev->dev, &port->gc, port);
>         if (err)
> --
> 2.34.1
>

This is one of the drivers for which we can't do it yet:
https://lore.kernel.org/linux-gpio/20230120104647.nwki4silrtd7bt3w@pengutronix.de/

Bart
