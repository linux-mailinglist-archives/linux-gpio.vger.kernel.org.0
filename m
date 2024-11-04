Return-Path: <linux-gpio+bounces-12523-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E349BB5FA
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2024 14:27:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A2C3281124
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2024 13:27:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B40F8171D2;
	Mon,  4 Nov 2024 13:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O6yuLR3o"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F6A6101C8
	for <linux-gpio@vger.kernel.org>; Mon,  4 Nov 2024 13:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730726736; cv=none; b=YDawGV0oodG6d6/o//9t4K2fOWnJsR0FlNvohUNrTR5oc7eLKzePWN5MgYSSBs02avLztEH8jMtQi3EBj9ZwHkWSrRC/wzQ+caQLGV1N+bz5ydz4b1gM0DfNujhcR5rMyLdHKdGUs7HdXJM39EgaUwhpy1ns8qvo92V1bvfPkxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730726736; c=relaxed/simple;
	bh=7ramVsNqZOjvpClHLksYof+RGhnXf+xnn5XtMCI4+Pg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m+dkQX/SXWN0coam6BQZZS8kXXklOZ2sttkfYgRp+se9+q0wTYPPJgKFLVGfwwznAq+R7thAErpK0iuh8bBX7HtN7svVs/kjeFBmgolV7ruhUUKPxjteOhZ8dZQVg6CiKysw3bWWD3bAwelEbXQoLyCm7YE5FxAi63cH23Y27i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O6yuLR3o; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730726735; x=1762262735;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=7ramVsNqZOjvpClHLksYof+RGhnXf+xnn5XtMCI4+Pg=;
  b=O6yuLR3oz4dA0lcNlasAFIGxqzdIw+BDIXF7CXkWk6Vq0ctuizXCJKP2
   L6V4N5N3EYn78ojY1V03NHMsd5isU4wuye7xco+QKjnXtHCx/DzTc65zL
   9zFcYOHKIiS+Tik80faBcVdO6ulbbZFnjiD/RrHiXHueqIXcyTpClj6gg
   Seelug4NVgq4969G4jDlWVfAMWi29Q29aifxDiw2qmyK/OzjZekldVmAo
   XCJCOv16maax8GsfMKzyzbzhU1NGcGYuucKJhAP5461JtWXW1DXEVnxCo
   xV9jUKs11BMGEtYp1MVLd7nJUfmAzEXBKPZKXDTNdTKQ1p55+O1k0u6ih
   A==;
X-CSE-ConnectionGUID: RHmBGCX8RaedHWBiyC32tA==
X-CSE-MsgGUID: LJKKZ//1Roq7yldpPDrmPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30275391"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30275391"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 05:25:32 -0800
X-CSE-ConnectionGUID: bIrQRv6zRRy6rsouSit6zg==
X-CSE-MsgGUID: QHjWuVbKQGGRve78dwALGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; 
   d="scan'208";a="83542202"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa009.jf.intel.com with ESMTP; 04 Nov 2024 05:25:32 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 1D82C235; Mon, 04 Nov 2024 15:25:30 +0200 (EET)
Date: Mon, 4 Nov 2024 15:25:30 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Matthew McClain <mmcclain@noprivs.com>
Cc: Sai Kumar Cholleti <skmr537@gmail.com>, bgolaszewski@baylibre.com,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpio: exar set value handling for hw with gpio pull-up
 or pull-down
Message-ID: <ZyjLSmtwyPiD9-r5@black.fi.intel.com>
References: <20240730134610.80986-1-skmr537@gmail.com>
 <ZrpE8RYLG0141_EB@smile.fi.intel.com>
 <00bc04c5-a424-4d68-b7cd-7ad9e586409a@noprivs.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <00bc04c5-a424-4d68-b7cd-7ad9e586409a@noprivs.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Aug 13, 2024 at 10:07:37AM -0500, Matthew McClain wrote:
> On 8/12/24 12:22, Andy Shevchenko wrote:
> > On Tue, Jul 30, 2024 at 07:16:10PM +0530, Sai Kumar Cholleti wrote:
> >
> > Please, refer to the functions in the text as func(), e.g.
> exar_set_value().
> > Use proper acronym, i.e. GPIO (capitalised).
> 
> We will update the patch and send a new version out if the current
> approach is acceptable.
> 
> >> Before the gpio direction is changed from input to output,
> >> exar_set_value is set to 1, but since direction is input when
> >> exar_set_value is called, _regmap_update_bits reads a 1 due to an
> >> external pull-up.  When force_write is not set (regmap_set_bits has
> >> force_write = false), the value is not written.  When the direction is
> >> then changed, the gpio becomes an output with the value of 0 (the
> >> hardware default).
> >>
> >> regmap_write_bits sets force_write = true, so the value is always
> >> written by exar_set_value and an external pull-up doesn't affect the
> >> outcome of setting direction = high.
> 
> > Okay, shouldn't you instead mark the respective registers as volatile or
> so?
> > I believe regmap has some settings for this case. But I haven't checked
> myself.
> 
> Unfortunately, in addition to marking the regmap volatile, we'd need to
> define reg_update_bits which means we'd be partially undoing the work
> from 36fb7218e87833b17e3042e77f3b102c75129e8f to reuse regmap locking
> and update functions.
> 
> Below is the relevant section of _regmap_update_bits().
> 
> static int _regmap_update_bits(struct regmap *map, unsigned int reg,
>                                unsigned int mask, unsigned int val,
>                                bool *change, bool force_write)
> ...
>         if (regmap_volatile(map, reg) && map->reg_update_bits) {
> ...
>         } else {
> ...
>                 if (force_write || (tmp != orig) || map->force_write_field)
> {
>                         ret = _regmap_write(map, reg, tmp);
>                         if (ret == 0 && change)
>                                 *change = true;
> ...
> 
> I suspect this might be a common problem with other GPIO drivers as
> well.

Sorry, this message went to cracks somehow. Can you update the commit
message and comments as mentioned above, add Fixes tag and send a v2
for a review. Also use 'gpio: exar: ...' in the Subject.

-- 
With Best Regards,
Andy Shevchenko



