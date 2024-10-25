Return-Path: <linux-gpio+bounces-12110-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBAA39B0866
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2024 17:34:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ECA621C22BAA
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2024 15:34:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 596FA1531C8;
	Fri, 25 Oct 2024 15:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S3ieV8W1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D44C7082A;
	Fri, 25 Oct 2024 15:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729870472; cv=none; b=R/ECwzcObC9qSHbilZd1Erp/85YCuiy1VfNKNSpIsx/d03/tRbI3lLptoezZ902D9Kl/uZBIrJDakjqkw7Pcj5PB+DEiaX5BHIbqVML90XJy216u5siov29Yh+b9iUqN+OL2B9ZYdXNzPzrHt/nGY/ZHycBFcy3L2Ro2+D0kNeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729870472; c=relaxed/simple;
	bh=tX/A+MoXc61eQzokk+Bri9cnGMxNX2TCKKuyx2BsfKo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kHTSpGuR3T9S6tb08LJHfIpQidDutmQ0K1GlEXPrInnqH14Fo8IKecKrL8quYQTTlN13Ajfz1BWhrcdbGPJT75Pl4wDZZkIWUucmdI9H6nJ4WGrEd6f9NYxTtUiFK0a+I/e4CUDi0sOBp3gsFydO7ef7ZtlIktPIKlqwkm6yhcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S3ieV8W1; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-71e4244fdc6so1581681b3a.0;
        Fri, 25 Oct 2024 08:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729870469; x=1730475269; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=h/eitMKDM03Njt51V0eKCffqE5i1StRGLEPU3LTkQ2k=;
        b=S3ieV8W1rO+qkFf5JFUhjds9sr4yjjpibbpooo3ER++TP6ZEhKb/9PfQdA3trETlhA
         wuNEbVCxaMVA5hKCGxq3pff0tVPvGDhBn5Kd3kCyd0tHdunSm9klvvq2P/utULBEDoNZ
         KQTPyiedMFE9JW04HWFCwUBlUcp0GTfSVI8ohAlfEYgPH8ICuaNUtRL7ACQUZ5MHMzMw
         uL8o0Q+ECQQB0fvPSRW9JIKsHBdTFxM4kIh4VMAh4wHxJB9sUxULsDIa1XZOCo92hyS2
         OMhCyndmwrfu2VECCKolBuHq97aOnYjUd1yyVQ6JwzeRrc/VPfUxzGixpH7SOXgqxEuJ
         mgIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729870469; x=1730475269;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h/eitMKDM03Njt51V0eKCffqE5i1StRGLEPU3LTkQ2k=;
        b=O4PRj+Wdv81vW20g7ynKAOeaQ/90k1v56lefbxDxR4v3lpW7lZJnVhs904NOkAE7J2
         R1iXKfGY5a70TPqJikZFiS+exlIyZeBM2jQU/Nwok+EDRNG42t6NGYBzKTf+WWggGcV5
         N4hfX148GKH9jGY8XjK0gAcQ7nDpHJbEs+TgZOEDlgOqGQR+KLS7iT++RRkOiPg0JzFA
         dSBrZu966NGWqlEdObfXCyuEFl36JrFxyUU7XEyA05NAYKEchY7nYJjykjVAqavbStUK
         6R7flbt5Q0rJm67Hp4fKZoppWWSovCK6eHZVjlK2+HtklUfb3RSmPFOJj3SzmQK8hPAI
         wsow==
X-Forwarded-Encrypted: i=1; AJvYcCVjQwvGXuku0T/upK0/4D1Xw1LOzupubWLKqdMjJiaF+gjzzIBnLtgqsbh7e5pnjPocfGB78NwCDVwJmswd@vger.kernel.org, AJvYcCX/4AkefuXcf2u/Wp39kYNQcYm2vxMJBnJjz7ymD2DLkE6hEdOlxtqhttqZhVFfnPeunRHK9kZ/1DCZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyixPjM/n6U6HaxzCpYndiMsX5IPGiyb3vcc8+gQ7xQjomIm5az
	8s6ftjvSk+JskbhqaQz/YU2d2l7MmjaK+W2wGdue093HcXlHkxNP
