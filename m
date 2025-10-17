Return-Path: <linux-gpio+bounces-27261-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 02139BEB46F
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Oct 2025 20:52:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2BCB74F6D76
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Oct 2025 18:51:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3701D33507F;
	Fri, 17 Oct 2025 18:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YlifDMN/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA6F330317
	for <linux-gpio@vger.kernel.org>; Fri, 17 Oct 2025 18:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760727105; cv=none; b=d2nS8aOUondMoin1YUgAikK3a5n5OvSDMXpvKHbkr+lfSnktfFJPowVwEevjAY4GNXntcjCCXZg7yj9JwTvhbgYkJ5NitARkQB8qEjgvMN2ouG8YSQN4kkf4X1MRbeaQ3aD0oNEFggneTdZyl3AhQ3AnGtp/afTjYyqMQ3ec4YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760727105; c=relaxed/simple;
	bh=gXqMz+CcZKPeGt9WvOXq76EJR6tDE24GCMGXdrKpDu0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AdiZqKtunq7Q00jApQftXa6HiuG5kcWgICIGz8G0PcQGycX1SHzCxbMW81sKxlM79K3blw3qOI+I3lA0NNoMdruSlZLn+EiSTfmHxIRs7oHgZcvnc+ox+i1WbpsGMpY0+asoF68JvSpAoVY0JOQ9UyZN++lElsP/zIyU0nb2n2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YlifDMN/; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7f04816589bso343968785a.3
        for <linux-gpio@vger.kernel.org>; Fri, 17 Oct 2025 11:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760727101; x=1761331901; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kcMHrjvb7aW8dOEyGXLP26k9PcHppfS2rsN7ygfXW0s=;
        b=YlifDMN/c6vzWfG76u/120EPvwuMWFthOAow4pFmcd4wRErr+JpLRZql/RdI3ZFvcB
         i/kn+nu5cNXXW48slMOD4L6lHLVy3FA4mmGcR3j7sUmM/LE4seQpds7VwSE9vlLwVh3o
         X1HTtMLfOIpOJyJOjUCEWK8GwEwrWZX/JQPe4/ixsO1syLpRFZhVfUI0Ov235fj/Q76A
         WJZ59va+96A/5qkKYYeqeNYf62Q9XkdErfCxy9xNt6llZj9JDoLeCM2K0Ze4Yd+TiJPv
         A6K/xxN5jA/qgnJr3ePqiE3FHyhC5XCOvqxac3E8yeWImyX2jvnjQPJXoRM1N0UQNxHH
         rODQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760727101; x=1761331901;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kcMHrjvb7aW8dOEyGXLP26k9PcHppfS2rsN7ygfXW0s=;
        b=kJdznQ760azfyzWG1DHun7v2rJ95Lr7UFTkMVRxY+08xo1v/L4jcniho3iu9eOhC8M
         AEDETGV7zlpx9u54MvEUTz7Kql79i4V19sf4onSVAi1U+VP+tqiLhMQ4VjjJu+1p1ovP
         8TIAUqa5DyhcoQ6IUhH0YkUtgLz90ve5D5rEi8NsgR2AWH9cdybt0sGis4Jh+/nuQLZz
         0Y/v7bx2rO31bTEHNFurXTVm7nnZtx0OOccgJL5DUaZc5dPI7neSHXg/4srOUhTz/V7c
         aINSloBqFX9ExVgTQVxiy3lQA0ukGDrav3RJZC47+b/ZFLQa2borwVVd/96XR3MuCbUs
         kWaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWP7EbQusorJhFUhmho33lSyMFvvoM6r1BIt8N0oreLX9gvRbFGLjENHD9t/rb++M+PrXi2hGEcJAWs@vger.kernel.org
X-Gm-Message-State: AOJu0Yyhn/lNoVtCi0rK70bfFeIdg8mZ7LVvKw2HHDFVFfexxwQytZFj
	lus4Ko3GerQaM7zbZN84Mdr8sX6IiiwJGR0FgHsLgkWlJjzi4thVJl9L
