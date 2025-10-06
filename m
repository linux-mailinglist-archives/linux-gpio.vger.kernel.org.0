Return-Path: <linux-gpio+bounces-26841-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F49BBE992
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Oct 2025 18:11:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08E663A5BC0
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Oct 2025 16:11:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF4782D9ED0;
	Mon,  6 Oct 2025 16:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="VLrtECs6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFCB21CFF6
	for <linux-gpio@vger.kernel.org>; Mon,  6 Oct 2025 16:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759767075; cv=none; b=Zc8KBJgnHAYyxPntZBYiDbn9aM5CUHtHPoj4b+wcCfSsUBTBxjtla9MP0JcFXYNo7eETELwjv7cBC9JLM0702XSBVAFOqYb5zPVFrVP2aBzFB5/KVqId0CZBj/DALxSMO/md7a8Y9F1V4Gj8nBKMXGRBQ4FYw7Y2cSRqQSZNafo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759767075; c=relaxed/simple;
	bh=bAAmP6Vor3+frUWo9VM5DAgXz95oSL+3FrW7uk1ufUM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C54AKwPhD4a1opc1OCAzYyRf1kud1heaTQNmL2ECc2t6qtN6Z5WNRiVoaSn/eehbcJ48VAbC4bA/sbWiv5wS1AgeODVlZsRVnq+Ir7I5TfUujB5dRVpJukEikdCdbHKzSss0aEA+y08W0a3S89/E+ZxXuoq3pyFkGDBWKUiOovY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=VLrtECs6; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-36ba647ac9fso41515801fa.0
        for <linux-gpio@vger.kernel.org>; Mon, 06 Oct 2025 09:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1759767071; x=1760371871; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bAAmP6Vor3+frUWo9VM5DAgXz95oSL+3FrW7uk1ufUM=;
        b=VLrtECs6+aeEeZz+5cjvV6B/jGEJBVfEd/gTDAJD2K2FcF7e15k3LADejBcX6p7l0Y
         KrHQ10WvOU1U3EUD5RcMEz1+TNFrUT96t6wuLEOm0yM9HD5ZeC+Qbnq/dP94FHbyrUGt
         gfhhf9RCiTUsVzFIExZhtsKkDZl9osqBoiCb85qDZL2GVxeRfdDl7Q9rp9pjQAUsufYy
         g0exd8nmbboKMV/CVUjzM8ohVf4ACv63d0TDNGV7PweeyWSwQtX3Bf4ec3v81SXKkEe7
         OYNkWKFno8CxXi1kQuCtjz0uTO6mmN03TBYF2aBQjubIfGOmDZaZqLhIoW72Wc5q/mmL
         0/GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759767071; x=1760371871;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bAAmP6Vor3+frUWo9VM5DAgXz95oSL+3FrW7uk1ufUM=;
        b=RnBNma2fzDZj2323XzNU4PgyWEdHGBVlwKetv5UNfScQP9jz1k7GFfNmKLTxDJL0tm
         biTxBpcNLRvOsBr793WvE8DWOtmEshZT2HjdzExbGn9geHP0z4s7EFTtZPJ0wzTgSVEM
         ll5SnXlOCDDIwAR+y3matZzGnd99kvYz2Jby9FD2yr4gpFSPZtgR5cl9n2haog9hlvEm
         PtPL1Ip1KiGTqqX2FIjP+WOwncP1r2hbXuMKLKSt3VRwSlIcJ2nJ0ol4kJkqLYgXbP/9
         9dTLjEhlmNvdjUYWH4i/rSEH04xSV01VHQNHcXRFsWBuOlZVSfSbo4AelLeHR2OT9ajQ
         XNSw==
