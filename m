Return-Path: <linux-gpio+bounces-7725-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 170FB91806D
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2024 14:02:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A2821C23F03
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2024 12:02:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CE7D180A82;
	Wed, 26 Jun 2024 12:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="qoCZhvZf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D7515A856
	for <linux-gpio@vger.kernel.org>; Wed, 26 Jun 2024 12:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719403331; cv=none; b=OFpaagAezVSGuVFz3ULC30k1j30xLd+7/iSlQ0wEcoVh/kU67I2jOrAhg9eUC/XAXlSGYkQL3qMk1tLiYQJEStZdduNcIm0IOjkAS2ZEixNSgYOslBmBpfq85kL6cgtFrw2UG18c7zhUb//qAy0FZsg4UO1wkQt1eHZDolOc2B4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719403331; c=relaxed/simple;
	bh=05Qbdc/NTKaHTbRIAVXDnU79PyV2ELztLroZ0pqOdI8=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=mtJpQN/r2yQd0NYoTpU607oZGgYsWdBIpyGwIxv7prpLQ0KU2Vxv3+WaXFs1byVTQwjXKbAIMDjhBWwrvlG5VT4poRLsCwqnagBzunX+YgTdWPlmWD9OsH/iyk+x0vzW36k7qt/aJpkBGxASJPvuF0nV6XjPAIzkSIF/FlEJxfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=qoCZhvZf; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20240626120205epoutp0180b23983b298ea43bfec8602e30a6956~cjDbc7ieh0407004070epoutp01D
	for <linux-gpio@vger.kernel.org>; Wed, 26 Jun 2024 12:02:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20240626120205epoutp0180b23983b298ea43bfec8602e30a6956~cjDbc7ieh0407004070epoutp01D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1719403325;
	bh=rJmfCY/MRzs0vCHI/jisdFHeZmDRK5AL4y8pcWT2GvA=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=qoCZhvZfxmtbSABUkV6pfkfqFvM2I0L0rxP8/nokYxrHi72f809bzjInsjhr2NpZb
	 etqpmO9gedkiQSpXtKT1DJZdMAJbbwNgFmb1ZI91axQJuHONoCoYszBb1BK2nqiu+K
	 JR6QQVpr1BOvek1dZI14QbdXXP7i9dZ2NRNeFIPA=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTP id
	20240626120204epcas5p32d27e1054fea6b70266df14cd9169cd4~cjDa9KEw52883228832epcas5p38;
	Wed, 26 Jun 2024 12:02:04 +0000 (GMT)
