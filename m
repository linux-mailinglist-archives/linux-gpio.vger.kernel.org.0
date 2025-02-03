Return-Path: <linux-gpio+bounces-15227-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4AAA255B3
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 10:21:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B6E061885C3A
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 09:21:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 988421FF1DD;
	Mon,  3 Feb 2025 09:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XbbxL6fH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C183E1FF1D5;
	Mon,  3 Feb 2025 09:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738574481; cv=none; b=k8HdZMGZ7f7AhcFZ1p2i0u7w0YarH63g5eD9Qj+t69eEuoNHUqfa30lGsCKh/dve37/6gVCu32zeAPbxBt5sbcM4DslH7G5fIgvlDi0dSLL+hsz5FFuX5zNO+82g76mKPMsznT3SKnPheu6lPRozhfcd5/aqEHnQqum/DEbzZo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738574481; c=relaxed/simple;
	bh=J1atqQx3xJM6YbcXMH5G7IHsZ8yCqKrNmIuJrq5A/uM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MsX3G5lhH1Ep8igDaVwL43RYHh95HGMERQXoyx8MzhzcS9cQ96eMQEtbj81NniUy00Wfs89YTGrTstpKCsOPtuhNZjVQJPnLolUlu6Ov/VgATtUzUPCchgSFNqqZfFXGWBmwU9NasRrqVAejCpRMZJEn+jp+QkOvrmFbrR6mVhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XbbxL6fH; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738574480; x=1770110480;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=J1atqQx3xJM6YbcXMH5G7IHsZ8yCqKrNmIuJrq5A/uM=;
  b=XbbxL6fHKFxBnz2hoXST0D5qUE/xU9eNcBEibWn9StF/xIG9Lf/vexLV
   WMh8jjbIi5IjLvrA+JkfHnppaESt8HOLvTNaNdws1q0F0Pzn8BHAVV1JY
   VhxUlgXreItDKr2saGiJHhsEwlKtIK1mrHLdVUrTgNerSpw0eImhGp29m
   yI183VbkZgsCNuZBgdI/VNipNclj0hf3KQxouO9/1XUb1DQ7EBZ2pE1v1
   qL0UMCN4PqNmTeX+cGe2kgD67TQlWfYiodXRNGtVpAoP68J1MXCsCjvEp
   +aRQWX9slnrZS05m/MAaVd8dWQ89vAQ4Qv8zHVVH40jSstHm34Uy76It5
   Q==;
X-CSE-ConnectionGUID: Ld+XH1glSlGSBQiRCCSrzg==
X-CSE-MsgGUID: M3HSva58QrOzBugj/YegpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11334"; a="50448368"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="50448368"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 01:21:19 -0800
X-CSE-ConnectionGUID: cGAH7kxUTxG0irQFOdgyJw==
X-CSE-MsgGUID: QAZWdNiIR4OsuDsAlOacAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="110806792"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 01:21:19 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tesdn-00000007mc8-2eY3;
	Mon, 03 Feb 2025 11:21:15 +0200
Date: Mon, 3 Feb 2025 11:21:15 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Patrick Rudolph <patrick.rudolph@9elements.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 05/16] pinctrl: cy8c95x0: Remove incorrectly set
 fields in regmap configuration
Message-ID: <Z6CKixK7KndRBzeF@smile.fi.intel.com>
References: <20250117142304.596106-1-andriy.shevchenko@linux.intel.com>
 <20250117142304.596106-6-andriy.shevchenko@linux.intel.com>
 <CALNFmy2qGCt8OTb3qx+0PsPivbfY89gWe74Moeeu7r7hCp_UaA@mail.gmail.com>
 <Z4pzoNInabOHWjK5@smile.fi.intel.com>
 <Z4pz-gmfermTjZ77@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z4pz-gmfermTjZ77@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Jan 17, 2025 at 05:15:06PM +0200, Andy Shevchenko wrote:
> On Fri, Jan 17, 2025 at 05:13:36PM +0200, Andy Shevchenko wrote:
> > On Fri, Jan 17, 2025 at 04:01:43PM +0100, Patrick Rudolph wrote:
> > > On Fri, Jan 17, 2025 at 3:23 PM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > >
> > > > We don't provide defaults for the regmap, we shouldn't provide
> > > > the number of them either.
> > > The intention is to read back the defaults from HW to initialize the
> > > regmap cache.
> > > The defaults are applied at each POR from the device's internal EEPROM.
> > > See regcache_hw_init() for details.
> > 
> > Yes, I was looking a lot and that code and it doesn't work as intended.
> > I can reproduce the issue, but it's real issue and I don't think we need
> > to read back anything from the HW forcibly. It will be done naturally, no?
> 
> I think I now remember, it has a NULL pointer dereference.

FWIW, okay, it was induced by a fix in regmap core, so this NULL pointer
dereference is for real, but it's a regression in the regmap core.

For the reference read this thread:
20250116124303.3941583-1-andriy.shevchenko@linux.intel.com.

-- 
With Best Regards,
Andy Shevchenko



