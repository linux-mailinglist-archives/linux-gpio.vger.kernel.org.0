Return-Path: <linux-gpio+bounces-16311-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C90DA3DC1E
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 15:08:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A05816BBCE
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 14:07:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D2901BD9DD;
	Thu, 20 Feb 2025 14:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZYi2B1z0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E3A1B85CC;
	Thu, 20 Feb 2025 14:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740060457; cv=none; b=KqY4ML9eFq0vHtcVRMIln+XM67Sv0XOYW/aHxr49STm2LgeO66e0tO0utoymN8ZNNndi7aAMTf7yI08LbCjeRdrip/XGFeU6/STh/myRZoRA8nEWUBYFaUIuD97iDErxlkbbaKsuX0GqBp876b66Ii+HWHwp6/W1G3GxB1UiVw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740060457; c=relaxed/simple;
	bh=J7/kitJTLTdyWDF1KjUwMXmrNOH5srnmO1HoHeoc/+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qxcAjqCggMmsWkAWZGdh6u9hhJmHKZKUC6z+3OZjVT36JTgDmJE1r7RYXU+X7/okpVSsLrfy3ozxAkfbVLgUUPMUBAvnf7wgnTfeSL5Zlm6yB2HYP36RPLRurfvwtBwql3t1iwKWcL89oDeH5Mo+skSX42GZ8eH/Z8/xPPLsdPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZYi2B1z0; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740060456; x=1771596456;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=J7/kitJTLTdyWDF1KjUwMXmrNOH5srnmO1HoHeoc/+U=;
  b=ZYi2B1z0Ba79ctZY+whHaDsqFf8Kdc4u0+a1mtq2Xqs9QsVAGaP6xCBn
   36Dp+thdeXytuvr2+w++mf2BfHb/hlONLLHaPnxBN2JNqp20fD1eLM9w8
   beSmX2RTvzI/vmvklE4xRTRfeTTv6kxIB0yJEz6+KYxyWQY9IczNIFrl5
   +4JT4bJOlZhbce+AgPDRVzVd+FIZj3nWSVFUMauT9sm3fUn2vsySHS+fb
   pCpveTjbOSIVaFcP5OxHj60oFW5EUm+zPo7+tjGliDwoPpDp2kvT95OME
   xNTUI6u1uQglh9i5idccdCh6ZUopQchJHclpV0Rv2XGFSNdHUMVx6YRt2
   Q==;
X-CSE-ConnectionGUID: Im6GkdX1SACwG4oo0skOhQ==
X-CSE-MsgGUID: 7FjhPvLhQR2cJ4eMl+jsNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="28437166"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; 
   d="scan'208";a="28437166"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 06:07:35 -0800
X-CSE-ConnectionGUID: bMHiDdaCTm2xP/5SNq9DCw==
X-CSE-MsgGUID: xobgfn3fR66qb+Org96jzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; 
   d="scan'208";a="119670651"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 06:07:33 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tl7D8-0000000DM2E-3c34;
	Thu, 20 Feb 2025 16:07:30 +0200
Date: Thu, 20 Feb 2025 16:07:30 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Michael Walle <mwalle@kernel.org>,
	athieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: Re: [PATCH v1 0/5] gpio: regmap: Make use of 'ngpios' property
Message-ID: <Z7c3IhC115rPbTMw@smile.fi.intel.com>
References: <20250213195621.3133406-1-andriy.shevchenko@linux.intel.com>
 <CACRpkdao27pu+9qFH2LBYNwYkBbWq1B-hE9nZGfTTCnQxhTiAQ@mail.gmail.com>
 <Z7crrgl2iFn34gck@smile.fi.intel.com>
 <CAMRc=MfSn6xB4eNkFG7E2gQPiF+AmnaidO5=FbvPtvW0N4iDjQ@mail.gmail.com>
 <Z7cwv0gxRFFGBjR1@smile.fi.intel.com>
 <Z7cxGOmwMIkkTRLs@smile.fi.intel.com>
 <CAMRc=Mc0gaRxOBDFXf2WB2_mNxaQo+UjCc6oTM-azLzV=c3VgA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mc0gaRxOBDFXf2WB2_mNxaQo+UjCc6oTM-azLzV=c3VgA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Feb 20, 2025 at 02:42:26PM +0100, Bartosz Golaszewski wrote:
> On Thu, Feb 20, 2025 at 2:41 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Thu, Feb 20, 2025 at 03:40:15PM +0200, Andy Shevchenko wrote:
> > > On Thu, Feb 20, 2025 at 02:22:29PM +0100, Bartosz Golaszewski wrote:
> > > > On Thu, Feb 20, 2025 at 2:18 PM Andy Shevchenko
> > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > On Fri, Feb 14, 2025 at 11:50:53AM +0100, Linus Walleij wrote:

...

> > > > > Bart, do you think it can be applied?
> > > >
> > > > Andy,
> > > >
> > > > I really rarely lose track of patches. It's been just under a week
> > > > since this was posted. Please don't ping me to pick things up unless
> > > > I'm not reacting for at least two weeks. I typically leave patches on
> > > > the list for some time to give bots some time to react.
> > >
> > > I see, I thought your cadence is one week, that's why I have pinged you.
> > > Will try to keep this in mind for the future and sorry to interrupt!
> >
> > Btw, if it's easier to you, I can just combine this to my usual PR to you.
> 
> No, that's fine, let's stick to ACPI-only PRs.

Hmm... Is the Intel GPIO stuff should go directly to your tree? Seems I missed
some changes in the flow...

-- 
With Best Regards,
Andy Shevchenko



