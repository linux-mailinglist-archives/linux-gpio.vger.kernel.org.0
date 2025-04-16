Return-Path: <linux-gpio+bounces-18966-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C06A905D8
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 16:15:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C122B7A4C15
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 14:14:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D90EF9D9;
	Wed, 16 Apr 2025 14:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="kZZoon0q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851B01DE8B9;
	Wed, 16 Apr 2025 14:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744812718; cv=none; b=cFBQOb6zxTyrzyDmYCgaD8FiS4qqdm1FlhtkID725kraKVQCqrI9RH+QtcBuab3Yo2bKeYutnCS/n6F6EWKuFz6YKkid4JTPTFn3Vl1A7Y/ovl1qI//kjzG89xX2b1clv5xV/zywyljtK7q2Jxj7glXbueSFdTkdWE8Q+cWZd3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744812718; c=relaxed/simple;
	bh=EA4g3u3vyegfwIUXuCo10rMq+Rblk2ZLdy6fH5OiYxA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h54VhUeqIWHLjgGNi5+CVJiEGmYhtICMZSS6l2jdCylF5J/dFPgPtTZJI7oeTsIZ2+NPrv/nSV0rhAlW/fqd+MUMCwwRDtTMQ10pghr3aDaV+QzWKs8t7hfSHn60uewW82MadilqNoXWLL7PoyK2QKameRw1vsg0C3ffHoQWnAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=kZZoon0q; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id AD8EE42D46;
	Wed, 16 Apr 2025 14:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744812714;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LKE/vnt9V4MWho0XTcL0y1jnXq7/JpVj1Ddr6p7Qzv0=;
	b=kZZoon0q+6e8m0Lnjewb3uanaQzutMJhg0IgIAGUWGL1aRXEiG83nG96bc3y4ppuZNsR8v
	wwxgv9GPM708iaB6htA7i0Ra9Ez1fcXl9979T/7XHUedK0ivme4OyWuoyYQd2aspQp5gNK
	/jRrCpvbRvoeQjZ5fZyK0h5e0aCmMIXuykhD6l+0uiFl5yWwtF/2SDR/5lOrJ9aPpaeZg8
	bejxphd/bOyUvwbrVeMRSS8OvGyudNPGsw6Loeom1aNfrIElgVYJsSGuuI0I50QzsqcElg
	nCLefKP8VtaSh6e81ANQHon597+J7W64cAIfP/YsO/SorNlQY3/KbsxlM1Q1Ew==
Message-ID: <ea679f09-c326-4fd7-8fa3-bfaf28be2a0e@bootlin.com>
Date: Wed, 16 Apr 2025 16:11:53 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/10] Add pinctrl support for the AAEON UP board FPGA
To: Linus Walleij <linus.walleij@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com, DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw
References: <20250416-aaeon-up-board-pinctrl-support-v3-0-9ca13aa57312@bootlin.com>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <20250416-aaeon-up-board-pinctrl-support-v3-0-9ca13aa57312@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdeiheekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomhepvfhhohhmrghsucftihgthhgrrhguuceothhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeduhfffieevvdffhfefheevveetteevjeeuhedttdfgjeejjefhueffgfejvdeijeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedvrgdtudemtggstdelmegutdegjeemleeifegrmedvvghfudemudejieemjegsgedumedufhhfkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggstdelmegutdegjeemleeifegrmedvvghfudemudejieemjegsgedumedufhhfkedphhgvlhhopeglkffrggeimedvrgdtudemtggstdelmegutdegjeemleeifegrmedvvghfudemudejieemjegsgedumedufhhfkegnpdhmrghilhhfrhhomhepthhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedutddprhgtphhtthhopehlihhnuhhsrdifrghllhgvihhjsehlihhnrghrohdrohhrghdprhgtphhtthhopegrn
 hgurhhihidrshhhvghvtghhvghnkhhosehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepsghrghhlsegsghguvghvrdhplhdprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghssehglhhiuggvrhdrsggvpdhrtghpthhtoheplhhinhhugidqghhpihhosehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepffgrnhhivghlvgevlhgvrhhisegrrggvohhnrdgvuh
X-GND-Sasl: thomas.richard@bootlin.com

On 4/16/25 15:59, Thomas Richard wrote:
> This is the third version of this series (rebased on v6.15-rc2).
> 
> The gpiolib part has been reworked, the gpiochip_add_pin_range() was
> renamed to gpiochip_add_pin_range_with_pins() and a new pins parameter was
> addded. Two stubs were created to add consecutive or sparse pin range.
> 
> For the forwarder library, a namespace was added and patches were splitted
> to more simpler changes.
> 
> In the pinctrl core, the function devm_pinctrl_register_mappings() was
> created.
> 
> No big changes in the upboard pinctrl driver, only few fixes and
> improvements.

Hi,

Please do not use this thread, some patches are missing (b4 failed to
send all patches). Use this one:

https://lore.kernel.org/all/20250416-aaeon-up-board-pinctrl-support-v3-0-f40776bd06ee@bootlin.com/

Best Regards,

Thomas

