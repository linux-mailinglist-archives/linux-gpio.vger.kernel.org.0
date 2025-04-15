Return-Path: <linux-gpio+bounces-18833-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 508A5A896EA
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 10:39:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B4386189556B
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 08:39:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FFBA27A118;
	Tue, 15 Apr 2025 08:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="RVQNY4kc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C2B14B945;
	Tue, 15 Apr 2025 08:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744706375; cv=none; b=D8thAjspFwod8D4Ijj6j0zSnXJ7bCQCEXOMHvjWHAtHWglGuyo8Uparyisr4b5RZbsjzyWfZH5QyPT8zHEv06WlSToqs4j3Mn3hB6/wl8LwIXzcRXyCg3jVp540roTPrZgqFGxSnVfdbzzA9aEHBsp6nbsaCUWKMKyGx4QK8p0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744706375; c=relaxed/simple;
	bh=Cg3yvqoZIoD+GprwCSrZxrK2e1wAxx07KHVAJD1JB8o=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=aiCbE4n/DkGlT6QHtBTvIZ/sbYWTRuavUAmtwUBK4rra3x/TYViIIChKYMGECfj+C1zL0BRM8xCIFPL7pHsxmQu8unkEHfYRSlYTv6gQKrSB71oGdM5+59+1ZRSZ1WYKDTT3U4IbnMGu+AaYCKgTU3Cpqrxylji8HbFaq4hhkwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=RVQNY4kc; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id AC9D7433E9;
	Tue, 15 Apr 2025 08:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744706371;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=24vPUfPYax1C1P1L8fUdP9ksbIxlx8xCMGm2OvO+Z7g=;
	b=RVQNY4kcg0F8odxf9KbMwCIhaeUvsidN65aAfXldlnfEc1NZVfDm0X1jdlV82CSTGkWP7Y
	QnuKCLpa5RPL50dFBXuZD6fxpWfThnKBPBWjm+7O7sMC9w/f8HSgg8Upth6BMJPIAfK+bF
	DQNvET7NFYW6g0DTd3k8BX0p/qe0666dZWwjsyKWw7hm8cLCI+J9jwBfCRU765ykeseBcv
	L5mfUy0a8mJ5TP6+4d4P7t0adLldPfxR5Jh9VLaAGJuwRzcBZXHF5gAfn7Abmb4JbKu3+R
	dbRrINyAaepHf4Y+zkrnZ3Hp56V/uk4VccLzFXz9JyaCGun/SVnAWljMw8IZ6w==
Message-ID: <91ede632-f339-4bcb-908f-49ed0fcadbd0@bootlin.com>
Date: Tue, 15 Apr 2025 10:39:29 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 6/6] pinctrl: Add pin controller driver for AAEON
 UP boards
From: Thomas Richard <thomas.richard@bootlin.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
 DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw
References: <20250317-aaeon-up-board-pinctrl-support-v2-0-36126e30aa62@bootlin.com>
 <20250317-aaeon-up-board-pinctrl-support-v2-6-36126e30aa62@bootlin.com>
 <Z9htMdC_E-QFDiRD@smile.fi.intel.com>
 <243d0ab5-8354-496c-8c58-0a85adf1a4e4@bootlin.com>
Content-Language: en-US
In-Reply-To: <243d0ab5-8354-496c-8c58-0a85adf1a4e4@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdeftddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuhffvvehfjggtgfesthejredttddvjeenucfhrhhomhepvfhhohhmrghsucftihgthhgrrhguuceothhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeefueevudelhedtkeelvefgueeiudeviedtgfffueefteelfffhveduleefteeghfenucffohhmrghinheprggrvghonhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrpdhhvghloheplgfkrfggieemvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrngdpmhgrihhlfhhrohhmpehthhhomhgrshdrrhhitghhrghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtoheprghnughrihihrdhshhgvvhgthhgvnhhkoheslhhinhhugidrihhnthgvlhdrtghomhdpr
 hgtphhtthhopehlihhnuhhsrdifrghllhgvihhjsehlihhnrghrohdrohhrghdprhgtphhtthhopegsrhhglhessghguggvvhdrphhlpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvgdprhgtphhtthhopehlihhnuhigqdhgphhiohesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopeffrghnihgvlhgvvehlvghrihesrggrvghonhdrvghu
X-GND-Sasl: thomas.richard@bootlin.com

On 4/9/25 16:02, Thomas Richard wrote:
> On 3/17/25 19:42, Andy Shevchenko wrote:
>>> +	board_id = (enum upboard_board_id)dmi_id->driver_data;
>>> +
>>> +	switch (board_id) {
>>> +	case BOARD_UP_APL01:
>>> +		pctrl->maps = upboard_pinctrl_mapping_up_apl01;
>>> +		pctrl->nmaps = ARRAY_SIZE(upboard_pinctrl_mapping_up_apl01);
>>> +		break;
>>
>> Hmm... This is strange. Seems it has only Apollo Lake in the name while
>> the above states that there is UP board support (which is Cherry Trail based).
> 
> There is pinctrl code for UP and UP Squared. But I only added mapping
> for UP Squared board because it was the easiest board to add (all needed
> pinctrl groups and functions are already defined in the Intel pinctrl
> driver).
> I wanted to focus on the driver itself and the forwarder library, and
> send later an other series to add UP board support (with the
> corresponding functions/groups in the Intel pinctrl driver).
> 
> So yes UP board pinctrl part is unused for now, but everything is ready
> to add support for UP board in the future.
> 
> Otherwise I can remove UP part if you prefer.

Hi Andy,

I just realized that my wording was incorrect, so let me clarify.

The UP Board [1] (based on Cherry Trail) is not supported at all (its
FPGA is not supported by the MFD driver), and there is no plan to
support it.

The "up" code (for example upboard_up_pinctrl_data) is for most boards
of the UP family (UP 7000, UPXi12, UP Squared Pro 7000 ...) but not the
UP Board [1]. Indeed for now there is no pinctrl mapping for these boards.

The "up2" code is for the UP Squared board which uses a different FPGA.

As I explained I only added pinctrl mapping for the UP Squared board, as
it was the easiest one (no need to add groups/functions in Intel pinctrl
driver). But the plan is to add support for other boards (UP 7000,
IPXi12 ...) later.

Regarding the name of the pinctrl mapping for UP Squared board, it is
indeed a bit confusing, I will rename it.

[1]
https://www.aaeon.com/en/product/detail/up-board-computer-board-for-professional-makers

Best Regards,

Thomas

