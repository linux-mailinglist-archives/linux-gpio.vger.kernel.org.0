Return-Path: <linux-gpio+bounces-10851-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 641D0990513
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2024 16:00:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9472C1C22A49
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2024 14:00:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AE812139C6;
	Fri,  4 Oct 2024 13:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="hCgOOuHK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B793B2139C9
	for <linux-gpio@vger.kernel.org>; Fri,  4 Oct 2024 13:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728050275; cv=none; b=lVOlAe1vi88cIanWXbRpgBsLSJ0QUYCdeIJPP3WzWGrDn+ejz5oGUVjFEYzKT0Xb+BCuva8OPt3xBLfsV7cT08OEBdPvT2pvDubo6lNZ6W2pUsvEXPLsJMXLJGEUFdq/FEKXTgYsstRVx/cNHQ2iRVW7k7W69SNXPnFN6tSTh0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728050275; c=relaxed/simple;
	bh=RiAraQPAbIAi8z6cI1HEpV8MMXU8lulYq1Zb18jcIjI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X13uyWpldreNofbuMKuxPj8K5eEe4312T0fW2KbDGe+HfhAjrvRltL+yq4iOsckKHbL9m8xrfcg8DM4x/aVu6ZtTj2LA1VP4NM6kab4UJvRfK10J9EI+EGk3IHVugEhwYny/clNkyrglk9tvw/DjCJhyWG7i0Ky86hHkmHawPdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=hCgOOuHK; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5c40aea5c40so4479882a12.0
        for <linux-gpio@vger.kernel.org>; Fri, 04 Oct 2024 06:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1728050271; x=1728655071; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RiAraQPAbIAi8z6cI1HEpV8MMXU8lulYq1Zb18jcIjI=;
        b=hCgOOuHKHyHWoEqLmaeR9NXJqndBsjbHvqC3ZoVM+eByj//0GTgDGSdXBZFHWp30tc
         g7i4fEfi34/zvoQ2ZSbqthK1JdLlb4Y2A8TkE9vUgkoZxPWrRoa7Ykg0ixcadsodcr3x
         70WBZc+wWjknF32g8DIZW6A36NL2Te+WVpXP+SgdbfsfnVzr9mI4JxPaRVNmPu5B4IqX
         FnwnQP8Q99Bn4txksarCtlhvGxAAGVYBrBawANeQumC39AUWE8I4DXRfp5hkYjdT2fuf
         tFbjhLxWQSJ1/QcU46kXG6RVjQcdTi5mfDpuGP4i2DUtnXP9S9YJenJN7R/1kTgrh9KV
         fg1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728050271; x=1728655071;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RiAraQPAbIAi8z6cI1HEpV8MMXU8lulYq1Zb18jcIjI=;
        b=Ge+y+OtmrTMK5lWBFcI6F+imSmvhsJrpYv7r/Y+KfoyIHzEUzwEux+nsAQCXRjuRtB
         Q1oaNZ+pmFYrx2HOvj8JtDgQNGxvubCUc3CwA0KHcVkhFY5o/2DrkfmDSuCUPoUAs8Ls
         tvgLMSIELgY9nR4SUnlC4uZusEwScTgG6cWjkslYjpCT8WoCFgbLQj9zZcNrb0OxQnNi
         7MK2lWklZCpQmOyN3KHSQelzleMWJoOCG6aNNb3ONGbUf6nWFbxCtjth7BsSSVE4kLMu
         eYbj6/TuM9j9S2/WxOPa+bdhnbLDDEkEgtMAU84NwrBvazSC1DHNNntch2raBRgnI9XX
         tmFw==
X-Forwarded-Encrypted: i=1; AJvYcCUmuouy+YHxhJk7GrTyunO/dOarg5oFRbBQWFOHWUJXnyPFzk43ZMMZ36M1SfmycQUnh9j1JoWJj8ax@vger.kernel.org
X-Gm-Message-State: AOJu0YzstNs6O+dnw9h8oYVAgHssf+HLw/GDrAxpBB/EwQjoJcFvrt2r
	gU4y7G3vTuAnwkZWR1w3YSpWJ/vlQcToEDk57bplGxSAi0n625g7g7sZnt3t1DQ=
