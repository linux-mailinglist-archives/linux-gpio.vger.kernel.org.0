Return-Path: <linux-gpio+bounces-1055-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 127E3806D46
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Dec 2023 12:04:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B3A8E1F216F5
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Dec 2023 11:04:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BE0B30F95;
	Wed,  6 Dec 2023 11:04:20 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A53F2D64;
	Wed,  6 Dec 2023 03:03:38 -0800 (PST)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-5d3efc071e2so61083137b3.0;
        Wed, 06 Dec 2023 03:03:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701860606; x=1702465406;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dVVREpeNBksiVzen2ZqgrQY7HZ3YW+vcOqMYYYjnJRc=;
        b=HpzMhqvRtcgKQV1bMsK9/EK1usIc1FOxaaNKDW4BSgMWweGdat+oCxQEwlCN1lW36g
         Ie9b7GP0zYgQ/AghSQ06exNW3b1Ty2Ns95sNEARrveXkCI+O1jE+/VRyK7y37RtWHHkI
         4AGDukpD5oqM12gMyD9+f75SlcoLtRopY/YhmpKuc8fYG85kDez8XFU6qfYfXnu26DDS
         TBUtwEudfCu2qyDKT3NtTie3CIB/DuZaywC2Zk13Qd9xLJ13ooucyyE+TkAAOHepClmx
         hL3JGMND5pIoJsw/lXoAGqzYDi6NjIZHBIp2MbkAMzV7bEFlu7qMIuwQFE8jG7Ol5D0J
         rt3w==
X-Gm-Message-State: AOJu0YyIrVYV/XTqJhiD4rdCBUNpDAE8JYSOAuTUhNCtJm9sBYINiwFP
	FeWMfjKJS2uQZn9ma/osR99MPCK807gNUQ==
X-Google-Smtp-Source: AGHT+IGG2chzZi55SmELOQzXjX9bd1TZrzeA0mEjt+D6WXX+5jYSxL9Dvx0HlQ5Rz4ISa7+d4inDwg==
X-Received: by 2002:a81:49d4:0:b0:5d3:e2a2:8bcd with SMTP id w203-20020a8149d4000000b005d3e2a28bcdmr539979ywa.5.1701860606103;
        Wed, 06 Dec 2023 03:03:26 -0800 (PST)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id l6-20020a0dc906000000b005add997ae53sm3940442ywd.81.2023.12.06.03.03.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Dec 2023 03:03:25 -0800 (PST)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-db3a09e96daso5427460276.3;
        Wed, 06 Dec 2023 03:03:25 -0800 (PST)
X-Received: by 2002:a81:ae5a:0:b0:5d7:1941:2c23 with SMTP id
 g26-20020a81ae5a000000b005d719412c23mr477831ywk.80.1701860605566; Wed, 06 Dec
 2023 03:03:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231120070024.4079344-1-claudiu.beznea.uj@bp.renesas.com> <20231120070024.4079344-13-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20231120070024.4079344-13-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 Dec 2023 12:03:14 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWa9wSDfwrz=WSpa9S16BnMCJHdEiJSNFB2m8gr_p8z9g@mail.gmail.com>
Message-ID: <CAMuHMdWa9wSDfwrz=WSpa9S16BnMCJHdEiJSNFB2m8gr_p8z9g@mail.gmail.com>
Subject: Re: [PATCH 12/14] arm64: dts: renesas: Improve documentation for SW_SD0_DEV_SEL
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

On Mon, Nov 20, 2023 at 8:03=E2=80=AFAM Claudiu <claudiu.beznea@tuxon.dev> =
wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Add switch OFF/OFF description to values of SW_SD0_DEV_SEL for
> better understanding.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
> @@ -11,8 +11,8 @@
>  /*
>   * Signals of SW_CONFIG switches:
>   * @SW_SD0_DEV_SEL:
> - *     0 - SD0 is connected to eMMC
> - *     1 - SD0 is connected to uSD0 card
> + *     0 - (switch OFF) SD0 is connected to eMMC
> + *     1 - (switch ON)  SD0 is connected to uSD0 card
>   * @SW_SD2_EN:
>   *     0 - (switch OFF) SD2 is connected to SoC
>   *     1 - (switch ON)  SCIF1, SSI0, IRQ0, IRQ1 connected to SoC

I guess this makes sense
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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

