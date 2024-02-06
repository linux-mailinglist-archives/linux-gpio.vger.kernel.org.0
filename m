Return-Path: <linux-gpio+bounces-3029-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3A084B63F
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Feb 2024 14:23:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8AF1228242E
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Feb 2024 13:23:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40F56130AF2;
	Tue,  6 Feb 2024 13:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="keOSbC89"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E78312EBD6
	for <linux-gpio@vger.kernel.org>; Tue,  6 Feb 2024 13:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707225829; cv=none; b=m5oA5j5yO7oTUdxovsml8+imDErP7rQWJAOq+VChTVovfDbe42xU1W4PIT8Xy+gW/pWN8qR6LmqZldD8mBsTF6jwvjD98joCp8YE/85RtZ3yWkGGqqeDz0Q/yWXSiNAVY2NZju40eMujfrhO+zZ1GWtsWcLgNILvEEiexjPWVL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707225829; c=relaxed/simple;
	bh=C7dF9Kb/M7oo++UGWBOq24DK/bRowbcDwdnj5Bd6lDo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ptx8C2Yu1HUXpVS3A5BLPCJzJIfgoTtJbGb5gNueq7pQJmn7J9Scs2awc69hMWXuv3fcP4RFrZQsJVvDyLIxJfedoRtotth1EYvsZfXDERT8D4k2Clgj2p8x08i3VNmhKXeM+XKKK7uQxt9JItUkFmLAW51uApl5H76r4Ou+6n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=keOSbC89; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-7d60ee03b54so1808259241.2
        for <linux-gpio@vger.kernel.org>; Tue, 06 Feb 2024 05:23:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1707225826; x=1707830626; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rw/8aAJbgg9bRKID3FMilIWSyurBwHhJJPiR7i3XuPc=;
        b=keOSbC8900wIbgqj4IsNcYOyo2/7pVWcIaRMU1pxnUIAaEbn8oPUbr+UAKR3MbOUSx
         xud7k7DD/lrLQJSg6em9R7YYl7qzh6SUdAO/Pa4s7XnLsLAdRX+R67WdV6AfqhU9t120
         LYn9FAEpUKlaz1870PbXBbRt4Ut/gP4exql9TxAqphuUfkgS4qF8tpiPPt81A9aWJESB
         Rh7iCPAuiiE6wKa5yj0r9+r5ZUfD0lSH8myaRLN9QSgBgowkxET52w4zCg9o3ma4O2P7
         /w85I5VBbQkM6EQkZrIKm40QbPEhM2GXRq9PHzCkByrQYQxBSqfK3jVLBicAunakwkBT
         wFRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707225826; x=1707830626;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rw/8aAJbgg9bRKID3FMilIWSyurBwHhJJPiR7i3XuPc=;
        b=o/w/gqoDrwhicBx3sXPW/Ki1jyTt7j6Pr9ijxKxH4yQs8cE+oNzbpmn45Z03cLJDGT
         i2xYBUYdy/SFSiNkxVjtBRGyo6+3f6XiSMDlIBcpfWKL7c7FkJT3GQ44gq9QxPDKDu8F
         IqW4iwsBjo4dOuLLBnR+1sGK+mZ35KNP0geobcbb5AmMtU5TblAiepT6ZIrlBv936ZLO
         r/9Nt42VgY4kfpm3VbK9edLpc/aI7wJOS19DLs5ZVgFTR8kUA2Kozz61F1PHdTicDLHH
         k1oUhIgrW9WwzOMF7f/WkYlnthSGjG2y19z/MOeAdCxw65xP+HRKdNnQI3p0zoTfWVQb
         c0Lg==
X-Gm-Message-State: AOJu0Yyn3gdQAY6hV/BO8fvsca0eEewk16cT1CTzdc4kkx+wrvjgM6NN
	OimDsptnX9bTSQ1URcmLb1a65vEL57RGetJv8bCJOINk6pHgY7nnl/1XYHYFCg+GRlZXbEQ5MJX
	iJww7IbP8z5uxYaOW6Ekw2VLxnCV7q8eRL7A+Kg==
