Return-Path: <linux-gpio+bounces-21369-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC6AAD5297
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 12:49:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE16F3AAC64
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 10:48:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F9A327586A;
	Wed, 11 Jun 2025 10:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="TyRMti4M"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F3727702B
	for <linux-gpio@vger.kernel.org>; Wed, 11 Jun 2025 10:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749638696; cv=none; b=n6sGYYdGUTRR556PmcVuByLgGwE+t3qsoSKz7494qiHhMAEoe1ePbRf/Cq7H9LmV5+scOyniweVKxXI45uL9XlDYUEocewwIgNk8NRhIB8qRHKLlo+R2huQNvvhY3LEnSUI98EiwtsB/K/IaEupWaoypC1eRsuscfxNpKHtH+Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749638696; c=relaxed/simple;
	bh=AkmlIkiSTFxMXdM17LcikxgoK7JYJCTqbrGwWgMtQVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G8gjsUYxAIlz9/2YsbP251XMZXyIAaZxazyp8b14kf7uUSKyHAVnqBs2bCXZKYe393AV9fu9h/JESLQEeKLpPpEvOfBK6zvh1xta2UjqEeMG5imgQW8c96uteYTdYEddEjXUq2qRzhkDJhQKMwFdjHTzBU5KUJVhI+ZWZ3Wa3/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=TyRMti4M; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Akml
	IkiSTFxMXdM17LcikxgoK7JYJCTqbrGwWgMtQVk=; b=TyRMti4MuR4qhkjd7UZW
	0DENHjUkcHAvMqIM6FyUllfddgTgEfm+wEeqGnS8gjkHQmfLNSSXzrx4lcE7BLs2
	Wnr/TWU5JTEWO+H1FmwlzRwhh/NLqpTabhjBrCxgZ1NHKq/ASc8GDCIDiHnL99Wm
	8E/7WspgEQimgg+V6fFjh9xYGPsjyrkGPQnOESQz/3UijWWwQFEITFZO8nbQvKLV
	SwezLdFuWudN4OO2noZFlGKHlfh47G17sSSfgmPukMra3GVmCE2Zt9mGdlENHaMc
	wwxz0VBVbMBu+2kvwln2AbCcy6qYxLCBYlNVseUDQo2GpUFR1ilGRRkIrpT7cGVO
	kQ==
Received: (qmail 3208528 invoked from network); 11 Jun 2025 12:44:52 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Jun 2025 12:44:52 +0200
X-UD-Smtp-Session: l3s3148p1@6FW+gEk3go4ujnuC
Date: Wed, 11 Jun 2025 12:44:52 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 0/5] pinctrl: renesas: use new GPIO line value setter
 callbacks
Message-ID: <aEleJFgQxLfMpOW9@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250611-gpiochip-set-rv-pinctrl-renesas-v1-0-ad169a794ef0@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="m9HLKi0jyL6BPHJD"
Content-Disposition: inline
In-Reply-To: <20250611-gpiochip-set-rv-pinctrl-renesas-v1-0-ad169a794ef0@linaro.org>


--m9HLKi0jyL6BPHJD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 11, 2025 at 09:27:51AM +0200, Bartosz Golaszewski wrote:
> Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
> values") added new line setter callbacks to struct gpio_chip. They allow
> to indicate failures to callers. We're in the process of converting all
> GPIO controllers to using them before removing the old ones. This series
> converts all GPIO chips in renesas pin control drivers.

Looks fine, builds fine. Thank you!


--m9HLKi0jyL6BPHJD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmhJXiMACgkQFA3kzBSg
KbarSA/+N40q5pc6ncbfya5l4DCj7mIJ5yMh6XMpJiyE7Rcw/NtxFYZWGAUzVkJY
0D7aoAyp5k2i9OxMoc9ZOdW585nst3fH1rKp7gzrkgp1lr9+kgetw034sMx6WgTu
jJ1VsmfvdcXmkhngWYpc1Am52K4WkJkkW4CbkyEx8vealnOwrrDJpXscaoIzEFCN
OZw9xH1Rux7+/yPYySgwAzCFySSj3tDOkN1fLmGpTE/XHqzEHtKduqwWKNu975E+
4o6AboShUy5NjzvcKq0038vFKvDpLFqSb/sgguLNpCr32Qzg5kEleQjkZI7ocYkX
i2pLjh4XDyfc0LFt8p7zPQYZnmWddRsxEXnWmUt0aseSXfPx1iwLMNBjC//qrpzG
QNn4oA9GD8IoCOiSMY/AMp0z5IX4drls0rL8xoCbdvpSt9mep36JZzYXKXcUxsH8
fBYZDXvHhgVUylj2eMLdCShDU3/kHKSfVYKVFVJQj2PGaEjEbFde5dWPWTgPFVwj
/ZED2wDSMoDBXmDGBALsern3pM8jtIN0Nz88PhnSqnv05WEb2uv5C/N9CWr1Djob
p/B+Pnsy4l1z9Ldqrx6mWMnMsuYawcARYZsdZ7mL0m9GB2PNGqS8sCybMFmjK6cw
I0xtwVZdqEoVQ+KYQfEMuLrNS3AExryMkV1U/8O/TPwqNULXou4=
=1QtY
-----END PGP SIGNATURE-----

--m9HLKi0jyL6BPHJD--

