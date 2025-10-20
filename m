Return-Path: <linux-gpio+bounces-27306-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 880D7BF1672
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Oct 2025 15:01:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34E303A6612
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Oct 2025 13:01:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CE583191B7;
	Mon, 20 Oct 2025 13:00:43 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880283191AE
	for <linux-gpio@vger.kernel.org>; Mon, 20 Oct 2025 13:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760965243; cv=none; b=lz57nK0b+Tj3DwD9ZCVzolQ8JuNN4SmAn2KeHmPT7IysndiPhFJBRGncFBD9QerSSoN1kW4esqh/1RS3t/cAzca1upFFTyGxi4p7TT25+yX0sziVR/GvzS9bez9PcTkQBr8bokSg9LU9WfGxEUcmbrAvsCKPqPri2TJ/KirYX+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760965243; c=relaxed/simple;
	bh=+BhpvIfdxxZ/aCetXMa1dsKCSF78eaw36kKX1XCRo0U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EwYejPM39nOPspEFGkgseeKfAhOpSNW4GUATEk7KnueFX0boasxH2OI0MBR5Rn9WD65Fmw8uO089mBCRVVMlPSCZOvcxzJ0QvoBLug11UHEAXCIctXwThSrzSTKAC/HcyD5OVgea/7X1WzljJeEsP/JD5AQwtCnMbYbW0T8auO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-54aa4b86b09so1909344e0c.0
        for <linux-gpio@vger.kernel.org>; Mon, 20 Oct 2025 06:00:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760965240; x=1761570040;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WTAfAvg+E5E0/JeW2qvrB22XDr/x/zemAkA2zC9bvaY=;
        b=EJqHz4X0P5hpiAywKwkIVRB2R/Z5Hr6MnerTuSUqgSq+u22Woefqf04yjVFtWYLCUx
         5ECsh4yIBrIkphJ/srDd2eBNkEQ4SzCBT7Qnz0aWrPmlVMJnBFtWWBlOWZTvEj0N2gB9
         0LEFT9eJXF65qHoYL4QzEr3UvtUX/NAjNGBcLzita6/HbGjEB76RbzEs465gAoK0PqIk
         7wE/LJvXIOlbMWTC4s/GYY+L78UdMnxfXpoxfJW42Lw4KvvWrmAkSjglzYHKaDtGnAf3
         7yLfcsNDmNpNMg4xrJ+dYyL8BM6t9D7DcNqeeZp/8EYGy7H5h7ln2znJa3Ce9+ArUule
         jkug==
X-Forwarded-Encrypted: i=1; AJvYcCWPhp0d/qCswB/c8NXtjxZpzzIgyv8fiWssWZMQO+y1+xzkDRy4VlkBxZ8Vk/DgbwYxTozGtwJNRozX@vger.kernel.org
X-Gm-Message-State: AOJu0YxCe5jroGLIPTx6q7voygt0F2PT81UjQqyuy5dE6Lp9GvhSrySk
	FMRuQ8m0UUAXxoKkgI/9f5DmGFN1G+ExmIR+UFdd5Jnpe4RQXTuQJ/1OWQFzYQqp
X-Gm-Gg: ASbGnctLxI4llqx1cJ9ELm1+H1O8Cg1rCQiOrOeXSLXV0CfdZqzO1RN2SGHvdcumtd2
	K91+jjNT5wMGjJfwzsD223qY4jY2SCknUkOXizdwzPyaLbxry+lzdScc/LLzOUuULE4NI4zvFaW
	+0CRYohAo4JDK1y22m78iM1Kzd7r9X1UJWCtYr+d+ND+sBwh3Z4sQsVEy9O3Gdm4NFp1uXQ+Jjl
	BRbmMW/CTHzsBPWxZ4IYrAkJrXWxWbbi9BCIUKUjIzAuTwuuJ8oWq4M18HolMJ/r+hvGrqGjAMV
	RGx+O63H+t6sX4XZSZW5nChBwvqiz0PgHpDG0kTh4xZdFFnKvuDNUdlXRbMVaY+uQQO4ut253nh
	XwsYNxxAWdW7GFQDLOgifhztGetwtJ3tlLJgw15SqoGzczsZNnZkHNspeTFhYL+MEPKknKjMz8H
	yoXYcS3K9jW5/a/C/I64NiQdz2CNZUSVM7xSi2qcLMmY6XO7QL
