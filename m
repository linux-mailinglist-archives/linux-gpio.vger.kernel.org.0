Return-Path: <linux-gpio+bounces-16230-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 31608A3C22D
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2025 15:31:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6BAB0188553B
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2025 14:30:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C67441DE8B4;
	Wed, 19 Feb 2025 14:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="AL+Jc1Nq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2801EE033
	for <linux-gpio@vger.kernel.org>; Wed, 19 Feb 2025 14:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739975415; cv=none; b=puJJcgA9OFXqORx/Qw9r49YE3F3ooLv5cMKzWQ1wGbYCXBFwfZgobvPnpn8i+u9ZP9HJR9bVWei+2fY0+1bKjtqSWYp06Os3p2Fup9v9Plut2h2rJcs02JHTI3ncWiumK5LJ7Xc0Pc9x31bPbc+yqcfkSYX5cbmodPlShtLHkHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739975415; c=relaxed/simple;
	bh=1p6FdfQ3eMnbMKelGEYIDRmk6QavZdCBbv/rQIHHhIM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dWxYoIhfi16qD/sNeUCmf5XpHo1vzfWQA1sxYqxAw36I3x8vegXyerjwDl29DtH8N8nrK3BEXGTx+RFaKh+HBLfSie9q6baBY2gGVFKCxbgMYFBvqjfs1I156IRpq6i7VWpdIB182i8SNaYr2iFM2qbjU0SBQilj7QGLelXUTxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=AL+Jc1Nq; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-30613802a04so71865011fa.2
        for <linux-gpio@vger.kernel.org>; Wed, 19 Feb 2025 06:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739975412; x=1740580212; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vuIDDV8XizcdY0WvVB2Kx3sOucvN0o/9tPcHbGKOfP8=;
        b=AL+Jc1NqCA8PmzMBjcXF4uiPdVSjNanEP6D47+v7tiK3e9H7TWuy6N24ckDO4LKXAC
         GEogIbAumU5zyfgPq60ABEDcegytXowvunFUFPbg6bhmRsc6dtsE4uI8fHQ9kcc0GXk9
         ufGfkgnx8yQ9Gb00Yut+6di9HiQc/zm9rLbgHuW7wbCTb0txklA19EMQcGynv9ybYAHl
         MlOBlNMX6+Z9KLW1ooopy+w10MWSJXwBR4cxZWtT+K0qTCtM8e5FAA4rEDyIUwFr4Krj
         vijvSHijlkBWkZl6/diBHd31oh0YdVplWI0Hd1aWIQEn/vb32IChQBAd5a55l+EHW64A
         u37Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739975412; x=1740580212;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vuIDDV8XizcdY0WvVB2Kx3sOucvN0o/9tPcHbGKOfP8=;
        b=gxPzqWHtBMMa10D8qW0v3lMtqaAmqNg3JfWv0vPbZBHd9nKZU+UK0QHBwgufag8so8
         NtqVmDbAYUR8o1lq5xD5NGx6V/j8XdZF2E1nWUebloocLALC+vt8upPLTwsnX8x6/Vpf
         fF3o1kNoyIaFupF6ufWT6PKQqxqSkHKuo8+5KgrTYZ8vYwZteVEnxSmDQctOMEVUZChF
         hkSwoGy+huNdvt5ZO/xiQNUkSRI4b2vEGfMFQmI9jxAWTWJjdD/E4w0V6VY39vS1J1jm
         Hat+bReLvH/Lv4VZauYTOPtxDWITDGzthQ6X/WgtuOKvN8qMT63JFnOAf5EOrJLPtnBN
         jMIw==
X-Forwarded-Encrypted: i=1; AJvYcCUA1e+x+f7tHvOV1pJeD7E5431QZOWt/l5Lqdmr8d59O9GuNco0KsnwMyl3RyzIhNFilWQWmL/GYYJ9@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+VXicELbjdaG7k9SsyfaYqjmki606stLV15aqg8h+VAkY6bWm
	ZY7gd1Qa8uzBhI8LnETWy36uWNaVI6GRe91dga3amBW0S8nxSL/t+L7Bvsxsw54p4lUjEZBEhr1
	ocOY7A60Hi6swENPnmhLkbk1MfBz4sw2UY3Itrw==
X-Gm-Gg: ASbGncufzk1hXqT6Fb+2s9N8II/fRBRbKohI6B74DO9B+snz2pzfDXYkPzvo0cxg45y
	vI04bc+HjZit1cTtKTeOZOj75qq/E6irDn5dTviJyzjp04Oe6mRQpst4VFPWXgnel6gWypCR6Sc
	+GmmHug4aqzhsTKFzX3/tizUTZitw=
X-Google-Smtp-Source: AGHT+IHOMtfBh/a511ZAJ8gik3yig8Gf8tft31WvSnZ/9U8LQBfynkf9Rv5xxIK5889YeSWOE/kZLOcF9FoI8gDV8D0=
X-Received: by 2002:a05:651c:a:b0:2ff:8e69:77d7 with SMTP id
 38308e7fff4ca-30927a64cacmr52017231fa.20.1739975411736; Wed, 19 Feb 2025
 06:30:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250219102750.38519-1-brgl@bgdev.pl> <Z7XqSVfhPGI5J63B@finisterre.sirena.org.uk>
In-Reply-To: <Z7XqSVfhPGI5J63B@finisterre.sirena.org.uk>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 19 Feb 2025 15:29:59 +0100
X-Gm-Features: AWEUYZk4HNm_SmluZtNRXIOXfJN4_JOCBah2ClXW_YT2EcZ78XVjnV_7fdlN460
Message-ID: <CAMRc=MdEcjFUp2OEutcnDqSHbbait3f25NEWbdp7mARyKZLvBw@mail.gmail.com>
Subject: Re: [RFC/RFT PATCH] pinctrl: bcm2835: don't -EINVAL on alternate
 funcs from get_direction()
To: Mark Brown <broonie@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Stefan Wahren <wahrenst@gmx.net>, 
	Liao Chen <liaochen4@huawei.com>, Chen-Yu Tsai <wens@csie.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, linux-gpio@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 19, 2025 at 3:27=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Wed, Feb 19, 2025 at 11:27:50AM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Since commit 9d846b1aebbe ("gpiolib: check the return value of
> > gpio_chip::get_direction()") we check the return value of the
> > get_direction() callback as per its API contract. This driver returns
> > -EINVAL if the pin in question is set to one of the alternative
> > (non-GPIO) functions. This isn't really an error that should be
> > communicated to GPIOLIB so default to returning the "safe" value of
> > INPUT in this case. The GPIO subsystem does not have the notion of
> > "unknown" direction.
>
> I see this was already tested for these specific boards.  I've also
> found that Avenger96 is failing with bisect pointing to the same commit
> this is fixing:
>
>     https://lava.sirena.org.uk/scheduler/job/1126314
>
> as is the Libretech Potato:
>
>     https://lava.sirena.org.uk/scheduler/job/1126285
>
> neither of which produce any output before dying, they'll not be fixed
> by this change.  Seems like an audit of the drivers might be in order?

Right. I don't know if they return EINVAL or some other error so let
me prepare a change that will not bail-out but simply warn on
get_direction() errors in gpiochip_add_data() instead.

This patch can still go upstream IMO.

Bart

