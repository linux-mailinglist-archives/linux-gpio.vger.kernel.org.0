Return-Path: <linux-gpio+bounces-27841-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C67C0C1B9AA
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 16:20:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A92F25A63E2
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 14:34:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 336A2279DC3;
	Wed, 29 Oct 2025 14:34:05 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9260726C39F
	for <linux-gpio@vger.kernel.org>; Wed, 29 Oct 2025 14:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761748445; cv=none; b=aW7WdkEkouHC5k/iBXY0aS7+VfdXsM0ZD8c49LwgiGcosnaEuMVmhmgIkAZRo3qdUrNZ1bsVlNP7zMyf3wlzb504zU1TQn6kyKc+WW6myCuj45NcCnAVauc3dUx8U52wLsQmQeqJXoJLAsnOGPZ8TvJGzN7u+l282GQqbpjF0As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761748445; c=relaxed/simple;
	bh=FbqavNtq8VJC+dwAXLJIaCG9l+pt4WVO7NOuPi3OYaE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fkw9p0JCnpYvo9sCi5cRsIZ0n9QS9S8B6EZRCwv8KxUXx0vnIfih6RHq5W5mA0Nt4xo1epwgomk0fyJLZdZuLLwjkSpedHy+ACsY3ft6qa5Pm3V4bAQ8lJzkHoR5D/ryH96xolTKTwZKC4I02m+eTyu0A23wQ62ETBgaJMpzqqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-59a8c1eb90cso4342615137.0
        for <linux-gpio@vger.kernel.org>; Wed, 29 Oct 2025 07:34:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761748442; x=1762353242;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kNDkhDDabcFgtYSzLRibzijDMaquJ035sDb5A+sIiAE=;
        b=QAZQ1RqJTnZR9CKo5ktrBbvuqq3bEfOFy81U3tzRhagyRX4hwHg1qWoNWv7dC1flxQ
         DAkAUAQ+TQjOtavfRSTL86kp2veDomCVGefGfFH2l+rofahS3X+nQMyzl/01Bk03IaHa
         PkFjZbl1oiLTxQtCUQpnwSTFmcP6J9+txFzY7q33pP7qk5iY8tIvGDJbLzaGe/lPP2Xy
         SDJ1wJ2Ipr4M3XX/H4rkdymsGJF2UPg0Jv9XCZ/MB7cCQoTq7sehpcE7aoNPODvrCQq1
         MGG6Q3nFl0CmaE3V45iAA4pqNyl0F9BUJCglIAHJRpdg/LYVTYj2J3mJWEEl9AcZImOv
         on7A==
X-Forwarded-Encrypted: i=1; AJvYcCWkG5IJ7j+4StxidcdtLH4jj4CEHLH/2HyuzFCLx9bsIt5+PvRSFbkt9Pcttv2RmNix03fENHNFZ4Ke@vger.kernel.org
X-Gm-Message-State: AOJu0Yyoz398x3QyCLwUYVUtVTu1uOz6dGlhFClTG3ZVUtkAEvnk0ffT
	iFPvImXY7hSeoYDX7U+abTWbw7e6KaN+/CMun0xDoeczVwVjuKEXOKf6X/NHJzQj
X-Gm-Gg: ASbGncuKKL/icde5qEFpXPDbs+Lpz+yeS4+O4niQ4uZKxj+ewsKgT2mDNgAvnOQtp/C
	/p3PXaVKFHQfTDBr+9jDqXtBLzSBaqgIgQ/NoudycofGXUxwYN8nsowYVgwptx32umiRJf1Hw2E
	MwE+DHQR4qa/Lv80gMp9i5T0VNOi1o9Lrwq3msLF7T/iionW0fRoZVTEEcebwgwbdB4GLk2DSxX
	GupUYfhP4E8i4KixtHiehmjiHB5jfaMNugsyLw3bNUINpEbf3htGFsyuc6Tb4t4HEYYPxSqLL0Q
	q40gyZWIacqPXD9DzHNTpJG/+M+h24l/gt49MDlYTzERc77wpzZitpEEpbmApEhgRZpz8WVz6L2
	i7zMwFRTYvVL9rOGl1IdA3p+eGy/CQzvx/MeO81wv5g6ifAH1Alt1X9uEN2gDZmQdQVJCa/aToN
	7kg4ACRvFuQBkhmNfcbGUHqeax/f0qS7Ym+YGh+X6t7g==
