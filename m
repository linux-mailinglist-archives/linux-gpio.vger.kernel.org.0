Return-Path: <linux-gpio+bounces-870-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D4F8010C5
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Dec 2023 18:11:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 24820B211FE
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Dec 2023 17:11:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB2164E1A3;
	Fri,  1 Dec 2023 17:11:35 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5122C1;
	Fri,  1 Dec 2023 09:11:32 -0800 (PST)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-5d3ffa1ea24so11437607b3.3;
        Fri, 01 Dec 2023 09:11:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701450692; x=1702055492;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LOYVG3uVS3nV7wf5Zl9tUOjXsJqVljlnHdmIj5/Ot90=;
        b=osY0FD1UjD04Ov7gWiV8JzYzLxiuQNf5N52+4CnbAvDAiHbUsm3VXj6qxT4xQRDWtU
         2joSDebGlB/M1T/wbKLLjvYkbJpjBGqkzXVi6aTjO+FEG6d+/iLpSeZxtvNfc4w9tVn+
         iozKWROmi/8Mg77q6yBTiaCvSnZSMPzUPorcqAoV22Pb75thQxE6wqcGPjwLOelwDByT
         Yc4B+j3MfZb6gG/qWRw11izh0KGjHZPc2NjMpK0+Zfnz6JsNIinLu77dVAoD56s9w25X
         WeIRfdSofnnxEYxsRml4zgnhP46mhuNNh4y4ElsHFyGaT1/pVZYQ4RHw0vRtSv76l5Li
         3gxg==
X-Gm-Message-State: AOJu0Yw/tIQDchO/sUTqjsefZr7Lpup7eth8DxmP0/Cx64o4/qh3ueQ8
	Dz0rXJIrLUCC2nwDD87fxsEKZAYaDkobgg==
X-Google-Smtp-Source: AGHT+IGwmhhmHsTtrAaKEk6Y9/h8mCRZgE1kYoOmknWHdqcQOqALRpdveibx39d8VcXB9jTS1TneJw==
X-Received: by 2002:a0d:cbcf:0:b0:5d3:7c0b:9547 with SMTP id n198-20020a0dcbcf000000b005d37c0b9547mr5778930ywd.12.1701450691960;
        Fri, 01 Dec 2023 09:11:31 -0800 (PST)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id i71-20020a0ddf4a000000b005d3758fda7dsm1078217ywe.31.2023.12.01.09.11.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Dec 2023 09:11:29 -0800 (PST)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-da37522a363so737500276.0;
        Fri, 01 Dec 2023 09:11:29 -0800 (PST)
X-Received: by 2002:a0d:c985:0:b0:5cd:6d0e:5369 with SMTP id
 l127-20020a0dc985000000b005cd6d0e5369mr29643228ywd.34.1701450688717; Fri, 01
 Dec 2023 09:11:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231120070024.4079344-1-claudiu.beznea.uj@bp.renesas.com> <20231120070024.4079344-8-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20231120070024.4079344-8-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 1 Dec 2023 18:11:17 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWFDD=c7f-jbB88BjMa75VBhjSrVK-E0OYYQ-gr_hi-zQ@mail.gmail.com>
Message-ID: <CAMuHMdWFDD=c7f-jbB88BjMa75VBhjSrVK-E0OYYQ-gr_hi-zQ@mail.gmail.com>
Subject: Re: [PATCH 07/14] pinctrl: renesas: rzg2l: Add support to select
 power source for Ethernet pins
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: s.shtylyov@omp.ru, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, linux@armlinux.org.uk, 
	magnus.damm@gmail.com, mturquette@baylibre.com, sboyd@kernel.org, 
	linus.walleij@linaro.org, p.zabel@pengutronix.de, arnd@arndb.de, 
	m.szyprowski@samsung.com, alexandre.torgue@foss.st.com, afd@ti.com, 
	broonie@kernel.org, alexander.stein@ew.tq-group.com, 
	eugen.hristev@collabora.com, sergei.shtylyov@gmail.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, biju.das.jz@bp.renesas.com, 
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Claudiu,

On Mon, Nov 20, 2023 at 8:01=E2=80=AFAM Claudiu <claudiu.beznea@tuxon.dev> =
wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> For Ethernet pins GPIO controller available on RZ/G3S (but also on RZ/G2L=
)
> allows setting the power source. Based on the interface b/w Ethernet
> controller and Ethernet PHY and board design specific power source need t=
o
> be selected. The GPIO controller allow 1.8V, 2.5V and 3.3V power source
> selection for Ethernet pins and this could be selected though ETHX_POC
> registers (X=3D{0, 1}).
>
> Commit adjust the driver to support this and does proper instantiation
> for RZ/G3S and RZ/G2L SoC. On RZ/G2L only get operation has been tested
> at the moment.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -623,7 +632,16 @@ static int rzg2l_get_power_source(struct rzg2l_pinct=
rl *pctrl, u32 pin, u32 caps
>         if (pwr_reg < 0)
>                 return pwr_reg;
>
> -       return (readl(pctrl->base + pwr_reg) & PVDD_MASK) ? 1800 : 3300;

This removes the last user of PVDD_MASK. I guess it can be removed,
as all unused register bits are documented to read as zeroes.

> +       val =3D readl(pctrl->base + pwr_reg);

While these registers are documented to support access sizes of
8/16/32 bits on RZ/G3S, RZ/G2L is limited to 8 bits, so this should
have used readb() from the beginning.

> +       if (val =3D=3D PVDD_1800)
> +               return 1800;
> +       if (val =3D=3D PVDD_2500)
> +               return 2500;
> +       if (val =3D=3D PVDD_3300)
> +               return 3300;
> +
> +       /* Should not happen. */
> +       return -EINVAL;

Please use a switch() statement.

>  }
>
>  static int rzg2l_set_power_source(struct rzg2l_pinctrl *pctrl, u32 pin, =
u32 caps, u32 ps)
> @@ -631,17 +649,27 @@ static int rzg2l_set_power_source(struct rzg2l_pinc=
trl *pctrl, u32 pin, u32 caps
>         const struct rzg2l_hwcfg *hwcfg =3D pctrl->data->hwcfg;
>         const struct rzg2l_register_offsets *regs =3D &hwcfg->regs;
>         int pwr_reg;
> +       u32 val;
>
>         if (caps & PIN_CFG_SOFT_PS) {
>                 pctrl->settings[pin].power_source =3D ps;
>                 return 0;
>         }
>
> +       if (ps =3D=3D 1800)
> +               val =3D PVDD_1800;
> +       else if (ps =3D=3D 2500)
> +               val =3D PVDD_2500;
> +       else if (ps =3D=3D 3300)
> +               val =3D PVDD_3300;
> +       else
> +               return -EINVAL;

Please use a switch() statement.

> +
>         pwr_reg =3D rzg2l_caps_to_pwr_reg(regs, caps);
>         if (pwr_reg < 0)
>                 return pwr_reg;
>
> -       writel((ps =3D=3D 1800) ? PVDD_1800 : PVDD_3300, pctrl->base + pw=
r_reg);
> +       writel(val, pctrl->base + pwr_reg);

writeb() for RZ/G2L.

>         pctrl->settings[pin].power_source =3D ps;
>
>         return 0;

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

