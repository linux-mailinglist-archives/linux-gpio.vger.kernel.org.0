Return-Path: <linux-gpio+bounces-16103-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2ABA37C72
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 08:44:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B65C73AF6F6
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 07:44:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 614FA19C57C;
	Mon, 17 Feb 2025 07:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dWzP+qcJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B413199921;
	Mon, 17 Feb 2025 07:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739778251; cv=none; b=N4l02TlR2ZYiaR/5m6Zd5MV408Nk552PWSleOLddktGiy7enpt134eH7pqafNESecuPaLFnTCCi/sQwwSFpcZvDk45GZ8BMqmD6sUfJGaxR9GaLnXmF1toH8OpjImIA3fsYw0R0/Lbu/JGAmYD5RcfT7Qf0pOJuFjSm3yrKOKOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739778251; c=relaxed/simple;
	bh=Bbrflya5nVSt2cNXmApP3KAlPYCu7xXoDGFPWYSjhIw=;
	h=Content-Type:Date:Message-Id:Subject:Cc:From:To:References:
	 In-Reply-To; b=ZXYvrn9uQx1zBexMEBBUVRx4UiVTUE2GebWNmQurVgNSvruJTp4bKH5ZsFEB8n7JML/By2GDG0zqdDAT0KLFlGWk0Z5P3WEOQ5MnDO7IFZ0V2QyG3t8WiL66ZAYaA2iuaVJs7qawBeOeE5y4AQYF5hl4Grd+oPslySoL6QACR90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dWzP+qcJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 408D1C4CED1;
	Mon, 17 Feb 2025 07:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739778249;
	bh=Bbrflya5nVSt2cNXmApP3KAlPYCu7xXoDGFPWYSjhIw=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=dWzP+qcJ5rw51K+nABT/iMYAGtNpVESzmvirOR5HeyRT70yXgyVsGeaY4Z7nbAq3A
	 ezwzL/HBqUgTcL2SIkG4pxgkdwwu9FTizqOtCHMGx9G8U05OU8R8W1srCbM7LZOnxG
	 hid16kDzBPsbuDMdgW9q1tV2gW7GDvwomEdF682iJNcAIszO7+w32tXXyGBzMzqphE
	 GkWbS/KNLTVXKWpPgKaXAY/rdQSYdT+3veh1TmrvX0WNn/br5Pyw1L46RCvHcJMy8s
	 va6OONszg455uI9r4dVcB2QXMyu7uZObty2+jCFie9yorRgigB08iZB8KeXnUvEuGs
	 28qKQz26UAj4w==
Content-Type: multipart/signed;
 boundary=5719814fb54f54e3427bc9faeabbd9bbeffba8d88f84dc81ea7fcdb19f0b;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Mon, 17 Feb 2025 08:44:05 +0100
Message-Id: <D7UJX0EZK9TK.1V2HDFVSKK0NP@kernel.org>
Subject: Re: [PATCH v1 5/5] gpio: regmap: Allow ngpio to be read from the
 property
Cc: "Linus Walleij" <linus.walleij@linaro.org>, "Bartosz Golaszewski"
 <brgl@bgdev.pl>, "athieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
From: "Michael Walle" <mwalle@kernel.org>
To: "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>, "Bartosz
 Golaszewski" <bartosz.golaszewski@linaro.org>,
 <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.16.0
References: <20250213195621.3133406-1-andriy.shevchenko@linux.intel.com>
 <20250213195621.3133406-6-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20250213195621.3133406-6-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

--5719814fb54f54e3427bc9faeabbd9bbeffba8d88f84dc81ea7fcdb19f0b
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Feb 13, 2025 at 8:48 PM CET, Andy Shevchenko wrote:
> GPIOLIB supports the case when number of supported GPIOs can be read
> from the device property. Enable this for drivers that are using
> GPIO regmap layer.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Michael Walle <mwalle@kernel.org>

-michael

--5719814fb54f54e3427bc9faeabbd9bbeffba8d88f84dc81ea7fcdb19f0b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZ7LoxhIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/hrrwF+LLHwHr4IqB7oqwwqHcbXb/5yO8S9TN+H
3nRkLiVxx0V3wxV5mWGi19U+7ckX8QrDAX45wpAh2zHWSDN78aFp+LOIgISQleXo
bM8CrbBZB07l3Xtf9/GiO8+Q0woimi1PfQc=
=pZJS
-----END PGP SIGNATURE-----

--5719814fb54f54e3427bc9faeabbd9bbeffba8d88f84dc81ea7fcdb19f0b--

