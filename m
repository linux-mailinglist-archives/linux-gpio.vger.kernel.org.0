Return-Path: <linux-gpio+bounces-844-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 43ABB800EFC
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Dec 2023 17:05:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F2AEC281C38
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Dec 2023 16:05:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46DED4BAA4;
	Fri,  1 Dec 2023 16:05:15 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D928B10EA;
	Fri,  1 Dec 2023 08:05:10 -0800 (PST)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-41ea8debcdaso13038371cf.1;
        Fri, 01 Dec 2023 08:05:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701446709; x=1702051509;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S6g9qjiYrvOeYcygh2TbjSPkHxJ0/agDmVlkXrziZ/4=;
        b=qkHvF/Gd5YKqFz/xVAonT1sM8v4cq6NrbDR9LV7NCer9RJ5QaeJ27/Vz36fHgT8Pyn
         9OII0hHPgAYTl2fJaP4PGMw7Svo7RePMTwCfDmmw2avfb2Jeca4B1x3wWjebfO+kX4EN
         m8JXIYSSGUaokTgHUMgt0JiGxrYDWYibFeeMFKWX5K0Rjo984miBZt/BHdM1WOHGZj/q
         pbIzci8CABo5ojz8u80K5bBbMzYi0/R1VmDLUen/ogdMgbkzKm5iCrnfT2Vl19QzL6aX
         jV1+pZGU2ef3QPuPAA12Ih8hHH03hP6DQAatGfBJFckXeDyHs4tAfsZrrIYIagfboc2u
         BAuw==
X-Gm-Message-State: AOJu0Yz96nxPV61Rqo6e96FTwkPZujGctoY83ZakQooQUQGipf+0FdZP
	TypQPmn9dez7GLIqq+K6dTX9ON9wycEO1Q==
X-Google-Smtp-Source: AGHT+IHwMvRrACDPSXGPoxI9Jd4QGjibtxHw29A4JxUr/0V3GUHGPq7Z/NDuPplnvmjwEXba2M/lTg==
X-Received: by 2002:a05:622a:1751:b0:423:9407:8c1e with SMTP id l17-20020a05622a175100b0042394078c1emr29177283qtk.10.1701446709349;
        Fri, 01 Dec 2023 08:05:09 -0800 (PST)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com. [209.85.160.173])
        by smtp.gmail.com with ESMTPSA id l4-20020ac84a84000000b00423ea3b17b4sm1583775qtq.72.2023.12.01.08.05.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Dec 2023 08:05:09 -0800 (PST)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-41cd8bd5727so12957181cf.3;
        Fri, 01 Dec 2023 08:05:08 -0800 (PST)
X-Received: by 2002:a81:9957:0:b0:5d3:690e:d804 with SMTP id
 q84-20020a819957000000b005d3690ed804mr4856222ywg.11.1701446404100; Fri, 01
 Dec 2023 08:00:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231120070024.4079344-1-claudiu.beznea.uj@bp.renesas.com> <20231120070024.4079344-5-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20231120070024.4079344-5-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 1 Dec 2023 16:59:53 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWwn8xcKX3vgawtGqksuMM3CKZx=3k6EKP3kDFZxbocdA@mail.gmail.com>
Message-ID: <CAMuHMdWwn8xcKX3vgawtGqksuMM3CKZx=3k6EKP3kDFZxbocdA@mail.gmail.com>
Subject: Re: [PATCH 04/14] clk: renesas: r9a08g045-cpg: Add clock and reset
 support for ETH0 and ETH1
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
> RZ/G3S has 2 Gigabit Ethernet interfaces available. Add clock and reset
> support for both of them.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/r9a08g045-cpg.c
> +++ b/drivers/clk/renesas/r9a08g045-cpg.c
> @@ -217,6 +219,16 @@ static const struct rzg2l_mod_clk r9a08g045_mod_clks=
[] =3D {
>                                         MSTOP(PERI_COM, BIT(11))),
>         DEF_MOD("sdhi2_aclk",           R9A08G045_SDHI2_ACLK, R9A08G045_C=
LK_P1, 0x554, 11,
>                                         MSTOP(PERI_COM, BIT(11))),
> +       DEF_COUPLED("eth0_axi",         R9A08G045_ETH0_CLK_AXI, R9A08G045=
_CLK_M0, 0x57c, 0,
> +                                       MSTOP(PERI_COM, BIT(2))),
> +       DEF_COUPLED("eth0_chi",         R9A08G045_ETH0_CLK_CHI, R9A08G045=
_CLK_ZT, 0x57c, 0,
> +                                       MSTOP(PERI_COM, BIT(2))),
> +       DEF_MOD("eth0_refclk",          R9A08G045_ETH0_REFCLK, R9A08G045_=
CLK_HP, 0x57c, 8, 0),
> +       DEF_COUPLED("eth1_axi",         R9A08G045_ETH1_CLK_AXI, R9A08G045=
_CLK_M0, 0x57c, 1,
> +                                       MSTOP(PERI_COM, BIT(3))),
> +       DEF_COUPLED("eth1_chi",         R9A08G045_ETH1_CLK_CHI, R9A08G045=
_CLK_ZT, 0x57c, 1,
> +                                       MSTOP(PERI_COM, BIT(3))),
> +       DEF_MOD("eth1_refclk",          R9A08G045_ETH1_REFCLK, R9A08G045_=
CLK_HP, 0x57c, 9, 0),
>         DEF_MOD("scif0_clk_pck",        R9A08G045_SCIF0_CLK_PCK, R9A08G04=
5_CLK_P0, 0x584, 0,
>                                         MSTOP(MCPU2, BIT(1))),
>         DEF_MOD("gpio_hclk",            R9A08G045_GPIO_HCLK, R9A08G045_OS=
CCLK, 0x598, 0, 0),

LGTM, pending the MSTOP() part.

Is the MSTOP() handling needed to function? IIUIC, all modules are
enabled
out of reset.
If it is not needed, I can take this patch and remove the MSTOP() part.

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

