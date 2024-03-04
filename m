Return-Path: <linux-gpio+bounces-4093-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B0A870019
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Mar 2024 12:16:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 71B6F286549
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Mar 2024 11:16:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F231E383AF;
	Mon,  4 Mar 2024 11:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YnQjtu01"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC5138392
	for <linux-gpio@vger.kernel.org>; Mon,  4 Mar 2024 11:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709550984; cv=none; b=dOJLtjRTd6joJnEzIFksUuN65fIh7ivq5YfvvSZIdZ3MEY3NvzVM54H9yvFLYGC8Tk6cyBfUUzGWax4UvY4AbBnd1t89eNQJNwws581N9GSxWU2TuIDFL0MYwOHSVRo36ampTGdJX/p8kFfNn7X9DpjLdt3v2laP85ZfZ/gpotc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709550984; c=relaxed/simple;
	bh=mTk2pfDgd5k5SLLk+E10o3tJaaq+Xnvli2Oub8jvq2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qz+h10OuYSnXkDi76TtjnadfSUiOsmYm9zZmwBgcoY+xxgQQnS+y2SPzNOKVjGdeDBzBq4SkhJr0z4UoQx5KmocCJYfrN3j+Nqy0ZgpfqUdU+1vxHhwOMAyaKPkf/btP6DaCJGDmXYxUrhOOBum8aveHKS9fHhZeiu133NvH7/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YnQjtu01; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709550983; x=1741086983;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=mTk2pfDgd5k5SLLk+E10o3tJaaq+Xnvli2Oub8jvq2s=;
  b=YnQjtu01YQ7RyuMHbgDGFDkMF6qifxft9gd7R0nYUCjF5iLtn+VIZrZz
   HLb7LVT6eSDsyKwtjrw82EICsXnxszUDKwaF3cfHWQKK852QIl227BZwo
   GMcuk5/mnTuBbw7QtEZ96W3dBMlYpwW+3/JbpOXoDLXLT6jY7Lz36wLgf
   PUzhFbNT5HswuNLDD4iNwi9uQrwM2nYPg0gTTOW/a/B+S9L5kn1cngAX3
   ILGpXdAAOuEIlbFQJyJ6gfZUfBzCzF9MBHwhNVUl7QMxoFyuk/HqBINmJ
   z++3fcKkb6zUg/SgUq9YvEuM5ymZt0O4kPFbYG2gvID1mm9pm5DUZ5Cne
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="4202780"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="4202780"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 03:16:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="914103060"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="914103060"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 03:16:21 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rh6Is-00000009hL8-3y0P;
	Mon, 04 Mar 2024 13:16:18 +0200
Date: Mon, 4 Mar 2024 13:16:18 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>
Subject: Re: Immutable branch for nomadik-gpio rework
Message-ID: <ZeWtgsRaW7jmjM8d@smile.fi.intel.com>
References: <CACRpkdbCniO7imk3+EfhAqR11Wj9NFnR08d2+Hf_oXks5QKzqw@mail.gmail.com>
 <CACRpkdY07F=kq=MZq94WJdf18VXFpsO_SvaDvF_B4zPUzUiVrQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdY07F=kq=MZq94WJdf18VXFpsO_SvaDvF_B4zPUzUiVrQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Mar 04, 2024 at 11:22:12AM +0100, Linus Walleij wrote:
> On Mon, Mar 4, 2024 at 9:38 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> 
> > I prepared an immutable branch with Theo's rework of the Nomadik
> > GPIO driver, including some icing on top from Andy making it a solid
> > rework and cleanup series.
> 
> Nix that for now, I discovered that it doesn't boot on the Ux500 anymore :(
> 
> I have to backtrack and see what the problem is. At least two patches
> are regressing.

Since MobilEye works, I believe it's deeper than just my top patch.

-- 
With Best Regards,
Andy Shevchenko



