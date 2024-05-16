Return-Path: <linux-gpio+bounces-6412-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B30C68C78C0
	for <lists+linux-gpio@lfdr.de>; Thu, 16 May 2024 16:55:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 62F33284231
	for <lists+linux-gpio@lfdr.de>; Thu, 16 May 2024 14:55:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7396514B969;
	Thu, 16 May 2024 14:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z1x1PAWI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5AED143895;
	Thu, 16 May 2024 14:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715871347; cv=none; b=XFdDw0ySgx+dVTDLCdln9VWmVOrc5pL97ekgX0Lqx92jFizC8wq3GWVPAUdrXPbqwDSES8pmeyXAiY5PZ92HdYy5ZggNs23D6TNsDO++xRZXUIN21FQEoDBNABIXU4dBbY6+HAx2NRaosT376NUXCrRdvBs/cUuvajvhwsyVNT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715871347; c=relaxed/simple;
	bh=hYOvFjvpZis3SD8JMDkaMya+05K3VkSUpk2zd5QrEXo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M/ezzEywEQtoXhtK/ISHDUaivw4G/SYtzXg0Yf45XsmfqCeiK7gGjbcVEZ60oxJbsx0+qk9nd3oul20t6KRVMmDyzXenwQcz5dfFsUcvqwplsWLKJKPV/PVkyHlCjRZj/IAZYgy1N2jdRGmEP77Oi9+d47eSgVCG02tt9dnky5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z1x1PAWI; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-6123726725eso257601a12.3;
        Thu, 16 May 2024 07:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715871345; x=1716476145; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nDcMK0e48da6xVf1sYpfFajFT57sJ47QbpcgxPOH/No=;
        b=Z1x1PAWI53wVwWp2ZjEUqbyQCKjpKhFxrz2Zi3ALzmImfebWyHzop7XIJpcYfVFTkb
         Izp2UiuoMWLh+Yx2PP5dWu4r12NLDE20gpbHkt86LA4EBxZ+POxfudl0cyTmnFHsmKh5
         IzyFlHHU4nvawzeaHpAaPdB9FRZxICTs3GWlR1pS3/BNJbaARApIHA2wGRpQ6fhm5osC
         edU8K9OMXr0QXV7QQ5tMr+X2Xwqo7Pl4fn9PjxJbASZBzpy8aUZd4YxNxNAt6LahcpKH
         wy0slyRjr/cQACpaVplEpYGnPjeQXJXy1R5VyJAN+v2jtSs/K0VO5+sQYKXbLZU15/zH
         eGbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715871345; x=1716476145;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nDcMK0e48da6xVf1sYpfFajFT57sJ47QbpcgxPOH/No=;
        b=w0o081JDlu7SAz4OmSXW8rIdTAAG9u8qSaztSBE2YtVfKI/9/D7ZAIGcX0AXPLezrF
         /qskthMx0g7KUErHHjBjSdAd+S6pUcDGUJBx+QGNU7DMMZ8Ya8BO5cg4Wy/1eE7nYikE
         2kTxMgzjPo0V0QOWypXJJshvFrU6+X0mngRuJ7pL7bFg37bJG6KegP3UmDPjenFLkTXc
         x3/oyt/u7TI6svsqeSIA2ragCWG6kTF0kc1PUwIc7ZH96QhEaCag3Q/bx53pXvJb7zTy
         vnZye7BbnPpy5mC/Ze8vTNfYrB1bIX3/wK7CqQnI1Zv040ubWcB88i9EkwY1+g/qUKQI
         vRjw==
X-Forwarded-Encrypted: i=1; AJvYcCXx+D8evaaJKplQVsgw8R8UDONtvS0f4Ggcs67cwaija504veHcNGMgdN9wnwLMicz4Gc9KvApuqmy3JQmTrkSEhWjK6w9dnSqfCDPZeWIK3zG7ux8Hf6XJ5yEUGmwDATzZQb8Mex7GAg==
X-Gm-Message-State: AOJu0Yz0RN8UJktzOVodLULBvG3Yjd0pciHvdaPqVIFtgMYkJCZ/oUJD
	5Ri58tJzv8lvAh01XnPMqDMRcrf+Q2xtXLQYBGtGG89gqN996nBI
