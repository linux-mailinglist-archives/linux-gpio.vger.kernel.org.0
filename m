Return-Path: <linux-gpio+bounces-28709-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A49B8C6BEAF
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 23:58:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6DEB93563A1
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 22:58:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 565D730FC27;
	Tue, 18 Nov 2025 22:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I999fFip"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58603309F0A
	for <linux-gpio@vger.kernel.org>; Tue, 18 Nov 2025 22:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763506705; cv=none; b=Tql0NEMnD9+OQhLTEfO3Yl70eVH+t/nJ+TeSvlSjE8mvih2F8NM4rvUeusnBqKIawMji/nwgkzBa0EWw3PL9QfcFhhBQoTtNTDYEEq1EW2jq+VgLUwXLmmab/Yte8IWih0JSKa/uOUow9BMcMDfD0blC2rvaOsYO9x79XpSd1Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763506705; c=relaxed/simple;
	bh=w+61w5T6iw2L+z7yyBk2vWNFdM7DOlMNfukQs3rBBhU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=svlPhPA2CfX1KpZ6Cm7rNbvXiKCPP92JPpRyVgdgSzpYo3ccs6JQuKG60RCZNlw+5oCwkKjCkxEkZau9vmkzoMB9IhA66wNlhXKZJUcxbEkD7xoms+mYuyHKnq4bTIJwiFL+oy8cGLB58pAaF1p5iG4ES3m4hIi6IXiraQaGWxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I999fFip; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-594285c6509so6356849e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 18 Nov 2025 14:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763506701; x=1764111501; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w+61w5T6iw2L+z7yyBk2vWNFdM7DOlMNfukQs3rBBhU=;
        b=I999fFipZH0VMJs1NWl2Y2P+lyilTmSjlh8soGhqclYfpREVuHV9251IqgmuDrp931
         vliDmAVxF46vufxmK3SYHtaHsWW4GseQB58lh5Enx7qEoXiHTyIlDlUmtz98L3NgP9QX
         bEbDyhkTVeaFnZUdkTQcUwpIJtjCLAZHR1m8U7rmTJj1ANjMY+8DSXT6oCtzjYFIY0i2
         9FCP0HsG96HWD4Mcc1dLvdrgMN6Ux2r9ZYnjjpFW3X+5VzYiMetGONFJcQn1OlAQFnZP
         V25T6k/1OI881/GNv/ojfnDPDGK9lHVRZd3NRW6YgrNMDwyDTTbA8JioDFDdd9OgX2FV
         6ETg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763506701; x=1764111501;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w+61w5T6iw2L+z7yyBk2vWNFdM7DOlMNfukQs3rBBhU=;
        b=iG2f5EgAkrAWGyzCf8mNFbU39Y95Z8ZMrB2uTmHls9txyYxMu/5vUXPUyC5whrctJm
         ERatKjC1TUg8DRaH4Vay5c8MqCtcpiyFmPLAdQLf1kBJBDDGw0zQmw+fpHf4E0jTsANW
         4w7qZbfyceuE6FcStaLfZ1QPVz57YHy0Cc69s51DJFDk7EOBYKPFaibe0T6+qsY0frwO
         KMFXxdrOX6V9NdRx2cOpj8dXqYZXDWgbNzvAuhMnThQM+IePjK8P6vCMP/esolr0VzZV
         pSwTfR/LBHxc9fLHOw+m+BNcSQ65Fs19Jke+Hf+JaYgd4heB5T+A9KoYzBRqD4fkXqN2
         qfow==
X-Forwarded-Encrypted: i=1; AJvYcCU7Bf74GL6km4wKwCoo7PizUrcjeszTVma6+xz+rqO6k20oVN7hI8LyR7VjzFoM4VJxuFBDPsPL+jxR@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3cSMLr6qevLqyGvNIRHBaabuu7q4HCq1DK73LjrBZcLvQw0tA
	7gUSrZd5QH9KE5RNNgvyx4nEAieIPYtJAK+Fcf2FTko5LtxZ+rv2gPbbKEFR5SM4RuwW3e3zjhO
	q3viA1bSlqBwEVEFGU6xe7Av9bFDRpeQboL5qk5DfqQ==
X-Gm-Gg: ASbGncvZAT0zVqrc69UUGsTMxq+gUAkMQ1+mA4XFszLcF2wPmuWn7OVRZRdYma+oIHA
	58k/VFq0CqsVGjn6DeJqL14p/vPFQ9EdiPkuWVVWv/bqrDJiVTnEajMWlE8Cnli+W9wkxNCgTTD
	VXzXAOmYPRAJF27FZt18qC4NXvvEtjTsMRaP8KfgCqmZI7WN5iIqcg5KcrGAdV1/NqUHSUEHvgW
	uhgn4CPZpAZdiyEahdB8tlHLMDfREE62dacsFtkFgXqMAfJtUFIKH2XjJTQpGw9DOpV0eA=
X-Google-Smtp-Source: AGHT+IEgaegsgmXSR9c8Hx3M4QpdDNUJIc1KFnkqGODlEyosq51AmUd5jf6mWflPCoaxnA933h/YZYR/OFhWE8sa4io=
X-Received: by 2002:a05:6512:33d0:b0:592:f48e:c725 with SMTP id
 2adb3069b0e04-595841f9725mr5921930e87.34.1763506700860; Tue, 18 Nov 2025
 14:58:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org>
 <20251022-gpio-shared-v2-6-d34aa1fbdf06@linaro.org> <CACRpkdbqLyeaZx37yrKjDFWb=C5c=vK6aPgnW8cMQvwi_6Jiug@mail.gmail.com>
 <CAMRc=McySdUtj4foEf5a2db8jUEa=CnPmVVms2nwHoO2UYChSg@mail.gmail.com>
In-Reply-To: <CAMRc=McySdUtj4foEf5a2db8jUEa=CnPmVVms2nwHoO2UYChSg@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 18 Nov 2025 23:58:08 +0100
X-Gm-Features: AWmQ_bkpyyk7f39_4wc6746I8bnl6C3ILvHa9yZ2lrW5div8cVmrRRgtpGXas6k
Message-ID: <CACRpkdYjL3u2UyD8A9uLWf1wU6jQXvAOhU5+Y6+8QXeTAe1ksg@mail.gmail.com>
Subject: Re: [PATCH v2 06/10] gpio: provide gpiod_is_shared()
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 12, 2025 at 9:06=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> On Tue, Nov 11, 2025 at 11:44=E2=80=AFAM Linus Walleij <linus.walleij@lin=
aro.org> wrote:
> >
> > On Wed, Oct 22, 2025 at 3:11=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev=
.pl> wrote:
> >
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > Provide an interface allowing consumers to check if a GPIO descriptor
> > > represents a GPIO that can potentially be shared by multiple consumer=
s
> > > at the same time. This is exposed to allow subsystems that already
> > > work around the limitations of the current non-exclusive GPIO handlin=
g
> > > in some ways, to gradually convert to relying on the new shared GPIO
> > > feature of GPIOLIB.
> > >
> > > Extend the gpiolib-shared module to mark the GPIO shared proxy
> > > descriptors with a flag checked by the new interface.
> > >
> > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> >
>
> I think you wanted to leave this under v3?

Yeah probably, a bit messy in my inbox!

Yours,
Linus Walleij

