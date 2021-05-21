Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B26238C845
	for <lists+linux-gpio@lfdr.de>; Fri, 21 May 2021 15:37:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235518AbhEUNio (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 May 2021 09:38:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235808AbhEUNim (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 May 2021 09:38:42 -0400
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4EA3C06138B
        for <linux-gpio@vger.kernel.org>; Fri, 21 May 2021 06:37:18 -0700 (PDT)
Received: by mail-yb1-xb2a.google.com with SMTP id h202so6893373ybg.8
        for <linux-gpio@vger.kernel.org>; Fri, 21 May 2021 06:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6jKMaTghBcN71SBkb7KhbZDdAOg4X2SNFU+T5mipjM4=;
        b=sLRcxoo0ts5x4g78UbvA72uJqR+8azvD+pJR6bTPSHyX4BhyCQ5XPbg37TIUXNZWHT
         pHlK9qXF3AwM0CjdXIc0jgRDTKG4/HA1TBrX4dNxl6RmKnn6jFNxMsxOM/eOgV/PZE7X
         FOAzZpUm7ukEAa12e30Sas171vXuzYefnsB69udiP21884E3Min8E68E3DXbHrD/TB8J
         sB9HXi0RN1yXgFXNknn4MFqMJNoHxC1KtoQYB3AzAFAeChG1r9OiKgq+hVBdIAxu8+Cx
         yo7m1Kc5047Rma7LGGJARzr2W6VZYD8OFaCq89Hd8E8PCvFM+J++9baaaOcS5F9aOK+n
         ohfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6jKMaTghBcN71SBkb7KhbZDdAOg4X2SNFU+T5mipjM4=;
        b=NiRrKSbtKf6PMUEFMx/deaH19Q2O/VBWVOLdeQYpImglJ7BJi89ZfNPi7zui88wD0U
         jAjbs1aZlLmq3ezqlYMTPH3nJNJtYRhTuJUufq2PNj9TXijhwoOL63TTepxYPeokshoc
         O83VmSJWYa9saDrUGkCAYUKS1qT9vYlyVugsb3lpM4dJnuL4XggzDpiSaQPFoDKujO7z
         5jln/q8vJgc/diXcaG8v8FxobjnLtLNf97OwUrDs5jwh4RIQB0NU8GDMD9mcdBUqQVwU
         wmnhkwXJ2tnIhN4/ESdS0NACi1J5TQW4tY6/bblMrTohJJDg8wz4/NYYSCOdp6dFetdZ
         EbrQ==
X-Gm-Message-State: AOAM533AEXzSCYAGF3Jt9DfsIrWXoDynTxlMTbEjoATi3hxQ+agM2EVO
        yTla81Hv9eNFh9eLASP1QYTOEQzCpUM3klZTbVHY1g==
X-Google-Smtp-Source: ABdhPJxCEIleq91veuxeCRLR4evWqC9e3USzwNXnjG89LDkaM7ZIywqWs65mHrKcvukU9pB95hsaZ4ttqnlN9AZYBr0=
X-Received: by 2002:a25:9d86:: with SMTP id v6mr14630511ybp.366.1621604237933;
 Fri, 21 May 2021 06:37:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210514092017.17922-1-aardelean@deviqon.com>
In-Reply-To: <20210514092017.17922-1-aardelean@deviqon.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 21 May 2021 15:37:07 +0200
Message-ID: <CAMpxmJVtOREtXwEgM4Ak40m+fFEOKU_U1hzuujtmts2c=c92AQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: gpio-altera-a10sr: remove platform_set_drvdata() +
 cleanup probe
To:     Alexandru Ardelean <aardelean@deviqon.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Thor Thayer <thor.thayer@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, May 14, 2021 at 11:20 AM Alexandru Ardelean
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
>  drivers/gpio/gpio-altera-a10sr.c | 11 +----------
>  1 file changed, 1 insertion(+), 10 deletions(-)
>
> diff --git a/drivers/gpio/gpio-altera-a10sr.c b/drivers/gpio/gpio-altera-a10sr.c
> index b5917c48e4dc..6af51feda06f 100644
> --- a/drivers/gpio/gpio-altera-a10sr.c
> +++ b/drivers/gpio/gpio-altera-a10sr.c
> @@ -78,7 +78,6 @@ static const struct gpio_chip altr_a10sr_gc = {
>  static int altr_a10sr_gpio_probe(struct platform_device *pdev)
>  {
>         struct altr_a10sr_gpio *gpio;
> -       int ret;
>         struct altr_a10sr *a10sr = dev_get_drvdata(pdev->dev.parent);
>
>         gpio = devm_kzalloc(&pdev->dev, sizeof(*gpio), GFP_KERNEL);
> @@ -91,15 +90,7 @@ static int altr_a10sr_gpio_probe(struct platform_device *pdev)
>         gpio->gp.parent = pdev->dev.parent;
>         gpio->gp.of_node = pdev->dev.of_node;
>
> -       ret = devm_gpiochip_add_data(&pdev->dev, &gpio->gp, gpio);
> -       if (ret < 0) {
> -               dev_err(&pdev->dev, "Could not register gpiochip, %d\n", ret);
> -               return ret;
> -       }
> -
> -       platform_set_drvdata(pdev, gpio);
> -
> -       return 0;
> +       return devm_gpiochip_add_data(&pdev->dev, &gpio->gp, gpio);
>  }
>
>  static const struct of_device_id altr_a10sr_gpio_of_match[] = {
> --
> 2.31.1
>

Applied, thanks!
Bartosz
