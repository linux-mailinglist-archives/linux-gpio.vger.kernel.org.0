Return-Path: <linux-gpio+bounces-13002-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2A99C8921
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2024 12:39:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C5EB8283F8F
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2024 11:39:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B24151F8F0B;
	Thu, 14 Nov 2024 11:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="basJ6Qpo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 061251DB52A;
	Thu, 14 Nov 2024 11:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731584389; cv=none; b=PuZgowxUcG9LS0N0IqsA0hpr9KzbdpTRIL4YLZeO2y3HwPcuK7FC5w43rljTBBLQ8xGpeqAZpbgNpuub+aSgsgSH88CFYiwnavqI+Pqus0eL/DmFPmOrZhpGcsuBVsqCgl1p0/L8pce1K2WLLw3nCpp2L6w9G61DcpaENH0f0po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731584389; c=relaxed/simple;
	bh=ssj4QN2ssANxuRJs3rhOmn3BjPTn+f/nHeu4LH/TzUw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PaBXk8FffDkllqmeReTy3RpiigFf3vL6lOGW9uVgJyxlfNYCYJ8UqSi9W37uozTyNrqh92qHCBVw99SoFvFzLiGkeyYnhcR+MlledQvYufz4rCN9ivM4tDAE3cwRd1jlFpJ8JbgRndwXR41ubs5XP5EgfSCDinXXzu5rHOblE+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=basJ6Qpo; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731584388; x=1763120388;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ssj4QN2ssANxuRJs3rhOmn3BjPTn+f/nHeu4LH/TzUw=;
  b=basJ6Qpo3xqyQpURSTDyOxWpKFwA1n3LpoUNgyi2TNa1vYSBBpx953wd
   0B+osbvcH+o5BFMFWVgFzZ2C+hZh+OD6JV9mTgRG2LOvnVLPSTHiWO7/a
   BBJeB0pAZK6rrxkDzVKlGdEzAIlTmzGZuAZ6oSYh3jtAPlwHEkC+VpVqz
   QZ1wMGQUaqPwH7grjG1CJjtyK9tWw0w4iae2aB8/AZa/emALDrNt1cLhG
   L6On38DdQBndmKFssADqRkx73mtkkVcrEqEcQIQWgo+ckw5Gi/QZLq4gu
   ts8hdWWNqMuU3DNk1++sygrAxEgM4hFsYO8br8rrKnq5ntm4PaipBFJyY
   Q==;
X-CSE-ConnectionGUID: arnmtLEkQneS1751cBZUrw==
X-CSE-MsgGUID: JD7Ax9UiQ4K3UyvNfLxHjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="48966412"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="48966412"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2024 03:39:47 -0800
X-CSE-ConnectionGUID: ywBz4QCASki0MCNOWGd3aA==
X-CSE-MsgGUID: RBYMWs4jS9m3VK4TMBs3iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; 
   d="scan'208";a="92240620"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2024 03:39:46 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tBYCN-0000000EhMA-3lND;
	Thu, 14 Nov 2024 13:39:43 +0200
Date: Thu, 14 Nov 2024 13:39:43 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] gpio: Move and sort Kconfig entries as suggested
Message-ID: <ZzXhf2zM9IisvZhs@smile.fi.intel.com>
References: <20241113171219.2949157-1-andriy.shevchenko@linux.intel.com>
 <CAMRc=MeaDjhxAwmTcNZ+oHniFn4EWVEmfP8MdNWitmD+Rr=scA@mail.gmail.com>
 <ZzXTbEcrLigXWpAu@smile.fi.intel.com>
 <CAMRc=MeEtyTXr6A4gXbbN=ZY1tzAQnbVMF0NYA2_6Xm3=jfS6Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MeEtyTXr6A4gXbbN=ZY1tzAQnbVMF0NYA2_6Xm3=jfS6Q@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Nov 14, 2024 at 12:15:46PM +0100, Bartosz Golaszewski wrote:
> On Thu, Nov 14, 2024 at 11:39 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Thu, Nov 14, 2024 at 09:54:50AM +0100, Bartosz Golaszewski wrote:
> > > On Wed, Nov 13, 2024 at 6:12 PM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > >
> > > > The Kconfig under drivers/gpio has a specific comment
> > > >
> > > >   put drivers in the right section, in alphabetical order
> > > >
> > > > but in time some of the entries fell unordered there.
> > > > Put an order again.
> > > >
> > > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > > ---
> > > Could you elaborate on why you're moving drivers between categories?
> > > For instance: you moved Intel LJCA to USB drivers and I'm sure you
> > > have a reason for it (it's not clear if this actually is a USB driver,
> >
> > This one is actually clear as you see that it depends on USB_LJCS which
> > suggests that it's USB based.
> >
> > > it's not registered as such
> >
> > Neither one of the existing ones in that category, right?
> >
> 
> Well if you really want to open that can of worms...
> 
> Only gpio-mpsse is really a stand-alone USB GPIO expander. Others in
> this section are actually MFD devices and would probably better fit in
> there.
> 
> I don't have a strong opinion but we should at least be consistent.

So, as far as I can read the whole picture the categories are based on the HW
(and this is how it should be) and these what I moved _are_ true USB devices.
Linux abstraction is just a Linux abstraction.

If you want consistency, drop these categories for good, just have plain list
of the all GPIO drivers. No room for any speculations :-)

> > > ) but please expand on it in the commit message.
> >
> > Okay, I will do in v2.
> >
> > Thank you for the review!

-- 
With Best Regards,
Andy Shevchenko



