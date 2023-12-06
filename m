Return-Path: <linux-gpio+bounces-1059-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D0C806E0D
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Dec 2023 12:33:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B70E7281B55
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Dec 2023 11:33:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E1E131A93;
	Wed,  6 Dec 2023 11:33:03 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 377A218D;
	Wed,  6 Dec 2023 03:33:00 -0800 (PST)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-77bcbc14899so447307685a.1;
        Wed, 06 Dec 2023 03:33:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701862379; x=1702467179;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b6xQ+cbLe1qqWlxYHut3u2iz76MLl7b5kqAg1yUNs7s=;
        b=UUSm8PtknUvOz0FJqSLyThRzn4GolchngZXhPKE+rOwwXY+EIPMLgfYIlsJc9nqAAT
         2ZY2+dB3lLbZndsE4wLqnvKfshUxiL7GszLJ5ROGwizQ6FjxXCIqChzPAuA6/bOMlmvG
         TG+TcVjPc4UUpsP+szHlojPsozJk17R4OGZNHIVdQCcCwlL8POM9hdPJrSVQMyBlk9xn
         eUK9iUQdBei13fW7jGZPe6l63LrWog1VUtTm2UUqL/78M8GHxh/EdEHi6UTzSfgrtfDT
         iPgOBz3+xXIaPDHYS5QKodJ4/KIIbha5zBLIoHlz++H3wLaVx7TG2HDKf0c28g+Ozgvx
         oYeQ==
X-Gm-Message-State: AOJu0YwC4+IpOiObq0Ga/z+UsEYmBLsFQ32ZM07L7dzEqSfFroqJ3zzt
	JOedO28G1ePvMITAw3zJErFCZOXxaHAEIw==
X-Google-Smtp-Source: AGHT+IGr2lrecMk+lIhfSJy8RHAvh+9FDs6uD0EReZQDutkuAEsLnmMLIuxVOa/PEgnprIyWpFFGjQ==
X-Received: by 2002:a05:620a:2287:b0:77f:389:21a8 with SMTP id o7-20020a05620a228700b0077f038921a8mr680998qkh.126.1701862378973;
        Wed, 06 Dec 2023 03:32:58 -0800 (PST)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com. [209.85.222.176])
        by smtp.gmail.com with ESMTPSA id j5-20020a05620a288500b0077d8526bcdesm5798759qkp.86.2023.12.06.03.32.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Dec 2023 03:32:58 -0800 (PST)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-77f347b0299so11531285a.3;
        Wed, 06 Dec 2023 03:32:58 -0800 (PST)
X-Received: by 2002:a05:690c:3604:b0:5d7:9b1c:a779 with SMTP id
 ft4-20020a05690c360400b005d79b1ca779mr596351ywb.9.1701862046919; Wed, 06 Dec
 2023 03:27:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231120070024.4079344-1-claudiu.beznea.uj@bp.renesas.com>
 <20231120070024.4079344-12-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdUbKe=yiXWNmk5BJFLtF2psx9khiDRGasT9WsnHz4RWsg@mail.gmail.com>
 <CAMuHMdXwSo1L9UuFg9RL0TLL_xzVt2r6QEFc0gtPoydpr4FmSQ@mail.gmail.com> <248d24a9-589e-4b92-94b6-98504f78d7b9@tuxon.dev>
In-Reply-To: <248d24a9-589e-4b92-94b6-98504f78d7b9@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 Dec 2023 12:27:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXo9Pj1NJ+XK-XKj18ynZ3gOxrXQpjMsTjfziTAyjYMdA@mail.gmail.com>
Message-ID: <CAMuHMdXo9Pj1NJ+XK-XKj18ynZ3gOxrXQpjMsTjfziTAyjYMdA@mail.gmail.com>
Subject: Re: [PATCH 11/14] arm64: renesas: rzg3s-smarc-som: Invert the logic
 for SW_SD2_EN macro
To: claudiu beznea <claudiu.beznea@tuxon.dev>
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

