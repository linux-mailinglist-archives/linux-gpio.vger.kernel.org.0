Return-Path: <linux-gpio+bounces-7212-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2978FDE41
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Jun 2024 07:45:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 00E0A1C236B2
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Jun 2024 05:45:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E33B3A1DA;
	Thu,  6 Jun 2024 05:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="NRMSQN6M"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D1312E5D
	for <linux-gpio@vger.kernel.org>; Thu,  6 Jun 2024 05:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717652696; cv=none; b=kHWEqKbkbw/pZxOqfvS2IvWWxygMQgq6AnQ38WEjmvF8w1hw5hu5dbQnoaFcDHfrSuUnGU/r3Kni0dh6ySgNVsMj5kwlGnJxJ1eClyopW4TMwGt5bem8wVhsBGKNCnYVgm1qT3BRiYGHMfm7sGa1U0uASfwy7VaB1wBtL9O1M1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717652696; c=relaxed/simple;
	bh=9s+tuTqSVon7hxsEU3lyHLFxetlonzoQ3x/QQBAE2dY=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=Y4e273BZs748wCqjc9ERKbGgyVtxkZircwnPZbnlkzmQZ+aM6sjlxC1LM21IUXztR+Jh20BfGn5+xT/mYh5gRGhcgkaoU6YABP67KyTYJA0dlJvGPmHj/xl+3FGIuwAUgeZp/wlvtw88DT9hQpyq5/EMMXtdaUt4EoJ8VLuUyjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=NRMSQN6M; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20240606054446epoutp027a8a0ca2e711f9222f65c0d59267da52~WVASTC0fZ0726307263epoutp02C
	for <linux-gpio@vger.kernel.org>; Thu,  6 Jun 2024 05:44:46 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20240606054446epoutp027a8a0ca2e711f9222f65c0d59267da52~WVASTC0fZ0726307263epoutp02C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1717652686;
	bh=JIkj02pbVPrcmvWH6C8loh6glJzSZsgfzJDRTfy97O8=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=NRMSQN6MOvU7oeynhsSXkNDEW2ut5I6B1MuoR7IwjEWK6sIhe24eqY4hTCbosBKFt
	 rQ/rA02yAPmPfiHWckrXvxucB6dcf90m6pARG99ct4sCU0gkdtHzeTa27stqHJJiA1
	 mGL0C0LptAzyC4wFwJXYdPRJGkSDGISqCGMmzSQg=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTP id
	20240606054445epcas5p2d3dd876258bff5a58fd384cd66ced479~WVARodtKm3178031780epcas5p2w;
	Thu,  6 Jun 2024 05:44:45 +0000 (GMT)
