Return-Path: <linux-gpio+bounces-1367-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E106C8113DD
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 14:58:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 74178B20CA0
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 13:58:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33CBB2E62E;
	Wed, 13 Dec 2023 13:57:55 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05B4A1FF3;
	Wed, 13 Dec 2023 05:57:51 -0800 (PST)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-5e309941f46so3397827b3.3;
        Wed, 13 Dec 2023 05:57:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702475870; x=1703080670;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UkSaEpyh42RBZh83DgNkq5VoFb5r0mvpA7lmVJ1rqEI=;
        b=q9z8FKLpB/NgUWsfXA46Ep/grVGRLjskqXzYMlfTiDqxM4NuRcD5siSNRV5W8f1cY9
         Zhqj3Wwowkc2lioKhKfxIoSLjTkonDi5vBV76kppAVmUanqblYStatu5DTbWH3NsSMcQ
         erS8QhZGewDmE7IwPVx/A5B99fbt0TKLNPN3z79ucIPDyG5lE9jc0IarcaoHmVSrFvye
         ZYuvVpjxZdNWyEiHq/92drlCVs7joXGvRCcVyXQ5Xe0X8e/ewCZM6KEO4PIinZjBEwdD
         hDwyVBKDaWG0AQ5C2j2wIPaImdYdcCt7J122aXmrGx7CB0qNNVUh3AGtNOLu2C/tIENL
         31Hg==
X-Gm-Message-State: AOJu0Yx5D6TB2oh8HDJYnUvfT4pwSSjpbLNk9RYsQzQWCxnjOc7Jxr5j
	36aR8L357JyLP7VR1iXkXsH5fV/ixKx6BA==
X-Google-Smtp-Source: AGHT+IE3TkxpPrX3EgfZG512Q467HHxUgYSxFWnyP+k7NS0M4fXO+aBetnbJWwZrLPoLbRxwSXaixQ==
X-Received: by 2002:a05:690c:4605:b0:5e1:7129:7cc3 with SMTP id gw5-20020a05690c460500b005e171297cc3mr3098646ywb.26.1702475869729;
        Wed, 13 Dec 2023 05:57:49 -0800 (PST)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id j68-20020a0df947000000b005b37c6e01f9sm4708827ywf.90.2023.12.13.05.57.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Dec 2023 05:57:49 -0800 (PST)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-5c08c47c055so68270887b3.1;
        Wed, 13 Dec 2023 05:57:49 -0800 (PST)
X-Received: by 2002:a0d:f6c6:0:b0:5e2:5d71:56c with SMTP id
 g189-20020a0df6c6000000b005e25d71056cmr1895352ywf.32.1702475868892; Wed, 13
 Dec 2023 05:57:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231207070700.4156557-1-claudiu.beznea.uj@bp.renesas.com> <20231207070700.4156557-8-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20231207070700.4156557-8-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 13 Dec 2023 14:57:37 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVhMB6_WPwLP=RwP7nkjXovkrb+qY6g3HFTDtyS=pq9Gg@mail.gmail.com>
Message-ID: <CAMuHMdVhMB6_WPwLP=RwP7nkjXovkrb+qY6g3HFTDtyS=pq9Gg@mail.gmail.com>
Subject: Re: [PATCH v2 07/11] pinctrl: renesas: rzg2l: Add input enable to the
 Ethernet pins
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
> Some of the RZ/G3S Ethernet pins (P1_0, P7_0) could be configured with
> input enable. Enable this functionality for these pins.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v2:
> - this patch is new in v2

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

