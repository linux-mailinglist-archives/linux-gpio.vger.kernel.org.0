Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FB2C2A0885
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Oct 2020 15:54:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726881AbgJ3OyI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Oct 2020 10:54:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726880AbgJ3OyI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Oct 2020 10:54:08 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6E91C0613D2
        for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2020 07:54:07 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id oq3so7135831ejb.7
        for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2020 07:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Q691nw1GaPkDFqjRLqSBRGymD9FCcdqizVVQkT/qKrs=;
        b=Ieu76FGZe4nrpc4PkAIX5Dz2qLRwmQwgBp7/L/cmwA0z5C5IecMAhDZbj63ThJrQVD
         /6s8Dfklit41Djj466ondkBnfpUzP6J9mi/+irdrwtbbGC1gFqttEQUu/lvC93HqB4Fn
         G/LExXcbPyAJVGmyS2VjFLwP4Caoo4w15E5plTM0h58TYOIFLDsDkvnx6qs+4e0GSv0n
         2Qq5d/m6zKjDlRVpafCEewxohpBSchLw3NRMu3YVrCT0Y4ew5l4Cu4D5pxGFAQbzHM46
         2y64CWuUud6oSSnVOdgmbPXin9SrJ0bhZS/GVtNeUfjjxzt6bKLabkkVMHlbkIRalprH
         BR7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Q691nw1GaPkDFqjRLqSBRGymD9FCcdqizVVQkT/qKrs=;
        b=nE296DW18Er+dcprY1jTP1vfw4MaUZcf94Yl2I39AUbUw68vgWkcKED0KhqKNa6iAg
         7ugfcjYmetaaGHgOf+nZ53jOPeNRCUOWeHj2Zh7rvOvrpPjPYpesM2yPdaMCf9CK9/Kt
         59vuJj1gMqAutSJJ+IGoPmeczBNdWJKg7wYkl1IEmPf090mA6873p39swN55EYKLiBsu
         XCXtRRoZNU0ilDidG67kSLRjPNBC/bEv54AS500Df4GcjbOlAbxMl/poBIy4usfMAFmy
         r8U2dsyhChITv52AFE1VPbqU8meizqH/NbUQ0o/n/4JXqUSZyJLfRPz/ZuZ4RfbsPpB9
         dboA==
X-Gm-Message-State: AOAM533pSwvp7hL8l1gojhl4YIA5aZ6dQtJpGspNWfxpemCKC28DGy0h
        hv0ZL9tfO5j/25m1AHbNZQyUYtG+ZBiHIH7Uym1beA==
X-Google-Smtp-Source: ABdhPJy7SBvOS7vtF6Cq3aM89II0s9Z1P7hOcvRuJ7tQSVs+YT+zaLUVxAmIqd810u7gn+Kos4guy7+p0UQK3IpMcLM=
X-Received: by 2002:a17:906:7d0:: with SMTP id m16mr2773722ejc.445.1604069646371;
 Fri, 30 Oct 2020 07:54:06 -0700 (PDT)
MIME-Version: 1.0
References: <20201029084832.13933-1-warthog618@gmail.com>
In-Reply-To: <20201029084832.13933-1-warthog618@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 30 Oct 2020 15:53:55 +0100
Message-ID: <CAMpxmJXoK=39ZBCNLUOGASAhxUfEkem0Z+i3g4XbKgZ0NMTD=g@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: cdev: add GPIO_V2_LINE_FLAG_EDGE_BOTH and use it
 in edge_irq_thread()
To:     Kent Gibson <warthog618@gmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 29, 2020 at 9:48 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> Add GPIO_V2_LINE_FLAG_EDGE_BOTH macro and use it in edge_irq_thread() to
> improve readability of edge handling cases.
>
> Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
>  drivers/gpio/gpiolib-cdev.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
> index ea787eb3810d..5eb4435afa64 100644
> --- a/drivers/gpio/gpiolib-cdev.c
> +++ b/drivers/gpio/gpiolib-cdev.c
> @@ -510,6 +510,8 @@ struct linereq {
>         (GPIO_V2_LINE_FLAG_EDGE_RISING | \
>          GPIO_V2_LINE_FLAG_EDGE_FALLING)
>
> +#define GPIO_V2_LINE_FLAG_EDGE_BOTH GPIO_V2_LINE_EDGE_FLAGS
> +
>  #define GPIO_V2_LINE_VALID_FLAGS \
>         (GPIO_V2_LINE_FLAG_ACTIVE_LOW | \
>          GPIO_V2_LINE_DIRECTION_FLAGS | \
> @@ -569,8 +571,7 @@ static irqreturn_t edge_irq_thread(int irq, void *p)
>         line->timestamp_ns = 0;
>
>         eflags = READ_ONCE(line->eflags);
> -       if (eflags == (GPIO_V2_LINE_FLAG_EDGE_RISING |
> -                      GPIO_V2_LINE_FLAG_EDGE_FALLING)) {
> +       if (eflags == GPIO_V2_LINE_FLAG_EDGE_BOTH) {
>                 int level = gpiod_get_value_cansleep(line->desc);
>
>                 if (level)
> --
> 2.29.0
>

Applied, thanks!

Bartosz
