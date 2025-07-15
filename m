Return-Path: <linux-gpio+bounces-23295-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA54DB05AF6
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jul 2025 15:13:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 585897AA343
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jul 2025 13:12:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30B992E175D;
	Tue, 15 Jul 2025 13:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="mOEZ7FH+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3E010FD;
	Tue, 15 Jul 2025 13:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752585231; cv=none; b=OtMlPAbMX5/EK4m4+et6C4PdPd1sLcwnRbaZ7v3RKHMBFWYiaM97oyMfzrUPm1ceLMIu0pVwklfwkiz88SbMK0LrrrmvGoAvXUrIhH4GBGG3FfcVUpK2WQ9O47MKWOlp7x+4B9eT6lH9wKX46e7uKTOKfzS3GgY63NLzCxDVAeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752585231; c=relaxed/simple;
	bh=XL4E8md8A6Y2FmpBf6C0MzaJxYrzTpi+2GxPAxZnKVM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=g6e2941e0tCy4WRz5mgDIYa3qC8xW2TzkxQU1MO5OBm2qp8CoN2MZhXoGl6wD056NZnkHzSLBs/uf+MTRq6oy9v1NjG4KGZ+Jw6ETchsb2j/edNEMQcmQOZzLvbjzh2KQjkkzKYbvmkdjzZCBX9vGNJfVhMkTBWIcP1HYJ7kvx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=mOEZ7FH+; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0BADD43B27;
	Tue, 15 Jul 2025 13:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1752585220;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5IwtJ6NmSA6BhAGdGohlWj5qgZJR8SDympAx/5qGmiU=;
	b=mOEZ7FH+ZHdjGz4LjD86wOxPfqMTvUH9vctlzvEoXi7GzxDVxi6vtqAHmN2XnQLDtEEtWd
	6NH6BqRZCLEHkUog14d/6m3E5hGlZN0Mw48GiHQNQXWPKq2eUQgOgRa9dao8q5+imC7qnF
	M5veNzAdUJ0bRj/WNKD0n9Id0LHFuv0gjN6tZOtn4TaISIZyYry2kACsQ9yIRd6wRpz5/d
	92eORwtJ4w4BFJ+ZJMx0fmWRFfhgv6awxhbAxRYYObwjAVN9IhAbxJ7ZvvqsY15QeDFC+/
	CGc8qQ4idhTeKGFcJqHVSrJVf/xCGAVcoZZr4dS5iIj3yKIZ8Id4bIJxn1makw==
Message-ID: <824ec6d1-4272-44c7-b3bb-93d716ed3d43@bootlin.com>
Date: Tue, 15 Jul 2025 15:13:32 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Thomas Richard <thomas.richard@bootlin.com>
Subject: Re: [PATCH v8 00/10] Add pinctrl support for the AAEON UP board FPGA
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Kees Cook <kees@kernel.org>,
 Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
 DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw, linux-hardening@vger.kernel.org
References: <20250611-aaeon-up-board-pinctrl-support-v8-0-3693115599fe@bootlin.com>
 <CAMRc=MfS5Em65n0fwbu8JtJsc3rTgQO5cv+PymSonJtf6_zRKQ@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAMRc=MfS5Em65n0fwbu8JtJsc3rTgQO5cv+PymSonJtf6_zRKQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdehgeelvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfhffuvfevfhgjtgfgsehtkeertddtvdejnecuhfhrohhmpefvhhhomhgrshcutfhitghhrghrugcuoehthhhomhgrshdrrhhitghhrghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptefhudehheevfeehgedvjeeuleffveeigeeiieeuhedtkeffjeeiffejieelleefnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepvdgrtddumegtsgdugeemfhegtdemsghftddtmehftdehgeemtgeltgdvmedvudgtfeemudehieeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemfhegtdemsghftddtmehftdehgeemtgeltgdvmedvudgtfeemudehieeipdhhvghloheplgfkrfggieemvdgrtddumegtsgdugeemfhegtdemsghftddtmehftdehgeemtgeltgdvmedvudgtfeemudehieeingdpmhgrihhlfhhrohhmpehthhhomhgrshdrrhhitghhrghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudefpdhrtghpthhtohepsghrghhlsegsghguvghvrdhplhdprhgtphhtthhopehlihhnuhhsrdifrghllhgvihhjs
 ehlihhnrghrohdrohhrghdprhgtphhtthhopegrnhgurhhihidrshhhvghvtghhvghnkhhosehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvgdprhgtphhtthhopehkvggvsheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnugihsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhgphhiohesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: thomas.richard@bootlin.com

On 6/25/25 10:26 AM, Bartosz Golaszewski wrote:
> On Wed, Jun 11, 2025 at 11:00 AM Thomas Richard
> <thomas.richard@bootlin.com> wrote:
>>
>> This is the eighth version of this series. I just added a missing header
>> file in gpio-aggregator driver to fix a build warning reported by a kernel
>> test robot [1].
>>
>> [1] https://lore.kernel.org/oe-kbuild-all/202506092324.XqSwWl1z-lkp@intel.com/
>>
>> Best Regards,
>>
>> Thomas
>>
>> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
>> ---
> 
> This series looks pretty good now, any objections to picking it up? As
> usual - I can take the GPIO patches and provide an immutable branch
> for Linus to pull.

Hi Bartosz,

When do you plan to pick the patches? Will it be ok for next merge window?

Best Regards,

Thomas

