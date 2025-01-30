Return-Path: <linux-gpio+bounces-15098-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E7BA22BA0
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Jan 2025 11:31:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EEC2A1887C39
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Jan 2025 10:31:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0D3B1B4146;
	Thu, 30 Jan 2025 10:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="OvhHxamU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3BD62CAB
	for <linux-gpio@vger.kernel.org>; Thu, 30 Jan 2025 10:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738233074; cv=none; b=T4KmXpYESP63Y8RgMWxTaYQ9LrFRRFB4ALlI0iXOj2GuVmGAvKUKchfmRGmIztw4A9v0rauRxo2VogXBcwVIVMBRYk2IQXD1vhcE1RwYTHCfx6Xtu2sgWPuJ0s+N+ef7dsADnOGXVphTLjRPSYVwcwV5Ni9AlK5MRRd5bP2vAqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738233074; c=relaxed/simple;
	bh=GLqcA0yrzTvNKkoJFv9QsKzWR+3TrgS96TN9KhFpcQQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UJiQLR57xXx0CvH8fbnik7QqRpH0oMNuAGOCBrGxWGte44Smx2sPfxnVZQ9oJVlMRIq4bC9GEsqjAilBzPTIJA1sIg3bgcJ9+gEFiFjUVC4ZXIj+ucRrSN6Iv8+Z1OYR9u1cxqLfu1Ht/gYnsqFQ4t0OnKlhVs3RKkXAm5cSEUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=OvhHxamU; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53f22fd6832so687621e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 30 Jan 2025 02:31:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738233071; x=1738837871; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ki6qA4i5kESQuNmkoycSfPaPrQE6ErTpRlE8t4jd8q8=;
        b=OvhHxamUy/WyJ9758Cswr1k/2hfZRvwzsLVpcwW3TwGXj1DQ5FUboie7kTq0xigKHN
         /zgjmOUTSncbe0Flgm1ArStU+qTNV1jOP1gqJ/C1ZSHDNFYLuYnn7ZlKt/aytWNZEjuN
         xmHrSFWJhCLXo21+R3nRgZNUhK0PePc/qMTkFRl/pqlKJbqojEkUuzozPcKjvjetaTpR
         wbvEpSqSv96lDn3Gua32CSWyfEYKWowB/23bwlF+wLe94hlFOwYITpzSlk3aOapAy03o
         p22yRGXv2ZcLjy6jOOoRI6s2hZ+umdcyd6YsMBT/pzd00OvPoigoJfD95liHD86KlHDH
         yw2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738233071; x=1738837871;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ki6qA4i5kESQuNmkoycSfPaPrQE6ErTpRlE8t4jd8q8=;
        b=cgQPO9dc7pHJHCOCGt6LjL4cUTkOqtq3PvhDXxF4w4PeUgTLVsg4bhrila26mm6v/K
         D+a4WBkVYJuP+ltrqqQavk5LZO1ySHFc9OQFBGfo0RnorbcDhgSqll0iGcAZ6SOuYmya
         LLl6mJZuX17Cl9cZQlGgjoyQkIui374mOjiizii6v5Kba8TA7aHriUT6UvwoMnhb4pWF
         s+dqOmlaVDMWk6fbDgpIN0tul5w/iPb/ElSHWUYrSgFLe3j6gxilEeKghtvq7H/bGGT3
         PFbR2jio9zlw4uJeLdOV/Srr54K26TvYHsskxFms0W5ZAa2qJPLR1aB/apkyvwQ4wqxh
         cGhA==
X-Gm-Message-State: AOJu0YwPetpXxt9UdVf73p72ZLE8deiG11qsdN5qsOCv5mBrYdm80zDd
	dd2U6Q5cT2KmXfpys1ffc4MV+DLp7FAKYAJb1wjC4oXIysf6WiErWaeuPLtqMllWqrfC0mbx7ur
	lSk8YGvviRyMYCQIQfH/C84gHf0GQtfE2M4ybAw==
X-Gm-Gg: ASbGncv1dAPqB6OA2kJgA77lafRzbyfrr2EiEMLTdrHza5SgeZffsKq52AL0l1bd35o
	m8pJmZT51whjDYhuR5e45pINGCu2Ks6URvQZ2zvECgc6kXXarGU5Dgrp+bVgbMI9dmI2pnUL4xE
	zKcNkuL0OIejC7sEmTHktaHNquCFzm
