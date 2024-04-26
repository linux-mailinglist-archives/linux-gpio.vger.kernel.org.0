Return-Path: <linux-gpio+bounces-5893-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 052B78B3895
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Apr 2024 15:38:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 867791F218FD
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Apr 2024 13:38:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E469E147C62;
	Fri, 26 Apr 2024 13:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JvAfI/8p"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680451F956
	for <linux-gpio@vger.kernel.org>; Fri, 26 Apr 2024 13:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714138677; cv=none; b=s/2iWCnKqnPftWik3eLqau3OfpMsMJwU/UfdgtvNOvzs4bxwVU7tKi5kzIPevsqdTLO/FAfHn+QMbxl9r4KyT+QTUMNir1zntbXfS34MHRtRg8s7DQ21HG3FxdLRhiV4hde2V1j+qxK41QA1k0wTtsuMR0AZi/zmI5Ett7mRtVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714138677; c=relaxed/simple;
	bh=GNrR2ZBRTkUyIoOvBrBbnCMVH8HTtzziSwMSulDOEMU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m1Dah9l0+LPfZLBPQgH+4EkSY1sufQ+9pABiUnF2VrVj7iJl4cbi2TtzkvbSB2FhgQY2khMedvoMOL6YNUuvRq0ptITQntAHnLfE1Qrjt8LtbLczxH8L2S6bA0jI/yvJTaXi5vFd834UU1khX5WVsryq9MTlsfoJ4MAa6GKLIlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JvAfI/8p; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1e36b7e7dd2so18269075ad.1
        for <linux-gpio@vger.kernel.org>; Fri, 26 Apr 2024 06:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714138676; x=1714743476; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kJRAPjibqVc85KMaMVvBivnOM8W6Quxw8WV87zJCqx8=;
        b=JvAfI/8p6z7JoZpYzoqBuLl/n4GIpp9FmeYeG21lptDDBf4v9NPrCnxiUZEusYkclf
         4n2dFFZk0i0LV+zNJh/wiLzE5X/TOYWNfz3o9TX7SgzfQ8eJU7pmob6JWTzG/BD76Wxm
         o+SSBf7LzKWVaz1SwcscoOdv7BRXuHJWtAe2sH2yUHZHK1qE8Y6DzdeHJ6F8r1IEOEKs
         CFVIuA8VQNfzNN/dA9w+bqrVeqE8ffdtEblqRkIUugiK5XCbgK5IBSmkkJ/ZtlrHNGry
         qa0oeiDR3bjvRgN8DtB8qc95ljvuoewoP77gGphaDvj7XT/lQGrGTYwk7igbP1NJN38F
         8J4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714138676; x=1714743476;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kJRAPjibqVc85KMaMVvBivnOM8W6Quxw8WV87zJCqx8=;
        b=ohYqqWtmfbtLp7a+06PDgI6U586xt2RH5eqVHRMsDHr+LvVuV60uwMNntVwrwH+ahY
         Zj4J6FOLTrz3ClKNCtmuCzJdChs0aLOcniQ693fVfQFFbi/Ns2zTGdA7NfDPjQQXpjmS
         9+FfNTZajsObPP22SeFHIonTZxDdaOOt3hEtp7NirW7n9/H3PPjayG8YrH4ZepcFCFp7
         uX6/a+1DuGaHmRqZFAX2c06MXmuSxJ8brajyUWGSQ8CGVGZKWa7mEwFqY0ZRZnRiYLvg
         FO0KQ40vucMmBn2lZ1S6WMKT2jtLxDuylVLZeuEw/lVywmMLlArdbuzcctBOqWPOcTR7
         nVzw==
X-Forwarded-Encrypted: i=1; AJvYcCXW5KSNsYPLV4qxJEnOc+4EqJdHi9lCe/zJOArBazf3WNSeRoJDeq3UGllav4LofOtffkKXIEYP7fWN5UqS9L29k/Mx+JcO8McHoA==
X-Gm-Message-State: AOJu0YzimhM9pKC/24I6wUchDBaAFQPwW1DigP+o9908cBnMGXPJi7N0
	YEvD5aTFDpbtEhIfZS7D69JjMm3uJH5zrsdL5JZm0m3d7LmfqY96+pAW7Q==
