Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A01238DC6D
	for <lists+linux-gpio@lfdr.de>; Sun, 23 May 2021 20:31:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231857AbhEWScs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 23 May 2021 14:32:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231833AbhEWScs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 23 May 2021 14:32:48 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2B77C061756
        for <linux-gpio@vger.kernel.org>; Sun, 23 May 2021 11:31:21 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id g38so34848988ybi.12
        for <linux-gpio@vger.kernel.org>; Sun, 23 May 2021 11:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XoKj2+lP83dFN1Xj+nF6z+/9kXVQORuKRo4UmR66iBQ=;
        b=ucAgl6PLh5+NQYAGsG4hYMtEQSwA12FtTFU4rjsj3BqTUaGKncJxbZvmSscZv16Zig
         Tv642nWuXX+b8ScXNi4paL9Bd4oLroZ3c7EXIFaBFYApitSDhjuAd1T7xe9j+3WlCD8y
         3xr2myRyHc+0l+gV7qk6rSs0hr/GoIaVlTdsKA1Cm0C81SSllDm6QtWezKknSA5QbG97
         ntqN+zH5BlaHIj4TonqvgG7Cj/gDOk4F9AQqX21XBuhMMV29fVeRUN73W05GOuBevrJs
         TTw6c7VtqHg2/gOgUvnZcdBoNaOS2CzbjKFR50BgME77oF9JdL1FmaOPjEnd0RYBODr+
         yrgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XoKj2+lP83dFN1Xj+nF6z+/9kXVQORuKRo4UmR66iBQ=;
        b=nlaPZ44jk/74mysv2Vk2CZOP0+pXoasfb2HHJfTc57Nlft1GjFCHp0F6drSMDulvS5
         HuwU12L84RrmGdygZTkNBLjIKGMstAzXhgdNkE0UizaUFtv9DBYrY28z1gB49Fe+qXkc
         6hfOLxAb7jxDxifx9fXZ12MQ7bkPOvn7zVc0F2gZxcRKCxk6GbsID2QykZAr7U6x0GuJ
         cYHQMNmcXabpXzjsUf/t5uSUSscTOv2Xwd/1PeXje3d1fqmtTHxz0LQOEx+dKtBtYC/2
         PnDE/DOA9RxNm/XF38iTqOco8IadQOUr7twqPcQ+WgI+WXxiE0cHNFjjc14BKasFlPih
         MjDA==
X-Gm-Message-State: AOAM530saJE25ndOM+vSoNciuQIHhSiBliw7HaG365qsRfOs/8cwnhvE
        Vpx7qUetNVcyMFx5Aao87GELChiFD98beigCB0LYOA==
X-Google-Smtp-Source: ABdhPJznHZLraTDjzGymQbEzUGUE/T0sGF9sKDufxt2HML2dD/ZopaCG75J8/yGHHHnshJlKmhWRx4J/cAJQApbV7Rg=
X-Received: by 2002:a25:9d86:: with SMTP id v6mr28724828ybp.366.1621794680999;
 Sun, 23 May 2021 11:31:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210521181042.7726-1-aardelean@deviqon.com>
In-Reply-To: <20210521181042.7726-1-aardelean@deviqon.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Sun, 23 May 2021 20:31:10 +0200
Message-ID: <CAMpxmJW1Q-m_W+n28V9sEqvnb4ZVTGq_55DedhuJxu5icuD9sQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: gpio-xgene: simplify probe, return
 devm_gpiochip_add_data() directly
To:     Alexandru Ardelean <aardelean@deviqon.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, May 21, 2021 at 8:10 PM Alexandru Ardelean
<aardelean@deviqon.com> wrote:
>
> The handling of the return value from devm_gpiochip_add_data() is a bit
> redundant. It prints messages on error and success cases.
> While the success message may be useful, it is more in the area of log
> spam, and these can be printed with other forms of kernel logging.
>
> This change does a direct return with devm_gpiochip_add_data() in the probe
> function.
>
> The platform_set_drvdata() is needed, as this driver uses the stored
> private date in the PM suspend/resume routines.
>
> Signed-off-by: Alexandru Ardelean <aardelean@deviqon.com>
> ---
>  drivers/gpio/gpio-xgene.c | 11 +----------
>  1 file changed, 1 insertion(+), 10 deletions(-)
>
> diff --git a/drivers/gpio/gpio-xgene.c b/drivers/gpio/gpio-xgene.c
> index 532b0df8a1f2..fb4b0c67aeef 100644
> --- a/drivers/gpio/gpio-xgene.c
> +++ b/drivers/gpio/gpio-xgene.c
> @@ -159,7 +159,6 @@ static SIMPLE_DEV_PM_OPS(xgene_gpio_pm, xgene_gpio_suspend, xgene_gpio_resume);
>  static int xgene_gpio_probe(struct platform_device *pdev)
>  {
>         struct xgene_gpio *gpio;
> -       int err = 0;
>
>         gpio = devm_kzalloc(&pdev->dev, sizeof(*gpio), GFP_KERNEL);
>         if (!gpio)
> @@ -183,15 +182,7 @@ static int xgene_gpio_probe(struct platform_device *pdev)
>
>         platform_set_drvdata(pdev, gpio);
>
> -       err = devm_gpiochip_add_data(&pdev->dev, &gpio->chip, gpio);
> -       if (err) {
> -               dev_err(&pdev->dev,
> -                       "failed to register gpiochip.\n");
> -               return err;
> -       }
> -
> -       dev_info(&pdev->dev, "X-Gene GPIO driver registered.\n");
> -       return 0;
> +       return devm_gpiochip_add_data(&pdev->dev, &gpio->chip, gpio);
>  }
>
>  static const struct of_device_id xgene_gpio_of_match[] = {
> --
> 2.31.1
>

Applied, thanks.

For the future: the subject should be: "gpio: xgene: ..." here and
everywhere else.

Bart
