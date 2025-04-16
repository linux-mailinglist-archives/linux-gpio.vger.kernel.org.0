Return-Path: <linux-gpio+bounces-18934-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5868FA8B61B
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 11:56:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04DF75A09F9
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 09:55:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BE922376E6;
	Wed, 16 Apr 2025 09:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BAKKmEDx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84D62376EA;
	Wed, 16 Apr 2025 09:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744797287; cv=none; b=XJ4TLA3kX76hZD/eqPFFrWK8+L0tI8mPY/8U4e9dTX7S0O7wmlDd0ZwbfzjGGCcMiu1WAX7A3QOkJKysn1fCcaEMJ6fMy4hDXuFzNuJ2lid7/WFHvBTelvhrE2mtAhSqXMDgGEHdo031bVUj2Eb/07dBzoWtvdPubCZHcPTVgB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744797287; c=relaxed/simple;
	bh=zuCOpoMhBHDDmAEItGzQrZWytrwV0y3ptTaaTtwmkXs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I0OVsAvItaBYw8Ko7twLZ0Uku+1mRfQ5Fas15Rlga1uf1JVBL6I0nnCaVajzlprw1F44qk8skmgJVWllyJAzknZElYUQeQhCi4Gai7ILm4iLtoIG4ugwKQ+I9gysuTTkPJWkK99vdllNVQq4nMpFs+f966kGRtK9whDOQQMkze0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BAKKmEDx; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744797286; x=1776333286;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=zuCOpoMhBHDDmAEItGzQrZWytrwV0y3ptTaaTtwmkXs=;
  b=BAKKmEDxW3QcPzGGa4PgNUom6XQdHa9t7xd04eLhlCQmW1bkmGPkF4ws
   fZ2o7JIiROr5VFre8QV7BkceoTAjOfLAoZYY8QoIyLsK3QfdB3D1qZan3
   84LToT7GSe0wOZSGSA8Z2zTU5F+/O6lYOA1vQRu/+goPhI9iKckASA78X
   3bs97NX6v41tDeFGJ6u6xen+Ba4PJy4DC+q5Atv/Gtw8HrTaojR7kMreG
   dum1WyfzYXq8mUzHAJBtN5w5NvzEFJ2IiHzRSe0V2v2JF6DBW88Jxa6tR
   14KHU9LFFocqjKZ9re5X4U+pSYp6RbY7fnoGkwVCkgjTs/QU6m3amAZl8
   Q==;
X-CSE-ConnectionGUID: /MxTHnDdQW22jXjAO32Xqg==
X-CSE-MsgGUID: zVyga45aSqG2xS3u2/cQkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="56513884"
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="56513884"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 02:54:45 -0700
X-CSE-ConnectionGUID: AGtOoZZFQ7S4U48FU/btPw==
X-CSE-MsgGUID: hzKtPsBqRlqwdm7oO3jLMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="167582962"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 02:54:44 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u4zTd-0000000CoZB-0po7;
	Wed, 16 Apr 2025 12:54:41 +0300
Date: Wed, 16 Apr 2025 12:54:40 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v1 4/7] gpiolib: Call validate_desc() when
 VALIDATE_DESC() can't be used
Message-ID: <Z_9-YCWKVaXqsJ2N@smile.fi.intel.com>
References: <20250415111124.1539366-1-andriy.shevchenko@linux.intel.com>
 <20250415111124.1539366-5-andriy.shevchenko@linux.intel.com>
 <CACRpkdbvnL0z1x0An2Bhv1TdQxaz4vtBpVBDXUe+LCK68FM=dA@mail.gmail.com>
 <Z_91lpPIjtXvYbap@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z_91lpPIjtXvYbap@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Apr 16, 2025 at 12:17:11PM +0300, Andy Shevchenko wrote:
> On Wed, Apr 16, 2025 at 10:44:18AM +0200, Linus Walleij wrote:
> > On Tue, Apr 15, 2025 at 1:11 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:

...

> > >         if (gc->to_irq) {
> > > -               int retirq = gc->to_irq(gc, offset);
> > > +               ret = gc->to_irq(gc, offset);
> > > +               if (ret)
> > > +                       return ret;
> > >
> > >                 /* Zero means NO_IRQ */
> > > -               if (!retirq)
> > > -                       return -ENXIO;
> > > -
> > > -               return retirq;
> > > +               return -ENXIO;
> > 
> > Totally unrelated change - but I'm fine with that :D
> 
> It's not totally (it's a reuse of the same variable), but I can split it.
> Bart, what do you prefer?
Never mind, I will send a v2 soon.

Linus, I will leave your Rb tag in a split patch as it seems you've reviewed it
as a whole already.

-- 
With Best Regards,
Andy Shevchenko