X-Google-Smtp-Source: AGHT+IHNmuuPif+DbG4ec+dIMXyJEbT7VOcbI/So+yhHKgmIF6Yqto0JmwGC6Q+Vw4w6zffGtyU3CZcthFKRTXXPi8k=
X-Received: by 2002:a05:6102:55a7:b0:46d:2500:b3f5 with SMTP id
 dc39-20020a05610255a700b0046d2500b3f5mr3133776vsb.35.1707225826548; Tue, 06
 Feb 2024 05:23:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240205093418.39755-1-brgl@bgdev.pl> <20240205093418.39755-22-brgl@bgdev.pl>
 <ZcDVNA6Id7Bmckt0@smile.fi.intel.com> <CAMRc=MdoGQZKM37kk=j6NpdkUUjDvs3-8YeiZVQO2EpPHRZ7Uw@mail.gmail.com>
 <ZcIlEEgHn5AaTEyz@smile.fi.intel.com> <CAMRc=Mcq2UgS4EcVAOghQzFq_jXA83rGMse+pxa5ieK8MXZm-w@mail.gmail.com>
 <ZcIwiU4UNbcoa8Km@smile.fi.intel.com>
In-Reply-To: <ZcIwiU4UNbcoa8Km@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 6 Feb 2024 14:23:35 +0100
Message-ID: <CAMRc=MdRwCqn-A3Wdk8kaYDY6NAO5fC3wy0gxWsFQcPwoH9dvw@mail.gmail.com>
Subject: Re: [PATCH v2 21/23] gpio: protect the pointer to gpio_chip in
 gpio_device with SRCU
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Kent Gibson <warthog618@gmail.com>, 
	Alex Elder <elder@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	"Paul E . McKenney" <paulmck@kernel.org>, Wolfram Sang <wsa@the-dreams.de>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 6, 2024 at 2:13=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Feb 06, 2024 at 01:57:39PM +0100, Bartosz Golaszewski wrote:
> > On Tue, Feb 6, 2024 at 1:24=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > On Mon, Feb 05, 2024 at 08:36:39PM +0100, Bartosz Golaszewski wrote:
> > > > On Mon, Feb 5, 2024 at 1:31=E2=80=AFPM Andy Shevchenko
> > > > <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > ...
> > >
> > > > >
> > > > > >  int gpiod_get_direction(struct gpio_desc *desc)
> > > > > >  {
> > > > > > -     struct gpio_chip *gc;
> > > > > >       unsigned long flags;
> > > > > >       unsigned int offset;
> > > > > >       int ret;
> > > > > >
> > > > > > -     gc =3D gpiod_to_chip(desc);
> > > > > > +     if (!desc)
> > > > > > +             /* Sane default is INPUT. */
> > > > > > +             return 1;
> > > > >
> > > > > Hmm... I can't imagine how this value may anyhow be used / useful=
.
> > > >
> > > > What else would you return for an optional (NULL) GPIO?
> > >
> > > An error. If somebody asks for direction of the non-existing GPIO, th=
ere is no
> > > (valid) answer for that.
>
> > All other functions return 0 for desc =3D=3D NULL to accommodate
> > gpiod_get_optional(). I think we should stay consistent here.
>
> The way you proposed is inconsistent, i.e. you may not return any directi=
on
> for the unknown / non-existing GPIO. You speculate it will be 1, I may co=
nsider
> that in my (hypothetical for now) case it should be 0.
>
> Just don't make all bananas to be oranges. It won't work.
>

I don't have a strong conviction here. May make it an error as well.
It's still inconsistent though - calling gpiod_direction_output(NULL);
will return 0 and then you get an error when you do
gpiod_get_direction(NULL). I don't have a good solution though.

Bart

