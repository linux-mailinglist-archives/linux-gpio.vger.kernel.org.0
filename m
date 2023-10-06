Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 178B07BBDA7
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Oct 2023 19:24:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232923AbjJFRYa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Oct 2023 13:24:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232404AbjJFRY3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Oct 2023 13:24:29 -0400
Received: from mail-vk1-xa33.google.com (mail-vk1-xa33.google.com [IPv6:2607:f8b0:4864:20::a33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3AF0C2
        for <linux-gpio@vger.kernel.org>; Fri,  6 Oct 2023 10:24:27 -0700 (PDT)
Received: by mail-vk1-xa33.google.com with SMTP id 71dfb90a1353d-49dd3bb5348so934597e0c.0
        for <linux-gpio@vger.kernel.org>; Fri, 06 Oct 2023 10:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696613067; x=1697217867; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MXg07Advx6F48OmXOI5LqKwE4lifCKB21IEnukLuOS4=;
        b=qlOELpKp/HAVpMRkKgqLmrXrNXEFeJcdZrPQDXPF1PQRk+o3U5KA58Qh84cDnXru9K
         Fr6HCQqqNt3zzF9hOvkttcmkStKcHdwUrjhxFpu1igNAfyWPPGMWAeEoHRfYbYw0Gklq
         GKTfPg/yjXAwJGLkqDEveut58nRGXgyFsJfFjj0ebADnprrZu9B5BR+crSzZXyyjqYUh
         EJfDGNK+3bILEsgMrdvzwaLc89zoTTSwBgCx9XHvdVZ1EFFlPlfPnNfM6z58tA/0qSzc
         AFPDw1Ck2FPgNoInMTObhMQ7GfGHpChRD5yG1iZ7eVa1bi70fPquOkab5H5vBPOFro1p
         2fFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696613067; x=1697217867;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MXg07Advx6F48OmXOI5LqKwE4lifCKB21IEnukLuOS4=;
        b=luQz+rfAWNUXKEzJPvyOPr8DBFyX4+k5wlM8C9hV9uHZlrsU49JBTp2KaOU/ghx8Ly
         pojUFiog4jOGa15shxA6yRV0mlUOnXGf0gIyAyFHvZZhSxzvZS2CQQpS8AYjtE+kxWJx
         xOFqVyWGS0XOgEyvXvhVXdEvdwJ9bog7zDW5nwO0q3dZQgfZekTp3FWMq3WUnplsSmK+
         FkBcMc1sObVJLVDg7KnKk2DVarepM+bi1SLK4RniYT9wpeNHTFFvJyfe3okdjrTGdeto
         p45qwzhE4gP6xBwm+iLkOB9iAxIOUncWHoE95aRq22e+AoSGqwf8zgFQeBM2RBTrKrTW
         S/MQ==
X-Gm-Message-State: AOJu0YwuuFsRhiDRvAm5/UtbEsOFvsdA4dU2zn0kABfEITpQNSRJd4z8
        TxVGLysaxU7ZL7FZqc0XoGm4rq4Gypr9Nq4EJyVbsQ==
X-Google-Smtp-Source: AGHT+IGfi4mWhaz+b8BorJFDpgBUjJUgMrmh9w4qb8vbAM4r9GKqJxQmeIxhjH0dns02JY2KOxOWrQmMHml9anSgJvU=
X-Received: by 2002:a1f:49c5:0:b0:49a:b7bf:5a22 with SMTP id
 w188-20020a1f49c5000000b0049ab7bf5a22mr7842989vka.14.1696613066638; Fri, 06
 Oct 2023 10:24:26 -0700 (PDT)
MIME-Version: 1.0
References: <20231006-pxa-gpio-v6-0-981b4910d599@skole.hr> <20231006-pxa-gpio-v6-1-981b4910d599@skole.hr>
In-Reply-To: <20231006-pxa-gpio-v6-1-981b4910d599@skole.hr>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 6 Oct 2023 19:24:15 +0200
Message-ID: <CAMRc=Mf3yoMF1Q5=-UtzJf4gqONQ=Dg=p68Q=DsVANaAPgwD=w@mail.gmail.com>
Subject: Re: [PATCH RFT v6 1/6] ARM: pxa: Convert Spitz OHCI to GPIO descriptors
To:     =?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Cc:     Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Russell King <linux@armlinux.org.uk>,
        Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-input@vger.kernel.org, linux-spi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 6, 2023 at 3:45=E2=80=AFPM Duje Mihanovi=C4=87 <duje.mihanovic@=
skole.hr> wrote:
>
> Sharp's Spitz board still uses the legacy GPIO interface for controlling
> a GPIO pin related to the USB host controller.
>
> Convert this function to use the new GPIO descriptor interface.
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Duje Mihanovi=C4=87 <duje.mihanovic@skole.hr>
> ---
>  arch/arm/mach-pxa/spitz.c      | 13 ++++++-------
>  drivers/usb/host/ohci-pxa27x.c |  7 +++++++
>  2 files changed, 13 insertions(+), 7 deletions(-)
>
> diff --git a/arch/arm/mach-pxa/spitz.c b/arch/arm/mach-pxa/spitz.c
> index cc691b199429..535e2b2e997b 100644
> --- a/arch/arm/mach-pxa/spitz.c
> +++ b/arch/arm/mach-pxa/spitz.c
> @@ -649,23 +649,22 @@ static inline void spitz_mmc_init(void) {}
>   * USB Host
>   ***********************************************************************=
*******/
>  #if defined(CONFIG_USB_OHCI_HCD) || defined(CONFIG_USB_OHCI_HCD_MODULE)
> +GPIO_LOOKUP_SINGLE(spitz_usb_host_gpio_table, "pxa27x-ohci", "gpio-pxa",
> +               SPITZ_GPIO_USB_HOST, "usb-host", GPIO_ACTIVE_LOW);
> +
>  static int spitz_ohci_init(struct device *dev)
>  {
> -       int err;
> -
> -       err =3D gpio_request(SPITZ_GPIO_USB_HOST, "USB_HOST");
> -       if (err)
> -               return err;
> +       gpiod_add_lookup_table(&spitz_usb_host_gpio_table);
>
>         /* Only Port 2 is connected, setup USB Port 2 Output Control Regi=
ster */
>         UP2OCR =3D UP2OCR_HXS | UP2OCR_HXOE | UP2OCR_DPPDE | UP2OCR_DMPDE=
;
>
> -       return gpio_direction_output(SPITZ_GPIO_USB_HOST, 1);
> +       return 0;
>  }
>
>  static void spitz_ohci_exit(struct device *dev)
>  {
> -       gpio_free(SPITZ_GPIO_USB_HOST);
> +       gpiod_remove_lookup_table(&spitz_usb_host_gpio_table);
>  }
>
>  static struct pxaohci_platform_data spitz_ohci_platform_data =3D {
> diff --git a/drivers/usb/host/ohci-pxa27x.c b/drivers/usb/host/ohci-pxa27=
x.c
> index 357d9aee38a3..7f04421c80d6 100644
> --- a/drivers/usb/host/ohci-pxa27x.c
> +++ b/drivers/usb/host/ohci-pxa27x.c
> @@ -121,6 +121,7 @@ struct pxa27x_ohci {
>         void __iomem    *mmio_base;
>         struct regulator *vbus[3];
>         bool            vbus_enabled[3];
> +       struct gpio_desc *usb_host;
>  };
>
>  #define to_pxa27x_ohci(hcd)    (struct pxa27x_ohci *)(hcd_to_ohci(hcd)->=
priv)
> @@ -447,6 +448,10 @@ static int ohci_hcd_pxa27x_probe(struct platform_dev=
ice *pdev)
>         pxa_ohci =3D to_pxa27x_ohci(hcd);
>         pxa_ohci->clk =3D usb_clk;
>         pxa_ohci->mmio_base =3D (void __iomem *)hcd->regs;
> +       pxa_ohci->usb_host =3D devm_gpiod_get_optional(&pdev->dev, "usb-h=
ost", GPIOD_OUT_LOW);
> +       if (IS_ERR(pxa_ohci->usb_host))
> +               return dev_err_probe(&pdev->dev, PTR_ERR(pxa_ohci->usb_ho=
st),
> +                               "failed to get USB host GPIO\n");
>
>         for (i =3D 0; i < 3; ++i) {
>                 char name[6];
> @@ -512,6 +517,8 @@ static void ohci_hcd_pxa27x_remove(struct platform_de=
vice *pdev)
>         for (i =3D 0; i < 3; ++i)
>                 pxa27x_ohci_set_vbus_power(pxa_ohci, i, false);
>
> +       gpiod_put(pxa_ohci->usb_host);

This is now wrong. Devres APIs are managed by the driver core. You no
longer need this in your remove() callback.

Bart

> +
>         usb_put_hcd(hcd);
>  }
>
>
> --
> 2.42.0
>
>
