Return-Path: <linux-gpio+bounces-13271-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D159D8A52
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Nov 2024 17:29:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 76368285115
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Nov 2024 16:29:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FFE91B4159;
	Mon, 25 Nov 2024 16:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kn25X9sS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16B01AAE0B;
	Mon, 25 Nov 2024 16:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732552156; cv=none; b=l/6BU9AjbBKYbFf0Mqs7z9OpysU/CWUhbK9zAQ6zY/T1UmINAjuz/uwLxK6i6TOBztZHNxqCwglsYVUiGC8MdVFP2QXoHisqrTxhfIhwK40W5cyucPUwSip8iItaFAnfrxntcsfiB1coX/0zqHAO0knhVmTVYjq2PHHxURSvyPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732552156; c=relaxed/simple;
	bh=7CHDorCTZ7Bu0ktvY2Ks/q6Ou5Xj8eAWjvi4mUfIOug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EV1MyGDcbEP7ayCrtRfxcgJaSgDKUOxHrOhX48wETRHcoQgeSJds9gwSqh0VvoZpZ+OyyiTIOtu/Z1TobOgE0ZhW7kBMAMvUEEVczAWadzcBUkdgjoWaLPnSDhnJPH8cZ6Feso9dF8dsaoT5p8LmmUqdz+sESDfdkbG7G8Vo3BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kn25X9sS; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-724f81aff1bso1280925b3a.0;
        Mon, 25 Nov 2024 08:29:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732552154; x=1733156954; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i+A8nPljx3gSA6pHmNcksj151HYY6Jn8odHijQLV/LY=;
        b=Kn25X9sSW5NYjFdANVwgzY4WOLEsDWzZbGzI+DDqhV9RGGzkq4Sn68luNp5kaN0Vdq
         WzoW9ve+NNRexb8wwYwz0B+XOLDQFv4exMRJULAjt2XPhK3ttzScg33uczIgjxbQIKxO
         4DuEjrYKDgd4ucl8dpNy03ZP5hcpmIghGuhuJlRa376E4HYo2rnY7fw/W2wYOiR0z4Nu
         KujDDcXDYhqXzz5YX2RF+QeMbdupPC65krIPJDbQXSFKAa2IA2xBLM1jYj/GxokQn/4+
         5fD4VkByJl2AQeq7XrISN0BGTUNHiKYun0a+Q1keOJgGqG+h+7CTl9Fe3BYnv4Wwqfj/
         3HKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732552154; x=1733156954;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i+A8nPljx3gSA6pHmNcksj151HYY6Jn8odHijQLV/LY=;
        b=MIrOQOTOwXyZO4VRGEQ5+Qj5xaDpB4ip4mut5fYDett1Q9SJp5wzklABSE6/+h7Kz4
         NTNFhU1fXSVSBTq57mTTHzuuyhDy1HMi+Dx82+BlhfSPUt2SQ5lOUWuKq5s1H5IN3FPi
         0/vjc0ZYBHQ8QKA3ZuWPBlZOyJtk8oxRfMxAveEndStCrAkFsFlDhtOMHmuHIkc9Em81
         BHo68uNGDXipF1KIeMgfM1eBlDmXPpnvL+kdSdAn8TVKv+JkrskaOeOKyzicIdpvFxae
         D1EcdbpOSJ2xigWp647ftxe/TC25B8+Xo19LWMXJbzKvfnO932plznEgE0rgi3h79AVC
         uSsA==
X-Forwarded-Encrypted: i=1; AJvYcCUIsY6pWZoHFdX6rN/2tnE2s2IP8U2urVGXZrfYByqpAeRhcnLEYDIYRfy+nnruSYnTaihOyFPazajd@vger.kernel.org, AJvYcCUwy0pMZivfkDcRH0H6im99EhIUZADAcn2oG//EqGoyLQXrZ04OA5La4PXNrmOmiLqsOjg/qjkgsbxiYbs=@vger.kernel.org, AJvYcCV0aaxjSVEpCnWBr3EeBIHt0Ev3i5sVU5QRHewUdEOZ/iIuxfuNwPKS59PPD+/ge7Q9MLIDA0wQL69Iz5qV@vger.kernel.org, AJvYcCW8ftWmGjw14Yp6/q44CxDkX3pZENWQFP50x8AIAzm4BYd3HQG7U0Ur26H2wraO5ZNHP48ebCjs21/0d+g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhwN+YRTNcQwG+b2jhRYty0MmkYK3LfAy6Gr8KNqrOf52q53vd
	E3HeyXFm7zQgr79RUUu4VhvLMxl5Wgs0/qq1XdOnY9ISvqFXYzDK
