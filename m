Return-Path: <linux-gpio+bounces-1868-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A069381EF87
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Dec 2023 15:46:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 05614B215A2
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Dec 2023 14:46:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F89945943;
	Wed, 27 Dec 2023 14:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="QVlF2r+o"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E224502B
	for <linux-gpio@vger.kernel.org>; Wed, 27 Dec 2023 14:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-4672008b2c7so585363137.0
        for <linux-gpio@vger.kernel.org>; Wed, 27 Dec 2023 06:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1703688405; x=1704293205; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d4Y7smc2pkp/vBMB9fXvY7F4m1V5SMuNQGmvZZc5JqI=;
        b=QVlF2r+ohzHZoMFe5gR8TKTwiO2FO0dzVtIOL3Koug4CDsIH+Cm+bxd0z2Hl3Q+Djq
         qx/2v5KDaGrxiJbOfrxXzrdWNW4n6mKWfMEczvXdecMxHfccVRKoatg959TI3fhb5VEh
         pokcvfRNSwuQpp+/Lqnq/fs2JVJU6wH/fhvBIO3syjMTg/k6naZcWGZrWvGArpmWf+U6
         PEOprLeL6sWnl6hkaZyBQKuaWna+IxoCwlqsKbj7AuvymZbBB2gd1+R4Dk+SKtA3K/Dr
         Ez9uRAk1qjTIQmcibGoPMUrapZbWK0vEZ6lld054r2JRTCw2QusNLeWC9YSiod4UkPR/
         gjCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703688405; x=1704293205;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d4Y7smc2pkp/vBMB9fXvY7F4m1V5SMuNQGmvZZc5JqI=;
        b=aYIqzdFiVfuhGRCC2wLrOnfWXRSQqNICSjW1yveSW9l9iVb0YSt4vqjo1fwGax8bHg
         hLPz+YedVHPTP0gdvqGb7Nl+cAVUqTu4CzKPr4nutZtWqsaptraDdk1XgeWgtX0wcNVt
         0y3tyYL15Xyzw1qlXTznJO0BGmHXoMyVmZ86GNbgfGH7KaNyrlJWJDIsYOx8+fGVN1mG
         tfiU9Odw4pcRK3Z+A9mYUG8s/oeWniDtbaNsGjoLL61MVg9YMxmq+uAnXIIKyBHFILu0
         DIPtkhOoniUpT6x1xH6qTQQdaxZM4YU6PDX4K1N01B3vso9hy3mcZx1A00vSPsGW/m38
         1wYA==
X-Gm-Message-State: AOJu0YyS8OgKbZo82QU7SieryHjDu2WLPyIqjsVLDjGJM/yo693fLDD9
	GR6MRbxfKLacYzXfKrSTr6n1b9qQEjX4mkn8osH4SreVTjasyw==
X-Google-Smtp-Source: AGHT+IFS7xecxURZcVbt+I2hL4uy6bzPQc50FajzGNELsuDtJen9mfaWyBsIUZXoWWC8uZY2zDhd2CiNCF/4WaOtqhA=
X-Received: by 2002:a67:f543:0:b0:466:fb17:bad2 with SMTP id
 z3-20020a67f543000000b00466fb17bad2mr2641352vsn.28.1703688405139; Wed, 27 Dec
 2023 06:46:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231221012040.17763-1-warthog618@gmail.com>
In-Reply-To: <20231221012040.17763-1-warthog618@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 27 Dec 2023 15:46:34 +0100
Message-ID: <CAMRc=Mcg6sT0w4Dfn5MhWcLxUjvJV4rT-Pfoe-fYDe5JhYMpig@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] gpiolib: cdev: guard tidying
To: Kent Gibson <warthog618@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linus.walleij@linaro.org, andy@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 21, 2023 at 2:20=E2=80=AFAM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> This series contains some tidying up of gpiolib-cdev following the
> recent adoption of guard().
>
> The first patch is a fix to protect gpio_ioctl() from having the
> gpio chip removed while the ioctl is in progress.
>
> The next couple of patches are minor fixes inspired by recent
> submissions and reviews for gpiolib.c.
>
> Patch 2 adds a missing include.
>
> Patch 3 switches allocation of struct linereq from kzalloc() to
> kvzalloc() as it can be larger than one page - even more so after the
> recent relocation of debounce_period_us.
>
> The final two patches replace wrapper functions with guards.
>
> Patch 4 tidies up the functions that use a guard on the linereq
> config_mutex.
>
> Patch 5 tidies up the functions that use a guard on the gpio_device.
>
> Changes v1 -> v2:
>  - add patch 1 to protect gpio_ioctl() from chip removal
>  - improve commit comment (patch 3)
>  - use guard(rwsem_read) rather than rolling our own (patch 5)
>
> Cheers,
> Kent.
>
> Kent Gibson (5):
>   gpiolib: cdev: add gpio_device locking wrapper around gpio_ioctl()
>   gpiolib: cdev: include overflow.h
>   gpiolib: cdev: allocate linereq using kvzalloc()
>   gpiolib: cdev: replace locking wrappers for config_mutex with guards
>   gpiolib: cdev: replace locking wrappers for gpio_device with guards
>
>  drivers/gpio/gpiolib-cdev.c | 257 ++++++++++--------------------------
>  1 file changed, 70 insertions(+), 187 deletions(-)
>
> --
> 2.39.2
>

I applied the remaining patches, thanks.

Bart

