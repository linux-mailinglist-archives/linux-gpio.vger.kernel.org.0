Return-Path: <linux-gpio+bounces-16781-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E5AF2A493FB
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 09:50:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F1F2D16BE97
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 08:50:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86562254878;
	Fri, 28 Feb 2025 08:50:09 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD850254866
	for <linux-gpio@vger.kernel.org>; Fri, 28 Feb 2025 08:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740732609; cv=none; b=Wtx9Q8ltxFLqvsGNKXcqWru1HlyAwOXWKMIsPVmFbU5meUUKx1jUlq3QoAHUKGbq5uJ0/y5UbO5SUTgRY18GcPBIVJ/NwOJxXZug3Wmoh+gbKxowU2sTMkLZ4edhi458Zi3XSc54DRKHqBe4VIG9o0uklgU3X2JK6GKZYegngH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740732609; c=relaxed/simple;
	bh=H27Q7lF6nd01f5i2jvXdKz8tqgWRDgchisIzCaxxqLQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qCgWxwSEfHFYbrPIe1b/DUV3ejYJloJK8UYw9s/gE2/d92//HBh8jGLxKjS0tSRAe9lruqkLXNLvGL908TVDIMJBpLj84KkRCZNa4w7rkA41ZoT+coWHbkOZo4GyOFSG8OeCUj+Ac3HjZhq2e9UWuOWR9DxOTwtd3ww8C0LSCUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-86b2e0a227fso822601241.2
        for <linux-gpio@vger.kernel.org>; Fri, 28 Feb 2025 00:50:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740732605; x=1741337405;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FhyewyjeOxj4KCJxeI0nhjFUCa8h/tHQ0FamvKr2TMU=;
        b=j+TwKpurKPIllez5vmuiiS1eQpHyuspCQOGgERUNR5WquaZ5M8rHuD8x4QQuGjYEcZ
         wNg1CR9EgjpQEOLXLl8sTsOZcgUKCdyV77Hnkc703wL6MVhBUP63o/o+gbf62f9vwJu2
         Pi6gsef6MB6QPtDu4ttL34ugtx8GStlNJxIozlJH7iKPNbWUzCmlDOYjCLBTVf9YDoZh
         SDvHVXzomDvxnc0h4jC1+A5B7e5MchrHFs2plA3LhW6Zt7v5Q/5h/hADCsFKIGeMfgMd
         hYAcAVMHIj5pk19UOc/sVRJrhYTly10bvtwaFfjbqytE6dmF5q925FDIAyqzdEB0t84C
         8lgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUIDLzgZ1M7Y5+B622Ed7T0LndZ0Z3Wd0nfSqzAycJdgWnqYJ6Q9WBh+vvprOfCeaqQALIKakwAldM@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/7J8z1i29S4wRvCzFFT7kzs0i1cFnpUm4WutSEA47g8uPpLLH
	WTUzJ0596MesqMJWLatrus8ovKDgka258IHSYAEZ09pGOhc/pArH5NQqXYZ9
X-Gm-Gg: ASbGncthFErtr3s8D7TR7Y5XVYX3vvJpRHOrBBGvDi4J7gYwSkAVEujcYgxLb9/tZK6
	M8SImbbS7Nd9FUck2seiKcR2pAp6sdfg2Dspu432E0nEGBSnfpIr8kxWvcZvg0CJCRpJRc5IUtK
	vbGquqtRAS5dq2sfiNq5HQDOE25YtFxTCn9tld9M+6nNOVvwPWjp2FX2hq/Z/Oh7QJD4zcgxFRf
	aemEBx0NCmqdZMRGg+U1gAb8V4eMYe/e9ZSf2kukgq3LcmcM0kCFJVeZVuH6C12Psqv/FyKa6CU
	fcmRG5boX+5y3N47nhZAIW0yJtzUHx0f1S+wNRNU7yte3Lhrp4b6kqv0S9NDmKe+
X-Google-Smtp-Source: AGHT+IHFFHd65X6tfwNh+k9MiazdEOq84T28GOy+Df+8vjs/FJ1WSuUi7wW/aDutl7GZV8XiFsgAzg==
X-Received: by 2002:a05:6102:418a:b0:4bb:9b46:3f95 with SMTP id ada2fe7eead31-4c0448fc86emr1805281137.4.1740732605380;
        Fri, 28 Feb 2025 00:50:05 -0800 (PST)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-86b3dd250a4sm486178241.28.2025.02.28.00.50.05
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Feb 2025 00:50:05 -0800 (PST)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-868fa40bb9aso838163241.1
        for <linux-gpio@vger.kernel.org>; Fri, 28 Feb 2025 00:50:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV/yj72n+FnFkEOOnx02+X5B+BzVzybaekm2Kg9wJcfgLmyvDSFcz4wGoynVuHmO8XtTsjwBSquFX70@vger.kernel.org
