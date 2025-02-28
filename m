Return-Path: <linux-gpio+bounces-16766-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC03A49272
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 08:50:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A2643B6855
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 07:50:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D158B1C3F0A;
	Fri, 28 Feb 2025 07:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w2ky+cMv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992E8276D12
	for <linux-gpio@vger.kernel.org>; Fri, 28 Feb 2025 07:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740729009; cv=none; b=d05qMHB8KS+pAQ82RRqgd1pV+m7iZ39/pfuhdxOWKl8nyBfafJ3bX7zffCkU6xnGGlNH0B2OUBWqjvbcxmqeVht/x0jDoB7lg5KafXeE1vDE3+ZW68XZMw+7gthTONPJNNVlqWxOXM7K6mXPqzr+mdmtkyP+KgNwZdvX4oRQtwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740729009; c=relaxed/simple;
	bh=/3GBKzOT/gRclru4KX8SYURHad1u929/9c4Rm6V1GPQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SVZtjWdhMcDrCVxFDjNomNu+rOZldXUChtLS6UumNlnxO7v++wAOTWBs6xm6cE21tpMHbx3CcuPsmfhG+NAPLaK4a75zuJSuyHFu++AvuxPl/OK6iYVXqR1IHg57AfOOmXB2ORJjxMWseH1gBPbJgAuNB1GbjVUxUY8p99UZvDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w2ky+cMv; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-307c13298eeso22124051fa.0
        for <linux-gpio@vger.kernel.org>; Thu, 27 Feb 2025 23:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740729006; x=1741333806; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C0hgOMj0qireb4PrK1Eb2MG9HXljYP0f368BgGE+m/Y=;
        b=w2ky+cMvefccWzG0p8Ju5eXux2M6EX3XYTZ624QxoWC4OlWmZNqFkeXu/uaHoOvqqx
         26025dRBGPF0kWkfHfSMyNJN4BRWd8pfwwy0eMxETTbsVLFtapLEk3wPYbtMpDZ/uHKk
         j2fXOr4qCWlJ3+U6nIIeBMfNBL5Xmu5suIY1KxBshH/45jcmtt2Uv5+npzX8R3I5qOyG
         aus5h+tUEAFNhp94p8zPhIgqrTCwz3zOBt9PpVe1ZWH7Pa90q4SWDBpbKQR3efCWqgi3
         gEPtLob1SALQFfc/jf18VEclfMmys9/32K8HZwQiOvIbCDNleJLbsFOIqB+pqCivZbDG
         Sk2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740729006; x=1741333806;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C0hgOMj0qireb4PrK1Eb2MG9HXljYP0f368BgGE+m/Y=;
        b=l9Its2PI7233e7buXRLbrz8ouPQWRS7qNbmFY0UvMyTA7/qgihxiDErBX482oeWoYS
         lw4RscosMARrQH6/MdZfxMvkuF58pQJsJD6frjOXrV5HwpFs8hPVZ61V94lTn7lwqWOG
         64P4zmdtZKW7D4mZbuktTGA9EVXZQoVeATEd9T4m8mMmxhTweLuHa5ln0U48RMzSaHKf
         VZl26hHckIYPnfSFrF1qID6rJPm8rrorVA6xiTyGAJ/2M7DosQ+9hDQRfoV5ngIHLQgP
         yeSLaUgYD/UdVzJHHLTngObe1nA3Al0uoQBuoQqeAZwTlh4KQwzPC6GtwNZB9rIZYiKF
         PlXA==
X-Forwarded-Encrypted: i=1; AJvYcCXrK2BrlBewPYBLV6cKhVdDqM4hHrJvntiLTF6undqp+K4pPzpEFQvjywDgGgMLbyAjMUwctrLAjchl@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv9W8t5Y4w2iPcBlZVZkNlJN+CD5eyb9OTlknE+3mQYrRuRPc+
	eJdvXKz6m58Nte2CmDblcac2rT/j2TRkgRgSMz0dl29wnFiiK8yO05pv9rmqLjMGa7It+wjfOrb
	Ze9X99kQ8LhuIJaM06ETgS20LFK7xoMUBHpHMpg==
X-Gm-Gg: ASbGncv1UogVZbnWU5nBZep5VtxJqtWVIa6DDhl6c8Dxc46AbLbTDSvXNdqINos5DNy
	gltl/nJOwFZ8rEny6o/wfAF0qMArKMTxrXeOyM4gkpbjsQ2qbtC8Ftf+mf9eLhY73s8DM4zoB1D
	DCoe/LBH8=
X-Google-Smtp-Source: AGHT+IF4eV9f4IaZ1Sq1xeYPdxbr8LBc3UDMXq5e9qCcD/2Q0dPCkI5IfOf28Uj/35wHIkaSMeXzLhmny9S1zh18OBY=
X-Received: by 2002:a05:651c:509:b0:302:2cb3:bb1d with SMTP id
 38308e7fff4ca-30b90a1da2amr7601021fa.12.1740729005508; Thu, 27 Feb 2025
 23:50:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMRc=McUCeZcU6co1aN54rTudo+JfPjjForu4iKQ5npwXk6GXA@mail.gmail.com>
 <CACRpkdZXm9eFJ2nzb5Gsm_ddirt6XZTQyu2G+vX2FB+=L6Lttw@mail.gmail.com>
 <e5bdcca6-4d1b-451c-8fde-990db9db23d8@denx.de> <CACRpkdaGeV3v80QuWwus5rg9GfKkT_gzhvRgfOobnDMUO2cPEQ@mail.gmail.com>
 <d29f36d1-53e0-42d3-beed-cc228553f658@denx.de>
