Return-Path: <linux-gpio+bounces-27305-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F3DBF11FD
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Oct 2025 14:21:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B477F3E2C57
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Oct 2025 12:18:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6024E32B996;
	Mon, 20 Oct 2025 12:13:43 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6B33148A1
	for <linux-gpio@vger.kernel.org>; Mon, 20 Oct 2025 12:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760962423; cv=none; b=LD7ZAmH7j12MtSWrtH7AJmvNlVddMjJSWWKkqDqTAwy6m6A8uFTDrNqnc5rtFamdyX+f+etAO5k7eMqc2NF1HjYFaabyN2RV06jivjyD4IX7WC7pwrXyoLRKW+3XQct8/SOtOJqP5Tv6vNDnkamX0j51zh49PrDO+9/mXrLLwvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760962423; c=relaxed/simple;
	bh=zQJyABbFIFRgraIjRfB4Kv0edNHngRx2HTU3PnrqMSo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TneE9tcWlkPE1BAxHVh81ygzVUb4NLWxmLj5h8qfLCT/2e1ZCAdqZlKWfBhP00ZHd2jAURi+JRo1BC39EZphvd3Tikv5ZKmP1PHqC85jAWh1Ii7jbIaA8A0COfHr7CHPDmvUKtVj7VI2O9FcZ9RcN17kai05jKPsGmsQ/fC9Vpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-932cf836259so368976241.3
        for <linux-gpio@vger.kernel.org>; Mon, 20 Oct 2025 05:13:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760962419; x=1761567219;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pomt2ITXhIHlFit8dq3w5svz3PMdwi8h98cx9ZzxHC0=;
        b=ZI+W75Obglwm4ci4mfQQsoesAaxPUQkv5N8l7eRnpDyIoPa3s0kH4fGDQ1ztTyTVZt
         CeKPaSkBXdIL/33kB/Kqz7fmNQXn86GK1NHf6iXw9MlbHUSIdSPYaj0eREcK8t9bP059
         oHgSYwAkgn+VgEnFvSOpm1pL6pbSxZXpsB9Vf2y0Zvg49AxY1mXTQ1D5e60vQc7fnQpi
         91yuZCHmoaD2FXjq/7/PuZJOkthDYcMfmp+/1OvM6ObHninGz6P4rmSBP55hEE+3W2m0
         sIDEDm64UdxUDGYuQqvmPFP+XPrUstXGW+1gGCcv7cQdBvoT7EyyWJdZMtaPEPfMMHZm
         OM3A==
X-Forwarded-Encrypted: i=1; AJvYcCXjTvarg14gwNH0bqeqA1MXzu/8BfNwq8skfL4Y2Xq3HBjH9PdxCVobh2NCQJW3r46kVaqJcQn4tr7E@vger.kernel.org
X-Gm-Message-State: AOJu0YwsMJYRy+i6o+fSPl19UYD7PRMiNxhychKrK15tU/ANb6d4VjNo
	1o/GK4TTO+iv1q0fbldFNDc4FE/ocnydcYm4wTotxDB3c+8mqi8rCdy314b+m36d
X-Gm-Gg: ASbGnctQA74OuDsyDY/auTMA/We73/8ppzUZlpIltlAUECJ5qW2bf0FrkkJTHKSR0BQ
	cfE3IMFMXi0Rg7hOE1EdSGIR2tkq1o+MnIoGSOZKjj2Q+g54Rne3zQiLlrIHcRPRQMpt7eslLkc
	0fhP6g/7gGgidRnkANikMiSHQlXh2a/3EkWFffsQe3kNgP5002Kjx4a9K2u2i942zMyyYrj/Uci
	AgICves5G9kBxmRgHREXzrnIaKQ6kwPwjSDlG8jibKOqebatdJLiRVQnN8W91jEgyDEfRColmDY
	k/FxVk/S1jQVkfupti6xf5XSq1c6FPDbH++ocyvauKS8HNKL8eh5lSORuaJs7PftmxRnWWeqs9s
	41JAGjPYeM0yn4Jj5v+LGG3amsqdU7WSWojJluL0wsq3rh5gwFfIqMXlZZuCRvkKkGg92rMH9Iy
	xsWDomxNMidFuKCvn54ZZ5g5RoAWeQJdLeVg2+evltxDTcD2Kl
X-Google-Smtp-Source: AGHT+IEgVmnJrMSuuPhod2YkGe2BmKE+0Fy8L6hNljl5fVl5bRhk5+4O/MZwKvivPyzwbfwWnX2uqg==
X-Received: by 2002:a05:6102:2908:b0:5d5:d1ba:439b with SMTP id ada2fe7eead31-5d7dd595e22mr3530573137.11.1760962418873;
        Mon, 20 Oct 2025 05:13:38 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-932c3d85760sm2423662241.1.2025.10.20.05.13.37
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 05:13:38 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-932c247fb9aso703605241.2
        for <linux-gpio@vger.kernel.org>; Mon, 20 Oct 2025 05:13:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVZvhKuGMkDMl1L1/aZRpXLZwzX/aBUGpmgDd2UhlmI1xWx9GjjK+P2L4oRUorwkUXyOKTvqE03veX0@vger.kernel.org
