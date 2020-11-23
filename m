Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3223D2C0E0C
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Nov 2020 15:51:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730981AbgKWOmT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Nov 2020 09:42:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726735AbgKWOmP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Nov 2020 09:42:15 -0500
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72BA7C0613CF
        for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2020 06:42:14 -0800 (PST)
Received: by mail-ej1-x644.google.com with SMTP id lv15so17771527ejb.12
        for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2020 06:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OW5ztDR1/IDii6C2a8nqY5b7gOqULDnS47LLR1LafWw=;
        b=XbyWP/SXUHtSqgQpUup4VCo3167MfHEH+dxtCTaSyFYOtNyRBPI3yOMes8+NuBoJ3f
         9ULBvZsg/SPJRuo0lfLH9IYSzeten5ucbbKLi+TisSlOa1JSZgTwcmt/oSY5e6oDXhTe
         zdLPgDlXCCZUJz/vwpxXWZKBmaVPDn+kcUI5CCcBG5jOaVev1FYGxn3rSXRwqY6BETuE
         Ir7+Dfak+u4cv2JrbcrRDMDJ4nRM5dlnj4maO+X+BwlOzn4sUkYE8wNodOIJHxz+nQ/c
         dU/HfDN/tRcKtt4xDk/dHbbLV4JN9/9IdoVs/2uLz+ZfhE36LJ1+8obx/6KRhJew0go8
         B7gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OW5ztDR1/IDii6C2a8nqY5b7gOqULDnS47LLR1LafWw=;
        b=fkaQMYTmuSP584mwmqaCDWh9kQPCTU1nSmR36Hy/Sv5AUnZLv7EsqLwS9yqSaQbPiw
         jlzaPLufDEslWlf4gN0GFxbqFrYWk75PIvMyHz2DrFBEojB5qF7vAt68LURmdpYl4vD/
         sb5WzyOoLgjZ4GeUG+/a06rwb6H1icsIc6PMVwyrXbct+HeyJr7o22e8T1FmXlMjlCEV
         wDYzpRDpoMt6GkJ+yOGeYfrPjWJSg+NI+wJQ4f9DIsvWYqx98f2rCZdEG9oGkxvoyMPA
         JtNABBZiPZmlG9rPKt2f22jYwNvR6tww90nso/LL5k+5GyO3QPwySD04yevlG4vs90Em
         ndTg==
X-Gm-Message-State: AOAM530lAuFHuLDKXAMjslkXDCCArazbn51ISUPScRYzLmCfNrCBqpP+
        TbOnAMn3X+iy1pddwp70uDw1MVJLVafb1ue2ZANmEQ==
X-Google-Smtp-Source: ABdhPJxnKK724hX/Z6tQvZ3WfZsG31W0HsX1S3eMwigVATsxmROZ5lxlMWwK25AKYzj0p1PsLDAkre1T24xCW/GBQLw=
X-Received: by 2002:a17:906:358c:: with SMTP id o12mr4241546ejb.168.1606142533163;
 Mon, 23 Nov 2020 06:42:13 -0800 (PST)
MIME-Version: 1.0
References: <20201123083555.42776-1-zhengliang6@huawei.com>
In-Reply-To: <20201123083555.42776-1-zhengliang6@huawei.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 23 Nov 2020 15:42:01 +0100
Message-ID: <CAMpxmJUbuiK3V4t35-az8O3ixtjAk1mDUQS_4rHgXMBky3Pgiw@mail.gmail.com>
Subject: Re: [PATCH] gpio: arizona: disable pm_runtime in case of failure
To:     Zheng Liang <zhengliang6@huawei.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>, wangli74@huawei.com,
        fangwei1@huawei.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 23, 2020 at 8:39 AM Zheng Liang <zhengliang6@huawei.com> wrote:
>
> pm_runtime_enable will increase power disable depth. Thus a
> pairing decrement is needed on the error handling path to keep
> it balanced.
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zheng Liang <zhengliang6@huawei.com>
> ---
>  drivers/gpio/gpio-arizona.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpio/gpio-arizona.c b/drivers/gpio/gpio-arizona.c
> index 5bda38e0780f..2bc173c352ce 100644
> --- a/drivers/gpio/gpio-arizona.c
> +++ b/drivers/gpio/gpio-arizona.c
> @@ -192,6 +192,7 @@ static int arizona_gpio_probe(struct platform_device *pdev)
>         ret = devm_gpiochip_add_data(&pdev->dev, &arizona_gpio->gpio_chip,
>                                      arizona_gpio);
>         if (ret < 0) {
> +               pm_runtime_disable(&pdev->dev);
>                 dev_err(&pdev->dev, "Could not register gpiochip, %d\n",
>                         ret);
>                 return ret;
> --
> 2.17.1
>

This looks like stable material. Can you add a Fixes: tag?

Bartosz
