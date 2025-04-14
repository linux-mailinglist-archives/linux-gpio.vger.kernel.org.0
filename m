Return-Path: <linux-gpio+bounces-18775-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8944BA87BCE
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Apr 2025 11:25:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC8DE1891D03
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Apr 2025 09:25:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBFAD25E822;
	Mon, 14 Apr 2025 09:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="XD9uxQEP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3580C13D;
	Mon, 14 Apr 2025 09:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744622696; cv=none; b=la7QEUN2FeQpDTzvLZ+8Zn0LDblHNUTSBbNsMEkbPxmitUkABNyMQKeAbICUmpVgjn1gEVa33HNbpMeiE6RE0GEwgRDVwn3ocX0mZjeRFaHngl4tKLRBIddN699OUXBKkI2y2SpaoGtVavSjql7mQ0dTamakj8qcNxTkAuJ35z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744622696; c=relaxed/simple;
	bh=cuPUt25ydCoI90Mo7CFpmSw+zuTe2HfgUcXwmGgJgJQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=m9Dvc4ioAGD1be8VJGykmbnkJb0tfnFyLFj96dZk0ggdOS7LpVEE/SFaxi5UMhfNsGuKRDc4u8udRZ/3mkk9FR2ye4tn9mdfJ+Uv055JSYuvV3kFTDX79aRynVcFINLzcfT+5Td291i6mKHl+5UhoInDAoEbw/PHpT8hDN0hyq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=XD9uxQEP; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id BAC1043308;
	Mon, 14 Apr 2025 09:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744622692;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uHxCj/WeuO0V6P+rYLNraNK+W/B4StlcnsBL6N3GDhw=;
	b=XD9uxQEPOqb9XH3Y8lP0LIktXX66Zjcgrrr02TlP/0pcgaoLtzpbsqyGFrJHxuFsaiaNLo
	XCfsbd+c6COT9G7i9LIOBvAf2Yz0KF7yAfdpXU6EeeIm/Q9Cu6Hf9clpBPnMbyCDj7OQBf
	z1S9Q7xvLcls6qTSrmbAKP2WFczvfCOtyPxnkPeuf7XT88+UpmHvLYDC6mOAOmeLv3FVVF
	DiiF3R+Z0B6owa7XveaS/KmRN729YKFbEwnZBy55MiT2bKAiAwDJNaD40HC/0x0DOnCYYV
	PLs2VuqnQv6ZOSNMUV5dBnZ91zfSjN3CR57bZ/5KvsvTZL2bMBHcuCbekrrbww==
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 14 Apr 2025 11:24:51 +0200
Message-Id: <D9694O0MKV31.3SY6ZCTSKXWI9@bootlin.com>
Subject: Re: [PATCH] gpio: nomadik: Add check for clk_enable()
Cc: <linux-arm-kernel@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: "Chenyuan Yang" <chenyuan0y@gmail.com>, <linus.walleij@linaro.org>,
 <brgl@bgdev.pl>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250412193153.49138-1-chenyuan0y@gmail.com>
In-Reply-To: <20250412193153.49138-1-chenyuan0y@gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvddtudekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkufevvffhofhfjgesthhqredtredtjeenucfhrhhomhepvfhhrohoucfnvggsrhhunhcuoehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeduteeltdevjedvkeelueejhfdvleeiueetvdfgveffffekueeghffhieduleejveenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeiieegsgemfhdtfhhfmehfvgdutdemlegvfhgunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeiieegsgemfhdtfhhfmehfvgdutdemlegvfhgupdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeipdhrtghpthhtoheptghhvghnhihurghntdihsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhinhhushdrfigrlhhlvghijheslhhinhgrrhhordhorhhgpdhrtghpthhtohepsghrghhlsegsghguvghvrdhplhdprhgtphhtt
 hhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhgphhiohesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: theo.lebrun@bootlin.com

Hello Chenyuan, Linus, Bartosz,

On Sat Apr 12, 2025 at 9:31 PM CEST, Chenyuan Yang wrote:
> Add check for the return value of clk_enable() to catch
> the potential error.
>
> This is similar to the commit 8332e6670997
> ("spi: zynq-qspi: Add check for clk_enable()").
>
> Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
> Fixes: 966942ae4936 ("gpio: nomadik: extract GPIO platform driver from dr=
ivers/pinctrl/nomadik/")
> ---
>  drivers/gpio/gpio-nomadik.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-nomadik.c b/drivers/gpio/gpio-nomadik.c
> index fa19a44943fd..dbc4cdddf4df 100644
> --- a/drivers/gpio/gpio-nomadik.c
> +++ b/drivers/gpio/gpio-nomadik.c
> @@ -262,8 +262,11 @@ static unsigned int nmk_gpio_irq_startup(struct irq_=
data *d)
>  {
>  	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
>  	struct nmk_gpio_chip *nmk_chip =3D gpiochip_get_data(gc);
> +	int ret;
> =20
> -	clk_enable(nmk_chip->clk);
> +	ret =3D clk_enable(nmk_chip->clk);
> +	if (ret)
> +		return ret;
>  	nmk_gpio_irq_unmask(d);
>  	return 0;
>  }

Returning a negative value whereas the ->irq_startup() [0] return value
is an unsigned int? From some quick godbolt testing and briefly reading
the spec it looks safe to do a round trip (signed->unsigned->signed),
though not ideal to my eyes.

The caller is __irq_startup() [1].

As for why irq_startup returns an unsigned int, I am unsure. The kernel
Git history isn't enough to know more. The startup field in struct
hw_interrupt_type appeared on v2.3.14 [2], so no commit message to
explain decisions.

Seeing the __irq_startup() code, my proposal would be to turn the return
value to a signed int, but I haven't exhaustively checked codepaths.

Thanks,

[0]: https://elixir.bootlin.com/linux/v6.13.7/source/include/linux/irq.h#L5=
03
[1]: https://elixir.bootlin.com/linux/v6.13.7/source/kernel/irq/chip.c#L244
[2]: https://elixir.bootlin.com/linux/2.3.14/source/include/linux/irq.h#L21

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


