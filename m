Return-Path: <linux-gpio+bounces-22398-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C30AED7F1
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Jun 2025 10:57:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1621E3B45ED
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Jun 2025 08:57:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 399C123B628;
	Mon, 30 Jun 2025 08:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="3FVT4QBN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB0420F07C
	for <linux-gpio@vger.kernel.org>; Mon, 30 Jun 2025 08:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751273841; cv=none; b=YTK7znJuHXXWXw5GB4MFSPbdJAPh7TJAnQO3COtTIR+FcsWbC1AfAnx5KgxMJa3jI6GsHgYXtWKrgJBdspWanZlP2tqvj2xE+AuFpd7eIqzCxtIahL01AGELLkmPqHYI8xODmgYJI54ZYmLk3S7IOE5mrI1thXrA7d+KrsQAzss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751273841; c=relaxed/simple;
	bh=tHwsdwlV2RdkOWQDFpeoiWYoZwLF4ObvF548D0kUzbk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VN4teQAckWHqEKC0CJabkAKmM6OmGUcxNBvbWG9DHERSMGrDlEVrHSrPHcI7GVu0cdK+sgwuddByOzYxmsDSzcYMmEAwsFAVRzNJLH88JonHrTzsmLpuB9xyoKvu64InuVnrkxMTmO6aJy0x8LftCwiwfUyyo1KVonyvAMekJ8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=3FVT4QBN; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-55502821bd2so1990869e87.2
        for <linux-gpio@vger.kernel.org>; Mon, 30 Jun 2025 01:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751273837; x=1751878637; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1/xWSuspPIRwEvJOqsaKy++PiaBV+Pm9M/ghPEWy/as=;
        b=3FVT4QBNeVs4vQas3m1v8QJU1M01Iq0dvFNHHKJXa5N4rWYbhbcNa1NlnQIYqIj64A
         BU36dbQcCh22NgHQLb21ZJ85+VG8KV4fdL6w+UuSKB0PkQnbABWsN1VDZoGGDFLAN2iM
         2vcUnza/2k7uF1z/PeXRR7Vy4TqwykTKQWcmM03m1nCEUNc1EcxdoIIX1AXjacQWFNis
         j4l36Q882gpkVga8k3eBYom6LqTk+IaznUS4kRpXijrKftZkczs7xLkr/vlcmnqNchD2
         wjLNQx58tIQnLMLwL3j0mY1uX6G86FN68hhoZAYsAamYPk63pgYr6mkemhppp9T6H07A
         SYsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751273837; x=1751878637;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1/xWSuspPIRwEvJOqsaKy++PiaBV+Pm9M/ghPEWy/as=;
        b=qn3HQ+Qda2LbJ3U/rM7MEGCywMgXgaZW65XmMTJTYpExD75yDZ5WhbXzzs9PO58tDy
         X2wvrGcz0dqGILso1svBIK3BDLqmecXmKHirIK1uHYwXqXqLX3/STi93i8ZGyfUUATFO
         Or7qXuVsTp+lXIqY1MTbV0HIzTs2nSmLuvjBnZVW2cBvts5STCD49YWMBLyR6xzEA3Wk
         qQn6avHjZWRDaJW3Vz6VVhubfb2E5vcVHBsVto0fOGufdlKD3tf9OvrvzAhcZMInhWTj
         sYPYbZrACiAW7TBlbQI9Hap8m7nHsbr5a3SCfFFrKWGvK0wl4DBMRHoRmNiMB040lVOE
         Y4YQ==
X-Forwarded-Encrypted: i=1; AJvYcCUE0Venr8WKKn9DH0cixiAtCUkjkoSq9RUntbJmd+F1Zkl8oK5s7SUAZXIrDlZ4b+cnfgZ7IUHGelEr@vger.kernel.org
X-Gm-Message-State: AOJu0YyRyMWurLzfJE/IynAyuEGbFb7bdTQ2xiUS7hVCPgBDKQqUjsnu
	SSlFQ8iB/r0cH9wZHmCkTMAnxBbzm7NHyfeMB9Q77bgMcQHuhlAqQBPNK9besT8v201N8RtkGa4
	6ZZ6fh+6xdlavrtaKW7rETuKsGbXE8FPh8M+ROfQd1w==
