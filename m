Return-Path: <linux-gpio+bounces-27842-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3427FC1BB8B
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 16:40:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8A00A5C09F2
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 14:47:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 498DB32F774;
	Wed, 29 Oct 2025 14:40:14 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8843B2C11E4
	for <linux-gpio@vger.kernel.org>; Wed, 29 Oct 2025 14:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761748814; cv=none; b=PAAxOexGoaADbNj0aR3qD2gDJZOVsWbD5FkpJonw2E1b+97vnVbB+AIRROB4iUN7QBL+kJkct8IodCYRe4LHTK9fwFgnPhXkk3JCsY18SqpI6SdUue7CFZk93cVqA/drpesy1fvXeAEkyxi2AZtfEJUpuAVx3j6/7h17TIKbv64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761748814; c=relaxed/simple;
	bh=QXFJ9Wye89l5k56IzhXHnCZ5vP4dVOGIaGxaTnibrdI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HZoleIVrQQtW2/ETMY0FXQFn5Jz/a1yRo3sra9haOMAW5S3inZtuAIcfS6TLrem7Nd3Et627TonEyswNJ7yZaVwYg2x8fRuOVDqE3yibWbGdiQ8eiaTFgw7z4YlqklwrR/XFzNjtd301aXRV7vk9ABeu7qSg4881tvsYoGatce0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-5db2dc4e42dso1155262137.1
        for <linux-gpio@vger.kernel.org>; Wed, 29 Oct 2025 07:40:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761748811; x=1762353611;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ohi/8MFIs+pUNYTuSKDH5KUVpFMJO5wn0YyhdMa7QIc=;
        b=V/ojyn0pok7YNoCGuvUfWcgPqpK6NEhjCeGwLi3XtDaW1tVS+asC9tWRoKXod0miEC
         yfTIyHmDqqV3AApH3ehXpvew4ozQxFPtPqDZsSGWhCPsgeNoxYTgtNe+ZMyNITVkDykl
         MkBYLOusePfOWrCnYUsn2qboYCM7dTW3skbSjrnHpQPfK7Vv8EwH1NTk7xg0w5nociNX
         6wv/qD+sG8kTMrYB28A16ZoZrj+ALate70jPiK7KtfvCuEk3r01/A5hMJkAsn60dMiR7
         pltonHo90Rbvho8yK++5ov1cQSYbb6YTNoi3LN6krQYZGLnViktEb1SN/7nhd5B4CK0I
         jaFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEvKJQhRPtx92U3oa/foKxRUUvpbpmpgit2luyhQuStiJTwHyyXNCFMgueyL5D6y+24qPbVvMNMOrr@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3U4mfVZC9bqwKAPgauN6/K6nBEWbA6LE1+TkX6d7Lnp5LSH9K
	3EVaxwou3dsU92SbF8hD2cw6k6zVVclv+B4JJdngPp9eVl+PS0yqlK11mB4cRe2H
X-Gm-Gg: ASbGncsg+m+8YwlQZog57/fZ9gN0FGR6vsP7juPX27hs/D3H7cjT2A6+Vv7Y31skbKa
	gPYatFF4trfaZqPIEX05QF3Z8LR1sOEwIZgAo6rEEL84gYt2nZ35RnskkfQNLS5m4jpspxXC9ai
	jgqjz1d3adBOUAMKiKhZeNZn8xLkb/sl6APZItb77r7WUfilw9MGdkJV/5M6xvrLZjAjTsYP6mT
	IAHbmpq2zjELvoQcfBUd3krCdoGWxAtLMW3V4jIgOq1T1DEUNSEYLtZh9JfjIltavPSbQE5FIi5
	thw4JHj4w67586X5mlwNJOYFHfsS3nLjhWd9pZsmmNcTX2uwFEbXMPJV+AOqpBIBz7/HM/TjpP5
	RZ71/R3u4BkePvQatM1Mcb4/MgqxHNh19Aj7aJ+gQUtnr0cwLUUFlFsMTgjdDs3GTbbfwv6Q6rj
	umXsKHC81BnxZhqiH4BpXNTuGKYdOISSOsnA7sEv/a0wJSpErDVCg/Su20
