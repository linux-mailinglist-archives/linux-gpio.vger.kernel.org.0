Return-Path: <linux-gpio+bounces-28203-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B92C3BED0
	for <lists+linux-gpio@lfdr.de>; Thu, 06 Nov 2025 16:01:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 55D36564BDE
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Nov 2025 14:56:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 849F333EB0E;
	Thu,  6 Nov 2025 14:56:03 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83CF833DEC4
	for <linux-gpio@vger.kernel.org>; Thu,  6 Nov 2025 14:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762440963; cv=none; b=iBPNApCwaRcsgrcAuLMNT1OHpnr5MJ8CjAoM72ZsHUGJcRxU52exEP6zlfqdXi/wEBNnvdRUgTUWxOsSgD0hsujv8CLNT20a/ie7YzJhYfkybNTZ4ilyerXtZv4St7L8l6FY9ZYeHKfAXjDaruqr1kaCp1zSNVfsDuUBfLJM6dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762440963; c=relaxed/simple;
	bh=HaefBq/9gx/xpe6H9SR+jXE6I2U49/Bi4dkyZMOckp8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QNhWAKes6cagPI38VwRvmNTsNVTZCOwUUYqiuqstgFnGEv/s682H7H0vGDjIpZilbAgw/ND6YnLh+RO0JV+XzKh3ExtOzNz4wDL5kpwLL359FA7Ti0CP+4DcPB/4Oe6pXw0m0TU2iMkNBl9RFFJvjXnTRccCYTmmYBSpDXpYwtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-37a3340391cso10312381fa.3
        for <linux-gpio@vger.kernel.org>; Thu, 06 Nov 2025 06:56:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762440958; x=1763045758;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZxZVtMOHoNocoyXPFvfejRTHivuCeFc8a9lYqiVNw1Y=;
        b=wXT+z6b5V1gobfYxRqpeOg/RknDK1xnZemGYHwNBCAFukIIwOn8ZCeEHVQCmok15nn
         Dp7BJCEwBUf1rHwwouw4rKkjl9c4ppRcsd4KzrhVw4uC8ygrNMH2dnFek/y0mu7VCdJ0
         CsW8XnXexRQx84T3s+NyuR488+WkMzV467glr+i0sdowadwXW9Qc16Sy2wwRcyyssNjC
         3s0IxJjCAnuLMK+hHag6f3bjQ0l168hmWKJhX7V9TW9BE/DjAu45BiK04L27c7o+T3Ge
         6QBbYvPRIsKmHTxpD5OD1vCe/3lC4dPeGPAhtXKaojjfvH/qhPg5u4NQGUUT+j6MlV0w
         pn8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWRk8dDh0WVz3xGQkdjfgJ6H5Ry3Iis3wvji8g78NG28LF+nQjuNE0FoViRzd6vn/YyiUTY0BsrspI8@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1qqGfY2RIjPnAKWFipYqgZwNJoSqM/IntpfzmxzLnBrTXl0Vd
	LNJ9LOQ1Cv1fq1ThkiBjReW2LivkWbvKccPLs0MK1JQ/EORW2pXl4DiOIcbGSXl/0LM=
X-Gm-Gg: ASbGncviziycPryOEfVNczcvnWYdeLh2KvBJkr7FiIp7toWOfZ6ZPiwNkT3ZgCdnS05
	oeLO5P2WhYX6x5aV9s3AmlTwpbIVxRxrVKvKoTfkp1P66idIN3nj5aDfwEPs6x9ikLj6ccNs2pn
	3GWy4S6WGQraEK9xIKbSNy7Z9yYTJ0HWWBqtb76wRqB26HfJa2JwRqG3hP9KmpFLtkKEk03ihV8
	PW+L6RHfYCakDceiP6Y/YNz5uVSdz1DS99RHvwW+00M0EOOG5lk+ynWELMJBLKr1h0ld+Q0SVIY
	UTiEVensup4elCsF7+CQG0WdqwXX2eJvLW4dqe1q/JkS/loOIiaTEXKViI7NkwK9QtudSgJqTlS
	mssgSvCVAMNLeSV0SxS7rgm9Dmf12HNo3RPb83RsMFGHo2WyDNUxCcwBEAIvNdXgp9ZTMi3aXW2
	i4YiMoVJ2XlyTaJASM/2dphN3705KBVkE+hpjaBxqk/AkW9LNf+q/+
