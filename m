Return-Path: <linux-gpio+bounces-1359-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21ECC8112DD
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 14:29:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A6ABBB20FA4
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 13:29:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A8392D042;
	Wed, 13 Dec 2023 13:29:03 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C242795;
	Wed, 13 Dec 2023 05:29:00 -0800 (PST)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-5d3644ca426so67804757b3.1;
        Wed, 13 Dec 2023 05:29:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702474140; x=1703078940;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T1lNqD1L6tZtJl+KRYDU2cXw+VOrpfjYLm5vnacweRg=;
        b=AMLF+MnZ0fta1kloYIZqDwrsFufWgdctfINdKpx9PZdo6h9TU/hYK8nc3dttgLvSZs
         c0PyxbUI/24gHSHCYyItIrGxicQnX/2Xk/EkO0jJRG/3dTUu4KjUAqKnfwiJ9VZShzgY
         JO020ATq47DORFi6Mvu+9fk8Z9xQl3cv6a2kco1wwHZkyfuRsnjnBZn98PPh0v3k/z9q
         sTCdyZAdOh49iJeR9wQOl4i7YUvbn5SSF7fi9needv2Y5qsh87Abo8REFHgFP/bXZYbF
         IAo04FZmpxarWbcX5pzAU74aXs8+OFP8k9BU6kiP9yCj7aW4cKp6506XusckjL0I9kaj
         APSg==
X-Gm-Message-State: AOJu0YxTjNEbxaTAPn0/+4X2fFBk5ndwURZwoWH/Jv+75KK0IdI9Gq/Q
	AIrjIAtPkcn4WObMtlAXokxM08MvWHaZcw==
X-Google-Smtp-Source: AGHT+IEJKsvHdkmUWpfDYcgnDunaDPSmPnxH9GWCsGLbJxiqiVQQANuFPPBW1+S2+YkjlFdV3+FAIw==
X-Received: by 2002:a81:9290:0:b0:5e2:2e4c:e16f with SMTP id j138-20020a819290000000b005e22e4ce16fmr2204736ywg.13.1702474139841;
        Wed, 13 Dec 2023 05:28:59 -0800 (PST)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id x199-20020a81a0d0000000b005e2f116e2f5sm299945ywg.32.2023.12.13.05.28.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Dec 2023 05:28:58 -0800 (PST)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-db4422fff15so5719993276.1;
        Wed, 13 Dec 2023 05:28:58 -0800 (PST)
X-Received: by 2002:a25:b122:0:b0:db7:dad0:76e6 with SMTP id
 g34-20020a25b122000000b00db7dad076e6mr4302665ybj.130.1702474138709; Wed, 13
 Dec 2023 05:28:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231207070700.4156557-1-claudiu.beznea.uj@bp.renesas.com> <20231207070700.4156557-3-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20231207070700.4156557-3-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 13 Dec 2023 14:28:47 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXozONJDiWVHUGPCwNdJq0q2TaVwBtqO9E5OCQBaWi1Ow@mail.gmail.com>
Message-ID: <CAMuHMdXozONJDiWVHUGPCwNdJq0q2TaVwBtqO9E5OCQBaWi1Ow@mail.gmail.com>
Subject: Re: [PATCH v2 02/11] clk: renesas: r9a08g045-cpg: Add clock and reset
 support for ETH0 and ETH1
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

On Thu, Dec 7, 2023 at 8:08=E2=80=AFAM Claudiu <claudiu.beznea@tuxon.dev> w=
rote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> RZ/G3S has 2 Gigabit Ethernet interfaces available. Add clock and reset
> support for both of them.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v2:
> - dropped MSTOP

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v6.8.

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

