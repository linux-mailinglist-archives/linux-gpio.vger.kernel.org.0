Return-Path: <linux-gpio+bounces-895-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3065B80194E
	for <lists+linux-gpio@lfdr.de>; Sat,  2 Dec 2023 02:09:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 619C51C20B7A
	for <lists+linux-gpio@lfdr.de>; Sat,  2 Dec 2023 01:09:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C356917C4;
	Sat,  2 Dec 2023 01:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t8HXCdmu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com [IPv6:2607:f8b0:4864:20::c33])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19FEBD6C
	for <linux-gpio@vger.kernel.org>; Fri,  1 Dec 2023 17:09:43 -0800 (PST)
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-58df571e612so1217103eaf.0
        for <linux-gpio@vger.kernel.org>; Fri, 01 Dec 2023 17:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701479382; x=1702084182; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dm/CsU1TecVhGqK7uMtHEjTeBHqkgwFFAUsgNTx3E7k=;
        b=t8HXCdmuyHsRAb7whjgAXgZ8XuOVerdIqAbfa4EqSQxrFOglfeDKZOJr+7Ntl885f2
         fxGT7cPSRX0HBOJ28GZgrLi+SF8PpAq6LahGCe/s1mfhSdD44AGjIzZ1ojFUPmAweIpT
         Jmdklr2qeLYdGfLK/esZAoue+kN8EnKs2Xt/nQMDVu/5NG9EZaw8vRvV1ZqOL+nbJ2Jy
         qbMP13oQlHnrmNwN+xzgRx3gZL+T9RCvTwh8G7O3VO0pdJ1WrjnT+Rn3Jz7eRWx/SzZU
         HF32M/eEVUM905t3HRt/8gcXSRWjg3SMUFEnNXY+pesB4+u4YWUVmEjTFRERuluyRJuk
         eTaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701479382; x=1702084182;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dm/CsU1TecVhGqK7uMtHEjTeBHqkgwFFAUsgNTx3E7k=;
        b=h2E0+TTV2h9ds+zaENkkrnbAtiDcQEf9iHJjmbjf9PtQyTZ0nsOTEzlDgXNG+1Abxz
         bK4mL5QF6YEyaDvyoY7KDf5vbNMN12I30hGVwzYmkpNv6x7QPtHr63tVGZcFcK+Grvnk
         Ii6GYDJOj/TK5/n/Ks4LxPYkG3lIFQ60JPjjPQ3sabBmEKXttB2oB3DYHGbqZbQRKUat
         GAO3hnzL1/NGWSOVatlGhdBtfXFtpS4ijAhGmHabOYqr0yvyDgnTPOvocGYAqlTZO2pC
         xj6x9FThmkv/rdEAONFe9Uq99UXrW7E3v3rAa/bbBA1N6ZzFOVfi5fR6OXtds82Lb0bw
         mIqw==
X-Gm-Message-State: AOJu0Yx/rf/4CVkE0kBBoeDXkgbZUQmWGe1/NdkLm1vXNA69PDDikQ4t
	AwJMx7DIDUnj0/z2CgCGatQq5ZqSHALO4ZNLUjCg+A==
X-Google-Smtp-Source: AGHT+IHneY/ElPnA5P/2bRpVmnKU9oSTsSD93K6ineTQqUbPf7r6AwXLHD8DGCnM9a09BZNv9IxOdZTpyqL9luiNRC4=
X-Received: by 2002:a05:6358:1a93:b0:170:17eb:377d with SMTP id
 gm19-20020a0563581a9300b0017017eb377dmr430823rwb.37.1701479382291; Fri, 01
 Dec 2023 17:09:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231201160925.3136868-1-peter.griffin@linaro.org> <20231201160925.3136868-18-peter.griffin@linaro.org>
In-Reply-To: <20231201160925.3136868-18-peter.griffin@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Fri, 1 Dec 2023 19:09:30 -0600
Message-ID: <CAPLW+4mGykKdYuhjcpYQwk7cabo0mFv6Qo3UedcrVcLvMkww_Q@mail.gmail.com>
Subject: Re: [PATCH v5 17/20] tty: serial: samsung: Add gs101 compatible and
 common fifoszdt_serial_drv_data
