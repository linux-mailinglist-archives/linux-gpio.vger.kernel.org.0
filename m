Return-Path: <linux-gpio+bounces-27829-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 773CFC1AAF6
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 14:29:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 174AF18853F7
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 13:24:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28CCF24DCEC;
	Wed, 29 Oct 2025 13:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="QRdQSWtx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65BD0275112
	for <linux-gpio@vger.kernel.org>; Wed, 29 Oct 2025 13:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761743970; cv=none; b=EI6tc0fKNm/Cbox1r6Fn1EedFnJE8sys0zG4Dj1V4eWFOmePLNZM1RHuO/iUBkEx80n2j4doyPBQpQC9o/3MRrhZ3VORCiKyXWdlfgf5HflPjgH1rtW/B8QB+GyavVOsgPhvGfJH4absaRSx4+BfB+TXS7QAIhLMLBisrSGjv/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761743970; c=relaxed/simple;
	bh=5qpTR2oYTbgD5TBux+eB/2ftXVOVUsAhm9/BBxaVk10=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KUpK8Lq9SDynUTq6FJgkIf7KqmWy4TVCvXyYmNy2qRDt/U8DV+aPU3GmYTBWLZLDIRUcwslowNnAoxFGmYvIrdPMwNxX7UCUkV1CJ4D7TzGYRs29pLxnIPDK2QXVmi4LlVgkEfyeOFfiOIlGDYLTXPMBPSoGySkfYZXJCuQqL+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=QRdQSWtx; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-592f600acb3so4038867e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 29 Oct 2025 06:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761743967; x=1762348767; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5qpTR2oYTbgD5TBux+eB/2ftXVOVUsAhm9/BBxaVk10=;
        b=QRdQSWtxQDFOefbPwxyGfp5NXzRgztAWp3Q4UlqZC0YSVBWoIS3MCsbN7gk6CTsWYX
         nzLPeTtKcIyiXLmNWypl1/ivBzp033JhDLiSvYfnvWAu1RqIBRAU0B++VfxGzZI/u4pG
         /KN+QbKRNBbKSSmh//o8qR/zC7Wtl7rN9ui/8pXOKuTXyFNo6+wiO7Qt+JS1LYpf8p8s
         ytyVxYL24oiD9BCW0LTkQRG8qI9O+9TfNESZhZp+X1YGPCkYoLkABqt2GTHRl+hQT0ke
         doQQio4sxxH4uWE1eBuQK76P6f8fKV26/3SHXY4m2QjSA7s8/fKuUlAi61YFvOOIXfqO
         Ip4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761743967; x=1762348767;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5qpTR2oYTbgD5TBux+eB/2ftXVOVUsAhm9/BBxaVk10=;
        b=Cyuu9OGJE7wg/mLCLlQ9cwwFph2SyUxbkH5wXvHiht0w7Oef85Cn4Om9tB78TWfAI9
         I9s2hwk2DH9EU/cgS0uMpn+ifvK85HW5tQ4birkbqfeQZzkfTwFb0AB+YLFwJ3jWBUry
         6mmmZHqznHRaxthrTYiXpgMI3i5FHCZsB0ezXWqxRuVSro9CKUfQHc6GSfxb/59rlSh5
         U3E0+iM4Pz611dDcLk0v/QPypW9C+7RtBRxJPnRJjQUkhxFRvbsObBUS0X1wvaL1y0yW
         bDGY+JjIm0zdmFKSwaMqnP6w1bQHzdDgOwM6SQhDKlKw252Zc5r1t+pCKduCDdoS7ibi
         WgMA==
X-Forwarded-Encrypted: i=1; AJvYcCWXOHTqff9oMseYtSnr4lOB5kt6YvlDn8snCiV8wS60lzWudZnPavNmiss06za37qyilZ/ZYqgPT58p@vger.kernel.org
X-Gm-Message-State: AOJu0YySkCDg+7pFHhE7fEKnQhk524ijsncFU324qX6VpQSRuH1Le2Ws
	ALQXmxKjakcIJkPuRDPjrBHonfChIpkFxB9T4YcMk+SuHsZboeDZAnkV5v2/+yxIB8/BiYCwytp
	JadMQ5WFC7KDoCjhQjUdJOyOgsTu4NlbLzuGiZuSM5w==
