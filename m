Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86942552DDC
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jun 2022 11:06:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348009AbiFUJGI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Jun 2022 05:06:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348055AbiFUJGH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Jun 2022 05:06:07 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 493B1DFA0
        for <linux-gpio@vger.kernel.org>; Tue, 21 Jun 2022 02:06:05 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id o10so18445883edi.1
        for <linux-gpio@vger.kernel.org>; Tue, 21 Jun 2022 02:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=B+BudkbGeoeoLKhS9Lq+YqOl0bn0BEXvsxRDcEMFFGw=;
        b=qw3PynOLXFD5iwLOSNoSb2UxpSlFYWwTTBG2MgBkLlGsXp63r2o6N1cOiK3hDxo+3O
         rPKgMILw7Tq5yD4JF3H5cdbsPYuS9UQvmVJ9h4/PnHh5gFR9Cr3KdkJWP9Pk3MIpEbEW
         VYc/fEBsQUpkNcZnEQd3wMAiDWrygZ/EFcAMwIgKTYsTCn6hJOOHHM2zKg4LuVzMpy5O
         KyvJ/oIJEgJUFQEhzVbty6hE+kaKWI7QkGBDQRY5Vow4msaIqEEC9yICvexHnMVwHPi0
         FosSRfnCZOzJW+7oAyBtI2cJuc6omnXs2Ur5kTOX4abOjxcGCy2vxxDm6L5Xq9N8dPDN
         +/yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=B+BudkbGeoeoLKhS9Lq+YqOl0bn0BEXvsxRDcEMFFGw=;
        b=Nm7IPycrrB/lekRpZ/1L8CZZcMctjIIxN/02Z65mdg39uj/791FSM9OcW/VlSO1olP
         YI2IvOqiYxXyb3BsnHlwXQRjlDc/x0xvGRHObHnkNWDT4LzIszTQ5v9e68JoW1DXJt3q
         uZudBg6Zsvghmtmh69jRwczwy0e2YwgLm8aT3IuaRVBAsyeapxLsUz8228ETt42NJu6O
         8kwV9kiRYxtHQZKdTfX8f9eQ2JGQaNDkx3DpF7rJ/ZlLhNq6yQ2MUUxjK9EKfDikC9jt
         qyGxVbhjVpQLyu1NOxSgcAUkC5XES3wKu+/5W7ow2DOgQD6d+gh4bvuyeH4SuWW9PZz2
         TYCA==
X-Gm-Message-State: AJIora9mRHI6kBZBnWMhFV7brdgzFhUrs8AYPBa0xFTv4WFc+2RY5Wha
        FCtcrUoGzH/Z2qNe3/Ovcwe8KtJ4G7IbNaWUHlg=
X-Google-Smtp-Source: AGRyM1salgGaMVGaM2isKPkUDoN9M6TbTjaoMddRQc/jwqaW9p8h8gD0U1mUvOz59yiCBlSk1hlfwiweC+qAdaO8YTc=
X-Received: by 2002:a50:9f6a:0:b0:435:5804:e07 with SMTP id
 b97-20020a509f6a000000b0043558040e07mr29385289edf.178.1655802363301; Tue, 21
 Jun 2022 02:06:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220621064036.147797-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20220621064036.147797-1-u.kleine-koenig@pengutronix.de>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 21 Jun 2022 11:05:27 +0200
Message-ID: <CAHp75VfN8r5hviT70kWW0F7PJ0=Pm=4uVvT9xH6re3VEf5Oq9A@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: grgpio: Fix device removing
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
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

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

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


--=20
With Best Regards,
Andy Shevchenko
