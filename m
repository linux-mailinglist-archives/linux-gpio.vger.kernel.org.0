Return-Path: <linux-gpio+bounces-21571-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 229C4AD99E2
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Jun 2025 05:08:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 706F93B173C
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Jun 2025 03:08:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93F171A8412;
	Sat, 14 Jun 2025 03:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ui1+g3uh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ACB61C28E;
	Sat, 14 Jun 2025 03:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749870522; cv=none; b=M7BJIIcY+p2PAmZqXS+HQ/6vzUnXkA4Z2sB3CoKDoJvwgh02Qmqmuc2ChEP9mlDfPcIuUAVmqhqch/zi92K8JYNfson+LjSH5WQOfZE4nZok8bjtwZHWztYEJItT3D4scTQ7c2tjIdlLvcbV+b4z2+gUO52NJQPp0UJ+QkmFbVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749870522; c=relaxed/simple;
	bh=slU5/gRGZ+X+AdD9Jx/KursslTeI+BhugpMonKjI2tA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ph2PSe8mXEvE65JDflSMB/uhCNUwYpxXT5J86ONIvM9EdU53mWcmeXGMRtC6CaXF41ba+ijq+pPeynZTJrfWbqZMAZf3iSkmj5hrt8e+04+Yq3nYESZK/GUn5gGhRlzUCQSbmVwB7z3K2S1bGtoXpq4PmpkhsfiEafbcy3dpHJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ui1+g3uh; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b2c4331c50eso2254775a12.3;
        Fri, 13 Jun 2025 20:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749870517; x=1750475317; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=slU5/gRGZ+X+AdD9Jx/KursslTeI+BhugpMonKjI2tA=;
        b=Ui1+g3uhj+wkRTRD0EhNPCq0mkod8DZX8dzJYapp3AQSGrrWkcksSYBMSflc6hBxtX
         Uw+eEcnwVFe5j+Vfdq0BG+boK/FdmB8e0oGY1SpKITAGzBccLb40CEYUzaQ9JBa+gCK7
         tivzcy8kzgtkImPIgVwQ8nAsW8mSK+uZK5VmPZhi24xPY81pLhpquXs9D0yReATtjArd
         0vyAGQHSWQTRVcI6pwbIWtEBrpQ0aj5ugupHJxzNJgdE45GSNQFeKFNBbtbZ/IXwx8En
         kHipCMG19p3RX4zITSHw+A7pRL03zxh+kST4mc40/D2x7fbp61litvEkbP0ZxKcAOEJ2
         ojvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749870517; x=1750475317;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=slU5/gRGZ+X+AdD9Jx/KursslTeI+BhugpMonKjI2tA=;
        b=mELYatinwJKhWL36RF3A9mpzaX1GEJJjAmKTdrctpq9qb9ex5nLmAQYECjqbtVWZUB
         TlKV+NL7uX/FYC7gJyK4AsejAkGuvj6qHSunh3yJrLjdWeOZKWA8rly9ooeaWNZmIkHL
         p/gzrImNK0FtOFEchdnc8qMtqOwyT107/5niqpbWIC6y9UN2pqyXVBcepJsy3mg/xIpl
         W6MflpXLkUeVO4jrgm63AsfMp4vt8LpHKTkyt+cbECWpxwtoMRG8Y/1/XxcMkYuTvDSZ
         qOsTRmitOqYoxJo0yhm1TZBJnvlNxykWeCzueI4WWdZBGNKS8cOP86qYOcWea0pAR/KK
         s6JQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2FXVQQJWfHK6/h1hbKYJCYC5lhAQ7x2gj17/QXSAwDEFkpypAZ+KQnpAWR6BH3PB7Rg5tZpGa0WU=@vger.kernel.org, AJvYcCUuGVXNRBsaYjHfBPsyhFl8+qS7zUp/Xbj7sFk601fDFE5KDo8Y3JT3SPlXzc71RPMHbQObptLf@vger.kernel.org, AJvYcCVFeCFHmb2EPnBKLAO0Xw2Dq9zL9rQV/AQALmunElpd81o1/nXSdFZttuIHHF9fPtjxG9g2oxYLJHeAjw==@vger.kernel.org, AJvYcCVUGwP8ikxoeggWR5tG3Pgc2HmhPHXsQKMrs58N/TrSF6SR6WGpUb5AhOOnVrsiDeQsRW5cMfQjwCxq@vger.kernel.org, AJvYcCXZ5uWTBXxZaa42X096vGEwO+xdU3U/yt158uLqJ5SEOR1fMUXrHWLAYHW0I9+Y1LgUQh5veWW3y9ib@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb+uTpXARfBAauKJ6HCire6V6520geMtezaB9ix+ve3V8IhHjN
	dqV7FOgUF8lCVZjxWTmzvTyDVWvu18tHTzL9U7z687wiH71eg5ULUSmE
