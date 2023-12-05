Return-Path: <linux-gpio+bounces-1038-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B040F806197
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Dec 2023 23:20:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D45001C210C7
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Dec 2023 22:19:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C43596E2C5;
	Tue,  5 Dec 2023 22:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AGd03nBB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7934D1B5
	for <linux-gpio@vger.kernel.org>; Tue,  5 Dec 2023 14:19:47 -0800 (PST)
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-67ac8e5566cso16271996d6.3
        for <linux-gpio@vger.kernel.org>; Tue, 05 Dec 2023 14:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701814786; x=1702419586; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9dvO7VEjEk5C7f+OgfK999Pm4HA3ckCcoehDtAD/q3U=;
        b=AGd03nBBQ2vI7O351rBGob48hb4QwHzNBim9WZh2tAYp0FSODx7CxDFGvkcrvima98
         EcnK/DcyoVSwq9ugn0OnBV1IhkDgFSwH13F5fMUePFH6DS4qRKozTeLYae3rOtWSlZFv
         FdwOPwKD6CIpXIiatpieJ/OaOeS6RV6Kk3NL4iPuZOGxLk2r1Efqvx3igy1EyzGY9ipd
         t8PCgSKGzgFD1MDTySE+02F3tcjipUSzFbPj99UcSR+9Ds/IfioaFYLpbcDkpz+tLemt
         MEV3g7eKSIx6Wodnw8+4j3BRVIeXs5hsLVLe4LmnuEz+Nd/khDsRIlb70RaBJgjk1acS
         /V3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701814786; x=1702419586;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9dvO7VEjEk5C7f+OgfK999Pm4HA3ckCcoehDtAD/q3U=;
        b=k4Tqcz7JMWFl0QApv/MvL39yAxbfWQzT3tWE++sjizMFg3hECjor7OEgEoExF3WDFz
         NPP15xIH7/6VdK0a7EC6Kf99tQiTzJEtsXuxCgYXCdx1lvpV/m0f0+fihPjhCQsv0Np/
         7IdAuso9y9bKltEEeTmeQBDwZ9kHCm1NZ9BQLm0d/OgAwmeT9oVrTscVybPF6ooarVbN
         /ZjMNz6QdIoBhvuloPkf+qVr+/TGB7mn9CWHTntcf77f77RB7YJKnNJjJmFe2HQQFBlH
         v1cSOw7IiVmIMMGo3B3jOiN2dNU/x9Q0DdVhntaMfKXJ0/JZ4A41WOR8SSwhig+38uUR
         GTxQ==
X-Gm-Message-State: AOJu0YwJUu03RXRGN6S6HV7GbM8lEMYRQDWsqBeBBvv2PA78Pd6HUuxt
	r+hYKTRxvyGBOp+WhV4MniJamzeArR+6JQVkT7Hwtg==
X-Google-Smtp-Source: AGHT+IHRUeT/+czt9e9e+AXU+ecUX33fbDPjvv+n7RELw6Z2TmnXnaaNwPMslAf+mw5hNMDgSVbEZODSDvnNUHcH5I4=
X-Received: by 2002:a0c:ef41:0:b0:67a:c0f0:c0eb with SMTP id
 t1-20020a0cef41000000b0067ac0f0c0ebmr2132644qvs.35.1701814786323; Tue, 05 Dec
 2023 14:19:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231201160925.3136868-1-peter.griffin@linaro.org>
 <20231201160925.3136868-17-peter.griffin@linaro.org> <CAPLW+4mxzu4d_9i=ouDGtnSRMbhibfBnT5aXhkC4cGEC1bm6Bw@mail.gmail.com>
In-Reply-To: <CAPLW+4mxzu4d_9i=ouDGtnSRMbhibfBnT5aXhkC4cGEC1bm6Bw@mail.gmail.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 5 Dec 2023 22:19:35 +0000
Message-ID: <CADrjBPrK9+1O3u3MEh9VGGjdODidzTKM64a6P26fFPZqjvJSGQ@mail.gmail.com>
Subject: Re: [PATCH v5 16/20] watchdog: s3c2410_wdt: Add support for Google
 gs101 SoC
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

