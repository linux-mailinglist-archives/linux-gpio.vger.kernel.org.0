Return-Path: <linux-gpio+bounces-13692-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A02359EADB9
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Dec 2024 11:15:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8DF3E16362D
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Dec 2024 10:15:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EBF01DC996;
	Tue, 10 Dec 2024 10:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="E8CxyqtB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7600578F47
	for <linux-gpio@vger.kernel.org>; Tue, 10 Dec 2024 10:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733825707; cv=none; b=Bsw0VyPV5LUKv8o7hwg2pb8J+6xkYvKu+YNkmlTTW3khJjaOyaR+Uvmcg0Ok7dzXTvS7VK0h9ASpc9Z/RBQTRqE4oF9WrepuG5TPEyEUZdCDXj2C6LCZcYMpqpqtk7xTAlK5NjhyjYU7EPswSzOUw/VmiUcunI9FRo0gUzuwQgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733825707; c=relaxed/simple;
	bh=hxqzHHY8diBwOx0+l2LdTXhqIMDiIDIS/LcxGVlCmlc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VsDir0V1eV0Ebn1g7otSyVBWIlF7otgyOTU4eX5EotvtdpfUgozqexAgjXjqw21mFDMjKtIoVl8P7nHMGtDF+oXgDcYuuBe/FEVlYNnliHtXOqX/imLWCm7bgwUpeK6L7bNQsq/eH+t7mK05HgnN+bVRulwveBYyrh81MsmG+Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=E8CxyqtB; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-385eed29d17so3684411f8f.0
        for <linux-gpio@vger.kernel.org>; Tue, 10 Dec 2024 02:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1733825702; x=1734430502; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hxqzHHY8diBwOx0+l2LdTXhqIMDiIDIS/LcxGVlCmlc=;
        b=E8CxyqtBmwZgxWcyUFEASk2icLpaJReaFTZyoAWwcZiNwUYFhz1oycVrc2X0ODWAyy
         X1gGR4rusV9yWuU4kb/sESWfhmDv4BJ8qL+wccQtsx/h8oHQIHojZHPJlQddwRiQCWd6
         Sldd+V4l5BZrJCEjPNEkJD15KHGx8DadD+WZdXXvdRn265/Z1mdCf6lxukjmVDzzklOv
         8feeW72vPQuX8oIAWmuWOfFtwESKQzv5pT/0co4oiT19E0m013I7PKKAd92lj1QdMxEq
         +SpqQ7QusnAlu5xxTk1JqkICZhi1vR2uNDOLBzXulitXNatE5heTgv/7nUJeJIo4MasQ
         qqTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733825702; x=1734430502;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hxqzHHY8diBwOx0+l2LdTXhqIMDiIDIS/LcxGVlCmlc=;
        b=SMXcZBCW/jLmgkKv1yqSUyc+VIcumJWwlz0hO9dCWTkFrGgWT1bwnzgDoG1K9NqxZs
         sjCb2/jxlR/458E/4Y235g+lTtptyt8t2FDfuTY2nVx0VG7CeI0Yu2sCZPndfJiopEWG
         dnKqs+autXNjdPrFpTHTkYUJzReDrOFNOYxKbVCrQkFSMFKDaS04gd8jr/B7ND9EGtG0
         pIBjKO4oJUFVKInkB01nSarCtTvfxU0Huqpf9jpwjNnNabSjYH5JqrVTJ6COB5rNR+z3
         u7oUFGwpa9sJMciul7PgrCuzCEkOIUE7JKZFxWSXJVUkH1EOZ8ML6x1PfUib9slXfdk3
         Bd6w==
X-Forwarded-Encrypted: i=1; AJvYcCXCGlitE34aREKBuOboYNfdElXCocIvvdjDEq8g5mnDYbepxTMB0UQ5DeNeYjx1pLMxPFdP7wYSpdIE@vger.kernel.org
X-Gm-Message-State: AOJu0YwDhap6pPYAuSOSS9mzF6s5aMZ+1LbVjeBRNy7S7CJn8a1AHRqJ
	BIGk8A+Iwu/YKokawJKwg0EfWp+SEEO8+AMViKPe6gfIgA5dDrM0nxJ1jMm8fVDSkn0/jgckvxI
	7758=
