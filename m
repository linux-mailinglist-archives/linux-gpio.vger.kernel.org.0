Return-Path: <linux-gpio+bounces-14908-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9917AA15256
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jan 2025 16:00:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08B433A6D0A
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jan 2025 15:00:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 153E018B464;
	Fri, 17 Jan 2025 15:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mPzkbNKV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22B99443;
	Fri, 17 Jan 2025 15:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737126042; cv=none; b=DWWxhuUJA7AWHQ1bpU6g0Y0gU65whG1j9gTw2Snze4JL/jMRM4+/lZHt21dI+zs0X2W2Y2MK/XoEq6G9/YHXbPATTrkG857x6KWbg2ddKCQcV17mrQ18zPoOSGFK9LrJWb22WE0UYOZgNK4JW+dogIpX8bKi0utbaiuZ7dDzvsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737126042; c=relaxed/simple;
	bh=4akq75pIbOM3fLGG4fLTMi+FoMByRx3b9u8qL6SIt1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cJ9eNNGbt6wbynQBMu1buUjtHgTfxTaxIIFGPiDbgO0gC0ptwPE8n/hctQnnu2VTT4DNH2pwkY2mc8uGsyIp5YKi819W3t3H860s2qroXKy8geEGWgsHHc7A9pzQltgigYEs2HFOjME+aiumxyaVxfkOYgPYdtfzlbWs9LITRoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mPzkbNKV; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737126041; x=1768662041;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=4akq75pIbOM3fLGG4fLTMi+FoMByRx3b9u8qL6SIt1c=;
  b=mPzkbNKVMnjBmFUkbiCEsjhAhqz4aMri9XOpPkT509/g9LnvUcvq30+o
   zHXgmko8N5XNVRNQcBmPg4wDwJMnwT6mS5cM0zUzU/Xkl5fhGKyWnek4b
   YEilKOTWMwGNwoMBRm01PtH9kG51O8etHBx1BBzloDOC4Sr8FUeC64DK+
   dfZ0agNHwmJXifYefu+RWz3HnscycO2mFTxP8kSP42R+KuU3Ee4DhBZ94
   GGlN7NFz18zpGSS+QQfNMQxbUHkI3WFMIQf+CM6/PJy5UNeDa0PQ2pHwF
   zjaxT2jc+ahkQRWpsT6+vhZeD4jtQHdjPmLP6ZRGj23+zX6g0CqEV8Tpb
   Q==;
X-CSE-ConnectionGUID: /Sa3O3Q5Q0uJx26qbFWgiw==
X-CSE-MsgGUID: FNV4iQoJRUqKI/Cxz9Liaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="40369072"
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="40369072"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 07:00:40 -0800
X-CSE-ConnectionGUID: L58WUnm8S9+fySkhEEcPOQ==
X-CSE-MsgGUID: 54gAG4yfTX6NSNeagxFYsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="136710450"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 07:00:37 -0800
Date: Fri, 17 Jan 2025 17:00:34 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Greg KH <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	mika.westerberg@linux.intel.com, dmitry.torokhov@gmail.com,
	broonie@kernel.org, pierre-louis.bossart@linux.dev,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 0/6] Introduce devm_kmemdup_array() helper
Message-ID: <Z4pwksY3Bs4taZd3@black.fi.intel.com>
References: <20241126172240.6044-1-raag.jadav@intel.com>
 <CACRpkdZqdE8gQCre=zR2cN17oKfwBSnWuVwzQsbRO7-ENVnPNg@mail.gmail.com>
 <Z0nNnsmYIil0OZpy@smile.fi.intel.com>
 <Z1Rfuo3jq7rO0cqb@black.fi.intel.com>
 <Z1r0EPC9gumruFKU@smile.fi.intel.com>
 <2024121242-saturday-aqua-9ac6@gregkh>
 <Z1sObNubEnsFwzOD@smile.fi.intel.com>
 <Z4kcxQWeL09VARfK@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z4kcxQWeL09VARfK@smile.fi.intel.com>

On Thu, Jan 16, 2025 at 04:50:45PM +0200, Andy Shevchenko wrote:
> On Thu, Dec 12, 2024 at 06:25:16PM +0200, Andy Shevchenko wrote:
> > On Thu, Dec 12, 2024 at 03:39:57PM +0100, Greg KH wrote:
> > > On Thu, Dec 12, 2024 at 04:32:48PM +0200, Andy Shevchenko wrote:
> > > > On Sat, Dec 07, 2024 at 04:46:18PM +0200, Raag Jadav wrote:
> > > > > On Fri, Nov 29, 2024 at 04:20:14PM +0200, Andy Shevchenko wrote:
> > > > > > On Fri, Nov 29, 2024 at 11:17:02AM +0100, Linus Walleij wrote:
> > > > > > > On Tue, Nov 26, 2024 at 6:22 PM Raag Jadav <raag.jadav@intel.com> wrote:
> > > > > > > 
> > > > > > > > This series introduces a more robust and cleaner devm_kmemdup_array()
> > > > > > > > helper and uses it across drivers.
> > > > > > > 
> > > > > > > For the series:
> > > > > > > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> > > > > > > 
> > > > > > > It seems like Andy will push it to me which is excellent.
> > > > > > 
> > > > > > Yep, that's the plan after we get all necessary ACKs.
> > > > > 
> > > > > Greg, anything I can do to move this forward?
> > > > 
> > > > Greg, is it possible to give your Ack or comment or guidance of the preferences
> > > > with the first patch?
> > > 
> > > $ mdfrm -c ~/mail/todo/
> > > 2293 messages in /home/gregkh/mail/todo/
> > 
> > Oh my...
> > 
> > > Please be patient.
> > 
> > Sure!
> 
> Raaj, care to send a v3 after merge window closes?

Sure, and perhaps add a few more users which I found with my improved
grepping skills.

Raag

