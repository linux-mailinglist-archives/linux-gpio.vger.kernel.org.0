Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BDDD20F7D2
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2020 17:01:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388339AbgF3PBf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Jun 2020 11:01:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729325AbgF3PBe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Jun 2020 11:01:34 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36EE1C061755;
        Tue, 30 Jun 2020 08:01:34 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id c11so11594479lfh.8;
        Tue, 30 Jun 2020 08:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=k37IwSh/8NsZ5TsEt8YJHyIMw5QldJv9rIzgbzQ226s=;
        b=Z72jW+JA2mKXhilpjNzL8jg5PIg3bZ5D31Eduz3IVlhPC9VaO+O0dy5OzMeA7FJdLF
         +hWZFysWExIIzZjCJngXwQqIQJHxmuWi/w5K66jfKDoAl7KlIcepDTf3dYn504KaWgvv
         MMmIcCLCWpNz+zNtMIVllBnH2KjnlPytw/iq4geN0eviTUMsuU2ABlL0dTZQdBWKJnWc
         9KwZpmVyKGIgTcQeeduESRaI+H0xLPlv5Yg4e1NT4tc3/NFykP9Yok0kX2I1b3NshfTk
         K/VnR9sWfeOQoUAHwiL5pYZvZADCwReiK32/5mqPaGwvlO559ehLKsjVOsYLjVuAurbu
         ePTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k37IwSh/8NsZ5TsEt8YJHyIMw5QldJv9rIzgbzQ226s=;
        b=EX0sbMV7hLM/DUeuuWEyboqsSKDv3r+A5lgIU6RXwcajGas0TPgkZLtCZEZHB4Gtlg
         AVoh2OIwodvaDVTmpMCQoMl0XdIicvO2r54gNvbQZzW/VjahSkQkgrNm8uZZSknX/Y0/
         LuFW73m1j26GXd6MxFT9dEOs329xDueIeBntjKJ6J/9xHTqqjvlQjaPMQWtYSdi8cDkt
         UWZvQl0a+ZBGg6ego6OzCH4keZw0YHlzipjMvFRJnvkGqYECNWwaXZGtX7p84/W1Gsjy
         FSO9zOTlLR016SL3eG2A67nOQ1C+7gXLkocuDKT6t4llb8ADdfOyuhco1UWD9Gme/548
         k7ig==
X-Gm-Message-State: AOAM531Bd468gT7nExZnO0t24EczBKXF0dUqiMbjfzxmmzuhKGd4mBRj
        fLr0xI06Qgi1GUduHJwjIGEoIosyOy/PcLkEKFo=
X-Google-Smtp-Source: ABdhPJxrXGpnKikRxyV2brWXWw94KVvNCvzzZrtp6FbLjN/j2wEFZlOAYw5IuuUW/73svHabGmRlOGe7gWdMr8eNXdg=
X-Received: by 2002:a05:6512:1053:: with SMTP id c19mr1143542lfb.19.1593529292710;
 Tue, 30 Jun 2020 08:01:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200630133345.2232932-1-lee.jones@linaro.org> <20200630133345.2232932-5-lee.jones@linaro.org>
In-Reply-To: <20200630133345.2232932-5-lee.jones@linaro.org>
From:   Baolin Wang <baolin.wang7@gmail.com>
Date:   Tue, 30 Jun 2020 23:01:53 +0800
Message-ID: <CADBw62ozqWk7qYpsJsWSC1ZH6kZk9giMwWfw3=Wb+=7qONe7jw@mail.gmail.com>
Subject: Re: [PATCH 04/10] gpio: gpio-pmic-eic-sprd: Fix incorrectly named
 property 'map'
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        bgolaszewski@baylibre.com, linux-arm-kernel@lists.infradead.org,
        LKML <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org,
        Orson Zhai <orsonzhai@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 30, 2020 at 9:33 PM Lee Jones <lee.jones@linaro.org> wrote:
>
> A good attempt has been made to properly document 'struct
> sprd_pmic_eic', but 'map' has been incorrectly described as
> 'regmap' since the driver's inception in 2018.
>
> Fixes the following W=1 kernel build warning:
>
>  drivers/gpio/gpio-pmic-eic-sprd.c:65: warning: Function parameter or member 'map' not described in 'sprd_pmic_eic'
>
> Cc: Orson Zhai <orsonzhai@gmail.com>
> Cc: Baolin Wang <baolin.wang7@gmail.com>
> Cc: Chunyan Zhang <zhang.lyra@gmail.com>
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Looks good to me.
Reviewed-by: Baolin Wang <baolin.wang7@gmail.com>

> ---
>  drivers/gpio/gpio-pmic-eic-sprd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-pmic-eic-sprd.c b/drivers/gpio/gpio-pmic-eic-sprd.c
> index 05000cace9b24..9382851905662 100644
> --- a/drivers/gpio/gpio-pmic-eic-sprd.c
> +++ b/drivers/gpio/gpio-pmic-eic-sprd.c
> @@ -48,7 +48,7 @@ enum {
>   * struct sprd_pmic_eic - PMIC EIC controller
>   * @chip: the gpio_chip structure.
>   * @intc: the irq_chip structure.
> - * @regmap: the regmap from the parent device.
> + * @map:  the regmap from the parent device.
>   * @offset: the EIC controller's offset address of the PMIC.
>   * @reg: the array to cache the EIC registers.
>   * @buslock: for bus lock/sync and unlock.
> --
> 2.25.1
>


-- 
Baolin Wang