X-Google-Smtp-Source: AGHT+IGfa3ZSyXjqYr6qdaDdQuSqpUnZ3ADCqK9/dU+I9IMMzt9qCC2bhbKHkcwMJxxtM9L2TSIeQA==
X-Received: by 2002:a05:6102:3f48:b0:4e5:9426:f9e6 with SMTP id ada2fe7eead31-5db90675edcmr999936137.23.1761748442177;
        Wed, 29 Oct 2025 07:34:02 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5db4e52198bsm5102753137.7.2025.10.29.07.34.00
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 07:34:01 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-89018ea5625so3055553241.0
        for <linux-gpio@vger.kernel.org>; Wed, 29 Oct 2025 07:34:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXsw3PUckrg7YaYM4xA33kPw47Is32oMUHk9XmCPOeTpXEF1r02L5ImUGpMaLVs3ZGIK+pit1Og5vKK@vger.kernel.org
X-Received: by 2002:a05:6102:26d3:b0:5d6:156f:fedb with SMTP id
 ada2fe7eead31-5db90694687mr933346137.36.1761748440676; Wed, 29 Oct 2025
 07:34:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1761588465.git.geert+renesas@glider.be> <03a492c8af84a41e47b33c9a974559805d070d8d.1761588465.git.geert+renesas@glider.be>
 <CACRpkda6ykSZ0k9q4ChBW5NuPZvmjVjH2LPxyp3RB-=fJLBPFg@mail.gmail.com> <aQIlB8KLhVuSqQvt@yury>
In-Reply-To: <aQIlB8KLhVuSqQvt@yury>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Oct 2025 15:33:49 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUTR2VnQ++j_ccUN3-GzKmSzS3H3QNyYqZNacfOBXD50Q@mail.gmail.com>
X-Gm-Features: AWmQ_blqiXGJheNiHtKi_cJSwq0gfFP8sAonrx_tsjN_f5pUMr0aiWqvAOsiPck
Message-ID: <CAMuHMdUTR2VnQ++j_ccUN3-GzKmSzS3H3QNyYqZNacfOBXD50Q@mail.gmail.com>
Subject: Re: [PATCH v5 07/23] pinctrl: ma35: #undef field_{get,prep}() before
 local definition
To: Yury Norov <yury.norov@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	David Miller <davem@davemloft.net>, Bartosz Golaszewski <brgl@bgdev.pl>, Joel Stanley <joel@jms.id.au>, 
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
Content-Transfer-Encoding: quoted-printable

Hi Yury,

On Wed, 29 Oct 2025 at 15:30, Yury Norov <yury.norov@gmail.com> wrote:
> On Wed, Oct 29, 2025 at 03:19:45PM +0100, Linus Walleij wrote:
> > On Mon, Oct 27, 2025 at 7:43=E2=80=AFPM Geert Uytterhoeven
> > <geert+renesas@glider.be> wrote:
> > > Prepare for the advent of globally available common field_get() and
> > > field_prep() macros by undefining the symbols before defining local
> > > variants.  This prevents redefinition warnings from the C preprocesso=
r
> > > when introducing the common macros later.
> > >
> > > Suggested-by: Yury Norov <yury.norov@gmail.com>
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > Do you want me to just merge this patch to the pinctrl tree or do
> > you have other plans?
>
> There's a couple nits from Andy, and also a clang W=3D1 warning to
> address. So I think, v6 is needed.

Indeed....

> But overlall, the series is OK, and I'd like to take it in bitmaps
> branch as it's more related to bits rather than a particular
> subsystem.

OK, fine for me (if I can still get an immutable branch ;-)

Note that as of today there are two more to fix in next:
commit d21b4338159ff7d7 ("mtd: rawnand: sunxi: introduce ecc_mode_mask
in sunxi_nfc_caps") in next-20251029
commit 6fc2619af1eb6f59 ("mtd: rawnand: sunxi: rework pattern found
registers") in next-20251029

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

