Return-Path: <linux-gpio+bounces-27247-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F33BE8381
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Oct 2025 13:03:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 999F1566B50
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Oct 2025 11:00:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7250532D42A;
	Fri, 17 Oct 2025 11:00:41 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F1A32D7D1
	for <linux-gpio@vger.kernel.org>; Fri, 17 Oct 2025 11:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760698841; cv=none; b=EFhJaUgVQ4RMm3dyDe6SqVtoY5e8gRXpKmofc7UO6ApaEsa2+bQppXxy2Kn2z/HEpP6sXin01p8YDMQYG75LUtzjRpIl8I55nVHk2WjSFgTMIhShOy1zecOF4TLxuMxtAcHSGymNqxMXTZCnEZEK2+gzZisVDxGZEMA738xicTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760698841; c=relaxed/simple;
	bh=LrniXy6ZCFM530ZMtcnDRQn9pcEmCEynLCDVJ3AMIhs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hXob7Y2/4xdqgyu8ZWOOnSA/3eNhIpuMLufmKJfHVsk7Xdhu0TQYORUhBXey0lGtg7E9A5HZV6oHpJscVkYZtnfJA3ATTLcu6FNTPdqCTckon30B7JXie3qoxwCEJVWJ1W3aB1NR65/cSbeejExo+VI+Fg5owltIxAadz2Rz3lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-87c148fb575so28347856d6.2
        for <linux-gpio@vger.kernel.org>; Fri, 17 Oct 2025 04:00:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760698838; x=1761303638;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XCpfZFAx3hiLnczCJXcXTR7Dek411X8RRc+fD4xQf5M=;
        b=nh9FxxAOATQX3s2hFVE/knQcR6hgtgUiRrLg8mUhAT96iVz8lb3aKgOEVNnY+3QgLh
         yMd2Gxjl8cKw2MOw6wvqgReImERfGTxQJTRa7AECi3beW+HwOIJtmMS/QWAUYVP9lqqT
         Stgi3mM8/bVe8CAG2iM2SE6nOL1Po5AK627bQGXM3qrOt4SQZDp0+7BG6i18quFmxK0h
         RsEVXFTouMrtVqER4sO7BL3A1OhKEDIGQQyR9V+ER/kyFCaXivpms2Di9pJsaCxRBw8Q
         n2ECgFhdnEFX31EKC5mUBihFs+p6kfNCxX4SDOtJ4jF+mOIncDbNmMvglTf1/dqBwd3j
         ie9A==
X-Forwarded-Encrypted: i=1; AJvYcCWQpygKl/0P/VDQSNjEhtFnmfLcMK8jfEBNcEWE5LG/2pPybUd/UMVubJc/HL6nnTGGt7GrpNY2inoC@vger.kernel.org
X-Gm-Message-State: AOJu0Yyhk09dUWN7KSuFsuA7sLUo3i0mbCruUdMhyJPnSRbqJRNEldKH
	iBWxujag0yxXYNf2ehV1KIIaarRNkWPv4ZKWe0FaX4WH8qqNnWBUZqtf0QVVlEC/
X-Gm-Gg: ASbGncs9eLTwiOJY0cQQRrXh6ail/jXKsVkO+8ASFXDy5kqd10P4HSfQMNRKtyfHOXT
	5ORHjUaiXmEyUWLN0dxIzuRv/dXCFrwM2OCcNHQvfdAyMjVoEH2ejggBXC3WU3RlXk1TxipJ33O
	XId5Z9DHaY8XNNw+ogqNrL7rN1yvme5kVKzaJkt+w1fCXlouh7nQithGhX8AiXpwjeZF6DK72lS
	IoIgUwu+/VZC8nPAH71V5CywmvQS3O3vY3ewJxXXB4DvBau8MQOBM0aGQZpaWMNm4DWPBH/AE+p
	NSILkiz7C/166aJvrJ5HeDDKJOdsaD1cEAIoX8omeo42avxiTa4BoF9JzhttpJCyFpS3nP8AyH1
	9mlcqIepOzlNYJQdpT8haCvh/X7yptllSg5pUvFZEjuU4J9/0fe2iVF6VyX8ZrCKdISZX9FIImJ
	KdSx4zfaDTh0pbp6kaXNF6KEmCjkThJcHgTbMT8due0QzoUsh3kiE/
X-Google-Smtp-Source: AGHT+IG3RytkLEwNjx8VurDqFzwPNsxOzPX7aw9GcJfauto8yyrJvt0tgjM/OIi5bPk5YD6rS0RVIg==
X-Received: by 2002:a05:6214:508f:b0:87c:27c2:2c0e with SMTP id 6a1803df08f44-87c27c22f10mr11515786d6.59.1760698838191;
        Fri, 17 Oct 2025 04:00:38 -0700 (PDT)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com. [209.85.222.174])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87c010d33besm60158966d6.0.2025.10.17.04.00.37
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Oct 2025 04:00:37 -0700 (PDT)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-88f86727622so274202385a.1
        for <linux-gpio@vger.kernel.org>; Fri, 17 Oct 2025 04:00:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWq9fzARawYizRS9ff0CGRIc71GrDk8N+yhCIL1SHekv/O3Oa78Hp02CLRCZu0Jk4rVVGNTilOQHSOP@vger.kernel.org
X-Received: by 2002:a05:6102:c49:b0:5a1:f09f:524e with SMTP id
 ada2fe7eead31-5d7dd59bcd6mr1313646137.16.1760698511065; Fri, 17 Oct 2025
 03:55:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1739540679.git.geert+renesas@glider.be> <2d30e5ffe70ce35f952b7d497d2959391fbf0580.1739540679.git.geert+renesas@glider.be>
 <20250214073402.0129e259@kernel.org>
In-Reply-To: <20250214073402.0129e259@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 17 Oct 2025 12:55:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU+0HGG22FbO3wNmXtbUm9RhTopYrGghF6UrkFu-iww2A@mail.gmail.com>
X-Gm-Features: AS18NWCjFk9wo7Q1aPnnkBYJzaq6xcQVQAXawyeid30N8a2RlJlAbXrKkziomTs
Message-ID: <CAMuHMdU+0HGG22FbO3wNmXtbUm9RhTopYrGghF6UrkFu-iww2A@mail.gmail.com>
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

On Fri, 14 Feb 2025 at 16:34, Jakub Kicinski <kuba@kernel.org> wrote:
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
> I really really think that people should just use the static inline
> helpers if the field is not constant. And we should do something like
> below so that people can actually find them.
>
> diff --git a/include/linux/bitfield.h b/include/linux/bitfield.h
> index 63928f173223..e02afcd7aeee 100644
> --- a/include/linux/bitfield.h
> +++ b/include/linux/bitfield.h
> @@ -156,6 +156,80 @@
>                 (typeof(_mask))(((_reg) & (_mask)) >> __bf_shf(_mask)); \
>         })
>
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
> +}

Unfortunately gcc emits actual divisions or __*div*() calls, and
multiplications in the non-constant case.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

