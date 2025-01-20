Return-Path: <linux-gpio+bounces-14947-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A39A170FD
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Jan 2025 18:07:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 269CE7A167D
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Jan 2025 17:07:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 356F41494CC;
	Mon, 20 Jan 2025 17:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sc8kcL9J"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44FD41EBFEB;
	Mon, 20 Jan 2025 17:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737392862; cv=none; b=S/n2IFAAMbGLOYA+sDnbkfYWND+WMoNNIwKA4v/jh4m87PrtFvxdMEiGhmbAIOz4Y2kj27wl7OySiLC9P/M8RvKtevCVAUuZHnMsNsT+SJah/1N+qTfzkLXUfRe0K3YVbTtyvTw1ERuCBaRjzDgwfveIYmyAnebj2BdyP6yinWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737392862; c=relaxed/simple;
	bh=TA6gQCSQC2cRk1mZEHlp4Hew2mvEXcoPur0MMbOMe0o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uHiG2AcoOSteMB+le6ucs3bBjy7RtdLHfnF+Kap4cxf1+WChngiWEEMMMNQATR2/PoapfnVkAB2xewF+NJMgaW105bVhCwS8d6ip2kUnHHC3tswqpzyzaRD4Qmoue9Ri4fbxSpsJ/rI7O/fAzoLgzeyLbUbCytBo4UhKcjMfdU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sc8kcL9J; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737392861; x=1768928861;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=TA6gQCSQC2cRk1mZEHlp4Hew2mvEXcoPur0MMbOMe0o=;
  b=Sc8kcL9JG6AVIRBS1IpT2kb8mmfVq6B2dfv9JIUBOIpHdcJj8ri9ITdx
   NidHOLF354MKiPWc37eBVd0eExoVgUEG94ynb4fXFWN8oeNypZgKXZ7nx
   J1CU1X1Yp9IR+FQr9+5pINtya2AcJfUv9DQI2JaoE/VrbwkGiRGeAI495
   sAeA493xHXQVl4E9G/+YNRxnmB2qSOKlcJIxefk8bWzokFj2ymg7L13tD
   QhgM3jYgq3mETTkL/9gmQ6ZWNM8w5k1+aHryXLlYHnlS8JFKrcXmRbgB4
   i/o+NunNpdMDS7WchI7VvD4Ksmj6+er6adyqoKcqvGLL0Btz9yfQAstt9
   w==;
X-CSE-ConnectionGUID: jfqNBCdETzmOm7z5qPqDhA==
X-CSE-MsgGUID: w0T/gOXqR96EWyUXrTrDEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="37821196"
X-IronPort-AV: E=Sophos;i="6.13,219,1732608000"; 
   d="scan'208";a="37821196"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 09:07:40 -0800
X-CSE-ConnectionGUID: Ac9brgF6S6STqGH535utkg==
X-CSE-MsgGUID: ER6BqF4sR/qeBBB7f9+7LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="107478833"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 09:07:37 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tZvFN-00000003V7c-3w45;
	Mon, 20 Jan 2025 19:07:33 +0200
Date: Mon, 20 Jan 2025 19:07:33 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: Greg KH <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	mika.westerberg@linux.intel.com, dmitry.torokhov@gmail.com,
	broonie@kernel.org, pierre-louis.bossart@linux.dev,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 0/6] Introduce devm_kmemdup_array() helper
Message-ID: <Z46C1bZ4AMLvKTn0@smile.fi.intel.com>
References: <20241126172240.6044-1-raag.jadav@intel.com>
 <CACRpkdZqdE8gQCre=zR2cN17oKfwBSnWuVwzQsbRO7-ENVnPNg@mail.gmail.com>
 <Z0nNnsmYIil0OZpy@smile.fi.intel.com>
 <Z1Rfuo3jq7rO0cqb@black.fi.intel.com>
 <Z1r0EPC9gumruFKU@smile.fi.intel.com>
 <2024121242-saturday-aqua-9ac6@gregkh>
 <Z1sObNubEnsFwzOD@smile.fi.intel.com>
 <Z4kcxQWeL09VARfK@smile.fi.intel.com>
 <Z4pwksY3Bs4taZd3@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z4pwksY3Bs4taZd3@black.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Jan 17, 2025 at 05:00:34PM +0200, Raag Jadav wrote:
> On Thu, Jan 16, 2025 at 04:50:45PM +0200, Andy Shevchenko wrote:
> > On Thu, Dec 12, 2024 at 06:25:16PM +0200, Andy Shevchenko wrote:
> > > On Thu, Dec 12, 2024 at 03:39:57PM +0100, Greg KH wrote:
> > > > On Thu, Dec 12, 2024 at 04:32:48PM +0200, Andy Shevchenko wrote:
> > > > > On Sat, Dec 07, 2024 at 04:46:18PM +0200, Raag Jadav wrote:
> > > > > > On Fri, Nov 29, 2024 at 04:20:14PM +0200, Andy Shevchenko wrote:
> > > > > > > On Fri, Nov 29, 2024 at 11:17:02AM +0100, Linus Walleij wrote:
> > > > > > > > On Tue, Nov 26, 2024 at 6:22 PM Raag Jadav <raag.jadav@intel.com> wrote:
> > > > > > > > 
> > > > > > > > > This series introduces a more robust and cleaner devm_kmemdup_array()
> > > > > > > > > helper and uses it across drivers.
> > > > > > > > 
> > > > > > > > For the series:
> > > > > > > > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> > > > > > > > 
> > > > > > > > It seems like Andy will push it to me which is excellent.
> > > > > > > 
> > > > > > > Yep, that's the plan after we get all necessary ACKs.
> > > > > > 
> > > > > > Greg, anything I can do to move this forward?
> > > > > 
> > > > > Greg, is it possible to give your Ack or comment or guidance of the preferences
> > > > > with the first patch?
> > > > 
> > > > $ mdfrm -c ~/mail/todo/
> > > > 2293 messages in /home/gregkh/mail/todo/
> > > 
> > > Oh my...
> > > 
> > > > Please be patient.
> > > 
> > > Sure!
> > 
> > Raaj, care to send a v3 after merge window closes?
> 
> Sure, and perhaps add a few more users which I found with my improved
> grepping skills.

Okay, thanks! I will drop myself from this thread then. Waiting for v3...

-- 
With Best Regards,
Andy Shevchenko