X-Gm-Gg: ASbGncv1c2PC/PpNHEsL4EOJGNPA4yxGtty1F6WLpv4wPZoRllR/+NeZ+XbERGsR6uR
	HRsVg4I3/zaiU+hRlWTQudnyXXEbSF469COZ3CqBw67mVHqLpJv0W7gD6Tl2OxcImMKseBZqhjx
	JThVCdi4dTID2ap4XB/RfaB8hPgT1A6NEy8aGlCi34XFrsLfmdjAjHsrGOLvsivbe4MA8iEANGV
	K6IMrJElQLvCxUIe4eUdtay1+F/cqAVuTx5myOdnH4NOHMFYioxVtWxKFSrOQtCXtGG89Cb0YF9
	3mlfmTi5
X-Google-Smtp-Source: AGHT+IHAF+MK4nT2wby8tFZabj/cGZDwP7OF8n1O3n74dFPzK5cudq0rsVYUf99xFyH0dj5J1nvPUQ==
X-Received: by 2002:a5d:64eb:0:b0:386:3918:16a8 with SMTP id ffacd0b85a97d-3863918193dmr7492471f8f.13.1733825701756;
        Tue, 10 Dec 2024 02:15:01 -0800 (PST)
Received: from localhost (p5dc6838f.dip0.t-ipconnect.de. [93.198.131.143])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3861ecf42desm15180561f8f.15.2024.12.10.02.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 02:15:01 -0800 (PST)
Date: Tue, 10 Dec 2024 11:14:59 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: William Breathitt Gray <wbg@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpio: idio-16: Actually make use of the GPIO_IDIO_16
 symbol namespace
Message-ID: <ekyhfceyoqkjoyw2rmw5jbasxzx6c5p2ufub6vmtv5xqi5e4fq@3eq7obihlrhj>
References: <20241203172631.1647792-2-u.kleine-koenig@baylibre.com>
 <CAMRc=Md4t9QuiCtJ3TswSM-2qdOwR5_yk=kVN7wcvN4jz+yhkw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="snharesphbrtpqly"
Content-Disposition: inline
In-Reply-To: <CAMRc=Md4t9QuiCtJ3TswSM-2qdOwR5_yk=kVN7wcvN4jz+yhkw@mail.gmail.com>


--snharesphbrtpqly
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] gpio: idio-16: Actually make use of the GPIO_IDIO_16
 symbol namespace
MIME-Version: 1.0

Hello Bartosz,

On Mon, Dec 09, 2024 at 10:28:14AM +0100, Bartosz Golaszewski wrote:
> On Tue, Dec 3, 2024 at 6:26=E2=80=AFPM Uwe Kleine-K=C3=B6nig
> <u.kleine-koenig@baylibre.com> wrote:
> >
> > DEFAULT_SYMBOL_NAMESPACE must already be defined when <linux/export.h>
> > is included. So move the define above the include block.
> >
> > Fixes: b9b1fc1ae119 ("gpio: idio-16: Introduce the ACCES IDIO-16 GPIO l=
ibrary module")
> > Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>
> > ---
> > Hello,
> >
> > this is based on current Linus Torvalds's master branch and depends on
> > the topmost commit there.
>=20
> Can you rebase it on top of the gpio/for-current branch? It doesn't
> apply to my tree in its current form.

Your tree is based on v6.13-rc1. If you keep it that way and you apply
my patch that you ask me to rebase there, it will conflict when it's
pulled into Linus's tree as ceb8bf2ceaa7 in his tree touches that file,
too

So if I fix the merge conflict now to make my patch applicable to your
tree, you or one of the Linuses has to do the reverse resolution again
at a later point in time. Is that really what you want?

An easy way out is to backmerge v6.13-rc2 into your tree (or rebase on
-rc2) and only then apply my patch.

Best regards
Uwe

--snharesphbrtpqly
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmdYFKEACgkQj4D7WH0S
/k4I5gf/T/8wwNDO7Fot1U23iC5kP8Ii66h+LS2P8LYxaHwoZas676HXzN2Od0gD
ebdU/j830aZp/au5aoXKSiwxSd81f6hqK2qlkm8/gPW9jpoNRHcelQQyF++SGN0r
zZ5ZFD0/lcMdDGL+kVsiXWnWga2uJ7FdKx4jBUd1kOqhNnR6LzK8Ujyiho3mmphK
ittYcEWTmFeqO67bajLdqpekpxOzzckJSy73buZJdENTfuYQ7iXCrPYDOChqCW8V
BkMuU34eqAze1LbHHjgnQdlR0bVaJcONlySp2FMOFeD/+1Q+ayDV7TUeon46vz6E
6lzeENLp/KJfv0X9IkWddKHNJ4wvow==
=zjyP
-----END PGP SIGNATURE-----

--snharesphbrtpqly--

