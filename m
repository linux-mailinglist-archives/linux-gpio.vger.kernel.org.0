Return-Path: <linux-gpio+bounces-27953-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D77C2AFB2
	for <lists+linux-gpio@lfdr.de>; Mon, 03 Nov 2025 11:17:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA8BE3B38C8
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Nov 2025 10:16:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE18E2FCBED;
	Mon,  3 Nov 2025 10:16:38 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0044F299937
	for <linux-gpio@vger.kernel.org>; Mon,  3 Nov 2025 10:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762164998; cv=none; b=L4ooSfzsW4FuR7jQTM+p307Lpmw1jQGJeZuEmsWv8ylAOTyKKY2KEVHGlfEQXlHV5c7ctJUP6gTkZogy5KUrkRkV9HtgL0Kq70oD2JbziEu0XtNOdNkPGc+1u5iAQHKCll/NFAdrKv4YVRfXk0z1xOljsu8/AtgWRKs3EtmR5/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762164998; c=relaxed/simple;
	bh=mTHQRbPtXcLW9RC24UimP00dT4bpQ240D8TduWco7Ms=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cyPNwG1hGTDXiY8UbV9U+bXX4ObY+7/tvnYLgoNdL6bO14eANt0TP12hQ8YWnKyjE//dFwNFUdvW5PN+zzhzPW1rzQLa3M1fh0BoWsMILigSNjN4oAzrB69WUmG8k/GzDh2jbslNkGDWrxIrtEO0UGE4xzTUg4h+M7VU9239fKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-340c39ee02dso1509974a91.1
        for <linux-gpio@vger.kernel.org>; Mon, 03 Nov 2025 02:16:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762164996; x=1762769796;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WN9rH9/69UaI2zM1r1sL3pcOf4U1LH9TZ13cniByZO0=;
        b=xSd3o94Q2hap/khzptJGO6GUFKAS2AQadnAmzSYyWfY8bU/jselV2JadwXMv8cb//Y
         lOIAomQj8Q9nTlJPbjZKzouGCJawdov0VfqHmg8Z82qARzG7GHNdVR9lA0lpFGc0BFq1
         81ZQ0LifyXs6ypAI8jvip4z9xOUctk4O1fgmWjBW/ItNLijfJVZ0Yr061wo6T0bfNQFA
         5KQ52/5vU1emhNU6DZGE9LReHIjdqFbL3cf51l5tJP0XhEV4MI7yhPqfYmY10iZ1zJOh
         S/sKHk1DJSXxPwADsvDjXa8iy8jxbuDcvoH3OSSUTMZQgr/4HwUaxk/MJsNlzXzo6G8r
         KgsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUiJN2NTzcVGzXMiLctk4hAUGc6j0csUIKJefpKPHwCv7KptAUH8X4FdUlUX6HwA0sAQyrv9XbXg2tD@vger.kernel.org
X-Gm-Message-State: AOJu0YyF5Vfsc/OSDgru5kegMcvRPJaMAKi0iazYfiTppRej0+/nrk9o
	KeTDXKYVIXooq0fw4c+UakLb6apNHffL/tFpTCjl9cFBwI0aw11GaF3rUIKXyjdS
X-Gm-Gg: ASbGncv3fkUKD/R0s3R3jut1rrI8ardNVYF11OjuuhbMWiCxAb2M7NH/h5Do8phG5Mq
	4PSuDA5wgfRjS59mFpz/s8DMQehnZtyO+Myncvsc+nOwML74fHAq5yfuexIf+QIdyWI3Me5IBnG
	INbYWAFJ+pPMXwMPnxd8OCKmCfsevBrE4y/y10ybijydtBKUr4Sn2xIasC89dwDc8lSzWlwgYKv
	bJwrzvNBRArRG2BNoF+lvkbDjBfT5s9BOAmbfAfrAWwTfu61ovVyiyV5iXGcx1aIeT5B+z8XovG
	o75eCwEgpYsL8Pkhb5HAKmmwK6hwujMGtJhHEU6BbiPv89P4FsUhklTF36+P4Lp3dMSf1ln0ySi
	Nvj1BW8XhZeuC5NM78vJXClLmKc0Z2n+USmF5MOn+YD7/QD54FtjxUOJYFZjgCstq3B5L1J+4CV
	OCWw6CeKnjmWS1noUDXMzfga0fw+zsDHFd5zva3ViD9wttmnGO9jgPvPmsbjW9sz/5Y6w=
