Return-Path: <linux-gpio+bounces-10862-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E384990964
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2024 18:37:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0BEE0B21E4D
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2024 16:37:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DB391CACD9;
	Fri,  4 Oct 2024 16:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="NREGt6zc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5C11E3795
	for <linux-gpio@vger.kernel.org>; Fri,  4 Oct 2024 16:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728059831; cv=none; b=lEGdc+5TctqqAlg/SM+IqPjlmEbCu6ydh3ViOjCzlvrWccVbejchBlOruyX/XJnBilvTH3GkVMyNoGx8jpksJOyfgLE2B5fzm0/iK2j5+mVdpMqkBGYzH4XhXUftUPZwkDrKa3+lGUHnzud67rlr8lvoWpUoi7GHmH4BoHtPvTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728059831; c=relaxed/simple;
	bh=kjLtd+lMGnqibMfPC4W+1y0wVmOp85GN2zXSFF2W9YE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sSJIhDR+hlScD7GktNOyG7+cX4DLfFxlYE92m7WqVwcnmHEN3jYl121sg+sVelEtIVqF0jGo5iy3u2p7IxhCqH/5tGaWjhKpaTFCPrm7uQtj0AOTzhM1Rlh6i8XqlPNnY+BIhS3U6Z2+r9P5NY5YDb2TRpLi56OZv3ykbmKmKP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=NREGt6zc; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a8d29b7edc2so299625966b.1
        for <linux-gpio@vger.kernel.org>; Fri, 04 Oct 2024 09:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1728059826; x=1728664626; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kjLtd+lMGnqibMfPC4W+1y0wVmOp85GN2zXSFF2W9YE=;
        b=NREGt6zc/uqYK14nV8pn+ADJejXa/yKwmnY83H4POG3XbihaSAzjhKgFHuuByfF5SG
         odcdVmuI96e4zo8Xmc6MxCZ4N8NqYb39YoVRkqi5GjtTJGgMhR2W1nrWWBaPs4MCMfvf
         rz6wR3kyfUH3QdOqt2jhFDgIdmO7WemfP2k42eTyh6kU2omD3vXZ/H29COoS8t5lMc0d
         D/RAwBeUewUwycnJRrA4w9qqrwuPhr3W1ZGrSbdRgT3h4FLkuc7LHg5YONww6LEGHSU3
         QRzIw/7gWbrc9hGS9ziIl85L0/SA6f2kiT+eDes2abJC/ZOSud8j3h6T8hQdSl3Bgysl
         ss4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728059826; x=1728664626;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kjLtd+lMGnqibMfPC4W+1y0wVmOp85GN2zXSFF2W9YE=;
        b=rgUky0//NULfNWIW5A3bhD5GYrPPJfyxwpILKgrgulasW3hR/cx9brNoPvuB5Q0cCc
         dfVmuKNP+r8GF3dvPOTND/TjKh2nCfSzIJW5PGtNxuQ5Q0eiHbefI5BLH4yPAlhyFGM7
         k/pliqfOSX4Jn7AXbZgWm3+kXn4WucLNNvlzwt6UNVaX9ebH0yICvIgZbppbQDY091/k
         9rRCIbJws56mVGqWNtSUrTn0t/a8RCltBhTkXOASLsua2v7lev8N1Nyu+QGJeT/At/q8
         W7zPqiAzTzFsuaKb1YTTFxY4P5w5npUgCBX75n1fMvsnSK3jfN4zCPYnZ34f/EsgFJSK
         QyPg==
X-Forwarded-Encrypted: i=1; AJvYcCVwuqAdCagCFgs/W4mI5bp57pizOvVqvl40cXlV7zAFY8zSZr5LFn3czajHJPyBoH+TvGYLJ+laDJ22@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2wB0bfeOOltzMy4tP1EPIR4YhBmXfRzhlZwQljlPWN+NeWs3y
	BrXpj0ZtzGMbf7PQKAYL+HMKvmfCIl58S7HYQbX0vpM9Knq0ERas5E7ua68H5Bd4BMF7CrmKhER
	x
