Return-Path: <linux-gpio+bounces-25322-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A9411B3E3DA
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Sep 2025 15:03:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B71D1A8369E
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Sep 2025 13:04:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C50837A13A;
	Mon,  1 Sep 2025 13:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="Z2PuDyU1";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="lzFhklXV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06D54A23;
	Mon,  1 Sep 2025 13:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756731828; cv=none; b=Pof/ErLPpJeS9kwTPvlQ82Z++VmsAIxILLc6kL39nZj1X6hbL1se0c6nvCKLvWxEA7WdFJhOH+QMoOOZSCYWNgUtHM3XRY7Zpv97UsM7RfeAGMZHYaY2mXXOljG0xXNXRXtiHhZW1tcScLB0YnWUaC81iUMcP2w7LO7gNr/9Fw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756731828; c=relaxed/simple;
	bh=OaRyPpEf3ICJUO5J1Am7yd7CIdfX8HTlK9xK90rfFMw=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=MtjGBSqesvzcAP0GcUlj1eVoxioXevu/QhCP1UAUCloDkXtLKBoM2uPIicGCGIcQ4fE5W9HTnaSDMcF+qY1aAB/NTEEkzda1xvSYtBlYtXfpq6Qj+4lYqH40E6TpUIz7ttbORPz+3zNsH/o4UltXaSgVBowZiBeuPvSOeNmA7D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=Z2PuDyU1; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=lzFhklXV; arc=none smtp.client-ip=202.12.124.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id AEAC01D001E7;
	Mon,  1 Sep 2025 09:03:44 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Mon, 01 Sep 2025 09:03:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1756731824;
	 x=1756818224; bh=ua+pUEccVHzU7KXErtidkr1gvXjQNlFYt6hNszdXlpo=; b=
	Z2PuDyU1EPplD9KV7zN/BQzHBW2zET3jSX563Cz1s5tIYcs7tiSQZhQgK3dvOxfB
	qdU5gQ0ijlopyOCwpWDPgfze+VHnGeyMwUxC9Gdx0Q1PPmibSgujIFaAKPHVpzd1
	h9nQ2n4yrlRw2Y95pCKAarPoJT616zeAWGwRorx9I3hvR4oC1B1K2LV7QxHzBHP9
	KxokYto3U4Hj7VO9WVdD3YGix+Q0rCqWgXSWLs9QclxO23vs8StzWIopZQ9Nh7fM
	Upr/hYH9m8Ve0JIawZcBUI2JttsEvIoMyv7CMV/FMaj65QWktgMOibbkWHocMpD1
	sdxAbuXQGTz+ESGpjvd4Tw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1756731824; x=
	1756818224; bh=ua+pUEccVHzU7KXErtidkr1gvXjQNlFYt6hNszdXlpo=; b=l
	zFhklXVJpu0EH8MVs+eDi8eiQ4Kn9mzM7w7ckXVmfeAK9j3G2cdMkVABrAp971ke
	26pmVomEs/DQB3FftN1x9uU9abgjVjWQXRPzMeslpf9bm+B8keJREkxadBGytWYc
	8m5Zi98yP53S1llsDYMSdPC0ghN7L72/DhNiwLdslcK2tv2BI3r768MJxA0pDs25
	tzCJ0BN7TLKO5p/CsFPR8YDPBNk8R2qX1tm88PwkLDKjk2b+nUDLs2najHRf0i4p
	lkOxDIsg1D00fFopTsiJI1mM5RyuaUWkigJ24I7+PIgCFNRBkhjmxEjwK530ALtT
	Cm/kcJYyVcoQS+8CH00sQ==
X-ME-Sender: <xms:sJm1aDA4CvsScCqOB76_rd4HjIdmh7z4UhqLj6hCnJMaMhaQSMtR7Q>
    <xme:sJm1aJgoC8YHdYbRGbVoHThhdzFHdphP5F-e7dma6XNe6eQ8WPDGY08sUL-jiAR5C
    8xhsfh9-f7nT1M4iKo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduledvvddvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepfefhheetffduvdfgieeghfejtedvkeetkeejfeekkeelffejteevvdeghffhiefh
    necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgt
    phhtthhopeeipdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegsrhhglhessghgug
    gvvhdrphhlpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthho
    pegsrghrthhoshiirdhgohhlrghsiigvfihskhhisehlihhnrghrohdrohhrghdprhgtph
    htthhopehlihhnuhhsrdifrghllhgvihhjsehlihhnrghrohdrohhrghdprhgtphhtthho
    pehlihhnuhigqdhgphhiohesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhope
    hlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:sJm1aOpu-eRjlci3s3TzjkwWTmJDl7SB4asqdQONDkQVIJRlSfGZ7g>
    <xmx:sJm1aEDsmtHV-rE5YrpTfgkD88QiQRxpyrO_lrIcDO6EKFrq6jAIDw>
    <xmx:sJm1aIwbBrno3UFgSjTrvVi-jaLv4R44RDxKrh2T0rFV5qToM00WlA>
    <xmx:sJm1aJ1erfzgV5BGxR6C3vYouygdtxhpdEg31-_gzJBV3D5BT2SClg>
    <xmx:sJm1aN1dcMRbPdzdMYGm0jhfL0ua1XE-0ThalWkYsYM3UOCl8gYEQ3We>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 2655B700065; Mon,  1 Sep 2025 09:03:44 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: ACw3zk5S_Pss
Date: Mon, 01 Sep 2025 15:03:22 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Bartosz Golaszewski" <brgl@bgdev.pl>,
 "Linus Walleij" <linus.walleij@linaro.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-kernel@vger.kernel.org,
 "Bartosz Golaszewski" <bartosz.golaszewski@linaro.org>,
 "Rob Herring" <robh@kernel.org>
Message-Id: <9a1c9735-eb5c-4abe-a96b-bfb02c97c9b2@app.fastmail.com>
In-Reply-To: <20250901125513.108691-1-brgl@bgdev.pl>
References: <20250901125513.108691-1-brgl@bgdev.pl>
Subject: Re: [PATCH] gpio: fix GPIO submenu in Kconfig
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Sep 1, 2025, at 14:55, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Commit a86240a37d43 ("gpiolib: enable CONFIG_GPIOLIB_LEGACY even for
> !GPIOLIB") accidentally pulled all items from within the GPIOLIB submenu
> into the main driver menu. Put them back under the top-level GPIO entry.
>
> Suggested-by: Rob Herring <robh@kernel.org>
> Fixes: a86240a37d43 ("gpiolib: enable CONFIG_GPIOLIB_LEGACY even for !GPIOLIB")
> Reported-by: Rob Herring <robh@kernel.org>
> Closes: https://lore.kernel.org/all/20250813222649.GA965895-robh@kernel.org/
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

I'm sorry I misunderstood the earlier bug report and assumed this
was already addressed. I now see what my mistake was and the fix looks
correct to me.

     Arnd