X-Received: by 2002:a05:6102:50a2:b0:5d5:f6ae:38ca with SMTP id
 ada2fe7eead31-5d7dd6f4c27mr3609494137.41.1760962417639; Mon, 20 Oct 2025
 05:13:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1760696560.git.geert+renesas@glider.be> <792d176149bc4ffde2a7b78062388dc2466c23ca.1760696560.git.geert+renesas@glider.be>
 <aPJwtZSMgZLDzxH8@yury>
In-Reply-To: <aPJwtZSMgZLDzxH8@yury>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 20 Oct 2025 14:13:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXCoqZmSqRAfujib=2fk0Ob1FiPYWBj8vMXfuXNoKhfVg@mail.gmail.com>
X-Gm-Features: AS18NWDS1vbUG4-z_--VlQ3gjSspwjijy0fs8EPqX7O88cWCZQUNQKHTmAYei1k
Message-ID: <CAMuHMdXCoqZmSqRAfujib=2fk0Ob1FiPYWBj8vMXfuXNoKhfVg@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] bitfield: Drop underscores from macro parameters
To: Yury Norov <yury.norov@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	David Miller <davem@davemloft.net>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Crt Mori <cmo@melexis.com>, 
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Jacky Huang <ychuang3@nuvoton.com>, 
	Shan-Chun Hung <schung@nuvoton.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
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

Hi Yury,

On Fri, 17 Oct 2025 at 18:37, Yury Norov <yury.norov@gmail.com> wrote:
> On Fri, Oct 17, 2025 at 12:54:09PM +0200, Geert Uytterhoeven wrote:
> > There is no need to prefix macro parameters with underscores.
> > Remove the underscores.
> >
> > Suggested-by: David Laight <david.laight.linux@gmail.com>
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > v4:
> >   - Update recently introduced FIELD_MODIFY() macro,

> > --- a/include/linux/bitfield.h
> > +++ b/include/linux/bitfield.h
> > @@ -60,68 +60,68 @@
> >
> >  #define __bf_cast_unsigned(type, x)  ((__unsigned_scalar_typeof(type))(x))
> >
> > -#define __BF_FIELD_CHECK(_mask, _reg, _val, _pfx)                    \
> > +#define __BF_FIELD_CHECK(mask, reg, val, pfx)                                \
> >       ({                                                              \
> > -             BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),          \
> > -                              _pfx "mask is not constant");          \
> > -             BUILD_BUG_ON_MSG((_mask) == 0, _pfx "mask is zero");    \
> > -             BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
> > -                              ~((_mask) >> __bf_shf(_mask)) &        \
> > -                                     (0 + (_val)) : 0,               \
> > -                              _pfx "value too large for the field"); \
> > -             BUILD_BUG_ON_MSG(__bf_cast_unsigned(_mask, _mask) >     \
> > -                              __bf_cast_unsigned(_reg, ~0ull),       \
> > -                              _pfx "type of reg too small for mask"); \
> > -             __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +                 \
> > -                                           (1ULL << __bf_shf(_mask))); \
> > +             BUILD_BUG_ON_MSG(!__builtin_constant_p(mask),           \
> > +                              pfx "mask is not constant");           \
> > +             BUILD_BUG_ON_MSG((mask) == 0, pfx "mask is zero");      \
> > +             BUILD_BUG_ON_MSG(__builtin_constant_p(val) ?            \
> > +                              ~((mask) >> __bf_shf(mask)) &  \
> > +                                     (0 + (val)) : 0,                \
> > +                              pfx "value too large for the field"); \
> > +             BUILD_BUG_ON_MSG(__bf_cast_unsigned(mask, mask) >       \
> > +                              __bf_cast_unsigned(reg, ~0ull),        \
> > +                              pfx "type of reg too small for mask"); \
> > +             __BUILD_BUG_ON_NOT_POWER_OF_2((mask) +                  \
> > +                                           (1ULL << __bf_shf(mask))); \
> >       })
>
> I agree that underscored parameters are excessive. But fixing them has
> a side effect of wiping the history, which is a bad thing.
>
> I would prefer to save a history over following a rule that seemingly
> is not written down. Let's keep this untouched for now, and if there
> will be a need to move the code, we can drop underscores as well.

Fair enough.
So I assume you are fine with not having underscored parameters in
new code, like in [PATCH v4 2/4]?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

