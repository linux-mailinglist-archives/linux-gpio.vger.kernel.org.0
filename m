Return-Path: <linux-gpio+bounces-13690-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB5D9EAD79
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Dec 2024 11:03:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D2184188E9C4
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Dec 2024 10:00:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 340A423DEBB;
	Tue, 10 Dec 2024 09:59:22 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A836A23DEA1;
	Tue, 10 Dec 2024 09:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733824762; cv=none; b=SNUD1wBBZJXT7Jt5HwG+PviGAdKZVtgZon0DrYUSgWsoL9LwxiTigiU8XhUPv1fB1C/NcX3CpXoJGQLFB7bhp2LBE43KeP0qrkJ8MD57S11Hx+6aduU+KsiTM+ARmYgoX2cqqjk+m0oXKd4FvBBn9nOda6ULwthXrkYgwRNXYH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733824762; c=relaxed/simple;
	bh=lbp2L0zKVgefFi27Wi0+JSzYQ3XV4hH6OGFxbDVl0jk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NfxmGVjW9hcU532ta+gKOZtAPc6qrCEXRWWQUNV3xgEbL+qP9H4Dofn5ijbCeGuAuNYg0sZHQbglw2Rp8+kh9Mw7IG+Oq9vF/HelH+A7h2JSGQN+0755YBNwvRxNj5NpGhkrjPsb5wLCaJmL9l3Nqajj4t70pvAi9GgZqElp0tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5162571e761so703581e0c.2;
        Tue, 10 Dec 2024 01:59:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733824757; x=1734429557;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=14JD7aK/MGT2Us0HEM0MRcDAQ2k50+o1+2/kNIISVSo=;
        b=OGgvCWKDRAo+ReBUKX9LuJ5768dVGac8+U3bB8w/YG+Ani61MPE36hiCWDVTjoqgPi
         k+Q41voO+/C2Mn2zay9y+8nW1VAv+ggW+Ze/zj4SDJDUXwxpfCzzNFwOHkEpg7LIHjx0
         es23Hf0pnUs+2ubMXBJzRTICUJ2zZZsVGmHWRd6tuzjy5AoH5lbsUJgr+ogUTpmj3gQV
         9kLZ6kLN5Q79oCtZV0BgglseBQgcgYxsMqrlW498pZdnTVtdzD+LDCAuQLr1ZYWKqnlc
         GP0uCnErn8cHv3zSZ6oCaeEx+D9L1zkGwAN0x1Uyn79sQrYKTuhVNDv4DW+nLmqjJTDW
         CRpA==
X-Forwarded-Encrypted: i=1; AJvYcCUmx70ce/JCtEyoIXymfQtZyvBF6ISJ0Vb48uwI/fQVtGyG6wM4tc5RhUPaFEECzb+q0CF0jiW3q/zt@vger.kernel.org, AJvYcCUpuRD5gnaczwLWBRFz6oIwuOF4nMaTazub4aDETdl5MS73I9poRsvEEpqXqZJq03QavFQvhd126KIBuA==@vger.kernel.org, AJvYcCUztfyZfnSl5SMbaGmJWf/+RxIOr4eQv6o46FrDutPMZ0ptqa2Et04H7YBPWAC7k+qBlKUvHiwqtDInf1pj@vger.kernel.org, AJvYcCVPOchlDvr1Pm6vRnKRoQ0vIuoCtk8J4yFAXxKBLadrefU6sfCEfWwrZbstO0d1bBkYfvjNXt82u5IB6/e+cKTHelo=@vger.kernel.org, AJvYcCVb/8F6J50qvtECrKTKh1ghIAn5KAPdhicd0tIOAN1Sho6ucPjTA5WcLAGnmI786roFakRUscvlSOfR@vger.kernel.org, AJvYcCXebyjsquD++1sUkYzLuz+1yNcFSSqwH2Zf7BQdKW1V3S7lflsZswvZp6yrWAVjm1vmUZ1iI50oD+UlfSw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKLqq79TaXLRu7LxiFCi0Ubv14zj18v6cLok/DrUe0MQe56/I2
	YJDzafCZfONm1Q5PFHrEg3u3xoS7StPQsmjQSlf5ak3FZq7pNBg1oIz+OJ/D