X-Google-Smtp-Source: AGHT+IGpuBegPzX1gnH44YHBsRZz1FXUoc2DBha2QOChmBQUA9Cq6rmuTgad7DhGhW3CJ4C7WMdQOA==
X-Received: by 2002:a05:6102:358a:b0:5d3:fed8:f30d with SMTP id ada2fe7eead31-5d7dd5bf452mr3702112137.19.1760965240137;
        Mon, 20 Oct 2025 06:00:40 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5d96c2accf4sm2525477137.15.2025.10.20.06.00.36
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 06:00:37 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-5b658b006e2so2140411137.0
        for <linux-gpio@vger.kernel.org>; Mon, 20 Oct 2025 06:00:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUmV9Y030B5n4DJWWpnUwold9yQlNE07vUutKeu0hpw1WcjH0D3K0HUYiEfxJg9E3uR5sI7un1Ft5/4@vger.kernel.org
X-Received: by 2002:a05:6102:f09:b0:5d5:f6ae:38d1 with SMTP id
 ada2fe7eead31-5db093f61bfmr207405137.38.1760965235930; Mon, 20 Oct 2025
 06:00:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1760696560.git.geert+renesas@glider.be> <67c1998f144b3a21399672c8e4d58d3884ae2b3c.1760696560.git.geert+renesas@glider.be>
 <aPKQMdyMO-vrb30X@yury>
In-Reply-To: <aPKQMdyMO-vrb30X@yury>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 20 Oct 2025 15:00:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXq7xubX4a6SZWcC1HX+_TsKeQigDVQrWvA=js5bhaUiQ@mail.gmail.com>
X-Gm-Features: AS18NWBop_uORR3NT3_HDoVoJ_Tyxhm-9TufWw0aoroSF1IMR97eq1M8wyRugog
Message-ID: <CAMuHMdXq7xubX4a6SZWcC1HX+_TsKeQigDVQrWvA=js5bhaUiQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] bitfield: Add non-constant field_{prep,get}() helpers
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
	linux-kernel@vger.kernel.org, Jonathan Cameron <Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset="UTF-8"

Hi Yury,