On Wed, Dec 6, 2023 at 12:12=E2=80=AFPM claudiu beznea <claudiu.beznea@tuxo=
n.dev> wrote:
> On 06.12.2023 12:56, Geert Uytterhoeven wrote:
> > On Wed, Dec 6, 2023 at 11:33=E2=80=AFAM Geert Uytterhoeven <geert@linux=
-m68k.org> wrote:
> >> On Mon, Nov 20, 2023 at 8:03=E2=80=AFAM Claudiu <claudiu.beznea@tuxon.=
dev> wrote:
> >>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >>>
> >>> The intention of SW_SD2_EN macro was to reflect the state of SW_CONFI=
G3
> >>> switch available on RZ/G3S Smarc Module. According to documentation S=
D2
> >>> is enabled when switch is in OFF state. For this, changed the logic o=
f
> >>> marco to map value 0 to switch's OFF state and value 1 to switch's ON
> >>> state. Along with this update the description for each state for bett=
er
> >>> understanding.
> >>>
> >>> The value of SW_SD2_EN macro was not changed in file because, accordi=
ng to
> >>> documentation, the default state for this switch is ON.
> >>>
> >>> Fixes: adb4f0c5699c ("arm64: dts: renesas: Add initial support for RZ=
/G3S SMARC SoM")
> >>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >>
> >> Thanks for your patch!
> >>
> >>> --- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
> >>> +++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
> >>> @@ -14,8 +14,8 @@
> >>>   *     0 - SD0 is connected to eMMC
> >>>   *     1 - SD0 is connected to uSD0 card
> >>>   * @SW_SD2_EN:
> >>> - *     0 - SCIF1, SSI0, IRQ0, IRQ1 connected to SoC
> >>> - *     1 - SD2 is connected to SoC
> >>> + *     0 - (switch OFF) SD2 is connected to SoC
> >>> + *     1 - (switch ON)  SCIF1, SSI0, IRQ0, IRQ1 connected to SoC
> >>
> >> I think this is still confusing: SW_SD2_EN refers to an active-low sig=
nal
> >> (SW_SD2_EN#) in the schematics.
> >
> > OMG, while the signal is called "SW_SD2_EN#" in the schematics, it is
> > _not_ active-low!
> > SW_D2_EN# drives a STG3692 quad SPDT switch, and SD2 is enabled
> > if SW_D2_EN# is high...
> >
> > The RZ/G3S SMARC Module User Manual says:
> >
> > Signal SW_SD2_EN ON: SD2 is disabled.
> > Signal SW_SD2_EN OFF: SD2 is enabled.
>
> I followed the description in this manual, chapter 2.1.1 SW_CONFIG. The
> idea was that these macros to correspond to individual switches, to match
> that table (describing switches position) with this code as the user in t=
he
> end sets those switches described in table at 2.1.1 w/o necessary going
> deep into schematic (at least in the beginning when trying different
> functionalities).
>
> Do you think it would be better if we will have these macros named
> SWCONFIGX, X in {1, 2, 3, 4, 5, 6} ?

Perhaps. A disadvantage would be that SW_CONFIG%u doesn't
give any indication about its purpose...

> > So whatever we do, something will look odd :-(
> >
> >> Before, SW_SD2_EN used assertion-logic (1 is enabled), and didn't
> >> match the physical signal level.
> >> After your patch, SW_SD2_EN matches the active-low physical level, but
> >> this is not reflected in the name...
> >>
> >>>   */
> >>>  #define SW_SD0_DEV_SEL 1
> >>>  #define SW_SD2_EN      1
> >>> @@ -25,7 +25,7 @@ / {
> >>>
> >>>         aliases {
> >>>                 mmc0 =3D &sdhi0;
> >>> -#if SW_SD2_EN
> >>> +#if !SW_SD2_EN
> >>
> >> ... so this condition looks really weird.
> >
> > Still, I think the original looks nicer here.
> >
> > So I suggest to keep the original logic, but clarify the position of
> > the switch.
> > Does that make sense?
>
> It will still be odd, AFAICT, as this way as we will map 0 to ON and 1 to
> OFF... A bit counterintuitive.

Most switches on board pull signals LOW when the switch is ON...

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