X-Google-Smtp-Source: AGHT+IHgxp3tIWZxy5V21gMH41wcLe+EVVH+/wHxrVdFYWuh1oap4vb10GBQaL4EkRvRBw/MsiPbhQ==
X-Received: by 2002:a67:e7c9:0:b0:59c:d78:dca with SMTP id ada2fe7eead31-5db8fd12b9fmr1235030137.15.1761748811038;
        Wed, 29 Oct 2025 07:40:11 -0700 (PDT)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5db4e4e3b4fsm5080443137.1.2025.10.29.07.40.10
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 07:40:10 -0700 (PDT)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-557d71a96f3so805093e0c.0
        for <linux-gpio@vger.kernel.org>; Wed, 29 Oct 2025 07:40:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV0MWmoNHb3YrmNVD1Ekes/yhtnZyz2kB9NPTgzulm8HdPjqvMFCVgOBoD8eRRoxbKsRHs/1dHumoxA@vger.kernel.org
X-Received: by 2002:a05:6102:2acd:b0:5db:9b88:1fec with SMTP id
 ada2fe7eead31-5db9b88219emr535412137.9.1761748503547; Wed, 29 Oct 2025
 07:35:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1761588465.git.geert+renesas@glider.be> <ac3e718c5de6a23375055dd3c2e4ed6daf7542d5.1761588465.git.geert+renesas@glider.be>
 <CACRpkdYMv+R-NJ5R4+UyhK1+DJia0z72kZgt45+0eubXMuGpEw@mail.gmail.com>
In-Reply-To: <CACRpkdYMv+R-NJ5R4+UyhK1+DJia0z72kZgt45+0eubXMuGpEw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Oct 2025 15:34:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUvLH-8yNRoqBdTB+mcmOUedwVGpJ_HGdq8sqgLNB4dvw@mail.gmail.com>
X-Gm-Features: AWmQ_blZ8dUVr2aBwtWAAkAOaE93AtUSPNFDpslgvmXepFfW4tMWIOUWnRJkksY
Message-ID: <CAMuHMdUvLH-8yNRoqBdTB+mcmOUedwVGpJ_HGdq8sqgLNB4dvw@mail.gmail.com>
Subject: Re: [PATCH v5 18/23] pinctrl: ma35: Convert to common
 field_{get,prep}() helpers
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	David Miller <davem@davemloft.net>, Bartosz Golaszewski <brgl@bgdev.pl>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Crt Mori <cmo@melexis.com>, 
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Jacky Huang <ychuang3@nuvoton.com>, 
	Shan-Chun Hung <schung@nuvoton.com>, Yury Norov <yury.norov@gmail.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Jakub Kicinski <kuba@kernel.org>, Alex Elder <elder@ieee.org>, 
	David Laight <david.laight.linux@gmail.com>, Vincent Mailhol <mailhol.vincent@wanadoo.fr>, 
	Jason Baron <jbaron@akamai.com>, Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Kim Seer Paller <kimseer.paller@analog.com>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Richard Genoud <richard.genoud@bootlin.com>, 
	Cosmin Tanislav <demonsingur@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Jianping Shen <Jianping.Shen@de.bosch.com>, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-edac@vger.kernel.org, qat-linux@intel.com, 
	linux-gpio@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	linux-iio@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Wed, 29 Oct 2025 at 15:21, Linus Walleij <linus.walleij@linaro.org> wrot=
e:
> On Mon, Oct 27, 2025 at 7:44=E2=80=AFPM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
>
> > Drop the driver-specific field_get() and field_prep() macros, in favor
> > of the globally available variants from <linux/bitfield.h>.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > v5:
> >   - Extracted from "bitfield: Add non-constant field_{prep,get}()
> >     helpers".
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thanks!

> I guess this needs to go with the rest of the patches?

There is no hard requirement for that, but if 07/23 goes in, why not
include this one, too?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