In-Reply-To: <d29f36d1-53e0-42d3-beed-cc228553f658@denx.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 28 Feb 2025 08:49:54 +0100
X-Gm-Features: AQ5f1JoONNZHHfESIv1Of2mSmjlsaI3ZfK30xRWi4aMzHdT6Y0JWMRw_h18OkKc
Message-ID: <CACRpkda-0+9u1mu8gJPwE_2ykY0TeoDS3t2_D-HoPgUQ45gfiw@mail.gmail.com>
Subject: Re: Replacing global GPIO numbers in sysfs with hardware offsets
To: Marek Vasut <marex@denx.de>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Ahmad Fatoum <a.fatoum@pengutronix.de>, 
	Kent Gibson <warthog618@gmail.com>, =?UTF-8?Q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 26, 2025 at 1:43=E2=80=AFPM Marek Vasut <marex@denx.de> wrote:

> That's really all this is about, get rid of the defects of the old sysfs
> API, but keep the tooling requirements to minimum.

I understand.

We should however understand that there are defects in
the sysfs ABI that cannot be designed away:

- The chardev uses the Linux file handler clean-up when an
  applications dies, often sysfs programs poke around and
  export stuff left and right, then if they crash (as bash scripts
  do) then it is left in an undefined state. With the chardev all
  GPIOs get released and cleaned up when this happens.

- The chardev has an "event pipe" using KFIFO which is
  *fast* and provides timestamps (this is why IIO is using it)
  and things such as signal processing in userspace can
  never rely on GPIO events being fast or timestamped
  unless they use the chardev ABI.

- Topology is inherently unstable (also with the current
  global numberspace) so scripts using sysfs actually need
  to do proper topology discovery before using GPIOs,
  and this is an inherent design in sysfs. An example is
  GPIOs on USB expanders, say that you plug in two
  of them, which one gets probed first, really? Which one
  becomes gpiochip0 and which one is gpiochip1?
  It will be the same driver so the label will be the same.
  Most people
  I think currently just ignores this problem and hope their
  system will probe in a certain order despite the
  deferred probe etc has made the global numberspace
  quite shaky.

> Also note that API "v2" attribute layout could differ from API "v1" ,
> that is not a problem.

But does this "v2" include interrupt handling?

I think interrupts should not be part of "v2" in that case. It is
just too shaky and unreliable. Direction/getting/setting is fine (just
does not clean up very well).

The current IRQ crap in sysfs uses sysfs_notify_dirent() which
will squash 100 or 1000 IRQs into one notification if they are
fast and userspace does not react in time and that *will* miss
interrupts and there is no way to design around that.

I think fs notify is not very synchronous, these "IRQs"
will be delivered the next time the system schedules,
or something like that.

It's not very nice for the GPIO maintainers that people
rely on this and then come to us and complain that they
are missing IRQs in userspace, and what shall we say?
Shrug?

> > I understand, I'm fine with sysfs if it needs to be a "support forever"
> > ABI, as long as it's:
> >
> > - Using the per-chip HW numberspace
>
> This is no issue for me.
>
> > - Doesn't need any echo NN > export to see the lines in
> >    sysfs.
>
> Can we really make do without export/unexport ?

I was more thinking that we should not need export/unexport
just to see the line. Propsal elsewhere in this thread:

/sys/bus/gpio/gpiochip0
/sys/bus/gpio/gpiochip0/gpio0
/sys/bus/gpio/gpiochip0/gpio0/userspace
/sys/bus/gpio/gpiochip0/gpio0/value
/sys/bus/gpio/gpiochip0/gpio1
/sys/bus/gpio/gpiochip0/gpio1/userspace
/sys/bus/gpio/gpiochip0/gpio1/value

Take a GPIO, shake it, give it back to the kernel:
echo 1 > /sys/bus/gpio/gpiochip0/gpio1/userspace
echo 0 > /sys/bus/gpio/gpiochip0/gpio1/value
sleep 1
echo 1 > /sys/bus/gpio/gpiochip0/gpio1/value
echo 0 > /sys/bus/gpio/gpiochip0/gpio1/userspace

So we can always "see" this GPIO line, instead of
exporting/unexporting there is a knob to assign/unassign
it to userspace.

> Consider this scenario:
>
> - User open()s and write()s /sys/bus/gpio/gpiochip0/gpio0/value
> - User keeps FD to /sys/bus/gpio/gpiochip0/gpio0/value open
> - Kernel module gets loaded, binds to DT node which references the same G=
PIO
> - User write()s /sys/bus/gpio/gpiochip0/gpio0/value open again
>
> I wonder if this could pose a problem ?
>
> I suspect the kernel module loading should fail , right ?

Yes the sysfs reserves the GPIO so no kernel module
can come in and use it so this is protected by design,
also in the current sysfs.

Yours,
Linus Walleij

