Return-Path: <linux-gpio+bounces-1053-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 61390806BFC
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Dec 2023 11:33:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B7781F212D5
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Dec 2023 10:33:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5FF82DF67;
	Wed,  6 Dec 2023 10:33:35 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4236120;
	Wed,  6 Dec 2023 02:33:31 -0800 (PST)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-db539f21712so652903276.1;
        Wed, 06 Dec 2023 02:33:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701858811; x=1702463611;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ppJZHeeq4GSLMzo9BpRtzV0XWoMwWQg5YLkR/Wat1cc=;
        b=K8k5k5sOYoug2XUHkcx6KvsW0Nd1WuEGpsy3ggnh4knAlOt+kLdjEaDoQef6TD1I6e
         AsF6wBYdgWlUMz4kDicjgprNyyM/qJvsPYgamcfWOFhi8PxMzNMett9SnAQPYDUIBC+m
         M6LKIGmFeHXPw0X1ekr0t0pzh+XnA3Zntwk893ykxZ5Yj+zZX5cWRCJnXsEfP/FeMBNP
         /t1BGmCd6BOO65BoUoAb89L4Jwcn1ENIcWCo3vtlUf/pBh+z3Jc/y0ttCy9oimYpSrCh
         1VxaKeU4e6aRElFYaTBJ8xGUALE8L3MoB6B/UcNJwcozwLFoGlGAL6X204Og0SOMzp8X
         NIQQ==
X-Gm-Message-State: AOJu0YxQ9MKje57m5dn/WUmA49vE6SRlVfJzlefl0vtL/G8WrjAD3HTN
	V8bMFdHbZL09TU5QVJX19oiM8IZFGRv8rw==
X-Google-Smtp-Source: AGHT+IFj3vKNwuS8BPb5D5X8gceRBPbMXcMarr7GKumB/3oi0KM+Cjt+rjPFFUBhbVdQzEH9mlrGvA==
X-Received: by 2002:a25:ae4b:0:b0:db9:8713:14f6 with SMTP id g11-20020a25ae4b000000b00db9871314f6mr1749784ybe.31.1701858810701;
        Wed, 06 Dec 2023 02:33:30 -0800 (PST)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id p127-20020a252985000000b00db3fa34142bsm3785711ybp.49.2023.12.06.02.33.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Dec 2023 02:33:29 -0800 (PST)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-5cdc0b3526eso6576337b3.1;
        Wed, 06 Dec 2023 02:33:29 -0800 (PST)
X-Received: by 2002:a81:ad49:0:b0:5d7:e2b8:bcca with SMTP id
 l9-20020a81ad49000000b005d7e2b8bccamr505400ywk.18.1701858809241; Wed, 06 Dec
 2023 02:33:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231120070024.4079344-1-claudiu.beznea.uj@bp.renesas.com> <20231120070024.4079344-12-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20231120070024.4079344-12-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 Dec 2023 11:33:17 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUbKe=yiXWNmk5BJFLtF2psx9khiDRGasT9WsnHz4RWsg@mail.gmail.com>
Message-ID: <CAMuHMdUbKe=yiXWNmk5BJFLtF2psx9khiDRGasT9WsnHz4RWsg@mail.gmail.com>
Subject: Re: [PATCH 11/14] arm64: renesas: rzg3s-smarc-som: Invert the logic
 for SW_SD2_EN macro
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: s.shtylyov@omp.ru, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, linux@armlinux.org.uk, 
	geert+renesas@glider.be, magnus.damm@gmail.com, mturquette@baylibre.com, 
	sboyd@kernel.org, linus.walleij@linaro.org, p.zabel@pengutronix.de, 
	arnd@arndb.de, m.szyprowski@samsung.com, alexandre.torgue@foss.st.com, 
	afd@ti.com, broonie@kernel.org, alexander.stein@ew.tq-group.com, 
	eugen.hristev@collabora.com, sergei.shtylyov@gmail.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, biju.das.jz@bp.renesas.com, 
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Claudiu,

On Mon, Nov 20, 2023 at 8:03=E2=80=AFAM Claudiu <claudiu.beznea@tuxon.dev> =
wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The intention of SW_SD2_EN macro was to reflect the state of SW_CONFIG3
> switch available on RZ/G3S Smarc Module. According to documentation SD2
> is enabled when switch is in OFF state. For this, changed the logic of
> marco to map value 0 to switch's OFF state and value 1 to switch's ON
> state. Along with this update the description for each state for better
> understanding.
>
> The value of SW_SD2_EN macro was not changed in file because, according t=
o
> documentation, the default state for this switch is ON.
>
> Fixes: adb4f0c5699c ("arm64: dts: renesas: Add initial support for RZ/G3S=
 SMARC SoM")
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
> @@ -14,8 +14,8 @@
>   *     0 - SD0 is connected to eMMC
>   *     1 - SD0 is connected to uSD0 card
>   * @SW_SD2_EN:
> - *     0 - SCIF1, SSI0, IRQ0, IRQ1 connected to SoC
> - *     1 - SD2 is connected to SoC
> + *     0 - (switch OFF) SD2 is connected to SoC
> + *     1 - (switch ON)  SCIF1, SSI0, IRQ0, IRQ1 connected to SoC

I think this is still confusing: SW_SD2_EN refers to an active-low signal
(SW_SD2_EN#) in the schematics.

Before, SW_SD2_EN used assertion-logic (1 is enabled), and didn't
match the physical signal level.
After your patch, SW_SD2_EN matches the active-low physical level, but
this is not reflected in the name...

>   */
>  #define SW_SD0_DEV_SEL 1
>  #define SW_SD2_EN      1
> @@ -25,7 +25,7 @@ / {
>
>         aliases {
>                 mmc0 =3D &sdhi0;
> -#if SW_SD2_EN
> +#if !SW_SD2_EN

... so this condition looks really weird.

>                 mmc2 =3D &sdhi2;
>  #endif
>         };
> @@ -116,7 +116,7 @@ &sdhi0 {
>  };
>  #endif
>
> -#if SW_SD2_EN
> +#if !SW_SD2_EN
>  &sdhi2 {
>         pinctrl-0 =3D <&sdhi2_pins>;
>         pinctrl-names =3D "default";

So I think SW_SD2_EN should be renamed to SW_SD2_EN_N.

Cfr. SW_ET0_EN_N on RZ/G2UL:

arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dts- * DIP-Switch SW1 settin=
g
arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dts- * 1 : High; 0: Low
arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dts- * SW1-2 :
SW_SD0_DEV_SEL    (0: uSD; 1: eMMC)
arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dts- * SW1-3 :
SW_ET0_EN_N               (0: ETHER0; 1: CAN0, CAN1, SSI1, RSPI1)
arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dts- * Please change
below macros according to SW1 setting on the SoM

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

