Return-Path: <linux-gpio+bounces-28517-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E022C5E247
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Nov 2025 17:16:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A2E85541B7F
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Nov 2025 15:38:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07274329E66;
	Fri, 14 Nov 2025 15:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="j/xHR050"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9281632A3D7
	for <linux-gpio@vger.kernel.org>; Fri, 14 Nov 2025 15:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763134033; cv=none; b=PXp1Y8/gu9OXI1qpSRQ7AowATXVbUy9Vny5J4RP+e72c1+9VqnOM3qfFPWrTjnmqtcEfcncA24TVn/03XdIph2sQOQImBIhKnews9Pk8dUg1bn8LH/0jDvFA4eDX26USIfGA90jri3xGQafSS70G8gUCg3O+7QjwbYEXOgOc5aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763134033; c=relaxed/simple;
	bh=ZRkm9MAnatGw8jRoAYuh0NAQUWHfswtzxd2+zEwyzu4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WC067SGPG1g/uAYdOpuPYGLl7zF+mphHs/dBYqcSi8cHlQfIeMNXXGTYYpWaJyB5ScVwFuNiCn7zjeKF5bU3AdnVD6nPu7QstfKYKprv/X7tE8ZC4XE+FQJG5bKbh3xNouazrQsNDK1LiV4+ATQW+sZc1LQ3MIFY27RsnGXF23Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=j/xHR050; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-59428d2d975so2401254e87.3
        for <linux-gpio@vger.kernel.org>; Fri, 14 Nov 2025 07:27:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763134029; x=1763738829; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZRkm9MAnatGw8jRoAYuh0NAQUWHfswtzxd2+zEwyzu4=;
        b=j/xHR050VRssf49VhEsDJQSAz9C8SmAE9TnyzrX9wGAJx6rX1wGKF2+L2DxjF9BfL2
         7gW2uMMmHE03gNb3xk1ZtsLaL6Qeoqb4Mep6dPAmkjDPX1s7wajLU93MnjbVL8fmAlOw
         LIWvI7grsvZyMvR0oR19RiexIJE1QWl9pat3WI9SAql0jOFCfq34y7TvXm0Xqpc+S5Q5
         G0i+dAkgY8JEdd4ThWL1DhiCor6AnA/B34eRT5zXlfVZ3wWag8tB3tRq7D2cUpEN9UmZ
         kyqafy8F0x9JTrvzp8ZSa1mpHev8D3TlJ5oK+PW899mSCj+UXBeyO9dtwCaR/Wtn2l/8
         tutA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763134029; x=1763738829;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZRkm9MAnatGw8jRoAYuh0NAQUWHfswtzxd2+zEwyzu4=;
        b=NnP8+8NQsLJRGeJguvBsJ9D5cIs0VtZsgZq2KNfMSfIY1RdVvRpk2WZ6uJXFlt12NF
         IHWKF6sxxCWWQqRHP+3TsWz8ficSfpdxDPmteGX3axK3LvFnYOJXlh0HEnBcMdup7gBM
         m7JncVAsCKIj0dw3pL/Amyq7FEQoEWXmJvnU39JvDGmyCv/Nlf+p/q+rUXxpDeQm0RGW
         XFunSMUhvOns4Gv5s5vC9Y7Lk7ugbBJvYYLT4sD96L41aHHMy3yAkZFs6tSp1Q77jMbu
         5ixm44WP3+2cbTV7rwkYd0VTqt5bL5wObyit8aL5rzOunwdqrMjjL3sdNZZdMaBeXH90
         /DBA==
X-Forwarded-Encrypted: i=1; AJvYcCV7kSqK6RflKvdBpm2oPjSON9dnTZbxN9fXM/yKq/yQxC3esseTCK//c7y/2qMB2/OwRbc0iFoJPkZy@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb8aRl/k49JJLPijQ/P9jQYKB6Ky+iGKPknqG8njQTcJgZwshz
	Liip5oIa1oOAwiDbsorOFYKnHB03M7rBreIPiRB7IEiY9XEayoPScLdrIknMhNFbKd8nGML3Bd/
	B2sPBLN/Y8mmxsyYIC7xS9h0EhGKYwJVVlDUd95on1A==
X-Gm-Gg: ASbGnct3Vn9i6Vtg12Hrsu7qCxfBWg9DRkf2oVkS9QoV+Uqud2rCUXb0k8BLaWnwINP
	59xH+f7fHdSzprwuzOYiUF68BR4NLn57ois9Iai9NFqjSTpWff3qTS4u7YQ2M/BAFvuv2H6zYF/
	G8UXfgCnRbpNidiwQzhYIaqK4UdkqDAH7MuHyRGq1u7ZnIfDhK+52oFH3eKKqSS+yEscRki09mK
	zLBeZfxvdWlzVrb2ejUZK8/lQupAXNox6KgvPwc2NdZI7MmS30MULnn8dBfmdSRY4GXBFJUvlYf
	SYlFK8WSoycX/DpQrSb/1+UYoqD/M2zGdP/62w==
