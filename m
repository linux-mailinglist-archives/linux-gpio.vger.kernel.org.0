Return-Path: <linux-gpio+bounces-5902-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78DBA8B433A
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Apr 2024 02:24:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C8161C22DB5
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Apr 2024 00:24:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDF9963BF;
	Sat, 27 Apr 2024 00:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FFaQPmLL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52645523D
	for <linux-gpio@vger.kernel.org>; Sat, 27 Apr 2024 00:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714177439; cv=none; b=LGyESeGBs02P3pUUoDiGRtAd7ckfBmfbQXf8kZJsXz3ErYY9bIemvNcMgRZJzLTiwiSmaOAZpQF0Yxc6/HptFOW9jKagDyxcw0gZccOhSzyRwyKf44I+PRjR8B4M17GFpx1HavdzA+i8gQPxICorOapO7d4u7/wurdg01rsLRe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714177439; c=relaxed/simple;
	bh=yq6ij/HRMO1Xkl2Y3RotGQAOKJGKSOIdThpTSXs7TyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E8FeSkpFVofv8KtwH0mDXlhr8nZ1RcElKeRyEkc+h0Th7q+V7WyP4EbLz9LwaTVBzIYE3YRau6lBPptHbRppPqXhEPTgnYgiK9Vtw/K8QIbaAQj73samnYas6/Y7mBNNfFJIKbGmGrWqoRKTMLIWHOluzW3f8x6hBbFLaXpNQB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FFaQPmLL; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1e86d56b3bcso25432645ad.1
        for <linux-gpio@vger.kernel.org>; Fri, 26 Apr 2024 17:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714177437; x=1714782237; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ywCqM1nwBHovaji6jLFk9rO5hF06SZBV7WMD58XyTxo=;
        b=FFaQPmLL4miHP2xCD1EEcrB1SL+r7/UjxoFVrSaD1sJtlIj+mgD9+qzOXDSKZw6gHY
         xcR29FaSkC/vguS9DvjZqvbuHgVej8lGl+egW0RAhtRCiSFiATRVS5t5hE90PI2tWwJ8
         GWpxF2qkERG2pXnZn6gZl6WkWFCe1kfbTQ3S7lnTLXxpxPuTTqnc42D51upOpz70NfsV
         r/KbCN4lcjP6Y4hpQe2/8q6V1AXdlqeFbXISmpyHHz/gteHDjMqe5KvJ3tAFw27ro3gG
         9zHlO3cXKA3VdQKeW2cfr+D2nmRvuVQDLblm7knOXZQi3RZkflUBqid6ZAXipAUbXFuX
         y96A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714177437; x=1714782237;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ywCqM1nwBHovaji6jLFk9rO5hF06SZBV7WMD58XyTxo=;
        b=h/beCImS9wIc/R7jH3l0a9ETxryI/xmy5CuSY//oT2ty64bKyXCLu0kQ3uPpIeoOlw
         rPcZU/AgsSDfKMtEVUY5TBxwGtniytSwk9yORJ96fHbdfImOJ3UMcUo8xRSAdBUSgiEv
         ZjXGr4NKFKP8xY9xHZEN+SoJVR1Vvgl2ud/THQCt4GlphRsRu8syVOvPAr+rYbnrb082
         dVWA3IWlMcIVQMtjIe8aSHiXSF3NSWDRL25hqf58p0jJtdWFYKWkON91b9MpM8kzvOiO
         u+7zOhXXiOZoqZE/7akCEjyFrvDv8lSHrRHFxWT4gbNZG/wdxB32bE/TeDVF51+VB25A
         OD9w==
X-Forwarded-Encrypted: i=1; AJvYcCXCML0p/gSROIIuhVOSVn6AVSXnx+KIQSzdIFLfbyokObjli983QMIY4f2Ru6TW7hgcXu6kL+NsisFfkEOK8bm17lDEbmjnrhBKAw==
X-Gm-Message-State: AOJu0YxE4Nd0kDjTLK3rrGQFamyh2WtwiI3rJD0JigYxW/P5UjXvyn61
	Ftlm8kVR0I3EQfNzxXqnpgWqWN35Ct36qE7tbON+Sxr0fVN3+jeHODYRZQ==
X-Google-Smtp-Source: AGHT+IGtyWZNV1HkYEKlW7F6WDb0z0ArOQ5SYycr3loTGEVU/lpUhHZAHMAVcwKewoW2CNClUi8kew==
X-Received: by 2002:a17:902:e542:b0:1e2:ae83:3197 with SMTP id n2-20020a170902e54200b001e2ae833197mr5428585plf.10.1714177437340;
        Fri, 26 Apr 2024 17:23:57 -0700 (PDT)
Received: from rigel (14-200-166-65.static.tpgi.com.au. [14.200.166.65])
        by smtp.gmail.com with ESMTPSA id q9-20020a170902dac900b001eb07ee30e4sm1814910plx.2.2024.04.26.17.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 17:23:57 -0700 (PDT)
Date: Sat, 27 Apr 2024 08:23:52 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Gilles BULOZ <gilles.buloz@kontron.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
Subject: Re: [questions] : gpiolib and gpioset behaviour
Message-ID: <20240427002352.GA5267@rigel>
References: <a6492fca-e5f9-3f5c-6a61-d08c051f0ac9@kontron.com>
 <CAMRc=MdQ8CT7uxBRhPmttNhm5kzp1+Vij2LmVGO0QsA0xUPtNQ@mail.gmail.com>
 <04e6ac4e-0178-c910-2dcd-45a726f75c0d@kontron.com>
 <20240426020720.GA9777@rigel>
 <76794fbe-db97-a00b-c16c-b3e4296c3b9d@kontron.com>
 <20240426133751.GA380503@rigel>
 <7a0b23d9-1a4c-337c-dda4-b6935e563ff0@kontron.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7a0b23d9-1a4c-337c-dda4-b6935e563ff0@kontron.com>

