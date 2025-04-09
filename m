Return-Path: <linux-gpio+bounces-18566-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D696A826FC
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Apr 2025 16:03:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C45784E25FF
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Apr 2025 14:03:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7408A266B4F;
	Wed,  9 Apr 2025 14:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="IV0wXXlM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23C7265CDC;
	Wed,  9 Apr 2025 14:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744207364; cv=none; b=TOSz236DNTbYcbtXewXbugzOP9KzsDgMHzyKMFINQ+EazLtfRA/HEoZfLMILXyVuqW+IqiUpWIjc6vXh1ezchXc8iRlS7R6x+fNbc+EbVizkKu2BSDLYeQJRl6t6wtCfT3DG7TAebBDHfBUS7qdXgZCuZ7LB9kfcsT4GB+WPKDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744207364; c=relaxed/simple;
	bh=j3PgI1aZY4s2Rnmi5gfwmixYCx+y/1eyIEKprF/mvYU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l5QSpyivnrTd2nIZc0vQMBy6HiB6rp4MvO20BJV1J759/YnVHXcTEL0NlOy+jF7XTw3K5ghJDni4XdpxCFdO+Qz9N+hKR+HFKPZpQOz/SWOmAunKtMM3YwVQKaOr8FY1sM7fror4MVyPHb/ibDteTA3hhg1iHxm7J5pmTnsdosU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=IV0wXXlM; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1C1DA20483;
	Wed,  9 Apr 2025 14:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744207354;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BYap/Qat0DuB3eYDK35tGe/QFPOY8sE6TE8m38qQ1Wk=;
	b=IV0wXXlMxsSQ2PHPSg6Plhk/i4TBetfltlivAE1jkfdBh0uMXtX190T3PXwJeFiaVx1D+k
	94feJlCwdy7n0Pg9Sf/Ff+ckYsdLXGxKZZtdcdtiI83f4yM3xET/iGPlWRolv/wkXvlslI
	f5lbNabRKhIfRkrhjjmkiacwqWHcomnFvJwDfI0kJzDmoT+qzxuc0aQcVzvRgvfDJV9jAu
	QOILzyciaAdQL2lOO2mBtehhocwmPpT5SjmJtp5mP9eax07SwdVOByYWRy3vJBvjntVAeT
	R+oykI1SA4sIKAU4yA5yMSBzv/D7U9xDJTRBcMpN7E0R6tiW1XOV3fwqhgZxlA==
Message-ID: <243d0ab5-8354-496c-8c58-0a85adf1a4e4@bootlin.com>
Date: Wed, 9 Apr 2025 16:02:31 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 6/6] pinctrl: Add pin controller driver for AAEON
 UP boards
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
 DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw
References: <20250317-aaeon-up-board-pinctrl-support-v2-0-36126e30aa62@bootlin.com>
 <20250317-aaeon-up-board-pinctrl-support-v2-6-36126e30aa62@bootlin.com>
 <Z9htMdC_E-QFDiRD@smile.fi.intel.com>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <Z9htMdC_E-QFDiRD@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdeiudelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomhepvfhhohhmrghsucftihgthhgrrhguuceothhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegteekfeevudduvdduveehgeejuefgieeitdeuvdekgfdvgefhjedtffdufeegheenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrpdhhvghloheplgfkrfggieemvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrngdpmhgrihhlfhhrohhmpehthhhomhgrshdrrhhitghhrghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtoheprghnughrihihrdhshhgvvhgthhgvnhhkoheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehlihhnuhhsrdifrghllhgvi
 hhjsehlihhnrghrohdrohhrghdprhgtphhtthhopegsrhhglhessghguggvvhdrphhlpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvgdprhgtphhtthhopehlihhnuhigqdhgphhiohesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopeffrghnihgvlhgvvehlvghrihesrggrvghonhdrvghu
X-GND-Sasl: thomas.richard@bootlin.com

On 3/17/25 19:42, Andy Shevchenko wrote:
>> +	board_id = (enum upboard_board_id)dmi_id->driver_data;
>> +
>> +	switch (board_id) {
>> +	case BOARD_UP_APL01:
>> +		pctrl->maps = upboard_pinctrl_mapping_up_apl01;
>> +		pctrl->nmaps = ARRAY_SIZE(upboard_pinctrl_mapping_up_apl01);
>> +		break;
> 
> Hmm... This is strange. Seems it has only Apollo Lake in the name while
> the above states that there is UP board support (which is Cherry Trail based).

There is pinctrl code for UP and UP Squared. But I only added mapping
for UP Squared board because it was the easiest board to add (all needed
pinctrl groups and functions are already defined in the Intel pinctrl
driver).
I wanted to focus on the driver itself and the forwarder library, and
send later an other series to add UP board support (with the
corresponding functions/groups in the Intel pinctrl driver).

So yes UP board pinctrl part is unused for now, but everything is ready
to add support for UP board in the future.

Otherwise I can remove UP part if you prefer.

Regards,

Thomas