On Sat, 2 Dec 2023 at 01:02, Sam Protsenko <semen.protsenko@linaro.org> wro=
te:
>
> On Fri, Dec 1, 2023 at 10:11=E2=80=AFAM Peter Griffin <peter.griffin@lina=
ro.org> wrote:
> >
> > This patch adds the compatibles and drvdata for the Google
> > gs101 SoC found in Pixel 6, Pixel 6a & Pixel 6 pro phones.
> >
> > Similar to Exynos850 it has two watchdog instances, one for
> > each cluster and has some control bits in PMU registers.
> >
> > gs101 also has the dbgack_mask bit in wtcon register, so
> > we also enable QUIRK_HAS_DBGACK_BIT.
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  drivers/watchdog/s3c2410_wdt.c | 47 ++++++++++++++++++++++++++++++----
> >  1 file changed, 42 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_=
wdt.c
> > index 39f3489e41d6..c1ae71574457 100644
> > --- a/drivers/watchdog/s3c2410_wdt.c
> > +++ b/drivers/watchdog/s3c2410_wdt.c
> > @@ -68,6 +68,13 @@
> >  #define EXYNOSAUTOV9_CLUSTER0_WDTRESET_BIT     25
> >  #define EXYNOSAUTOV9_CLUSTER1_WDTRESET_BIT     24
> >
> > +#define GS_CLUSTER0_NONCPU_OUT                 0x1220
> > +#define GS_CLUSTER1_NONCPU_OUT                 0x1420
> > +#define GS_CLUSTER0_NONCPU_INT_EN              0x1244
> > +#define GS_CLUSTER1_NONCPU_INT_EN              0x1444
> > +#define GS_CLUSTER2_NONCPU_INT_EN              0x1644
> > +#define GS_RST_STAT_REG_OFFSET                 0x3B44
> > +
> >  /**
> >   * DOC: Quirk flags for different Samsung watchdog IP-cores
> >   *
> > @@ -269,6 +276,30 @@ static const struct s3c2410_wdt_variant drv_data_e=
xynosautov9_cl1 =3D {
> >                   QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN,
> >  };
> >
> > +static const struct s3c2410_wdt_variant drv_data_gs101_cl0 =3D {
> > +       .mask_reset_reg =3D GS_CLUSTER0_NONCPU_INT_EN,
> > +       .mask_bit =3D 2,
> > +       .mask_reset_inv =3D true,
> > +       .rst_stat_reg =3D GS_RST_STAT_REG_OFFSET,
> > +       .rst_stat_bit =3D 0,
> > +       .cnt_en_reg =3D GS_CLUSTER0_NONCPU_OUT,
> > +       .cnt_en_bit =3D 8,
> > +       .quirks =3D QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_MASK_RESET |=
 QUIRK_HAS_PMU_CNT_EN |
>
> Please keep it at 80 characters limit.

will fix
>
> > +                 QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_DBGACK_BIT,
> > +};
> > +
> > +static const struct s3c2410_wdt_variant drv_data_gs101_cl1 =3D {
> > +       .mask_reset_reg =3D GS_CLUSTER1_NONCPU_INT_EN,
> > +       .mask_bit =3D 2,
> > +       .mask_reset_inv =3D true,
> > +       .rst_stat_reg =3D GS_RST_STAT_REG_OFFSET,
> > +       .rst_stat_bit =3D 1,
> > +       .cnt_en_reg =3D GS_CLUSTER1_NONCPU_OUT,
> > +       .cnt_en_bit =3D 7,
> > +       .quirks =3D QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_MASK_RESET |=
 QUIRK_HAS_PMU_CNT_EN |
>
> Please keep it at 80 characters limit.

will fix
>
> > +                 QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_DBGACK_BIT,
> > +};
> > +
> >  static const struct of_device_id s3c2410_wdt_match[] =3D {
> >         { .compatible =3D "samsung,s3c2410-wdt",
> >           .data =3D &drv_data_s3c2410 },
> > @@ -284,6 +315,8 @@ static const struct of_device_id s3c2410_wdt_match[=
] =3D {
> >           .data =3D &drv_data_exynos850_cl0 },
> >         { .compatible =3D "samsung,exynosautov9-wdt",
> >           .data =3D &drv_data_exynosautov9_cl0 },
> > +       { .compatible =3D "google,gs101-wdt",
> > +         .data =3D &drv_data_gs101_cl0 },
> >         {},
> >  };
> >  MODULE_DEVICE_TABLE(of, s3c2410_wdt_match);
> > @@ -604,9 +637,10 @@ s3c2410_get_wdt_drv_data(struct platform_device *p=
dev, struct s3c2410_wdt *wdt)
> >         }
> >
> >  #ifdef CONFIG_OF
> > -       /* Choose Exynos850/ExynosAutov9 driver data w.r.t. cluster ind=
ex */
> > +       /* Choose Exynos850/ExynosAutov9/gs101 driver data w.r.t. clust=
er index */
>
> Please keep it at 80 characters limit. Also, maybe just make it more
> generic and mention "Exynos9 platforms" instead of listing all SoCs?
>

Will fix and reword.

> Other than that:
>
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

Thanks!

Peter
>
>
> >         if (variant =3D=3D &drv_data_exynos850_cl0 ||
> > -           variant =3D=3D &drv_data_exynosautov9_cl0) {
> > +           variant =3D=3D &drv_data_exynosautov9_cl0 ||
> > +           variant =3D=3D &drv_data_gs101_cl0) {
> >                 u32 index;
> >                 int err;
> >
> > @@ -619,9 +653,12 @@ s3c2410_get_wdt_drv_data(struct platform_device *p=
dev, struct s3c2410_wdt *wdt)
> >                 case 0:
> >                         break;
> >                 case 1:
> > -                       variant =3D (variant =3D=3D &drv_data_exynos850=
_cl0) ?
> > -                               &drv_data_exynos850_cl1 :
> > -                               &drv_data_exynosautov9_cl1;
> > +                       if (variant =3D=3D &drv_data_exynos850_cl0)
> > +                               variant =3D &drv_data_exynos850_cl1;
> > +                       else if (variant =3D=3D &drv_data_exynosautov9_=
cl0)
> > +                               variant =3D &drv_data_exynosautov9_cl1;
> > +                       else if (variant =3D=3D &drv_data_gs101_cl0)
> > +                               variant =3D &drv_data_gs101_cl1;
> >                         break;
> >                 default:
> >                         return dev_err_probe(dev, -EINVAL, "wrong clust=
er index: %u\n", index);
> > --
> > 2.43.0.rc2.451.g8631bc7472-goog
> >