Received: from epsmges5p1new.samsung.com (unknown [182.195.38.180]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4W8L0W2Vdsz4x9Px; Wed, 26 Jun
	2024 12:02:03 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
	epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	89.48.11095.B330C766; Wed, 26 Jun 2024 21:02:03 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20240626114754epcas5p3f4a4920cd68331f7721cb60ac0c1651c~ci3DI8mNy1347913479epcas5p3z;
	Wed, 26 Jun 2024 11:47:54 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20240626114754epsmtrp14afe0fd8245cf4456aa17cf2c4b93b1d~ci3DHuGUh3015130151epsmtrp14;
	Wed, 26 Jun 2024 11:47:54 +0000 (GMT)
X-AuditID: b6c32a49-423b770000012b57-ae-667c033b50e6
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	1B.D2.29940.AEFFB766; Wed, 26 Jun 2024 20:47:54 +0900 (KST)
Received: from FDSFTE582 (unknown [107.122.82.121]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20240626114752epsmtip1410264395d014b57fd8d18025a65caf7~ci3BkwhaA2102021020epsmtip1K;
	Wed, 26 Jun 2024 11:47:52 +0000 (GMT)
From: "Vishnu Reddy" <vishnu.reddy@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, <s.nawrocki@samsung.com>,
	<alim.akhtar@samsung.com>, <linus.walleij@linaro.org>
Cc: <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <pankaj.dubey@samsung.com>,
	<ravi.patel@samsung.com>
In-Reply-To: 
Subject: RE: [PATCH] pinctrl: samsung: Add support for pull-up and pull-down
Date: Wed, 26 Jun 2024 17:17:51 +0530
Message-ID: <07f101dac7be$ae4349d0$0ac9dd70$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-in
Thread-Index: AQLxKHH81TrGQH9mk3YrmwmVK5Ft8wKHISlnASHDNFKvcAPUsIAf4KGA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrBJsWRmVeSWpSXmKPExsWy7bCmlq41c02awZz9PBYP5m1jszh/fgO7
	xZQ/y5ksNj2+xmqxef4fRovLu+awWcw4v4/JYtHWL+wWDz/sYbc4/Kad1YHLY9OqTjaPO9f2
	sHlsXlLv0bdlFaPH501yAaxR2TYZqYkpqUUKqXnJ+SmZeem2St7B8c7xpmYGhrqGlhbmSgp5
	ibmptkouPgG6bpk5QEcpKZQl5pQChQISi4uV9O1sivJLS1IVMvKLS2yVUgtScgpMCvSKE3OL
	S/PS9fJSS6wMDQyMTIEKE7IzXn08w1zwS7fi7qUupgbGnypdjJwcEgImEk9XNjF2MXJxCAns
	ZpQ48O83M4TziVFiUstuVpAqIYFvjBL/l5TBdPz9/xmqaC+jxJTNO5kgnBeMErOOTgHq4OBg
	E9CXaL4hARIXEWhglDh+qpcVxGEWOMko8WzFCUaQIk4BXokJ/6xBpgoL+Egc6TvKDGKzCKhK
	fLn7BGwzr4ClxLRjk5ggbEGJkzOfsIDYzALyEtvfzmGGuEhB4ufTZawQcXGJoz97wOIiAm4S
	r3bcAjtOQmAlh8SOC89YIRpcJGa/fQxlC0u8Or6FHcKWknjZ3wZlJ0us/32KHeROCYEciZ5p
	ChBhe4kDV+awgISZBTQl1u/ShwjLSkw9tY4J4gQ+id7fT5gg4rwSO+bB2GoSxyZNh9oqI9G5
	4gbjBEalWUg+m4Xks1lIvpmFsG0BI8sqRsnUguLc9NRi0wLDvNRyeHwn5+duYgQnWS3PHYx3
	H3zQO8TIxMF4iFGCg1lJhDe0pCpNiDclsbIqtSg/vqg0J7X4EKMpMLgnMkuJJucD03xeSbyh
	iaWBiZmZmYmlsZmhkjjv69a5KUIC6YklqdmpqQWpRTB9TBycUg1ME/xXtU/ewdyixBzQXPhr
	PbPnoWU3XwbeYrGZsj3a7KRZkWG+WOXnUzNSvv94vHCyDe9FoUsRUtaXQ0xWtgg8b7+zXtU9
	s2zt/tuv31zabvxL6Ir1jnX6rZOu/P1aMfePx5ZFUfJizPUmGWudpmoLZu2MTjzizR1rZvlk
	wfefO79sWbJNI8CDMXJ/gHpUYcvjtLtFoTrHY3OS3zTJXtJd8FE3dQ+jmkH/ic2Zs8478nq7
	GN3czmzs8qZb+sjPHR0zu3tCLae1mfTNZ52oJ3A45f11qytXP60r4DrBsORnmxab1H1di4t7
	HOvdmF9wzv+TrLFUKLbA4fiZTQLPdz6q2+k8sWXumaQugUvmf7cuV2Ipzkg01GIuKk4EAKdk
	qkQ7BAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplkeLIzCtJLcpLzFFi42LZdlhJTvfV/+o0g56z7BYP5m1jszh/fgO7
	xZQ/y5ksNj2+xmqxef4fRovLu+awWcw4v4/JYtHWL+wWDz/sYbc4/Kad1YHLY9OqTjaPO9f2
	sHlsXlLv0bdlFaPH501yAaxRXDYpqTmZZalF+nYJXBmvPp5hLvilW3H3UhdTA+NPlS5GTg4J
	AROJv/8/M3cxcnEICexmlDg+5QU7REJG4sOdLcwQtrDEyn/PweJCAs8YJbYsz+xi5OBgE9CX
	aL4hARIWEWhhlNg40QfEZhY4yygxtS8MYuYhRonunodMIPWcArwSE/5Zg9QIC/hIHOk7Cjae
	RUBV4svdJ6wgNq+ApcS0Y5OYIGxBiZMzn7CAtDIL6Em0bWSEGC8vsf3tHKjLFCR+Pl3GChEX
	lzj6s4cZ4hw3iVc7bjFNYBSehWTSLIRJs5BMmoWkewEjyypGydSC4tz03GLDAsO81HK94sTc
	4tK8dL3k/NxNjOAY09Lcwbh91Qe9Q4xMHIxAH3IwK4nwhpZUpQnxpiRWVqUW5ccXleakFh9i
	lOZgURLnFX/RmyIkkJ5YkpqdmlqQWgSTZeLglGpg2nm/89/206v/X4gS+LfU9EJvUMieJv0/
	bK7TL/loKt7qk9H3XnmpPr5dj8G22TSweaXrZMkPJXp67V/m5sw6zuT9P6ZIYKbxTBNLy4t6
	u1W+7mrvk/nt6Nzln7LlWPvc/cmJll1GvlIa7kJstT79dh3KHyyYIqpuqnAyiJrOuGHL26uz
	6/u/rytC/a4Kzysx7S9Y/Sf2psiTtbs2Pz6wNsljT+OEjXay7ba86YEz14lu614ucce86fZ6
	x6ez/myPnf3yhMsey3u/WDwuvmCU8fnYFBBuJlBQvZw5TTSaaYek4F19jhzzXR/OhFtPX/Is
	v3T/k5Vb+FIqsxSt21y81t/uKlywuX1h+kO7k11KLMUZiYZazEXFiQA2j+KsIAMAAA==
X-CMS-MailID: 20240626114754epcas5p3f4a4920cd68331f7721cb60ac0c1651c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240529070220epcas5p140580a28b93ce5cb256ef825c778c649
References: <CGME20240529070220epcas5p140580a28b93ce5cb256ef825c778c649@epcas5p1.samsung.com>
	<20240529065939.36369-1-vishnu.reddy@samsung.com>
	<32137d7d-fe61-468a-a3f4-1602512104da@kernel.org> 



> -----Original Message-----
> From: Vishnu Reddy [mailto:vishnu.reddy@samsung.com]
> Sent: 06 June 2024 10:42
> To: 'Krzysztof Kozlowski' <krzk@kernel.org>; 's.nawrocki@samsung.com'
> <s.nawrocki@samsung.com>; 'alim.akhtar@samsung.com'
> <alim.akhtar@samsung.com>; 'linus.walleij@linaro.org'
> <linus.walleij@linaro.org>
> Cc: 'linux-arm-kernel@lists.infradead.org' <linux-arm-
> kernel@lists.infradead.org>; 'linux-samsung-soc@vger.kernel.org' <linux-
> samsung-soc@vger.kernel.org>; 'linux-gpio@vger.kernel.org' <linux-
> gpio@vger.kernel.org>; 'linux-kernel@vger.kernel.org' <linux-
> kernel@vger.kernel.org>; 'pankaj.dubey@samsung.com'
> <pankaj.dubey@samsung.com>; 'ravi.patel@samsung.com'
> <ravi.patel@samsung.com>
> Subject: RE: [PATCH] pinctrl: samsung: Add support for pull-up and
pull-down
> 
> Hi Krzysztof, Thank you for reviewing the patch.
> 
> > -----Original Message-----
> > From: Krzysztof Kozlowski [mailto:krzk@kernel.org]
> > Sent: 01 June 2024 21:41
> > To: Vishnu Reddy <vishnu.reddy@samsung.com>;
> s.nawrocki@samsung.com;
> > alim.akhtar@samsung.com; linus.walleij@linaro.org
> > Cc: linux-arm-kernel@lists.infradead.org; linux-samsung-
> > soc@vger.kernel.org; linux-gpio@vger.kernel.org; linux-
> > kernel@vger.kernel.org; pankaj.dubey@samsung.com;
> > ravi.patel@samsung.com
> > Subject: Re: [PATCH] pinctrl: samsung: Add support for pull-up and
> > pull-down
> >
> > On 29/05/2024 08:59, Vishnu Reddy wrote:
> > > gpiolib framework has the implementation of setting up the PUD
> > > configuration for GPIO pins but there is no driver support.
> > >
> > > Add support to handle the PUD configuration request from the
> > > userspace in samsung pinctrl driver.
> > >
> > > Signed-off-by: Vishnu Reddy <vishnu.reddy@samsung.com>
> > > ---
> > >  drivers/pinctrl/samsung/pinctrl-samsung.c | 51
> > > +++++++++++++++++++++++  drivers/pinctrl/samsung/pinctrl-
> samsung.h
> > |
> > > 7 ++++
> >
> > Please work on latest mainline or next branches. This was based on
> > some older tree.
> Ack, Will work on 'krzk/for-next' branch.
> >
> >
> > >  2 files changed, 58 insertions(+)
> > >
> > > diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c
> > > b/drivers/pinctrl/samsung/pinctrl-samsung.c
> > > index ed07e23e0912..a4b6eea5e168 100644
> > > --- a/drivers/pinctrl/samsung/pinctrl-samsung.c
> > > +++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
> > > @@ -939,6 +939,56 @@ static int samsung_pinctrl_unregister(struct
> > platform_device *pdev,
> > >  	return 0;
> > >  }
> > >
> > > +/*
> > > + * samsung_gpio_set_pud will enable or disable the pull-down and
> > > + * pull-up for the gpio pins in the PUD register.
> > > + */
> > > +static void samsung_gpio_set_pud(struct gpio_chip *gc, unsigned int
> > offset,
> > > +				 unsigned int value)
> > > +{
> > > +	struct samsung_pin_bank *bank = gpiochip_get_data(gc);
> > > +	const struct samsung_pin_bank_type *type = bank->type;
> > > +	void __iomem *reg;
> > > +	unsigned int data;
> > > +
> > > +	reg = bank->pctl_base + bank->pctl_offset;
> > > +	data = readl(reg + type->reg_offset[PINCFG_TYPE_PUD]);
> > > +	data &= ~(0xf << (offset * 4));
> > > +	data |= value << (offset * 4);
> > > +	writel(data, reg + type->reg_offset[PINCFG_TYPE_PUD]);
> > > +}
> > > +
> > > +/*
> > > + * samsung_gpio_set_config will identify the type of PUD config
> > > +based
> > > + * on the gpiolib request to enable or disable the PUD configuration.
> > > + */
> > > +static int samsung_gpio_set_config(struct gpio_chip *gc, unsigned
> > > +int
> > offset,
> > > +				   unsigned long config)
> > > +{
> > > +	struct samsung_pin_bank *bank = gpiochip_get_data(gc);
> > > +	unsigned long flags;
> > > +	unsigned int value = 0;
> > > +
> > > +	switch (pinconf_to_config_param(config)) {
> > > +	case PIN_CONFIG_BIAS_DISABLE:
> > > +		value = DISABLE_PIN_PULL_UP_DOWN;
> > > +		break;
> > > +	case PIN_CONFIG_BIAS_PULL_DOWN:
> > > +		value = ENABLE_PIN_PULL_DOWN;
> > > +		break;
> > > +	case PIN_CONFIG_BIAS_PULL_UP:
> > > +		value = ENABLE_PIN_PULL_UP;
> > > +		break;
> > > +	default:
> > > +		return -ENOTSUPP;
> > > +	}
> > > +
> >
> > Missing clock.
> Sorry, I didn't get your point exactly. Could you please elaborate?
I understood what is missing clock.
Ack, Will update.
> >
> > > +	raw_spin_lock_irqsave(&bank->slock, flags);
> > > +	samsung_gpio_set_pud(gc, offset, value);
> > > +	raw_spin_unlock_irqrestore(&bank->slock, flags);
> >
> > Blank line
> Ack, Will update.
> >
> > > +	return 0;
> > > +}
> > > +
> > >  static const struct gpio_chip samsung_gpiolib_chip = {
> > >  	.request = gpiochip_generic_request,
> > >  	.free = gpiochip_generic_free,
> > > @@ -948,6 +998,7 @@ static const struct gpio_chip
> > > samsung_gpiolib_chip =
> > {
> > >  	.direction_output = samsung_gpio_direction_output,
> > >  	.to_irq = samsung_gpio_to_irq,
> > >  	.add_pin_ranges = samsung_add_pin_ranges,
> > > +	.set_config = samsung_gpio_set_config,
> > >  	.owner = THIS_MODULE,
> > >  };
> > >
> > > diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.h
> > > b/drivers/pinctrl/samsung/pinctrl-samsung.h
> > > index ab791afaabf5..23b70ddcaccc 100644
> > > --- a/drivers/pinctrl/samsung/pinctrl-samsung.h
> > > +++ b/drivers/pinctrl/samsung/pinctrl-samsung.h
> > > @@ -61,6 +61,13 @@ enum pincfg_type {
> > >  #define PIN_CON_FUNC_INPUT		0x0
> > >  #define PIN_CON_FUNC_OUTPUT		0x1
> > >
> > > +/*
> > > + * Values for the pin PUD register.
> > > + */
> > > +#define DISABLE_PIN_PULL_UP_DOWN	0x0
> > > +#define ENABLE_PIN_PULL_DOWN		0x1
> > > +#define ENABLE_PIN_PULL_UP		0x3
> >
> > This does not look right. The value is 0x2 for s3c and s5p.
> I received exynos manuals. I'll check and I'll update.
> >
> >
> >
> > Best regards,
> > Krzysztof



