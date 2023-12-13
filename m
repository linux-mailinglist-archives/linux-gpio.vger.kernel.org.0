Return-Path: <linux-gpio+bounces-1362-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E7C811332
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 14:43:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 467741C20FF1
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 13:43:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A62A2D62B;
	Wed, 13 Dec 2023 13:43:32 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A8D0101;
	Wed, 13 Dec 2023 05:43:29 -0800 (PST)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-5d8d2b5d1b5so47787747b3.0;
        Wed, 13 Dec 2023 05:43:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702475008; x=1703079808;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NF7SpEIkXNopAQR1vCI++5qhTFUAvECcT+HygO/vLhU=;
        b=JD1VxZOh6SIUVrvK50pRgXh4RAvOgWz9QXAv/Te3s126jIX1efV9D/ukTtpH6D8iaz
         ecUr/Wl9qsxTnKqaaIB4TrsSKbJMV/DEO3yePYrEI+KGod10OokTvFfT5Xd79i4Vnxhd
         H1V4Z9WHoA7xj4jEwo4dAfItM6q4tsu5zGJtGEGqfth5MMEskV0vOiBBIPNPsiNBGsec
         4aOoKwYrHfub3uzYKov6+BqKW3UB1ijmjwr/XlAC/r97yRsCr9YIHB2qt6XH/H0BLxsA
         njM8kC7LWEPKK22Z+Gq/i1qYkG38QXC9VPJO1TKDoI+qQM8bLlOljts4SctRvb+68IjD
         kIig==
X-Gm-Message-State: AOJu0YxScikeU1wS3fZAlllLvWXX1pmaEk3mpuJrRa9wbw8T4TMOk/Wl
	+kaKJAghncGgTRFv1XJUYP5ME+Vhe9rOUg==
X-Google-Smtp-Source: AGHT+IE3Qofo6Slm+LGXbe9MAwM4KRx4Xp2ppEPSh1/PglB9KFGZ3aCdFTiCfdzIc3R/FypOQWGU9g==
X-Received: by 2002:a0d:c345:0:b0:5d7:1940:8dea with SMTP id f66-20020a0dc345000000b005d719408deamr3983419ywd.81.1702475008425;
        Wed, 13 Dec 2023 05:43:28 -0800 (PST)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id f68-20020a0ddc47000000b005d16b6edfffsm4659889ywe.120.2023.12.13.05.43.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Dec 2023 05:43:27 -0800 (PST)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-d9b9adaf291so5001821276.1;
        Wed, 13 Dec 2023 05:43:27 -0800 (PST)
X-Received: by 2002:a05:6902:1a45:b0:da0:3b6c:fc22 with SMTP id
 cy5-20020a0569021a4500b00da03b6cfc22mr3918042ybb.31.1702475006909; Wed, 13
 Dec 2023 05:43:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231207070700.4156557-1-claudiu.beznea.uj@bp.renesas.com> <20231207070700.4156557-5-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20231207070700.4156557-5-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 13 Dec 2023 14:43:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV15T+c2idSEeWX7_kdLXs0tLURxDs0_f86DE8MLE+6ng@mail.gmail.com>
Message-ID: <CAMuHMdV15T+c2idSEeWX7_kdLXs0tLURxDs0_f86DE8MLE+6ng@mail.gmail.com>
Subject: Re: [PATCH v2 04/11] pinctrl: renesas: rzg2l: Add pin configuration
 support for pinmux groups
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: s.shtylyov@omp.ru, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	mturquette@baylibre.com, sboyd@kernel.org, linus.walleij@linaro.org, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, biju.das.jz@bp.renesas.com, 
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Claudiu,

On Thu, Dec 7, 2023 at 8:08=E2=80=AFAM Claudiu <claudiu.beznea@tuxon.dev> w=
rote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> On RZ/G3S different Ethernet pins need to be configured with different
> settings (e.g., power-source needs to be set, RGMII TXC and TX_CTL pins
> need output-enable). Commit adjust driver to allow specifying pin
> configuration for pinmux groups. With this, DT settings like the followin=
g
> are taken into account by driver:
>
> eth0_pins: eth0 {
>         tx_ctl {
>                 pinmux =3D <RZG2L_PORT_PINMUX(1, 1, 1)>;  /* ET0_TX_CTL *=
/
>                 power-source =3D <1800>;
>                 output-enable;
>                 drive-strength-microamp =3D <5200>;
>         };
> };
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>
> Changes in v2:

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl-for-v6.8.

> - moved num_configs check under num_pinmux check as suggested

Actually my comment was wrong, as I had misunderstood the code flow
("goto done") in case num_pins is non-zero.

I will revert to v1 while queuing in renesas-pinctrl-for-v6.8.

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

