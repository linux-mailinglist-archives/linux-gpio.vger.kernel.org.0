Return-Path: <linux-gpio+bounces-331-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C29F7F3552
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Nov 2023 18:52:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B643F282A1D
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Nov 2023 17:52:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17C2F20DFC;
	Tue, 21 Nov 2023 17:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q+9e2Isq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7FBE197
	for <linux-gpio@vger.kernel.org>; Tue, 21 Nov 2023 09:52:47 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2851c0569acso2352923a91.1
        for <linux-gpio@vger.kernel.org>; Tue, 21 Nov 2023 09:52:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700589167; x=1701193967; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8wpqGVbIK3WplCROjVemwcSWLjI6+dgvA3XaSrJo6hc=;
        b=q+9e2Isqnn7/iG9+bmRD1I1gZK5To2KQfV63Legm//cSS3PBgUm4/apoJWkn/FUUvG
         43R7RBI/NS1eEPNCu7LsZR44jvBy1KliSTCuqIJc/TAgtaYIC8/MUr9sxITcTOMUkD4F
         g6vX3jLo72yPoSJlPPkLqG9rRbmO3PJU+38h44xbmfi5Az1/KAb/eU26d+cfNupZWt/f
         c+ajD4IC2NoHdFp65jl+sG/MaDggQ7F6YCczx7MVWPxauNQAnt1+kunkYgqbtB8URqIq
         v+L/y5XU8jJt1EEbq6CV5LkbSB2VoQSgd/d5Aa8jyqJSdnwWMVD1mZ1tpfkIkvx1kmZ7
         UnDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700589167; x=1701193967;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8wpqGVbIK3WplCROjVemwcSWLjI6+dgvA3XaSrJo6hc=;
        b=OQwDvxvnMEzlAVyu4tfjwybVkiRVmaye/MTMGWIvNez4yu+2inrufWmxddHuwqS5zE
         qP3XTCmW2yoV4o+mwLhd6iCBeILb9wHIm2Vs4JfnVesu/UwiA2yF/GmrWfLERCCTDVAj
         XTWLScOmjm6vZ7vHT698DVLhJQ/XNtQowrljAa86i4FiXBnIXhyvqvxOaBoWWeJn5XMB
         y/CjiirrQT/YQz9tk00L6e4pe+lr819ljzWeq048XXnW9IfPlgQD0YgIZvpOEvReWIJb
         9t0j7gVPfLGmdnP9S5kNjeIQIPnmxeEzgJBNfXwSlpumNs17VC+5TwL9ShdgQdUEABbw
         9kyQ==
X-Gm-Message-State: AOJu0YzozDTyokUd6IjnoaVMUSQ2DKVih/zK4AKw3pIXXcMK87a9ywbZ
	nI4u0bjBlr5lutbJO+DZPair3yTl9Fwl14cUUS65bw==
X-Google-Smtp-Source: AGHT+IEdZp5NTxf9oR3LSlmESZBZSQbkEXjEj7cCwEl5eMeZY9Ha2tcsIk9FWPcD9OV0TPHekxd5b3NDVOKW++TOaBw=
X-Received: by 2002:a17:90b:1c83:b0:27d:b3d:5c33 with SMTP id
 oo3-20020a17090b1c8300b0027d0b3d5c33mr13567253pjb.28.1700589167121; Tue, 21
 Nov 2023 09:52:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231120212037.911774-1-peter.griffin@linaro.org> <20231120212037.911774-16-peter.griffin@linaro.org>
In-Reply-To: <20231120212037.911774-16-peter.griffin@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Tue, 21 Nov 2023 11:52:36 -0600
Message-ID: <CAPLW+4m+vG62V++izkycRYEhcTpoT+G=g+3Y4j8vqEpeX2uEPw@mail.gmail.com>
Subject: Re: [PATCH v4 15/19] watchdog: s3c2410_wdt: Add support for WTCON
 register DBGACK_MASK bit
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

