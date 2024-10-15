Return-Path: <linux-gpio+bounces-11370-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ED89C99F46B
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 19:53:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A47AA1F24F98
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 17:53:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 076D41FAEF4;
	Tue, 15 Oct 2024 17:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="puJ2g3Ox"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA21D16EBE8
	for <linux-gpio@vger.kernel.org>; Tue, 15 Oct 2024 17:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729014788; cv=none; b=dvzBi7lfpEOCF9WfNm+wRKVtOHmK7gkdVXebih+EY7PQBgGHMQGv8r32Kj8xSQIMRyCRL2b8wsj9yZw+DgbJ2YTTGne+C8EbQbJcHcYgPy+pOvJ127M9nR1oV2SedVj0A/PC2VVQr9M6Q0FQml6Sp7yVjYHHCQWTiIEfOA6VGPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729014788; c=relaxed/simple;
	bh=ZDV08loxaQihu2g9FFlAm3cd7K95Y97y/FM7hcUWpDY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ea2ilHI06vB7Nc7f8o2fXJhxeTn8CplFf7U/dqwW/agl22G5mrvcYmu0cteOgk3WtfNNsIj8QXuMw6kT/gBxngk5XwEMtLPbvzMl1H/cJFDBtCoOwDjZqaXdUWQj2BlJHTcjaeQl/EQikPhNUxNrTyGVZia5Ra1RxTMfMEx5r3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=puJ2g3Ox; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-539f2b95775so3264262e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 15 Oct 2024 10:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1729014785; x=1729619585; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T89cnhVXpmzBLJ+gVGC1Jh39UwJsqGJsZMY4/oWn65k=;
        b=puJ2g3OxbiEBXj7A9ecnMZJTTxCHePU6t8dzvWTDywnt3xNDK7p98OQBB7FSTg7TI2
         0cQ3ga3wg9Jl8oLgiZ9IaRm3i1Ns/uOljmOmNfcVIpSeUy7s3R7pxLs4ZU+7B6r2L+go
         JH/sPW9xuBSPrrYjS9RJGJcS5fw+QCr8tshWrB056CVvLIi1qaAD7cQnA/hiJumEKLwn
         rVtvPV48xcV5Bp4WtLpbvVav9Ajy+JY8k2iMO+/Z5ob5MpBhj8eMZoEs6aTzpyYVCiNd
         4u3V9m/DLMQZgG2JgExQ121Vh/Lfz7ZNmJ9OO6exshURhUiuJFevT9Dpw70+YfJOcWt0
         X58Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729014785; x=1729619585;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T89cnhVXpmzBLJ+gVGC1Jh39UwJsqGJsZMY4/oWn65k=;
        b=HFXs7ccavkVB+F+AnN9s3DBNoNIQkS+aGSgne8cY7LCKsstcsTbWC+TGgkM1SBMOBI
         N8S+aNjQLxWBjHa3SQmCOsK3phaPQkZc5PQGODlwweKZA+bEzScCwDaehZJfDUJrQrzg
         c5xaoMzBHONqIn9lvEZZ9SUZKuBTEB7nJwEhZSo0VwSf4McGruaZ415f5K7xdemATlkJ
         S50LvviVYMFo+J0DU3EfpgDMI/sdj5KAxdg+UFJEzkG/8YJ8iEL0k4FcU7RntzcJMW6S
         eZIBtWoKfoRJOagfIK0qcumj3zfA347IBwrh12uovEakNaF8Md/f692nHovzJ10ZEkNX
         ndJA==
X-Forwarded-Encrypted: i=1; AJvYcCWRlMHzpxJnsvLay/qtkGHS+kyqqfkDFRy4SiL9T2IlKJOUHxbgEfGvZdeDT1T5W02mnAvan/jnzdtE@vger.kernel.org
X-Gm-Message-State: AOJu0YzpUClqLnY94I+wnvYrk46OdlhbyZ/wsPFIMdB4jBN67J7qdNXc
	OsEJhWCvm69lHp15qZQhBsR8x6f2UIvhvOdU4Amcl7zu63poolnqYjXZ04xYcO17Ydq5AVYSxF2
	iZbSJXODNx3mbHtdoiT6YYB2s5P2adLDOrdcY1w==
