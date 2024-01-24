Return-Path: <linux-gpio+bounces-2502-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0906083A7DB
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jan 2024 12:30:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F8691F22FD5
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jan 2024 11:30:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7571E22064;
	Wed, 24 Jan 2024 11:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eG/L0/dK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3E8481BA
	for <linux-gpio@vger.kernel.org>; Wed, 24 Jan 2024 11:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706095754; cv=none; b=bYpcG3+m1yVQyIpsSKJPWIO6AuJk0ZxoslIHexwh5821nX2DhOxbgunzm8wauoerxjBL8uKpe1csh5OMnegdftNc+RH5wGQcVGmoCqZ4wcNIUSA5c/tpZ0Nn+p1t2liQAzLH8iy+PcHMQsywhFHG0P7yYgm1uvMhsrzBECldS9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706095754; c=relaxed/simple;
	bh=QT5gcgkxk8qOsn+yKUGoDBeqX0DuCdGLyvfJC1xfH44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QcNih1NL0JvnBW+J94x3ZmFm1hHhzMgMJOnl1YrBnnfDtQjmylaVfxsIo8T74zK+L3JWte62Zd3PgLH2nMb+LnASiTmy/p4rDUtzOb/U80uyVgwuEUmBE+NOpZ7TE77x0KVHJxuOa83hptytuIVd9an5GrF3bV9oAVtD3saUSIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eG/L0/dK; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1d7881b1843so2192065ad.3
        for <linux-gpio@vger.kernel.org>; Wed, 24 Jan 2024 03:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706095752; x=1706700552; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VOPP/w/anAv/QkCzIk0UzmCdSEMfSvyVssXiFid3JY8=;
        b=eG/L0/dKzo0I/g+YI29WskUzOS/PicTuD3dcbmuFvUwWkc50GOhIWdtMZKaHJGtXsd
         RmDxwZ0dhAGDFlM3CK65qh7WRwZPTii4e+cFfMqxprDtwLjZrsU9ZUdE0Qxb+VAVzbHV
         TW+boyAFY9X4pLzLr3VDbKjyZhjRXNdxxmQl2e8fRwutIoEzrAm+zUutbVS+43OPdReJ
         Vrt96jsXLVyy2aRALHwWRKGtfaJbck8gi2dIhq/th9ZP2yJo0M7JDU2tBXKRupuedPnq
         l7JqXatZvDuK3bfUK5+s10mwC0ugQk09wQaUAMVtMWg24ZS/NWfWiF4Axe885LWlfKY/
         aZ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706095752; x=1706700552;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VOPP/w/anAv/QkCzIk0UzmCdSEMfSvyVssXiFid3JY8=;
        b=v/HV3+fpIzOF+LalSLm/CPbiq2xyjGCNeMZbt49NbpphswnpTA2qakse0gvg6YtS9D
         DuSDqjkvAT1nmzLqyLk04wIT3IuLzP+LSuO8VeuEIFh8ItWaQYMw0gyrp0+dAKZTD4zu
         UutLtRYNTBHc/aW+cS0ZTwhFeVFSHDC62CZkHI/k/2kvcujI3GtVt9TPkrEVAHwLrDL1
         cVIWi4z4eAbDTYjDILi9sYtBj1NxYFdL3Wax+ivmdlDJzAsGSDpLA2ozfjEP/Re7acCX
         HJ4f7JQDifA7CaCkm7SOKquISLf98szRLUoZerhLF7jN6YoMM5ThAEKngePOvnwKKEe9
         0xCw==
X-Gm-Message-State: AOJu0Yyacep8y1r9mSFPoyXdXuFqfdVcRgmPkSGuJDrs/ttaS+HIQflJ
	b9tM1+BxceFAcCrI27zXQujQEHrU2rzIhj6AmRzrNeIRrSjdnZkeYdr9MY/0
X-Google-Smtp-Source: AGHT+IF6HZiL7dSkoa32M0sl51MjdKQq8AIjYTbOXskT52fVDFog+rxn5if8rECg/LksUDI50bjODw==
X-Received: by 2002:a17:902:b901:b0:1d5:73f7:c016 with SMTP id bf1-20020a170902b90100b001d573f7c016mr640681plb.109.1706095752174;
        Wed, 24 Jan 2024 03:29:12 -0800 (PST)
Received: from rigel ([220.235.35.85])
        by smtp.gmail.com with ESMTPSA id r11-20020a170903410b00b001d721ee41c6sm8343321pld.232.2024.01.24.03.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 03:29:11 -0800 (PST)
Date: Wed, 24 Jan 2024 19:29:07 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Phil Howard <phil@gadgetoid.com>, linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	=?iso-8859-1?Q?Jos=E9?= Guilherme de Castro Rodrigues <joseguilhermebh@hotmail.com>
Subject: Re: [libgpiod][PATCH] core: ignore positive values returned by the
 GPIO_V2_GET_LINE ioctl()
Message-ID: <20240124112907.GA67212@rigel>
References: <20240124103929.66545-1-brgl@bgdev.pl>
 <20240124105424.GA66219@rigel>
 <CAMRc=MfGJ2UxOdchd=qmM340x2d-QT0egpG4HkR1fCiz8sfyoA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MfGJ2UxOdchd=qmM340x2d-QT0egpG4HkR1fCiz8sfyoA@mail.gmail.com>

On Wed, Jan 24, 2024 at 11:58:16AM +0100, Bartosz Golaszewski wrote:
> On Wed, Jan 24, 2024 at 11:54 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Wed, Jan 24, 2024 at 11:39:29AM +0100, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > If the kernel GPIO driver (erroneously) returns a positive value from one
> > > of its callbacks, it may end up being propagated to user space as
> > > a positive value returned by the call to ioctl(). Let's treat all
> > > non-zero values as errors as GPIO uAPI ioctl()s are not expected to ever
> > > return positive values. This should be addressed in the kernel but will
> > > remain a problem on older or unpatched versions so we need to sanitize it
> > > in user-space too.
> > >
> > > Reported-by: José Guilherme de Castro Rodrigues <joseguilhermebh@hotmail.com>
> > > Fixes: b7ba732e6a93 ("treewide: libgpiod v2 implementation")
> > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > ---
> > >  lib/chip.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/lib/chip.c b/lib/chip.c
> > > index 7c05e53..7bf40c6 100644
> > > --- a/lib/chip.c
> > > +++ b/lib/chip.c
> > > @@ -239,7 +239,7 @@ gpiod_chip_request_lines(struct gpiod_chip *chip,
> > >               return NULL;
> > >
> > >       ret = ioctl(chip->fd, GPIO_V2_GET_LINE_IOCTL, &uapi_req);
> > > -     if (ret < 0)
> > > +     if (ret)
> > >               return NULL;
> > >
> >
> > What is errno going to be here?
> > Is errno set if the ioctl returns positive?
> >
>
> No it isn't, thanks for catching it.
>
> This patch is incomplete - we need a wrapper around ioctl() for all
> uAPI calls that will check for positive numbers and set errno to
> ERANGE (is that the right one? any other ideas?) then return -1.
>

The two things I'm looking for in an error code would be that we don't
use it already, and it isn't too confusing.

ERANGE is typically for numeric overlow, so a bit confusing.

EBADE?

Though EHWPOISON does seem fitting given the root cause ;-).

Cheers,
Kent.



