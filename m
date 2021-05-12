Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD6F737BBF4
	for <lists+linux-gpio@lfdr.de>; Wed, 12 May 2021 13:38:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230114AbhELLjp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 May 2021 07:39:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230037AbhELLjp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 May 2021 07:39:45 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F7AFC061574
        for <linux-gpio@vger.kernel.org>; Wed, 12 May 2021 04:38:37 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id i4so30318446ybe.2
        for <linux-gpio@vger.kernel.org>; Wed, 12 May 2021 04:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/qL62CHxTkMZiiiWmN9ruwFx/bjZvnNBYhmIqQVBWFM=;
        b=zw6gwd+nrFSwhJ890hbOKdC1lKIDchsoMGdJLGtedq+g4o4BNqwL8kH7tgjrJ2MCzA
         f76I5YDatvhz0QY8cjEQ+PAE1r/HX6KGTFO/1WK5PhO4Rws2Fwn4d1Y1MdBIavil3bRJ
         IZDhkOcMXOaMwTT/2lBs5EwSTZZxNB+NgHd+sRKYAoC4qJZxj7s2a0uXNq8ecmWnsAeW
         U2PDNTeCf5LQZAhZztStZsbXVUgCEujgquZlzP72Kwrkm6UjPQuOq1J1izKL21mAtR3s
         L8VH1gB1IS24O1+3JF7Bm9Wz6qzuu3zOtOlDRVwGfG0AILHaUCeZzOugxo0CaoBO+8yI
         F7rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/qL62CHxTkMZiiiWmN9ruwFx/bjZvnNBYhmIqQVBWFM=;
        b=HF0HxDyzls1Nmo7bVOeo427xe1c1YqD8L8pEXY7lUiEl3nEKPf4RHT3pT5GGM4bTQN
         u6/8dYXowHVVmAms7SBqZ6DEgrEC6Vv3qnuJgq8BInumwGMLbclEp4bNTP0e33uQSpjX
         w6r/hN6yVgMuUyvP/7yJq0R/WNQpUzUGJwfJ2n00Ca16ldvoxBzYnvDDEYwTuXuf4Dyz
         skS1cEGJUEya59WDv8fKfmxtvkHpGftqF7gykTHK6kLBtmoW9LTv1KgEUBZV2kJFQDg3
         Za7NEkWO9P8cm4F6cSz5OhXn9x5ALPHE3gZL/c94WzHNTGj+eoPyEFXK7hCyso6tDtdk
         LMVw==
X-Gm-Message-State: AOAM532Ox6gB+L5/CkTfcjS4ERHp57r9v9DqNLUCZZQsJwwU3CyQY02d
        Vlm9+ko1jFqxKFFqlh1TpxpfSeuQT0jEhF6zBG6rmQ==
X-Google-Smtp-Source: ABdhPJwzHSSnZ5ljwFIGPtT9turnYrqUVPu/Ml/Vd+UmCAAAwLe1av6NFD4RzKNuYbkoF31mAzIcI2rsQop83PZQBQo=
X-Received: by 2002:a25:238c:: with SMTP id j134mr18122257ybj.302.1620819516963;
 Wed, 12 May 2021 04:38:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210511100646.5156-1-thunder.leizhen@huawei.com>
In-Reply-To: <20210511100646.5156-1-thunder.leizhen@huawei.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 12 May 2021 13:38:26 +0200
Message-ID: <CAMpxmJUHKOxVnaaE99_0mN3TJzNGaVjUAHziue2XUuGa5+MNfA@mail.gmail.com>
Subject: Re: [PATCH 1/1] gpio: logicvc: Remove redundant error printing in logicvc_gpio_probe()
To:     Zhen Lei <thunder.leizhen@huawei.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 11, 2021 at 12:07 PM Zhen Lei <thunder.leizhen@huawei.com> wrote:
>
> When devm_ioremap_resource() fails, a clear enough error message will be
> printed by its subfunction __devm_ioremap_resource(). The error
> information contains the device name, failure cause, and possibly resource
> information.
>
> Therefore, remove the error printing here to simplify code and reduce the
> binary size.
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> ---
>  drivers/gpio/gpio-logicvc.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/gpio/gpio-logicvc.c b/drivers/gpio/gpio-logicvc.c
> index 015632cf159f0b8..992cc958a43fd1e 100644
> --- a/drivers/gpio/gpio-logicvc.c
> +++ b/drivers/gpio/gpio-logicvc.c
> @@ -114,10 +114,8 @@ static int logicvc_gpio_probe(struct platform_device *pdev)
>                 }
>
>                 base = devm_ioremap_resource(dev, &res);
> -               if (IS_ERR(base)) {
> -                       dev_err(dev, "Failed to map I/O base\n");
> +               if (IS_ERR(base))
>                         return PTR_ERR(base);
> -               }
>
>                 logicvc_gpio_regmap_config.max_register = resource_size(&res) -
>                         logicvc_gpio_regmap_config.reg_stride;
> --
> 2.26.0.106.g9fadedd
>
>

Applied, thanks!

Bartosz
