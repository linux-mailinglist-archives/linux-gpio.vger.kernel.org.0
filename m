Return-Path: <linux-gpio+bounces-17550-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C632A5F7F4
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Mar 2025 15:25:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 364FA7AE692
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Mar 2025 14:24:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D96A267F45;
	Thu, 13 Mar 2025 14:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J5qtPYPE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E4A267B95;
	Thu, 13 Mar 2025 14:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741875904; cv=none; b=EtGUsaRBAj2DxZyEwf25ZLIn9SdS21aXiWJyMUwwp5MI+tsv3mEhy1clHBvYMAtCb1Ne1VJhqBH728kw0HNmXDgvpXHS3lO72RDAhkSV6D3y/UP3XiMJTnAp0zwEmUUQZ1ZserAt12kXB3Q9B/Rt5oJ3XNZIbvWHsWElCCKYxYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741875904; c=relaxed/simple;
	bh=sq4/o1XQf0KTw62Bsp/1rRfjWSi/0JKw8Jq0XqFQYnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M2rBjaaeCf/kZnEZ1Hgo3VXrCKRdKetLa5uIH80vK5bDPsb8aUHeC44I8w2ti0UGi1RBWta5W1tKU4Ss6RnDIuvBfV9j9Df9uyWCkEM8c8EMQlFmBR3hGdmPWZcdN3arIHxXB1kzRPMklrErPvT9RGv7vGcNuRI2qKgXvA1O1iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J5qtPYPE; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741875902; x=1773411902;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sq4/o1XQf0KTw62Bsp/1rRfjWSi/0JKw8Jq0XqFQYnQ=;
  b=J5qtPYPE7vlmJuPGW1oz30H7lUSW7JjqJG1Y5VTQHUauL+cuVLfT2CXS
   U2drsxVg9GGkXgwl1iiXqP0ok1bs90Ce7rFm9TMR13QxUAvB9bq4Q8cjn
   n6age2GxU5T88sFhhNQ6AHgK7FdTF8ROraS2orww7pZa6ydPpebL8eSwA
   zKIgw2id34B0FJZQxMpFLBRnAitEmEEVmNmxJ8ncAeLfc43sZrCcUhg4k
   LUiBQ4wjI0hUizLJTgqQ6IZmUKf9b/tTSuxsTVrC8X1W/odWxExNE5P8P
   m9luglKo//lVZulgRnNlpk4bWQMOLtmWmu+C+tcwbelBnU4iOdWMt6J0x
   w==;
X-CSE-ConnectionGUID: x7vGO1P3Qo+tBNt7ZjAYrQ==
X-CSE-MsgGUID: tTw/P/lkSNOw0+Cm5UO+Ng==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="53646466"
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; 
   d="scan'208";a="53646466"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 07:25:02 -0700
X-CSE-ConnectionGUID: mdMRGCWiTe6VLk0TCvtJpA==
X-CSE-MsgGUID: +HGjCHNZRtCus5dMzzTE6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; 
   d="scan'208";a="121177322"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 07:25:00 -0700
Date: Thu, 13 Mar 2025 16:24:57 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: lee@kernel.org, giometti@enneenne.com, gregkh@linuxfoundation.org,
	raymond.tan@intel.com, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/5] gpio: elkhartlake: depend on
 MFD_INTEL_EHL_PSE_GPIO
Message-ID: <Z9LquYwHIkCZFYHk@black.fi.intel.com>
References: <20250307052231.551737-1-raag.jadav@intel.com>
 <20250307052231.551737-3-raag.jadav@intel.com>
 <Z8_aJqNKK9AgBnK8@black.fi.intel.com>
 <Z9FpU0Ik_4yCU9XB@smile.fi.intel.com>
 <Z9G-RSfcRmALtgJe@black.fi.intel.com>
 <Z9HTU2BlXIa95S0V@smile.fi.intel.com>
 <Z9KjIAMfRIegA2vI@black.fi.intel.com>
 <Z9Lk4e_09UbGFnid@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z9Lk4e_09UbGFnid@smile.fi.intel.com>

On Thu, Mar 13, 2025 at 04:00:01PM +0200, Andy Shevchenko wrote:
> On Thu, Mar 13, 2025 at 11:19:28AM +0200, Raag Jadav wrote:
> > On Wed, Mar 12, 2025 at 08:32:51PM +0200, Andy Shevchenko wrote:
> > > On Wed, Mar 12, 2025 at 07:03:01PM +0200, Raag Jadav wrote:
> > > > On Wed, Mar 12, 2025 at 01:00:35PM +0200, Andy Shevchenko wrote:
> > > > > On Tue, Mar 11, 2025 at 08:37:26AM +0200, Raag Jadav wrote:
> > > > > > On Fri, Mar 07, 2025 at 10:52:28AM +0530, Raag Jadav wrote:
> > > > > > > Now that we have Intel MFD driver for PSE GPIO, depend on it.
> > > > > 
> > > > > > Andy, any guidance on GPIO?
> > > > > 
> > > > > I'm not sure what we are waiting here from me. Hadn't I reviewed your GPIO
> > > > > part already?
> > > > 
> > > > Ah, I added MFD dependency for leaf drivers after your v1 review.
> > > > So this one seems missing the tag. Can I add it?
> > > 
> > > I see, but this can be added later on.
> > > And on the second thought, do we accept the configurations
> > > when user wants to have GPIO on EHL, and doesn't care about TIO?
> > 
> > Yes, here we're making the leaf driver (GPIO) depend on MFD regardless
> > of what TIO config is.
> > 
> > > Maybe this patch is not needed after all?
> > 
> > My understanding is that GPIO should depend on MFD. Not much point in
> > adding a standalone leaf driver right?
> 
> Ah, indeed, we have no other means to enumerate it (as we don't have any board
> file that does direct creation of the device), this patch is correct.
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Awesome.

I'm guessing this series will only apply on Greg's tree due to TIO stuff.
If I'd rather need to route it any other way, please let me know.

Raag

