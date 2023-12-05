Return-Path: <linux-gpio+bounces-1037-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDB1806149
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Dec 2023 23:04:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3ACD0B211FF
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Dec 2023 22:04:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B7B66A323;
	Tue,  5 Dec 2023 22:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xPh7CNK+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E9D51BC
	for <linux-gpio@vger.kernel.org>; Tue,  5 Dec 2023 14:04:04 -0800 (PST)
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-67ac8e5566cso16201596d6.3
        for <linux-gpio@vger.kernel.org>; Tue, 05 Dec 2023 14:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701813843; x=1702418643; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HLkdwIzSkRdyJvWkuBYBl8NXAPFxbIdD1dlzt6dCueE=;
        b=xPh7CNK+ZzcmfuafW9Mo8a4nRBb40XecDcWDXBzqHuc4yDmG5Bdf+HRrHwDX2tlUZR
         PoNRmaV5CZXIkJFbL9piVJ+dCb/T9Y77zciEjGu7aPl/MS88apXEVTwMS9Hhz/Oxp4DW
         t2T03EYj3CgZhj9knwKfyqfePkoG8IuSbcdGyf3gZYyTORIB3fh4UfjKZalM0wjCE3sP
         N81fhHQCaHDvwroxmt3v3/VqtbovvuUPIqIohZRPheTyQlSMftuk2c0AUeatnYxDEyf2
         d35LeuipINFZwlYK7THChOWPdpNPSd8ewR2bGtw8cV0WBfmAc2XqtUfrDXm0ex/QsTMV
         hPCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701813843; x=1702418643;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HLkdwIzSkRdyJvWkuBYBl8NXAPFxbIdD1dlzt6dCueE=;
        b=RFBTT2Hgqyzx0ymoEGBnphRmwfxmqLWc6RSETjqOk3t5OmqvcXQ7Uq5EAQIUEqiICl
         lgVm/nx6O79TS4z1AoGzV8VqjwaGwlnUHvaRhKULkFOmTlQUIqpWtXo6qoaJW8Wc0O3L
         7pp/QkTHNqfwcEINtpzY4x46PtJaYCqU0tS6IG7ioEPVtOVGLSlqq2WCv2f28kafeBw3
         iHBcrCVfWyAuohOB498TVq7EUAaQg3T2aZfzNupfLPln8/xWcy2/uyf7v5g4yWixIS56
         hf7sWcBx1un4r0Kvtz2JoRF4oTnygOHrcEMUso1X/9ZMvZbl81huBZ5F5jeounuZbKTx
         yaFA==
X-Gm-Message-State: AOJu0YwfZBrc7aXBtPKQg9vJMKCI12oTuvk0FnwPi7nfbkno/gV+OqO4
	+455j8jpa9cjJQ+vj2B8xlQ7UViRyn6Vq4MfchqJXw==
X-Google-Smtp-Source: AGHT+IErwhru2UO/1eHXtSZq4qe6vdEPU3tHwbbh+WsPhY++retoRNq1NqNHFm94bagQ4+LqS0vzUYQ8jyi5KmPRCa4=
X-Received: by 2002:a0c:eb46:0:b0:67a:bae1:a48f with SMTP id
 c6-20020a0ceb46000000b0067abae1a48fmr1886783qvq.103.1701813843342; Tue, 05
 Dec 2023 14:04:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231201160925.3136868-1-peter.griffin@linaro.org>
 <20231201160925.3136868-16-peter.griffin@linaro.org> <CAPLW+4=2aK-XJ69cTBzwhQF8s3E9in-NFkK3h43L7C+oieqyDg@mail.gmail.com>
In-Reply-To: <CAPLW+4=2aK-XJ69cTBzwhQF8s3E9in-NFkK3h43L7C+oieqyDg@mail.gmail.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 5 Dec 2023 22:03:51 +0000
Message-ID: <CADrjBPreo1uXOksJ15AaiowGS8wf63DV6Q_phDvZzxoinVYjqQ@mail.gmail.com>
Subject: Re: [PATCH v5 15/20] watchdog: s3c2410_wdt: Add support for WTCON
 register DBGACK_MASK bit
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