X-Gm-Gg: ASbGncsSDYeTD8yyyod1gXZFrjNOQ7jDgHUSl2JkZdL7EJjQOH2REaLVZbHY/D1JVqM
	YzTM8fqrdZHhtTKdwhPUa93A4Uaj66iT96B/gdsaY6iM1sEUZEDAGL+yIziOVexoe8+jjQHbDLz
	TuedGumZmUYRuvhJC1DUdOsk19ART8gwRrZO2OrNZQ2Rf7ZCCXp//bEaP27rTm5cM2KcoXb9CYD
	fnr2sHDd97bzs0Gz931ZSZeIjoOKsW+nv96iOZxWf0gAcKEFkY01MKXd1AaBtt/B3FcwGEtqz9u
	cCo7uSWDRklzgYAQbr1zJ0tH6p5lynD/DwcRsbzS++DsEZKvgYLQ4hY2vYR0JA==
X-Google-Smtp-Source: AGHT+IGNdmkR+4nBshMH2dcC/WUsJgI6udsfA1wK5+AWZ7uxqXLAyPWbVmTGd4AoyOxlg6NwRnO3dg==
X-Received: by 2002:a05:6a21:69b:b0:1ee:e655:97ea with SMTP id adf61e73a8af0-21fbd68e749mr2351293637.41.1749870517124;
        Fri, 13 Jun 2025 20:08:37 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2fe1639eb8sm2147060a12.10.2025.06.13.20.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 20:08:35 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 90EDE4241807; Sat, 14 Jun 2025 10:08:29 +0700 (WIB)
Date: Sat, 14 Jun 2025 10:08:29 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Simon Horman <horms@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux GPIO <linux-gpio@vger.kernel.org>,
	Linux MTD <linux-mtd@vger.kernel.org>,
	Linux Networking <netdev@vger.kernel.org>,
	Linux USB <linux-usb@vger.kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Jonathan Corbet <corbet@lwn.net>,
	Richard Weinberger <richard@nod.at>,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
	Felipe Balbi <balbi@kernel.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [PATCH] Documentation: treewide: Replace remaining spinics links
 with lore
Message-ID: <aEznrV9XoXNpYKwa@archie.me>
References: <20250611065254.36608-2-bagasdotme@gmail.com>
 <20250613130753.GE414686@horms.kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GUjbLh60lsjawVfy"
Content-Disposition: inline
In-Reply-To: <20250613130753.GE414686@horms.kernel.org>


--GUjbLh60lsjawVfy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 13, 2025 at 02:07:53PM +0100, Simon Horman wrote:
> I am wondering if you considered also addressing
> the spinics.net links in gadget-testing.rst.
> They are the only other instances I see under Documentation.

I can't find on lore remaing spinics threads ([1], [2], [3]). These are all
=66rom 2012-2013 and somehow lore doesn't have linux-usb archive on that ye=
ar.

Andrzej, Sebastian, what do you think?

Thanks.

[1]: https://lore.kernel.org/all/?q=3Ds%3A%22f_phonet+with+SOCK_DGRAM%22
[2]: https://lore.kernel.org/all/?q=3Ds%3A%22pnxmit.c%2C+test+program%22
[3]: https://lore.kernel.org/all/?q=3Ds%3A%22usb%2Fgadget%3A+the+start+of+t=
he+configfs+interface%22

--=20
An old man doll... just what I always wanted! - Clara

--GUjbLh60lsjawVfy
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaEznqAAKCRD2uYlJVVFO
ozmUAP9e7U+IepwBR1/uxeix0k9gN0MnJUuM0zLK08IHd/ZQIwD/fznXO/qTwDWY
XqpwyY9Zte61Q4ES2LZvcwCIW8VqzQk=
=szxl
-----END PGP SIGNATURE-----

--GUjbLh60lsjawVfy--