X-Gm-Gg: ASbGncuKvrZk5r9zIR4G/PqvwHkYTIG9zYhIftD4eXQlFPGk/q6b3FEt7A29zwK2gQN
	8CgDnaRFeTgL+BEcoBmHvfrs8GnMea8CkxQvx0LT+YyufiqrdqmggQSCZkl3U/MBFzQzgC1PTKE
	JaHs0HT+oRZCauTiRKC2wqwffZ7IzCWFZFOA5cFqx/fiLLQhTFbyoKm84UquVmp1El3Pm7ZIo48
	VrWV2v4wBFypQtYotps6OJN77jxNLSfU8463eU4eK4ofSY/C5xQc/f7MeriGBKP2uXxfeStVG/+
	igGVwE3QEYSTN2s9
X-Google-Smtp-Source: AGHT+IF0CfTRgTeCEeVR86aBpiauxGhldlYNvu//+JprRcK2gWUJPic0y5PvaNK9Da6y8qE+pY3N4w==
X-Received: by 2002:a05:6122:4b1b:b0:518:81aa:899b with SMTP id 71dfb90a1353d-518883727dcmr4080512e0c.6.1733824757024;
        Tue, 10 Dec 2024 01:59:17 -0800 (PST)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-515eaf6290bsm939851e0c.50.2024.12.10.01.59.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2024 01:59:16 -0800 (PST)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-85c662ebbc3so545945241.0;
        Tue, 10 Dec 2024 01:59:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUDcWyTCWisWAKmo58Etv8BNzUFT2N2QOFzNqtI8rh/l/QHFbw4zYUTic3BhwvVFAUU+SqZ3Q8MjeeULZOj23bAx38=@vger.kernel.org, AJvYcCUjTSsO1fgz7STMpVF1UNnvUHRzq3v7VcBH5IOiFbLMo2k0OqUWaJlk15ndiBmLwHym5yDB42U1SMIoCg==@vger.kernel.org, AJvYcCUxRG+lLiCOGD3qWi2KE0S8Yx43oLDz3TgWQj67CuCN0KNmAFlNKpnegJcEAiU57hXcciwHMzIb2l7k@vger.kernel.org, AJvYcCVqDA3pG05gVsjoByrW4ubuf492+gnQYuxTeyKlgM1PKqzj0suOB9l7izM7qkjbLBW2Zx/UGP4uH4/L@vger.kernel.org, AJvYcCW1pjAa90MevkkFdr8+iSZyPL1ccgyF+bM7Ad+GX3W82kHd8Et8OwfzV3D5AKlW6NYeZ7nMusKnbhks50w=@vger.kernel.org, AJvYcCX4apuJV1psGUg2107nUI3tupkitunwm0TT7g4H07AgRvQPXJC4SnD2tjRTSmWmUJpVxDEh3CNqoey1f9zN@vger.kernel.org
X-Received: by 2002:a05:6102:1612:b0:4af:ef82:ce8b with SMTP id
 ada2fe7eead31-4b11626649amr3884337137.26.1733824756016; Tue, 10 Dec 2024
 01:59:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241113133540.2005850-1-claudiu.beznea.uj@bp.renesas.com> <20241113133540.2005850-24-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241113133540.2005850-24-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 Dec 2024 10:59:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX3c_tQpakGtvEeOAj1nbkpoQf6HTkjK7RczN64GxhK8Q@mail.gmail.com>
Message-ID: <CAMuHMdX3c_tQpakGtvEeOAj1nbkpoQf6HTkjK7RczN64GxhK8Q@mail.gmail.com>
Subject: Re: [PATCH v3 23/25] arm64: dts: renesas: Add da7212 audio codec node
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	biju.das.jz@bp.renesas.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	lgirdwood@gmail.com, broonie@kernel.org, magnus.damm@gmail.com, 
	linus.walleij@linaro.org, perex@perex.cz, tiwai@suse.com, 
	p.zabel@pengutronix.de, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 13, 2024 at 2:36=E2=80=AFPM Claudiu <claudiu.beznea@tuxon.dev> =
