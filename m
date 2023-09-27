Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B7927AFB62
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Sep 2023 08:52:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229527AbjI0GwP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Sep 2023 02:52:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229499AbjI0GwO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Sep 2023 02:52:14 -0400
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com [IPv6:2607:f8b0:4864:20::e31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7077AD6
        for <linux-gpio@vger.kernel.org>; Tue, 26 Sep 2023 23:52:13 -0700 (PDT)
Received: by mail-vs1-xe31.google.com with SMTP id ada2fe7eead31-452b0430cc5so4823700137.3
        for <linux-gpio@vger.kernel.org>; Tue, 26 Sep 2023 23:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1695797532; x=1696402332; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vONsYLGOxldofhantov650b3RsYyY86s9ccAwhGuM0E=;
        b=sqYBT4jB24sBI9VmRNewatyCpQeIF+kM2YXk941i8xb0loKDix6f8JRGJSUmL/8wdW
         MBvJfCw0j9uM1uKJAgeMXCtEjgZ91AT0pf9SQJNmuuI94ND6Q+vRVmQtmU2fP7TePCmN
         9dFn4DdiSUwhW7xRD26eBqaeedXhEGweTRvhzKR/e/gBYnTOD2rYsLfZMH2NHkCvXgdG
         POil6sM5mLuMOO0IscYt/0SWxCvc7c0dGhtAugC4Oji1tDV6vFqMGDdmyKaG8WuLbl6f
         KP+oZSmDwSiDxyrAsgTMY/Fbw3QyMhMDns/0YFecBhL0gS2wn28IwrdXDDm2QhubL0Ce
         pCpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695797532; x=1696402332;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vONsYLGOxldofhantov650b3RsYyY86s9ccAwhGuM0E=;
        b=GkFqwKzXORobkyUSL9W5aSBiHghq0Fnkbb1Ni7wC6TUzCWa+FECfjY2zUUQuAtlgIZ
         kB2yyHtr3+pUtIKMgqZHg4KJmgd5UApkfZ+fnUWo8WFSsWe1QmDOt8WXSD441+7b0O08
         gwc7Qb83K2zRaAHu17e4sNouE8KAw7lWDx1VYakhsVoHnk2mKkxJQILVyXfs0tM8Y7Vf
         rrIey5WZSEjkT0TBiksCc4gq0R1YMP831JBtP7r1NcfstBlvWm7o7XRCCZhXslVd9pBN
         ibIENnvSjDSQDiPI6TEuFAcrtJ3AXKMXuDU3cGd5XDDwptbudF9Pxq9TPEbfynQDwItp
         jFKQ==
X-Gm-Message-State: AOJu0Yw7jMgGdkDMUFlYnh+h4GGQc+yI8ZPgBS5rGtqlp3/gePZyuPgd
        lj2/FAKWDkpChEyOT8eezUhbd52TevTWpsZxCNrjmg==
X-Google-Smtp-Source: AGHT+IEtFEg/blmjKvPIeEaiQLJryXa1t5X53hIrWwYtftKWWDngMKsgDwNoIRMmoNVgos2UmZ+LT0ei0LqakDvaoH8=
X-Received: by 2002:a05:6102:3551:b0:452:4d64:9347 with SMTP id
 e17-20020a056102355100b004524d649347mr1086522vss.35.1695797532493; Tue, 26
 Sep 2023 23:52:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230926102914.6145-1-dg573847474@gmail.com>
In-Reply-To: <20230926102914.6145-1-dg573847474@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 27 Sep 2023 08:52:01 +0200
Message-ID: <CAMRc=Mf-tO5yaushz__Mq+em8o3Qp+QkG2Dc06JY9r-GoWPu=Q@mail.gmail.com>
Subject: Re: [PATCH] gpio: timberdale: Fix potential deadlock on &tgpio->lock
To:     Chengfeng Ye <dg573847474@gmail.com>
Cc:     linus.walleij@linaro.org, andy@kernel.org, alex@shruggie.ro,
        aboutphysycs@gmail.com, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 26, 2023 at 12:29=E2=80=AFPM Chengfeng Ye <dg573847474@gmail.co=
m> wrote:
>
> As timbgpio_irq_enable()/timbgpio_irq_disable() callback could be
> executed under irq context, it could introduce double locks on
> &tgpio->lock if it preempts other execution units requiring
> the same locks.
>
> timbgpio_gpio_set()
> --> timbgpio_update_bit()
> --> spin_lock(&tgpio->lock)
> <interrupt>
>    --> timbgpio_irq_disable()
>    --> spin_lock_irqsave(&tgpio->lock)
>
> This flaw was found by an experimental static analysis tool I am
> developing for irq-related deadlock.
>
> To prevent the potential deadlock, the patch uses spin_lock_irqsave()
> on &tgpio->lock inside timbgpio_gpio_set() to prevent the possible
> deadlock scenario.
>
> Signed-off-by: Chengfeng Ye <dg573847474@gmail.com>
> ---
>  drivers/gpio/gpio-timberdale.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-timberdale.c b/drivers/gpio/gpio-timberdal=
e.c
> index bbd9e9191199..fad979797486 100644
> --- a/drivers/gpio/gpio-timberdale.c
> +++ b/drivers/gpio/gpio-timberdale.c
> @@ -43,9 +43,10 @@ static int timbgpio_update_bit(struct gpio_chip *gpio,=
 unsigned index,
>         unsigned offset, bool enabled)
>  {
>         struct timbgpio *tgpio =3D gpiochip_get_data(gpio);
> +       unsigned long flags;
>         u32 reg;
>
> -       spin_lock(&tgpio->lock);
> +       spin_lock_irqsave(&tgpio->lock, flags);
>         reg =3D ioread32(tgpio->membase + offset);
>
>         if (enabled)
> @@ -54,7 +55,7 @@ static int timbgpio_update_bit(struct gpio_chip *gpio, =
unsigned index,
>                 reg &=3D ~(1 << index);
>
>         iowrite32(reg, tgpio->membase + offset);
> -       spin_unlock(&tgpio->lock);
> +       spin_unlock_irqrestore(&tgpio->lock, flags);
>
>         return 0;
>  }
> --
> 2.17.1
>

Applied, thanks!

Bart