X-Google-Smtp-Source: AGHT+IG7t7UdkVGUfJ61pil2C1emJnQd7oRrkGl9HCha1KOBXBnH2jeCyLpBirVQK5quEDqnGagKGQ==
X-Received: by 2002:a05:6402:5256:b0:5c8:a4c1:d59a with SMTP id 4fb4d7f45d1cf-5c8c0a0f276mr7035716a12.8.1728050270897;
        Fri, 04 Oct 2024 06:57:50 -0700 (PDT)
Received: from localhost (p5dc68d3d.dip0.t-ipconnect.de. [93.198.141.61])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c8ca4d7e51sm1910491a12.71.2024.10.04.06.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 06:57:50 -0700 (PDT)
Date: Fri, 4 Oct 2024 15:57:48 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Kent Gibson <warthog618@gmail.com>
Cc: =?utf-8?Q?Jean-Micha=C3=ABl?= Celerier <jmcelerier@sat.qc.ca>, 
	linux-gpio@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: Re: PWM-GPIO driver: how to configure it?
Message-ID: <a2mjcu4g6z27463yviri7sozmyvlxntkviz7r5lkqjhimbiwfi@fgdthlvg37we>
References: <CAA=GyxYyTvweUa1SWGeHkdtRRNuhFTri8cPTrFQY6pO+84vS0A@mail.gmail.com>
 <20241004070655.GA60749@rigel>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cvapwdhtbsxk5hyw"
Content-Disposition: inline
In-Reply-To: <20241004070655.GA60749@rigel>


--cvapwdhtbsxk5hyw
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Fri, Oct 04, 2024 at 03:06:55PM +0800, Kent Gibson wrote:
> On Wed, Oct 02, 2024 at 02:41:06PM -0400, Jean-Micha=EBl Celerier wrote:
>=20
> This is probably best asked on the PWM list, so cross-posting.
>=20
> > I am curious of trying the new pwm-gpio driver in Linux 6.11 with a
> > Diolan DLN-2 chip, which exposes a gpiochip accessible to linux over
> > USB.
> >
> > I haven't managed to see where the configuration options of the driver
> > are set: for instance, let's say I want to create a PWM output channel
> > over gpiochip1 line 4, 6 and 12, what should my modprobe line look
> > like ?
>=20
> Good question.
> I think it has to be setup by device tree, but that is just a guess.

Setting up the pwm-gpio device via device tree only works if you manage
to describe the USB gpio chip in the device tree, too, as teh pwm-gpio
device must have valid gpio descriptors.

Otherwise you'd need to extend the pwm-gpio driver to instantiate
devices dynamically somehow.

Best regards
Uwe

--cvapwdhtbsxk5hyw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmb/9FoACgkQj4D7WH0S
/k5qOAf8C7praMpiccfbeyPRchS+W1A9ilkr84LMqoga5oR3CwS29jIDCjHE5GKX
dHck7vc0POzmM2LkXemfBa8yxKVhNhGUVbbrZCUTqDeZPlou70pMsV7HfBwCSJGj
8D5w8A1YlV0jn1mONqLCmldSdE7fGeukD5PmvKGZGi5j0DFbjk6AjEf/HV0w8RWG
FKwKCe7ICoGubQvTzbqqZVufGzu9rK8nLjvQed+Qm4m5E2EUE7xAjqmD0qpofbj4
K7jIqzz+r/qa36joGBo/OX4aSO4vCXy+Ft0GbffsN8cus7XzNCUC0AewAKJv8s9l
bd4EeE+ovS/ftmRLuzyaNciskJ7XxQ==
=dwTV
-----END PGP SIGNATURE-----

--cvapwdhtbsxk5hyw--

