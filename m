Return-Path: <linux-gpio+bounces-28236-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF47C3EFFD
	for <lists+linux-gpio@lfdr.de>; Fri, 07 Nov 2025 09:43:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 051EB3A630B
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Nov 2025 08:43:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58D062DAFBE;
	Fri,  7 Nov 2025 08:43:29 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADBCD1D95A3
	for <linux-gpio@vger.kernel.org>; Fri,  7 Nov 2025 08:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762505009; cv=none; b=ETzPQQ+4EDHfqndDq+nJzX6D0r4wKOsKeEuSFhPWdGs1iyLLnzxQZZAN10PjUoguPxsfHyl03hjUWCxly9frTSTxHzv3e0ypMrmE1SqM56tERUg0veyoowTjleVSA5U37rX/928iKfNpa+XyK6kyNKN8Y0bn6vXfHYerrwdqUBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762505009; c=relaxed/simple;
	bh=9JcvPVILVy97hsdXJNb7VMxu6BBjGO1PhoJ8NRS9yLs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tA5zuA/7EqYh3ETmxeXkoK8Ie7IqQMu2Ubfwv3/nW0nGGlG7nLjT9sJs2zPkY9/EfuEhfDG7rM+5KkFJnwJvjR7yt+qkQUHZ7E5AJ+6RqxRfM0cMD1IYvrXwt2hUC5hvYnaMyRol+5hyhe7nFTHbTXB+cz5mCO5otKBXrgXZYdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-932c2071cf5so276643241.0
        for <linux-gpio@vger.kernel.org>; Fri, 07 Nov 2025 00:43:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762505006; x=1763109806;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RsHZezS59+NExnNGIIdIy6ER8EF0CQG8kO0yNppcdcI=;
        b=tZzL/gvUkrsnwqqcdUzMmQ4St8spx0VNF30BNYmS7k6gg4KE1YePtMcByzCcUimXyX
         pevB2VNELSFVjXEREm1f0OxMRrzLEX6lVAzN2itPbbfb7NUgpCBPGfMx57xcYKZwXRFV
         F7gJwCza/5UepS8+stej1QgNAV+NMjmmprkGk/LvUq72Wc2dIlLz9iF1rj6Xb/Hgrui2
         pH6Z4Sr0/xxS+28qx8rZTFnJWCJW+mybr1YXKaZvIi8F4GSNbfPcSkfrHQmNHoWVhrQI
         ThypP0hKKPZ12TN8fcsyxGIiZsoRaOQIXySMbOGA27+pRNRly/M0dt0p42rGXddlff2w
         nqUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGOqv53zYHTy1VdMUZP4Zx0ABjscF40l++x+m7qnGl4EGi9bntYTVZD8sKYiGsb+7u9P8wzAMaYTSY@vger.kernel.org
X-Gm-Message-State: AOJu0YxMrbAaXXvnxqv0i32nMVMmkhC/fyC4iugBFKJkEegLHJPnWdTC
	fafTvrbg/yiRfWqaVdHnPtWyiwrki2EYH1KWSJjTbOuhEyjicCiO75DwE+qjPxioLG4=
X-Gm-Gg: ASbGncsRykHZ61Gz8srnhf3Sk3nHLDcyhcqUuxdSUjBgx+A73A6vI/21BScPoPdswFT
	9RYkSAupRg4C45ZBdEdoFJ09SoEd+51y9M/bqRRNvdaElCpSxZ8PEKinNqz1dAWZWDkKjHvsrhF
	XcqAwCYUpmyZvZ+FxSHLA5C6Ml7UIjH71rSvtNplj6h6tvui6uZ7rieMqsNvwLLjIXx+3m60KK/
	QVnCUqe6UeUc2s3CaGAvUp1+pt5r5FcbGP08l/zegpOwcZKpP0L9HniPJ1yoatWGKu2nOaWBJ4a
	2vZQ1BvdBUsZrhwiBY496SW362t35z3JzCslwAux4HsnVu2YlZFpjocAgpoOQfO8WAivUhc3Ore
	pwylLNFTtgBNJpKI9ckQ/zezgwjBajEisBLMf0myZedRx+X3lBXaJUnCegHF07XdGleEz4p9cyW
	QtRd8xFhcRMINBRyU1wtHVtz0me7nR+9ah+AP+mdQT+wxC1SOr