Received: from epsmgec5p1new.samsung.com (unknown [182.195.38.183]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4VvtZN1l4xz4x9Pr; Thu,  6 Jun
	2024 05:44:44 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
	epsmgec5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	4A.60.08853.CCC41666; Thu,  6 Jun 2024 14:44:44 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20240606051154epcas5p3943857b7b0b996ff9c2d59cbe222f9ff~WUjlvPooM0190701907epcas5p3O;
	Thu,  6 Jun 2024 05:11:54 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240606051154epsmtrp255889698fc6c80edbd44d72ec602910e~WUjluQcMa1986519865epsmtrp2f;
	Thu,  6 Jun 2024 05:11:54 +0000 (GMT)
X-AuditID: b6c32a44-fc3fa70000002295-4c-66614ccccc03
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	93.53.07412.A1541666; Thu,  6 Jun 2024 14:11:54 +0900 (KST)
Received: from FDSFTE582 (unknown [107.122.82.121]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20240606051152epsmtip2353583c99d6c0ce610c4409274b8fa6e~WUjkMPZ6L0891308913epsmtip2r;
	Thu,  6 Jun 2024 05:11:52 +0000 (GMT)
From: "Vishnu Reddy" <vishnu.reddy@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, <s.nawrocki@samsung.com>,
	<alim.akhtar@samsung.com>, <linus.walleij@linaro.org>
Cc: <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <pankaj.dubey@samsung.com>,
	<ravi.patel@samsung.com>
In-Reply-To: <32137d7d-fe61-468a-a3f4-1602512104da@kernel.org>
Subject: RE: [PATCH] pinctrl: samsung: Add support for pull-up and pull-down
Date: Thu, 6 Jun 2024 10:41:51 +0530
Message-ID: <0c5001dab7d0$0bc9b520$235d1f60$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-in
Thread-Index: AQLxKHH81TrGQH9mk3YrmwmVK5Ft8wKHISlnASHDNFKvcAPUsA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrJJsWRmVeSWpSXmKPExsWy7bCmhu4Zn8Q0g+f/2S0ezNvGZnH+/AZ2
	iyl/ljNZbHp8jdVi8/w/jBaXd81hs5hxfh+TxaKtX9gtHn7Yw25x+E07qwOXx6ZVnWwed67t
	YfPYvKTeo2/LKkaPz5vkAlijsm0yUhNTUosUUvOS81My89JtlbyD453jTc0MDHUNLS3MlRTy
	EnNTbZVcfAJ03TJzgI5SUihLzCkFCgUkFhcr6dvZFOWXlqQqZOQXl9gqpRak5BSYFOgVJ+YW
	l+al6+WlllgZGhgYmQIVJmRnLH5yjr3gsUrFvtOdbA2MF2S7GDk5JARMJG7MX83UxcjFISSw
	m1Hi3u12RpCEkMAnRomZnxMgEt8YJaZt/cEK09H06itUx15GiSvP3jFCOC8YJRpOLmfuYuTg
	YBPQl2i+IQESFxFoYJQ4fqqXFcRhFjjJKPFsxQmwHZwCdhIz7u1mAbGFBXwkjvQdZQaxWQRU
	JE7v7ASL8wpYSmy/9o4ZwhaUODnzCVicWUBeYvvbOcwQJylI/Hy6jBUiLi5x9GcPWFxEwEli
	4rTFYIslBFZySKxse80E0eAisfHtHChbWOLV8S3sELaUxOd3e9kg7GSJ9b9PsYN8IyGQI9Ez
	TQEibC9x4MocFpAws4CmxPpd+hBhWYmpp9YxQZzAJ9H7+wnUdF6JHfNgbDWJY5OmQ0NRRqJz
	xQ3GCYxKs5B8NgvJZ7OQfDMLYdsCRpZVjJKpBcW56anJpgWGeanl8AhPzs/dxAhOs1ouOxhv
	zP+nd4iRiYPxEKMEB7OSCK9fcXyaEG9KYmVValF+fFFpTmrxIUZTYHBPZJYSTc4HJvq8knhD
	E0sDEzMzMxNLYzNDJXHe161zU4QE0hNLUrNTUwtSi2D6mDg4pRqYWk6bJGfr/+PcJHp0rWxg
	3a5Id97flV8ry+SafwrOf9D2oLgrqaxodpn/Aa3wFn0xzzPxXwI3fDhYrbL53+Lbee7tZw+t
	KBK/zT7j+PVFm1VvBotKM3PcXGIt9sfo5puDR/b7OC22SDyRcKaZxdDUb5r7QseOZL7N8/64
	Nu16OzXz0atHd1SWKTB/mpW07cKOKnGuI+daK1zV42I7qvk4SxjmOnTWbGY8uOfODKaD5699
	ar6ecP2SnMXZWSkanxdayZipm8w61u2qnRUv/8ZT5zmj4da+pufTfM7PULH3Yf7vWLn7SZ/f
	I+v92Ws1tsxf8dShu+eEe4ewX/LTWzvZljcu3Xftnv+61x/K1kf+VmIpzkg01GIuKk4EALtC
	p048BAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupnkeLIzCtJLcpLzFFi42LZdlhJXlfKNTHNYMZCMYsH87axWZw/v4Hd
	Ysqf5UwWmx5fY7XYPP8Po8XlXXPYLGac38dksWjrF3aLhx/2sFscftPO6sDlsWlVJ5vHnWt7
	2Dw2L6n36NuyitHj8ya5ANYoLpuU1JzMstQifbsErozFT86xFzxWqdh3upOtgfGCbBcjJ4eE
	gIlE06uvTF2MXBxCArsZJe78ncYKkZCR+HBnCzOELSyx8t9zdoiiZ4wS31b9Burg4GAT0Jdo
	viEBUiMi0MIosXGiD4jNLHCWUWJqXxhE/UFGiY8Lf4EN4hSwk5hxbzcLiC0s4CNxpO8oWJxF
	QEXi9M5OsDivgKXE9mvvmCFsQYmTM5+wgOxiFtCTaNvICDFfXmL72zlQtylI/Hy6jBUiLi5x
	9GcPM8Q9ThITpy1mncAoPAvJpFkIk2YhmTQLSfcCRpZVjJKpBcW56bnJhgWGeanlesWJucWl
	eel6yfm5mxjBcaalsYPx3vx/eocYmTgYDzFKcDArifD6FcenCfGmJFZWpRblxxeV5qQWH2KU
	5mBREuc1nDE7RUggPbEkNTs1tSC1CCbLxMEp1cA0WUfy/r1NPrU+z8tnfLz7dvKn75uKnb6Y
	TjrXOO/aApFutetrRa8m3LxqlZB4VMSXffkO3XNH42tFnxl8eHZ+xgfO/AP3i1T8V6T8dXtR
	Z6xQbVc+wXzipcJXG+ctEPGX1vGIPVAeyfXuXrO5SfPlBb8Lfr+tf/JWbIfAbZa2lPSZCmfN
	vvCfmjA/TeeD+/Tk6NhV03SWxHn89rL87yDozHpJdarb0TX2jlr9SzYmPL9Q/2yq8JoZUsXS
	t7O/KWSEZJvrf6tV3pYQ+tDC9E73mmmRWmG5G09ZfxEKVmWx35JgJdy2N3Dhb9Wm0qq82u0b
	vVd2RbFeiff2S9zqymutEZDg13ryftf8wt3Lp4opsRRnJBpqMRcVJwIAVVBYPiIDAAA=
X-CMS-MailID: 20240606051154epcas5p3943857b7b0b996ff9c2d59cbe222f9ff
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

Hi Krzysztof, Thank you for reviewing the patch.

> -----Original Message-----
> From: Krzysztof Kozlowski [mailto:krzk@kernel.org]
> Sent: 01 June 2024 21:41
> To: Vishnu Reddy <vishnu.reddy@samsung.com>;
> s.nawrocki@samsung.com; alim.akhtar@samsung.com;
> linus.walleij@linaro.org
> Cc: linux-arm-kernel@lists.infradead.org; linux-samsung-
> soc@vger.kernel.org; linux-gpio@vger.kernel.org; linux-
> kernel@vger.kernel.org; pankaj.dubey@samsung.com;
> ravi.patel@samsung.com
> Subject: Re: [PATCH] pinctrl: samsung: Add support for pull-up and
pull-down
> 
> On 29/05/2024 08:59, Vishnu Reddy wrote:
> > gpiolib framework has the implementation of setting up the PUD
> > configuration for GPIO pins but there is no driver support.
> >
> > Add support to handle the PUD configuration request from the userspace
> > in samsung pinctrl driver.
> >
> > Signed-off-by: Vishnu Reddy <vishnu.reddy@samsung.com>
> > ---
> >  drivers/pinctrl/samsung/pinctrl-samsung.c | 51
> > +++++++++++++++++++++++  drivers/pinctrl/samsung/pinctrl-samsung.h
> |
> > 7 ++++
> 
> Please work on latest mainline or next branches. This was based on some
> older tree.
Ack, Will work on 'krzk/for-next' branch.
> 
> 
> >  2 files changed, 58 insertions(+)
> >
> > diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c
> > b/drivers/pinctrl/samsung/pinctrl-samsung.c
> > index ed07e23e0912..a4b6eea5e168 100644
> > --- a/drivers/pinctrl/samsung/pinctrl-samsung.c
> > +++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
> > @@ -939,6 +939,56 @@ static int samsung_pinctrl_unregister(struct
> platform_device *pdev,
> >  	return 0;
> >  }
> >
> > +/*
> > + * samsung_gpio_set_pud will enable or disable the pull-down and
> > + * pull-up for the gpio pins in the PUD register.
> > + */
> > +static void samsung_gpio_set_pud(struct gpio_chip *gc, unsigned int
> offset,
> > +				 unsigned int value)
> > +{
> > +	struct samsung_pin_bank *bank = gpiochip_get_data(gc);
> > +	const struct samsung_pin_bank_type *type = bank->type;
> > +	void __iomem *reg;
> > +	unsigned int data;
> > +
> > +	reg = bank->pctl_base + bank->pctl_offset;
> > +	data = readl(reg + type->reg_offset[PINCFG_TYPE_PUD]);
> > +	data &= ~(0xf << (offset * 4));
> > +	data |= value << (offset * 4);
> > +	writel(data, reg + type->reg_offset[PINCFG_TYPE_PUD]);
> > +}
> > +
> > +/*
> > + * samsung_gpio_set_config will identify the type of PUD config based
> > + * on the gpiolib request to enable or disable the PUD configuration.
> > + */
> > +static int samsung_gpio_set_config(struct gpio_chip *gc, unsigned int
> offset,
> > +				   unsigned long config)
> > +{
> > +	struct samsung_pin_bank *bank = gpiochip_get_data(gc);
> > +	unsigned long flags;
> > +	unsigned int value = 0;
> > +
> > +	switch (pinconf_to_config_param(config)) {
> > +	case PIN_CONFIG_BIAS_DISABLE:
> > +		value = DISABLE_PIN_PULL_UP_DOWN;
> > +		break;
> > +	case PIN_CONFIG_BIAS_PULL_DOWN:
> > +		value = ENABLE_PIN_PULL_DOWN;
> > +		break;
> > +	case PIN_CONFIG_BIAS_PULL_UP:
> > +		value = ENABLE_PIN_PULL_UP;
> > +		break;
> > +	default:
> > +		return -ENOTSUPP;
> > +	}
> > +
> 
> Missing clock.
Sorry, I didn't get your point exactly. Could you please elaborate?
> 
> > +	raw_spin_lock_irqsave(&bank->slock, flags);
> > +	samsung_gpio_set_pud(gc, offset, value);
> > +	raw_spin_unlock_irqrestore(&bank->slock, flags);
> 
> Blank line
Ack, Will update.
> 
> > +	return 0;
> > +}
> > +
> >  static const struct gpio_chip samsung_gpiolib_chip = {
> >  	.request = gpiochip_generic_request,
> >  	.free = gpiochip_generic_free,
> > @@ -948,6 +998,7 @@ static const struct gpio_chip samsung_gpiolib_chip =
> {
> >  	.direction_output = samsung_gpio_direction_output,
> >  	.to_irq = samsung_gpio_to_irq,
> >  	.add_pin_ranges = samsung_add_pin_ranges,
> > +	.set_config = samsung_gpio_set_config,
> >  	.owner = THIS_MODULE,
> >  };
> >
> > diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.h
> > b/drivers/pinctrl/samsung/pinctrl-samsung.h
> > index ab791afaabf5..23b70ddcaccc 100644
> > --- a/drivers/pinctrl/samsung/pinctrl-samsung.h
> > +++ b/drivers/pinctrl/samsung/pinctrl-samsung.h
> > @@ -61,6 +61,13 @@ enum pincfg_type {
> >  #define PIN_CON_FUNC_INPUT		0x0
> >  #define PIN_CON_FUNC_OUTPUT		0x1
> >
> > +/*
> > + * Values for the pin PUD register.
> > + */
> > +#define DISABLE_PIN_PULL_UP_DOWN	0x0
> > +#define ENABLE_PIN_PULL_DOWN		0x1
> > +#define ENABLE_PIN_PULL_UP		0x3
> 
> This does not look right. The value is 0x2 for s3c and s5p.
I received exynos manuals. I'll check and I'll update.
> 
> 
> 
> Best regards,
> Krzysztof



