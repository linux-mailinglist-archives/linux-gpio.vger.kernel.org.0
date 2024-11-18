Return-Path: <linux-gpio+bounces-13078-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 431249D0F1A
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Nov 2024 12:02:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 65A99B2907E
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Nov 2024 11:00:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBCE3194A63;
	Mon, 18 Nov 2024 11:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="20YtopcG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65A938B
	for <linux-gpio@vger.kernel.org>; Mon, 18 Nov 2024 11:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731927615; cv=none; b=fIhVdi5WA9CQHTAJF1/QKqF21VTbT7jFp8SASBppfWMJmn4fQllw27JfkrhoR4WNNTVMzS2HJ/XZly2bNh7RBH3hD0tVD++dbmxp4zCqKZwO/tk9XHVk1XqImirUGFvt2AgAynCO1Pbyv4SudhquAhBE8biT/FaRk28Qk+nHHKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731927615; c=relaxed/simple;
	bh=+xnek6Wh0IPQp2lxAxisV9ZqQmC5DXcU0tVBwhOmqbk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Te0lXbRBLn+np1YQtroX5e+MWbw+yy4EoOnuHO3sDayNVe2dX+sDihHtdvupTTQcW87CpTAZEZD7oISBgqhdUZuqOru/jjs1uHJQasKSFwvvY7o3DpHGZOw+TegFqPlHlYLL0c0ZxYYp/rNcyOmio9MpJ0IX1DSPj67T/YJddDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=20YtopcG; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-539f2b95775so1678944e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 18 Nov 2024 03:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1731927612; x=1732532412; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OKJAAp8SoaxPkgWLz00EhCBjpjxNk0qC3KM0z2OVqfY=;
        b=20YtopcGOLHHPQWSkTAycbGTesNE1237DrzOEnAp9S2+CFGBbtlL7lI1zQ/hihJ6e3
         apdvFXchI7QXtADam4D/p4iRXrs/L8vwyazoz281A2HRvKZnhCz58CEKweT/NRZdbNHK
         IBUR7zyeVwMY7ncNwMmdwfzl6WaYQFHvJD2OwGr42TZTs4EAP5vX8Ame2rhnHswYFltv
         lEr3jKmlIJfDJO7jhwQqogxeoPYIyNKD6ea2nlCSyp+4sZd2aBN0yHTyCoXkLIVXnm6Q
         A1lKVbOrSVqHv/0ktwT49GMYYJHzoTOgKm0S3LObHC5ZkLfnrwwjz4a7EEpB8PdKGzOM
         /G7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731927612; x=1732532412;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OKJAAp8SoaxPkgWLz00EhCBjpjxNk0qC3KM0z2OVqfY=;
        b=thvuaBfiyWaSdc7Wlcs3m4j8xAJ1dTFdXvj0251r/ttu3885nAMQEK/BsKvDj96EVS
         MehaEiGMMIqrWPxsEe6/i3NfMz7+GqOp9EK6jiLGrfNPj9cpp5OC3e4gnlmrVebCTJYY
         u8UqFGY2D6UQ/qc7xHC2Gt1P91rkA2OUaY/FnJNHq7tMCCDEUoRJcnjQJhEfcItxw4EE
         m0rePmRRUvmgJoXPp5af86ajimg0iJ6EInPITTUEa+GlGcB7+3dRI97eqLyalcRR2f5e
         tc8c2hqZ2AgiiKDggUhuC1T+rHwgPePAo9V6cDtPaanHHfn8Xw/XQt+GDW1keCD2BEqm
         VoQA==
X-Forwarded-Encrypted: i=1; AJvYcCUufeoFJr0GNEnnHpCE+T/GTbrvFcQkN/b7SIh1XuGVOW5ef1j3zIiIqJWDiH+cv3VgFyj9dq4bdIS1@vger.kernel.org
X-Gm-Message-State: AOJu0YzPhF3+qPfdYsHLtFVj5ehoeIkg3qW0jtf66HYWH9UCr+eJ7QRm
	vyDEss5/q9Nm5x+iixKwTxYFQkE3MpAsjgKCgf/ivRYJKUu6q/Mx1Ga4KleNFrIaydY/d/MgWY3
	q1leB2REHmCE4b17zTzLsmSRWtTwUkIhfjD+hCw==
X-Google-Smtp-Source: AGHT+IERHUB92QGdKcUJGTcL3aVcrxHgtUlcoHFmwwDkZ+am4Lp5JmzuTgwRTDMkHhd4Bmv/CYTq7vCPVthcVsCxwOI=
X-Received: by 2002:a05:6512:282b:b0:53d:a0a7:1a8d with SMTP id
 2adb3069b0e04-53dab3b16b6mr6936141e87.46.1731927611787; Mon, 18 Nov 2024
 03:00:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ZykY251SaLeksh9T@smile.fi.intel.com> <20241105071523.2372032-1-skmr537@gmail.com>
 <ZyouKu8_vfFs20CB@smile.fi.intel.com> <ZzN0nn6WFw2J8HTF@smile.fi.intel.com>
In-Reply-To: <ZzN0nn6WFw2J8HTF@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 18 Nov 2024 12:00:00 +0100
Message-ID: <CAMRc=Md=tv6QapMCoiLf6eeK9qOtG1jvENHnKdTk2i6U+=8p5A@mail.gmail.com>
Subject: Re: [PATCH v3] gpio: exar: set value when external pull-up or
 pull-down is present
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Sai Kumar Cholleti <skmr537@gmail.com>, bgolaszewski@baylibre.com, 
	linux-gpio@vger.kernel.org, mmcclain@noprivs.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 12, 2024 at 5:09=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Nov 05, 2024 at 04:39:38PM +0200, Andy Shevchenko wrote:
> > On Tue, Nov 05, 2024 at 12:45:23PM +0530, Sai Kumar Cholleti wrote:
> > > Setting GPIO direction =3D high, sometimes results in GPIO value =3D =
0.
> > >
> > > If a GPIO is pulled high, the following construction results in the
> > > value being 0 when the desired value is 1:
> > >
> > > $ echo "high" > /sys/class/gpio/gpio336/direction
> > > $ cat /sys/class/gpio/gpio336/value
> > > 0
> > >
> > > Before the GPIO direction is changed from an input to an output,
> > > exar_set_value() is called with value =3D 1, but since the GPIO is an
> > > input when exar_set_value() is called, _regmap_update_bits() reads a =
1
> > > due to an external pull-up.  regmap_set_bits() sets force_write =3D
> > > false, so the value (1) is not written.  When the direction is then
> > > changed, the GPIO becomes an output with the value of 0 (the hardware
> > > default).
> > >
> > > regmap_write_bits() sets force_write =3D true, so the value is always
> > > written by exar_set_value() and an external pull-up doesn't affect th=
e
> > > outcome of setting direction =3D high.
> > >
> > >
> > > The same can happen when a GPIO is pulled low, but the scenario is a
> > > little more complicated.
> > >
> > > $ echo high > /sys/class/gpio/gpio351/direction
> > > $ cat /sys/class/gpio/gpio351/value
> > > 1
> > >
> > > $ echo in > /sys/class/gpio/gpio351/direction
> > > $ cat /sys/class/gpio/gpio351/value
> > > 0
> > >
> > > $ echo low > /sys/class/gpio/gpio351/direction
> > > $ cat /sys/class/gpio/gpio351/value
> > > 1
> >
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> Does this need to be applied, Bart?
> Seems it is missed in your branches...
>

Maybe if the author used get_maintainers.pl as they should, I would
have noticed this earlier?

I have some other fixes to pick up so I'll send this later in the merge win=
dow.

Bart