X-Google-Smtp-Source: AGHT+IERc8Gkl/jTu55WbgHpWjYqGOkQXJLOnhtv4Vfg/QYjhtLw3wU8OHGeClEmRTTif0PMUI/Tcg==
X-Received: by 2002:a17:902:6545:b0:1ea:26bf:928 with SMTP id d5-20020a170902654500b001ea26bf0928mr2345154pln.50.1714138675476;
        Fri, 26 Apr 2024 06:37:55 -0700 (PDT)
Received: from rigel (14-200-166-65.static.tpgi.com.au. [14.200.166.65])
        by smtp.gmail.com with ESMTPSA id t20-20020a170902b21400b001e3e081dea1sm15499084plr.0.2024.04.26.06.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 06:37:54 -0700 (PDT)
Date: Fri, 26 Apr 2024 21:37:51 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Gilles BULOZ <gilles.buloz@kontron.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
Subject: Re: [questions] : gpiolib and gpioset behaviour
Message-ID: <20240426133751.GA380503@rigel>
References: <a6492fca-e5f9-3f5c-6a61-d08c051f0ac9@kontron.com>
 <CAMRc=MdQ8CT7uxBRhPmttNhm5kzp1+Vij2LmVGO0QsA0xUPtNQ@mail.gmail.com>
 <04e6ac4e-0178-c910-2dcd-45a726f75c0d@kontron.com>
 <20240426020720.GA9777@rigel>
 <76794fbe-db97-a00b-c16c-b3e4296c3b9d@kontron.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <76794fbe-db97-a00b-c16c-b3e4296c3b9d@kontron.com>

On Fri, Apr 26, 2024 at 03:08:33PM +0200, Gilles BULOZ wrote:
> On Fri, Apr 26, 2024 at 04:07 AM, Kent Gibson wrote :
> > On Mon, Apr 22, 2024 at 06:49:05PM +0200, Gilles BULOZ wrote:
> >> On Mon, Apr 22, 2024 at 3:55 PM Bartosz Golaszewski wrote :
> >>> On Mon, Apr 22, 2024 at 2:44 PM Gilles BULOZ <gilles.buloz@kontron.com> wrote:
> >>>>

> >>
> >
> > I suspect you are referring to gpiolib here - the mask in gc->get_multiple()
> > being unsigned long*.
> >
> > The uAPI that libgpiod uses is limited to 64 lines per request, but that is
> > only relevant if you want to request more than 64 lines at once from userspace
> > (you would have to break that into two requests to access all 112 lines).
> >
> > Note that the mask in gc->get_multiple() is unsigned long*, so it is a
> > pointer to an array of unsigned long.  Its width is not limited by
> > unsigned long, but by the bits parameter.  In your case the mask you pass
> > should contain multiple unsigned longs to achieve 112 bits.
> > Refer to gpiod_get_array_value_complex() for an example of building bitmap
> > masks to pass to gc->get_multiple(), in that case via
> > gpio_chip_get_multiple().
> >
>
> I was refering the get_multiple/set_multiple callbacks in struct gpio_chip
> that are defined like this :
>  int (*get_multiple)(struct gpio_chip *gc, unsigned long *mask, unsigned long *bits);
>  void (*set_multiple)(struct gpio_chip *gc, unsigned long *mask, unsigned long *bits);
> With some debug in my GPIO chip driver implementing these functions, I saw that
> the bits set in "mask" and the ones used in "bits" are the ones whose bit
> numbers are directly matching the GPIO offset/line numbers of the chip. But I
> only used unsigned long, not arrays, so I thought I was limited to offset/line
> 31 on 32bit arch, and 63 on 64bit arch.
> As you suggested, I'm currently having a look to gpiod_get_array_value_complex()
> but I must admit I'm currently a little bit lost. I've never thought GPIO
> implementation could become so complex for my brain :-)
>

The bit of primary interest that I was referring to was the DECLARE_BITMAP()
as used for the fastpath mask:

		DECLARE_BITMAP(fastpath_mask, FASTPATH_NGPIO);

That does the sizing math for you.  In your case you would use 112 for
the NGPIO.  There are also examples of using __set_bit() to set bits in
the mask.  Take a look in linux/bitmaps.h and linux/bitops.h for the
relevant definitions if you want to dig deeper.

And, yeah, the amount of work that goes into just driving physical
lines up and down, fundamentally just toggling bits, frequently makes my brain
hurt too ;-).

Cheers,
Kent.

