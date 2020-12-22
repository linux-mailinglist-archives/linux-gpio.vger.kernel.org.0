Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1578D2E0778
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Dec 2020 09:54:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726033AbgLVIxn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Dec 2020 03:53:43 -0500
Received: from mail-ot1-f43.google.com ([209.85.210.43]:35251 "EHLO
        mail-ot1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726032AbgLVIxn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Dec 2020 03:53:43 -0500
Received: by mail-ot1-f43.google.com with SMTP id i6so11338707otr.2;
        Tue, 22 Dec 2020 00:53:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+CsslQAF3nPoofK3CBM0zYWDqQbC1If0S8clDu+Gzzw=;
        b=GcPj80d5AMVM5nx4YB1/XRBhBjTKZloSmFqHRjLJnNCz7u3m4Iy8CuL2rhQr9aOv1m
         LDNwsXdDbhei6OKM+s+vjsOQGk2YWXiCdYmKbUFtdRxArLqeJUTaKClukh49woTOkMXX
         Vh0ceyKGWMTuHqGcsOtV4f5tl1vM5LWvUx2NNRTWam+3YdMTTdfxHG0p6QZSuZlgDTNi
         0E3ECc+eoXCXPSa2C2Nhurm8mT+COtoCZpeB9N2kRbh03JWsqW2M3OZZPAauTj8ZJ3ly
         yV4yi1fs/rOuT3JZXuIGDitn6FTvKE0S7bBBWo1Pqus6chvGjOQdGRVMijX0EEkVI9BZ
         kTng==
X-Gm-Message-State: AOAM532KLDffd1e/gm1ws+kZKdJprWQQVV9r/VLcQbhnoZVN7MpeeocQ
        yuM6P0Tf7Y/VqutIjApwFiUX070bC8dXuqTv6fg=
X-Google-Smtp-Source: ABdhPJzY0266Jvt9XWob4G/K1i1aS8Ec4otCu0hXywqpGPfIWSI5kW6hibscA8Ibs9fKornynX1adUX1Ub1y5LDHI30=
X-Received: by 2002:a05:6830:1f5a:: with SMTP id u26mr15005606oth.250.1608627182559;
 Tue, 22 Dec 2020 00:53:02 -0800 (PST)
MIME-Version: 1.0
References: <1608519279-13341-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1608519279-13341-13-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1608519279-13341-13-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 22 Dec 2020 09:52:51 +0100
Message-ID: <CAMuHMdXkRUbjQk=1mqn0b7PeGX0ir=s4UwbCHfw_2mWaVEVPTg@mail.gmail.com>
Subject: Re: [PATCH v4 12/12] mfd: bd9571mwv: Add support for BD9574MWF
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Marek Vasut <marek.vasut+renesas@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Khiem Nguyen <khiem.nguyen.xt@renesas.com>,
        linux-power <linux-power@fi.rohmeurope.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Shimoda-san,

On Mon, Dec 21, 2020 at 3:56 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> From: Khiem Nguyen <khiem.nguyen.xt@renesas.com>
>
> The new PMIC BD9574MWF inherits features from BD9571MWV.
> Add the support of new PMIC to existing bd9571mwv driver.
>
> Signed-off-by: Khiem Nguyen <khiem.nguyen.xt@renesas.com>
> Co-developed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks for your patch!

> --- a/drivers/mfd/bd9571mwv.c
> +++ b/drivers/mfd/bd9571mwv.c

> @@ -200,12 +277,14 @@ static int bd9571mwv_probe(struct i2c_client *client,
>
>  static const struct of_device_id bd9571mwv_of_match_table[] = {
>         { .compatible = "rohm,bd9571mwv", },
> +       { .compatible = "rohm,bd9574mwf", },
>         { /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, bd9571mwv_of_match_table);
>
>  static const struct i2c_device_id bd9571mwv_id_table[] = {
> -       { "bd9571mwv", 0 },
> +       { "bd9571mwv", ROHM_CHIP_TYPE_BD9571 },
> +       { "bd9574mwf", ROHM_CHIP_TYPE_BD9574 },

Why add the chip types?  These are unused, and the driver uses
autodetection of the chip variant anyway.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
