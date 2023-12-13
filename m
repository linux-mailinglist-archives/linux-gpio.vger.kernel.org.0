Return-Path: <linux-gpio+bounces-1368-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4A38113F7
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 15:01:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 33EBD1F21D0C
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 14:01:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22F1E2E63C;
	Wed, 13 Dec 2023 14:01:09 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5091CDC;
	Wed, 13 Dec 2023 06:01:05 -0800 (PST)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-dbcc63b7c68so1274186276.1;
        Wed, 13 Dec 2023 06:01:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702476064; x=1703080864;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LMmwUrV5CRxo8tqF2JhkTTOms97Pc/NRUWXWg3QDi0I=;
        b=t9hy22/LqXxW7CDjRuL+tUmkeA3G0fIoBOAJ1xBVZBaecQnU6XMFbsfwl8rmiLDzbv
         XI4uzmqDaqkxMA0688hzM5fo2D+OWZv/ctMbwm2PalMcMl27IuvkB2yZSDiqHf2DMuXR
         KOyLKxnC2iXOjZdonlUjcoGr5TADkMp5V5CXxY76WNSsLRyBS5RKi2Ib1P8j8ujL6iXJ
         FT86fsePifCYQ2BBelvhBuofVKUgEkf4DxjR9vRPNWfrkEHJ2b6RsIOEuChwVtRuQr67
         TlIGZxDbnwviesSvgLEBupnKGImBNo3Y9J2+/X542MjVsZa8RJAoUqHACvZ2OEZJzrSp
         3ZOw==
X-Gm-Message-State: AOJu0Yxv3lVHAUCbvQq/7+5ZTiYNf0/JK5/fOJFWE4OxEl3xwFNqZu02
	l4Y2vVq17+WYQQW6jJtsbmzPKzyGTaK8/A==
X-Google-Smtp-Source: AGHT+IHU5dpCs/G2K+qi63p2PFcNo/f8adtTk2eu8lutu1dnCSYMF2ZPuD1wPSePhTctkUvdXXTm7w==
X-Received: by 2002:a5b:7c6:0:b0:db5:4dc4:13e6 with SMTP id t6-20020a5b07c6000000b00db54dc413e6mr4897781ybq.32.1702476064311;
        Wed, 13 Dec 2023 06:01:04 -0800 (PST)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id p13-20020a259e8d000000b00da082362238sm3971826ybq.0.2023.12.13.06.01.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Dec 2023 06:01:03 -0800 (PST)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-5df49931b4eso46933187b3.0;
        Wed, 13 Dec 2023 06:01:03 -0800 (PST)
X-Received: by 2002:a0d:cb0c:0:b0:5e2:bd18:b253 with SMTP id
 n12-20020a0dcb0c000000b005e2bd18b253mr888130ywd.24.1702476063304; Wed, 13 Dec
 2023 06:01:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231207070700.4156557-1-claudiu.beznea.uj@bp.renesas.com> <20231207070700.4156557-10-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20231207070700.4156557-10-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 13 Dec 2023 15:00:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU+7RsiKhCidRJaCk_wMQbovqbGtn0qF63RzXEq3SQVWw@mail.gmail.com>
Message-ID: <CAMuHMdU+7RsiKhCidRJaCk_wMQbovqbGtn0qF63RzXEq3SQVWw@mail.gmail.com>
Subject: Re: [PATCH v2 09/11] arm64: renesas: r9a08g045: Add the Ethernet nodes
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
> Add the Ethernet nodes available on RZ/G3S (R9A08G045).
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v2:
> - added phy-mode =3D "rgmii" and #address-cells, #size-cells for both
>   Ethernet nodes

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.8.

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