X-Google-Smtp-Source: AGHT+IE9R57vGa0ecL3E8nCkWuB7n77IJekoUVtIjtZX8wKqh06ttttEVBmaAHJYLybzGJ8rO4JPFG3phj94rNdbHZQ=
X-Received: by 2002:a05:6512:3083:b0:535:6951:9e1c with SMTP id
 2adb3069b0e04-539e54e7122mr8103299e87.15.1729014784773; Tue, 15 Oct 2024
 10:53:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241015-gpio-class-mountpoint-v2-0-7709301876ef@linaro.org>
 <2024101531-lazy-recollect-6cbe@gregkh> <CAMRc=Mea=W-1UoHMew3Si=baW3ayERrHjxjG0NPdmkCfp9dUHw@mail.gmail.com>
 <2024101535-wrangle-reoccupy-5ece@gregkh>
In-Reply-To: <2024101535-wrangle-reoccupy-5ece@gregkh>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 15 Oct 2024 19:52:53 +0200
Message-ID: <CAMRc=MdsXggB9TUK-Rxt1GLZ9OA+3FskD1q3BM8TGbOhqmhXjg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] gpio: create the /sys/class/gpio mount point with
 GPIO_SYSFS disabled
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Kent Gibson <warthog618@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 15, 2024 at 2:46=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Oct 15, 2024 at 02:11:45PM +0200, Bartosz Golaszewski wrote:
> > On Tue, Oct 15, 2024 at 11:30=E2=80=AFAM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > >
> > > > Despite providing a number of user-space tools making using the GPI=
O
> > > > character device easier, it's become clear that some users just pre=
fer
> > > > how the sysfs interface works and want to keep using it. Unless we =
can
> > > > provide a drop-in replacement, they will protest any attempts at
> > > > removing it from the kernel. As the GPIO sysfs module is the main u=
ser
> > > > of the global GPIO numberspace, we will not be able to remove it fr=
om
> > > > the kernel either.
> > >
> > > They should protest it's removal, and you should support it for forev=
er,
> > > as that's the api that they rely on and you need to handle.  That's t=
he
> > > joy of kernel development, you can't drop support for stuff people re=
ly
> > > on, sorry.
> > >
> >
> > Yet every now and then some clearly bad decisions from the past are
> > amended by removing support for older interfaces. I'm not trying to
> > deprive people of something they rely on, I'm trying to provide a
> > drop-in replacement in user-space using an existing, better kernel
> > interface, so that we can get rid of the old one and - in the process
> > - improve the entire in-kernel GPIO support.
>
> How is emulating the existing sysfs api anything "better"?  It's still
> the same api.
>

The existence of the sysfs API in the kernel makes us stick to some
sub-optimal design decisions (like the global GPIO numberspace) that
we'll be able to entirely remove once sysfs is gone. We want people to
use the GPIO character device and if it takes a layer emulating the
old API on top of it to make them switch then it's still better than
keeping the API in the kernel.

> > > Sorry, just live with the kernel code please.  Work to get all usersp=
ace
> > > moved off of it if you feel it is so bad, and only then can you remov=
e
> > > it.
> > >
> >
> > What if we just add a Kconfig option allowing to disable the sysfs
> > attributes inside /sys/class/gpio but keep the directory? It's not
> > like it's a new one, it's already there as a baked in interface.
>
> That's up to you, but again, please do not mount a filesystem there,
> that's going to cause nothing but problems in the end (like debugfs and
> tracefs and configfs do all the time when people get confused and start
> poking around in sysfs code looking for the logic involved in other
> places.)
>

Oh, I would never do it! I hope no user-space program ever comes up
with a crazy idea like that! :)

Bart