To: Peter Griffin <peter.griffin@linaro.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org, 
	tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org, 
	wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org, 
	jirislaby@kernel.org, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
	tudor.ambarus@linaro.org, andre.draszik@linaro.org, saravanak@google.com, 
	willmcvicker@google.com, soc@kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, kernel-team@android.com, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 1, 2023 at 10:11=E2=80=AFAM Peter Griffin <peter.griffin@linaro=
.org> wrote:
>
> Add serial driver data for Google Tensor gs101 SoC and a common
> fifoszdt_serial_drv_data that can be used by platforms that specify the
> samsung,uart-fifosize DT property.
>
> A corresponding dt-bindings patch updates the yaml to ensure
> samsung,uart-fifosize is a required property.
>
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  drivers/tty/serial/samsung_tty.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsun=
g_tty.c
> index 1b0c2b467a30..f8d98f1006de 100644
> --- a/drivers/tty/serial/samsung_tty.c
> +++ b/drivers/tty/serial/samsung_tty.c
> @@ -2490,14 +2490,25 @@ static const struct s3c24xx_serial_drv_data exyno=
s850_serial_drv_data =3D {
>         .fifosize =3D { 256, 64, 64, 64 },
>  };
>
> +/*
> + * Common drv_data struct for platforms that specify uart,fifosize in
> + * device tree.

Isn't it "samsung,uart-fifosize"? Or it was intended this way?

Other than this, LGTM (my R-b tag is already present in this patch).

> + */
> +static const struct s3c24xx_serial_drv_data exynos_fifoszdt_serial_drv_d=
ata =3D {
> +       EXYNOS_COMMON_SERIAL_DRV_DATA(),
> +       .fifosize =3D { 0 },
> +};
> +
>  #define EXYNOS4210_SERIAL_DRV_DATA (&exynos4210_serial_drv_data)
>  #define EXYNOS5433_SERIAL_DRV_DATA (&exynos5433_serial_drv_data)
>  #define EXYNOS850_SERIAL_DRV_DATA (&exynos850_serial_drv_data)
> +#define EXYNOS_FIFOSZDT_DRV_DATA (&exynos_fifoszdt_serial_drv_data)
>
>  #else
>  #define EXYNOS4210_SERIAL_DRV_DATA NULL
>  #define EXYNOS5433_SERIAL_DRV_DATA NULL
>  #define EXYNOS850_SERIAL_DRV_DATA NULL
> +#define EXYNOS_FIFOSZDT_DRV_DATA NULL
>  #endif
>
>  #ifdef CONFIG_ARCH_APPLE
> @@ -2581,6 +2592,9 @@ static const struct platform_device_id s3c24xx_seri=
al_driver_ids[] =3D {
>         }, {
>                 .name           =3D "artpec8-uart",
>                 .driver_data    =3D (kernel_ulong_t)ARTPEC8_SERIAL_DRV_DA=
TA,
> +       }, {
> +               .name           =3D "gs101-uart",
> +               .driver_data    =3D (kernel_ulong_t)EXYNOS_FIFOSZDT_DRV_D=
ATA,
>         },
>         { },
>  };
> @@ -2602,6 +2616,8 @@ static const struct of_device_id s3c24xx_uart_dt_ma=
tch[] =3D {
>                 .data =3D EXYNOS850_SERIAL_DRV_DATA },
>         { .compatible =3D "axis,artpec8-uart",
>                 .data =3D ARTPEC8_SERIAL_DRV_DATA },
> +       { .compatible =3D "google,gs101-uart",
> +               .data =3D EXYNOS_FIFOSZDT_DRV_DATA },
>         {},
>  };
>  MODULE_DEVICE_TABLE(of, s3c24xx_uart_dt_match);
> --
> 2.43.0.rc2.451.g8631bc7472-goog
>

