Return-Path: <linux-gpio+bounces-8184-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B70192E81E
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jul 2024 14:18:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D20D1C23912
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jul 2024 12:18:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E09115DBB7;
	Thu, 11 Jul 2024 12:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="LKholIY2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B6E14C5A1;
	Thu, 11 Jul 2024 12:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720700286; cv=none; b=MdFmo8657bAWDCgzI2Cln4NAaUxe3V6+Oqz8bgBTCqoc/jC6lwVdi9Ihf3LO/aaEjQZmk7Y28vZPHmmpnRFxk5dhbsX2GihMo1SEa6XxeOlUO6SMckxsfkVUqs3vyTFhKx8v8rRhE7v0IgSttqjKk8rYJvmNA+1ZPCi2wH5lvZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720700286; c=relaxed/simple;
	bh=MCcKkfIHbkEd+6CsJgIzO9cpN8BUXT4dnNGblhRZoMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hKGpKvM7L0oiaj+S8EZDYvDjnu4weFzJQeEtmA6QVPusGGH44IGftwJocBzjqsBG2JOgdipOH8WklXDrTUr0OBxvaCsDQP25P7+0q9ZTLeYbsDcfCHnq9dUm/66ric7c3DzsqhS2dwtqid0+UmE61OzGK2WB/tRfsdTEjP0q3wU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=LKholIY2; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id BD5271C009E; Thu, 11 Jul 2024 14:17:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1720700279;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=D99mVzS+ti1zgyQh4FEQg828UI3+8m33SnRmsqjTu3k=;
	b=LKholIY2HCdQd8Biag13PJtuUNzjfkxCZ2GOV61v2c5E80MWYcU5Sj5f0YXBLoGwzC/IfL
	uQT2HeEZe7wyVatUZ51aEKfsasUaiPTdtTrKUbquxEZemHNbUkb8J677M2s8ITEP0sOMrV
	K6DxQdgRj0mRiOOAMj+7pWyT621YDKY=
Date: Thu, 11 Jul 2024 14:17:59 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Ian Ray <ian.ray@gehealthcare.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linus.walleij@linaro.org, brgl@bgdev.pl, linux-gpio@vger.kernel.org
Subject: Re: [PATCH AUTOSEL 4.19 4/7] gpio: pca953x: fix
 pca953x_irq_bus_sync_unlock race
Message-ID: <Zo/Nd/lLNp1Kgk4F@duo.ucw.cz>
References: <20240709162726.33610-1-sashal@kernel.org>
 <20240709162726.33610-4-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7faJBDLlzyWb9oq8"
Content-Disposition: inline
In-Reply-To: <20240709162726.33610-4-sashal@kernel.org>


--7faJBDLlzyWb9oq8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> From: Ian Ray <ian.ray@gehealthcare.com>
>=20
> [ Upstream commit bfc6444b57dc7186b6acc964705d7516cbaf3904 ]
>=20
> Ensure that `i2c_lock' is held when setting interrupt latch and mask in
> pca953x_irq_bus_sync_unlock() in order to avoid races.
>=20
> The other (non-probe) call site pca953x_gpio_set_multiple() ensures the
> lock is held before calling pca953x_write_regs().
>=20
> The problem occurred when a request raced against irq_bus_sync_unlock()
> approximately once per thousand reboots on an i.MX8MP based system.

I don't see this queued for 5.10-stable.

Best regards,
								Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--7faJBDLlzyWb9oq8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZo/NdwAKCRAw5/Bqldv6
8hbYAJ9iUuWMMusNSoG7cK4KQYQRj9/4rwCfTkV20q07Qks98X7SS+Qs/W9NFQ8=
=a0Zc
-----END PGP SIGNATURE-----

--7faJBDLlzyWb9oq8--

