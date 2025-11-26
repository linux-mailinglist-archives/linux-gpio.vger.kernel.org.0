Return-Path: <linux-gpio+bounces-29087-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id DA683C8A5EF
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Nov 2025 15:39:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5CC0134C1F5
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Nov 2025 14:39:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFEFF303A07;
	Wed, 26 Nov 2025 14:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Tf/JRJNR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA617302CB2
	for <linux-gpio@vger.kernel.org>; Wed, 26 Nov 2025 14:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764167948; cv=none; b=oXUf/k+IFhh/5unRBvvhFFCRRj/pdrUGPaE3bWPqTWjAo+hI72K+vsfHVxUIs78oMeIO6O0dt4r4L95io6HrcyKJ0K2YahKIsExM18Z+gWAONzrBlvukLkfmtHvCrBXnJBzyYJjlBh3aEx+dxdwiEnwF+ZsaiQQpfJv3lBXsdCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764167948; c=relaxed/simple;
	bh=yacBvBYaVY4CpdxU2ivpOumvrEreuCR9cSgT0Y23MFk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=te/u3HBtQcvawqaKbVNcvpux46Mw/5oLIySUbhpH+QL7VnytcowcNVqX0Iai77beWAIYbgxTezPmIZ4VxkVt2U3iCv8BCXjG3qRjJc9M0rAlcemC6q+2ZGIo91kPRtCCZBhYJozd3HSXfKvCEzMwtjKfgQlBGhXqDdxF6YfhEIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Tf/JRJNR; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5958931c9c7so8545566e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 26 Nov 2025 06:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1764167945; x=1764772745; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=msBAMbzCaK4P9BYCopufCeh+uY8BrlUveStybrFmxj8=;
        b=Tf/JRJNRdXPW5HiFOnFMm9tk6W6KiDV+cubTpuySsP8E2lbH+kuF9Oh+Sihe0gvciX
         Wxc4PGj8WRr3gtQ2yhu7Ie5k1rzi9etojhLNEmqeWZIlZnReZnozgcVnRuDggAaBr10i
         uUy/YVScj6RO89kxye1qyGWHuDQNvfe/ZB7VAkkZO40P/bqoUiHtorzaRMsBaIbtVssR
         cLbiWyEYhOy1bnmlGCe/70lVNhl8RfAnHnCmuOl+K8ld4WZpbBbLkCwwJ1mw+dzJNFnY
         VEqMjDEstTB4B2+tmt0sUZ/HJWjQLBSEF+zBRV1wPI3Euagn0STQz5BaBF6XTwJLSdrs
         rAkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764167945; x=1764772745;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=msBAMbzCaK4P9BYCopufCeh+uY8BrlUveStybrFmxj8=;
        b=BFC/J8x9nYEN5q2w1TlxwdwFvtf7VdaMgNpmDp2nYpVonwT/WSlTqQia7bHjyf/ehV
         fedR+z6jIzVNqvJOnRAc5IPUPcyIGSNj73fROUFddmwgzHzs5s6mRD1vfsmxXNzQHKPL
         FPYui6MyKCdOw9cbxrXiSKZWpe5hse4psR+dXS8yji3arCzYZYJmPXYAZPLHyBgLFvbb
         7RQadL2Paz3ZsocebkLCMJ+Uh01BEsndHfSqvivBIX2+iHDcSfMHPGxlBB09Mm0xXHy3
         3qW3m37oav6Stymk36Zqa1Q43D5NYzcO643q4cmIXB1B7AVTpLpGfzTT8Ga7Tuo0LLTS
         5DIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhmwAylfz/qRAjnmQmTxnB/ajiyb4QzDVJyhryhxaX5coG63eB3bviNW02uKDCHSnP3023reWoIzTn@vger.kernel.org
X-Gm-Message-State: AOJu0YzW7rhexRoYOtz7ZtTpuuFc5FAlzPPnwcXVzU+LB4Ze2PTYbfet
	Gd7BqOcMSxwPKtywRqfAC65tnDUjy7dogmB2w/mm5h/XdyzoIS9kulAYqja03zNIgi0F1T00UrX
	N94E+trm+qJAITXPevjYvg2u5czN+vcjclmqus+3xWA==