X-Google-Smtp-Source: AGHT+IGt6f4W9Tllb8Mm5WFGizsZWs4ptD+aVo0wZti5Kdb4P5YxGeWUxRzXCcgzQge8Zh/4k9M4YQ==
X-Received: by 2002:a05:6102:5a96:b0:5db:237c:a350 with SMTP id ada2fe7eead31-5ddb9d49024mr229983137.20.1762505006440;
        Fri, 07 Nov 2025 00:43:26 -0800 (PST)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5dda1d296cfsm2113673137.5.2025.11.07.00.43.26
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Nov 2025 00:43:26 -0800 (PST)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-8eafd5a7a23so219539241.1
        for <linux-gpio@vger.kernel.org>; Fri, 07 Nov 2025 00:43:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUPgOEO+0IslIgfgYsK4g2l53h2RnFBVa2gbZSDzzE1TxM2jfVtRoxIUyUZ7Re4qd6KaD4Kx5SV9cSN@vger.kernel.org
X-Received: by 2002:a05:6102:4425:b0:5db:e32d:a3ff with SMTP id
 ada2fe7eead31-5ddb9e056aemr278996137.19.1762504514580; Fri, 07 Nov 2025
 00:35:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1762435376.git.geert+renesas@glider.be> <cfc32f8530d5c0d4a7fb33c482a4bf549f26ec24.1762435376.git.geert+renesas@glider.be>
 <aQy0T2vUINze_6_q@smile.fi.intel.com> <CAMuHMdXVUJq36GvNUQE8FnHsX+=1jG4GOJ_034r=fgr_Rw4Djg@mail.gmail.com>
 <aQzIIqNnTY41giH_@smile.fi.intel.com> <CAMuHMdW8ndAdGnSHopYFMWvw7wk7wKz_7+N91M1jRHoqK1KBrg@mail.gmail.com>
 <c62eb5a727f149fb9d8b4a4c8d77418a@realtek.com>
In-Reply-To: <c62eb5a727f149fb9d8b4a4c8d77418a@realtek.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 7 Nov 2025 09:35:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU3hWDOWXxuOJcBA7tphBT7X-0H+g0-oq0tZdKw+O5W3A@mail.gmail.com>
X-Gm-Features: AWmQ_bkZe8xF0tkRpW5gVlylkcfm2r3jZb2Xa1XdOQVS8F7wx8KXagIs6XSHJvI
Message-ID: <CAMuHMdU3hWDOWXxuOJcBA7tphBT7X-0H+g0-oq0tZdKw+O5W3A@mail.gmail.com>
Subject: Re: [PATCH v6 12/26] bitfield: Add less-checking __FIELD_{GET,PREP}()
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Yury Norov <yury.norov@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
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
	Jianping Shen <Jianping.Shen@de.bosch.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>, 
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "qat-linux@intel.com" <qat-linux@intel.com>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, 
	"linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, 
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>, 
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	linux-wireless <linux-wireless@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Ping-Ke,

On Fri, 7 Nov 2025 at 02:16, Ping-Ke Shih <pkshih@realtek.com> wrote:
> Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > The extra checking in field_prep() in case the compiler can
> > determine that the mask is a constant already found a possible bug
> > in drivers/net/wireless/realtek/rtw89/core.c:rtw89_roc_end():
> >
> >     rtw89_write32_mask(rtwdev, reg, B_AX_RX_FLTR_CFG_MASK, rtwdev->hal.rx_fltr);
> >
> > drivers/net/wireless/realtek/rtw89/reg.h:
> >
> >     #define B_AX_RX_MPDU_MAX_LEN_MASK GENMASK(21, 16)
> >     #define B_AX_RX_FLTR_CFG_MASK ((u32)~B_AX_RX_MPDU_MAX_LEN_MASK)
> >
> > so it looks like B_AX_RX_FLTR_CFG_MASK is not the proper mask for
> > this operation...
>
> The purpose of the statements is to update values excluding bits of
> B_AX_RX_MPDU_MAX_LEN_MASK. The use of B_AX_RX_FLTR_CFG_MASK is tricky, but
> the operation is correct because bit 0 is set, so __ffs(mask) returns 0 in
> rtw89_write32_mask(). Then, operation looks like
>
>    orig = read(reg);
>    new = (orig & ~mask) | (data & mask);
>    write(new);

Thanks for your quick confirmation!
So the intention really is to clear bits 22-31, and write the rx_fltr
value to bits 0-15?

if the clearing is not needed, it would be better to use
#define B_AX_RX_FLTR_CFG_MASK GENMASK(15, 0)

If the clearing is needed, I still think it would be better to
change B_AX_RX_FLTR_CFG_MASK, and split the clearing off in a separate
operation, to make it more explicit and obvious for the casual reader.

> Since we don't use FIELD_{GET,PREP} macros with B_AX_RX_FLTR_CFG_MASK, how
> can you find the problem? Please guide us. Thanks.

I still have "[PATCH/RFC 17/17] rtw89: Use bitfield helpers"
https://lore.kernel.org/all/f7b81122f7596fa004188bfae68f25a68c2d2392.1637592133.git.geert+renesas@glider.be/
in my local tree, which started flagging the use of a discontiguous
mask with the improved checking in field_prep().

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

