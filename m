Return-Path: <linux-gpio+bounces-12876-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B939C5982
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Nov 2024 14:49:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 407FB1F223F0
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Nov 2024 13:49:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4EBD1F818E;
	Tue, 12 Nov 2024 13:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="AeuJyDf+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B505114D718
	for <linux-gpio@vger.kernel.org>; Tue, 12 Nov 2024 13:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731419392; cv=none; b=bKP88wOSJuwA94C870u+nq8k0T8++b16wmsX2r0+MiRK1T/lZYccGDnFgaRXcwDXOHp2pwYmYabEBZgkyfKcn0SuXjPhmVFz2mvWlik+RI+aY4znvMa6EBMQaEO80adfHdlKXFrOwuuCx2hFghw0XUftZmgN7D+/GKn7SdLrJrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731419392; c=relaxed/simple;
	bh=b/tz6t8emZ2B8dwA+ERmN9anAjhGd2BlkO2AWCSTy0A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fyN/f+ppb9zHKmtPkL4KFYQ3aNYn4slHye2FjhI3UkVU/goqVuYyvliVHpTzmMi78uLDetPFp0i5b3NLoUW0Gq86yIFOJdRY+MPYdnMG9i35+iEkdrBALgzpSOibHFRNvwvr6quRQ6AKs6OUfEOpCrs6AlXMeKiZPpYd+1bArh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=AeuJyDf+; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2fb3ce15172so62241421fa.0
        for <linux-gpio@vger.kernel.org>; Tue, 12 Nov 2024 05:49:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1731419389; x=1732024189; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b/tz6t8emZ2B8dwA+ERmN9anAjhGd2BlkO2AWCSTy0A=;
        b=AeuJyDf++L/QXek0yalOr2FDOyVtJ9sYUalEF5CvvC45QACr6o+cz1YpnI+qjZi2N3
         /hvFvD1cE25iGnEONtUJQ1IKg09LnHSI5BWF26Tc5uEAHqcL8sLdp3qMNC/RiuBHi1za
         iqyBleI0f3VaDb+NrykxNvGzpLdK9SN9Wsb1sA4DD+JxsJNCWchjtFoemX8r+fPYldIb
         zgia4W2UP2cPhstiDFLgjSg/hVCUKbMKpf15wXGA/EqgQXCuO0i+uFvo/VfmZcjxfcY3
         yp5azt+tQjHbAZKBnJqv9nL/CGdCDSERk/FNj2i71umUdJebvGVRP9UR1GcglgorwdvO
         fskw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731419389; x=1732024189;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b/tz6t8emZ2B8dwA+ERmN9anAjhGd2BlkO2AWCSTy0A=;
        b=mqakoBBaSKSTxMRwkPJ5SkH2ZM6hMhsoqs7qEE8gjueJHgmji8DiOao1S75NNOPn61
         vXRcDU7WeVwZ8n1D5IcwyJ6k1T5rfLMr9PyMnMzaLDTdP8pkeyZaH5AhVtoLkbWJwaO4
         IIWXad2Yz5oNVrdUIz1L7ics5NO0+9CsSDk2aVeQSq2mWyTsIBgNZ7F5xDgL/0oZPLaI
         ovitZt+pPJ4Mz1GNPSYI9p7FwjcDEzAUulW7WuX5ie8D51NKjsVrTwx0Pbt5MM3oGBRD
         P164kOYtxKywKp4eTLf5TCa0I5yJ6Csze79cbK70w5l4RUW0wjBGHEwReXvinPIDkSKQ
         kDvg==
X-Forwarded-Encrypted: i=1; AJvYcCU6p0/crZ5J5/d3gxqJa4Y5clcyjqPjyAhpR37lr74UeLuQKvhWsZ7HrRuBZ8NzuQjxijMjiLBTu+sq@vger.kernel.org
X-Gm-Message-State: AOJu0Yyr91dU6nLreIfoocAuy0Xy6rJ0r/ebfg8zp3eCBzO+FzPvOILH
	HUOqY+FMCi8speOEYSKImxRjBLcNU3b5vzoKPTB/18or0PXh8BIXQvvUN0GOGW0I+x72s223tUl
	nRvQw7zSqDprzzBcmF9iIreq1kx2zJNcSzyPgCw==
