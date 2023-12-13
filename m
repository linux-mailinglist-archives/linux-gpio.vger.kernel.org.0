Return-Path: <linux-gpio+bounces-1364-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 476E38113CF
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 14:57:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F2E53281D47
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 13:57:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 462552E417;
	Wed, 13 Dec 2023 13:56:59 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D2C010C8;
	Wed, 13 Dec 2023 05:56:34 -0800 (PST)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-5d7a47d06eeso69614617b3.1;
        Wed, 13 Dec 2023 05:56:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702475793; x=1703080593;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pNM6E8+SHt9X2piL1ip1N/9u4xOKhbMUn9SjgcJ1jCM=;
        b=GoelHr3VPtAxE8od0om2X+8c7bNvjDbs78pBSVuuoYP7fzW0pk90mRKq6bbDPyIK8h
         DvOfx5ia037aQtVFR1hb94h5CV/khu8BTDhboM4q6o/FZxJE0UJa3TMRdKiCiEM8mZnY
         0KUDzVoaFWllNXlVckI8g/uVZZw50u5hmB9GGLGsKJzL/8hvWwc8+UGGoArQuR71N5LG
         Tk2PrYi7nac5f11M6KEDkjf4+oNRDwDS5WtQ4NYdWIgD9YmI8khyPOD6cWVAxrA5SG9o
         UkSMKXEuOCmlcyDGjBFFRWSQQU1aVp+0eLRu9JC1jb4XFelVzgKswa4QmEq2QCbSpfjH
         HQiQ==
X-Gm-Message-State: AOJu0YzJ/hhU+BU+PdRVFi7x/w7cmR5omj3fB5P1IAPR4YqNBooBNJAH
	xMvEKM5xxkxDXXpCuCWSg4UYZUs452kKsQ==
X-Google-Smtp-Source: AGHT+IHgR2J5J4CA3jieTuP7YbzbcydKcJFpyeci91lO7wJZz596yV2HxItX28hI6rkj5UryzWpURw==
X-Received: by 2002:a05:690c:2787:b0:5d7:1940:f3f2 with SMTP id dz7-20020a05690c278700b005d71940f3f2mr4373683ywb.90.1702475793228;
        Wed, 13 Dec 2023 05:56:33 -0800 (PST)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id i129-20020a0dc687000000b005463e45458bsm4678994ywd.123.2023.12.13.05.56.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Dec 2023 05:56:32 -0800 (PST)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-5e248b40c97so14194527b3.2;
        Wed, 13 Dec 2023 05:56:32 -0800 (PST)
X-Received: by 2002:a81:df0f:0:b0:5d7:1940:f3cf with SMTP id
 c15-20020a81df0f000000b005d71940f3cfmr5689752ywn.55.1702475792558; Wed, 13
 Dec 2023 05:56:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231207070700.4156557-1-claudiu.beznea.uj@bp.renesas.com> <20231207070700.4156557-7-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20231207070700.4156557-7-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 13 Dec 2023 14:56:21 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU02=qcsX8kn0b=qMGCry1gLMjhQzht265_N8CbgJ1bEw@mail.gmail.com>
Message-ID: <CAMuHMdU02=qcsX8kn0b=qMGCry1gLMjhQzht265_N8CbgJ1bEw@mail.gmail.com>
Subject: Re: [PATCH v2 06/11] pinctrl: renesas: rzg2l: Add output enable support
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
> Some of the Ethernet pins on RZ/G3S (but also valid for RZ/G2L) need to
> have the direction of the IO buffer set as output for Ethernet to work
> properly. On RZ/G3S, these pins are P1_0/P7_0, P1_1/P7_1 which could have
> the following Ethernet functions: TXC/TX_CLK or TX_CTL/TX_EN.
>
> As the pins supporting output enable are SoC specific and there is a
> limited number of these pins (TXC/TX_CLK and/or TX_CTL/TX_EN), for proper
> validation the output enable capable port limits were specified on
> platform-based configuration data structure.
>
> The OEN support has been intantiated for RZ/G3S at the moment.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v2:
> - use 8 bit helpers to get/set value of output enable register
> - adapted to code to work for both RZ/G2L based devices and RZ/G3S
> - removed IEN capability for Ethernet pins and added it in a separate
>   patch (patch 07/12)

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

