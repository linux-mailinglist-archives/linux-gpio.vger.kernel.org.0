Return-Path: <linux-gpio+bounces-30508-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F54D1B485
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jan 2026 21:47:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B9BD63012241
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jan 2026 20:46:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2589A31AF30;
	Tue, 13 Jan 2026 20:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P5e5V1yT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E243195FD;
	Tue, 13 Jan 2026 20:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768337184; cv=none; b=t0soNlLCzpt+lR4zv7++T+atIWCuZ+PDbd5AN6pw7Xxdx8TJqMpnjHX6W+l3IHa0jlDKS05flrH6VcJlKzMmvDUbqrtWzK8OimtA4xchmoX2Efh9k98Lnma6UuipY0HHg5FvlsmH13CrPTMfWUe6j2s7vF0oDUWFgngNQygON2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768337184; c=relaxed/simple;
	bh=nV36H4iRGn9k7IhA6wbO596UaanjMgUd6Ifg+UByems=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lb0KpbAOjF2mhOPugBZJrVl/eYXoFzX9WixE8QlxIQvdRD4kbG3yrmUNdmZIMKQZiPp1zDC1aSLHDDB6fCBYMAJouMEoEP1AC+dTR074lEwqhKWfEf51VC4iZ+upC/m2zAB4Kl+iP+Yhww3Mdgi8575YiEegwHS4enqa/HvL8KU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P5e5V1yT; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768337183; x=1799873183;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nV36H4iRGn9k7IhA6wbO596UaanjMgUd6Ifg+UByems=;
  b=P5e5V1yTbqVMrLZoNdPgki7oSC4HwPf+Sr11xTUgzSgixH2D6WpyFiXw
   LpHiEH9nIkM69ryHCn5UpwodAygDwdNjdY9lW+RLjAI+6xLeRs5PTV6b4
   /gLlLshTIFWyReNmdp7dD1U4SBQjgcI0GSstYjEPuxmhtYd01hAm2chVv
   0ZKxt18mhwMWYSq0IKpupW4i8kVJ+w3/MsUde+YpupFHQMZDDzGvkuraW
   aZT8cc/wbehvZR4W3biSuRAi2mJ7GVjzXmj6HejgUSAwZNYACuKtDyBhA
   aAbw2dql6c5XlF162GE2MD2wTFK2u9HxjgCSzlNxxRCm6ENJxHwKlQBoA
   g==;
X-CSE-ConnectionGUID: kVS54BaNT1GrNQ6tTTfZDw==
X-CSE-MsgGUID: KHRvUYZXSXK1O4n6nSpwZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="73489497"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="73489497"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 12:46:23 -0800
X-CSE-ConnectionGUID: YLMtRNPcSM+YC3GkoUFxBg==
X-CSE-MsgGUID: kjP4mTRJSnu2veLfGtjqpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="209334983"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost) ([10.245.245.177])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 12:46:22 -0800
Date: Tue, 13 Jan 2026 22:46:19 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v1 1/1] pinctrl: baytrail: Convert to use
 intel_gpio_add_pin_ranges()
Message-ID: <aWavGyzWJsHQS_6q@smile.fi.intel.com>
References: <20260113100734.136729-1-andriy.shevchenko@linux.intel.com>
 <20260113115729.GZ2275908@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113115729.GZ2275908@black.igk.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Jan 13, 2026 at 12:57:29PM +0100, Mika Westerberg wrote:
> On Tue, Jan 13, 2026 at 11:07:34AM +0100, Andy Shevchenko wrote:
> > Driver is ready to use intel_gpio_add_pin_ranges() directly instead of
> > custom approach. Convert it now.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Pushed to my review and testing queue, thanks!

-- 
With Best Regards,
Andy Shevchenko



