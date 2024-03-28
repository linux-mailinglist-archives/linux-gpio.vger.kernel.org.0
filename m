Return-Path: <linux-gpio+bounces-4512-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E65885C35
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Mar 2024 16:41:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 491FC1C22DA3
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Mar 2024 15:41:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05895126F10;
	Thu, 21 Mar 2024 15:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ZnwMhzUR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EABA20304
	for <linux-gpio@vger.kernel.org>; Thu, 21 Mar 2024 15:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711035487; cv=none; b=VZn5vW3ghwXeSRn5/22De8zLmAJGazDRjdNMux/nJ49CR/KdjDztRNArzyUgaF06nr5mjK2Kj0e+5R/arI9TUdI12kzP3lMkwAsrNN6tOb5/zAlafHhK2r6SbUDYRGAqFiZwc+/9mznWKEdC6u4/4cKjgERWj5Tz+Dk5nWuHC20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711035487; c=relaxed/simple;
	bh=8thm5SjkAWvV7KbxS16lzfnalp89YyrFksTLWQiMALM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u3hZtGBMXIPZwcSV1tUg6XL5v7Yage+DnUC76A3Zrnu5pgu9vT+tCyDsrDhLcALLfzjfxLSMGaP4z+g24kQiamkW+p97Iv5Bbv94QofJk6cbi7FrXiENC1gQAR8A0eXQsxElR6rzx5UmRRofeAzJv+LBMFzjDUrv/0IB9kYKepU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ZnwMhzUR; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2d28051376eso23164311fa.0
        for <linux-gpio@vger.kernel.org>; Thu, 21 Mar 2024 08:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1711035484; x=1711640284; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BXwB0/1efUp2u0X/Za5IDEJwa5crOpwovhlePEGGwYY=;
        b=ZnwMhzURpxdgCYaKdqHrKneQOiiT3PfPygpl5pvm96sXTG2HduTndWIfTw7NgGciWZ
         MOUrszl/axr4iuedU1P6LVwYdTheA1CXpsjleOuFzMPZYnW3MO505TJLMZui5gC8a15a
         Sefx9GpfM4seyZO7yuyXKOuU5mPpqtGETE2+Ge8Pdg6itPAsGAs9GUUcu4ExQmNStgvl
         FOT5RhCF6UvEBDKXK8rP75A5CfUSJXft0R20NJkHsTP8iqpyrRVco/mg2sCpdk2tKeEy
         gJJVJxHfcloW3+Pobg0NIKOnA3CfRfADWTDmKN9Iw8fetECxI5eHS5I7LWRyMKEF904W
         oqQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711035484; x=1711640284;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BXwB0/1efUp2u0X/Za5IDEJwa5crOpwovhlePEGGwYY=;
        b=g6nMWc3pLrHjDJubTANUaB/vXWL+tSH3qMkuAro0vVPiTbHLxj8hC52FM9W8zNzH3C
         Mx1u0aMnXW/Q5mo/+k7BoVNS60l77kk/8MT3+HznYU+oZAYuEtAA6MCd+OrVwRoLTuTT
         IvavIy+RwTewYY4P1rYQ+hAQZLWO5lgc3WyPbicRpRWTe3ugI2LFTp4fXlTKOobFARuR
         g2TxDdmAX+HmHOKvTA7nfZh0ICJGzvoA9Nec5UBmo8BDdC5at37xczOOcIXq9wd15as8
         Hw3rExRBr4rtVIb6wMIDiOiH7gCVnf8TS3uuNwkaqN/O4xirMFdXwjp2mYQjJbCXEUFv
         2NKg==
X-Forwarded-Encrypted: i=1; AJvYcCUTGBeoQc+uPrbKOWzNY3q0v8+DQolt56ow2ohlupApdVl6wtCHBxMINx2f+8Fl0HWU1OVZ2G+z1ZB6CZ1V6chR+Y+Rky6EKVSF+A==
X-Gm-Message-State: AOJu0YygbPQ/Gt8IGzLbvlRFXRLafLX4xYBlKDJfRl9TgYtUI2qU6G/y
	Vn8NiOhLpCmc4GyRNivlM/5DGn+0Q0UePv0kjZ99JWae6WZRCQQKboyHUXaHM2+m7wc/QVVMHm/
	uzMr19yLPCXvir+wVVFZl9swBWo6/GxD3JB0vlYVepPm6l0at
X-Google-Smtp-Source: AGHT+IHZ1uQJtuvIF7lcojmcQ84U5q3lTCGn2mFY454HURxGZGur5YRAQi9e/q20H46SLSiNjbkzV534YZmnJcgTaDU=
X-Received: by 2002:a2e:b001:0:b0:2d3:5ddc:b949 with SMTP id
 y1-20020a2eb001000000b002d35ddcb949mr2108970ljk.2.1711035484114; Thu, 21 Mar
 2024 08:38:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240320073344.1563102-1-peng.fan@oss.nxp.com>
 <CAHp75Vf1K8c+7O5Cga3t+WiiSkk-yk_gATGJrMZ8rnPPtWLkWQ@mail.gmail.com>
 <DU0PR04MB9417FEFA3DB02082D02A963F88332@DU0PR04MB9417.eurprd04.prod.outlook.com>
 <ZfrGvwV92a9Zzrg_@smile.fi.intel.com> <DU0PR04MB94171BA7C2E35D6691B47BBC88322@DU0PR04MB9417.eurprd04.prod.outlook.com>
In-Reply-To: <DU0PR04MB94171BA7C2E35D6691B47BBC88322@DU0PR04MB9417.eurprd04.prod.outlook.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 21 Mar 2024 16:37:53 +0100
Message-ID: <CAMRc=Mcm-AkYmhfA4KfDDaNJaOx51+0yVQuXSJt2Ac1rb4FQ4w@mail.gmail.com>
Subject: Re: [PATCH V2] gpiolib: use dev_err() when gpiod_configure_flags failed
To: Peng Fan <peng.fan@nxp.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, 
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 21, 2024 at 6:40=E2=80=AFAM Peng Fan <peng.fan@nxp.com> wrote:
> > > >
> > > > I'm not convinced, so not my call to approve / reject, but see a re=
mark
> > below.
> > >
> > > You mean dev_err not help or else?
> >
> > Moving it to error level.
> > Usually developers enable CONFIG_DEBUG_GPIO for these messages to
> > appear.
>
> But this is a error log. Let's leave this to gpio maintainers.
>

I'm fine with this change.

> >
> > ...
> >
> > > > >         ret =3D gpiod_configure_flags(desc, con_id, lookupflags, =
flags);
> > > > >         if (ret < 0) {
> > > > > -               dev_dbg(consumer, "setup of GPIO %s failed\n", co=
n_id);
> > > > > +               dev_err(consumer, "setup of GPIO %s failed: %d\n"=
,
> > > > > + con_id, ret);
> > > > >                 gpiod_put(desc);
> > > > >                 return ERR_PTR(ret);
> > > >
> > > > While at it, can you move it to be after the gpiod_put()?
> > >
> > > Does it matter?
> >
> > Yes, the system gives resource back as soon as possible.
>
> Got it.
>

Please change this and resend it.

Bart