X-Google-Smtp-Source: AGHT+IEKwGJqAApGzzwSJKuuiR2cC6Ak/1xTdj0KkrD4GbonjSsHQ7D1O7pA5P2ignuWFAYaFPgthw==
X-Received: by 2002:a05:651c:2115:b0:37a:2dfa:c76a with SMTP id 38308e7fff4ca-37a51471f32mr23546691fa.28.1762440958223;
        Thu, 06 Nov 2025 06:55:58 -0800 (PST)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com. [209.85.208.178])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37a5f0585a0sm6747801fa.5.2025.11.06.06.55.57
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 06:55:57 -0800 (PST)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3737d09d123so11179701fa.2
        for <linux-gpio@vger.kernel.org>; Thu, 06 Nov 2025 06:55:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW92CcLuqKF6QsDLlxve01kQXKELcZATOXOUMamToZDRbXr4Qx2HvUPsBFhpIyKcs+j7s+bCpf3X+A9@vger.kernel.org
X-Received: by 2002:a05:6402:1ed5:b0:640:b643:f3c5 with SMTP id
 4fb4d7f45d1cf-641058cf323mr7301623a12.16.1762440555932; Thu, 06 Nov 2025
 06:49:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1762435376.git.geert+renesas@glider.be> <cfc32f8530d5c0d4a7fb33c482a4bf549f26ec24.1762435376.git.geert+renesas@glider.be>
 <aQy0T2vUINze_6_q@smile.fi.intel.com>
In-Reply-To: <aQy0T2vUINze_6_q@smile.fi.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Nov 2025 15:49:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXVUJq36GvNUQE8FnHsX+=1jG4GOJ_034r=fgr_Rw4Djg@mail.gmail.com>
X-Gm-Features: AWmQ_bnZOzLGAFcWzxKh1EIKjH4MNs7moeVCtN8xGb6mN65nYBliBYrABdUBf0M
Message-ID: <CAMuHMdXVUJq36GvNUQE8FnHsX+=1jG4GOJ_034r=fgr_Rw4Djg@mail.gmail.com>
Subject: Re: [PATCH v6 12/26] bitfield: Add less-checking __FIELD_{GET,PREP}()
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Yury Norov <yury.norov@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
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
	Jianping Shen <Jianping.Shen@de.bosch.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-edac@vger.kernel.org, qat-linux@intel.com, 
	linux-gpio@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	linux-iio@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Andy,

On Thu, 6 Nov 2025 at 15:44, Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
> On Thu, Nov 06, 2025 at 02:34:00PM +0100, Geert Uytterhoeven wrote:
> > The BUILD_BUG_ON_MSG() check against "~0ull" works only with "unsigned
> > (long) long" _mask types.  For constant masks, that condition is usually
> > met, as GENMASK() yields an UL value.  The few places where the
> > constant mask is stored in an intermediate variable were fixed by
> > changing the variable type to u64 (see e.g. [1] and [2]).
> >
> > However, for non-constant masks, smaller unsigned types should be valid,
> > too, but currently lead to "result of comparison of constant
> > 18446744073709551615 with expression of type ... is always
> > false"-warnings with clang and W=1.
> >
> > Hence refactor the __BF_FIELD_CHECK() helper, and factor out
> > __FIELD_{GET,PREP}().  The later lack the single problematic check, but
> > are otherwise identical to FIELD_{GET,PREP}(), and are intended to be
> > used in the fully non-const variants later.
> >
> > [1] commit 5c667d5a5a3ec166 ("clk: sp7021: Adjust width of _m in
> >     HWM_FIELD_PREP()")
> > [2] commit cfd6fb45cfaf46fa ("crypto: ccree - avoid out-of-range
> >     warnings from clang")
>
> Also can be made as
>
> Link: https://git.kernel.org/torvalds/c/5c667d5a5a3ec166 [1]

Nooooh... torvalds might click on it, and complain ;-)

> > +     BUILD_BUG_ON_MSG(__bf_cast_unsigned(mask, mask) >               \
> > +                      __bf_cast_unsigned(reg, ~0ull),                \
> > +                      pfx "type of reg too small for mask")
>
> Perhaps we may convert this (and others?) to static_assert():s at some point?

Nick tried that before, without success:
https://lore.kernel.org/all/CAKwvOdm_prtk1UQNJQGidZm44Lk582S3p=of0y46+rVjnSgXJg@mail.gmail.com

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