X-Forwarded-Encrypted: i=1; AJvYcCUM0WVQ54vHfXDtWoJEsVkm2eNWUEcUJLgHQ25QobB8gV8DW3/Jva9JJfhjZ336kB7/IZLSEy7hSl/B@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm4vZ1eFbcIJIhnUQOm7ppWqhNmMjXPbsIYwq3WZLVZ3vJiEVZ
	w1PSsedcyRv2lOt0t6uK2EXzmkQim0nq0ID6SNW+jlrm0QIKmspekghNXwRULyHTCVpho7KOf4a
	QNlEfuxVFqG6d1d4xECy82FZ6JK07MCwOBN+POrB2nw==
X-Gm-Gg: ASbGncu5a9IN3uR65uScY7Qp6Rrmn5mfNV5rlgawkyi3u6F+fRbtUZ5G2e05VDAuCwv
	AIrHSxf/qRPiXPwo4lM+5wjLqRv5qsYbhpp31ohG8ATNtLOqjHt8utFmTlJra6zJWJIArwIIWCC
	LsVsSm1DSajA4w+HVk9Gnu+hzCXDQPnwmJJ0Ld4YRaJQ7mnDxq2VGn8Id/62zD1Nd65JMjf763w
	q4K76E/j1UYSyCdrSp7JaYLWiKShNk7gvmBNIcfqRDuiJH2SwJ7xqbAqcewwXk=
X-Google-Smtp-Source: AGHT+IHQni+hoN/f23d0O8IX74fUFomrJ9gkJXQ0jq6YVPXYNOJtNrLGQEvHZJ8/WlypXR2ARa7kU4bjK03qJXmCeP8=
X-Received: by 2002:a2e:bcc6:0:b0:36e:35c8:3dc4 with SMTP id
 38308e7fff4ca-374c37fc6f8mr39619951fa.21.1759767070653; Mon, 06 Oct 2025
 09:11:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
 <hyzzrjn7jzo3tt3oyg7azijouawe3zopfjzq6zfhoo6e6z2m4t@ssl5vl4g557e> <zk4ea5cibrkp4vttuy4evrqybf76b3nop5lnyck4ws4nyf2yc4@ghj2eyswsoow>
In-Reply-To: <zk4ea5cibrkp4vttuy4evrqybf76b3nop5lnyck4ws4nyf2yc4@ghj2eyswsoow>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 6 Oct 2025 18:10:59 +0200
X-Gm-Features: AS18NWDSntYY-tS0LWjCm4WwdgxQdqQ5RgzeqJofTletfEADJXVbDbVNAU36cIY
Message-ID: <CAMRc=MdWmO4wvX6zpzN0-LZF1pF5Y2=sS8fBwr=CKMGWHg+shA@mail.gmail.com>
Subject: Re: [PATCH RFC 0/9] gpio: improve support for shared GPIOs
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Kees Cook <kees@kernel.org>, 
	Mika Westerberg <westeri@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
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

On Mon, Oct 6, 2025 at 5:43=E2=80=AFPM Manivannan Sadhasivam <mani@kernel.o=
rg> wrote:
>
> On Wed, Sep 24, 2025 at 11:25:12AM -0700, Dmitry Torokhov wrote:
> > Hi Bartosz,
> >
> > >
> > > The practical use-case for this are the powerdown GPIOs shared by
> > > speakers on Qualcomm db845c platform, however I have also extensively
> > > tested it using gpio-virtuser on arm64 qemu with various DT
> > > configurations.
> >
> > How is this different from the existing gpio-backed regulator/supply?
> > IMO GPIOs are naturally exclusive-use resources (in cases when you need
> > to control them, not simply read their state), and when there is a need
> > to share them there are more appropriate abstractions that are built on
> > top of GPIOs...
> >
>
> Not always... For something like shared reset line, consumers request the=
 line
> as GPIO and expect gpiolib to do resource manangement.
>

They could use the reset API and it would implicitly create a virtual
device that requests the reset GPIO and controls its enable count.
Except that some devices also do a specific reset sequence with delays
etc. That would require some additional logic in reset-gpio.

Bart

