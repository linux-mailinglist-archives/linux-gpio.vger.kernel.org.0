Return-Path: <linux-gpio+bounces-27256-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5839ABEA7EC
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Oct 2025 18:09:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 50F9118896A9
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Oct 2025 16:07:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68974251795;
	Fri, 17 Oct 2025 16:07:15 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA27230BE9
	for <linux-gpio@vger.kernel.org>; Fri, 17 Oct 2025 16:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760717235; cv=none; b=mUbgf9eRPrk+v4tpniygJ+BpJrEAet+c+LjuERRUmBhAsHOu0P2fpsxjb7k1B6o0dV9QTnY+pYTJl29DzqCfVx4w/c8H469iPGvPPq6WCOfrxNcb6R9OF93/eQQu8jFzoDK37Tro9/5mWHsQea0PDNEo2IRX2b8u4gOdu/i7o0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760717235; c=relaxed/simple;
	bh=5UuF/HjwkQMRQp3toEpBUcYrHBj825aq+Tc6Itk11zY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sn75zUOIn2Qn+rE53ciPA0IJK5MKhJFf0/R8AwNlIY3slLu+OTxnWnVPZBq9CLHiC616Rkh97ZkidRV9kcvx059OzSKXXsru16KAp7YV2jyPKwP4aKRdeXvR+gX+8qgVaN5cKzjNQVhmBpvSM9kHTxH3m4F6bx6F/K3Q2xoAdeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-74572fb94b3so1420400a34.2
        for <linux-gpio@vger.kernel.org>; Fri, 17 Oct 2025 09:07:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760717232; x=1761322032;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D4mf9FdrvOGmLornKgNki0gXD9BcM6SCmzEl3gfV4Zs=;
        b=TN4/HUeoOgx/lNvn9NTC3n3FT1G14Tvvu3f84UF8z2ppDXMfFfnXerxrqjfBGXCCjl
         jOwYiygBgtjM/5sNSoNFqebUNVhA+NBb/YhnB5fwac0P8ApRen+WBEAmhwXEyYKDmm/+
         bfYtCJRdmBw826COW4Od30e+33MEbQOqPh3nOGHrloyMHsM7OzwYut/R6u43jexBUdoz
         TiNEc9c5BXLboXm77EZGp9+LoWl0VLgoghDAYw38wBQ/yNiyl6789jyeE49WA+ApbcaG
         fzw1zYCU0/f5EiPOVBBEYLBytH/w2ARcULZOOhCk4xGXNs+EZe+iaM5cBroWB752OJ3q
         Ts0w==
X-Forwarded-Encrypted: i=1; AJvYcCUC8cDtwYoS9e6OZPmwqnynACXQm3MHEx8SrdRgBXZO41y/rkyaE5gseai9iVyr0YnOwybRcpSUxWTw@vger.kernel.org
X-Gm-Message-State: AOJu0YxxvcbT+soFulc7+n3Oyl0+gGsoDLU4IZB4Y/VQk1iyi87Wywmn
	nvS0wN2j1MQJ/9eEohmY2iZeb5IpitQuEiSYZh30opLm4vcC3+b9jdO+o8W91KS0
X-Gm-Gg: ASbGncuC07fZlysxQsEnKFILt4johByLodmiqFIDLOD9gVVkuQcU6yIDRItswZN5BTb
	kc8d09v95jl5hB1UJMySW9E0SEAtpiUPLUKqqArD843e6vffs4rkDusj3jlrR4YsTxzYf0IvdNG
	D+NUcx2z6eq1y7MJjUtFOH+XBEPw0/gIXJaeP5UnAEqyLEiwRE+WrKKTMmu82Qnl2sKzJJ+edoo
	wUDQm8J+c22nXaGznEpbJ6Ol9idRrTfOTp+SPlw1YA6mo8L4nsohIcAY+JnmqZL+I6So2JsRwTe
	04/oV0/CP1/6U8cuMTSx/V/wtE9HdJy/DcX9akuJ13ZOQdwzAvCwy066p77BU+DCdnUSDKeBnHf
	I7YNFO/2FltnpQ0OPCg9Y64Ib7yCDre+y7SuacDUdcmSHYCswdVMMbAg8qDJefdiy78CskeT3Ep
	gvsw+LKQlyP6y9vdDL/bhGEs4q2lob/xgc4FtYGsIy+1irIDSgB25y2VBwwgU=
