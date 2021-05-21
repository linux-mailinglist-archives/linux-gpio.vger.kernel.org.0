Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADA0038C80D
	for <lists+linux-gpio@lfdr.de>; Fri, 21 May 2021 15:29:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234880AbhEUNaf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 May 2021 09:30:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235279AbhEUNaZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 May 2021 09:30:25 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC42AC061763
        for <linux-gpio@vger.kernel.org>; Fri, 21 May 2021 06:29:00 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id i4so27516192ybe.2
        for <linux-gpio@vger.kernel.org>; Fri, 21 May 2021 06:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sBLaqlBTFPOgBNOZr3tcgcclIIzA01Ts0Y/T64t4ZMo=;
        b=WntCVajMnMxJSVEzbfQNzL+D6cBhgKTk1KsyYUEMEbCGfQiPxblXgCRFUuznbGiIke
         xYMAbS2KIscS7b20PYzWLbLhMF0NWaroMl0pLuL3yR6ZKsIIRh/gT3mKUHZbBjVykA4V
         JqJZu4hDXUjsLnGhZGLLGitU+G4oE/kOKaeJdVPdRQG8MxG+WtXxu0lIp0kbSt6n1GKW
         oRlN3Zor+v9nv8DIuVIPwUvSIk36WPrtFkB832wsxTcNVJeLzb4i5CL0XFL8BzWMeNf9
         A3tA02t37TmuGSIyhK1PQeeTYYAKBbMB/RpKFVVle3u88MwXIMinfApV2HF8zSb7TQgG
         xkbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sBLaqlBTFPOgBNOZr3tcgcclIIzA01Ts0Y/T64t4ZMo=;
        b=eVMMLuOaR1ZEEJOzvcDMVgN/qyeY1arhZ7XX4wF4WPDlXCycxweb1WNPCHLELFCk96
         eIRBZSnGC23O9Li8tGtSz4sot4qKyKZQYbanhuu8JoJBCJrWZS2z6TUIri+QK7wVztwS
         7xu6C2QffnFiMX5qfL0SeMQiV7clMr+dI74/7qkOkUZJRJlxHYS0IJaGEt/AtKujFmHi
         3pkU9z6bhx9hLDQnqZ9QDV+cAHl7gwypzMYhvdPieZ4EckWQEPPXMXeIGjYXq1Glu8fP
         LzbdH3Xp0Ep7aelAmrtWENGeDWD6KEleK5S/cjWHxQD5V23hJmCL6vgLlmO2XzPgapMT
         pp/w==
X-Gm-Message-State: AOAM531QSBRRv7/Iv003OSrQEuAFZiyQAf85jx0jsFVy9iPGNLmEJhJv
        PcgeNLNTYykgrCYyjKUcYkNmqPZF8XH4+ixtCIKYuA==
X-Google-Smtp-Source: ABdhPJxay81cEvaBngTuMlfSDYGrnj5r7VfKb2wUOgjA6/d3ncTTxypla17sldq0pBciLGzxcJB3WLkQ6MslmqeDRvA=
X-Received: by 2002:a25:e08e:: with SMTP id x136mr10813650ybg.0.1621603740260;
 Fri, 21 May 2021 06:29:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210514085500.10761-1-aardelean@deviqon.com>
In-Reply-To: <20210514085500.10761-1-aardelean@deviqon.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 21 May 2021 15:28:49 +0200
Message-ID: <CAMpxmJX4DjZ9NE_8BH7kB4jYA+LyLJ=zbXbh7cg37Jaw52ppKQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: gpio-visconti: remove platform_set_drvdata() +
 cleanup probe
To:     Alexandru Ardelean <aardelean@deviqon.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, May 14, 2021 at 10:55 AM Alexandru Ardelean
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
>  drivers/gpio/gpio-visconti.c | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)
>
> diff --git a/drivers/gpio/gpio-visconti.c b/drivers/gpio/gpio-visconti.c
> index 0e3d19828eb1..47455810bdb9 100644
> --- a/drivers/gpio/gpio-visconti.c
> +++ b/drivers/gpio/gpio-visconti.c
> @@ -187,15 +187,7 @@ static int visconti_gpio_probe(struct platform_device *pdev)
>         girq->default_type = IRQ_TYPE_NONE;
>         girq->handler = handle_level_irq;
>
> -       ret = devm_gpiochip_add_data(dev, &priv->gpio_chip, priv);
> -       if (ret) {
> -               dev_err(dev, "failed to add GPIO chip\n");
> -               return ret;
> -       }
> -
> -       platform_set_drvdata(pdev, priv);
> -
> -       return ret;
> +       return devm_gpiochip_add_data(dev, &priv->gpio_chip, priv);
>  }
>
>  static const struct of_device_id visconti_gpio_of_match[] = {
> --
> 2.31.1
>

Applied, thanks!

Bartosz
