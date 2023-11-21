Return-Path: <linux-gpio+bounces-326-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 728D67F33B4
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Nov 2023 17:29:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D3764B21E16
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Nov 2023 16:29:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1B895A11B;
	Tue, 21 Nov 2023 16:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9D5B197;
	Tue, 21 Nov 2023 08:29:35 -0800 (PST)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-5cbf946a6f3so4159597b3.2;
        Tue, 21 Nov 2023 08:29:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700584175; x=1701188975;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mxHuohagQtGVaCTwDHZT0rRlGCapRZ5dBubyNC4XBAI=;
        b=wD3rjvABqZ0mEfUikMZgxtCgX+Y12GROjaRorORq4C4LRfLoOyqIlJ3YiBpBpkmM1j
         UenQLDqUt7EdApTW5Q79wdvzdf3tw8X/OogzlXydiFCgjmtmPj/r7uyJPqzTG6ez16AA
         LwB2XFzFGBOjr+8w1hi9TNAlCOPkfoTSU+G4IjjaMFWGLeCu9yqPKZLEQ9boMHceUG0t
         kwvRk/6cxKLOZOMR6EODlnPiPWqKSrZjBQLolwMwbGHXF2kfC1Fp2M4y5zYQ6rOjQEBS
         2PxurnsjEQcb2eKGQPDphc20QhM/XjCB45Bb3DQsoNSlR1Lso5zC7O9VcDWTXIsFFu78
         yuhQ==
X-Gm-Message-State: AOJu0YwSTWcSfcPlechKhl5kWcJGmOXUdnzXWrcbAozL8VJ3hjQj4g1t
	EyO4ODLkD4a+MJCb51kpmhxKA+gTN1o3aeMq
X-Google-Smtp-Source: AGHT+IETDdt4IEzFwkdNwFBhLqICCRw+X+4jp5GQEa4bi3FLMJAqg+VD6URF53k4RGJ1wQzCLW3Miw==
X-Received: by 2002:a81:c246:0:b0:5b3:23f7:4254 with SMTP id t6-20020a81c246000000b005b323f74254mr12006517ywg.25.1700584174938;
        Tue, 21 Nov 2023 08:29:34 -0800 (PST)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id n3-20020a0dfd03000000b005a7bb193b37sm3106395ywf.27.2023.11.21.08.29.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Nov 2023 08:29:33 -0800 (PST)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-5cb96ef7ac6so8835107b3.3;
        Tue, 21 Nov 2023 08:29:31 -0800 (PST)
X-Received: by 2002:a81:b149:0:b0:5ca:c5e9:938b with SMTP id
 p70-20020a81b149000000b005cac5e9938bmr5565031ywh.1.1700584171136; Tue, 21 Nov
 2023 08:29:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231120070024.4079344-1-claudiu.beznea.uj@bp.renesas.com> <20231120070024.4079344-10-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20231120070024.4079344-10-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 21 Nov 2023 17:29:18 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUr8bqQvJE78zMHb2sqQCnTZSZhcMef1x6DgXmUhdTWqg@mail.gmail.com>
Message-ID: <CAMuHMdUr8bqQvJE78zMHb2sqQCnTZSZhcMef1x6DgXmUhdTWqg@mail.gmail.com>
Subject: Re: [PATCH 09/14] dt-bindings: net: renesas,etheravb: Document RZ/G3S support
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

On Mon, Nov 20, 2023 at 8:01=E2=80=AFAM Claudiu <claudiu.beznea@tuxon.dev> =
wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Document Ethernet RZ/G3S support. Ethernet IP is similar to the one
> available on RZ/G2L devices.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

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

