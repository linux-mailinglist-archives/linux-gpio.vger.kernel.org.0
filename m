Return-Path: <linux-gpio+bounces-21112-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC959AD1A30
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Jun 2025 11:01:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3259F7A5F53
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Jun 2025 09:00:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A79422ACC6;
	Mon,  9 Jun 2025 09:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Yk+DxNrT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9748238385;
	Mon,  9 Jun 2025 09:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749459707; cv=none; b=VKTvA5/2AxfFGJ5lv5kTRGQHs9rgSnrjEG5rPtGEWzNzBkOBzvzL/LemwrcmQFQVJm+OcnZo+yNmnKo08xVPwMA4WSidE/2tbqzUymv1VFgLPap7FgY3/4yfZ2RcqMoPKsB0AleWjSasBAhxnPaPVj+zNcbvgDjobugZa8llVtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749459707; c=relaxed/simple;
	bh=/cIaxeqw/uIFx9EFsl7xwKrl2aCOVbcL+LtzSQ69mXc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b22FfBS7yxwms3ckZGtdr8vTpbRMVL64v70x/8ywNnonW4OuQUvjieoLXYo2GMqFHP3CA1aqIZBrM+WY8U7Vr4iIruys8uU4RE639MAuh1OGCy3I9KOZBid2hO3LIR1o6mfrKjT0jwE3D9No22d4brT/rjpwsY5fH6CV6hRu7Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Yk+DxNrT; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0B3741FCEF;
	Mon,  9 Jun 2025 09:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749459702;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v6COVbmLFII/PGVnRIn0cQFTY2M/cpHl8qq/PR3IIZQ=;
	b=Yk+DxNrTE675k1beTWKb0SQuKds48L/2lDtwaQ+WOt18+cAKKXF2Wv7Z7VifuNGxQnnHUi
	VXzHvQCWnffhMWACCP9bEnuGRvWn4yKL50DE9zOxVk2j0Uk5dTQfAlxJwAc6vBi4lIHrkS
	j0dZYKuupOo/UJYiAmbIVjE9a9MnsJdhWybpgZ/VZXZvggA75MMO1SeTiaXHntdnIKuGD2
	N+yJbZ8BBJ/MUbL755+Cgf5Xq9p1r2OQCnTQ5AMBximjuMb15rV93jCueJ8F1TqLiMJB2v
	xWmyLk9v58DFiUlspjhiTpsKUzY/dQbtmpmQE/NMku11Rc29bWUdKip9ylHnPA==
Message-ID: <1031395a-f662-4c24-897f-85ef854060b2@bootlin.com>
Date: Mon, 9 Jun 2025 11:01:40 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 12/12] pinctrl: Add pin controller driver for AAEON UP
 boards
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Kees Cook <kees@kernel.org>,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com, DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw,
 linux-hardening@vger.kernel.org
References: <20250520-aaeon-up-board-pinctrl-support-v6-0-dcb3756be3c6@bootlin.com>
 <20250520-aaeon-up-board-pinctrl-support-v6-12-dcb3756be3c6@bootlin.com>
 <aC3yKaCNZA8H2KPt@smile.fi.intel.com>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <aC3yKaCNZA8H2KPt@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdeltdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomhepvfhhohhmrghsucftihgthhgrrhguuceothhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegteekfeevudduvdduveehgeejuefgieeitdeuvdekgfdvgefhjedtffdufeegheenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrpdhhvghloheplgfkrfggieemvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrngdpmhgrihhlfhhrohhmpehthhhomhgrshdrrhhitghhrghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddvpdhrtghpthhtoheprghnughrihihrdhshhgvvhgthhgvnhhkoheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehlihhnuhhsrdifrghllhgvihhjs
 ehlihhnrghrohdrohhrghdprhgtphhtthhopegsrhhglhessghguggvvhdrphhlpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvgdprhgtphhtthhopehkvggvsheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqghhpihhosehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: thomas.richard@bootlin.com

Hi Andy,

Thanks for the review.

On 5/21/25 17:32, Andy Shevchenko wrote:
>> +static void upboard_pinctrl_dbg_show(struct pinctrl_dev *pctldev, struct seq_file *s,
>> +				     unsigned int offset)
>> +{
>> +	int ret;
>> +
>> +	ret = upboard_pinctrl_pin_get_mode(pctldev, offset);
>> +	if (ret == UPBOARD_PIN_MODE_FUNCTION)
>> +		seq_puts(s, "mode function ");
>> +	else if (ret == UPBOARD_PIN_MODE_DISABLED)
>> +		seq_puts(s, "HIGH-Z ");
> 
>> +	else
>> +		seq_printf(s, "GPIO (%s) ", str_input_output(ret == UPBOARD_PIN_MODE_GPIO_IN));
> 
> Actually this should be
> 
> 	else if (ret < 0)
> 		seq_printf(s, "N/A "); // or similar text
> 	else
> 		seq_printf(s, "GPIO (%s) ", str_input_output(ret == UPBOARD_PIN_MODE_GPIO_IN));
> 
> as the above may return a negative error code which is not listed here.
> 
>> +}
> 
> With the above being addressed,
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> ...
> 
> Thanks for doing this driver, eventually we will have it working
> out-of-the-box. Do you have any plans for enabling HSI and SIM card
> slot on UP Squared 7000?

My scope is limited to the FPGA support, and I don't know the status of
HSI and SIM card slot.

But it is planned to add UP Squared 7000 support in the pinctrl driver.

Best Regards,

Thomas