On Fri, Apr 26, 2024 at 06:16:28PM +0200, Gilles BULOZ wrote:
> On Fri, Apr 26, 2024 at 03:37 PM, Kent Gibson wrote :
> > On Fri, Apr 26, 2024 at 03:08:33PM +0200, Gilles BULOZ wrote:
> >> On Fri, Apr 26, 2024 at 04:07 AM, Kent Gibson wrote :
> >>> On Mon, Apr 22, 2024 at 06:49:05PM +0200, Gilles BULOZ wrote:
> >>>> On Mon, Apr 22, 2024 at 3:55 PM Bartosz Golaszewski wrote :
> >>>>> On Mon, Apr 22, 2024 at 2:44 PM Gilles BULOZ <gilles.buloz@kontron.com> wrote:
> >>>>>>
> >
> >>>>
> >>>
> >>> I suspect you are referring to gpiolib here - the mask in gc->get_multiple()
> >>> being unsigned long*.
> >>>
> >>> The uAPI that libgpiod uses is limited to 64 lines per request, but that is
> >>> only relevant if you want to request more than 64 lines at once from userspace
> >>> (you would have to break that into two requests to access all 112 lines).
> >>>
> >>> Note that the mask in gc->get_multiple() is unsigned long*, so it is a
> >>> pointer to an array of unsigned long.  Its width is not limited by
> >>> unsigned long, but by the bits parameter.  In your case the mask you pass
> >>> should contain multiple unsigned longs to achieve 112 bits.
> >>> Refer to gpiod_get_array_value_complex() for an example of building bitmap
> >>> masks to pass to gc->get_multiple(), in that case via
> >>> gpio_chip_get_multiple().
> >>>
> >>
> >> I was refering the get_multiple/set_multiple callbacks in struct gpio_chip
> >> that are defined like this :
> >>  int (*get_multiple)(struct gpio_chip *gc, unsigned long *mask, unsigned long *bits);
> >>  void (*set_multiple)(struct gpio_chip *gc, unsigned long *mask, unsigned long *bits);
> >> With some debug in my GPIO chip driver implementing these functions, I saw that
> >> the bits set in "mask" and the ones used in "bits" are the ones whose bit
> >> numbers are directly matching the GPIO offset/line numbers of the chip. But I
> >> only used unsigned long, not arrays, so I thought I was limited to offset/line
> >> 31 on 32bit arch, and 63 on 64bit arch.
> >> As you suggested, I'm currently having a look to gpiod_get_array_value_complex()
> >> but I must admit I'm currently a little bit lost. I've never thought GPIO
> >> implementation could become so complex for my brain :-)
> >>
> >
> > The bit of primary interest that I was referring to was the DECLARE_BITMAP()
> > as used for the fastpath mask:
> >
> >                 DECLARE_BITMAP(fastpath_mask, FASTPATH_NGPIO);
> >
> > That does the sizing math for you.  In your case you would use 112 for
> > the NGPIO.  There are also examples of using __set_bit() to set bits in
> > the mask.  Take a look in linux/bitmaps.h and linux/bitops.h for the
> > relevant definitions if you want to dig deeper.
> >
> > And, yeah, the amount of work that goes into just driving physical
> > lines up and down, fundamentally just toggling bits, frequently makes my brain
> > hurt too ;-).
> >
>
> Thanks very much for the tips !
> I've added some debug in my GPIO chip driver in get_multiple()/set_multiple()
> and clearly see that when using an unsigned long array for "mask" and "bits",
> the second unsigned long in array is used starting from GPIO offset/line 64,
> starting from bit 0, then 1 for offset/line 65...
> For instance when I run "gpioget 0 65", get_multiple() is called with bit 1 of
> mask[1] set and I return the level on bit 1 of bits[1] that is correctly
> reported by gpioget.
>
> But get_multiple is called by gpio_chip_get_multiple() than is called by
> gpiod_get_array_value_complex() that is called either from
>  linehandle_ioctl() for GPIOHANDLE_GET_LINE_VALUES_IOCTL where we have DECLARE_BITMAP(vals, GPIOHANDLES_MAX);
>  linereq_get_values() for GPIO_V2_LINE_GET_VALUES_IOCTL  where we have DECLARE_BITMAP(vals, GPIO_V2_LINES_MAX);
> so both vals with 64bits (GPIOHANDLES_MAX=GPIO_V2_LINES_MAX=64) so only one unsigned long.
> But vals is passed as last argument unsigned long *value_bitmap to
> gpiod_get_array_value_complex() that is passed as last argument
> unsigned long *bits to gpio_chip_get_multiple() that
> is passed as last argument unsigned long *bits to get_multiple() of my driver
> where I'm supposed to fill data in the second unsigned logn of array for GPIO
> offset/line >= 64 where we have only allocated one.
> I'm probably wrong somewhere.
>

get_multiple() is always passed masks/values that are (at least) ngpios wide.

gpiod_get_array_value_complex() builds a new sparse mask to match the ngpios
for the device, using the condensed array of descs it is passed.
Similarly it packs the values returned by get_multiple() into a bitmap
corresponding to the array of descs.  That is the function of
gpiod_get_array_value_complex() - to translate between a set of
arbitrary lines (descs) to the form expected by the driver.

In the case of cdev, which provides the userspace interface, that set of
arbitrary lines is limited to 64, but that has nothing to do with how many
values can be requested from the device at once from kernel space - you
can request them all.

Cheers,
Kent.

