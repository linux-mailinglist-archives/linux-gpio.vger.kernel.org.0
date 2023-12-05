Return-Path: <linux-gpio+bounces-1040-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 162948061B2
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Dec 2023 23:29:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C1C33282021
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Dec 2023 22:29:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B7BF6EB4F;
	Tue,  5 Dec 2023 22:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SzUAPLx1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-x936.google.com (mail-ua1-x936.google.com [IPv6:2607:f8b0:4864:20::936])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B0BA18B
	for <linux-gpio@vger.kernel.org>; Tue,  5 Dec 2023 14:29:46 -0800 (PST)
Received: by mail-ua1-x936.google.com with SMTP id a1e0cc1a2514c-7c5a2b5e77bso970787241.1
        for <linux-gpio@vger.kernel.org>; Tue, 05 Dec 2023 14:29:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701815385; x=1702420185; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NrXqJVDzW4Zm/gOjUfh5BbRIxo1FamErN2RJgIBt+Rg=;
        b=SzUAPLx1mlnqn4xCO0z6RhzFtL9DkM1/MY4zDBwCSG6jXaCRcGwRJjvZo0YsDPu5m4
         miQcdaeuy0lFWtFQ3QDmuGVjSNjGLUjKxRAVDq1dN2KPGT2UM+6lvh/VjEA32PAE85x2
         xvO5/TeR/vKMn4zeWv7dhnyEum0V8i7jeos7zkwvD7RRvrbCiYaA1pv85Hc4H+q/4sml
         XwmwgqdPkHONOWrQALsZkMyllVhU6XtqY35fClg9yq/re+QxBC94e7zAuutZ+07eFd9P
         7lNcoqlriEImhZByQ40DKs6d9QcaI7VlIgr0K5ckFDW/5EcTFheYrVnhP/t9r2st1FeH
         pJAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701815385; x=1702420185;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NrXqJVDzW4Zm/gOjUfh5BbRIxo1FamErN2RJgIBt+Rg=;
        b=MnPYittLk2b31q01AEMI4c2w3N5ux064pENG8zvUdEdxlmFh6J1peEmLTxM2pDOJ3v
         3TAeN9vGeLOYLKJtgHo41YhfSP/UHXMQt4Pp5c65rxFr/GH1cyTbeOnP9+M2NqXUhmqU
         tKIAKjH0t8EUhL68P6zOMeo4yUOv/TJvsj1O/u8YwMnFUyoFz3/AURpUM8FL4Qydunoo
         5uzxLwosWm8g7OkTVzJy/4dQj0tM8p5L9F7RAiqKWMZPdjqEHSCgOlOYxY2+3a9GfO65
         KemElPc9WEI9dYFR6UxY7cvHQTCnNh43CvUrFI+tRjLJvbLnqMtCfdL+h1p2G6r2YRZU
         mnLw==
X-Gm-Message-State: AOJu0Yxq0K6ICmjj4DA4wD+Q7n/bjTCn+Qm/fQMsIAc2p+69Sb4eiOjn
	QAfs0Cyu8RN9QYK+lvSbHGqcnHx7L99Rv8YlczfCUw==
X-Google-Smtp-Source: AGHT+IFF2TpItFKowjCZ8ASJ/0BWEWuvpsfiA6UqGLSiCQ0pnJ8/SuZznn+CD6peVXZleVKejXfbOHGauFLhVvJuCuQ=
X-Received: by 2002:a67:af0b:0:b0:464:7b6d:2efc with SMTP id
 v11-20020a67af0b000000b004647b6d2efcmr4247312vsl.34.1701815385307; Tue, 05
 Dec 2023 14:29:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231201160925.3136868-1-peter.griffin@linaro.org>
 <20231201160925.3136868-18-peter.griffin@linaro.org> <ZWpz5L2g4SB2cdVD@google.com>
In-Reply-To: <ZWpz5L2g4SB2cdVD@google.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 5 Dec 2023 22:29:34 +0000
Message-ID: <CADrjBPpOUf72k=tFWsOQUUuH2Nc8O9=_EaX7QexTCvRT-5QndQ@mail.gmail.com>
Subject: Re: [PATCH v5 17/20] tty: serial: samsung: Add gs101 compatible and
 common fifoszdt_serial_drv_data