X-Google-Smtp-Source: AGHT+IHLnRBcM+dFVW4elSQbv3v314RkMNXB9U4Fbfp+Gmk4ZcBKRuWRDF14XRcKm5A1FywQwPxtyQ==
X-Received: by 2002:a05:6a00:1491:b0:71e:14c:8d31 with SMTP id d2e1a72fcca58-72030c0d886mr12095289b3a.16.1729870469358;
        Fri, 25 Oct 2024 08:34:29 -0700 (PDT)
Received: from rigel (60-240-10-139.tpgi.com.au. [60.240.10.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057a1f1ddsm1235995b3a.149.2024.10.25.08.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 08:34:28 -0700 (PDT)
Date: Fri, 25 Oct 2024 23:34:24 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 1/5] gpio: sysfs: use cleanup guards for
 gpiod_data::mutex
Message-ID: <20241025153424.GA182871@rigel>
References: <20241025-gpio-notify-sysfs-v2-0-5bd1b1b0b3e6@linaro.org>
 <20241025-gpio-notify-sysfs-v2-1-5bd1b1b0b3e6@linaro.org>
 <20241025132420.GA155087@rigel>
 <CAMRc=Mcd8vVCwDvRysMxB00xUD77zmJK1EApFuAEfWpwOhkviw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mcd8vVCwDvRysMxB00xUD77zmJK1EApFuAEfWpwOhkviw@mail.gmail.com>

On Fri, Oct 25, 2024 at 04:08:00PM +0200, Bartosz Golaszewski wrote:
> On Fri, Oct 25, 2024 at 3:24 PM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Fri, Oct 25, 2024 at 02:18:51PM +0200, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > Shrink the code and drop some goto labels by using lock guards around
> > > gpiod_data::mutex.
> > >
> > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > ---
> > >  drivers/gpio/gpiolib-sysfs.c | 81 ++++++++++++++++----------------------------
> > >  1 file changed, 29 insertions(+), 52 deletions(-)
> > >
> > > @@ -139,19 +132,17 @@ static ssize_t value_store(struct device *dev,
> > >       long value;
> > >
> > >       status = kstrtol(buf, 0, &value);
> > > +     if (status)
> > > +             return status;
> > >
> > > -     mutex_lock(&data->mutex);
> > > +     guard(mutex)(&data->mutex);
> > >
> > > -     if (!test_bit(FLAG_IS_OUT, &desc->flags)) {
> > > -             status = -EPERM;
> > > -     } else if (status == 0) {
> > > -             gpiod_set_value_cansleep(desc, value);
> > > -             status = size;
> > > -     }
> > > +     if (!test_bit(FLAG_IS_OUT, &desc->flags))
> > > +             return -EPERM;
> > >
> > > -     mutex_unlock(&data->mutex);
> > > +     gpiod_set_value_cansleep(desc, value);
> > >
> > > -     return status;
> > > +     return size;
> > >  }
> >
> > This is a behavioural change as you've moved the decode check before the
> > permission check.  Not sure if that is significant or not, so in my
> > suggestion I retained the old order.
> >
> > Cheers,
> > Kent.
>
> Yeah, I don't know why it was done. Typically you want to sanitize the
> input before anything else and this is what's done almost everywhere
> else. I'd keep it like that.

Not knowing why it was done was precisely the reason I thought it
should be left as is.  The fact that the checks are performed in the
other order elsewhere makes me think this one was done intentionally.
Conceivably it could be used by userspace to test if a line is output when
the direction is fixed (so /sys/class/gpio/gpioN/direction does not exist).
So write a non-integer to the value and see if it returns -EPERM rather
than -EINVAL.

Admittedly I'm speculating, but I can't rule it out, so I wouldn't
change the behaviour just because it is more aesthetically pleasing.
And if you insist on tidying the behaviour then it should be in a separate
patch rather than piggy-backing onto the guard change.

Anyway, that is my 2c.

Cheers,
Kent.