X-Google-Smtp-Source: AGHT+IEi1JUoIfOZ+ykGJ/LGwsZz7zhZVDvXh1AJ4Ilk4fQdEtAd6sC15srKGrzxdh/o6tfnCNB1Xw==
X-Received: by 2002:a17:907:d59c:b0:a8b:6ee7:ba12 with SMTP id a640c23a62f3a-a991bd726c7mr287713466b.27.1728059826226;
        Fri, 04 Oct 2024 09:37:06 -0700 (PDT)
Received: from localhost (p5dc68d3d.dip0.t-ipconnect.de. [93.198.141.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a992e5bbe43sm13885266b.30.2024.10.04.09.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 09:37:05 -0700 (PDT)
Date: Fri, 4 Oct 2024 18:37:04 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: =?utf-8?Q?Jean-Micha=C3=ABl?= Celerier <jmcelerier@sat.qc.ca>
Cc: Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org, 
	linux-pwm@vger.kernel.org
Subject: Re: PWM-GPIO driver: how to configure it?
Message-ID: <dttaovf5vtxnvl6kp6yqonitqufqkqmevydk46t5sfhc7zoxth@t4zdy5uweyvt>
References: <CAA=GyxYyTvweUa1SWGeHkdtRRNuhFTri8cPTrFQY6pO+84vS0A@mail.gmail.com>
 <20241004070655.GA60749@rigel>
 <a2mjcu4g6z27463yviri7sozmyvlxntkviz7r5lkqjhimbiwfi@fgdthlvg37we>
 <CAA=GyxZskkS0D6R+dD8Auq3d+O_Jk-Hg12rGJTxqgv_RAoatEQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oi3g6gp3pl5yuaox"
Content-Disposition: inline
In-Reply-To: <CAA=GyxZskkS0D6R+dD8Auq3d+O_Jk-Hg12rGJTxqgv_RAoatEQ@mail.gmail.com>


--oi3g6gp3pl5yuaox
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Jean-Micha=EBl,

On Fri, Oct 04, 2024 at 09:59:00AM -0400, Jean-Micha=EBl Celerier wrote:
> Thanks, my understanding is then that it is not really possible as of now
> to instantiate this driver with hot-plug USB devices, right ?

Not 100% sure. It's possible to add information for pci devices to the
device tree, too, even though that bus is hotpluggable and usually
autodetected.

> I'd gladly look into contributing a patch but have never contributed to t=
he
> kernel and would have no clue as to where to start.

For the generic solution you would need to create a sysfs file similar
to the "new_device" property for i2c (implemented in
drivers/i2c/i2c-core-base.c:new_device_store()). Instead of creating a
i2c device you'd create a platform device then. But the details are
different enough that this isn't an easy task for a kernel newcomer.

Best regards
Uwe

--oi3g6gp3pl5yuaox
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmcAGa0ACgkQj4D7WH0S
/k6dJwgAsMtGfEUttpwoxDjiDcTiJVsmeHzdB84fdubqQ/h5xL5reFi1eZFZz4Wg
EhCJvrHsq1/1c66iNsQNztw4iP9m0Sd9Xjn7wC6a7dGeqcfyLrJyeghK635oeYOb
ZN2pHWZl5iy6d+Xqg8tmHEMP9J+tlkhRTZfTaH1XknGZfx/LHzF5TD2pKrXaqQeO
fg21oeQWBJSpt44KjXt8GUQqZYTEYCwBrzPDqaakAfaJRzNxZ0dpOGTMlEgfQgxE
saLcL49qKC3RXa0irE0xmrYtQX5X6X3TWSh9SlTfDS/RY+TcS1MN02B+QKwQ861R
tE7EcGN1JZS0hmHrm0tqGRQGLuYirw==
=E/JF
-----END PGP SIGNATURE-----

--oi3g6gp3pl5yuaox--

