Return-Path: <linux-gpio+bounces-27837-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 212A4C1BA2E
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 16:26:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2664E428328
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 14:20:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15C9326C39F;
	Wed, 29 Oct 2025 14:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="STdMHBQT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886902641C6
	for <linux-gpio@vger.kernel.org>; Wed, 29 Oct 2025 14:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761747601; cv=none; b=HkEsIeDTgax+acUQMC8Q9nE11y1KtPpY0lRijRNrLeBIlQKSobFXUlW55gcYLVPyGtrwqN7z6vrFjf62Rk4fcVSzICsOCr1eZtWH1LjIvE6xaPVaUTp4xqV9QOu2vgKMvPgpfL8YG+GzO1pnMzjNCK26xPJpyA10pu7uDavbffM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761747601; c=relaxed/simple;
	bh=1CX+8+kOSf10qsVFbiIqXKLPwxKNZKPK3M5tdY2U3zQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WzEVhWx9ocJyvok37aOqojmrF+dFzlelBdHQStltXNPCD2xw0Ztc/YhpVyOplcehcnioW9xVitImG7uMcx1Ktt/rhUDLTkghCDm/RGd+PxWgrRQdbtkPbK5R+4zJMiAsY7xiFLNr+jVV3djqWudtDsa1L7metkUg5x2CEUTYVpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=STdMHBQT; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-59390875930so1613460e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 29 Oct 2025 07:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761747598; x=1762352398; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oOeCj7atBm+jp74qXquxytnJSCplsW/eyoN4u7SHchg=;
        b=STdMHBQT12yVVhenBH9kjtzktzfxhBOPKOo9apSlTLueZcsupwgg31te2NoZ1MYB8V
         MSCDsKHm3FOvPOU5eIBCDfHMdlRjXQ/WaIfGw7guwrNmTT3BzH6WS72IQ0rngTeIuIKG
         geIpbGtk9/KkbvqJ4ys0/EumZ1gCsCKUv+qxxEKzmywlju+PTnHhCdTYr2IGsTbcyPmT
         1dv7mnHne5W/9nCZuPRS5MOiokEytiREtrQcf4/hBmfAUMtMcLusUKfTMKcUvAn01g/8
         YYl2+QIB5DhWKuvrDaYdcUxOB+ZWEQK/1a4i5MEDu6ruYYw7g+OmbE5blhnTFS7GFVRk
         77Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761747598; x=1762352398;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oOeCj7atBm+jp74qXquxytnJSCplsW/eyoN4u7SHchg=;
        b=Jp7rXky7UGMpTYHUf1wQj8BVItoUbz/8dAlIXQEKl/HlAbE7JlrAngSvFDRQMEanQ6
         5L8wrriLsUGuXrAZxjRyCjGxeCWzc/YtUSzuZbkRCzv4y23laxRU6xy+gP7VHtdRurqJ
         mctJLnKn8ajckAnzeQQGTTeG/yFuEUMN8jOeM8YnvclWSOxHA1njKNvB6ghIUY0TMWX4
         ommfJ7IU5sdc/gt8B+NoCqeFfgPBwWj7AhbQ7QS6f4a5pOqXfmY8HxpQ9JKtitrwETw1
         MJzc86pbS2VDNGKDCfmIasXzS3K9d8AjYB6s0t44mmhS3u3qsT92/muuuhlXwgbdiIhk
         EYJw==
X-Forwarded-Encrypted: i=1; AJvYcCV7p9WPD78hvp4T1oAMtkd8d38e74klC9tsO69Rrs8LIQUr4HWQwA4yQquwWzR/JK/w5WgcG+8FSfnM@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4NQjmVqM2iyCxeOy4G8vlxbmH+DbGRHgvLCFYvsFSFVtk9SzY
	KoDUj6rdI29/Cmjgm3oYPRjfvfuzjkdUEBVya1ZNJHWXJ1WHdleA+dDIlS/PzncV46vatbS8hlY
	eULRrJbmQHfO8B9ReafTAJuGTaC8/r+tnH8R8TrIHyg==
X-Gm-Gg: ASbGncvcqw+v+s8BscI/RR4hGEIvsuDb0InUYHJlszTNYJR7XRszLmcfm3R1hcvUFSu
	1D6bQlozhQ6PEH0h6eXBYsyHnYJqxhgXA695CHcbVcbOmN6vcy7o101GZpkEk7HycxEj9CNOeO1
	AWjl3PLdlM4N2S5IfPMBVPQUfCEssD7P0w1tb8rimKi5XAR0NPsPj3BBLfTKnhbmqlbJUAgX9On
	RCjvznVNFePtZdNN+jJdHww0rKOOPKt6w9EPP8n6JvIXy7q10JHQtOVumqE24geZNiPujzPc4tv
	UOxYzA==
X-Google-Smtp-Source: AGHT+IG59+bQUerf6uihfCFWCYSjQICr8Xo4ZbiwSS1E65/x2rl3ls+2t5ioYCJKzMBcQXa5Sk43LYjN69G8TJb8SWg=
X-Received: by 2002:a05:6512:3055:b0:592:fc68:5b9d with SMTP id
 2adb3069b0e04-594128623cfmr1174582e87.10.1761747597543; Wed, 29 Oct 2025
 07:19:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1761588465.git.geert+renesas@glider.be> <03a492c8af84a41e47b33c9a974559805d070d8d.1761588465.git.geert+renesas@glider.be>
In-Reply-To: <03a492c8af84a41e47b33c9a974559805d070d8d.1761588465.git.geert+renesas@glider.be>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 29 Oct 2025 15:19:45 +0100
X-Gm-Features: AWmQ_bk2MMp0FQz04qrj-8hmhOAMRkHeQZjiqCVvFpO75M_-67m5zTnOfqmkGUQ
Message-ID: <CACRpkda6ykSZ0k9q4ChBW5NuPZvmjVjH2LPxyp3RB-=fJLBPFg@mail.gmail.com>
Subject: Re: [PATCH v5 07/23] pinctrl: ma35: #undef field_{get,prep}() before
 local definition
To: Geert Uytterhoeven <geert+renesas@glider.be>
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

Hi Geert,

thanks for your patch!

On Mon, Oct 27, 2025 at 7:43=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> Prepare for the advent of globally available common field_get() and
> field_prep() macros by undefining the symbols before defining local
> variants.  This prevents redefinition warnings from the C preprocessor
> when introducing the common macros later.
>
> Suggested-by: Yury Norov <yury.norov@gmail.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Do you want me to just merge this patch to the pinctrl tree or do
you have other plans?

Yours,
Linus Walleij