X-Gm-Gg: ASbGncv0EV2fkIFcFig361bMg4BRhiwVGBzZXnNIX57RutcpX0TN4oG81oXtxZagai7
	oAm9dkoVrD1e2sgsM0pb7KwxLmTjzYBhfsie74TL4bIdGdyk7qpz6NGPdrQS/g6lHnm9WoAqbhz
	KX+8lgcsLbh8/747+3aJTuyWwdjKPATr9NNCdCvwKmr5r02AiwC9o3IrJRLY22zpkC4OKcPNwYe
	y8AY/qBsB2eLjgeHBIQYLnF8Pm1+UdJmIPGlC0oNIswKi/CzrsTMAzMVBkkXRmlw40Jh2N6hOKu
	dcKs49qA3Mt3fFWI
X-Google-Smtp-Source: AGHT+IE3KmYDFGeVP8vm6lY3xdcGUVy3w95tHVkpZ6gECTYHrhRU9cn+mn6vdK2o/wGFbA/KoklGqT3oyauzcDjh3so=
X-Received: by 2002:a05:6512:3d15:b0:592:f54d:8647 with SMTP id
 2adb3069b0e04-59412c42487mr1007961e87.30.1761743967499; Wed, 29 Oct 2025
 06:19:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251029-reset-gpios-swnodes-v3-0-638a4cb33201@linaro.org> <0b8ec641c76b39f6a96863c16e5f758451641849.camel@pengutronix.de>
In-Reply-To: <0b8ec641c76b39f6a96863c16e5f758451641849.camel@pengutronix.de>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 29 Oct 2025 14:19:15 +0100
X-Gm-Features: AWmQ_bkjxtg2FXNoc-CZ-J0YudbBfWqhJfw98u15uzEr2iaJoxlwIVFcuMlgKKI
Message-ID: <CAMRc=Mc7GTwXUw2PWMtSMRPf45feizfZkAWhO3NBm7OCh0Pj2g@mail.gmail.com>
Subject: Re: [PATCH v3 00/10] reset: rework reset-gpios handling
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 29, 2025 at 2:16=E2=80=AFPM Philipp Zabel <p.zabel@pengutronix.=
de> wrote:
>
> On Mi, 2025-10-29 at 13:28 +0100, Bartosz Golaszewski wrote:
> > Machine GPIO lookup is a nice, if a bit clunky, mechanism when we have
> > absolutely no idea what the GPIO provider is or when it will be created=
.
> > However in the case of reset-gpios, we not only know if the chip is
> > there - we also already hold a reference to its firmware node.
> >
> > In this case using fwnode lookup makes more sense. However, since the
> > reset provider is created dynamically, it doesn't have a corresponding
> > firmware node (in this case: an OF-node). That leaves us with software
> > nodes which currently cannot reference other implementations of the
> > fwnode API, only other struct software_node objects. This is a needless
> > limitation as it's imaginable that a dynamic auxiliary device (with a
> > software node attached) would want to reference a real device with an O=
F
> > node.
> >
> > This series does three things: extends the software node implementation=
,
> > allowing its properties to reference not only static software nodes but
> > also existing firmware nodes, updates the GPIO property interface to us=
e
> > the reworked swnode macros and finally makes the reset-gpio code the
> > first user by converting the GPIO lookup from machine to swnode.
> >
> > Another user of the software node changes in the future could become th=
e
> > shared GPIO modules that's in the works in parallel[1].
> >
> > Merging strategy: the series is logically split into three parts: drive=
r
> > core, GPIO and reset respectively. However there are build-time
> > dependencies between all three parts so I suggest the reset tree as the
> > right one to take it upstream with an immutable branch provided to
> > driver core and GPIO.
>
> Should that branch include the reset changes, or only up to patch 6?
>

I was thinking about it containing the entire series, somewhat similar
to what Lee Jones does with MFD changes.

Bartosz