X-Gm-Gg: ASbGncs4wjphYBu6a+3HYcusF+7RctawUouKR6CLXPDEt+2VesTEhw4eQ83ejOQrm9n
	SR7zjGT47xR/gfFZfJJFvbpvqMOIBP37vcQMREyeyVeu40dyEoRxKbBIE1sQgHdE03F3rVr7zBB
	x/J5f6wWis9nIS0I/ace/kYjipgQQnxHv6o7WuQn9KMhQaKPQd15IUk3qIH38lBnxJ5E/4PjuF7
	kQZnXVmgnoRt8rq/nvLap5n43M8y7eq/E9dUmPy22aDh/7v6w6Q2kSWte8pp9KzITJXL2Gh5iUe
	EJbx00JKQIyTpgYXy23P6GeSiYzZqobt3CApuC3SKBocdRJM7b2bSudb9IsWxggSfHy6GrVRcLb
	2YkIcgUX2ooOsuRWVScM2o4Defc6MScRV7HT8JEFCvBRg1argeRq3pIXnLCqT2Qozc8SE7/HOj7
	K274U4tOE=
X-Google-Smtp-Source: AGHT+IGgZXVqJ39mGvceINRef9aDCQGOzv3U5h5nFkBRWec10RvkxHjWCypd6ooOxs18G5q6X1BFng==
X-Received: by 2002:ac8:7f48:0:b0:4e8:910a:ad95 with SMTP id d75a77b69052e-4e89d20f6cdmr65322091cf.6.1760727100900;
        Fri, 17 Oct 2025 11:51:40 -0700 (PDT)
Received: from localhost ([12.22.141.131])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4e8aaf87ecdsm3689291cf.16.2025.10.17.11.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 11:51:40 -0700 (PDT)
Date: Fri, 17 Oct 2025 14:51:38 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	David Miller <davem@davemloft.net>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Crt Mori <cmo@melexis.com>, Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Jakub Kicinski <kuba@kernel.org>, Alex Elder <elder@ieee.org>,
	David Laight <david.laight.linux@gmail.com>,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
	Jason Baron <jbaron@akamai.com>, Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Kim Seer Paller <kimseer.paller@analog.com>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Jianping Shen <Jianping.Shen@de.bosch.com>,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-edac@vger.kernel.org, qat-linux@intel.com,
	linux-gpio@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
	linux-iio@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v4 2/4] bitfield: Add non-constant field_{prep,get}()
 helpers
Message-ID: <aPKQMdyMO-vrb30X@yury>
References: <cover.1760696560.git.geert+renesas@glider.be>
 <67c1998f144b3a21399672c8e4d58d3884ae2b3c.1760696560.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67c1998f144b3a21399672c8e4d58d3884ae2b3c.1760696560.git.geert+renesas@glider.be>