To: William McVicker <willmcvicker@google.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org, 
	tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org, 
	wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org, 
	jirislaby@kernel.org, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
	tudor.ambarus@linaro.org, andre.draszik@linaro.org, 
	semen.protsenko@linaro.org, saravanak@google.com, soc@kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	kernel-team@android.com, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Will,

On Sat, 2 Dec 2023 at 00:01, William McVicker <willmcvicker@google.com> wrote:
>
> On 12/01/2023, Peter Griffin wrote:
> > Add serial driver data for Google Tensor gs101 SoC and a common
> > fifoszdt_serial_drv_data that can be used by platforms that specify the
> > samsung,uart-fifosize DT property.
> >
> > A corresponding dt-bindings patch updates the yaml to ensure
> > samsung,uart-fifosize is a required property.
> >
> > Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> > Reviewed-by: Arnd Bergmann <arnd@arndb.de>
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
>
> Tested-by: Will McVicker <willmcvicker@google.com>
>
> ---
>
> I verified boot to a busybox console with kernel logs printed to the serial
> port.

Thanks for testing :) I've added your Tested-by tags to the various
patches apart from the pinctrl ones that have been refactored a bit.

Thanks,

Peter.
>
> Regards,
> Will
>
> > ---
> >  drivers/tty/serial/samsung_tty.c | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> >
> > diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
> > index 1b0c2b467a30..f8d98f1006de 100644
> > --- a/drivers/tty/serial/samsung_tty.c
> > +++ b/drivers/tty/serial/samsung_tty.c
> > @@ -2490,14 +2490,25 @@ static const struct s3c24xx_serial_drv_data exynos850_serial_drv_data = {
> >       .fifosize = { 256, 64, 64, 64 },
> >  };
> >
> > +/*
> > + * Common drv_data struct for platforms that specify uart,fifosize in
> > + * device tree.
> > + */
> > +static const struct s3c24xx_serial_drv_data exynos_fifoszdt_serial_drv_data = {
> > +     EXYNOS_COMMON_SERIAL_DRV_DATA(),
> > +     .fifosize = { 0 },
> > +};
> > +
> >  #define EXYNOS4210_SERIAL_DRV_DATA (&exynos4210_serial_drv_data)
> >  #define EXYNOS5433_SERIAL_DRV_DATA (&exynos5433_serial_drv_data)
> >  #define EXYNOS850_SERIAL_DRV_DATA (&exynos850_serial_drv_data)
> > +#define EXYNOS_FIFOSZDT_DRV_DATA (&exynos_fifoszdt_serial_drv_data)
> >
> >  #else
> >  #define EXYNOS4210_SERIAL_DRV_DATA NULL
> >  #define EXYNOS5433_SERIAL_DRV_DATA NULL
> >  #define EXYNOS850_SERIAL_DRV_DATA NULL
> > +#define EXYNOS_FIFOSZDT_DRV_DATA NULL
> >  #endif
> >
> >  #ifdef CONFIG_ARCH_APPLE
> > @@ -2581,6 +2592,9 @@ static const struct platform_device_id s3c24xx_serial_driver_ids[] = {
> >       }, {
> >               .name           = "artpec8-uart",
> >               .driver_data    = (kernel_ulong_t)ARTPEC8_SERIAL_DRV_DATA,
> > +     }, {
> > +             .name           = "gs101-uart",
> > +             .driver_data    = (kernel_ulong_t)EXYNOS_FIFOSZDT_DRV_DATA,
> >       },
> >       { },
> >  };
> > @@ -2602,6 +2616,8 @@ static const struct of_device_id s3c24xx_uart_dt_match[] = {
> >               .data = EXYNOS850_SERIAL_DRV_DATA },
> >       { .compatible = "axis,artpec8-uart",
> >               .data = ARTPEC8_SERIAL_DRV_DATA },
> > +     { .compatible = "google,gs101-uart",
> > +             .data = EXYNOS_FIFOSZDT_DRV_DATA },
> >       {},
> >  };
> >  MODULE_DEVICE_TABLE(of, s3c24xx_uart_dt_match);
> > --
> > 2.43.0.rc2.451.g8631bc7472-goog
> >