X-Gm-Gg: ASbGncvG1Bccs2VWpCKX5GTMy6sm0pJYASSWvcCxsuCgF57VGd4YMoOwxJXDgV0TKrV
	mctonSn4Dt/QgqEDSFI46Cqidu9Bjk4Tv+phjFYGxAEbRdZLmntcbtWFcs0U64CGP6V5GXxn0LV
	TPSgXajpZXpnrYh4u0kEvePtSAq30RD+SHduYT8OO061ORqpR4cNZfvdMoE1bol8C9fIgah9t+Q
	90=
X-Google-Smtp-Source: AGHT+IEZFMQfEkJUH+3rY8y+TTsjGBa4rf9U72HmIeYMgNLHPeZASdF9kS2CmUz3M5ntnAe3s+m3HBmPq0QCOl4h/9E=
X-Received: by 2002:a05:6512:3b9d:b0:553:2bf7:77be with SMTP id
 2adb3069b0e04-5550b84cb93mr4367395e87.22.1751273837415; Mon, 30 Jun 2025
 01:57:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250623-gpio-sysfs-chip-export-v2-0-d592793f8964@linaro.org>
 <20250623-gpio-sysfs-chip-export-v2-4-d592793f8964@linaro.org> <aF67oAqLmRJzy4Zt@black.fi.intel.com>
In-Reply-To: <aF67oAqLmRJzy4Zt@black.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 30 Jun 2025 10:57:06 +0200
X-Gm-Features: Ac12FXwUwnOAqU4puVzSKb72DH7ePHLAhCj8ihvhutkV1VkA2A2c_2dH8givJoE
Message-ID: <CAMRc=MfXVTqncPsJ3QKqsGDi36gK4weWX1iygpqg1C-XinCEGg@mail.gmail.com>
Subject: Re: [PATCH v2 4/9] gpio: sysfs: don't use driver data in sysfs
 callbacks for line attributes
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>, Kent Gibson <warthog618@gmail.com>, 
	=?UTF-8?Q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, Marek Vasut <marex@denx.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 27, 2025 at 5:41=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Mon, Jun 23, 2025 at 10:59:52AM +0200, Bartosz Golaszewski wrote:
> >
> > Currently each exported GPIO is represented in sysfs as a separate clas=
s
> > device. This allows us to simply use dev_get_drvdata() to retrieve the
> > pointer passed to device_create_with_groups() from sysfs ops callbacks.
> >
> > However, we're preparing to add a parallel set of per-line sysfs
> > attributes that will live inside the associated gpiochip group. They ar=
e
> > not registered as class devices and so have the parent device passed as
> > argument to their callbacks (the GPIO chip class device).
> >
> > Put the attribute structs inside the GPIO descriptor data and
> > dereference the relevant ones using container_of() in the callbacks.
> > This way, we'll be able to reuse the same code for both the legacy and
> > new GPIO attributes.
>
> ...
>
> > -     struct gpiod_data *data =3D dev_get_drvdata(dev);
> > +     struct gpiod_data *data =3D container_of(attr, struct gpiod_data,
> > +                                            dir_attr);
>
> Defining once something like
>
> #define to_gpiod_data() ...
>
> we may leave this and others as one-liners.

We'd need one per every attribute. Look closer, we do get a different
attr address in every pair of callbacks.

>
> ...
>
> > +     attrs[GPIO_SYSFS_LINE_ATTR_ACTIVE_LOW] =3D
> > +                                             &data->active_low_attr.at=
tr;
>
> What's the point of two lines here?
>

I tend to stick with the 80 chars limit even though it was lifted.

Bart

> --
> With Best Regards,
> Andy Shevchenko
>
>

