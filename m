Return-Path: <linux-gpio+bounces-30769-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id C26B8D3C47B
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jan 2026 11:04:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2F38F563221
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jan 2026 09:47:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D67ED3D7D68;
	Tue, 20 Jan 2026 09:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X0H6qtHG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921C937F73F
	for <linux-gpio@vger.kernel.org>; Tue, 20 Jan 2026 09:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768902249; cv=none; b=WgBDWONBgtKDbOKoRg31tKn/2AwluG6k6A9A2yO+6QqU1GFujm9Z9DwpuCineZhY++dq4i4IVpxH6ow0tQJOReBSFSbFIg5r9cj3HkgGbHGH6R/QGNttE3IYKPjU9Cs8iKi/h+N1ClAVew6qIaBqbkob88+tcVNKxye26qtxZQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768902249; c=relaxed/simple;
	bh=MzhJ4TJTIhCH0zKb2utua0m4Nln1DRnFCX4uFZXOJbg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=leOHGZpixLz+qJz4HtC9GFvRtw9bWX2EuUneKHOU//lS3Pvt2a7ZuGlFUvuPLKf4G+esrRBrUKzW4lodsMqNIGnk+K6/vJhOatLGBMLBk07QDM8LhGlBk/5sgxzsnCZeJBmt4aUSKXuGC+RTXHZzKPagg9Wcu417O79acGE/Hyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X0H6qtHG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33211C19424
	for <linux-gpio@vger.kernel.org>; Tue, 20 Jan 2026 09:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768902249;
	bh=MzhJ4TJTIhCH0zKb2utua0m4Nln1DRnFCX4uFZXOJbg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=X0H6qtHG5kl+uhJX2vgPoRxxE7zM6IhzVnuWMShXWAs5LUYX4DB3bdacCNmWy/k4o
	 kWmU4zyoACoV+Fr4ox+7ngtUwZSHAgCh5Oird3Zp6q0sX6Olv7a/hUKUb9uVyrz3Ut
	 HDcIW5MSyu8/EFZvo87fjegUxI7Qr4rRuuBlpgJQ/SHEB4peBATv6ybMUGPJLiFVsb
	 AOoZlJCtRUe82p7tZTsh0BIQlHqkg0NyrVq3KvzWe0qv9WqfXgmr/4oCcQBvdkGHxV
	 dn18n3+Tpsufm9+XOg+SSQzWNHI1EKFEgNSDcyItb1PiX+tmUxTyoY20XyPLRsuTem
	 rJuMxs/7ofCWQ==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-59b6c905a46so5308012e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 20 Jan 2026 01:44:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUYncZwaslGsXtfTzdqnm3LIBVVvYbcuP500BlcCZ8yKqhafyx+4gpqsJFe9spSI5hCYEucrDcKrsYH@vger.kernel.org
X-Gm-Message-State: AOJu0YyNN/QqYj/6ASvz12eGSCAXORxFnVCMP4kvZbzKatIAzJ3iKiy4
	HCJ+ElYPGvLDM3kMyGxBCpFY2/FTml3bIaQJKRxuDP5lMRT/WdQS0b15+53h6Q8XTWz4OS0i0yO
	EGKuyHwJvK9r1Fo56yFnlpgIfr3AK203SI8fCpmPV8A==
X-Received: by 2002:ac2:4f14:0:b0:59b:7c78:a9c3 with SMTP id
 2adb3069b0e04-59baeebad7amr3951306e87.1.1768902247880; Tue, 20 Jan 2026
 01:44:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260116081036.352286-1-tzungbi@kernel.org> <20260116081036.352286-2-tzungbi@kernel.org>
 <20260116141356.GI961588@nvidia.com> <CAMRc=MfNHuTYsZJ+_RqPN1TtLOHsenv2neD5wvhA18NH6m7XjA@mail.gmail.com>
 <aW8E1i6L7-fhORFA@google.com>
In-Reply-To: <aW8E1i6L7-fhORFA@google.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 20 Jan 2026 10:43:55 +0100
X-Gmail-Original-Message-ID: <CAMRc=McNVLS3qs=ZSY8T=rNGwTd8amvFbz+mOcDZeiAV6Mw-UQ@mail.gmail.com>
X-Gm-Features: AZwV_QiCH_VHQCMm9eBe-2VB2mhwH6n8pi7RaQwW3k2VN6H-wpGYT844-9rfWL8
Message-ID: <CAMRc=McNVLS3qs=ZSY8T=rNGwTd8amvFbz+mOcDZeiAV6Mw-UQ@mail.gmail.com>
Subject: Re: [PATCH 01/23] gpiolib: Correct wrong kfree() usage for `kobj->name`
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Benson Leung <bleung@chromium.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Linus Walleij <linusw@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	chrome-platform@lists.linux.dev, linux-kselftest@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
	Dan Williams <dan.j.williams@intel.com>, linux-gpio@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 20, 2026 at 5:30=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org> =
wrote:
>
> Generally, I think we can try to move device_initialize() earlier in the
> function.  On error handling paths, just put_device() for it.  In the
> .release() callback, free the resource iff it has initialized.
>
> > In theory yes but you wouldn't be the first one to attempt to improve
> > it. This code is very brittle when it comes to GPIO chips that need to
> > be initialized very early into the boot process. I'm talking old
> > drivers in arch which call this function without even an associated
> > parent struct device. When I'm looking at it now, it does seem
> > possible to call device_initialize() early but whether that will work
> > correctly for all existing users is a bigger question.
>
> FWIW: found a very early stage calling path when I was investigating
> `gpiolib_initialized`: start_kernel() -> init_IRQ() -> dove_init_irq() ->
> orion_gpio_init() -> gpiochip_add_data() -> gpiochip_add_data_with_key().
>
> Prior to aab5c6f20023 ("gpio: set device type for GPIO chips"),
> device_initialize() is also called in gpiochip_add_data_with_key().  It
> seems to me it's possible to move it back to gpiochip_add_data_with_key()
> as 03/23 does, and move it earlier in the function.

Sounds good, let's try it next cycle!

Tzung-Bi: please make it a change separate from the wider Revocable
series for GPIO.

Bart

