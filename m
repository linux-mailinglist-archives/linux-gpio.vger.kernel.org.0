Return-Path: <linux-gpio+bounces-935-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55382802DB9
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Dec 2023 10:00:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CE23CB2097E
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Dec 2023 09:00:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45CFD12E4B;
	Mon,  4 Dec 2023 09:00:20 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B7E685;
	Mon,  4 Dec 2023 01:00:16 -0800 (PST)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-5cd81e76164so46172117b3.1;
        Mon, 04 Dec 2023 01:00:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701680415; x=1702285215;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zv4xm2Lr7Wl/3u3PM4BZ5e6ASOFA8kBT22UWNSzI29A=;
        b=W4IcEPU/06rXnT8zKoV97sb61dfK4jvSzjiUKRd2h1ZIyGrOSEWewb93tkXsKxgV0A
         fyS58euO9pu8E/Prk+l6TktdqcACF3vGncdOCtMy+fDvDZoWUOpNizD1SapCF0RWwX6O
         YsuR8gHtx8OnYuPVHwooZhdRrP1knUbl8uAuUskgOPKHy+oYiguzK/1Ipb8zhRusOrIC
         8kXq5aHCzc9YPk8ByTt7hGCsXbZUgql4kjw0i8VXu9DUdkYRUM/+v4we+hnqt/wVybT4
         +KObvOxtQ5ZoAx6J+fPx7AYaFDBBQbUHT6RjAu8f48MK51cg5Usm8EFMslZZ5F9Ycp6b
         /ozQ==
X-Gm-Message-State: AOJu0YxZ2wOAHYwftq2KHj7FQYSatZvhZXiVTiKlxHcT9T8CnFhyDdZl
	iwaID55UoVvq3WjwHFYsTJLOj0auQvS88A==
X-Google-Smtp-Source: AGHT+IFLHN5lVcrEbK+UZgMtBA8xq+NoiT1Pt2RM2CuumlHSXQwJJCsSPcRznYrTmXwNk4ReaxfVGQ==
X-Received: by 2002:a81:7847:0:b0:5d7:1940:dd77 with SMTP id t68-20020a817847000000b005d71940dd77mr2172352ywc.77.1701680415246;
        Mon, 04 Dec 2023 01:00:15 -0800 (PST)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id v136-20020a81488e000000b005d8bb479c51sm458655ywa.11.2023.12.04.01.00.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Dec 2023 01:00:15 -0800 (PST)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-5d4f71f7e9fso27337927b3.0;
        Mon, 04 Dec 2023 01:00:15 -0800 (PST)
X-Received: by 2002:a81:d206:0:b0:5d7:6089:9617 with SMTP id
 x6-20020a81d206000000b005d760899617mr2012816ywi.24.1701680414955; Mon, 04 Dec
 2023 01:00:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231120070024.4079344-1-claudiu.beznea.uj@bp.renesas.com>
 <20231120070024.4079344-11-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdW9Unpw7NQOGWd4SeFV8XgvRYTKTXnt9Tsagb3Q3U9tNA@mail.gmail.com>
 <96dd3f54-9560-4587-b4e8-bf75422ff5ef@tuxon.dev> <CAMuHMdWGbEhBdzK4Swu4uX05vX7H2Ow4uE1C=JVNOrdcbZYL=A@mail.gmail.com>
 <b3701927-e41a-44d8-8f91-da245b76f532@tuxon.dev>
In-Reply-To: <b3701927-e41a-44d8-8f91-da245b76f532@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 4 Dec 2023 10:00:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVmD7-AUn91SaOq1iOMkcGhi0WNvx8bCX3oD+xa-Bt98g@mail.gmail.com>
Message-ID: <CAMuHMdVmD7-AUn91SaOq1iOMkcGhi0WNvx8bCX3oD+xa-Bt98g@mail.gmail.com>
Subject: Re: [PATCH 10/14] arm64: renesas: r9a08g045: Add Ethernet nodes
To: claudiu beznea <claudiu.beznea@tuxon.dev>
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

On Mon, Dec 4, 2023 at 9:38=E2=80=AFAM claudiu beznea <claudiu.beznea@tuxon=
.dev> wrote:
> On 04.12.2023 10:02, Geert Uytterhoeven wrote:
> > On Mon, Dec 4, 2023 at 8:41=E2=80=AFAM claudiu beznea <claudiu.beznea@t=
uxon.dev> wrote:
> >> On 01.12.2023 19:35, Geert Uytterhoeven wrote:
> >>> On Mon, Nov 20, 2023 at 8:01=E2=80=AFAM Claudiu <claudiu.beznea@tuxon=
.dev> wrote:
> >>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >>>>
> >>>> Add Ethernet nodes available on RZ/G3S (R9A08G045).
> >>>>
> >>>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >>>
> >>> Thanks for your patch!
> >>>
> >>>> --- a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
> >>>> +++ b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
> >>>> @@ -149,6 +149,38 @@ sdhi2: mmc@11c20000 {
> >>>>                         status =3D "disabled";
> >>>>                 };
> >>>>
> >>>> +               eth0: ethernet@11c30000 {
> >>>> +                       compatible =3D "renesas,r9a08g045-gbeth", "r=
enesas,rzg2l-gbeth";
> >>>> +                       reg =3D <0 0x11c30000 0 0x10000>;
> >>>> +                       interrupts =3D <GIC_SPI 68 IRQ_TYPE_LEVEL_HI=
GH>,
> >>>> +                                    <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH=
>,
> >>>> +                                    <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH=
>;
> >>>> +                       interrupt-names =3D "mux", "fil", "arp_ns";
> >>>> +                       clocks =3D <&cpg CPG_MOD R9A08G045_ETH0_CLK_=
AXI>,
> >>>> +                                <&cpg CPG_MOD R9A08G045_ETH0_CLK_CH=
I>,
> >>>> +                                <&cpg CPG_MOD R9A08G045_ETH0_REFCLK=
>;
> >>>> +                       clock-names =3D "axi", "chi", "refclk";
> >>>> +                       resets =3D <&cpg R9A08G045_ETH0_RST_HW_N>;
> >>>> +                       power-domains =3D <&cpg>;
> >>>
> >>> Perhaps add a default phy mode, like on other SoCs?
> >>>
> >>>     phy-mode =3D "rgmii"';
> >>
> >> I skipped this (even it was available on the other SoCs) as I consider=
 the
> >> phy-mode is board specific.
> >
> > IC.  Still, it's good to have some consistency across boards.
> >
> >>> Also missing:
> >>>
> >>>     #address-cells =3D <1>;
> >>>     #size-cells =3D <0>;
> >>
> >> Same for these.
> >
> > These are required, and always have the same values, so it makes more
> > sense to have them in the SoC .dtsi file, once.
>
> I remember I had a compilation warning with an Ethernet controller
> configured with fixed-link having #address-cells, #size-cells. With
> fixed-link these were not needed.

I think EtherAVB always use MDIO for management, so fixed-link is
not applicable.

> Anyway... I'll keep all in dtsi if you prefer it this way.

Yes please, thanks!

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