On Mon, Nov 20, 2023 at 3:21=E2=80=AFPM Peter Griffin <peter.griffin@linaro=
.org> wrote:
>
> The WDT uses the CPU core signal DBGACK to determine whether the SoC
> is running in debug mode or not. If the DBGACK signal is asserted and
> DBGACK_MASK is enabled, then WDT output and interrupt is masked.
>
> Presence of the DBGACK_MASK bit is determined by adding a new
> QUIRK_HAS_DBGACK_BIT quirk. Currently only gs101 SoC is known to have
> the DBGACK_MASK bit so add the quirk to drv_data_gs101_cl1 and
> drv_data_gs101_cl1 quirks.
>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  drivers/watchdog/s3c2410_wdt.c | 32 +++++++++++++++++++++++++++-----
>  1 file changed, 27 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wd=
t.c
> index 08b8c57dd812..ed561deeeed9 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> @@ -34,9 +34,10 @@
>
>  #define S3C2410_WTCNT_MAXCNT   0xffff
>
> -#define S3C2410_WTCON_RSTEN    (1 << 0)
> -#define S3C2410_WTCON_INTEN    (1 << 2)
> -#define S3C2410_WTCON_ENABLE   (1 << 5)
> +#define S3C2410_WTCON_RSTEN            (1 << 0)
> +#define S3C2410_WTCON_INTEN            (1 << 2)
> +#define S3C2410_WTCON_ENABLE           (1 << 5)
> +#define S3C2410_WTCON_DBGACK_MASK      (1 << 16)
>
>  #define S3C2410_WTCON_DIV16    (0 << 3)
>  #define S3C2410_WTCON_DIV32    (1 << 3)
> @@ -107,12 +108,16 @@
>   * %QUIRK_HAS_PMU_CNT_EN: PMU block has some register (e.g. CLUSTERx_NON=
CPU_OUT)
>   * with "watchdog counter enable" bit. That bit should be set to make wa=
tchdog
>   * counter running.
> + *
> + * %QUIRK_HAS_DBGACK_BIT: WTCON register has DBGACK_MASK bit. Enables ma=
sking
> + * WDT interrupt and reset request according to CPU core DBGACK signal.
>   */
>  #define QUIRK_HAS_WTCLRINT_REG                 (1 << 0)
>  #define QUIRK_HAS_PMU_MASK_RESET               (1 << 1)
>  #define QUIRK_HAS_PMU_RST_STAT                 (1 << 2)
>  #define QUIRK_HAS_PMU_AUTO_DISABLE             (1 << 3)
>  #define QUIRK_HAS_PMU_CNT_EN                   (1 << 4)
> +#define QUIRK_HAS_DBGACK_BIT                   (1 << 5)
>
>  /* These quirks require that we have a PMU register map */
>  #define QUIRKS_HAVE_PMUREG \
> @@ -279,7 +284,7 @@ static const struct s3c2410_wdt_variant drv_data_gs10=
1_cl0 =3D {
>         .cnt_en_reg =3D GS_CLUSTER0_NONCPU_OUT,
>         .cnt_en_bit =3D 8,
>         .quirks =3D QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_MASK_RESET | Q=
UIRK_HAS_PMU_CNT_EN |
> -                 QUIRK_HAS_WTCLRINT_REG,
> +                 QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_DBGACK_BIT,
>  };
>
>  static const struct s3c2410_wdt_variant drv_data_gs101_cl1 =3D {
> @@ -291,7 +296,7 @@ static const struct s3c2410_wdt_variant drv_data_gs10=
1_cl1 =3D {
>         .cnt_en_reg =3D GS_CLUSTER1_NONCPU_OUT,
>         .cnt_en_bit =3D 7,
>         .quirks =3D QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_MASK_RESET | Q=
UIRK_HAS_PMU_CNT_EN |
> -                 QUIRK_HAS_WTCLRINT_REG,
> +                 QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_DBGACK_BIT,
>  };
>

This patch states it's adding the feature, but in fact it's also
enabling this feature for gs101. Suggest moving this patch before the
one enabling gs101 wdt. This way, one patch will only add the feature,
and another patch will enable gs101 entirely (with this feature used).
At least it seems like more atomic approach to me.

>  static const struct of_device_id s3c2410_wdt_match[] =3D {
> @@ -408,6 +413,21 @@ static int s3c2410wdt_enable(struct s3c2410_wdt *wdt=
, bool en)
>         return 0;
>  }
>
> +static void s3c2410wdt_mask_dbgack(struct s3c2410_wdt *wdt, bool mask)
> +{
> +       unsigned long wtcon;
> +
> +       if (!(wdt->drv_data->quirks & QUIRK_HAS_DBGACK_BIT))
> +               return;
> +
> +       wtcon =3D readl(wdt->reg_base + S3C2410_WTCON);
> +       if (mask)
> +               wtcon |=3D S3C2410_WTCON_DBGACK_MASK;
> +       else
> +               wtcon &=3D ~S3C2410_WTCON_DBGACK_MASK;
> +       writel(wtcon, wdt->reg_base + S3C2410_WTCON);
> +}
> +
>  static int s3c2410wdt_keepalive(struct watchdog_device *wdd)
>  {
>         struct s3c2410_wdt *wdt =3D watchdog_get_drvdata(wdd);
> @@ -737,6 +757,8 @@ static int s3c2410wdt_probe(struct platform_device *p=
dev)
>         wdt->wdt_device.bootstatus =3D s3c2410wdt_get_bootstatus(wdt);
>         wdt->wdt_device.parent =3D dev;
>
> +       s3c2410wdt_mask_dbgack(wdt, true);
> +
>         /*
>          * If "tmr_atboot" param is non-zero, start the watchdog right no=
w. Also
>          * set WDOG_HW_RUNNING bit, so that watchdog core can kick the wa=
tchdog.
> --
> 2.43.0.rc1.413.gea7ed67945-goog
>