On Fri, 17 Oct 2025 at 20:51, Yury Norov <yury.norov@gmail.com> wrote:
> On Fri, Oct 17, 2025 at 12:54:10PM +0200, Geert Uytterhoeven wrote:
> > The existing FIELD_{GET,PREP}() macros are limited to compile-time
> > constants.  However, it is very common to prepare or extract bitfield
> > elements where the bitfield mask is not a compile-time constant.
> >
> > To avoid this limitation, the AT91 clock driver and several other
> > drivers already have their own non-const field_{prep,get}() macros.
> > Make them available for general use by consolidating them in
> > <linux/bitfield.h>, and improve them slightly:
> >   1. Avoid evaluating macro parameters more than once,
> >   2. Replace "ffs() - 1" by "__ffs()",
> >   3. Support 64-bit use on 32-bit architectures.
> >
> > This is deliberately not merged into the existing FIELD_{GET,PREP}()
> > macros, as people expressed the desire to keep stricter variants for
> > increased safety, or for performance critical paths.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > Acked-by: Crt Mori <cmo@melexis.com>
> > ---
> > v4:
> >   - Add Acked-by,
> >   - Rebase on top of commit 7c68005a46108ffa ("crypto: qat - relocate
> >     power management debugfs helper APIs") in v6.17-rc1,
> >   - Convert more recently introduced upstream copies:
> >       - drivers/edac/ie31200_edac.c
> >       - drivers/iio/dac/ad3530r.c
>
> Can you split out the part that actually introduces the new API?

Unfortunately not, as that would cause build warnings/failures due
to conflicting redefinitions.
That is a reason why I want to apply this patch ASAP: new copies show
up all the time.

> > --- a/include/linux/bitfield.h
> > +++ b/include/linux/bitfield.h
> > @@ -220,4 +220,40 @@ __MAKE_OP(64)
> >  #undef __MAKE_OP
> >  #undef ____MAKE_OP
> >
> > +/**
> > + * field_prep() - prepare a bitfield element
> > + * @mask: shifted mask defining the field's length and position
> > + * @val:  value to put in the field
> > + *
> > + * field_prep() masks and shifts up the value.  The result should be
> > + * combined with other fields of the bitfield using logical OR.
> > + * Unlike FIELD_PREP(), @mask is not limited to a compile-time constant.
> > + */
> > +#define field_prep(mask, val)                                                \
> > +     ({                                                              \
> > +             __auto_type __mask = (mask);                            \
> > +             typeof(mask) __val = (val);                             \
> > +             unsigned int __shift = sizeof(mask) <= 4 ?              \
> > +                                    __ffs(__mask) : __ffs64(__mask); \
> > +             (__val << __shift) & __mask;    \
>
> __ffs(0) is undef. The corresponding comment in
> include/asm-generic/bitops/__ffs.h explicitly says: "code should check
> against 0 first".

An all zeroes mask is a bug in the code that calls field_{get,prep}().

> I think mask = 0 is a sign of error here. Can you add a code catching
> it at compile time, and maybe at runtime too? Something like:
>
>  #define __field_prep(mask, val)
>  ({
>         unsigned __shift = sizeof(mask) <= 4 ? __ffs(mask) : __ffs64(mask);
>         (val << __shift) & mask;
>  })
>
>  #define field_prep(mask, val)
>  ({
>         unsigned int __shift;
>         __auto_type __mask = (mask), __ret = 0;
>         typeof(mask) __val = (val);
>
>         BUILD_BUG_ON_ZERO(const_true(mask == 0));

Futile, as code with a constant mask should use FIELD_PREP() instead.

>
>         if (WARN_ON_ONCE(mask == 0))
>                 goto out;
>
>         __ret = __field_prep(__mask, __val);
>  out:
>         ret;
>  })

Should we penalize all users (this is a macro, thus inlined everywhere)
to protect against something that is clearly a bug in the caller?
E.g. do_div() does not check for a zero divisor either.

> > +
> > +/**
> > + * field_get() - extract a bitfield element
> > + * @mask: shifted mask defining the field's length and position
> > + * @reg:  value of entire bitfield
> > + *
> > + * field_get() extracts the field specified by @mask from the
> > + * bitfield passed in as @reg by masking and shifting it down.
> > + * Unlike FIELD_GET(), @mask is not limited to a compile-time constant.
> > + */
> > +#define field_get(mask, reg)                                         \
> > +     ({                                                              \
> > +             __auto_type __mask = (mask);                            \
> > +             typeof(mask) __reg =  (reg);                            \
>
> This would trigger Wconversion warning. Consider
>         unsigned reg = 0xfff;
>         field_get(0xf, reg);
>
> <source>:6:26: warning: conversion to 'int' from 'unsigned int' may change the sign of the result [-Wsign-conversion]
>     6 |     typeof(mask) __reg = reg;
>       |                          ^~~
>
> Notice, the __auto_type makes the __mask to be int, while the reg is

Apparently using typeof(mask) has the same "issue"...

> unsigned int. You need to do:
>
>         typeof(mask) __reg = (typeof(mask))(reg);

... so the cast is just hiding the issue? Worse, the cast may prevent the
compiler from flagging other issues, e.g. when accidentally passing
a pointer for reg.

>
> Please enable higher warning levels for the next round.

Enabling -Wsign-conversion gives lots of other (false positive?)
warnings.

> Also, because for numerals __auto_type is int, when char is enough - are
> you sure that the macro generates the optimal code? User can workaround it
> with:
>
>         field_get((u8)0xf, reg)
>
> but it may not be trivial. Can you add an example and explanation please?

These new macros are intended for the case where mask is not a constant.
So typically it is a variable of type u32 or u64.

> > +             unsigned int __shift = sizeof(mask) <= 4 ?              \
> > +                                    __ffs(__mask) : __ffs64(__mask); \
>
> Can you use BITS_PER_TYPE() here?

Yes, I could use BITS_PER_TYPE(unsigned long) here, to match the
parameter type of __ffs() (on 64-bit platforms, __ffs() can be used
unconditionally anyway), at the expense of making the line much longer
so it has to be split.  Is that worthwhile?

>
> > +             (__reg & __mask) >> __shift;    \
> > +     })
> > +
>
> When mask == 0, we shouldn't touch 'val' at all. Consider
>
>         field_get(0, get_user(ptr))
>
> In this case, evaluating 'reg' is an error, similarly to memcpy().

Again, a zero mask is a bug.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

