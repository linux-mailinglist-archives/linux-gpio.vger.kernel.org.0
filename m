Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97C3D38C726
	for <lists+linux-gpio@lfdr.de>; Fri, 21 May 2021 14:54:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233014AbhEUMzZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 May 2021 08:55:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235378AbhEUMw5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 May 2021 08:52:57 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CDAFC06138B
        for <linux-gpio@vger.kernel.org>; Fri, 21 May 2021 05:51:31 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id r7so5244523ybs.10
        for <linux-gpio@vger.kernel.org>; Fri, 21 May 2021 05:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1031xvHox3IqpUP8Gjv1QFEbAZ7S49fD5R5PiXK2yYg=;
        b=DLPG6z39HWjkxmpSqFUVCek0GlAQ1nb3A4zG8N44ISIo/yHAWk3QMs+Ty0UCv/P7Fe
         CBKsJmbQ/pWH1BAGQlWGyMeFlopMoCG2OqTIgg+hFaG1NzlvdKJTjgBDHEfHUmWLzZm2
         dW8abifNbkrsW1h6G24EFgaBHGhJS82Dx6Jg+DGsGIYDMgE5nepOEOMfE9y8V1CswX8m
         AgAsrnfobg20HP+s6frD0Zi4ngys79ksTfpMc8otFYqcfkW6BgkbEYw2ZPWx0AXt6kib
         SoxFLTO8YCP+/N/+CDYUVNjR9cFjCYGbx1AV705Kp51tLnUPHCX7Nodh0ozoQ1pLsw1g
         2H1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1031xvHox3IqpUP8Gjv1QFEbAZ7S49fD5R5PiXK2yYg=;
        b=WR0vUXaQ95cPFT6HMNH6zd6VtSwwzHVuIJei8wAS8qH79/gFr+jHDu0DlZP31wSbks
         P0HKYDiOJlMvdFvbH3/gS2LlT3D+GWASalq3HOs4zsluJHwrkoUkG4r+ysOZXEMucg3N
         1N2xSDPEG7Rf9qXAoexxXJYS7sINloAfmX2bg51S9m1sHH0lu0GSt9Ef+UaL/byFcQ+N
         TOFXXgTCuGY5AlHZvdt06ZTE0afCvqcfFIW0SyCzpmKTr2YGFYoaFZo5+YeLGfjBAy40
         bVjYG9ntiW4oKYfbzfvcy9VIC3RTMuT4wGZidCCQilqo0VUgSff2vQp86BXdjx6psRxv
         Zadw==
X-Gm-Message-State: AOAM533xTZMr7hTjcihpjm7WwR7rfSZ7DJ4Qy/juzdRKVDho1rLsJKn2
        yuVahJVsvzhAcvzOP5xTQ27MJ2eUH0n+UNLKyfro6g==
X-Google-Smtp-Source: ABdhPJx3gTH4ovT/cdCks76OeioQC7H7qLDbHfby4Rjjwj7m33rMzDXkAs3x6D36pyAaUZj8Tyv3wuHazQeW0FTLWKA=
X-Received: by 2002:a25:287:: with SMTP id 129mr14691259ybc.312.1621601490936;
 Fri, 21 May 2021 05:51:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210510195221.12350-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20210510195221.12350-1-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 21 May 2021 14:51:20 +0200
Message-ID: <CAMpxmJWiqaD6bYLSvzOA8CjgvYnswiEmBnZEzAfOskAZ3hOewg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpiolib: Drop duplicate offset check in gpiochip_is_requested()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Kent Gibson <warthog618@gmail.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 10, 2021 at 9:52 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> gpiochip_get_desc() already does the check, drop a duplicate in
> gpiochip_is_requested().
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/gpiolib.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 1427c1be749b..220a9d8dd4e3 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -2004,9 +2004,6 @@ const char *gpiochip_is_requested(struct gpio_chip *gc, unsigned int offset)
>  {
>         struct gpio_desc *desc;
>
> -       if (offset >= gc->ngpio)
> -               return NULL;
> -
>         desc = gpiochip_get_desc(gc, offset);
>         if (IS_ERR(desc))
>                 return NULL;
> --
> 2.30.2
>

I applied this some time ago just forgot to comment here.

Bart
