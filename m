Return-Path: <linux-gpio+bounces-872-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 459938011D1
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Dec 2023 18:36:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DCB0BB2123C
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Dec 2023 17:36:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA3CD4EB2C;
	Fri,  1 Dec 2023 17:36:18 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 074CBFE;
	Fri,  1 Dec 2023 09:36:12 -0800 (PST)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-daf26d84100so751179276.3;
        Fri, 01 Dec 2023 09:36:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701452171; x=1702056971;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zk2S3SIrcftqOvoDhsi4gAIcuYBEVIeIZ5ZZ+mwqTiw=;
        b=EQNUsP9BSg/rXbx5nDaJ4L0fKG84XySX+oeYduyl2mOFYLbXlrKYqJXwUUAUUFxoeh
         squ64H+nGTDDwEO6rOCkqyoaCrkR+aGfY/LAs1FkLbVpqoG6qSIcKWigqiLmhpMi4Tq0
         cMhMzuz86+eMHZmKhUb+FFhDv1XEiYIxUlATMMAIFcypbbV8kBcio1M98QsEpWHMCgRn
         XH9uToghs3SsvAaFqh/Wx+IQyp4FzI+ETA8CCYHUbau/jXGer+zC6Qu1bMXhkiCRqbZ8
         ChEz38CzlpoMjFzY/9omkVIgL4xfgFtQeTsFR7/JaMrV1iPPZ2MIbm7zgE8+z1MK0w7L
         5F6g==
X-Gm-Message-State: AOJu0YzO+W1QdcvAXfxYkgNGZEQYHRIB5mP36s4JrdF8TCMTAOc60HEF
	3CYv0XQoRuhBVlb7Is6IfYyRPlESilaTDA==
X-Google-Smtp-Source: AGHT+IGMJZLpeH28JslXaXLL6mgyIy6G2sNXs8zVPt/CpyYrsuHpMwOAe5nLb0EASmWyS+0nJ9W2Mg==
X-Received: by 2002:a25:687:0:b0:daf:81e5:d2fa with SMTP id 129-20020a250687000000b00daf81e5d2famr23278194ybg.33.1701452171063;
        Fri, 01 Dec 2023 09:36:11 -0800 (PST)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id l36-20020a25b324000000b00d9abff76f5csm501019ybj.9.2023.12.01.09.36.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Dec 2023 09:36:09 -0800 (PST)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-5d2d0661a8dso26173127b3.2;
        Fri, 01 Dec 2023 09:36:09 -0800 (PST)
X-Received: by 2002:a81:a0c3:0:b0:5d6:85f1:1539 with SMTP id
 x186-20020a81a0c3000000b005d685f11539mr1605684ywg.18.1701452168947; Fri, 01
 Dec 2023 09:36:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231120070024.4079344-1-claudiu.beznea.uj@bp.renesas.com> <20231120070024.4079344-11-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20231120070024.4079344-11-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 1 Dec 2023 18:35:57 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW9Unpw7NQOGWd4SeFV8XgvRYTKTXnt9Tsagb3Q3U9tNA@mail.gmail.com>
Message-ID: <CAMuHMdW9Unpw7NQOGWd4SeFV8XgvRYTKTXnt9Tsagb3Q3U9tNA@mail.gmail.com>
Subject: Re: [PATCH 10/14] arm64: renesas: r9a08g045: Add Ethernet nodes
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
> Add Ethernet nodes available on RZ/G3S (R9A08G045).
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
> @@ -149,6 +149,38 @@ sdhi2: mmc@11c20000 {
>                         status =3D "disabled";
>                 };
>
> +               eth0: ethernet@11c30000 {
> +                       compatible =3D "renesas,r9a08g045-gbeth", "renesa=
s,rzg2l-gbeth";
> +                       reg =3D <0 0x11c30000 0 0x10000>;
> +                       interrupts =3D <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-names =3D "mux", "fil", "arp_ns";
> +                       clocks =3D <&cpg CPG_MOD R9A08G045_ETH0_CLK_AXI>,
> +                                <&cpg CPG_MOD R9A08G045_ETH0_CLK_CHI>,
> +                                <&cpg CPG_MOD R9A08G045_ETH0_REFCLK>;
> +                       clock-names =3D "axi", "chi", "refclk";
> +                       resets =3D <&cpg R9A08G045_ETH0_RST_HW_N>;
> +                       power-domains =3D <&cpg>;

Perhaps add a default phy mode, like on other SoCs?

    phy-mode =3D "rgmii"';

Also missing:

    #address-cells =3D <1>;
    #size-cells =3D <0>;

> +                       status =3D "disabled";
> +               };

Same comments for eth1.

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

