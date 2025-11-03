Return-Path: <linux-gpio+bounces-27958-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DB58AC2B2E7
	for <lists+linux-gpio@lfdr.de>; Mon, 03 Nov 2025 11:57:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C91CE3BA587
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Nov 2025 10:53:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 916AE301036;
	Mon,  3 Nov 2025 10:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="UCIvXGY4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCCA73002DD
	for <linux-gpio@vger.kernel.org>; Mon,  3 Nov 2025 10:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762167205; cv=none; b=GYRp2hM1dmcb7q+N6hIlnukNx0aXc3S8EIB00DcNQ0p5bfNlil17beI2vsFPN4lKIFta4Zafmv7WbQOofv8px5g8yPseeeoA6wiu2+FYqHr0pkWpCITvxO5N+Nvm1pUoidZ2/RxNF3RHd9Ce7MiGlEBsftZJSqd9CaJlaIj3F8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762167205; c=relaxed/simple;
	bh=EY4jDPbNPmr5PzA9GSYwh54Yw35fl5rlzQYnUs6Iusk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fdPOqUAVpWqrECV7qnMUsGQr7x2GcseNwebCNc4DEGwZ5SV5nYxCIeVxz8Ti5zmFP7IijpgUfmR4c69Jz9sI4ITbox1XVOuUgB9KQ91CaSSpxxUl6RvFnCZkK2BOQ3Y4NHOrPfo//5H6uqxbVvgMpPDJqCzrfiP/HrVO4Hi3ps8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=UCIvXGY4; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-37a33b06028so10326461fa.2
        for <linux-gpio@vger.kernel.org>; Mon, 03 Nov 2025 02:53:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762167200; x=1762772000; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EY4jDPbNPmr5PzA9GSYwh54Yw35fl5rlzQYnUs6Iusk=;
        b=UCIvXGY42sups7C267nt135b6IGwZCedTHICPhayhHMPbplbJQj+iOC6BAtOb9Lj8E
         fhyks2qEOtJoDm+KKTNHfuL4jPTr6I5WF1m6tIkzroGPEVlg4JJSNfFGe1iMdFfLEuKo
         MybiOA76NyK7Y+ynd0E+ZbZJqO03HqinL/RyIhCzNYUd0CCL48SaVATHZDRPRfnWkBar
         0oCOvGC28fCNYArTetHEUb6A61qG0ym2cKVcMvlIn9ouVfqBOhnv6E4wVE1zef0IqAJW
         UERR+FbO8XOafCTeIRIQ906SuvwNCwL45ZBDbi14zEQyGp0MLFPjUcNqMUQLIEyUtlg+
         kCzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762167200; x=1762772000;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EY4jDPbNPmr5PzA9GSYwh54Yw35fl5rlzQYnUs6Iusk=;
        b=XQaB0o8gnt7hLNoz8LH79ovyOm2dvdNPdPxn96+qt3p/hkVJPm+mMY8uRVBnbd/lxR
         v4rBbo7mmnELkmQ8u1GW+2E0goXRPiaWFAQqhiBfC/FPPG36zHHUUFw+vSqfh8PgpSI1
         Z+9iPqiJjxdX5zzcAhatqNqNRnesE3p9T+dK7V/wESEND1XzOfkKcb16slozh1Fyfgdq
         AwI8e58CpDBacYsG8jZeo1fMYBPUgpnG477xe/QSc16wxtcLcSYnaILLDOufbRcBx/z1
         Nxj/JYFjFZydrk/Nlz9j4qAZz8nzoW3onRZcuF+xRunwbjBGMMfabnmgIi+nb14QWrnu
         p2Rg==
X-Forwarded-Encrypted: i=1; AJvYcCWRZfaS7/da6371FfVK0IrCUpmtU9vU6de+tpkDy/Hx3dA/lic3pyP4BEubAle7dd+1Ocd9NZ3+VmY0@vger.kernel.org
X-Gm-Message-State: AOJu0Yw72arGvLh5qjSo+4vD6EfDwdqHqZavq+DuQJBY1ia63jXFyQbf
	zIaT474DCSa4HMD+0qmwCT6FAIFEFdFjCqHnm3XvLd59PimgVYo6y1kajiyzTgtjS3X156M5Pt0
	sF9a4kfGfyPzVSO8ks+8SZ6pf2IcM7DTjeG9XoMHRJg==
X-Gm-Gg: ASbGncvQZ4qNw8RrIVM6BmK8aQoLuvwC+aPP8yMA4ekBabmIlxk2tHcOl1d0t1R2A03
	cIQMtLbBfu6Y+DDCHqN49MMCVmjQ95Y9c/ESjUb5hNDhn9PwRiidWPytvr/h0ATCPytOPw1N3Tm
	NNgsSYdqWcmo87obH9hg8HgqeEaTko9XaAsBcII4Zbgjq/xliWgFwtWn3+Y+CKnrpw0LADjtEkI
	DWM2FL+UZQ33RzOp2+HbG7aQ6cyXhiqMqFCJYGO/GZRsCizvmf+mMuiB9LPQQANPFpIjzdPrsYS
	V6Sohym0hEPXVeV/
X-Google-Smtp-Source: AGHT+IEShcGLq+8nFRRZ1S7fCAIIXDtScTJ8z36zHz5pLUhN35vmGlC0mMXVLA08DstbNEHUwTHKGlgAvk7gFq8+FWI=
X-Received: by 2002:a2e:9103:0:b0:36d:114b:52e2 with SMTP id
 38308e7fff4ca-37a18dd5390mr27978041fa.34.1762167199608; Mon, 03 Nov 2025
 02:53:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251103-reset-gpios-swnodes-v4-0-6461800b6775@linaro.org>
 <20251103-reset-gpios-swnodes-v4-4-6461800b6775@linaro.org> <aQh7JUeQ84WwUzW9@smile.fi.intel.com>
In-Reply-To: <aQh7JUeQ84WwUzW9@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 3 Nov 2025 11:53:08 +0100
X-Gm-Features: AWmQ_bkPWbySIvFJ536kZ_G3NlC3s3A6TPy9KXNNHgvuSGjsmX4rbxmg-1iSaYU
Message-ID: <CAMRc=MdpX+jHQWqFAgOuHB0E3Sdge92=vcjm=xcS4Asqm8_3Xg@mail.gmail.com>
Subject: Re: [PATCH v4 04/10] gpio: swnode: don't use the swnode's name as the
 key for GPIO lookup
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Krzysztof Kozlowski <krzk@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-acpi@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 3, 2025 at 10:51=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Nov 03, 2025 at 10:35:24AM +0100, Bartosz Golaszewski wrote:
> >
> > Looking up a GPIO controller by label that is the name of the software
> > node is wonky at best - the GPIO controller driver is free to set
> > a different label than the name of its firmware node. We're already bei=
ng
> > passed a firmware node handle attached to the GPIO device to
> > swnode_get_gpio_device() so use it instead for a more precise lookup.
>
> Sounds to me like a ready-to-go patch and even maybe with a Fixes tags, b=
ut
> it's up to you. So, why not apply it so we have less churn in the next ve=
rsion
> of the series?
>

Yeah, makes sense.

Fixes: e7f9ff5dc90c ("gpiolib: add support for software nodes")