X-Google-Smtp-Source: AGHT+IF6xCz2NzIlyE02Hw0/29/W4EZrdaZUJDFmCQYaYsW9yRTYh8OWF3JJ//cxS5nACsoOf++KlLZWy6Ji0aAa2QA=
X-Received: by 2002:a05:6512:1593:b0:594:4ebf:e6eb with SMTP id
 2adb3069b0e04-595841aad25mr1355148e87.14.1763134029328; Fri, 14 Nov 2025
 07:27:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241018-gpio-notify-in-kernel-events-v5-0-c79135e58a1c@linaro.org>
 <20241018-gpio-notify-in-kernel-events-v5-6-c79135e58a1c@linaro.org>
 <5d605f7fc99456804911403102a4fe999a14cc85.camel@siemens.com>
 <CAMRc=McswuxryKqh7-zSc+oKTubu-bKoV40mUMh1tUbTofHA5A@mail.gmail.com>
 <20d48bba465d3e03d2dd5e57c4d2d15765356b7e.camel@siemens.com>
 <CAMRc=McTRNeyYXoy75VOsk5YNb5udBbin2TbCmX8DzQXhGUAVQ@mail.gmail.com> <77968553c766aaa0240c4c9b81852fb262bc1942.camel@siemens.com>
In-Reply-To: <77968553c766aaa0240c4c9b81852fb262bc1942.camel@siemens.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 14 Nov 2025 16:26:56 +0100
X-Gm-Features: AWmQ_bk09-hN_a4JilAWlt5ot-1efvHSBtb_k4_ZDVgnQU7M7NxEfRn8cUw6fzI
Message-ID: <CAMRc=MdJBuTLEkxNjY8sgAS84g0WyHe27NYjtf_WDwZ53Ja0-w@mail.gmail.com>
Subject: Re: [PATCH v5 6/8] gpio: cdev: put emitting the line state events on
 a workqueue
To: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
Cc: "bartosz.golaszewski@linaro.org" <bartosz.golaszewski@linaro.org>, 
	"warthog618@gmail.com" <warthog618@gmail.com>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 14, 2025 at 12:57=E2=80=AFPM Sverdlin, Alexander
<alexander.sverdlin@siemens.com> wrote:
>
> Hi Bartosz,
>
> On Fri, 2025-11-14 at 02:11 -0800, Bartosz Golaszewski wrote:
> > > > > > In order to allow line state notifications to be emitted from a=
tomic
> > > > > > context (for instance: from gpiod_direction_input/output()), we=
 must
> > > > > > stop calling any sleeping functions in lineinfo_changed_notify(=
). To
> > > > > > that end let's use the new workqueue.
> > > > > >
> > > > > > Let's atomically allocate small structures containing the requi=
red data
> > > > > > and fill it with information immediately upon being notified ab=
out the
> > > > > > change except for the pinctrl state which will be retrieved lat=
er from
> > > > > > process context. We can pretty reliably do this as pin function=
s are
> > > > > > typically set once per boot.
> > > > > >
> > > > > > Let's make sure to bump the reference count of GPIO device and =
the GPIO
> > > > > > character device file descriptor to keep both alive until the e=
vent was
> > > > > > queued.
> > > > > >
> > > > > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.=
org>
> > > > >
> > > > > starting from this patch up to the current linux-next (v6.18-rcX)
> > > > > I see the following refcnt warnings + KASAN UAF reports on either=
 reboot
> > > > > (when gpio-manager is being stopped) or
> > > > > `systemctl kill --signal=3DSIGKILL gpio-manager` (if some GPIOs a=
re being
> > > > > requested from (owned by) gpio-manager prior to kill):
> > >
> > > []
> > >
> > > > Thanks for the bug report. I confirm it's reproducible on my side t=
oo.
> > > > It never occurred to me to try and SIGKILL gpio-manager. On normal
> > > > exit, nothing bad happens. Let me look into it.
> > >
> > > In my case it happens also on every reboot/shutdown, however if I
> > > `systemctl stop gpio-manager`, I don't see the issue... not sure yet,
> > > what is the difference... and I'm not telling SIGKILL is how one
> > > should stop gpio-manager, but I'm happy SIGKILL now allows you to
> > > reproduce the issue in the kernel code!
> > >
> >
> > When the process is killed, it seems the character device's file struct=
 is no
> > longer valid even though chrdev_release() was not yet called - it's cal=
led
> > after we try to send out this notification. I think it's best to just c=
heck
> > if the file is active and not do anything if it isn't.
> >
> > Can you test the following change before I submit a formal patch?
>
> thank you for the quick fix!
> I've tested the below patch (on top of v6.18-rc4 with quite some debug op=
tions
> and even KASAN) and I don't get any issues, neither killing gpio-manager,
> nor during reboot.
>
> Feel free to add my
> Tested-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
>

Thanks! I still want to investigate it a bit more as the same issue
appears even without SIGKILL if I run the following python script:

import gpiod
chip =3D gpiod.Chip("/dev/gpiochip0")
chip.watch_line_info(0)
req =3D chip.request_lines({0: None})

It basically happens if the same process is watching the line it
requests and then gets killed and the ordering of operations is right.
In gpio-manager when existing cleanly, we free resources in the right
order but this python script lets the OS handle cleanup and the same
issue occurs.

I want to get to the bottom of what's going on.

Bart

