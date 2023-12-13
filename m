Return-Path: <linux-gpio+bounces-1363-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B3AB1811346
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 14:47:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F8121F217CC
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 13:47:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16BB62D781;
	Wed, 13 Dec 2023 13:46:54 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41985B2;
	Wed, 13 Dec 2023 05:46:51 -0800 (PST)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-da077db5145so5753191276.0;
        Wed, 13 Dec 2023 05:46:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702475210; x=1703080010;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6f0aX6F0PLvtVg2TcWf9VRPha1R8pflF1aDUZgJex4I=;
        b=A5pDVC+IWh5LeZsBh6lBqqcKoR1/vEEgOmkTq3xispZSpcRrXQKB+pNv/ZVbgJ6+Bl
         SmNAFN8sfL6+FebdzUOXfI+vrsYWxWXuYyNo1lFwJBJWxJsAv1zvy2JBlCUzR2FLLt3L
         BSBn/SeKrj2CBmEO9UCTy9NE08qRWX/bVJ62g3d8XGAoyNGMHknPzkRv6g7Fs0ubPNCl
         rpBrFJBGvotFvm6ibvO+sVCb7tXBLf+kkJVQbu6W/KiXxGNfgtFfVhkAXJhS6wZeuAfU
         qy+LZb+ERBQmUqLaTHz4tIretTxsUIfBgoOjikJYM1h9AcUVtRZvkIOAlactw7Pe19v+
         UKpQ==
X-Gm-Message-State: AOJu0Yyw6W2GMj2eYr+Cs0PM5f4f9EIpMlAhEH7bloaXvUgzB8TyV1yV
	J07JryH93HSlewUo2fjSdei7tMG62bOJjQ==
X-Google-Smtp-Source: AGHT+IGThthHytDv5aTTKd2JXrvzIsiB5sfzv3nUUC3ZDETO3hKN5SMX9M36a2z/Zdchm/eloaLBQg==
X-Received: by 2002:a05:6902:4f4:b0:dbc:d8cd:d9 with SMTP id w20-20020a05690204f400b00dbcd8cd00d9mr314632ybs.55.1702475210305;
        Wed, 13 Dec 2023 05:46:50 -0800 (PST)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id v187-20020a2548c4000000b00db3fa34142bsm4028960yba.49.2023.12.13.05.46.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Dec 2023 05:46:50 -0800 (PST)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-da077db5145so5753183276.0;
        Wed, 13 Dec 2023 05:46:50 -0800 (PST)
X-Received: by 2002:a5b:309:0:b0:db7:dad0:76c8 with SMTP id
 j9-20020a5b0309000000b00db7dad076c8mr5359241ybp.100.1702475209930; Wed, 13
 Dec 2023 05:46:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231207070700.4156557-1-claudiu.beznea.uj@bp.renesas.com> <20231207070700.4156557-6-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20231207070700.4156557-6-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 13 Dec 2023 14:46:38 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUmFa8LZXqzFFy-WOspJA_ODs=zRtPAjQo+e5jxCd=6FQ@mail.gmail.com>
Message-ID: <CAMuHMdUmFa8LZXqzFFy-WOspJA_ODs=zRtPAjQo+e5jxCd=6FQ@mail.gmail.com>
Subject: Re: [PATCH v2 05/11] pinctrl: renesas: rzg2l: Add support to select
 power source for Ethernet pins
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
> The GPIO controller available on RZ/G3S (but also on RZ/G2L) allows setti=
ng
> the power source for Ethernet pins. Based on the interface b/w the Ethern=
et
> controller and the Ethernet PHY and board design specific power source ne=
ed
> to be selected. The GPIO controller allows 1.8V, 2.5V and 3.3V power sour=
ce
> selection for Ethernet pins. This could be selected though ETHX_POC
> registers (X=3D{0, 1}).
>
> Commit adjust the driver to support this and does proper instantiation fo=
r
> RZ/G3S and RZ/G2L SoC. On RZ/G2L only get operation has been tested at th=
e
> moment.
>
> While at it, as the power registers on RZ/G2L support access sizes of 8
> bits and RZ/G3S support access sizes of 8/16/32 bits, changed
> writel()/readl() on these registers with writeb()/readb(). This should
> allow using the same code for both SoCs w/o any issues.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v2:
> - removed PVDD_MASK
> - use 8 bit helpers to get/set value of power register
> - replaced if/else with switch/case everywhere

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl-for-v6.8.

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