X-Google-Smtp-Source: AGHT+IHASo+wOOb0f80Gdm7URvd+aSILCXWDs+2WiUOYBwoVXeeTjebdeogxFHQSovHxKzBXLtt1oQ==
X-Received: by 2002:a17:90a:ff91:b0:2b6:ab87:5e5b with SMTP id 98e67ed59e1d1-2b6cc140159mr17239489a91.9.1715871345185;
        Thu, 16 May 2024 07:55:45 -0700 (PDT)
Received: from rigel (60-241-107-82.static.tpgi.com.au. [60.241.107.82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2bc9bce16d6sm1133963a91.19.2024.05.16.07.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 May 2024 07:55:44 -0700 (PDT)
Date: Thu, 16 May 2024 22:55:40 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Hagar Hemdan <hagarhem@amazon.com>
Cc: Norbert Manthey <nmanthey@amazon.de>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: prevent potential speculation leaks in
 gpio_device_get_desc()
Message-ID: <20240516145540.GA116534@rigel>
References: <20240514122601.15261-1-hagarhem@amazon.com>
 <20240514124221.GA76024@rigel>
 <20240516125742.GA14240@amazon.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240516125742.GA14240@amazon.com>

On Thu, May 16, 2024 at 12:57:42PM +0000, Hagar Hemdan wrote:
> On Tue, May 14, 2024 at 08:42:21PM +0800, Kent Gibson wrote:
> > On Tue, May 14, 2024 at 12:26:01PM +0000, Hagar Hemdan wrote:
> > > Users can call the gpio_ioctl() interface to get information about gpio
> > > chip lines.
> >
> > Indeed they can, assuming they have access to the gpiochip device. So what?
> >
> > > Lines on the chip are identified by an offset in the range
> > > of [0,chip.lines).
> > > Offset is copied from user and then used as an array index to get
> > > the gpio descriptor without sanitization.
> >
> > Yup, and it returns an -EINVAL, via gpio_device_get_desc(), if it is out
> > of range.
> >
>  In case of speculation executin, the condition (hwnum >= gdev→ngpio)
> may be miss predicted as true and then the value of &gdev→descs[hwnum] is
> speculatively loaded even if hwnum >= gdev→ngpio.
>

Ok, I mis-understood the problem.  I probably still don't understand it.
The problem is that userspace may trigger a speculative read of an
address outside the array, and that is a problem, even if that address is
never returned, as userspace can trigger speculative reads of arbitrary
addresses?

And the fix is in cdev, rather than gpio_device_get_desc(), as the
offset in cdev is known to be from userspace?

> This macro "array_index_nospec()" prevents out-of-bounds accesses
> under speculation execution, ensures that bounds checks are
> respected even under speculation and not moving out of bounds into bounds.

In that case, I clearly don't understand what array_index_nospec() is doing,
as if it does NOT alter the offset being passed to gpio_device_get_desc()
then it must be performing some serious voodoo to be changing the behaviour
of gpio_device_get_desc() which performs the actual range check and indexing.

Its doco says this:

/*
 * array_index_nospec - sanitize an array index after a bounds check
 *
 * For a code sequence like:
 *
 *     if (index < size) {
 *         index = array_index_nospec(index, size);
 *         val = array[index];
 *     }
 *
 * ...if the CPU speculates past the bounds check then
 * array_index_nospec() will clamp the index within the range of [0,
 * size).
 */

Looks to me like it should be applied AFTER the bounds check.
And the code appears to apply a mask to the index:

	(typeof(_i)) (_i & _mask);					\

Now I need to test your patch to see what it actually does.

But assuming it does fix the issue, without changing the offset being
referenced, you might want to check ALL the places that cdev calls
gpio_device_get_desc() - you missed a couple.
I count five, you patched three.  What is special about the two you missed?

For both reasons, perhaps it would be more appropriate to perform the
array_index_nospec() in gpio_device_get_desc() itself?

Cheers,
Kent.

