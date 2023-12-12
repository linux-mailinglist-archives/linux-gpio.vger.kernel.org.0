Return-Path: <linux-gpio+bounces-1301-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5050780E8D1
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Dec 2023 11:13:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E7DE41F21431
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Dec 2023 10:13:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F2A95B5DC;
	Tue, 12 Dec 2023 10:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="Fc0Q5ZBK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1C1A95
	for <linux-gpio@vger.kernel.org>; Tue, 12 Dec 2023 02:12:37 -0800 (PST)
Received: from darkstar.musicnaut.iki.fi (85-76-99-187-nat.elisa-mobile.fi [85.76.99.187])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: aaro.koskinen)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4SqDv32W0NzyNL;
	Tue, 12 Dec 2023 12:12:30 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1702375952;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xGNLdE/8ed0e8kN8Cvo1fLztNL7Z2mJETPlv7pn8o7I=;
	b=Fc0Q5ZBKZUQgX0sskhzglISWjq4mRE6mTD3JsvZEXcqL4YwP62+qmqt2KHkGCPtPfkMbUN
	erc2723BDNSU+IuRa/H3YUMqQQKiPelWonNtiY/BuJuaQa3hLRP0JuebtgU8gX1UxGbwJq
	zXYN9SrRVrLD7BCqSyNLRxELRRntf5o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1702375952;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xGNLdE/8ed0e8kN8Cvo1fLztNL7Z2mJETPlv7pn8o7I=;
	b=reVM0Odiu7Pdd8B/59mUdT8K12KBuTrPCWdgcNUC1xdscGcljVQLQPGwNH2c7RM0Hs4Psc
	i/hNVrhbNHKZHhn8na5OnVAHIYuJl8u6jc8s3pfC1jBiQzpJKptqjOcWYKEsqm6nCCnOje
	AZjNPYfa2j5gNOz1oFH1bTKG1Oov2uc=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=aaro.koskinen smtp.mailfrom=aaro.koskinen@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1702375952; a=rsa-sha256; cv=none;
	b=ow1dc8lv+bNDqcNuC7AVjrpmGzIXNEWQO30cDj/Vr/x75HftDH0eAQrTR6A1siclYf9Xlu
	q1GT9M6Prlrtz0sG/3BAbugDsjgpwBvT3oSdQcJncICa29Q4Pyi4hKhWq9Esm8qN4mB9J3
	7lLPTXRO4E0p/8oPzfUx6n55jCOzr/A=
Date: Tue, 12 Dec 2023 12:12:28 +0200
From: Aaro Koskinen <aaro.koskinen@iki.fi>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
	Kent Gibson <warthog618@gmail.com>
Subject: Re: GPIOLIB locking is broken and how to fix it
Message-ID: <20231212101228.GD12022@darkstar.musicnaut.iki.fi>
References: <ZWKL4r9DREwYjnyo@rigel>
 <CAMRc=Md6y=91o_zB7ePLM1tEfG7sjgE2tujZXSRTQQ8y8oJnPg@mail.gmail.com>
 <CAMRc=Me3JV6yjfRK6TaVtVYV0zhbn=274uCzbfYZ-uywaSuz0A@mail.gmail.com>
 <CACRpkdb06kOV82Ssyv4ERPbRorbwj9QdpZtHAEVDv6GMGMhFOA@mail.gmail.com>
 <ZXMgmhTioEQ78Xeq@orome.fritz.box>
 <CAMRc=MeB9noBavBRiuKZf_6iWZJY0+ZG=n+ddGOs+TVavvuEfQ@mail.gmail.com>
 <ZXNHG0yp9QVflLBG@orome.fritz.box>
 <CAMRc=Mfg0tYwmiNfTkX+aBJyZSk0TG-EXmnd=3R22wmT7q53Tw@mail.gmail.com>
 <ZXbqjY14ick-3YpW@orome.fritz.box>
 <CAMRc=Mex=1jWD8OrU8PzkVjk2iCorv=2Kofjo0iD7CJEiBA_bw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Mex=1jWD8OrU8PzkVjk2iCorv=2Kofjo0iD7CJEiBA_bw@mail.gmail.com>

Hi,

On Mon, Dec 11, 2023 at 04:49:43PM +0100, Bartosz Golaszewski wrote:
> Aaro: do you still have the HW to test this driver?

Yes, and I still use it.

> I understand the need to disable interrupts during writing or reading
> data - when we are driving the clock line. But do we also absolutely
> need to hold the spinlock when setting the direction of the data line
> to input? Because if we don't then we could modify the last remaining
> offender to not set GPIO direction with a spinlock held and finally make
> gpiod_direction_*() functions sleepable.

Hmm, I think it's required to be able to provide atomic xfer function.
That is needed for e.g. for power off.

A.

