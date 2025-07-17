Return-Path: <linux-gpio+bounces-23416-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD33B09086
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Jul 2025 17:27:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4FCD3583828
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Jul 2025 15:27:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AB332F85CD;
	Thu, 17 Jul 2025 15:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="VjiNpk4f"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F9B1E520F;
	Thu, 17 Jul 2025 15:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752766034; cv=none; b=EuL448qs4JX4+SwLNyoDAA/OR0ZT1PyrG537VD/zg7MSxR8MD9L30vDzVd93zUgjyAvN4lgpOyOs248pXdPiOhSxw3l5jM1p3zuGQhGPcS4lrfhAEC3F77/qWbvlfKrdESfn9i35J82wYgWJF1nV9H0FhPYN77VErZf7EEF+N/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752766034; c=relaxed/simple;
	bh=NQE218xM/uYai0NdPYpenB3Q0L2BAgSxW5TXcN9SoN8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ylnbkq8PYKrFq1z5PpiQGGgb+sgDHIq1j+9NhfJ+9m7Q7AGkT0/2eL01k0/l14fm8Z5FkVFloV56QGJCHSziDrrbYPOXZYG0EuEZzfYKvIosMGvXeMCNp8uaN+qb38Dc/u4HIvKMxTJRukYVTfijeZsyHjJSpYWZJIPTn6EwIKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=VjiNpk4f; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7118B43A0F;
	Thu, 17 Jul 2025 15:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1752766024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5NL0HDq/x0YbzoK0LOLm6d5hufR8+z/CcXms1AjNRP8=;
	b=VjiNpk4fCmf82cJR2ZqX18tjYRN8oYbiIp2qIbRs/6CyL00Q3YyZwo605HMRj0aG5oRidi
	PE99lhEO15h+58R0QkkxYSQvb138NQ689SkBEG1EgYDi1++GEu5dUshi9cd5Ls7O3rrOfg
	zlPlYXDAdZowalqXxP0whOEfRxr1An36aVGQGZYn5gYaa9bCM7FkUOqDSDi0yvp+Yt7vaf
	Gv5WuO8mxSiIIt8wzrNko9w19wi/lkHXzZNCoAgnk6qAfR/SOToS2rSs/2XGsG1l3psjVz
	xBXjpvjg46BwEND9hMlMU/n4K2iU61Pc+8WyTPrmwGLvz3WnXLU4m5e/jIhwUg==
From: Romain Gantois <romain.gantois@bootlin.com>
To: Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 1/2] misc: ti-fpc202: remove unneeded direction check
Date: Thu, 17 Jul 2025 17:26:57 +0200
Message-ID: <14379725.uLZWGnKmhe@fw-rgant>
In-Reply-To: <20250717130357.53491-1-brgl@bgdev.pl>
References: <20250717130357.53491-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3574599.e9J7NaK4W3";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeitdelgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkjghfgggtsehgtderredttdejnecuhfhrohhmpeftohhmrghinhcuifgrnhhtohhishcuoehrohhmrghinhdrghgrnhhtohhishessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieekkeffvdeugfekjeegfefhvdetuefhtdelieduheeileduledvteelgefgffffnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehffidqrhhgrghnthdrlhhotggrlhhnvghtpdhmrghilhhfrhhomheprhhomhgrihhnrdhgrghnthhoihhssegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeejpdhrtghpthhtoheprghrnhgusegrrhhnuggsrdguvgdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehlihhnuhhsrdifrghllhgvihhjsehlihhnrghrohdrohhrghdprhgtphhtthhopegsrhhglhessghguggvvhdrphhlpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhor
 hhgpdhrtghpthhtoheplhhinhhugidqghhpihhosehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepsggrrhhtohhsiidrghholhgrshiivgifshhkiheslhhinhgrrhhordhorhhg
X-GND-Sasl: romain.gantois@bootlin.com

--nextPart3574599.e9J7NaK4W3
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Thu, 17 Jul 2025 17:26:57 +0200
Message-ID: <14379725.uLZWGnKmhe@fw-rgant>
In-Reply-To: <20250717130357.53491-1-brgl@bgdev.pl>
References: <20250717130357.53491-1-brgl@bgdev.pl>
MIME-Version: 1.0

Hi Bartosz,

On Thursday, 17 July 2025 15:03:55 CEST Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> As of commit 92ac7de3175e3 ("gpiolib: don't allow setting values on input
> lines"), the GPIO core makes sure values cannot be set on input lines.
> Remove the unnecessary check.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/misc/ti_fpc202.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/misc/ti_fpc202.c b/drivers/misc/ti_fpc202.c
> index f7cde245ac95..ca415ef45cbe 100644
> --- a/drivers/misc/ti_fpc202.c
> +++ b/drivers/misc/ti_fpc202.c
> @@ -125,9 +125,6 @@ static void fpc202_gpio_set(struct gpio_chip *chip,
> unsigned int offset, int ret;
>  	u8 val;
> 
> -	if (fpc202_gpio_get_dir(offset) == GPIO_LINE_DIRECTION_IN)
> -		return;
> -
>  	ret = fpc202_read(priv, FPC202_REG_OUT_A_OUT_B_VAL);
>  	if (ret < 0) {
>  		dev_err(&priv->client->dev, "Failed to set GPIO %d value! err 
%d\n",
> offset, ret);

LGTM

Reviewed-by: Romain Gantois <romain.gantois@bootlin.com>


--nextPart3574599.e9J7NaK4W3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEETFOGm0tqZfYwVxBymGofZEoxB4MFAmh5FkEACgkQmGofZEox
B4Pudw//WmOIYd5K4bpyhceplO0TUalfRdIGrupHCJxlFk7zh4Ox2rAaisvAGNQK
E92g9JBQ1G2Ph/G7odM60nfwAjxPIP8RPGHDBuZ5r1GcU99UBidsnlrFZr2n5+O4
8EyMUfHhORnWAMGIuYjGGsUxsh2f9RZZkX+T5Nt4aJ95ORlAuBOaPeZtzaqQwnvi
X+I/f47RrHX7Krv8lSootjQvJar5lQJJa620jx6ym8nDj5hYUNIj3SvxUBFM8os1
t2wsRQ0ULP2CWriBEAfXOI7jttdm4zFjAb2tjNm55FFyv59WLZyfcUyEhPH1FIav
NBRL4L741QuKQ+UAEW9ss/QUFDsqp8XM5ze511D0MEGhAUIBVn+KEK8+3RGhHncQ
oI3rIpKo/r8urENkOyKwZLbve2U9BjehVbf+7owLIGEHzVW02UbzxXi0G3D9+2nc
QW+4/A2aFKrwd6P/QG3kB+Zmqy3mIL035QaACRW5A6566+hS+npBi7Sjzqfv6Aqu
dMOsRd1TCoAcLDyVgNzYmbCVA1Sugu611GrIKoP64TmMB3oUs7lelRAcHYtTeIWQ
oWGGInNwAr6Xf2qzu0LTq32hAliNht+z90Wk8yj8+nXoCS4MUhTpwWZDyKT+3Fuv
OlO8J2XPBD8JU7TQtnNHRan4V8VbZtrKm1UwJ/KpHjlq0fqtjaU=
=KXp/
-----END PGP SIGNATURE-----

--nextPart3574599.e9J7NaK4W3--