X-Gm-Gg: ASbGncv6C8r+2NeQYvmCVYlQkmaRbPWaoMGwbJugDh3YLFNirThAM/OljcXuf8VH0Em
	C5v99qU4rVpM8b0dp2Fu0cUJeh9oNj7PTOzL+XfvwR0kl5riO2O/SEfcOPm9LwsM7GGirDt9vvK
	XAO7NqJgkAm1MxSkEjJBrcrxRL1FhKK7ztj1uilJr1mDFUIgdHPA5b0tGOcS/S2oUD1s82nlJb6
	uDV+MNdnT3qSdFCslGV1vWCa56UBmiIIPFihZMSMewrR+/a3Q==
X-Google-Smtp-Source: AGHT+IGMjfORY4G2Z3By46rHhcyQliFE/uTnBX/KR80Uos+nmocbIlNrlTTLnPhaRKRC051WIt7Tlg==
X-Received: by 2002:a05:6a00:8989:b0:724:ea71:a53d with SMTP id d2e1a72fcca58-724ea71a6c0mr14917545b3a.9.1732552153829;
        Mon, 25 Nov 2024 08:29:13 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:4361:9de4:5f0:5217])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de5762bfsm6791936b3a.184.2024.11.25.08.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 08:29:13 -0800 (PST)
Date: Mon, 25 Nov 2024 08:29:10 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	gregkh@linuxfoundation.org, linus.walleij@linaro.org,
	mika.westerberg@linux.intel.com, broonie@kernel.org,
	pierre-louis.bossart@linux.dev, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v1 1/5] devres: Introduce devm_kmemdup_array()
Message-ID: <Z0Sl1gmYc3y11riD@google.com>
References: <20241123200527.7830-1-raag.jadav@intel.com>
 <20241123200527.7830-2-raag.jadav@intel.com>
 <Z0LPyMed-4a8cajD@google.com>
 <Z0QsAm3FdZDJ8kY0@smile.fi.intel.com>
 <Z0SS3cO4acfgz0iQ@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z0SS3cO4acfgz0iQ@black.fi.intel.com>

On Mon, Nov 25, 2024 at 05:08:13PM +0200, Raag Jadav wrote:
> On Mon, Nov 25, 2024 at 09:49:22AM +0200, Andy Shevchenko wrote:
> > On Sun, Nov 24, 2024 at 07:03:36AM +0000, Dmitry Torokhov wrote:
> > > On Sun, Nov 24, 2024 at 01:35:23AM +0530, Raag Jadav wrote:
> > > > Introduce '_array' variant of devm_kmemdup() for the users which lack
> > > > multiplication overflow check.
> > > 
> > > I am not sure that this new helper is needed. Unlike allocators for
> > > brand new objects, such as kmalloc_array(), devm_kmemdup() makes a copy
> > > of already existing object, which is supposed to be a valid object and
> > > therefore will have a reasonable size. So there should be no chance for
> > > hitting this overflow unless the caller is completely confused and calls
> > > devm_kmemdup() with random arguments (in which case all bets are off).
> > 
> > Don't we want to have a code more robust even if all what you say applies?
> > Also this makes the call consistent with zillions of others from the alloc
> > family of calls in the Linux kernel.

Having a clean API is fine, just do not bill it as something that is
"safer". As I mentioned, unlike other allocators this one is supposed to
operate with a valid source object and size passed to devm_kmemdup()
should not exceed the size of the source object. There is no chance of
overflowing.

> 
> Agree. Although shooting in the foot is never the expectation, it is
> atleast better than having to debug such unexpected cases.


Then maybe have a BUG() there instead of returning NULL? I know BUG()s
are frowned upon, but I think in this case overflow is really an
indicator of a hard error by the caller which is passing garbage
arguments to this function.

Hm, I see we have kmemdup_array() already. Ok. How about making your
devm_kmemdup_array() be similar to kmemdup_array()?

static inline void *devm_kmemdup_array(struct device *dev, const void *src,
				       size_t n, size_t size, gfp_t flags)
{
	return devm_kmemdup(dev, src, size_mul(size, n), flags);
}

This will trigger a warning on a too large order of allocation in
mm/page_alloc.c::__alloc_pages_noprof().

Thanks.

-- 
Dmitry

