Return-Path: <linux-gpio+bounces-6827-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE658D35BC
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 13:44:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 11B7FB23667
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 11:44:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D574217F39A;
	Wed, 29 May 2024 11:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MXBqQuv6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C6C1BDCF;
	Wed, 29 May 2024 11:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716983072; cv=none; b=rogWFJHVFbEaZCeb8Q+b1l5QYcyiFzHy8c5tYmUg0W4g1bew95VLLzuWz94BjS6N9jkItLRjHZuKNKC8KZvDTLvZV0Atu2TAQ/nVvCuxmnS1CHWBSjryxYa4dzUpKbpC44c7daLaUW4BgCs0hBaPL+D964qq3P5RHp7xyjpG/xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716983072; c=relaxed/simple;
	bh=2fuiUji9HQx4FsRAY1Cn/pZd6osThZezfnKd5JaqgZU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i1g/GHXNK6umIPUDAm6yqkdiGakyxR18hWoWI43D2DZJ2qYWop9e8q4eQgzGud699Zuts7tzjU6K44uhMAcPx/h+AFCaVAqPhGpJjpBR2uR2BKFUh9P5URTJozkoWyq2WJunNAIVu+vuTWxzrD+YLMBL37vIEDWfNk92c4XYM+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MXBqQuv6; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1f480624d04so16633155ad.2;
        Wed, 29 May 2024 04:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716983070; x=1717587870; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Fqyvl/SvhAn+m86+zGmNblTjPk+aKV8ab9/H2jbsASU=;
        b=MXBqQuv6rflJLIXUGBGGwm55+tYhDogCGkWyyws8rPhuMtk1ZooGY4UKYnnczHUyom
         k0ENx9fxxl+u8RT7g0AZKFZ5cItMw5dfgrdZ3ZazBP83NDftagGVrkcKeb5DLEJzvePm
         8xGcQpOh3IlbnoEgcKkole8WBcc9L3oSb8WGgL227IxAiscWNvbtWnhwEjc8lCVfIR+Z
         Hxc5QL6F//zTipukB2s1MBCYdxTMciev3MzARldJ+3HpGZZK8lAQeU4vJQwAKg89e1at
         3RK77aYCk2te1ry4PspJhwoQ/G5wTfKEm9zl5rdsVsSPKfd/S6fC+ZPEFeH+i/FY66k1
         Gipw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716983070; x=1717587870;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fqyvl/SvhAn+m86+zGmNblTjPk+aKV8ab9/H2jbsASU=;
        b=uMn/Y3TfTmhmFPq+AnP06SoSWxkA+MXruhfGjkS1hn+R6/xMekqAmCvLzhdNAacboH
         ZUe4omD/jVCCv9DzxdFwpIBkouuAjFeOJOUYfw37pVYQXhfMYmzE23C8rVHUzUA4Hy9g
         XoHqjc0b2zapTPceCXI9AGizzFddljIWOTCFDNjVwN4wAYoMphOIyjpDHF0yXbgAbEw4
         6m+zakQuXwWdfuY7tE0dbQ1R72lDYYWfMHOeO5w/KHZg9GOQRRsfJCT5RdRILa0/esyZ
         xlE2ToSxfBCJoYehBNcDZvwsT/FzIuAjnvNZRTNU5VKp2oA3PwaDty33rOht4GS+p3Kk
         r/Aw==
X-Forwarded-Encrypted: i=1; AJvYcCWH8/tV7Fqy0z4NhtI6raLaO86O4ofsToNj//lrLguygqFSWjtrkeACE58KX4V1j/lz9t0yUNaSe3eHM4iJrZ6aTTPVQstvJkB0dw==
X-Gm-Message-State: AOJu0YzDTN3kWBE1uIhFjfOfKCS1ilQi5sjTbIFfJKvGgM+PERT+ld1h
	XhpIlIxKw3gHhD5TK620/yp2vJ3+dFn3w7/XM28UFBW3abtjCMaO
X-Google-Smtp-Source: AGHT+IEwrwxx1l6iXOnAv8xocO+x91EOVBjJSmxN8vgNyjMPv5e63EXnOmFZvf4yZscUKRlPa7lnug==
X-Received: by 2002:a17:902:e883:b0:1f4:5b00:401 with SMTP id d9443c01a7336-1f45b0008c4mr129982935ad.54.1716983070451;
        Wed, 29 May 2024 04:44:30 -0700 (PDT)
Received: from rigel (194-223-177-244.tpgi.com.au. [194.223.177.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f4ac27c5aasm50378595ad.251.2024.05.29.04.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 04:44:30 -0700 (PDT)
Date: Wed, 29 May 2024 19:44:25 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linus.walleij@linaro.org
Subject: Re: [PATCH 3/3] gpiolib: cdev: Cleanup kfifo_out() error handling
Message-ID: <20240529114425.GA98553@rigel>
References: <20240527115419.92606-1-warthog618@gmail.com>
 <20240527115419.92606-4-warthog618@gmail.com>
 <CAMRc=Me+M5PQfuOE=tqqxJF-Q_TVdFb=wh-=ApBO_2PvTV=ZJg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Me+M5PQfuOE=tqqxJF-Q_TVdFb=wh-=ApBO_2PvTV=ZJg@mail.gmail.com>

On Wed, May 29, 2024 at 01:24:45PM +0200, Bartosz Golaszewski wrote:
> On Mon, May 27, 2024 at 1:55 PM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > The handling of kfifo_out() errors in read functions obscures any error.
> > The error condition should never occur but, while a ret is set to -EIO, it
> > is subsequently ignored and the read functions instead return the number
> > of bytes copied to that point, potentially masking the fact that any error
> > occurred.
> >
> > Return -EIO in the case of a kfifo_out() error to make it clear something
> > very odd is going on here.
> >
> > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> > ---
> >  drivers/gpio/gpiolib-cdev.c | 47 +++++++++++++++++--------------------
> >  1 file changed, 21 insertions(+), 26 deletions(-)
> >
> > diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
> > index c7218c9f2c5e..6a986d7f1f2f 100644
> > --- a/drivers/gpio/gpiolib-cdev.c
> > +++ b/drivers/gpio/gpiolib-cdev.c
> > @@ -1642,16 +1642,13 @@ static ssize_t linereq_read(struct file *file, char __user *buf,
> >                                         return ret;
> >                         }
> >
> > -                       ret = kfifo_out(&lr->events, &le, 1);
> > -               }
> > -               if (ret != 1) {
> > -                       /*
> > -                        * This should never happen - we were holding the
> > -                        * lock from the moment we learned the fifo is no
> > -                        * longer empty until now.
> > -                        */
> > -                       ret = -EIO;
> > -                       break;
> > +                       if (kfifo_out(&lr->events, &le, 1) != 1)
> > +                               /*
> > +                                * This should never happen - we hold the
>
> I'm not a native speaker but this looks odd to me - shouldn't it be
> "we held the lock from the moment..."?
>

Unlike the original, it is within the scoped_guard here, and we still hold the
lock, so using the past tense would be incorrect.

> > +                                * lock from the moment we learned the fifo
> > +                                * is no longer empty until now.
> > +                                */
> > +                               return -EIO;
>
> Since this is so unlikely maybe a WARN() would be justified here too?
>

Yeah, that makes sense.  I'll add them for v2.

Cheers,
Kent.