X-Google-Smtp-Source: AGHT+IEnWnVW9hMN+H9qW2zhZktVzJ4/UC44X6xcfp8DdFnmOeqfn/ulKHnyDDgW8EUGmkeEDfMsCQ==
X-Received: by 2002:a17:90b:5288:b0:32e:5cba:ae26 with SMTP id 98e67ed59e1d1-340830747a7mr13292554a91.23.1762164995786;
        Mon, 03 Nov 2025 02:16:35 -0800 (PST)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com. [209.85.215.181])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34159a15b6fsm498646a91.18.2025.11.03.02.16.35
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Nov 2025 02:16:35 -0800 (PST)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b608df6d2a0so3876524a12.1
        for <linux-gpio@vger.kernel.org>; Mon, 03 Nov 2025 02:16:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVO+yw+kg0fLbjD+43OfeAlx0OYDxNasWTCVZTc+JQXdE6+FMa73wBHfsw3/LK+ZGSaTJ7XHdFYTHy8@vger.kernel.org
X-Received: by 2002:a05:6102:418d:b0:5db:f031:84ce with SMTP id
 ada2fe7eead31-5dbf031902dmr85155137.29.1762164587067; Mon, 03 Nov 2025
 02:09:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1761588465.git.geert+renesas@glider.be> <97549838f28a1bb7861cfb42ee687f832942b13a.1761588465.git.geert+renesas@glider.be>
 <20251102104326.0f1db96a@jic23-huawei>
In-Reply-To: <20251102104326.0f1db96a@jic23-huawei>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 3 Nov 2025 11:09:36 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUkm2hxSW1yeKn8kZkSrosr8V-QTrHKSMkY2CPJ8UH_BQ@mail.gmail.com>
X-Gm-Features: AWmQ_bmxzzzgoIljXMDy5wJmHF15bg4ZKICGjY8c2_gWom3ME9XAPzMw0ghLXn4
Message-ID: <CAMuHMdUkm2hxSW1yeKn8kZkSrosr8V-QTrHKSMkY2CPJ8UH_BQ@mail.gmail.com>
Subject: Re: [PATCH -next v5 10/23] iio: imu: smi330: #undef
 field_{get,prep}() before definition
To: Jonathan Cameron <jic23@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	David Miller <davem@davemloft.net>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Crt Mori <cmo@melexis.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Jacky Huang <ychuang3@nuvoton.com>, 
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

Hi Jonathan,

On Sun, 2 Nov 2025 at 11:43, Jonathan Cameron <jic23@kernel.org> wrote:
> On Mon, 27 Oct 2025 19:41:44 +0100
> Geert Uytterhoeven <geert+renesas@glider.be> wrote:
>
> > Prepare for the advent of globally available common field_get() and
> > field_prep() macros by undefining the symbols before defining local
> > variants.  This prevents redefinition warnings from the C preprocessor
> > when introducing the common macros later.
> >
> > Suggested-by: Yury Norov <yury.norov@gmail.com>
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> So this is going to make a mess of merging your series given this is
> queued up for next merge window.
>
> I can pick this one up perhaps and we loop back to the replacement of
> these in a future patch?  Or perhaps go instead with a rename
> of these two which is probably nicer in the intermediate state than
> undefs.

Renaming would mean a lot of churn.
Just picking up the #undef patch should be simple and safe? The
removal of the underf and redef can be done in the next cycle.
Thanks!

> > --- a/drivers/iio/imu/smi330/smi330_core.c
> > +++ b/drivers/iio/imu/smi330/smi330_core.c
> > @@ -68,7 +68,9 @@
> >  #define SMI330_SOFT_RESET_DELAY 2000
> >
> >  /* Non-constant mask variant of FIELD_GET() and FIELD_PREP() */
> > +#undef field_get
> >  #define field_get(_mask, _reg) (((_reg) & (_mask)) >> (ffs(_mask) - 1))
> > +#undef field_prep
> >  #define field_prep(_mask, _val) (((_val) << (ffs(_mask) - 1)) & (_mask))
> >
> >  #define SMI330_ACCEL_CHANNEL(_axis) {                                        \

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