X-Google-Smtp-Source: AGHT+IEh8hqrObKFRcYoPrCQ8LH4Rxiy1iC+m+2acWh6UUzGQ49EjL4Hn98bgUTRzh6t+JA+wCUE7v3W4XmP7GAoOX8=
X-Received: by 2002:ac2:5684:0:b0:541:3587:9d4d with SMTP id
 2adb3069b0e04-543e4bdff79mr2319914e87.7.1738233070779; Thu, 30 Jan 2025
 02:31:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250129155525.663780-1-koichiro.den@canonical.com>
In-Reply-To: <20250129155525.663780-1-koichiro.den@canonical.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 30 Jan 2025 11:30:59 +0100
X-Gm-Features: AWEUYZk2VCsJtEXY66vJf4lsD4njZouIxnamAhapnXUzu5fb-7-6SCXmExQ5ics
Message-ID: <CAMRc=Mdim2aSBs+JsL8dECfG0Vvrvcq6CHaGHbBoVhNhSZn9Kg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] Introduce configfs-based interface for gpio-aggregator
To: Koichiro Den <koichiro.den@canonical.com>
Cc: linux-gpio@vger.kernel.org, geert+renesas@glider.be, 
	linus.walleij@linaro.org, maciej.borzecki@canonical.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 29, 2025 at 4:56=E2=80=AFPM Koichiro Den <koichiro.den@canonica=
l.com> wrote:
>
> This RFC patch series proposes adding a configfs-based interface to
> gpio-aggregator to address limitations in the existing 'new_device'
> interface.
>
> The existing 'new_device' interface has several limitations:
>
>   #1. No way to determine when GPIO aggregator creation is complete.
>   #2. No way to retrieve errors when creating a GPIO aggregator.
>   #3. No way to trace a GPIO line of an aggregator back to its
>       corresponding physical device.
>   #4. The 'new_device' echo does not indicate which virtual gpiochip.<N>
>       was created.
>   #5. No way to assign names to GPIO lines exported through an aggregator=
.
>
> Although issues #1 to #3 could technically be resolved easily without
> configfs, using configfs offers a streamlined, modern, and extensible
> approach, especially since gpio-sim and gpio-virtuser already utilize
> configfs.
>
> This RFC patch series includes two commits:
>
> * [PATCH 1/2] implements the configfs interface and resolves the above
>   issues:
>   - #1, Wait for probe completion using a platform bus notifier,
>         in the same manner as gpio-virtuser.
>   - #2, Introduce a 'live' attribute (like gpio-virtuser/gpio-sim),
>         returning -ENXIO when probe fails.
>   - #3, Structure configfs directories to clearly map virtual lines to
>         physical ones.
>   - #4, Add a read-only 'dev_name' attribute exposing the platform bus
>         device name.
>   - #5, Allow users to set custom line names via a 'name' attribute.
>
> * [PATCH 2/2] provides documentation on using the new interface.
>
>
> Koichiro Den (2):
>   gpio: aggregator: Introduce configfs interface
>   Documentation: gpio: document configfs interface for gpio-aggregator
>
>  .../admin-guide/gpio/gpio-aggregator.rst      |  86 +++
>  drivers/gpio/gpio-aggregator.c                | 673 +++++++++++++++++-
>  2 files changed, 757 insertions(+), 2 deletions(-)
>
> --
> 2.45.2
>

Hi!

I love the idea! In fact I think I floated it in a discussion with
Geert some time ago but never got around to working on it.

I just glanced at the code and it looks nice and clean. I'd love to
see some more improvements like using a common prefix for all internal
symbols but it can be addressed in a separate series.

I played a bit with the module and this is where I noticed some issues:

1. The sysfs interface must keep on working. The same command that
works with mainline, fails for me with your patch. There's no error
propagated to user-space, write() returns success and I only see:

gpio-aggregator.0: probe with driver gpio-aggregator failed with error -12

in the kernel log.

2. I couldn't verify that it's not the case already but the code does
not suggest it: IMO devices created with sysfs should appear in
configfs.

3. I don't think the user should need to specify the number of lines
to aggregate. That information should be automatically inferred from
the number of lineX attributes they created instead. Also: if I create
a line attribute without setting num_lines, the driver just crashes.
In fact it seems any discrepancy between the number of lines specified
and the naming convention of the line attribute causes a crash.

4. Writing 1 to live, when no lines to aggregate were specified, should fai=
l.

There's probably more but I haven't had a lot of time.

In short: I'm very much in favor of adding this but it will require some wo=
rk.

Thanks,
Bartosz

