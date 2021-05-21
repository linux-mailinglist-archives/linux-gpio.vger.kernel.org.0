Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24F2B38C890
	for <lists+linux-gpio@lfdr.de>; Fri, 21 May 2021 15:43:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232170AbhEUNpU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 May 2021 09:45:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231809AbhEUNpU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 May 2021 09:45:20 -0400
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F9A3C061574
        for <linux-gpio@vger.kernel.org>; Fri, 21 May 2021 06:43:57 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id h202so6920113ybg.8
        for <linux-gpio@vger.kernel.org>; Fri, 21 May 2021 06:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=e1Z0ywcEnLesLDpbMsUglm1cxDyFirVMWiC0YS2MSSY=;
        b=MSOE+NChq7kxNkclQJjyDdmo6vpy4A0zAbkj3976n5BijWSPVYyTZdmenDEnyZClZh
         Gwd0rc16XriieqiVvee0REF2paZz3fHqoRRWkMO59Lpj/cZHiQp8CoKmt74/h3UXYn5b
         brfe6XnvH69ggPz8HGwkcfTK/ziOoXJAH1UBzVVHCPeUVz79Zzp3XWKpGYMPfDoDTszS
         nrC2JXyyiC9LrRWx/o7tkdB4zhvZEugW1wXanvM5pQIzhPqHk6PDFBpKnBhj7gIKQLxK
         IvBXu8tOgJPdqf1TVgrNdvoiuDzwkGUtY9AnFQY7wAwI65xiZu4sno//T7tmfQSffnzo
         Hc9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=e1Z0ywcEnLesLDpbMsUglm1cxDyFirVMWiC0YS2MSSY=;
        b=Qqv2r47uAHog4vx5brutIUgSRhKibMp0qWhMJV0WRcxYvuurZ7XIXyj9B3ZqAhyEkQ
         wo1PFErrVa8zobyHWYVhNozlIYF1a477pTpl5A+46jv45CRknogIPbE39HXbGwyX14Nn
         gDTEK9lpp/o8hKU26b7natCwzrH9qP6cKDf8u9djaNqiev2sLV2tt94Tp76ILEcCYlv8
         gIB+1WvT5R0oT8mFeSbdfiGqhKCKt3lOo5FFLhtY1w5E2SUHrqkRfrLmDzz0uNoVcVcs
         HsURxbR+Em0urzWGFp4AI8iyp4UvVWms2xrGccEhNWQ2YhPiug+CqXbmFkwm2agOvIym
         CXQw==
X-Gm-Message-State: AOAM530pj9YmcZLMCZJri9KMEIm2/d2qp4KjKl/BK3yADuxEnil2cLjb
        Hwp10rDuLsdvu6Jw9F8EZqb0QV/7fL9RAaZwZZysZw==
X-Google-Smtp-Source: ABdhPJwvNF9RaUZ4oFPqDsscRPRDdmb0kXnZMJBC9kHQTgvaWTsqHCSeKyA0qZLt+6LMFEU1cwNjunLlHVH4M9UQAOY=
X-Received: by 2002:a25:bd04:: with SMTP id f4mr15819498ybk.302.1621604636706;
 Fri, 21 May 2021 06:43:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210514092614.21047-1-aardelean@deviqon.com>
In-Reply-To: <20210514092614.21047-1-aardelean@deviqon.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 21 May 2021 15:43:45 +0200
Message-ID: <CAMpxmJVVMuAM4LQd1SwQnwdqOqXum+N57uysynKneg8M8XGqNQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: gpio-bd9571mwv: remove platform_set_drvdata() +
 cleanup probe
To:     Alexandru Ardelean <aardelean@deviqon.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        marek.vasut+renesas@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, May 14, 2021 at 11:26 AM Alexandru Ardelean
<aardelean@deviqon.com> wrote:
>
> The platform_set_drvdata() call is only useful if we need to retrieve back
> the private information.
> Since the driver doesn't do that, it's not useful to have it.
>
> If this is removed, we can also just do a direct return on
> devm_gpiochip_add_data(). We don't need to print that this call failed as
> there are other ways to log/see this during probe.
>
> Signed-off-by: Alexandru Ardelean <aardelean@deviqon.com>
> ---
>  drivers/gpio/gpio-bd9571mwv.c | 11 +----------
>  1 file changed, 1 insertion(+), 10 deletions(-)
>
> diff --git a/drivers/gpio/gpio-bd9571mwv.c b/drivers/gpio/gpio-bd9571mwv.c
> index df6102b57734..9a4d55f703bb 100644
> --- a/drivers/gpio/gpio-bd9571mwv.c
> +++ b/drivers/gpio/gpio-bd9571mwv.c
> @@ -97,25 +97,16 @@ static const struct gpio_chip template_chip = {
>  static int bd9571mwv_gpio_probe(struct platform_device *pdev)
>  {
>         struct bd9571mwv_gpio *gpio;
> -       int ret;
>
>         gpio = devm_kzalloc(&pdev->dev, sizeof(*gpio), GFP_KERNEL);
>         if (!gpio)
>                 return -ENOMEM;
>
> -       platform_set_drvdata(pdev, gpio);
> -
>         gpio->regmap = dev_get_regmap(pdev->dev.parent, NULL);
>         gpio->chip = template_chip;
>         gpio->chip.parent = pdev->dev.parent;
>
> -       ret = devm_gpiochip_add_data(&pdev->dev, &gpio->chip, gpio);
> -       if (ret < 0) {
> -               dev_err(&pdev->dev, "Could not register gpiochip, %d\n", ret);
> -               return ret;
> -       }
> -
> -       return 0;
> +       return devm_gpiochip_add_data(&pdev->dev, &gpio->chip, gpio);
>  }
>
>  static const struct platform_device_id bd9571mwv_gpio_id_table[] = {
> --
> 2.31.1
>

Applied, thanks!
Bartosz
