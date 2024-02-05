Return-Path: <linux-gpio+bounces-2973-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE7C849B9A
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Feb 2024 14:19:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 139032852F3
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Feb 2024 13:19:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 625DC1CABD;
	Mon,  5 Feb 2024 13:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="fYTEw1bj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9814D1CAA4
	for <linux-gpio@vger.kernel.org>; Mon,  5 Feb 2024 13:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707139164; cv=none; b=iRZzdgjOMB2RzyTDyCXJZriMBhCfj27EoyUC8dHzMv640gOoxHNIT36v3Q5B5ZLiL6R9OFYiEtNNgq5aHiKoxP7hnN5DZjUnH0655uTZQADlHScvJq+yRbTEOTknbx5TZIL8pooM9rVg87AMHjDvZjvag5mh5KW1gRizlIQJLc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707139164; c=relaxed/simple;
	bh=Fn6KL2JTPAj/e4KKkofC4gbvxxwy/f7JxudlnSWfDtI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J8fIog2eNxg5k+R9ayPF/04k03dOedzOrdDXS6d0F+kaISMPsi3cO5lpeI/4qf5fK5VDiJGYSdyu1igJMWfi93xOprrqGoAh92Qjml3IKTdP4vbgXeeUtS+7SG1oMOxXRiS11QDZV95TdkKTtaFA7oyfESZwJJbZOsiw8leJggU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=fYTEw1bj; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-7d2e1832d4dso1818905241.2
        for <linux-gpio@vger.kernel.org>; Mon, 05 Feb 2024 05:19:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1707139161; x=1707743961; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nrHNnU3Wq4ZTy5xDNrJlo+hjA5lNxxV9AGI7mRzwXKw=;
        b=fYTEw1bj/+n7yICtj5aoh5xIK02EqxZ5gXsRODM3r0TQBfPQFO2wL0hdCTQRuLDQXK
         hqi0eT1NP7z2/GD8nkeCGZ3SWgdLle+OG3q7AxsdDqDS6D3pfxMqaCdVC5Il+3CNuupB
         lozH3RqWL1H9INqvim7cTTuRpCe2QZBCHJjxiRo8y+FZDOYHi/h3Vrxzokz0wdYo3/xq
         RTb/BDlFQtwj/O6SANbSQGJV3u5xAL+TNO5TvJ6+9KSsdINNX5P7DV4FmyhDTaZsKy2W
         ErRCyxNru04hmNdgFcvGtfHUikEOPIm5n/HJIlf+N4utKY80t8bV0Ccrssjm/Jvr39UT
         X6Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707139161; x=1707743961;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nrHNnU3Wq4ZTy5xDNrJlo+hjA5lNxxV9AGI7mRzwXKw=;
        b=pmiTbBZ+7qtfeIPBWgYY1YbWMSk9ISNX53aaVEcvPDM96SM0GC3QKcBaUWfAwya7qu
         m1bcTHy62lobuzaNwDgAawAls6zhSxjeEHQVaS0IgPBEfsTzSf1O/Z2BDYz69bc0IeRI
         SsBY+xPw34VP1D57GCpCSvYf7bYN7qE6Xr5PYdOnmUDXzqij1wCSlBCQUJmcVDwuj8k+
         7ENGwvBzITyCWmJBS3OI4qtdH00Jb1SIP/Ynog58igXcY13NF7bx2qQ3bs/s/3aLIbvD
         /ClfAiOe4vDGE8roDl9u1xApkpoU36dmjoPQMQD8AAUeBi0dyVBukFUW4Rj4T6GTQA8i
         huMA==
X-Gm-Message-State: AOJu0YyzRWmryImZPqKw7yOj5z763dHefyRDFsWVT9QwE2aFcSpGLOGu
	M/Q66TboM5aU7u3Ijkp30RE5xZkBPGH79oeKX38NRid4MpMDlEpYjjiItzQxLH9YxDRW1v5/bFF
	NIOoREQEsuJtMvUfluZlqhqGPY0DUNmWqDVNDfg==
X-Google-Smtp-Source: AGHT+IEKshpX8Kr+OhNuqCtyKE/5n8Eu2SoYHsTR0GJw+Ecu92RizEDFbZujpESpzwC14NCZkTnnFpOkTUhVK0UErBY=
X-Received: by 2002:a05:6102:9a9:b0:46d:263a:4102 with SMTP id
 f9-20020a05610209a900b0046d263a4102mr1364233vsb.28.1707139161432; Mon, 05 Feb
 2024 05:19:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240205093418.39755-1-brgl@bgdev.pl> <20240205093418.39755-9-brgl@bgdev.pl>
 <ZcDSKYqFHSUZb2Qx@smile.fi.intel.com>
In-Reply-To: <ZcDSKYqFHSUZb2Qx@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 5 Feb 2024 14:19:10 +0100
Message-ID: <CAMRc=Mfh5CcftXUStGOXvUF-s3aNxnaNM0sDt72LKrBfttqitQ@mail.gmail.com>
Subject: Re: [PATCH v2 08/23] gpio: sysfs: use gpio_device_find() to iterate
 over existing devices
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Kent Gibson <warthog618@gmail.com>, 
	Alex Elder <elder@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	"Paul E . McKenney" <paulmck@kernel.org>, Wolfram Sang <wsa@the-dreams.de>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 5, 2024 at 1:36=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Feb 05, 2024 at 10:34:03AM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > With the list of GPIO devices now protected with SRCU we can use
> > gpio_device_find() to traverse it from sysfs.
>
> ...
>
> > +static int gpiofind_sysfs_register(struct gpio_chip *gc, void *data)
> > +{
> > +     struct gpio_device *gdev =3D gc->gpiodev;
> > +     int ret;
> > +
> > +     if (gdev->mockdev)
> > +             return 0;
> > +
> > +     ret =3D gpiochip_sysfs_register(gdev);
> > +     if (ret)
> > +             chip_err(gc, "failed to register the sysfs entry: %d\n", =
ret);
>
> > +     return 0;
>
> ???
>

Not sure what the ... and ??? mean? The commit message should have
read "... traverse it from gpiofind_sysfs_register()" I agree but the
latter?

Bart

> > +}
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

