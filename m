Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F075557E03
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Jun 2022 16:43:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231362AbiFWOnM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Jun 2022 10:43:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231159AbiFWOnL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Jun 2022 10:43:11 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB44B9581
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jun 2022 07:43:09 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id z11so22698901edp.9
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jun 2022 07:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=8Jjeumwao/tllyaNwoPdzn6Vzab/eSemWHLR9fkMCWQ=;
        b=eQcUX10Xm7Vb+0J7Sbfqt7eapgSBEWtVDVr2MCFXQR9KU+19qQ/gAsjKi83c6jigkb
         tL3brvngfteejIp4+D/A5F/enIZCXZv7GpAFFS/BgyN8rgCt2+0zraucXpsKIBpHu+yV
         ynFAkeUtBuvsZEkdkTy06SVvM5VKtG+N5i7l96RjpB9Nak2OSu5yUWtOP+C28eDzUaim
         R3QqqQM2aZ+pgf9ECmBWuRXT3qycrs/pg7m8w0nsYCF7TqhwIVA21gSJWAwmiceK3Z0n
         0TOVvCUyevKj6Ic8ray0BIFVSEm2AmgZyZp1W4/0vezJro74t9VBMsWjBY7cI1rm9KTt
         9/NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=8Jjeumwao/tllyaNwoPdzn6Vzab/eSemWHLR9fkMCWQ=;
        b=Uf+K3xc08C+wJOSuJTZGnxPJIwcz4NeqcIE9GROfVLO1CAR+v2hOnOPhQZZMBj6ZAL
         g+VxLSfM1oFCCnKXCIdILNRhyqbZDTb1pFE62bgpj4Xxd2+WuUNdqwtN7NU6dj/0NmjB
         /F/ZLLBc73K3f3c2Vze9QYlnh+OL7r3ATajOwR6mDAf2mt0jJo6tqrb4mM2SDloZ828t
         WtdVfGacie0BSSxCBX4pOcKpJ4CUv0bwTsRNr47k+wOf6ZfWurEGa18B8qzBvg2wwsFi
         oCTaJKNQoKd7/uDMuhBv7rksoXIP4A1QJ5MP5eI0u4gLVzNjhWo38xe5mlV3TkiOY2Pf
         U4UQ==
X-Gm-Message-State: AJIora9yz6EGUkHgdmdAKcqn+ly0EKlsHc8wRmr1JMZEVVdGXwuYIntI
        KL9GC3KVNF/PMQ09FiGju7iPgFffwnI+/PsxWMDh+A==
X-Google-Smtp-Source: AGRyM1t2Knv6t0kMJnkFmGd6V7nV/Cr3Eu7pytXaOaG7yVtMbQ2R94tqUzSpLe2UTChPhN0cJR+SqqhCs/PWzfTYhfU=
X-Received: by 2002:a05:6402:18:b0:435:9a79:9a40 with SMTP id
 d24-20020a056402001800b004359a799a40mr11064048edu.328.1655995388347; Thu, 23
 Jun 2022 07:43:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220621064036.147797-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20220621064036.147797-1-u.kleine-koenig@pengutronix.de>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 23 Jun 2022 16:42:57 +0200
Message-ID: <CAMRc=MeYii5xNfXKgfoxtSBaiPP9UTP3rvFgx4+VTTb6Hw7GxA@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: grgpio: Fix device removing
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 21, 2022 at 8:40 AM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> If a platform device's remove callback returns non-zero, the device core
> emits a warning and still removes the device and calls the devm cleanup
> callbacks.
>
> So it's not save to not unregister the gpiochip because on the next reque=
st
> to a GPIO the driver accesses kfree()'d memory. Also if an IRQ triggers,
> the freed memory is accessed.
>
> Instead rely on the GPIO framework to ensure that after gpiochip_remove()
> all GPIOs are freed and so the corresponding IRQs are unmapped.
>
> This is a preparation for making platform remove callbacks return void.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
> Changes since (implicit) v1
> (Message-Id: 20220620122933.106035-1-u.kleine-koenig@pengutronix.de):
>
>  - Fix capitalisation of GPIO and IRQ in commit log
>  - Add another "are" in the third paragraph.
>  - Drop note about a potential bug in GPIO framework
>    I'm not sure there is actually a bug.
>
> Thanks to Andy Shevchenko for his feedback.
>
> Best regards
> Uwe
>
>  drivers/gpio/gpio-grgpio.c | 14 +-------------
>  1 file changed, 1 insertion(+), 13 deletions(-)
>
> diff --git a/drivers/gpio/gpio-grgpio.c b/drivers/gpio/gpio-grgpio.c
> index df563616f943..bea0e32c195d 100644
> --- a/drivers/gpio/gpio-grgpio.c
> +++ b/drivers/gpio/gpio-grgpio.c
> @@ -434,25 +434,13 @@ static int grgpio_probe(struct platform_device *ofd=
ev)
>  static int grgpio_remove(struct platform_device *ofdev)
>  {
>         struct grgpio_priv *priv =3D platform_get_drvdata(ofdev);
> -       int i;
> -       int ret =3D 0;
> -
> -       if (priv->domain) {
> -               for (i =3D 0; i < GRGPIO_MAX_NGPIO; i++) {
> -                       if (priv->uirqs[i].refcnt !=3D 0) {
> -                               ret =3D -EBUSY;
> -                               goto out;
> -                       }
> -               }
> -       }
>
>         gpiochip_remove(&priv->gc);
>
>         if (priv->domain)
>                 irq_domain_remove(priv->domain);
>
> -out:
> -       return ret;
> +       return 0;
>  }
>
>  static const struct of_device_id grgpio_match[] =3D {
>
> base-commit: f2906aa863381afb0015a9eb7fefad885d4e5a56
> --
> 2.36.1
>

Applied, thanks!

Bart