X-Received: by 2002:a05:6102:b0c:b0:4bb:e6bc:e164 with SMTP id
 ada2fe7eead31-4c044f6f40fmr1777358137.25.1740732605007; Fri, 28 Feb 2025
 00:50:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMRc=McUCeZcU6co1aN54rTudo+JfPjjForu4iKQ5npwXk6GXA@mail.gmail.com>
 <CACRpkdZXm9eFJ2nzb5Gsm_ddirt6XZTQyu2G+vX2FB+=L6Lttw@mail.gmail.com>
 <e5bdcca6-4d1b-451c-8fde-990db9db23d8@denx.de> <CACRpkdaGeV3v80QuWwus5rg9GfKkT_gzhvRgfOobnDMUO2cPEQ@mail.gmail.com>
 <d29f36d1-53e0-42d3-beed-cc228553f658@denx.de> <CACRpkda-0+9u1mu8gJPwE_2ykY0TeoDS3t2_D-HoPgUQ45gfiw@mail.gmail.com>
In-Reply-To: <CACRpkda-0+9u1mu8gJPwE_2ykY0TeoDS3t2_D-HoPgUQ45gfiw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 28 Feb 2025 09:49:53 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW=bttP01Jigtn1DPyzVzTNr3GguNTo4Kw=NOBhhhthRA@mail.gmail.com>
X-Gm-Features: AQ5f1JrAUPQo2mCtY9qiZh_qOlfFC9peq0KtG3-hzgnHm7ieSbN_hUEtKSqDWUg
Message-ID: <CAMuHMdW=bttP01Jigtn1DPyzVzTNr3GguNTo4Kw=NOBhhhthRA@mail.gmail.com>
Subject: Re: Replacing global GPIO numbers in sysfs with hardware offsets
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Marek Vasut <marex@denx.de>, Bartosz Golaszewski <brgl@bgdev.pl>, Ahmad Fatoum <a.fatoum@pengutronix.de>, 
	Kent Gibson <warthog618@gmail.com>, =?UTF-8?Q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Fri, 28 Feb 2025 at 08:50, Linus Walleij <linus.walleij@linaro.org> wrot=
e:
> On Wed, Feb 26, 2025 at 1:43=E2=80=AFPM Marek Vasut <marex@denx.de> wrote=
:
> > > I understand, I'm fine with sysfs if it needs to be a "support foreve=
r"
> > > ABI, as long as it's:
> > >
> > > - Using the per-chip HW numberspace
> >
> > This is no issue for me.

So that would be 0..<N-1>, not <base>..<base+N-1>?
Hence you cannot have global (un)export files in sysfs, but need
per-chip (un)export files?

> > > - Doesn't need any echo NN > export to see the lines in
> > >    sysfs.
> >
> > Can we really make do without export/unexport ?
>
> I was more thinking that we should not need export/unexport
> just to see the line. Propsal elsewhere in this thread:
>
> /sys/bus/gpio/gpiochip0
> /sys/bus/gpio/gpiochip0/gpio0
> /sys/bus/gpio/gpiochip0/gpio0/userspace
> /sys/bus/gpio/gpiochip0/gpio0/value
> /sys/bus/gpio/gpiochip0/gpio1
> /sys/bus/gpio/gpiochip0/gpio1/userspace
> /sys/bus/gpio/gpiochip0/gpio1/value
>
> Take a GPIO, shake it, give it back to the kernel:
> echo 1 > /sys/bus/gpio/gpiochip0/gpio1/userspace
> echo 0 > /sys/bus/gpio/gpiochip0/gpio1/value
> sleep 1
> echo 1 > /sys/bus/gpio/gpiochip0/gpio1/value
> echo 0 > /sys/bus/gpio/gpiochip0/gpio1/userspace
>
> So we can always "see" this GPIO line, instead of
> exporting/unexporting there is a knob to assign/unassign
> it to userspace.

Why would you want to always "see" all GPIO lines?
What is the use case for that? What am I missing?

If it is recommended not to use this interface, I think all GPIOs
should be invisible by default.  Hence I still prefer the (un)export
interface.

Thanks!

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

