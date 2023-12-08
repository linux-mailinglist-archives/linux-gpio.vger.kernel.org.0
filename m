Return-Path: <linux-gpio+bounces-1126-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5D880A56E
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Dec 2023 15:28:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C3860281BEA
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Dec 2023 14:28:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E3401DFFD;
	Fri,  8 Dec 2023 14:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AcKxEqDW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com [IPv6:2607:f8b0:4864:20::f2a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E4551738
	for <linux-gpio@vger.kernel.org>; Fri,  8 Dec 2023 06:27:56 -0800 (PST)
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-67a948922aaso11457416d6.3
        for <linux-gpio@vger.kernel.org>; Fri, 08 Dec 2023 06:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702045675; x=1702650475; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y6tktGOmflBDjrD9owZW8jUp+CHgDfz/rbbtd4HS0Vg=;
        b=AcKxEqDWB30LUoTaGIxcjeHFnrqK0ABDkGOsbov3A8vTm7Yu0yQN4qekM/aJ3VZCTE
         nLWAGgtMYfDRmp7PU6nIwXuMxNejq7Hfg7LcbWjUXy9v3SnN4oeh6MsrFkxMTFiEQOup
         AL5QxcW08YlnSsJo9Px8vfcIcnigzDTGsCNdxrw5PzVjlcO4IC+LdDs63y+Wnb59j7jP
         FrEGejWh+Ywqw9qu/8UU5G62cN6+Sm+jDrU+LIEBik8tIDucfg7YXChDmYlaJKN1fYsZ
         D1E0HKOOQfN+giKLigY/J6X7KozqnbF7hwSR1JgDKI+RjdRr6OnGCJezZ5X6xFIlxUeb
         Wjfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702045675; x=1702650475;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y6tktGOmflBDjrD9owZW8jUp+CHgDfz/rbbtd4HS0Vg=;
        b=bztJZyABinrrbDslT3HbHsFFdYv2U0SqpznAQ0cr3fBVx/fyCGyD+0XHvqZOP3oY/I
         z/WTrQp3U0Hoi6+mehfbMPtypyPT4WZdS4aum8awlg7JsbHt1tPufu2lVVFOJ2KVxoNb
         s8al+v503NZ7EX3GOo3iMsBcFPDgFcIn4tfX8RlglrmJEwehg5F6SMo+kSIud4LeLEi8
         yBeeSFH+nMgfH2ALH9bJ45hqOAABmzo0pbWrV1Z7wkoemXN2gxMPSVWcjPMRDQnWxf3O
         a99DE3YHJBL7OP1/XlkVKojq09zNQqirNqGRUUuay4SHBo7GOPYC428sr2ZQ8nCqhrD6
         a2Mg==
X-Gm-Message-State: AOJu0YwtJ2yyDXAUma9s5Pq9jBuIlCYeiowJDscau15dDTgkVwiAmIRI
	DAso/h5OFtOZFK2hN9rrOV7i6U9lLWvuzZtYPikeSg==
X-Google-Smtp-Source: AGHT+IGbiA6FsS80GfwV+c82tNjaevxVqMuJe5EJncnQTyRiVvDHSd4AgX2BqsQb6YkJ2YjyEjuCQy/avC/S0mz+amg=
X-Received: by 2002:ad4:5695:0:b0:67a:a721:e150 with SMTP id
 bd21-20020ad45695000000b0067aa721e150mr16777qvb.125.1702045675625; Fri, 08
 Dec 2023 06:27:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231201160925.3136868-1-peter.griffin@linaro.org>
 <20231201160925.3136868-13-peter.griffin@linaro.org> <20bf05b9d9ccc5c11ef17500ac7a97c46dd46a9a.camel@linaro.org>
In-Reply-To: <20bf05b9d9ccc5c11ef17500ac7a97c46dd46a9a.camel@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 8 Dec 2023 14:27:44 +0000
Message-ID: <CADrjBPr_sv29Dc3F-4wVvH_N+qU6509kvHqkyZG==Q1RRpi5gA@mail.gmail.com>
Subject: Re: [PATCH v5 12/20] clk: samsung: clk-gs101: Add cmu_top, cmu_misc
 and cmu_apm support
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org, 
	tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org, 
	wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org, 
	jirislaby@kernel.org, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
	tudor.ambarus@linaro.org, semen.protsenko@linaro.org, saravanak@google.com, 
	willmcvicker@google.com, soc@kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, kernel-team@android.com, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andr=C3=A9,

Thanks for the review

On Mon, 4 Dec 2023 at 17:51, Andr=C3=A9 Draszik <andre.draszik@linaro.org> =
wrote:
>
> On Fri, 2023-12-01 at 16:09 +0000, Peter Griffin wrote:
> > cmu_top is the top level clock management unit which contains PLLs, mux=
es,
> > dividers and gates that feed the other clock management units.
> >
> > cmu_misc clocks IPs such as Watchdog and cmu_apm clocks ips part of the
> > APM module.
> >
> > Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
> > Tested-by: Will McVicker <willmcvicker@google.com>
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  drivers/clk/samsung/Makefile    |    1 +
> >  drivers/clk/samsung/clk-gs101.c | 2495 +++++++++++++++++++++++++++++++
> >  2 files changed, 2496 insertions(+)
> >  create mode 100644 drivers/clk/samsung/clk-gs101.c
> >
> > diff --git a/drivers/clk/samsung/Makefile b/drivers/clk/samsung/Makefil=
e
> > index ebbeacabe88f..3056944a5a54 100644
> > --- a/drivers/clk/samsung/Makefile
> > +++ b/drivers/clk/samsung/Makefile
> > @@ -21,6 +21,7 @@ obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)       +=3D clk-=
exynos7.o
> >  obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)        +=3D clk-exynos7885.o
> >  obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)        +=3D clk-exynos850.o
> >  obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)        +=3D clk-exynosautov9.o
> > +obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)        +=3D clk-gs101.o
> >  obj-$(CONFIG_S3C64XX_COMMON_CLK)     +=3D clk-s3c64xx.o
> >  obj-$(CONFIG_S5PV210_COMMON_CLK)     +=3D clk-s5pv210.o clk-s5pv210-au=
dss.o
> >  obj-$(CONFIG_TESLA_FSD_COMMON_CLK)   +=3D clk-fsd.o
> > diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk-=
gs101.c
> > new file mode 100644
> > index 000000000000..6bd233a7ab63
> > --- /dev/null
> > +++ b/drivers/clk/samsung/clk-gs101.c
> > @@ -0,0 +1,2495 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (C) 2023 Linaro Ltd.
> > + * Author: Peter Griffin <peter.griffin@linaro.org>
> > + *
> > + * Common Clock Framework support for GS101.
> > + */
> > [...]
> > +
> > +/* List of parent clocks for Muxes in CMU_TOP: for CMU_HSI0 */
> > +PNAME(mout_cmu_hsi0_usb31drd_p)      =3D { "oscclk", "dout_shared2_div=
2" };
> > +
> > +PNAME(mout_cmu_hsi0_bus_p)   =3D { "dout_shared0_div4", "dout_shared1_=
div4",
> > +                                 "dout_shared2_div2", "dout_shared3_di=
v2",
> > +                                 "fout_spare_pll" };
>
> This should also be updated....
>
> > [...]
> > +     MUX(CLK_MOUT_HSI0_BUS, "mout_cmu_hsi0_bus", mout_cmu_hsi0_bus_p,
> > +         CLK_CON_MUX_MUX_CLKCMU_HSI0_BUS, 0, 3),
>
> ...because we have 8 possibilities now.

Interesting, unfortunately there is some discrepancy between the
documentation again :( All the cmu_top clock parents were authored
using the cmu_diagrams which only shows the 5 parents listed above.
Checking the mux register definition it lists 5-7 as being oscclk
5=3Dosclk
6=3Dosclk
7=3Doscclk

Downstream clock implementation lists these oscclk 5-7 as well, so I
guess we should add them...sigh

> (I didn't check the other parents, but you mentioned you updated field wi=
dths
> in other registers, too, so maybe need to double check the parent strings=
 as well)

Yes I will go through and re-check these parent names again.

Peter