On Sat, 2 Dec 2023 at 00:53, Sam Protsenko <semen.protsenko@linaro.org> wro=
te:
>
> On Fri, Dec 1, 2023 at 10:11=E2=80=AFAM Peter Griffin <peter.griffin@lina=
ro.org> wrote:
> >
> > The WDT uses the CPU core signal DBGACK to determine whether the SoC
> > is running in debug mode or not. If the DBGACK signal is asserted and
> > DBGACK_MASK bit is enabled, then WDT output and interrupt is masked
> > (disabled).
> >
> > Presence of the DBGACK_MASK bit is determined by adding a new
> > QUIRK_HAS_DBGACK_BIT quirk.
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  drivers/watchdog/s3c2410_wdt.c | 27 ++++++++++++++++++++++++---
> >  1 file changed, 24 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_=
wdt.c
> > index 0b4bd883ff28..39f3489e41d6 100644
> > --- a/drivers/watchdog/s3c2410_wdt.c
> > +++ b/drivers/watchdog/s3c2410_wdt.c
> > @@ -34,9 +34,10 @@
> >
> >  #define S3C2410_WTCNT_MAXCNT   0xffff
> >
> > -#define S3C2410_WTCON_RSTEN    (1 << 0)
> > -#define S3C2410_WTCON_INTEN    (1 << 2)
> > -#define S3C2410_WTCON_ENABLE   (1 << 5)
> > +#define S3C2410_WTCON_RSTEN            (1 << 0)
> > +#define S3C2410_WTCON_INTEN            (1 << 2)
> > +#define S3C2410_WTCON_ENABLE           (1 << 5)
> > +#define S3C2410_WTCON_DBGACK_MASK      (1 << 16)
>
> Suggest using BIT() macro. Btw, checkpatch with --strict option
> suggests it too :)

Yes indeed. I was somewhat reluctant to include changes that had
nothing to do with the DBGACK feature but I will update to use the BIT
macro in v6.
>
> >
> >  #define S3C2410_WTCON_DIV16    (0 << 3)
> >  #define S3C2410_WTCON_DIV32    (1 << 3)
> > @@ -100,12 +101,17 @@
> >   * %QUIRK_HAS_PMU_CNT_EN: PMU block has some register (e.g. CLUSTERx_N=
ONCPU_OUT)
> >   * with "watchdog counter enable" bit. That bit should be set to make =
watchdog
> >   * counter running.
> > + *
> > + * %QUIRK_HAS_DBGACK_BIT: WTCON register has DBGACK_MASK bit. Setting =
the
> > + * DBGACK_MASK bit disables the watchdog outputs when the SoC is in de=
bug mode.
> > + * Debug mode is determined by the DBGACK CPU signal.
> >   */
> >  #define QUIRK_HAS_WTCLRINT_REG                 (1 << 0)
> >  #define QUIRK_HAS_PMU_MASK_RESET               (1 << 1)
> >  #define QUIRK_HAS_PMU_RST_STAT                 (1 << 2)
> >  #define QUIRK_HAS_PMU_AUTO_DISABLE             (1 << 3)
> >  #define QUIRK_HAS_PMU_CNT_EN                   (1 << 4)
> > +#define QUIRK_HAS_DBGACK_BIT                   (1 << 5)
> >
> >  /* These quirks require that we have a PMU register map */
> >  #define QUIRKS_HAVE_PMUREG \
> > @@ -375,6 +381,19 @@ static int s3c2410wdt_enable(struct s3c2410_wdt *w=
dt, bool en)
> >         return 0;
> >  }
> >
> > +static void s3c2410wdt_mask_dbgack(struct s3c2410_wdt *wdt)
> > +{
> > +       unsigned long wtcon;
> > +
> > +       if (!(wdt->drv_data->quirks & QUIRK_HAS_DBGACK_BIT))
> > +               return;
> > +
> > +       /*  disable watchdog outputs if CPU is in debug mode */
>
> Double whitespace in the comment. Also, I'd move this comment up to
> the function declaration.

Will fix

>
> Other than that:
>
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

Thanks,

Peter
>
> > +       wtcon =3D readl(wdt->reg_base + S3C2410_WTCON);
> > +       wtcon |=3D S3C2410_WTCON_DBGACK_MASK;
> > +       writel(wtcon, wdt->reg_base + S3C2410_WTCON);
> > +}
> > +
> >  static int s3c2410wdt_keepalive(struct watchdog_device *wdd)
> >  {
> >         struct s3c2410_wdt *wdt =3D watchdog_get_drvdata(wdd);
> > @@ -700,6 +719,8 @@ static int s3c2410wdt_probe(struct platform_device =
*pdev)
> >         wdt->wdt_device.bootstatus =3D s3c2410wdt_get_bootstatus(wdt);
> >         wdt->wdt_device.parent =3D dev;
> >
> > +       s3c2410wdt_mask_dbgack(wdt);
> > +
> >         /*
> >          * If "tmr_atboot" param is non-zero, start the watchdog right =
now. Also
> >          * set WDOG_HW_RUNNING bit, so that watchdog core can kick the =
watchdog.
> > --
> > 2.43.0.rc2.451.g8631bc7472-goog
> >