On Fri, Oct 17, 2025 at 12:54:10PM +0200, Geert Uytterhoeven wrote:
> The existing FIELD_{GET,PREP}() macros are limited to compile-time
> constants.  However, it is very common to prepare or extract bitfield
> elements where the bitfield mask is not a compile-time constant.
> 
> To avoid this limitation, the AT91 clock driver and several other
> drivers already have their own non-const field_{prep,get}() macros.
> Make them available for general use by consolidating them in
> <linux/bitfield.h>, and improve them slightly:
>   1. Avoid evaluating macro parameters more than once,
>   2. Replace "ffs() - 1" by "__ffs()",
>   3. Support 64-bit use on 32-bit architectures.
> 
> This is deliberately not merged into the existing FIELD_{GET,PREP}()
> macros, as people expressed the desire to keep stricter variants for
> increased safety, or for performance critical paths.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Acked-by: Crt Mori <cmo@melexis.com>
> ---
> v4:
>   - Add Acked-by,
>   - Rebase on top of commit 7c68005a46108ffa ("crypto: qat - relocate
>     power management debugfs helper APIs") in v6.17-rc1,
>   - Convert more recently introduced upstream copies:
>       - drivers/edac/ie31200_edac.c
>       - drivers/iio/dac/ad3530r.c

Can you split out the part that actually introduces the new API?

...

> diff --git a/include/linux/bitfield.h b/include/linux/bitfield.h
> index 7ff817bdae19b468..c999fe70076f6684 100644
> --- a/include/linux/bitfield.h
> +++ b/include/linux/bitfield.h
> @@ -220,4 +220,40 @@ __MAKE_OP(64)
>  #undef __MAKE_OP
>  #undef ____MAKE_OP
>  
> +/**
> + * field_prep() - prepare a bitfield element
> + * @mask: shifted mask defining the field's length and position
> + * @val:  value to put in the field
> + *
> + * field_prep() masks and shifts up the value.  The result should be
> + * combined with other fields of the bitfield using logical OR.
> + * Unlike FIELD_PREP(), @mask is not limited to a compile-time constant.
> + */
> +#define field_prep(mask, val)						\
> +	({								\
> +		__auto_type __mask = (mask);				\
> +		typeof(mask) __val = (val);				\
> +		unsigned int __shift = sizeof(mask) <= 4 ?		\
> +				       __ffs(__mask) : __ffs64(__mask);	\
> +		(__val << __shift) & __mask;	\

__ffs(0) is undef. The corresponding comment in
include/asm-generic/bitops/__ffs.h explicitly says: "code should check
against 0 first".

I think mask = 0 is a sign of error here. Can you add a code catching
it at compile time, and maybe at runtime too? Something like:

 #define __field_prep(mask, val)
 ({
	unsigned __shift = sizeof(mask) <= 4 ? __ffs(mask) : __ffs64(mask);
        (val << __shift) & mask;
 })

 #define field_prep(mask, val)
 ({
        unsigned int __shift;
	__auto_type __mask = (mask), __ret = 0;
	typeof(mask) __val = (val);				

        BUILD_BUG_ON_ZERO(const_true(mask == 0));

        if (WARN_ON_ONCE(mask == 0))
                goto out;
        
        __ret = __field_prep(__mask, __val);
 out:
        ret;
 })

> +
> +/**
> + * field_get() - extract a bitfield element
> + * @mask: shifted mask defining the field's length and position
> + * @reg:  value of entire bitfield
> + *
> + * field_get() extracts the field specified by @mask from the
> + * bitfield passed in as @reg by masking and shifting it down.
> + * Unlike FIELD_GET(), @mask is not limited to a compile-time constant.
> + */
> +#define field_get(mask, reg)						\
> +	({								\
> +		__auto_type __mask = (mask);				\
> +		typeof(mask) __reg =  (reg);				\

This would trigger Wconversion warning. Consider
        unsigned reg = 0xfff;
        field_get(0xf, reg);

<source>:6:26: warning: conversion to 'int' from 'unsigned int' may change the sign of the result [-Wsign-conversion]
    6 |     typeof(mask) __reg = reg;
      |                          ^~~

Notice, the __auto_type makes the __mask to be int, while the reg is
unsigned int. You need to do:

        typeof(mask) __reg = (typeof(mask))(reg); 

Please enable higher warning levels for the next round.

Also, because for numerals __auto_type is int, when char is enough - are
you sure that the macro generates the optimal code? User can workaround it
with:
        
        field_get((u8)0xf, reg)

but it may not be trivial. Can you add an example and explanation please?

> +		unsigned int __shift = sizeof(mask) <= 4 ?		\
> +				       __ffs(__mask) : __ffs64(__mask);	\

Can you use BITS_PER_TYPE() here?

> +		(__reg & __mask) >> __shift;	\
> +	})
> +

When mask == 0, we shouldn't touch 'val' at all. Consider

        field_get(0, get_user(ptr))

In this case, evaluating 'reg' is an error, similarly to memcpy().

Thanks,
Yury

>  #endif
> diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
> index 828af3095b86ee0a..6eee89cbc0867f2b 100644
> --- a/sound/usb/mixer_quirks.c
> +++ b/sound/usb/mixer_quirks.c
> @@ -3311,10 +3311,6 @@ static int snd_bbfpro_controls_create(struct usb_mixer_interface *mixer)
>  #define RME_DIGIFACE_REGISTER(reg, mask) (((reg) << 16) | (mask))
>  #define RME_DIGIFACE_INVERT BIT(31)
>  
> -/* Nonconst helpers */
> -#define field_get(_mask, _reg) (((_reg) & (_mask)) >> (ffs(_mask) - 1))
> -#define field_prep(_mask, _val) (((_val) << (ffs(_mask) - 1)) & (_mask))
> -
>  static int snd_rme_digiface_write_reg(struct snd_kcontrol *kcontrol, int item, u16 mask, u16 val)
>  {
>  	struct usb_mixer_elem_list *list = snd_kcontrol_chip(kcontrol);
> -- 
> 2.43.0

