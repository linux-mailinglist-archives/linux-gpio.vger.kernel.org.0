Return-Path: <linux-gpio+bounces-1311-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A0780EEDB
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Dec 2023 15:32:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CCEAEB20D65
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Dec 2023 14:32:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82956433A6;
	Tue, 12 Dec 2023 14:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="luLr8kl9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EC088F
	for <linux-gpio@vger.kernel.org>; Tue, 12 Dec 2023 06:32:26 -0800 (PST)
Received: from darkstar.musicnaut.iki.fi (85-76-99-187-nat.elisa-mobile.fi [85.76.99.187])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: aaro.koskinen)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4SqLfv2cxtz49Q4j;
	Tue, 12 Dec 2023 16:32:23 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1702391544;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b9wCW1Iiycjv9MEcHWV0VQx5y949Mi38my1MFUCSXK4=;
	b=luLr8kl9F2vYf3B0fNgr4XDbtqxo3WcaC9N+4ewV9y89XmXYjbbApXFjwNFpqLQVJ+gnqh
	EYGGv5134coLXDAg8gqm/CXFuoet1S8u43FSVmUEXy+gg/WjPeqI1s9H1xuqHl4FaqIwo9
	fgDSXQktKXnpwOA6cfVYmCl90xE9qVahJJl7ZZJl+HLuo9WIIJff0x4y6YNvrZDKQ0uqQv
	7MeNh8oDjsXUFIA2Gp/aXy0C6AcE/3YjRvOb5D51HpAc8tvsmVL26loKicnpBCFBmHrBun
	2IrfGV8jur+NG2qepFYjQaqAunfocrslJBEbLHNrQlx8WE6xh0fa8kThr/13Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1702391544;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b9wCW1Iiycjv9MEcHWV0VQx5y949Mi38my1MFUCSXK4=;
	b=uJvlW1au6Fv/oXTOV7YK8s8/R6aDpaJh3q+PQYws4lJfaH46jLssSDnLGsJfQRD881bX07
	eH0a8TgeaxWKWA8Y9i4XgmFx56N29l9/9GZLWhVPlIVxMsED6y5SMQSi3lKh3NblsRouxw
	zOg8bhUedxaWnSoOaEkbIzC7cOfkmPfvyjNVBBcF3czoIwhlVlN9Po4CouszViU/RZj1+D
	b2A6T02T/w/jbKxUzcUYzvCuDZwraIEYrUIgPE3Ro67WqHz3FsJKX5hRn81XXqyTjVa49N
	L9mlMujFkYyIEEia1QkZAkXDCBuiDQRUpNktm3zgOTOPA03EadB9oaeYO1rKkg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=aaro.koskinen smtp.mailfrom=aaro.koskinen@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1702391544; a=rsa-sha256;
	cv=none;
	b=vbXqmlhcRUVnL5DE+sZvcAtOrb8QGdoejH84u2udQz0TrGGGVXnIQWXGvyn7TkDQNPc4uK
	h8YvpTrfdQKKkVprEZ5Ed9Gd5Brr1t5zRr8H98FKhlhsmlSlvj1Om8GWviISXZtMo4YLYl
	bM6Rtatff5v0jj5A8F7x67mF3bWcN5qbzLIADR1jgkuq90tEe/4Q8Y0VJOP+fT7RbDkjvI
	G518nMbMaTOYEo715Esqv53q7BI0MPnifAhQ/xa8B5YeFWoJNVafaFNqo2HnEA1+3ybgVP
	XQoMcNAnQgsja4W1dZAuImNwicjWTR5B0cPsYdYL+3yGKdSeO3E0xdabPv2UzQ==
Date: Tue, 12 Dec 2023 16:32:21 +0200
From: Aaro Koskinen <aaro.koskinen@iki.fi>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
	Kent Gibson <warthog618@gmail.com>
Subject: Re: GPIOLIB locking is broken and how to fix it
Message-ID: <20231212143221.GE12022@darkstar.musicnaut.iki.fi>
References: <CAMRc=Me3JV6yjfRK6TaVtVYV0zhbn=274uCzbfYZ-uywaSuz0A@mail.gmail.com>
 <CACRpkdb06kOV82Ssyv4ERPbRorbwj9QdpZtHAEVDv6GMGMhFOA@mail.gmail.com>
 <ZXMgmhTioEQ78Xeq@orome.fritz.box>
 <CAMRc=MeB9noBavBRiuKZf_6iWZJY0+ZG=n+ddGOs+TVavvuEfQ@mail.gmail.com>
 <ZXNHG0yp9QVflLBG@orome.fritz.box>
 <CAMRc=Mfg0tYwmiNfTkX+aBJyZSk0TG-EXmnd=3R22wmT7q53Tw@mail.gmail.com>
 <ZXbqjY14ick-3YpW@orome.fritz.box>
 <CAMRc=Mex=1jWD8OrU8PzkVjk2iCorv=2Kofjo0iD7CJEiBA_bw@mail.gmail.com>
 <20231212101228.GD12022@darkstar.musicnaut.iki.fi>
 <CAMRc=MfYhOyA-owP=VvXXJqnGc31DCkee0to-hMXreoAPCow0Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MfYhOyA-owP=VvXXJqnGc31DCkee0to-hMXreoAPCow0Q@mail.gmail.com>

Hi,

On Tue, Dec 12, 2023 at 12:00:11PM +0100, Bartosz Golaszewski wrote:
> On Tue, Dec 12, 2023 at 11:12 AM Aaro Koskinen <aaro.koskinen@iki.fi> wrote:
> > On Mon, Dec 11, 2023 at 04:49:43PM +0100, Bartosz Golaszewski wrote:
> > > Aaro: do you still have the HW to test this driver?
> >
> > Yes, and I still use it.
> >
> > > I understand the need to disable interrupts during writing or reading
> > > data - when we are driving the clock line. But do we also absolutely
> > > need to hold the spinlock when setting the direction of the data line
> > > to input? Because if we don't then we could modify the last remaining
> > > offender to not set GPIO direction with a spinlock held and finally make
> > > gpiod_direction_*() functions sleepable.
> >
> > Hmm, I think it's required to be able to provide atomic xfer function.
> > That is needed for e.g. for power off.
> 
> By xfer: do you mean a request-response pair? Or just a single atomic,
> one-way transfer of data?

It's reading a register, then writing it back.

A.

