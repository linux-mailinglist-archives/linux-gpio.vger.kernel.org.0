Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F30E4D12E5
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Mar 2022 09:53:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242666AbiCHIy1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Mar 2022 03:54:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233283AbiCHIy1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Mar 2022 03:54:27 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0747C3B03E
        for <linux-gpio@vger.kernel.org>; Tue,  8 Mar 2022 00:53:31 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id bg10so37622140ejb.4
        for <linux-gpio@vger.kernel.org>; Tue, 08 Mar 2022 00:53:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JTlpOTVV8rGjtjdIxTHzoUkSu2pKoTN1z/o1kSU7hIc=;
        b=vMJAceYbOcASdFBR5FC6WwUsb2mKpFVRz20mcXglO3PXfa7b4Fqv9k1BOyfrkXa05V
         uIP6poe0BNIxWwiUlq1ULYJygcdyvz32rBWhdBMLPx+jIlCHODdC0KPK4UCkJelSb/fn
         XFoP2rD38+oSRS+icEVe8X2IIG/1sFlW9bFxJTAza94wEKOLCglndGQLvo8hz2TiiOWD
         FkAo45KtRcyegcHMP7iq0DmbZKx6A/7fL6/TeLeSeAYE6MTHMuDzSFMI0tPgGyCH4upC
         7eSt8r7OjLVFPxIke3tkdzwmJ//dvs2cH0aEJvy1PSzRjdUyJs0EyN9l8vYbfXV11Y+f
         SrjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JTlpOTVV8rGjtjdIxTHzoUkSu2pKoTN1z/o1kSU7hIc=;
        b=VGhaNW7Q0velAkspVeVesOBVoEb4utSmRHNt2A5IR8RVKMJrKfiXwN2Ug29EyHRoXc
         hXeV+AjhlkAvue2XY8qMgnRr4OaY8gvlkQCqmyoO1OTJDBKhvRJGGkOhJQCAMSLdYKsJ
         lPBbW3BtsO1m24Mcfqcw/4UmuVKQV1Rzovwsh1pD1ldwMmyUuMJKmjNYVc4gKKGuz2Fc
         IKdvqGDZt8tbN/NXzPrsEekEcBoLIzbU8tU1jDX5KpjnYd383IE7ZLwjGdVzgu6fYZpg
         LaQBakN2D7IN3WfboIk444XtIvFb4ewo23cyj7BvcTUV2HlEqdU2u8s2hx/vVLH+y5//
         Tvng==
X-Gm-Message-State: AOAM533ArzaTp236v1qkQMbvpiyNOC1CuGGEOxeCop/+B9+/ieL4Vx1M
        OAX8MHNwEtekrpdbavEU8HHVOy9gUA1eAq8umPmhIw==
X-Google-Smtp-Source: ABdhPJzeWkpXuLKUTYJLqdTnJlt2X9TfUMTDZYTPtvX83N2ySkknJLRJbehovdGyWLDIDC1hFY0TyYo8SwL8MXyhKRc=
X-Received: by 2002:a17:907:728b:b0:6da:97db:b66d with SMTP id
 dt11-20020a170907728b00b006da97dbb66dmr12176255ejc.636.1646729609637; Tue, 08
 Mar 2022 00:53:29 -0800 (PST)
MIME-Version: 1.0
References: <20220307105414.17706-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20220307105414.17706-1-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 8 Mar 2022 09:53:18 +0100
Message-ID: <CAMRc=MdLdJwTAxOwbOdO_Q=eE-MHNJwNmayy6svZ1zfhenW12g@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpiolib: Use list_first_entry()/list_last_entry()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 7, 2022 at 11:54 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Use list_first_entry()/list_last_entry() instead of open coded variants.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/gpiolib.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 002bf4b1616b..f5e7443208d4 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -262,14 +262,14 @@ static int gpiodev_add_to_list(struct gpio_device *gdev)
>                 return 0;
>         }
>
> -       next = list_entry(gpio_devices.next, struct gpio_device, list);
> +       next = list_first_entry(&gpio_devices, struct gpio_device, list);
>         if (gdev->base + gdev->ngpio <= next->base) {
>                 /* add before first entry */
>                 list_add(&gdev->list, &gpio_devices);
>                 return 0;
>         }
>
> -       prev = list_entry(gpio_devices.prev, struct gpio_device, list);
> +       prev = list_last_entry(&gpio_devices, struct gpio_device, list);
>         if (prev->base + prev->ngpio <= gdev->base) {
>                 /* add behind last entry */
>                 list_add_tail(&gdev->list, &gpio_devices);
> @@ -4426,7 +4426,7 @@ static void *gpiolib_seq_next(struct seq_file *s, void *v, loff_t *pos)
>         if (list_is_last(&gdev->list, &gpio_devices))
>                 ret = NULL;
>         else
> -               ret = list_entry(gdev->list.next, struct gpio_device, list);
> +               ret = list_first_entry(&gdev->list, struct gpio_device, list);
>         spin_unlock_irqrestore(&gpio_lock, flags);
>
>         s->private = "\n";
> --
> 2.34.1
>

Applied, thanks!

Bart
