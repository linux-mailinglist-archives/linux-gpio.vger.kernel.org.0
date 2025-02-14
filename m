Return-Path: <linux-gpio+bounces-15989-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B3EA35A0A
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2025 10:18:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 760C63A4642
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2025 09:18:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A227222CBFD;
	Fri, 14 Feb 2025 09:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="NNYnwg3A"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127C1151983;
	Fri, 14 Feb 2025 09:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739524714; cv=none; b=h0yyFSCKP57R1UAL02G0R/0spwQd+cO0sb4hq5pe2BvD5F8T9pXGffr4dxr1IciZNyxcZ2Z5GWCVUX8kcJDthovlUQnEizfQG4Cu4CXX7tYOWnIyGTWmzvVPqRGGboPSwaw0ZRmqbqbyeTlrSzcWaHRO3itS7QJaT6adu+Qqju0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739524714; c=relaxed/simple;
	bh=PGVkUHMQd/qCG2EC0ToGD9dA8CGNgIUICxwqCAmKGCw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=nWc+vmxgXzOQxhIfg6xzMRZhTZe86H1Qzh5/OBUJxPP/Byh+Hk9RG14XnkKprU3++c9/I3Hw+qrnat8vGjebosvGmFb9QA5U4gH8kehFAvvY3J0ewm1mMsa/01QsgV3T1yhv9I2HorlIxnDr55yZqTiM4wBES4Kw5JW7DHRHnIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=NNYnwg3A; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id BDAF1433E8;
	Fri, 14 Feb 2025 09:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739524710;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b9W3vUY6yO+IHRec/sO/TdVHACFpEGB5P3jObXpFbkY=;
	b=NNYnwg3Aa9b+bb7qfajpbVYMkaQ0jTIHHg/mQUdU0uDtbapf5yDwfqgI/xjR1W/kOJMxSQ
	nGyaHPG93iefQcYULoaCAJ++52vA3E/UcPmipALPOpr4DjdvaraXWwcfUEMh+7IbuOPmd2
	x5YDlKZXj7wjATiTdaq/jU6QFy5CsE/AfUG3vGqtnCIwvplp8T2nHK7cqg4V3qeiotUvrR
	0gxEs5VfVPw+hAEhxhFmjRH1tiZfeyomakGnvaZemxzQw2Y3MJW2zgYdiwtBOK3aqH1OHr
	VkojJt50ivlm/VRPfWtRSLpRe5bLxulzrsK/49Bf9tClXMiyqbPSd374FZc9Ew==
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 14 Feb 2025 10:18:29 +0100
Message-Id: <D7S21NAXRW2A.2LB56QSTDCV6Z@bootlin.com>
Subject: Re: [PATCH v1 0/5] gpio: regmap: Make use of 'ngpios' property
Cc: "Michael Walle" <mwalle@kernel.org>, "Linus Walleij"
 <linus.walleij@linaro.org>, "Bartosz Golaszewski" <brgl@bgdev.pl>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>, "Bartosz
 Golaszewski" <bartosz.golaszewski@linaro.org>,
 <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20250213195621.3133406-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20250213195621.3133406-1-andriy.shevchenko@linux.intel.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegledvjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffuvefhvffofhgjsehtqhertdertdejnecuhfhrohhmpedfofgrthhhihgvuhcuffhusghoihhsqdeurhhirghnugdfuceomhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepkefhkeeifeethfejteevfeduheduvddvuedvvddugfffhfevkefftefhuefftddunecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfehftghfmehfsgdtugemuddviedvmedvvgejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfehftghfmehfsgdtugemuddviedvmedvvgejiedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepjedprhgtphhtthhopegrnhgurhhihidrshhhvghvtghhvghnkhhosehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepsggrrhhtohhsi
 idrghholhgrshiivgifshhkiheslhhinhgrrhhordhorhhgpdhrtghpthhtoheplhhinhhugidqghhpihhosehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhifrghllhgvsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhhsrdifrghllhgvihhjsehlihhnrghrohdrohhrghdprhgtphhtthhopegsrhhglhessghguggvvhdrphhl
X-GND-Sasl: mathieu.dubois-briand@bootlin.com

On Thu Feb 13, 2025 at 8:48 PM CET, Andy Shevchenko wrote:
> It appears that regmap GPIO doesn't take into account 'ngpios' property
> and requires hard coded values or duplication of the parsing the same
> outside of GPIO library. This miniseries addresses that.
>
> For the record, I have checked all bgpio_init() users and haven't seen
> the suspicious code that this series might break, e.g., an equivalent of
> something like this:
>
> static int foo_probe(struct device *dev)
> {
> 	struct gpio_chip *gc =3D devm_kzalloc(...);
> 	struct fwnode_handle *fwnode =3D ...; // NOT dev_fwnode(dev)!
>
> 	...
> 	gc->parent =3D dev;
> 	gc->fwnode =3D fwnode;
>
> 	ret =3D bgpio_init(gc, dev, ...);
> 	...
> }
>
> Reported-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
>
> Andy Shevchenko (5):
>   gpiolib: Extract gpiochip_choose_fwnode() for wider use
>   gpiolib: Use fwnode instead of device in gpiochip_get_ngpios()
>   gpio: regmap: Group optional assignments together for better
>     understanding
>   gpio: regmap: Move optional assignments down in the code
>   gpio: regmap: Allow ngpio to be read from the property
>
>  drivers/gpio/gpio-regmap.c  | 41 +++++++++++++++++++++----------------
>  drivers/gpio/gpiolib.c      | 27 ++++++++++++++++--------
>  include/linux/gpio/regmap.h |  4 ++--
>  3 files changed, 43 insertions(+), 29 deletions(-)

Hi Andy,

Thanks, I confirm I tested this series and it does fix my case: I can
leave the ngpio field uninitialized and its value will be correctly
retrieved from the "ngpios" property.

Also the whole series looks good to me.

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


