Return-Path: <linux-gpio+bounces-11360-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 51EDA99E922
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 14:13:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C902B1F24316
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 12:13:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D83B71F8929;
	Tue, 15 Oct 2024 12:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="3YfhHbhJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD981F7070
	for <linux-gpio@vger.kernel.org>; Tue, 15 Oct 2024 12:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728994321; cv=none; b=X1uUia4o2tT3S+G1sVk6ZKBIey68aVY0pqipolSCq1qgQnscmknOrN6c0W5fBgOhvsGrXzNkEck6MWzYMRnNgPzNijFxBEZqDnERxxRaONY+BZ/tVzCrqkSO+AFaPbkTLjUkWbPM3QNi6mx4sKmLJxrhNxL8byalFUeEQzgC1e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728994321; c=relaxed/simple;
	bh=8zIccEYw0HDDponWN1yKlTjy1Je4vEQHoACjdwCtSo8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aX2Tr+S3qc+U2zWydPOFIhj+R2TYkXTLFfpKCm5Jl3WTWmIo/Gj76bMMNBguwDjwqELV3mZqP11LD2NpaZEe1VhGAcnFMFF+ZIrO3C3ro2sI4f7WDd4L7Xj1MCqwZsM6Ui/flwp5V9vIJ6jaTfs5FWsAl3i0rq91axc3qM8w4mU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=3YfhHbhJ; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2fb5638dd57so16587941fa.0
        for <linux-gpio@vger.kernel.org>; Tue, 15 Oct 2024 05:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728994318; x=1729599118; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IjzNejjc8uMTb65x7eVvX78L+rqya5jaiCIr7Q23w2s=;
        b=3YfhHbhJmevYr9vSZaMSJ4HOXH8zjaq/pdEl7fxGxxU1ZS76pQ2eTwtPO2dX/CNyYE
         lq9t/8U3RMH/AndLs7dNQeiKEfDvRu9X3Z9MgIjao3TRwnh+qlFIbFcIGZsuAqkBe7az
         BJNtHTkYPOEqZNNfZv2rCwkmi0/bCOZKKvUR5wxzjW9X47y7sO2gA/Pj8/I/fRdN7ezh
         i8u3yl2PX3eZEybQry1I1u+2yQfvtub24vxZe0EbuvGp4G/vAy2uWKu93o0waNXZ0Htc
         muvSfBjLBOf2dtUxTWt8pOgdC0VZEpLZPTSxUwILAbKwz+WqVMg+YzqN++SHWxgxoouI
         07Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728994318; x=1729599118;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IjzNejjc8uMTb65x7eVvX78L+rqya5jaiCIr7Q23w2s=;
        b=DrAXq2hKF7wGeFaJP/QJidOvXkORggtSd7y/Oq+Cw2mC2dDpngexqfJbT/P7e37nyu
         t6amxDyQKJRGWzSdwMBOHXdoXOrbwwokwqHTDwVwzb8o2ohJyCKB1RULHIV2FruhfjuA
         CmkgrHWCed/yZSMANpDcODlC3DgeM0F/G9z9cM1dLpLKWqBOg8+vG6Fj/vALOjpSX2/p
         u5n4N+hGFpmMBWl1zRZNbuZOXWiXtLjiK57iUzsflInd7T8dimmzT0tkE2F15HlKVhEI
         kWF3IZIUcGt5hv8CGSi29p5efVxITeLCyBVDS8z185+a6nrbPx1/MHrgvLv7lfxmNyDf
         GB6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVEe9Tk2OUap6hvynhApSxkzlzilwM35hDw73xRnQ1Oe1HcFR2Nmj2sGc1NL4CacIfEzYw2URBcQbgg@vger.kernel.org
X-Gm-Message-State: AOJu0YxtBwNq6L/9PN914NtCS6D6RscqnOgp3Dbys7gJPhDVstiGIolM
	7YRPjjJhv/f/f6KmrUYd1DdZYS6ln2rj2OQciF/ay4Lb9JZqTxmFypGKeA6W322AsOoNex+Nvfr
	cI0qeFZBTHxObWEegIbZuVHAML6K+BV++jnWktQ==
X-Google-Smtp-Source: AGHT+IGCdmgQhJiJc3Pv4ag27yUFq+XrKOxrSkpiY8WuueWufk5SKWUm5l2IToBOGk468RZoxIPfznolraRhOqVWbzA=
X-Received: by 2002:a05:651c:1502:b0:2fb:5ac6:90ef with SMTP id
 38308e7fff4ca-2fb61b45d02mr2112031fa.11.1728994317861; Tue, 15 Oct 2024
 05:11:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241015-gpio-class-mountpoint-v2-0-7709301876ef@linaro.org> <2024101531-lazy-recollect-6cbe@gregkh>
In-Reply-To: <2024101531-lazy-recollect-6cbe@gregkh>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 15 Oct 2024 14:11:45 +0200
Message-ID: <CAMRc=Mea=W-1UoHMew3Si=baW3ayERrHjxjG0NPdmkCfp9dUHw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] gpio: create the /sys/class/gpio mount point with
 GPIO_SYSFS disabled
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Kent Gibson <warthog618@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 15, 2024 at 11:30=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> >
> > Despite providing a number of user-space tools making using the GPIO
> > character device easier, it's become clear that some users just prefer
> > how the sysfs interface works and want to keep using it. Unless we can
> > provide a drop-in replacement, they will protest any attempts at
> > removing it from the kernel. As the GPIO sysfs module is the main user
> > of the global GPIO numberspace, we will not be able to remove it from
> > the kernel either.
>
> They should protest it's removal, and you should support it for forever,
> as that's the api that they rely on and you need to handle.  That's the
> joy of kernel development, you can't drop support for stuff people rely
> on, sorry.
>

Yet every now and then some clearly bad decisions from the past are
amended by removing support for older interfaces. I'm not trying to
deprive people of something they rely on, I'm trying to provide a
drop-in replacement in user-space using an existing, better kernel
interface, so that we can get rid of the old one and - in the process
- improve the entire in-kernel GPIO support.

> > I am working on a FUSE-based libgpiod-to-sysfs compatibility layer that
> > could replace the in-kernel sysfs and keep all the user-space programs
> > running but in order to keep it fully compatible, we need to be able to
> > mount it at /sys/class/gpio. We can't create directories in sysfs from
> > user-space and with GPIO_SYSFS disabled, the directory is simply not
> > there.
>
> Ick, no, just keep the kernel stuff please.
>

Ick? I'm not sure how to take it but are you criticising the idea
itself of using the better kernel interface to provide a thin
compatibility layer in user-space to the bad one that people are just
too used to to spend time converting? Or just the mounting at the old
mount-point part?

> > I would like to do what we already do for /sys/kernel/debug,
> > /sys/kernel/config, etc. and create an always-empty mount point at
> > /sys/class/gpio. To that end, I need the address of the /sys/class
> > kobject and the first patch in this series exports it.
>
> No, debug and config are different, they are not "fake" subsystems, they
> are totally different interfaces and as such, can use those locations as
> mount points for their in-kernel filesystem interfaces.  You are wanting
> a random userspace mount point, that's totally different.
>
> Sorry, just live with the kernel code please.  Work to get all userspace
> moved off of it if you feel it is so bad, and only then can you remove
> it.
>

What if we just add a Kconfig option allowing to disable the sysfs
attributes inside /sys/class/gpio but keep the directory? It's not
like it's a new one, it's already there as a baked in interface.

Bart

