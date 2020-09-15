Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D68526A2DF
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Sep 2020 12:12:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726140AbgIOKMm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Sep 2020 06:12:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726134AbgIOKMm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Sep 2020 06:12:42 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99511C06174A;
        Tue, 15 Sep 2020 03:12:41 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id q4so1520897pjh.5;
        Tue, 15 Sep 2020 03:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6PF6jhPHZkI3ThcxAwiW0uIimLHRGDaXWK3SDQgKreY=;
        b=cZv1f/yHj+EycMimrqz6L0GKUkMMocTN9uchZtlogc7B0hp4o12EbPv8ybmxeessN9
         vklarSeI2BioDoIqanxkg3iHlhh21KMAHPpLlWHPJvDDbmj13Sh6jCtKq3gqUA5Zjck7
         xzEd3ZaPyYgzpbLSPIL0Ckm0+q6oyBd710M75LhDlKLMhczZAWptHDtyRPqbOXg5dU8A
         83CNFSmVsBNR+4OC/K+Iu3rSaPPn2qa8Xp1bvSYvI0/fSkbwC5LYEeSEDbuzolO6QlTV
         fMRSZPIC6dKvtnF6u/QgNgE2lZqiWeMdhtFYYgTpi7aftAbcvIU9FXWxWUdyNhp+EXe2
         l1Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6PF6jhPHZkI3ThcxAwiW0uIimLHRGDaXWK3SDQgKreY=;
        b=t/j4LdVSSY7kRyTDQAfq4mMGthy6WurHwcui294Zv89KB+9acuGzi67XvZKchfrQgC
         GtWKANJtHcOdRdGpeuevNcvYk1Mo/NDMw0PGnwyXxPwGZbKR7sQx0XgMFi6j7sfioVmj
         LIvkdx/CR85c10qutLh/0wxPNrTTIy5x+iy3dNx1Tz+6ltLuZXt/HipJQHLKVrf5/2WM
         4YLjLYlcz5hOLDjlP8RH71S4yk+9uquAatbX8v5Ud9nFQ9YKG52WarXHPVICQBj+P+II
         ZP3lU6uWugQH24ySQAbgFbO2BQGNcnlk16IdV20K3kvvBNoUZSIxuZSwItMnrR5wbWAX
         jwAA==
X-Gm-Message-State: AOAM531ptArfoKRdDOM+mYCV6Ltp2R2bEUFBnPFkwmy/uz68MLvH9iyJ
        N7M1UyWzGKAqPK1/+JNk8jsnjTE4XlSodlr+JI7zuqGMGOZys9x+
X-Google-Smtp-Source: ABdhPJyD995LOkY9BM7Mig0+DaUerARwtNpKUCCBD8Kp9Z6sS8IQ2JkTR2wjUzkvyIar4YSVnK6q/QChd40OXTx57vY=
X-Received: by 2002:a17:90a:fd98:: with SMTP id cx24mr3282961pjb.181.1600164761022;
 Tue, 15 Sep 2020 03:12:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200909102640.1657622-1-warthog618@gmail.com> <20200909102640.1657622-4-warthog618@gmail.com>
In-Reply-To: <20200909102640.1657622-4-warthog618@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 15 Sep 2020 13:12:23 +0300
Message-ID: <CAHp75VesdVkTDL7aFqYCd21Ms6qt5xvC-MsRZNNr7Uexp2h55g@mail.gmail.com>
Subject: Re: [PATCH v8 03/20] gpio: uapi: define GPIO_MAX_NAME_SIZE for array sizes
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 9, 2020 at 1:29 PM Kent Gibson <warthog618@gmail.com> wrote:
>
> Replace constant array sizes with a macro constant to clarify the source
> of array sizes, provide a place to document any constraints on the size,
> and to simplify array sizing in userspace if constructing structs
> from their composite fields.
>

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>


> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
>  include/uapi/linux/gpio.h | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
>
> diff --git a/include/uapi/linux/gpio.h b/include/uapi/linux/gpio.h
> index 9c27cecf406f..285cc10355b2 100644
> --- a/include/uapi/linux/gpio.h
> +++ b/include/uapi/linux/gpio.h
> @@ -14,6 +14,11 @@
>  #include <linux/ioctl.h>
>  #include <linux/types.h>
>
> +/*
> + * The maximum size of name and label arrays.
> + */
> +#define GPIO_MAX_NAME_SIZE 32
> +
>  /**
>   * struct gpiochip_info - Information about a certain GPIO chip
>   * @name: the Linux kernel name of this GPIO chip
> @@ -22,8 +27,8 @@
>   * @lines: number of GPIO lines on this chip
>   */
>  struct gpiochip_info {
> -       char name[32];
> -       char label[32];
> +       char name[GPIO_MAX_NAME_SIZE];
> +       char label[GPIO_MAX_NAME_SIZE];
>         __u32 lines;
>  };
>
> @@ -52,8 +57,8 @@ struct gpiochip_info {
>  struct gpioline_info {
>         __u32 line_offset;
>         __u32 flags;
> -       char name[32];
> -       char consumer[32];
> +       char name[GPIO_MAX_NAME_SIZE];
> +       char consumer[GPIO_MAX_NAME_SIZE];
>  };
>
>  /* Maximum number of requested handles */
> @@ -123,7 +128,7 @@ struct gpiohandle_request {
>         __u32 lineoffsets[GPIOHANDLES_MAX];
>         __u32 flags;
>         __u8 default_values[GPIOHANDLES_MAX];
> -       char consumer_label[32];
> +       char consumer_label[GPIO_MAX_NAME_SIZE];
>         __u32 lines;
>         int fd;
>  };
> @@ -182,7 +187,7 @@ struct gpioevent_request {
>         __u32 lineoffset;
>         __u32 handleflags;
>         __u32 eventflags;
> -       char consumer_label[32];
> +       char consumer_label[GPIO_MAX_NAME_SIZE];
>         int fd;
>  };
>
> --
> 2.28.0
>


-- 
With Best Regards,
Andy Shevchenko