X-Google-Smtp-Source: AGHT+IEuCf1ZZUTdWcg9FBFIMen8jlWLJTnisk8oeMzg7DtMpGmr7f0o4X1V0tzy62kqvzclT+RdBw==
X-Received: by 2002:a05:6808:308b:b0:441:8f74:fc1 with SMTP id 5614622812f47-443a31bd78fmr1907602b6e.62.1760717232096;
        Fri, 17 Oct 2025 09:07:12 -0700 (PDT)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com. [209.85.160.53])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-442005a28d5sm1317126b6e.3.2025.10.17.09.07.11
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Oct 2025 09:07:11 -0700 (PDT)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-3c9859913d0so787739fac.0
        for <linux-gpio@vger.kernel.org>; Fri, 17 Oct 2025 09:07:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXiRnAhVsrcxRuAoP7J0UbdOrijncb4Hm+lX1xeuz/qwsS4E9lFKA7lt05OM6lXWENTveBw0erDI5OI@vger.kernel.org
X-Received: by 2002:a05:6102:40c6:10b0:5d7:dec6:389a with SMTP id
 ada2fe7eead31-5d7dec64177mr1309355137.9.1760716852567; Fri, 17 Oct 2025
 09:00:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1739540679.git.geert+renesas@glider.be> <2d30e5ffe70ce35f952b7d497d2959391fbf0580.1739540679.git.geert+renesas@glider.be>
 <20251017081912.2ad26705@kernel.org>
In-Reply-To: <20251017081912.2ad26705@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 17 Oct 2025 18:00:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVS5KmVkv_pmc+R-EXik-Z1_7nuiHM=vm1Cu8v91wmLBQ@mail.gmail.com>
X-Gm-Features: AS18NWD4CQztq7yi6j63q-9XtnW0otWo2wOw8z0_Fp7R-6z_qrlZWB5IqFYEbBg
Message-ID: <CAMuHMdVS5KmVkv_pmc+R-EXik-Z1_7nuiHM=vm1Cu8v91wmLBQ@mail.gmail.com>
Subject: Re: [PATCH treewide v3 2/4] bitfield: Add non-constant
 field_{prep,get}() helpers
To: Jakub Kicinski <kuba@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	David Miller <davem@davemloft.net>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Crt Mori <cmo@melexis.com>, 
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Jacky Huang <ychuang3@nuvoton.com>, 
	Shan-Chun Hung <schung@nuvoton.com>, Yury Norov <yury.norov@gmail.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Alex Elder <elder@ieee.org>, 
	David Laight <david.laight.linux@gmail.com>, Vincent Mailhol <mailhol.vincent@wanadoo.fr>, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-crypto@vger.kernel.org, 
	qat-linux@intel.com, linux-gpio@vger.kernel.org, 
	linux-aspeed@lists.ozlabs.org, linux-iio@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset="UTF-8"

Hi Jakub,

On Fri, 17 Oct 2025 at 17:19, Jakub Kicinski <kuba@kernel.org> wrote:
> On Fri, 14 Feb 2025 14:55:51 +0100 Geert Uytterhoeven wrote:
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
>
> We already have helpers for this, please just don't know they exist :/
>
> The "const" version of the helpers are specifically defined to work
> on masks generated with BIT() and GENMASK(). If the mask is not
> constant we should expect it to have a well defined width.
>
> I strongly prefer that we do this instead and convert the users to
> the fixed-width version:
>
> ---->8----------------
>
> Subject: bitfield: open code the fixed-width non-const helpers so that people see them
>
> There is a number of useful helpers defined in bitfield.h but
> they are mostly invisible to the reader because they are all
> generated by macros. Open code the 32b versions (which are
> most commonly used) to give developers a chance to discover them.
>
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>

Thanks, but this is more or less the same code which you suggested
before [1], and to which I just replied[2] after looking at the
generated assembler output on various architectures.

> @@ -188,6 +193,81 @@ static __always_inline u64 field_mask(u64 field)
>         return field / field_multiplier(field);
>  }
>  #define field_max(field)       ((typeof(field))field_mask(field))
> +
> +/**
> + * u32_encode_bits() - prepare a u32 bitfield element (non-const)
> + * @v: value to put in the field
> + * @field: shifted mask defining the field's length and position
> + *
> + * Equivalent of FIELD_PREP() for u32, field does not have to be constant.
> + *
> + * Note that the helper is available for other field widths (generated below).
> + */
> +static __always_inline __u32 u32_encode_bits(u32 v, u32 field)
> +{
> +       if (__builtin_constant_p(v) && (v & ~field_mask(field)))
> +               __field_overflow();
> +       return ((v & field_mask(field)) * field_multiplier(field));

Unfortunately gcc emits actual divisions or __*div*() calls, and
multiplications in the non-constant case.

So I don't think this is suitable as-is.

> +}

[1] https://lore.kernel.org/all/20250214073402.0129e259@kernel.org
[2] https://lore.kernel.org/all/CAMuHMdU+0HGG22FbO3wNmXtbUm9RhTopYrGghF6UrkFu-iww2A@mail.gmail.com

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

