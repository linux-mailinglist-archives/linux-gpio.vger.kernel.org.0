Return-Path: <linux-gpio+bounces-17089-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B8EF9A4F80E
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 08:40:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 02C27188A7A9
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 07:41:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB3EC1F419E;
	Wed,  5 Mar 2025 07:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BLnx6i7j"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102EB1F03D2
	for <linux-gpio@vger.kernel.org>; Wed,  5 Mar 2025 07:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741160442; cv=none; b=ebm01eyhTSP+f5My8be+ghEFKXdKVY+R6q4Fogriesf6e9dQfRXOhV28BCedmuz0R770Z1lew76AscZmGWz5jc/gGgJZ/JDGtWITEyrwYUjuF7vvH4gKMxdnjiJOkjU73E3s+9VprBIAkOxaARjyly3/wT9IRS2vQMwsKfp90yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741160442; c=relaxed/simple;
	bh=VDTDjXL2VmXwu5SJw3B4Qg8I7zdkWtnn7A7EnShICWQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a0RUuo58YYygtE8uXCpYDLct/+VdCNLoSXgT/BOa6hBRtHcfH+LaP+CClKzVegngkm9D9CEJXu9u35Wq3C0hvRlkr5UlIWqV4UVHZ88M5ewRGP62oUkue2QKR0NPAUH42ChXoB+RuLBoNQIaYYdtuAqW6rvVnKAe4xRt9GZ/bo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BLnx6i7j; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30761be8fcfso70414701fa.0
        for <linux-gpio@vger.kernel.org>; Tue, 04 Mar 2025 23:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741160438; x=1741765238; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VDTDjXL2VmXwu5SJw3B4Qg8I7zdkWtnn7A7EnShICWQ=;
        b=BLnx6i7jGlmHnQuSbg0Mesv+Qbc8vu8kKur26c+UmhcRUaUE+QUMmkgjqK8DcpidNS
         HkqZFwSXw+C55RUszX46OC9J441awi6L/Q1nYtsOZyIrWrgeKirkAID34j0CNvGLfgKf
         HNDXzKSiSWM1NtbfliWcUqWpEHkobfPIOoO6f5AJ1UCv3VefQ2A/3I5wo74Dmvgz8z6c
         nMMHIAbiwX+7w0DZi/WitzGmg7Z6XRr1640lUjZFI3UkQFxRQQ8Gnf1RRF65YBb+eObP
         Ui5UZeL7982Ub01JPiX0MyohOuKLYIayN9gixaH8LQhYaWif//IkH4lfEf1SDby9Luy2
         B2NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741160438; x=1741765238;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VDTDjXL2VmXwu5SJw3B4Qg8I7zdkWtnn7A7EnShICWQ=;
        b=cqmZm2AnOscShTAYPK5LpYTvA6lROCBoSQdHnr647y8Jvll/GTS8C/Rj+2dViUokHl
         MU6N7AqOAwm+GNFR/gkjbhSBcYnBehblOwb0h+/I/3jTSvVHp2VwUund3lRibG/G+Y8a
         bJ9oLEX/ocfTQ1TBMtuyk1gWs7kK4EBRbEkt0gScZUDl19zwDxzUy7zs3UaDPno5NIDm
         pvwrzTrWvbYTAAWYx2IVMZp61Hk7HHQ/M/MAiPMgD79BIuizl4m5fOWZTP/slYDDfm/e
         7H8JF0r4tg265HP+SkiAkEPPvvhzpPd5o0xz6QgaR4J2m+XTTbMGZpkQ8MDHRhcphMd9
         1isA==
X-Forwarded-Encrypted: i=1; AJvYcCX9Ayj6tIEKKpr9xO/zNG20TGpRPdMUZH+iuqdwUZiluq2tMbvAAkX3T2kUQXJ1BtcSLriCDSaN3EMW@vger.kernel.org
X-Gm-Message-State: AOJu0YyikOQExr6Ymo4tE5IZd+mwsBl0A6hOCrogFI02jgpqbKdLmYm4
	zIrIE0bk6T2Kywm+TeLLHuyGYKY3MZ5dlktXFPfhd/pHyfbBemdpbTb0TEu1jr5sxGNXv6y4fgX
	PUhaPvDs/Gx+v5SF2yAj2jwg69AOjQ6kQG7Xthw==
X-Gm-Gg: ASbGncsIXAGR91YAJrEmnHdcQVCCPUKOgczzOjJOMFsbXtxwgFFAJpBeRSWyJFTMMua
	jIo/AqlBfRp4cJiEwTp3I0ScdBfsJPBXGgIH/gp3Hh5RJCQh8ksVdwK6LZmvNPzbLLmbzFnmY6l
	nAVfM2rqQsAMXrZy00F+D6iqp0ew==
X-Google-Smtp-Source: AGHT+IGcwWgEry+6tzHBD+mNnxIVE6sKBlzFgi1RRA6m0uvCysoF6DsDJJB/fX8qwDEYMA9UPY6ZXQV3WzLO+Ixih90=
X-Received: by 2002:a05:651c:556:b0:30b:d44d:e76a with SMTP id
 38308e7fff4ca-30bd7acab1bmr7711201fa.25.1741160438099; Tue, 04 Mar 2025
 23:40:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250303164928.1466246-1-andriy.shevchenko@linux.intel.com>
 <20250303164928.1466246-4-andriy.shevchenko@linux.intel.com>
 <CACRpkdbCfhqRGOGrCgP-e3AnK_tmHX+eUpZKjitbfemzAXCcWg@mail.gmail.com>
 <Z8YThNku95-oPPNB@surfacebook.localdomain> <CACRpkdbqYoY1vYGii1SyPL1mkULGXYX7vFwu+U9u2w9--EYAsQ@mail.gmail.com>
 <Z8bgYFUds3UU96Mo@smile.fi.intel.com>
In-Reply-To: <Z8bgYFUds3UU96Mo@smile.fi.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 5 Mar 2025 08:40:27 +0100
X-Gm-Features: AQ5f1JqBv5lkq_yKaz9gG-53y85X9EsVUbvHy0t75prGe4GI8Z-EcKjHUiR6o4k
Message-ID: <CACRpkdYCxPjF2E-jd1OkdYawYJLnFfHUDSL737sr_Zkjz9gVkQ@mail.gmail.com>
Subject: Re: [PATCH net-next v2 3/3] ieee802154: ca8210: Switch to using gpiod API
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: linux-wpan@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Alexander Aring <alex.aring@gmail.com>, Stefan Schmidt <stefan@datenfreihafen.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 4, 2025 at 12:13=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Tue, Mar 04, 2025 at 01:03:41AM +0100, Linus Walleij wrote:
> > On Mon, Mar 3, 2025 at 9:39=E2=80=AFPM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> >
> > > > Maybe add a comment in the code that this is wrong and the
> > > > driver and DTS files should be fixed.
> > >
> > > Or maybe fix in the driver and schema and add a quirk to gpiolib-of.c=
?
> >
> > Even better!
>
> I am about to send a v3, I'm going to leave your tag despite a few change=
s as
> discussed. I hope this is okay with you.

Of course!

Linus Walleij

