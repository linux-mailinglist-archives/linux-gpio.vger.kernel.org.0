Return-Path: <linux-gpio+bounces-18238-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE4FA7BD40
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Apr 2025 15:11:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 536F8189F4ED
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Apr 2025 13:11:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88F611EB5F1;
	Fri,  4 Apr 2025 13:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="UyCtCsPo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F6D1E1DFF;
	Fri,  4 Apr 2025 13:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743772269; cv=none; b=OT/di5Uh0ZE+LSpf/jjuDk4STlMDiX9QIT6uCcYq5SVZXtUfbJdctj0+laG0siou9Y4yPjw3Ds/BMgwdixnnpU3h072A5ani91yqKe1m508s6YhTSzv9ViEut7ue8MzTvG4U1qk+DlIHE7QtYKZquQT6aKhFzhCjR9JdA328EOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743772269; c=relaxed/simple;
	bh=nz3b45f2kDp8g3yCmdG1yNvTfsTyA35b7QwNerR+WzA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BXBH9zKKdiE2ozUbwRN7bPNUGJazsE+El7Jx43mzjpTW7lBw5MHrHEjJ+uTNG1x2m0YiklCLj4QsmMbQdUsBbrbUCKH67qpoLudgXF23QMoeF2mtCeMXBml+NvofDbUf7dSa9kkm4F0Jg+xzyVYf2d4Fvlfil6e589quJjP+beU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=UyCtCsPo; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id F15FA44401;
	Fri,  4 Apr 2025 13:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743772262;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AXf1qMWKVsb2hFlQVhByp9Af9uko8h3RHpXqX39vRM0=;
	b=UyCtCsPoIDFSt+Ts9rHyPDYFOVWB4NLcKaKPC6vBqHgNFQEGKn7FOga+sbj3myHATaAni2
	LMPTbMjjePmMh7+I+RoIeLKNCP94fB/p82u0Mpc17Rtb5TRnZVm2lEmlL8ypR6SzNAB2Wd
	F4DqM+5KXqjGo/DvHT1dk7dYLQOP0ugrjr5Wc5OhPUN0wO6t7/iU/O8yTLp4riAI3T+sDc
	52GfBREK0SqZdqlYRrcUXGZZHj8y0DMUxpdoKCLLDXpRCrNMfSgHJ1TJE4rsCWaUDGeRjY
	ErDdIcL+ADNMP/BbsFc5rNzR2Vj1uLHFdAcItqnkTNRb41PxNTaQAUax+2Sh0g==
Message-ID: <cb07335e-8dc0-4cf1-8524-40770d5419cc@bootlin.com>
Date: Fri, 4 Apr 2025 15:11:00 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] pinctrl: Add pin controller driver for AAEON UP
 boards
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
 thomas.petazzoni@bootlin.com, DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw
References: <CACRpkdZ6kmPn9TfO40drJ+vwM2GNKfNaP21R_gEvugg+GJiF1w@mail.gmail.com>
 <7e96dd60-8f72-48f9-a393-5a8a7e5c6b18@bootlin.com>
 <Z4Tg-uTVcOiYK2Dr@smile.fi.intel.com>
 <b50444f7-4dd1-4440-af36-783b1b4f8625@bootlin.com>
 <Z4jNZPcDd89-HfAd@smile.fi.intel.com>
 <e273428e-3ebd-4116-b317-9aae0c8c603b@bootlin.com>
 <Z4j8NmKMEL7PALmw@smile.fi.intel.com>
 <8b9dd766-ae7e-4817-a093-536ae9646cd3@bootlin.com>
 <Z4kUWxR9VWkzQ9aW@smile.fi.intel.com>
 <5e5f7635-86ed-4814-b26f-b1c45fa4f29a@bootlin.com>
 <Z6NOfUG3QZyYW0rw@smile.fi.intel.com>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <Z6NOfUG3QZyYW0rw@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduleduheefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomhepvfhhohhmrghsucftihgthhgrrhguuceothhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeekveeiveeguddtteelhfeuueduieelheetudeujedufeduvddutedufeehhfeigfenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedvrgdtudemtggsudegmehfgedtmegsfhdttdemfhdtheegmegtlegtvdemvddutgefmeduheeiieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmehfgedtmegsfhdttdemfhdtheegmegtlegtvdemvddutgefmeduheeiiedphhgvlhhopeglkffrggeimedvrgdtudemtggsudegmehfgedtmegsfhdttdemfhdtheegmegtlegtvdemvddutgefmeduheeiiegnpdhmrghilhhfrhhomhepthhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedufedprhgtphhtthhopegrnhgurhhihidrshhhvghvtghhvghnkhhosehlihhnuhigrdhinhhtvghlrdgtohhmp
 dhrtghpthhtoheplhhinhhushdrfigrlhhlvghijheslhhinhgrrhhordhorhhgpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvgdprhgtphhtthhopegsrhhglhessghguggvvhdrphhlpdhrtghpthhtoheplhgvvgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgrvhgvlhesuhgtfidrtgiipdhrtghpthhtoheplhhinhhugidqghhpihhosehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: thomas.richard@bootlin.com

Hi Andy,

On 2/5/25 12:41, Andy Shevchenko wrote:
> On Wed, Feb 05, 2025 at 12:17:29PM +0100, Thomas Richard wrote:
>> On 1/16/25 15:14, Andy Shevchenko wrote:
> 
> ...
> 
>> So I'm not really convinced by all this complexity for only one driver.
> 
> I am not sure if I asked you to show the excerpt from DSDT for this device.
> Is there any link I can browse the ASL code (for that particular device,
> most likely I wouldn't need the full DSDT)?
> 

I'm currently working on the V3, and I just remembered that you asked me
DSDT file. So for the UP Squared board, please find the full DSDT, and
also SSDT1 (which contains the FPGA declaration).

DSDT: https://gist.github.com/thom24/4d24c2a2f58d93f799e512c2485efd45
SSDT1: https://gist.github.com/thom24/2da44ef86eacfa5d2d492ce43fa41aa4

Best Regards,

Thomas

