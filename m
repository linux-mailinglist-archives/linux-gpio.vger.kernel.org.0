Return-Path: <linux-gpio+bounces-27840-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC47C1BA10
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 16:25:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 02B435A336F
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 14:31:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 413602C11F2;
	Wed, 29 Oct 2025 14:30:42 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905CA2BE7B8
	for <linux-gpio@vger.kernel.org>; Wed, 29 Oct 2025 14:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761748242; cv=none; b=bBD9PNOc3AcH6BTKhurgRYrhkxqox8FVFq1HHrSXX/Nji3JqBXMjQboxvxETsc1PQzviM7eK7t/7ar/Gfnj+vQzVAYt/eWvJyV0lTvFY+vKEFQCmXz3uHKy7drOC3VFaNlVClS3CRQk49nEj+gbo5xR6FyWwZS52rEeNsLgzmXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761748242; c=relaxed/simple;
	bh=RiCdWEkCDNsJiKATmU0RbHd3Kb5B/0yb//UgjVnVdPE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sN8147F5P3NVcplrU4nTV6GuuhV4wumFCvAf32P3gMsQ7lYGV8oOP8Q5hT6KwvnaniyH3cHVEkdfxW1nuan/Jhqj7T5ixdfOx3gpK9LwzuZHc/bBITgW8E3dLFAPQ4E9gtc3y9VvuO+GaDVf7nMAZqVg+ytkBPZpkP4bjS4b1i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-934e4b14501so907380241.1
        for <linux-gpio@vger.kernel.org>; Wed, 29 Oct 2025 07:30:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761748239; x=1762353039;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UmTxX9Lp/E6iQMSfd9sSFodFiE1yd68ZDUJdx86zE5s=;
        b=eIfkRd4mM3J2n+PpH2uJxoHWmtyOoog2u4d0qUvjGGglJ0ysZUPYY2h6R/MZrGvdER
         /G890DTZuyUNRSd8gjZjF74gbvPKM0GJW4HYlhk9yIKSYrHTNLC4hG1x84zvSEUpNEY6
         6jr7GST8NhTT63k1g5zdT2Elo7jAYAg5pv0xU00HTFyUL5hNLcliVB9zKaWhbtUlxa1t
         NbyehcpYx8ROzadPSHDvIt5vAy1qQPQH3zrPImMNo2ip2pJOiaLzhtzAPniBO2pgVqT0
         B3Ambjj/6kAh41wQYy1H/CcPk2wjWlw+ROd/bCJlWBGROm+evNOEm4p6w7cbpPeG+s6U
         lz8g==
X-Forwarded-Encrypted: i=1; AJvYcCVrM+Gpum5BlJgI3TqdrTuhwsyPQDEstn/FA4Qf44H+cNb0C9mbkwnwBU2WF28QPMgGdeYVhcuiwVaf@vger.kernel.org
X-Gm-Message-State: AOJu0YzwQjZ8NIk2tmRcHTQSDr1lV9Acof4b3gnJjEZCJ0Z97PdU0aFH
	EifgfMKtp3zkOAFu4z8E5n2Cszd5ER7joMoXvePeCbfA77jNyDZaViQk0obzT5AN
X-Gm-Gg: ASbGncunQQ2sdXtrO4tvmMbIFzJ9Tu52r5WP2XDafTkALh4+4E753KcmxDXfg5nordp
	rJADqghvxwtCSHOw4tp/AQZzfMOxU4dN69tGnjg8Tj0+VJciA8RqTtgTFFPhbn7rKPbgm3KXgxo
	GemdQsRS1JlXluYxUBUqj2Q5nsKN4iQ/+s59tH05HObucP+LSBkyxNEh+nyEAID4pemjpM3RYTs
	t100AGdNNA7glZPTLwcx6FmyNOSZbBTQqiBFC4MAdEcwXLaRdsRyyWFE5iBgvSIM7X0KUHuzogL
	WG+DO4y/cXJAqi0aMIgx3K5DOHnu8SChY7bab2x9rgNXZZR98cDjNWDw4sk5CADTDWZ1v4Vpf8a
	qjR2REhqTM5YKYgxMUqjwUu8hgsXFT9YakXzOfPaxohJoG6T7nnByNoiEzCeIx146tbQeZaghb3
	yBl+9HRTqm2UtF1rWcRE8XUbWFO2w+6FmI3BRdf+rIFEUk0PNe65yw
X-Google-Smtp-Source: AGHT+IExXPqr774LWSLGsnHWHuUlqeUeysbXR1vJA1Hf9jjVIPIscSRoSZ4YUS7vqBF8M+s9UidRTQ==
X-Received: by 2002:a05:6102:6c8:b0:5d5:fefc:9fd0 with SMTP id ada2fe7eead31-5db9027acf2mr856174137.0.1761748239454;
        Wed, 29 Oct 2025 07:30:39 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-934c3ecfff5sm5261285241.3.2025.10.29.07.30.39
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 07:30:39 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-932cb562289so2350995241.3
        for <linux-gpio@vger.kernel.org>; Wed, 29 Oct 2025 07:30:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUdd4C0KUE8XECmwmiiEKnTGdqJm5erMIxC48vOWsT6iqdciIfySKXNpsc9GzIgS4LU1gc4myhFTPX1@vger.kernel.org
X-Received: by 2002:a05:6102:3e95:b0:5db:38a1:213b with SMTP id
 ada2fe7eead31-5db90656011mr932905137.27.1761748238614; Wed, 29 Oct 2025
 07:30:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1761588465.git.geert+renesas@glider.be> <03a492c8af84a41e47b33c9a974559805d070d8d.1761588465.git.geert+renesas@glider.be>
 <CACRpkda6ykSZ0k9q4ChBW5NuPZvmjVjH2LPxyp3RB-=fJLBPFg@mail.gmail.com>
In-Reply-To: <CACRpkda6ykSZ0k9q4ChBW5NuPZvmjVjH2LPxyp3RB-=fJLBPFg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Oct 2025 15:30:27 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWriu9eUHMSKcv7ojSqbquP3=z2oaquQZLx5nmN0EcGaA@mail.gmail.com>
X-Gm-Features: AWmQ_blleyKJMjc4oETFxToQhJJ0bdzSdD1fdMmRWAHt71coVgn8wIHcAFgDdM8
Message-ID: <CAMuHMdWriu9eUHMSKcv7ojSqbquP3=z2oaquQZLx5nmN0EcGaA@mail.gmail.com>
Subject: Re: [PATCH v5 07/23] pinctrl: ma35: #undef field_{get,prep}() before
 local definition
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

On Wed, 29 Oct 2025 at 15:20, Linus Walleij <linus.walleij@linaro.org> wrot=
e:
> On Mon, Oct 27, 2025 at 7:43=E2=80=AFPM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
>
> > Prepare for the advent of globally available common field_get() and
> > field_prep() macros by undefining the symbols before defining local
> > variants.  This prevents redefinition warnings from the C preprocessor
> > when introducing the common macros later.
> >
> > Suggested-by: Yury Norov <yury.norov@gmail.com>
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Do you want me to just merge this patch to the pinctrl tree or do
> you have other plans?

My plan (cfr. cover letter) was to take it myself, as this is a hard
dependency for 11/23.
Thanks!

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

