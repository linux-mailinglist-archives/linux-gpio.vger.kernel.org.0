Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DDA0770D75C
	for <lists+linux-gpio@lfdr.de>; Tue, 23 May 2023 10:26:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235926AbjEWI0E (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 May 2023 04:26:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236272AbjEWIZA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 May 2023 04:25:00 -0400
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com [IPv6:2607:f8b0:4864:20::e2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91B1510C4
        for <linux-gpio@vger.kernel.org>; Tue, 23 May 2023 01:23:02 -0700 (PDT)
Received: by mail-vs1-xe2b.google.com with SMTP id ada2fe7eead31-4394b1820a8so489985137.3
        for <linux-gpio@vger.kernel.org>; Tue, 23 May 2023 01:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1684830181; x=1687422181;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zjHyckPwHHuHdgFwE4qh1Wuuo7Eui8vMfceM9MrdK3M=;
        b=BpBVeot8lz9XSq6BLLeP3wEqoobHJUn796yDM96dEXkgFKzt/WVfVnu/GJzzIDTdlR
         7dAM/Sao3nmyL/rK8wq3ckAFCz3I+1FXErRhiUQihy10UdIHhdl5O6+oiUtBO3UYQlu9
         TxkEqbTGkx7aVkXjsv52vWz/0tOe7c43oCwrCTnQ9S0jNu3zMQHMEvgdnOp6wY6f6eBl
         hmmka9i3d0h+L/K5Azjgk/ifxKw1SiGynhRaOAl6sDud1VNWqNVJ2ANenxSk5zh3CNg3
         pzEjVkZFoi/QOwgMN+L54gTeGnRIQ+yqYrubqDBKlSB1P3+BQkpyYT7aVbBRudjx1Pk7
         ++DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684830181; x=1687422181;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zjHyckPwHHuHdgFwE4qh1Wuuo7Eui8vMfceM9MrdK3M=;
        b=XNMDFpqoYPmnGBhVkqWXklRcGrkowEGfUUGfDdiToZlIlMv1w8/S4x/QrSYsCJ48DO
         lSNFVwWZ65N/b8Fkqvub0AcsXHg2/rsASfGc+ZLWmH6kxNICFIvOS27WybE8T6BEw0NU
         irEOdqaRHzpMBx/XLc4cr6Oh9GpyR78ph6kvgiRNIvqe7sfiUoBOImdj3nSnTu2K5Rs0
         00CTSZMJED5hgYF8r55/k2+FvfhxgO8+LmuW6MoOg9p2D50yeYQ0N4y+3p1Z06qNYUFQ
         JdpO/xaXeXjSgDkCkiRc+xSyGTYUIVxklnrocfphm8VThiX5ia7R7qFE+jNgaqBpthm/
         JEHw==
X-Gm-Message-State: AC+VfDxaFUM6MNnFOiDIHP9cyp+l/hM1VoYV2/iQAErqLX3XV7TTDvlu
        ikBWaNYXST2WQCawjBq4ixFb93nccXhkPrGAnq/K1JiG8O2s7rGx
X-Google-Smtp-Source: ACHHUZ4iPAvS59ILj+lu+sbEKfdq9a4KR6lTtU7qvfK/yCnM3pI2xhNyoXwwv1yfH73cwDrG8ZAUn65SoQU6/vIyFWI=
X-Received: by 2002:a67:e2c7:0:b0:439:558f:4cd2 with SMTP id
 i7-20020a67e2c7000000b00439558f4cd2mr536465vsm.11.1684830181717; Tue, 23 May
 2023 01:23:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230522045806.3442-1-raag.jadav@intel.com>
In-Reply-To: <20230522045806.3442-1-raag.jadav@intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 23 May 2023 10:22:50 +0200
Message-ID: <CAMRc=McL-yuUSTMiWn56Q26ZYKoLTx1yYTRsygLQsKRbAgsR5Q@mail.gmail.com>
Subject: Re: [PATCH v1] gpio: tangier: calculate number of ctx using temporary variable
To:     Raag Jadav <raag.jadav@intel.com>
Cc:     linus.walleij@linaro.org, andriy.shevchenko@linux.intel.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        mallikarjunappa.sangannavar@intel.com, pandith.n@intel.com
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

On Mon, May 22, 2023 at 6:58=E2=80=AFAM Raag Jadav <raag.jadav@intel.com> w=
rote:
>
> Utilize a temporary variable to calculate number of ctx from ngpio
> inside ->probe() implementation.
> While at it, include math.h for using DIV_ROUND_UP().
>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>  drivers/gpio/gpio-tangier.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-tangier.c b/drivers/gpio/gpio-tangier.c
> index e990781935ba..7ce3eddaed25 100644
> --- a/drivers/gpio/gpio-tangier.c
> +++ b/drivers/gpio/gpio-tangier.c
> @@ -16,6 +16,7 @@
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
>  #include <linux/irq.h>
> +#include <linux/math.h>
>  #include <linux/module.h>
>  #include <linux/pinctrl/pinconf-generic.h>
>  #include <linux/spinlock.h>
> @@ -428,10 +429,11 @@ static int tng_gpio_add_pin_ranges(struct gpio_chip=
 *chip)
>  int devm_tng_gpio_probe(struct device *dev, struct tng_gpio *gpio)
>  {
>         const struct tng_gpio_info *info =3D &gpio->info;
> +       size_t nctx =3D DIV_ROUND_UP(info->ngpio, 32);
>         struct gpio_irq_chip *girq;
>         int ret;
>
> -       gpio->ctx =3D devm_kcalloc(dev, DIV_ROUND_UP(info->ngpio, 32), si=
zeof(*gpio->ctx), GFP_KERNEL);
> +       gpio->ctx =3D devm_kcalloc(dev, nctx, sizeof(*gpio->ctx), GFP_KER=
NEL);
>         if (!gpio->ctx)
>                 return -ENOMEM;
>
> --
> 2.17.1
>

Applied, thanks!

Bartosz
