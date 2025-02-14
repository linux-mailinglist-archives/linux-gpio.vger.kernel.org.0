Return-Path: <linux-gpio+bounces-16031-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D397A35FE0
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2025 15:08:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DECD13A7215
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2025 14:07:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 485FC265626;
	Fri, 14 Feb 2025 14:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="UGyKqFgd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E08261376;
	Fri, 14 Feb 2025 14:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739542079; cv=none; b=fKwvauErL3LA7Y9ggEED9azeeCy5dbdUHdjDG1+Zkq+Vlpu+662sKuXxOncdG/BMYWuK6c+EYnoTRunad9y5qvRWzuuONlSZCfdac5xztjtaCHknHqwUuPJHKhq7TY1iZUplecftaYPYsBnQObGAg2TGHczrVRWxoptyR8s+HO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739542079; c=relaxed/simple;
	bh=+qlyWOt9BFdScl2fAkOoVcKrD94Xs5Sy+VSI9gOFmTM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=RwEBdY+yRZmy1hYTn+n0Zgo2avHLelbr7pZwm+uHMGicbZpn3iHfAvyevXm7HwQAKuorTIAftiAUXwaku1obWyl3pN6Xr5QNHLCwUE/9zLa3J41clPwGE0epf3jnaqZiPv7Cqh0DzXi0wQUHbXpoXiZca9tZ0e8iLAiOqLGdtVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=UGyKqFgd; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id BAF63441A0;
	Fri, 14 Feb 2025 14:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739542068;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AZNk4MMG+BjXDI3SUcRM1PO+mJxRM0nz461OGI70YGY=;
	b=UGyKqFgdY0/qLOPkrqBcCcKctfnNti4DwOgm8Y2vxNVP9rLV1zMiNA93ESy3g/xvTdjTzK
	ENTB87GB9wHnQf7o6YMDRAQXKOvb0B7N3U3mRIR7vNUks0Exv50v7ZaOVR+G3n31EEHD40
	/5PNRxmOZu9UoUxC9rlFGst3xgEEhioKj19M+4yPxyWmbHwyPxwLD6cFNv/eYuFBL2iHBm
	AFk1JjhQRg20VtNLN9tPM35HPFq/pX9E1Gq46tuznvOpOoFVmQ6XtOKRqjnsjoW5NreHrx
	ldJS9hm7KFx+Z5x94iU0Nrc+TFQ4scgsuDnAERvq0s5I2o7cCRjoVjnu9Jo9TA==
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 14 Feb 2025 15:07:44 +0100
Message-Id: <D7S874FN28TV.3EJHJXB60GQ76@bootlin.com>
Subject: Re: [PATCH v1 0/5] gpio: regmap: Make use of 'ngpios' property
Cc: "Bartosz Golaszewski" <bartosz.golaszewski@linaro.org>,
 <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Michael
 Walle" <mwalle@kernel.org>, "Linus Walleij" <linus.walleij@linaro.org>,
 "Bartosz Golaszewski" <brgl@bgdev.pl>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20250213195621.3133406-1-andriy.shevchenko@linux.intel.com>
 <D7S21NAXRW2A.2LB56QSTDCV6Z@bootlin.com>
 <Z69KBATz7I80r0sl@smile.fi.intel.com>
In-Reply-To: <Z69KBATz7I80r0sl@smile.fi.intel.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegleekhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffuvefhvffofhgjsehtqhertdertdejnecuhfhrohhmpedfofgrthhhihgvuhcuffhusghoihhsqdeurhhirghnugdfuceomhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepkefhkeeifeethfejteevfeduheduvddvuedvvddugfffhfevkefftefhuefftddunecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemsgdukehfmeegrggvieemtgejgeegmehfjeelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemsgdukehfmeegrggvieemtgejgeegmehfjeeliedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepjedprhgtphhtthhopegrnhgurhhihidrshhhvghvtghhvghnkhhosehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepsggrrhhtohhsi
 idrghholhgrshiivgifshhkiheslhhinhgrrhhordhorhhgpdhrtghpthhtoheplhhinhhugidqghhpihhosehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhifrghllhgvsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhhsrdifrghllhgvihhjsehlihhnrghrohdrohhrghdprhgtphhtthhopegsrhhglhessghguggvvhdrphhl
X-GND-Sasl: mathieu.dubois-briand@bootlin.com

On Fri Feb 14, 2025 at 2:49 PM CET, Andy Shevchenko wrote:
> On Fri, Feb 14, 2025 at 10:18:29AM +0100, Mathieu Dubois-Briand wrote:
> > On Thu Feb 13, 2025 at 8:48 PM CET, Andy Shevchenko wrote:
> > > It appears that regmap GPIO doesn't take into account 'ngpios' proper=
ty
> > > and requires hard coded values or duplication of the parsing the same
> > > outside of GPIO library. This miniseries addresses that.
> > >
> > > For the record, I have checked all bgpio_init() users and haven't see=
n
> > > the suspicious code that this series might break, e.g., an equivalent=
 of
> > > something like this:
> > >
> > > static int foo_probe(struct device *dev)
> > > {
> > > 	struct gpio_chip *gc =3D devm_kzalloc(...);
> > > 	struct fwnode_handle *fwnode =3D ...; // NOT dev_fwnode(dev)!
> > >
> > > 	...
> > > 	gc->parent =3D dev;
> > > 	gc->fwnode =3D fwnode;
> > >
> > > 	ret =3D bgpio_init(gc, dev, ...);
> > > 	...
> > > }
> > >
> > > Reported-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com=
>
>
> ...
>
> > Thanks, I confirm I tested this series and it does fix my case: I can
> > leave the ngpio field uninitialized and its value will be correctly
> > retrieved from the "ngpios" property.
> >=20
> > Also the whole series looks good to me.
>
> Thank you! Can you give a formal tag(s)?

Sure!

Tested-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Reviewed-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


