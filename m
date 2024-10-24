Return-Path: <linux-gpio+bounces-11905-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB979ADC87
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2024 08:49:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 685B6B21897
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2024 06:49:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB54B18990D;
	Thu, 24 Oct 2024 06:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="xF78g8TL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E38176AC7
	for <linux-gpio@vger.kernel.org>; Thu, 24 Oct 2024 06:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729752585; cv=none; b=IRubjval1abhDcX/iF+WGdpKUAwUup6GJubjVFN9lAC/u8bJziVVOUwqxDdYor6GALy0Fx/x/Gwj0PDA3Xodxo5lgVd38rOHj+5UIFJWAxaSrSKWPM+epf8kYo8/FFJNiZh4Q8LHnI4qfvl6Rc4yCHRtLgcADYvhS3tzCDIBgiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729752585; c=relaxed/simple;
	bh=+YxnxosZT/eyq9qGUq649cD1oJPyBYuQgRE/G2Oq8bc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gi+9a4+Y9PJZfgLuoxPxlWsxvERkPsUfm42qkADwsl1PUJTF5ePAyqT0CX58XRDgZPR48Se101N0sxCpYPOxC4VCm+rcg4cz86Z/kYiGRQDjKId2XKD+TDxYpNBnJtz79/LXSiRThsrUKeVlcconzbLKS36H9IKgNtB9M2EOB/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=xF78g8TL; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-539fe02c386so1682836e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 23 Oct 2024 23:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1729752581; x=1730357381; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UqmqTH83P2HaPWfrbm9uUBr/H9htXfVkZ8VBcknquU0=;
        b=xF78g8TL+oyWbReK9NTif2Pr11zBwjrqsgmTeukGDBBw+r2CuB4u8DQvR3UwoEP9p8
         Ghlcp/Z1ih6klOjQ2AooJ6ktwtTUI9GjkzpVSYUoj9LaE856aaxG3YlRBIlcRHtp+LnS
         6GGCmO1fdmjY7awxNcXCSK+DaTbluuOAZr9yeEXwqAHGJKIHNo5z8K4CXTMzJYUS4Nll
         m8+9hGCIo+QcTsr030V6t4trFl/aO0iQNQAb5DAccxRMF7+ELDECbaXgI/y/jx9lQJvL
         lsVN8E0RnLtpdNTGCfcmkTfM0/aCLp/nQQmYK5gbGMfyxAfcx2lQzxlYS667esi1mkkE
         dx6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729752581; x=1730357381;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UqmqTH83P2HaPWfrbm9uUBr/H9htXfVkZ8VBcknquU0=;
        b=CnaNWIQeFc0y/3v4AxxT63T6D+N7qctqjGoRk/5sf9myglgPr9c3+R5LrCLyuMsLGs
         0hk769a4TpCSO1Qv+dRZkaQgLDNiO2SZ3mcuwqrHz/9bL8PLHGm/OD5Ghl5xvk/kTqA7
         xa7kash4T0hcynSkrSBPZUyoaUYiJ4JOeK9xd6n1oIPK9gEOoGFO7bjFUOHZLONUe9a1
         CPwNlZH8o11HDKKUSPV6PfWwKralZ6t9EJZNSQb1bgjK2gRUL0tKmnHDdSQJad5SOBgi
         k804VQ5N/s6Yp+MWcKU13hNZusMap5EcQH5fV/vs/bAZUDELjH01Kk3+733Q9LoA2UDC
         8eDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAKC/IMA3kp2gC6fw7vYkEC4doL/4nJoiwDGPGe5A5ptYPN2Wp5LQFtwi2avX0tC+I0M+dYxt2QCND@vger.kernel.org
X-Gm-Message-State: AOJu0YwOyoTWclXgShv33BcJDWzldbHVwEygxcEeTo6V72XgQtDRSwjQ
	VDarUFlRURySVqslHaCdMkdhk7llwk9thuoKJjtvwXk2oZL8uX8Hw3HnVYmKvPnAdoqsD6OjrU6
	Vgp4u3ky1XCxRkfnOt3hvadoKpZ4NSWcfHAN6Bw==
X-Google-Smtp-Source: AGHT+IEWjBJncByCCl7enq/GnMU1+EKrCnNTytQZIByE0RQSst7Rou5XDK9q3/yWAA/jI9WwwcPBxuNUZ7BXeZKKgJw=
X-Received: by 2002:a05:6512:3b2a:b0:53b:1fd1:df4e with SMTP id
 2adb3069b0e04-53b23749bf5mr305771e87.19.1729752581320; Wed, 23 Oct 2024
 23:49:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241018-gpio-notify-in-kernel-events-v5-0-c79135e58a1c@linaro.org>
 <20241018-gpio-notify-in-kernel-events-v5-8-c79135e58a1c@linaro.org> <d6601a31-7685-4b21-9271-1b76116cc483@sirena.org.uk>
In-Reply-To: <d6601a31-7685-4b21-9271-1b76116cc483@sirena.org.uk>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 24 Oct 2024 08:49:30 +0200
Message-ID: <CAMRc=MfW9n+y8Dehe_g9b8_=he1YuFr3CEGG3iQEfjYwFiWA_g@mail.gmail.com>
Subject: Re: [PATCH v5 8/8] gpiolib: notify user-space about in-kernel line
 state changes
To: Mark Brown <broonie@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Kent Gibson <warthog618@gmail.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 23, 2024 at 11:05=E2=80=AFPM Mark Brown <broonie@kernel.org> wr=
ote:
>
> On Fri, Oct 18, 2024 at 11:10:16AM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > We currently only notify user-space about line config changes that are
> > made from user-space. Any kernel config changes are not signalled.
> >
> > Let's improve the situation by emitting the events closer to the source=
.
> > To that end let's call the relevant notifier chain from the functions
> > setting direction, gpiod_set_config(), gpiod_set_consumer_name() and
> > gpiod_toggle_active_low(). This covers all the options that we can
> > inform the user-space about. We ignore events which don't have
> > corresponding flags exported to user-space on purpose - otherwise the
> > user would see a config-changed event but the associated line-info woul=
d
> > remain unchanged.
>
> Today's -next is not booting on several of my platforms, including
> beaglebone-black, i.MX8MP-EVK and pine64plus.  Bisects are pointing at
> this commit, and i.MX8MP-EVK is actually giving some console output:
>
> [    2.502208] Unable to handle kernel NULL pointer dereference at virtua=
l address 0000000000000000
> [    2.511036] Mem abort info:
>
> ...
>
> [    2.679934] Call trace:
> [    2.682379]  gpiod_direction_output+0x34/0x5c
> [    2.686745]  i2c_register_adapter+0x59c/0x670
> [    2.691111]  __i2c_add_numbered_adapter+0x58/0xa8
> [    2.695822]  i2c_add_adapter+0xa0/0xd0
> [    2.699578]  i2c_add_numbered_adapter+0x2c/0x38
> [    2.704117]  i2c_imx_probe+0x2d0/0x640
>
> which looks plausible given the change.
>
> Full boot log for i.MX8MP-EVK:
>
>    https://lava.sirena.org.uk/scheduler/job/887083
>
> Bisect log for that, the others look similar (the long run of good/bad
> tags at the start for random commits is my automation pulling test
> results it already knows about in the affected range to try to speed up
> the bisect):
>

Hi Mark!

Any chance you could post the output of

    scripts/faddr2line drivers/gpio/gpiolib.o gpiod_direction_output+0x34/0=
x5c

for that build?

Bart

