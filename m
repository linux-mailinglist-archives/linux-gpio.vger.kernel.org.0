Return-Path: <linux-gpio+bounces-25984-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E8885B53B6F
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Sep 2025 20:30:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 667261CC5FC8
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Sep 2025 18:30:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A92436933E;
	Thu, 11 Sep 2025 18:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Rv9H58Hf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409A7368087
	for <linux-gpio@vger.kernel.org>; Thu, 11 Sep 2025 18:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757615412; cv=none; b=YDGle7T/I/bchUP+iBAlLeyOC9bmq5HDBX2dtNqI5WpCYLn0bgXWx9X+P1wmGoB4LjcTeHBg0YqWc7inSZwr5J1PMAsLnOGMGq69YObY332WSztg0vWcJJJ74L8nG6y42kCnyv1RsjA4GpxzWq8FtWDiksVWnXYNBSseVmdi5N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757615412; c=relaxed/simple;
	bh=qqyzymhrB1WgmsAGtEhTv8YTgRRTGgub67m5KOzqo40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eeje5R9n8vI8oeMngCou0i0ZCnoZxueX2Y16VTZFRScTnUoMeIdPYPxbunlHVilTqc98ULoSEgHA2JWtWpxSXLnRzBc00kKXB7zRkly2xPwygxDs0tUp7c971OvyC00wUIvU/UUSLsnT5VNoCoeIClmZ+/UnxQznSKzv4uNUPsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Rv9H58Hf; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=qqyz
	ymhrB1WgmsAGtEhTv8YTgRRTGgub67m5KOzqo40=; b=Rv9H58HfNoMt0qfiQCfB
	wBdeTrcG8tmcG7D0TF69nQj4E7b5OAesVvZQrT1nx8q0eKQ2u7SEUqrzFDVdWEw0
	augv8ns1BjdR8YLV93s2Qv9LyiC1kJlQHsbODj2AX86MqRrXcsYi4qXVi3BKUxrR
	P3yZJhqb7+cxivgcj5LyVQm1DJqViqugZ0oc0hd3YIwVOkOwM+kzd8qW0XM7dbpi
	e26H1u6G/h/gCTao+nLY54CQA98xFlLWs0fATskTQwnK0xPuMNqPbBZY3qDaihQt
	Vp/+Ts5IM4lIrJeFoWcHtiktYo5Co0rC5IoTpS+s3Ff344QDO+jA4eBRkt5ZCOZp
	4g==
Received: (qmail 1077486 invoked from network); 11 Sep 2025 20:30:04 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Sep 2025 20:30:04 +0200
X-UD-Smtp-Session: l3s3148p1@67XPuYo+8MoujnsE
Date: Thu, 11 Sep 2025 20:30:02 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Wolfram Sang <wsa@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	Richard Hughes <rhughes@redhat.com>, linux-i2c@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v6 3/3] i2c: Add Intel USBIO I2C driver
Message-ID: <aMMVKsbDIIFzaWdu@ninjato>
References: <20250911181343.77398-1-hansg@kernel.org>
 <20250911181343.77398-4-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="s6NYjgFIiKgUZOTP"
Content-Disposition: inline
In-Reply-To: <20250911181343.77398-4-hansg@kernel.org>


--s6NYjgFIiKgUZOTP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 11, 2025 at 08:13:43PM +0200, Hans de Goede wrote:
> From: Israel Cepeda <israel.a.cepeda.lopez@intel.com>
>=20
> Add a a driver for the I2C auxbus child device of the Intel USBIO USB
> IO-expander used by the MIPI cameras on various new (Meteor Lake and
> later) Intel laptops.
>=20
> Co-developed-by: Hans de Goede <hansg@kernel.org>
> Signed-off-by: Hans de Goede <hansg@kernel.org>
> Signed-off-by: Israel Cepeda <israel.a.cepeda.lopez@intel.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--s6NYjgFIiKgUZOTP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjDFSYACgkQFA3kzBSg
KbYF8A/6Ap4wEMRywYZXQSVqoX8td4Hv1vpEEUIrP7nOe5s4QU2mwar/94kmLAV+
xCW4ArXui6YvBaMnMG0xbI+NXvNUiUeVVUTTOWWgN5jHYmMlYuWxx6NzuyqlpUiN
Rt9Qp4YLehCUQ75FmbYeKsLEb4Pj1HikbImPg6KavL/kSMMDlnejnFzKV7ybLC7L
6CvzDiAQmkUhGNzjkFJPEJxJxBamSwteOHCDm2Uh5saKMw9CNulqZp+29EnUSInW
0eN3Kj8mMaoN/hbj0XrofagGTLxVQADLb8BXgnMQVfr11yi4isZdSKpK3bbkp+77
Ov6ZIJdXfhpV3om+gY/AHak3sX8/KOCg4yAjZFNJL2jA/lwEaznzyYbsE/H6pVSc
RF6tmN4/TPQoV6/fz4j+jjSpZvguX61WZWpOl/kHKziKvYTy7ytkIHt3HxADlY32
dx4I/XSsU11rULcLVYJdBtrSoghBf90F+cA25Eqhog3bIgJLajeXzuXdnRaTlhAv
Nws0lGylCQgsSb2SNCgAUCDO7cNI2oGrhnLsuX7n6/vRFPli88znrwsqjb1R8Y0q
l022+/f1jBCuAkfhPH7RVeb42110gZEoZJINAt/3GHPhOf83ZRlD9TTuCypTye4b
9Fu2/gTQaZIEFun8dsdJ9XYzp0q0Wor7IholerEMwZzhzzYcHZE=
=RJ/p
-----END PGP SIGNATURE-----

--s6NYjgFIiKgUZOTP--