X-Gm-Gg: ASbGncsEZWoQsE7t8qPqEmc9zjbaF4O0ar/JM1QQdtnKYI2stySNBVNfPKXlDF/OStq
	uuhFH3DVZ+/YLekO+emEOYoYTcMO68gzWeu5Jm4+4by6FsgPBi28+5Fd5vP2S31uJ6XWDVmJSia
	25hGgtkrxKaJaPvEtPmImyi3Zypz3Na4uYO1embjne7owwJWdYxRdyYfvszmTYO98OWV53QM1eu
	C3uu1jiP9BNjEb0SRutSKuShTE6o1SLF55Szc/Soh8O3NBc4CNvJ/tBVBRP4j1+vo1u32+nEbeY
	Og4ODtmPIjLPBRg5TMgYqS/ts2o=
X-Google-Smtp-Source: AGHT+IFDxRVt50Oa/O/Cj0BOmm4XYwCMA0ik9gwSJjdf5XFhmE6eJiaVMJCla8GLSwR5pSXLEUBXG1Du99AsBWpILQY=
X-Received: by 2002:a05:6512:304e:b0:595:8052:110f with SMTP id
 2adb3069b0e04-596b4e529b0mr2876479e87.6.1764167945036; Wed, 26 Nov 2025
 06:39:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251126122219.25729-1-brgl@bgdev.pl> <gy6ycgcld2moccjjl7x7h72riwfm4ymhnkhlgau53fl4eu3e6q@qp5lrwx57jin>
In-Reply-To: <gy6ycgcld2moccjjl7x7h72riwfm4ymhnkhlgau53fl4eu3e6q@qp5lrwx57jin>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 26 Nov 2025 15:38:53 +0100
X-Gm-Features: AWmQ_blncx36kZC3fH6WyyuMqAepzKDyy1dWzU4Yz0s9JWV27nROSI0p6FrG_AU
Message-ID: <CAMRc=MdXXNaMVK5q+yNSZcLjjoQLwPmDnMW90gGK+uk77F+3ZQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: lpass-lpi: mark the GPIO controller as sleeping
To: Bjorn Andersson <andersson@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Srinivas Kandagatla <srini@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, stable@vger.kernel.org, 
	Val Packett <val@packett.cool>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 26, 2025 at 3:35=E2=80=AFPM Bjorn Andersson <andersson@kernel.o=
rg> wrote:
>
> On Wed, Nov 26, 2025 at 01:22:19PM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > The gpio_chip settings in this driver say the controller can't sleep
> > but it actually uses a mutex for synchronization. This triggers the
> > following BUG():
> >
> > [    9.233659] BUG: sleeping function called from invalid context at ke=
rnel/locking/mutex.c:281
> > [    9.233665] in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 5=
54, name: (udev-worker)
> > [    9.233669] preempt_count: 1, expected: 0
> > [    9.233673] RCU nest depth: 0, expected: 0
> > [    9.233688] Tainted: [W]=3DWARN
> > [    9.233690] Hardware name: Dell Inc. Latitude 7455/0FK7MX, BIOS 2.10=
.1 05/20/2025
> > [    9.233694] Call trace:
> > [    9.233696]  show_stack+0x24/0x38 (C)
> > [    9.233709]  dump_stack_lvl+0x40/0x88
> > [    9.233716]  dump_stack+0x18/0x24
> > [    9.233722]  __might_resched+0x148/0x160
> > [    9.233731]  __might_sleep+0x38/0x98
> > [    9.233736]  mutex_lock+0x30/0xd8
>
> As far as I can see, this mutex only protects mmio accesses.
>
> Is it preferable to mark the gpio chip can_sleep over replacing the
> mutex with a non-sleep lock?
>

I'd say let's do this as a fix and convert the driver to non-sleeping
with a spinlock next cycle?

Bart

> >
> > Mark the controller as sleeping.
> >
> > Fixes: 6e261d1090d6 ("pinctrl: qcom: Add sm8250 lpass lpi pinctrl drive=
r")
> > Cc: stable@vger.kernel.org
> > Reported-by: Val Packett <val@packett.cool>
> > Closes: https://lore.kernel.org/all/98c0f185-b0e0-49ea-896c-f3972dd011c=
a@packett.cool/
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> If we stick to the mutex, the patch LGTM
>
> Reviewed-by: Bjorn Andersson <andersson@kernel.org>
>

