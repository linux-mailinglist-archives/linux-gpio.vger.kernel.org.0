Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A4FD60C5E4
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Oct 2022 09:55:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230271AbiJYHz2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Oct 2022 03:55:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229877AbiJYHz1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Oct 2022 03:55:27 -0400
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com [IPv6:2607:f8b0:4864:20::e32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FF5213D3E
        for <linux-gpio@vger.kernel.org>; Tue, 25 Oct 2022 00:55:26 -0700 (PDT)
Received: by mail-vs1-xe32.google.com with SMTP id 1so10145789vsx.1
        for <linux-gpio@vger.kernel.org>; Tue, 25 Oct 2022 00:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7Tfgipl2W32fCXV+uOlMVyMjucDz2/Aq47+N7/GJB+g=;
        b=gvzfu2SlNrsEe6eUbxkKgtRMftuUX/oJ3dXCQyR9STHrCj0cHEd4qctfExPI2UGL9q
         N4gzNIRjxW4oFoqHIuHpYYu0EucmkX7MxCiTExUJkqYQB+mzUICkJevhYJuVzSsk7EiG
         jM3jojtETKhRO2+CH9gG7IvkNLbRBbofzFuC7ei159XuCRX14s9FhY8/OIbVw/vqWwX/
         DE7BoU58B0JQYEKOfzR9btL7D4PouojaaZ7TnELLOxwHSmdPPvzLkyHUzKGGABzuAi0/
         Ea+fhtIjeAhh+XPvUZhlNf6WJ6u7ApOT0yJil+MVWeEJ05xZ+gFQ7uxvBv2kz1fWayE7
         JJ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Tfgipl2W32fCXV+uOlMVyMjucDz2/Aq47+N7/GJB+g=;
        b=QZIX34SEJyNoee6fa7B2jAqQJ9NrnSFzROIJ2NF4kM0gPvVDGso9j9kvoCMZyJlEdU
         SSaCpXMwyinVAmqq4E+JgduwWaMUe7pvAMlxZSm/RwF7+Lqg5kuJZ0i7/cFhBuIdndYN
         VZQw2qgr7kfAWbcdMQyDH11vNDu15DOV2GTdWb2wuaEtSGhBlhUGdAMaEDYeSCTIwIR3
         n0GSByk5T+j0jaaMVRh10fyE1gSf2tWSF+IsKGJQXAv3ZV/j1/ATgn9ie0MhzR+7xVyj
         4VxuNuRana015JOR0+kfd0YSSFEIuOrnOzS3AbeB0XHIC84qhQ2HJKHrwKPR03wZyOUE
         9tdw==
X-Gm-Message-State: ACrzQf1nHNusORz5KyTRYT0Wpl5iX02aMxrgWbNMv8unLB2i6LIdItgU
        U+XNWyBqclE4VtC1H1ldHOMG5JP5giZLHUTYG1b8TWWnCt0=
X-Google-Smtp-Source: AMsMyM5zRxg+fEgQJ6V2tFDzNpDltr3+HggD/mAVQcby7T/lB+VXVlPL7gdNUGajuczP8J4JlUXyNtHE71CHhklfox0=
X-Received: by 2002:a05:6102:5788:b0:3a6:764d:1382 with SMTP id
 dh8-20020a056102578800b003a6764d1382mr21005774vsb.13.1666684525243; Tue, 25
 Oct 2022 00:55:25 -0700 (PDT)
MIME-Version: 1.0
References: <20221024080828.3840438-1-jk@codeconstruct.com.au>
In-Reply-To: <20221024080828.3840438-1-jk@codeconstruct.com.au>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 25 Oct 2022 09:55:14 +0200
Message-ID: <CAMRc=Mf0cjP_pH=QyJbgtTVtq8P6ufUbZYVZ2SG_ibox8YMO+g@mail.gmail.com>
Subject: Re: [PATCH] gpio: ftgpio010: use device name for gpiochip name & label
To:     Jeremy Kerr <jk@codeconstruct.com.au>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 24, 2022 at 10:08 AM Jeremy Kerr <jk@codeconstruct.com.au> wrote:
>
> Currently, we use just the fixed string "FTGPIO010" as the gpiochip name
> for ftgpio010 drivers. Because it's fixed, this means we cannot
> distinguish multiple ftgpio010 devices present on a single system.
>
> This change uses the dev_name() instead, which should be unique between
> multiple instances.
>
> Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
> ---
>  drivers/gpio/gpio-ftgpio010.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-ftgpio010.c b/drivers/gpio/gpio-ftgpio010.c
> index f77a965f5780..2728672ef9f8 100644
> --- a/drivers/gpio/gpio-ftgpio010.c
> +++ b/drivers/gpio/gpio-ftgpio010.c
> @@ -277,7 +277,7 @@ static int ftgpio_gpio_probe(struct platform_device *pdev)
>                 dev_err(dev, "unable to init generic GPIO\n");
>                 goto dis_clk;
>         }
> -       g->gc.label = "FTGPIO010";
> +       g->gc.label = dev_name(dev);
>         g->gc.base = -1;
>         g->gc.parent = dev;
>         g->gc.owner = THIS_MODULE;
> --
> 2.35.1
>

Applied, thanks!

Bart
