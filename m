Return-Path: <linux-gpio+bounces-12261-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6809B3757
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 18:07:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9AEF6B25392
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 17:07:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1B911DF266;
	Mon, 28 Oct 2024 17:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VLPkfhID"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1171DF252;
	Mon, 28 Oct 2024 17:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730135235; cv=none; b=cxqcsgoPjGHw9jabh1AYSnDx6plOY834ANvYF3bKb5//jf5wPNg0RgGmCWcCvVkUtzxf66vhH9FGI3+H+R0cM9dVJFTIWUoJ39ryBMvf8ZFENkSds1DDmhSeQAV+IiIPeG58tMDjm/yzrbGuTl8oX65NrXi7antkSTMsXu7SWIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730135235; c=relaxed/simple;
	bh=Ir/aUu3jifhTRvP0LOkNUL7R5sFlAlZOHn7A6PDEBTA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MKBQ2o4vHmnWBeRc4qtcZvTjv7kEWKiFodKtKbpi07YErs2yv/0nbxAzlWCpoa1Xc7jsk++VdcYSxo6QjZPIcrF4s1OiXM44mDxr4vm2cAE2k+yrjOQHTtLlX8uwMZC6vOBcVQIMtxbderYUJ57hrAGW2R8ykrxPOSyTnAimUaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VLPkfhID; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730135234; x=1761671234;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ir/aUu3jifhTRvP0LOkNUL7R5sFlAlZOHn7A6PDEBTA=;
  b=VLPkfhIDchyraOJALtDctzivPtAxlf3VONcx7AtgbuQxPaoufPcQ0vJS
   Uq8dPF86XsuiqzU1VRni7KTkSQjNqTl4MBbLtjRVDIbK/+oqiILlZxBOY
   sfkSp7O/CdpyXtu9k2e9Cnvc0VZMLs3Rf4rgQtigBNQyoDToqxK4tLCSw
   I+ScWpVE4FtEJmjdr1RbeScT9Y8ujYEMNF7DthyHYa5bePfzPv83/Z+aw
   I3/a54VuArCnkJVOM9PEFrMv45ra1q/YQ/cAZip12eoZwgRI/tkazH/4D
   vBJLvy5s6GJHbERkhepccB7QpDB68adTtyqGwoui2Sp5i57hPPKNcDi0A
   g==;
X-CSE-ConnectionGUID: a2OiuujDToKij6ZPXDGz6Q==
X-CSE-MsgGUID: eFMFvFqJQmqD/Y6VPtuWPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29708259"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29708259"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 10:07:13 -0700
X-CSE-ConnectionGUID: 1aDrZd2rSoCcX6VScNFOzw==
X-CSE-MsgGUID: dyehkep4RS+ozv0cqFefRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; 
   d="scan'208";a="81299236"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 10:07:11 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t5TCv-000000089Zd-1t6C;
	Mon, 28 Oct 2024 19:07:09 +0200
Date: Mon, 28 Oct 2024 19:07:09 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/1] pinctrl: elkhartlake: Add support for DSW
 community
Message-ID: <Zx_Evfoi1iO1MW5m@smile.fi.intel.com>
References: <20241028134318.1156754-1-andriy.shevchenko@linux.intel.com>
 <20241028151720.GP275077@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028151720.GP275077@black.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Oct 28, 2024 at 05:17:20PM +0200, Mika Westerberg wrote:
> On Mon, Oct 28, 2024 at 03:43:17PM +0200, Andy Shevchenko wrote:
> > Hardware has a DSW (Deep Sleep Well) community that might be exposed
> > by some BIOSes. Add support for it in the driver.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Pushed to my review and testing queue, thanks!

-- 
With Best Regards,
Andy Shevchenko



