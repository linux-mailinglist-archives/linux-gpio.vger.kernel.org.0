Return-Path: <linux-gpio+bounces-16567-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E79D6A44392
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2025 15:53:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 459C53BBE7E
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2025 14:46:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 679FC257AD7;
	Tue, 25 Feb 2025 14:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hyh9QqRA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7DA21ABD8;
	Tue, 25 Feb 2025 14:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740494795; cv=none; b=kXBQCuil4yJUo+/+j5kiMZbAulniSUJIIh2tRDm8UJpuFxU3AYjE9kqmxZLIZZEEdbEQRzayyFe/Bb2RG/QU6BZvloabWbkRSxENPHyYPKSo7GZIkxOydaBqObSxJuvU45o5MJ2xhj9eaRhVp/53RYC2w7B2AM/6hVAwRZ4H1mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740494795; c=relaxed/simple;
	bh=xRLtya76a4CWMfPZLUXOt80YfMIxPHShG70qhWNfxpU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SI/lejSbaFeueY5m+mQ1BU8mfjAX3ATjfQWGcKA6rHXXRONjo3HWXpqoeMBuA6duayQKEMxDhgVKA1s/KIDY9ZZ+fgZFs4nabdaNSfr5YGUap2pKzm+9TXj8c7C5sSKvZxz0F1AStFlWBe8AwxREo4y2DJW+kKYiYzEfNbgRImY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hyh9QqRA; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740494793; x=1772030793;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=xRLtya76a4CWMfPZLUXOt80YfMIxPHShG70qhWNfxpU=;
  b=hyh9QqRAPbMEica0aNtokanrzQct2PhXxrjnNksXs2AduT0CkzT8+70l
   /plhT5bUyuHiDIherYoeO/Ygvrfx/ZjH5V88qGnU39ZtXtLRIdEx6ubp0
   ncQFB1BuGf16H9GXgbBKLfOPPd16rkqOhWj8bykZedMy1SZdy0dA2lfuL
   P/fNwX91NVnly5QCZjoCu7wNINvz58q1zdJl4H05bFmvz9sjwvNXlTUsL
   w4dWeOzxBKO3IsB7us5p+UEcjeVKoOPeqUQ3EwtCsnkKoTOCdMm0BavFp
   dwrJPOM5FidJ9+DkH0mBosE9BSHwxJuuY+ytf9FtMAFEE+vufrr1zdGi9
   Q==;
X-CSE-ConnectionGUID: v4zCleIyQv+5dwhiiFFPCQ==
X-CSE-MsgGUID: R3GL86FISG2AhB7OWUFGoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="51934117"
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; 
   d="scan'208";a="51934117"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 06:46:33 -0800
X-CSE-ConnectionGUID: IK9Jn9FQTmKygRaa2Eyg1w==
X-CSE-MsgGUID: GvxWqsPiRQKFVGuE/vp2gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; 
   d="scan'208";a="121497166"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 06:46:31 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tmwCa-0000000F1Ky-3BCD;
	Tue, 25 Feb 2025 16:46:28 +0200
Date: Tue, 25 Feb 2025 16:46:28 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 1/3] gpiolib: don't use gpiochip_get_direction() when
 registering a chip
Message-ID: <Z73XxMwvFYjA0_6s@smile.fi.intel.com>
References: <20250225-retval-fixes-v1-0-078c4c98517a@linaro.org>
 <20250225-retval-fixes-v1-1-078c4c98517a@linaro.org>
 <Z73EIu0AqnfPU33k@smile.fi.intel.com>
 <CAMRc=MdTKCtwrDouTV4YHoWa1F8cenSVEtTXicSUdrmEk3TxCQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MdTKCtwrDouTV4YHoWa1F8cenSVEtTXicSUdrmEk3TxCQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Feb 25, 2025 at 03:43:29PM +0100, Bartosz Golaszewski wrote:
> On Tue, Feb 25, 2025 at 2:22 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Tue, Feb 25, 2025 at 12:56:23PM +0100, Bartosz Golaszewski wrote:

> > > During chip registration we should neither check the return value of
> > > gc->get_direction() nor hold the SRCU lock when calling it. The former
> > > is because pin controllers may have pins set to alternate functions and
> > > return errors from their get_direction() callbacks. That's alright - we
> > > should default to the safe INPUT state and not bail-out. The latter is
> > > not needed because we haven't registered the chip yet so there's nothing
> > > to protect against dynamic removal. In fact: we currently hit a lockdep
> > > splat. Revert to calling the gc->get_direction() callback directly not
> > > not checking its value.

...

> > I think the below code deserves a commit (as a summary of the above commit
> > message).
> 
> Can you rephrase? I'm not getting this one.

Ah, s/commit/comment/

> > > +             if (gc->get_direction && gpiochip_line_is_valid(gc, desc_index))
> > > +                     assign_bit(FLAG_IS_OUT, &desc->flags,
> > > +                                !gc->get_direction(gc, desc_index));
> > > +             else
> > >                       assign_bit(FLAG_IS_OUT,
> > >                                  &desc->flags, !gc->direction_input);
> >
> > Otherwise LGTM,
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