X-Google-Smtp-Source: AGHT+IHWcY4HeLXrrsjlFeqF9hDRKyiwxqpUnrkcAstxBsqv/RvYFEsaSAglhvteVmoPlR9N2NfcmRsc49RXWORdTkQ=
X-Received: by 2002:a2e:a552:0:b0:2fe:e45a:4f6c with SMTP id
 38308e7fff4ca-2ff20963bd5mr52169231fa.6.1731419388773; Tue, 12 Nov 2024
 05:49:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241112015408.3139996-1-ye.zhang@rock-chips.com>
 <20241112015408.3139996-5-ye.zhang@rock-chips.com> <CAMRc=MfTmpLSEUVTXSu8jf9tyTfQc=iG9NpovFem-qSDOCnagQ@mail.gmail.com>
 <ZzMwh2GMP-bE7aLO@smile.fi.intel.com> <CAMRc=MePqsQatxNy7p5c3sE4z8RepjjLeFgpppKgEctCU3jAUw@mail.gmail.com>
 <CAMRc=MdY1idv1o_nZFb1fKLpM5DHCPmEu5t5MMa_kV9csLgQWw@mail.gmail.com> <qwlya3kten7ugxzruohmbmmymjd6trz3rlbflirr3yym2vfe32@rapst33wknmd>
In-Reply-To: <qwlya3kten7ugxzruohmbmmymjd6trz3rlbflirr3yym2vfe32@rapst33wknmd>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Nov 2024 14:49:37 +0100
Message-ID: <CAMRc=MfVPn1+TL1XRtPfdCrD-TEy5mG-vuPJFtFyx73+EioSxQ@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] gpio: rockchip: Set input direction when request irq
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Ye Zhang <ye.zhang@rock-chips.com>, 
	linus.walleij@linaro.org, heiko@sntech.de, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, mika.westerberg@linux.intel.com, 
	tao.huang@rock-chips.com, finley.xiao@rock-chips.com, tim.chen@rock-chips.com, 
	elaine.zhang@rock-chips.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 12, 2024 at 2:23=E2=80=AFPM Sebastian Reichel
<sebastian.reichel@collabora.com> wrote:
>
> Hi,
>
> On Tue, Nov 12, 2024 at 01:53:48PM +0100, Bartosz Golaszewski wrote:
> > On Tue, Nov 12, 2024 at 1:50=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev=
.pl> wrote:
> > > On Tue, Nov 12, 2024 at 11:40=E2=80=AFAM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > On Tue, Nov 12, 2024 at 09:48:06AM +0100, Bartosz Golaszewski wrote=
:
> > > > > On Tue, Nov 12, 2024 at 2:54=E2=80=AFAM Ye Zhang <ye.zhang@rock-c=
hips.com> wrote:
> > > > > >
> > > > > > Since the GPIO can only generate interrupts when its direction =
is set to
> > > > > > input, it is set to input before requesting the interrupt resou=
rces.
> > > >
> > > > ...
> > > >
> > > > > This looks like a fix to me, do you want it sent for stable? If s=
o,
> > > > > please add the Fixes tag and put it first in the series.
> > > >
> > > > Independently on the resolution on this, can the first three be app=
lied to
> > > > for-next? I think they are valuable from the documentation perspect=
ive as
> > > > it adds the explanation of the version register bit fields.
> > > >
> > > > The last one seems to me independent (code wise, meaning no potenti=
al
> > > > conflicts) to the rest and may be applied to for-current later on.
> > > >
> > > > --
> > > > With Best Regards,
> > > > Andy Shevchenko
> > > >
> > > >
> > >
> > > There's another issue I see with this patch. It effectively changes
> > > the pin's direction behind the back of the GPIOLIB. If a GPIO is
> > > requested, its direction set to output and another orthogonal user
> > > requests the same pin as input, we'll never update the FLAG_IS_OUT
> >
> > I meant to say "same pin as interrupt". Sorry for the noise.
>
> GPIO output and interrupt at the same time looks like a misconfiguration
> to me. Maybe check for that situation and return -EBUSY?
>

Of course it is. That's why we check for it in
gpiod_direction_output() and in gpiochip_lock_as_irq(): refuse to set
direction to output if the GPIO is used as interrupt and refuse to use
it as interrupt if direction already is output respectively.

This patch however proposes to set the direction to input implicitly
which is wrong. The underlying gpiochip_reqres_irq() will check the
current direction and return -EIO if it's output.

Bart

