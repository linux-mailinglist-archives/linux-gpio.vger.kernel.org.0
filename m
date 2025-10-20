Return-Path: <linux-gpio+bounces-27311-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 74CC9BF1F2D
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Oct 2025 16:57:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A27584F6558
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Oct 2025 14:56:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3014227E95;
	Mon, 20 Oct 2025 14:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C+52i0G1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32681514F7
	for <linux-gpio@vger.kernel.org>; Mon, 20 Oct 2025 14:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760972195; cv=none; b=bjC8a80iLssUdUZ1lU11PMmW7vtWkujSLeCPgHm9LF0GuqzgMzFj/a9BukjmVlfG3js5+UXULBzePB7JhR7FlMecODlPrk/oMZaXDdz2Usni83hX7h0zd30Qe+KQ40xuxo7sCUevsbZ15CBJB834O/Q7nXqJTWA8SJZ6HJkHJY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760972195; c=relaxed/simple;
	bh=Sug/TiaFVNCgE/OTMIDWvRovNGDHRM3X2PR+kC0SaFc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bzNuuuUFMN46BAdOtoVYpTTsIYAnPTAfmX6vY8Ne0+7SAfTUA12UTcQKZtJKta1R4Ce4fdYORArmplkM5/PNCVUjPmZ10B3H80njI1LD67N9SsFhwNyzj1jtievulV+5OiLuFeO9QTkIuEdtcs6ppyWE47gLqhTuKlwmlRhY0HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C+52i0G1; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-78378cb66d6so26324357b3.2
        for <linux-gpio@vger.kernel.org>; Mon, 20 Oct 2025 07:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760972193; x=1761576993; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DErh0jkxEaTV4PU1gk6ECpXb4KgwIGFW/OBZ7JW1qeg=;
        b=C+52i0G1Q5aLYH8+WnTKL2NZUdCf1L4lQCQitDT3kcaz8o1OVvR/hul5Lo05P+kTdK
         wSAk6OtNDnvAnZ9yazIGJxLkY5PNCsVPgcaoBAt642cUwZUBPg3XF3ibWybW2syzEV4O
         t0IobW43VIv7D8O8BXNptHEdhwel+TTc7SEYDaz8eZqbejXyVE0cau6Nw5OHikq0KCNZ
         +EwIno3T6IvxkbX7HvnmwFls2Dh7Rp7a/1fr6ygtjHTg51cAgBICGl+WnI4BLqj03oxC
         wSfBAbyrfcFOB7pkZQIwetrPw1e36Z4M/Ri3+AWWiJ+FajQE/cxpYJu2lDmEpwYU9sgG
         RmvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760972193; x=1761576993;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DErh0jkxEaTV4PU1gk6ECpXb4KgwIGFW/OBZ7JW1qeg=;
        b=sS7R4mG52DvFBkfnM3ygp2unUGMp3WpPjZO8/xjMnUgHehAHA4TF4sIIeq5jhNgJEk
         BuaboiFwcTP4w4oP8vlaFPa9ZF8cAxxorVqG8piIGI7zsScsZ9FIThLJfI80w/HdDtAd
         13YSb8LqOpS0A6gUScn6NcJlBMHFuQSLzhUhMxkoyiB81mn7Q/mfZzVV0d+DmVYyIBwj
         v/BkB38muZKYaDOla/qxmC9xyIYJs2igq//SWtQi2jJWejMXTvtsxiPaVi0wJDGWme+6
         RCkwos8+RCleTijykwhHtiZuXa9gqpcK5i9kxiQyW7PAlc1FqD58E7s7fqzs0TcDUAoZ
         45iA==
X-Forwarded-Encrypted: i=1; AJvYcCXL9GoP4zBGFuYNzGQt+vxmsa3SrDLt2Rs9XABqT0+TQ8yRKtxYUhKbnVP0kxAQFQjHVhOsN2U/VYz2@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg1FcLO143FIckz77/ld+ypcMY7z6vZ3losPBbzd6ddG6W8q2A
	6HaElWW8tpVLG+tarxJ/zTAssFSFEvGx+p+f4JHA+GND9bE91Ebsf1jp
X-Gm-Gg: ASbGnctdg5JPnLIj7MAWJDl2XR0gW7bjHyjkmIeOFzsYeuUs2ADiSk3eXqRfImm/Y90
	lAbPV8DKBBJX3NH4kIQTxx1mVuiUzssE5grmWcHj8eBxus1KcBsY1DxO46h5M//foqeHIRmVVBX
	1CTi2VZu7YZ2etbD+LT+oQ3+ev7I7NPrcgNy8D4sqv/Zxl3tzmLVFFJ797eM8QeMgw8knyyzVYZ
	GnEliK3M3qjQ1j4MJ+Lc5Yt6xfx2FBOsuLkjvmCG6PpZrm6E2RujVz/iQgPnd5bZslkskZgzfJc
	H3SmbgyENdZMgIjwo5+therSOodVYgZvayxTNuzgVxX11PytZ66l1TisePwJFmLUuwBbQeUA2Ni
	1NKdxdV0D1CZ5l+4JdatalmdJBQztDbHTDAZQYrvTiAUpogszk2pYGIXRSL71Qp+k/aUCDnXu0/
	m18IxjKKaMxdc4Gfpx9fGmhUF76WNrU1hb
X-Google-Smtp-Source: AGHT+IE81F/jaXbyHR42ph2vrE4i4G97ZO8UgGatFFTjrjbQ0UYwj8u7zrZ9iwbiKwTlSepO74M7sA==
X-Received: by 2002:a05:690c:951c:b0:781:1280:db43 with SMTP id 00721157ae682-7836d3bdceemr92264887b3.68.1760972192509;
        Mon, 20 Oct 2025 07:56:32 -0700 (PDT)
Received: from localhost (c-73-105-0-253.hsd1.fl.comcast.net. [73.105.0.253])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-784674d66fesm21762357b3.41.2025.10.20.07.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 07:56:31 -0700 (PDT)
Date: Mon, 20 Oct 2025 10:56:30 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
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
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] bitfield: Drop underscores from macro parameters
Message-ID: <aPZNnmot-Z5a2yIc@yury>
References: <cover.1760696560.git.geert+renesas@glider.be>
 <792d176149bc4ffde2a7b78062388dc2466c23ca.1760696560.git.geert+renesas@glider.be>
 <aPJwtZSMgZLDzxH8@yury>
 <CAMuHMdXCoqZmSqRAfujib=2fk0Ob1FiPYWBj8vMXfuXNoKhfVg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXCoqZmSqRAfujib=2fk0Ob1FiPYWBj8vMXfuXNoKhfVg@mail.gmail.com>

> > I agree that underscored parameters are excessive. But fixing them has
> > a side effect of wiping the history, which is a bad thing.
> >
> > I would prefer to save a history over following a rule that seemingly
> > is not written down. Let's keep this untouched for now, and if there
> > will be a need to move the code, we can drop underscores as well.
> 
> Fair enough.
> So I assume you are fine with not having underscored parameters in
> new code, like in [PATCH v4 2/4]?

Yes, sure.