wrote:
>
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Add the da7212 audio codec node. Along with it regulators nodes were
> reworked to be able to re-use them on da7212.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v3:
> - none
>
> Changes in v2:
> - none
>
>  .../boot/dts/renesas/rzg3s-smarc-som.dtsi     | 17 ++++++++++----
>  arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi  | 23 +++++++++++++++++++
>  2 files changed, 35 insertions(+), 5 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi b/arch/arm6=
4/boot/dts/renesas/rzg3s-smarc-som.dtsi
> index 6e58d47d85b0..5ee9dac4aebb 100644
> --- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
> @@ -63,7 +63,6 @@ vcc_sdhi0: regulator0 {
>                 enable-active-high;
>         };
>
> -#if SW_CONFIG2 =3D=3D SW_ON
>         vccq_sdhi0: regulator1 {
>                 compatible =3D "regulator-gpio";
>                 regulator-name =3D "SDHI0 VccQ";
> @@ -73,8 +72,8 @@ vccq_sdhi0: regulator1 {
>                 gpios-states =3D <1>;
>                 states =3D <3300000 1>, <1800000 0>;
>         };
> -#else
> -       reg_1p8v: regulator1 {
> +
> +       reg_1p8v: regulator2 {
>                 compatible =3D "regulator-fixed";
>                 regulator-name =3D "fixed-1.8V";
>                 regulator-min-microvolt =3D <1800000>;
> @@ -82,9 +81,17 @@ reg_1p8v: regulator1 {
>                 regulator-boot-on;
>                 regulator-always-on;
>         };
> -#endif
>
> -       vcc_sdhi2: regulator2 {
> +       reg_3p3v: regulator3 {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "fixed-3.3V";
> +               regulator-min-microvolt =3D <3300000>;
> +               regulator-max-microvolt =3D <3300000>;
> +               regulator-boot-on;
> +               regulator-always-on;
> +       };
> +
> +       vcc_sdhi2: regulator4 {
>                 compatible =3D "regulator-fixed";
>                 regulator-name =3D "SDHI2 Vcc";
>                 regulator-min-microvolt =3D <3300000>;
> diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi b/arch/arm64/bo=
ot/dts/renesas/rzg3s-smarc.dtsi
> index 4509151344c4..4aa99814b808 100644
> --- a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
> @@ -68,6 +68,29 @@ &i2c0 {
>         status =3D "okay";
>
>         clock-frequency =3D <1000000>;
> +
> +       da7212: codec@1a {
> +               compatible =3D "dlg,da7212";
> +               reg =3D <0x1a>;
> +
> +               #sound-dai-cells =3D <0>;
> +               #address-cells =3D <1>;
> +               #size-cells =3D <0>;

make dtbs_check:

    arch/arm64/boot/dts/renesas/r9a08g045s33-smarc.dtb: codec@1a:
Unevaluated properties are not allowed ('#address-cells',
'#size-cells' were unexpected)
            from schema $id:
http://devicetree.org/schemas/sound/dlg,da7213.yaml#

> +
> +               clocks =3D <&versa3 1>;
> +               clock-names =3D "mclk";
> +
> +               dlg,micbias1-lvl =3D <2500>;
> +               dlg,micbias2-lvl =3D <2500>;
> +               dlg,dmic-data-sel =3D "lrise_rfall";
> +               dlg,dmic-samplephase =3D "between_clkedge";
> +               dlg,dmic-clkrate =3D <3000000>;
> +
> +               VDDA-supply =3D <&reg_1p8v>;
> +               VDDSP-supply =3D <&reg_3p3v>;
> +               VDDMIC-supply =3D <&reg_3p3v>;
> +               VDDIO-supply =3D <&reg_1p8v>;
> +       };
>  };

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

