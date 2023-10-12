Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3E6D7C64A5
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Oct 2023 07:38:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233915AbjJLFiU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Oct 2023 01:38:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232808AbjJLFiT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Oct 2023 01:38:19 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CF7DB7
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 22:38:18 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-564af0ac494so453177a12.0
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 22:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697089098; x=1697693898; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wwWnNHAbWyeAscY15FX+TU6dhJaouDy+zgSEChH3FwY=;
        b=hrhdeNL+xrFwt5JwZw2WTndkt3uiH1J30wKia9q7VffNmYl4iEhp32agj2z88CKH2q
         B1PZ0h0mz/aygSprMv+aUJ0etTN6MZzdmpThC7MSs/IKZIRX4d23Buf9OkWtORpbqLq2
         NrpkE8FLNrmAnDzTH47YWGRffztAQ1/vDPm+B+Ii5jNcKPSHIqu5SpGCqFKfXrjGXm+A
         CGxGxgReWs13EJ1d3vG8ALrwgdsKiqrcgnTf+H6qhS16qVdGuvS5jjwCOrrSIgxH+GAf
         pGPeXjxU2riHHxXosc5fneN9e/KBDDWBx5xWxbqlGawA8Ga2N+c1P+rgIANSduNugJQm
         mDLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697089098; x=1697693898;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wwWnNHAbWyeAscY15FX+TU6dhJaouDy+zgSEChH3FwY=;
        b=mglEN/YnLzJnGIqR7wrMi9u//TIqFqNorWdjWtvdC9AiOYKVE0Ef3p3tzKtKqo7OT6
         LBcBeEttobEs+JC9+GvN8H5kGAI4h64OOffeXS5o/pBT89scj02d2Tl/3xz/VT3oi7pM
         biZnf6ym/jVj/OyDqE2Q8zww0/qdXJMjubw+zmvl0/UDgEVyf9SYdYztdSHJM9oJVMUU
         5llOkFR3Tq8hN94EfgostwC01fB2vHih8WjCZy8nAwWyzNeX+yyu9TZYgd1QMVQVNrlY
         oMbgbzmiL3sQpLe0XkeGYO0tj61dCiaL/WZCn8kotXeaY5kGUAa+kCn9aIyvzZlXUHvv
         IKYQ==
X-Gm-Message-State: AOJu0Yy5zIFZk+L503cFCWtTDAAhm36eyXXfNHNA6YRA0toKzcil2Sn5
        mTbB9bP41Z7r/65M1Arce7S/AtUAMfRQ3PDio9PwAg==
X-Google-Smtp-Source: AGHT+IGSsE9UdV0Qgkc/+49sBerKsPKwjip2GPaMvf0yjDHtLvarJUP6ASq6DTMnyLnKKYmGaxwKGOUUUcsGQWvpu/Q=
X-Received: by 2002:a17:90b:1c83:b0:274:616e:3fc4 with SMTP id
 oo3-20020a17090b1c8300b00274616e3fc4mr19950072pjb.34.1697089097916; Wed, 11
 Oct 2023 22:38:17 -0700 (PDT)
MIME-Version: 1.0
References: <20231011184823.443959-1-peter.griffin@linaro.org> <20231011184823.443959-17-peter.griffin@linaro.org>
In-Reply-To: <20231011184823.443959-17-peter.griffin@linaro.org>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Thu, 12 Oct 2023 00:38:06 -0500
Message-ID: <CAPLW+4m1KLXJ67uDJ83V+zdSA0qU4cDh9Q+irpcixz1btMVv7Q@mail.gmail.com>
Subject: Re: [PATCH v3 16/20] tty: serial: samsung: Add gs101 compatible and
 SoC data
To:     Peter Griffin <peter.griffin@linaro.org>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org,
        cw00.choi@samsung.com, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, saravanak@google.com,
        willmcvicker@google.com, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 11, 2023 at 1:49=E2=80=AFPM Peter Griffin <peter.griffin@linaro=
.org> wrote:
>
> Add serial driver data for Google Tensor gs101 SoC.
>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  drivers/tty/serial/samsung_tty.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsun=
g_tty.c
> index 07fb8a9dac63..26bc52e681a4 100644
> --- a/drivers/tty/serial/samsung_tty.c
> +++ b/drivers/tty/serial/samsung_tty.c
> @@ -2597,14 +2597,22 @@ static const struct s3c24xx_serial_drv_data exyno=
s850_serial_drv_data =3D {
>         .fifosize =3D { 256, 64, 64, 64 },
>  };
>
> +static const struct s3c24xx_serial_drv_data gs101_serial_drv_data =3D {
> +       EXYNOS_COMMON_SERIAL_DRV_DATA(),
> +       /* rely on samsung,uart-fifosize DT property for fifosize */
> +       .fifosize =3D { 0 },
> +};
> +
>  #define EXYNOS4210_SERIAL_DRV_DATA (&exynos4210_serial_drv_data)
>  #define EXYNOS5433_SERIAL_DRV_DATA (&exynos5433_serial_drv_data)
>  #define EXYNOS850_SERIAL_DRV_DATA (&exynos850_serial_drv_data)
> +#define GS101_SERIAL_DRV_DATA (&gs101_serial_drv_data)
>
>  #else
>  #define EXYNOS4210_SERIAL_DRV_DATA NULL
>  #define EXYNOS5433_SERIAL_DRV_DATA NULL
>  #define EXYNOS850_SERIAL_DRV_DATA NULL
> +#define GS101_SERIAL_DRV_DATA NULL
>  #endif
>
>  #ifdef CONFIG_ARCH_APPLE
> @@ -2688,6 +2696,9 @@ static const struct platform_device_id s3c24xx_seri=
al_driver_ids[] =3D {
>         }, {
>                 .name           =3D "artpec8-uart",
>                 .driver_data    =3D (kernel_ulong_t)ARTPEC8_SERIAL_DRV_DA=
TA,
> +       }, {
> +               .name           =3D "gs101-uart",
> +               .driver_data    =3D (kernel_ulong_t)GS101_SERIAL_DRV_DATA=
,
>         },
>         { },
>  };
> @@ -2709,6 +2720,8 @@ static const struct of_device_id s3c24xx_uart_dt_ma=
tch[] =3D {
>                 .data =3D EXYNOS850_SERIAL_DRV_DATA },
>         { .compatible =3D "axis,artpec8-uart",
>                 .data =3D ARTPEC8_SERIAL_DRV_DATA },
> +       { .compatible =3D "google,gs101-uart",
> +               .data =3D  GS101_SERIAL_DRV_DATA },
>         {},
>  };
>  MODULE_DEVICE_TABLE(of, s3c24xx_uart_dt_match);
> --
> 2.42.0.655.g421f12c284-goog
>
