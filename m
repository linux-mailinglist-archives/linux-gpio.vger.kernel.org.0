Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 646DA2771CD
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Sep 2020 15:07:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727704AbgIXNHm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Sep 2020 09:07:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727874AbgIXNHm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Sep 2020 09:07:42 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D696FC0613CE
        for <linux-gpio@vger.kernel.org>; Thu, 24 Sep 2020 06:07:41 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id ay8so3272082edb.8
        for <linux-gpio@vger.kernel.org>; Thu, 24 Sep 2020 06:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iaZ9eh1EZBOd4HqFK3rqARUvoW5xW82dp1wS6gPtr/Y=;
        b=AerygQgAm4JY53R+fI6YQyuQKHWA2/i3/2uugCIjZD2LRtSnBCyCRdJQRFK914fFXF
         U/WYdRdJ3NleFGBcZh09KG9YRsqxmsE74qGlgqGDiZrv3lfq2SLMop+y7cmb0S3fjaiW
         Mmxg/EzIDvVPLhXbBV8hIy7H16IBDikT1wUrcYKws6jKmcRfjx1q77Tz0tJFQDwdM9cw
         9Yl3df1v+IgiEJGr0r67ujVHGlyE6yr9HSoq+eYb9vSX6OJNjpeP3TnMZViJDhoFokQc
         LK066WBdEg1w8ip2rd83VOIFe0FtsP6+owqguBpn6dkQw3d9Q6XwY34970ubS52lVqjM
         UKZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iaZ9eh1EZBOd4HqFK3rqARUvoW5xW82dp1wS6gPtr/Y=;
        b=gMK+FeyLCsRv5Ju980aU/xIVyjfoV3W/20aX+GD4GiXqKSDcgM+p7XEm+MZWtSU/Si
         uSYvm8vLqlFc9Op7EyNff377IbQuzULOWnHRo96n1S+Is9uUYrYKquVELGH9sQKOQsax
         Oi3u2D/fut9evkWldJhlbNSL5Nhn0yonOycAcTBOvXZw/UDk6gvbp8KeXuQe0tgTeWRa
         b7fGmwq4JxKriav+yHoynI93Qo8n0A01Urw3iya2IanzXlnWaEKqg4TTc87BcSVwk/I/
         XS2PGZXWTPiRUefTRtTzqgijNb5FoevS3FB9+L1mxfVezK3Y9mvLWhDstDYycXr94FaO
         llfQ==
X-Gm-Message-State: AOAM531UD3ZKNn5IQZB7ibe/yMFBgIQmpkzKpdk/XGkW/yKkBhmfyl9b
        +qIP/qOAzw60xAYO1yGNbBv7PZm7U2JHN307l92xBQ==
X-Google-Smtp-Source: ABdhPJxPqb0lUDZ0wPrrnh3dcB1S81aFZb095zkpAhBzp3EhCUNWkOqOaqcCbe/T3yB4MrhosLq6HY4+B8yJI9UvRHo=
X-Received: by 2002:a05:6402:17ec:: with SMTP id t12mr925938edy.328.1600952860501;
 Thu, 24 Sep 2020 06:07:40 -0700 (PDT)
MIME-Version: 1.0
References: <1600851824-4608-1-git-send-email-ye.li@nxp.com>
In-Reply-To: <1600851824-4608-1-git-send-email-ye.li@nxp.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 24 Sep 2020 15:07:29 +0200
Message-ID: <CAMpxmJXURTs=Mg+1rxZtE5jAZH4rL43870rk44xEEX_4EZ2tuA@mail.gmail.com>
Subject: Re: [PATCH] gpio: pca953x: Fix uninitialized pending variable
To:     Ye Li <ye.li@nxp.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 23, 2020 at 11:04 AM Ye Li <ye.li@nxp.com> wrote:
>
> When pca953x_irq_pending returns false, the pending parameter won't
> be set. But pca953x_irq_handler continues using this uninitialized
> variable as pending irqs and will cause problem.
> Fix the issue by initializing pending to 0.
>
> Fixes: 064c73afe738 ("gpio: pca953x: Synchronize interrupt handler properly")
> Signed-off-by: Ye Li <ye.li@nxp.com>
> ---
>  drivers/gpio/gpio-pca953x.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
> index b5c3e566..0a49ab6 100644
> --- a/drivers/gpio/gpio-pca953x.c
> +++ b/drivers/gpio/gpio-pca953x.c
> @@ -814,7 +814,7 @@ static irqreturn_t pca953x_irq_handler(int irq, void *devid)
>  {
>         struct pca953x_chip *chip = devid;
>         struct gpio_chip *gc = &chip->gpio_chip;
> -       DECLARE_BITMAP(pending, MAX_LINE);
> +       DECLARE_BITMAP(pending, MAX_LINE) = {};
>         int level;
>         bool ret;
>
> --
> 2.7.4
>

Queued for fixes, thanks!

Bartosz
