Return-Path: <linux-gpio+bounces-1039-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7F68061A7
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Dec 2023 23:27:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 219C22820A9
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Dec 2023 22:27:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A319B6EB48;
	Tue,  5 Dec 2023 22:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ICr5qkhG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67CD41B8
	for <linux-gpio@vger.kernel.org>; Tue,  5 Dec 2023 14:27:33 -0800 (PST)
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-67a8a745c43so2292376d6.0
        for <linux-gpio@vger.kernel.org>; Tue, 05 Dec 2023 14:27:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701815252; x=1702420052; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pQgUgsfQIHztV7qf++7j8HkPIKB30bIka5Ij6JClhqg=;
        b=ICr5qkhG6OZNgtqLatbRTUuxRnBBFxdIc31FYT9GUwuJABB4khG6fp83f9F8lWBvsm
         ryaWFp5TPh9hiEe4ROB7vu2dRBw5LU5TslW+szQYHuuLEh2IpRJyH672UQTm3VF5juZq
         07Kws4IW7nIIMSsTyhk22HM1S4PVPo28gIrshhvXDXWKBV9WTq0AMVUi+d1iRUxCYXyW
         POZVk2w99gFgVkUA8n/HVnN52crWGsLHB1xkZawa90wlMZdK+h9fNRgD0uzdUqO4an7p
         dHpXzikS3AbK85a13BSg3jEC9yvtdK+nFmy0h5FlSyeqKth1Rw4P3p0R2srNq3bQUYbb
         gbTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701815252; x=1702420052;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pQgUgsfQIHztV7qf++7j8HkPIKB30bIka5Ij6JClhqg=;
        b=kMjGMAx5qpLSQyeA11WJyvZbtkTvGRzT0HRy7fawMeK5Th4QCmXtEeMXG8MG52XOnq
         aglMryUaLOD7Wifk7t0qb/JkXa9i9yJvqkZmqhlzyXRdg+3ivNXaJ+cnmiTEd4bOucCz
         9IlTjdC8z6wYr2eVqoZrZWgZztH1QV8cw+r5hobtN0DRc6C/ctXypWNOLrEt94nRIJD9
         XtGAoHcCokO8yCgiPpfaZU8UpsqHvf0YNuN/gZQeVFOJdQpsrJlHQuRZjSZky1/abB9l
         zfI0pJvel89GlTcgnhcVS6NqrBcwmL2cIS70zHoAXlnq3kSo+ZwYiN+mdcvyhj5/GhU+
         d5lA==
X-Gm-Message-State: AOJu0YyRPL391JY+65NfPv3/kIdJwZ1aRkoVVA2m5wVCncwY4oXiv4uO
	OOMY5FlzUFlUYbmyOvx+cV7Ud44RN7rorYVltXvzzQ==
X-Google-Smtp-Source: AGHT+IFuDEXqi1Ls7n87zoNMDXFD61P4gM6AnIVd1rR2PME4KbK/L6lRfRb0eqCvwCLr4kwYzSStOq+H59d+aaGst+k=
X-Received: by 2002:a05:6214:21aa:b0:67a:b5e4:db52 with SMTP id
 t10-20020a05621421aa00b0067ab5e4db52mr3083352qvc.61.1701815252500; Tue, 05
 Dec 2023 14:27:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231201160925.3136868-1-peter.griffin@linaro.org>
 <20231201160925.3136868-18-peter.griffin@linaro.org> <CAPLW+4mGykKdYuhjcpYQwk7cabo0mFv6Qo3UedcrVcLvMkww_Q@mail.gmail.com>
In-Reply-To: <CAPLW+4mGykKdYuhjcpYQwk7cabo0mFv6Qo3UedcrVcLvMkww_Q@mail.gmail.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 5 Dec 2023 22:27:21 +0000
Message-ID: <CADrjBPrPqe8wnvmwB3+WKA_q=fkfNVAyhxHLe6Ok_LifGxARjg@mail.gmail.com>
Subject: Re: [PATCH v5 17/20] tty: serial: samsung: Add gs101 compatible and
 common fifoszdt_serial_drv_data
To: Sam Protsenko <semen.protsenko@linaro.org>
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

Hi Sam,

On Sat, 2 Dec 2023 at 01:09, Sam Protsenko <semen.protsenko@linaro.org> wro=
te:
>
> On Fri, Dec 1, 2023 at 10:11=E2=80=AFAM Peter Griffin <peter.griffin@lina=
ro.org> wrote:
> >
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
> > ---
> >  drivers/tty/serial/samsung_tty.c | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> >
> > diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/sams=
ung_tty.c
> > index 1b0c2b467a30..f8d98f1006de 100644
> > --- a/drivers/tty/serial/samsung_tty.c
> > +++ b/drivers/tty/serial/samsung_tty.c
> > @@ -2490,14 +2490,25 @@ static const struct s3c24xx_serial_drv_data exy=
nos850_serial_drv_data =3D {
> >         .fifosize =3D { 256, 64, 64, 64 },
> >  };
> >
> > +/*
> > + * Common drv_data struct for platforms that specify uart,fifosize in
> > + * device tree.
>
> Isn't it "samsung,uart-fifosize"? Or it was intended this way?

The comment should read "samsung,uart-fifosize". Will update.

Thanks,

Peter.
>
> Other than this, LGTM (my R-b tag is already present in this patch).
>
> > + */
> > +static const struct s3c24xx_serial_drv_data exynos_fifoszdt_serial_drv=
_data =3D {
> > +       EXYNOS_COMMON_SERIAL_DRV_DATA(),
> > +       .fifosize =3D { 0 },
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
> > @@ -2581,6 +2592,9 @@ static const struct platform_device_id s3c24xx_se=
rial_driver_ids[] =3D {
> >         }, {
> >                 .name           =3D "artpec8-uart",
> >                 .driver_data    =3D (kernel_ulong_t)ARTPEC8_SERIAL_DRV_=
DATA,
> > +       }, {
> > +               .name           =3D "gs101-uart",
> > +               .driver_data    =3D (kernel_ulong_t)EXYNOS_FIFOSZDT_DRV=
_DATA,
> >         },
> >         { },
> >  };
> > @@ -2602,6 +2616,8 @@ static const struct of_device_id s3c24xx_uart_dt_=
match[] =3D {
> >                 .data =3D EXYNOS850_SERIAL_DRV_DATA },
> >         { .compatible =3D "axis,artpec8-uart",
> >                 .data =3D ARTPEC8_SERIAL_DRV_DATA },
> > +       { .compatible =3D "google,gs101-uart",
> > +               .data =3D EXYNOS_FIFOSZDT_DRV_DATA },
> >         {},
> >  };
> >  MODULE_DEVICE_TABLE(of, s3c24xx_uart_dt_match);
> > --
> > 2.43.0.rc2.451.g8631bc7472-goog
> >

