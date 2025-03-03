Return-Path: <linux-gpio+bounces-16918-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 889A1A4C005
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 13:14:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF7D916ECD7
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 12:14:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2DF420E327;
	Mon,  3 Mar 2025 12:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fkatteja"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37F7202F9F;
	Mon,  3 Mar 2025 12:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741004082; cv=none; b=N5MoxreCvzvaBOkYcOK3J/8Jf5VIcWxX1iLw7d+nF6r6NSatWt5xbj9Mk5jrjB8iSxjDS4fq9Nq7wT3t36//1VgKOgJ9XPQyO2uf9yS0c8d6rgvABllCaqAi5JlZUVLWUtYw2eWQDrqMurTiVzWbCkMAHaggCXu8YdbNmEEbLZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741004082; c=relaxed/simple;
	bh=102hr/ee6JbNyABBiZZfftn3a7JRkTy7P4kbu8fUsoA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=owp/Vn8ADVlskv7GT7CcQqk5ilyh8b0WkpWZGOX0PU4k/tC2OVeuGJ4fw28Xc49eHOXRu5iD8UXCTw0XD8yXucau1TTkE5vfPRYvD20BO8Iv8KffxX8jLP8q+mM2a5kKaecaefPxdqQNWDY9dshd+60eMQf0u9VS2Q9gNeEYBrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fkatteja; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741004081; x=1772540081;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=102hr/ee6JbNyABBiZZfftn3a7JRkTy7P4kbu8fUsoA=;
  b=FkattejaIzdE1bfVoKAoghzs23kx1xYGwKH1OMlWikDwIYsgVZQ9kAcN
   ngcJA5CxHqFvx5CSTKDGylkReOtqCF2i0Xp38xaXO86C99NlVjFD/xGp8
   C2nq4H7/6zbxyCtwbCU9pXzChBHEIm/hHTpdw2tu/++ZI4fA3yPgjsbry
   nvL0H/egVXMkmGi2LEPGhUjz3RZtH/eBoJhtxfk+oMRDWeyJw3HkEQdnJ
   Bj8jYl6FP2Yx2usZE5ED+G9Y7aMFhzNwA/qmdW4CfmHf+7CPquizf+1cT
   DefxrHcK4yPg98VwEVy8Cy/vWXw4PKT9aLe3EJrnnfVLURnQkiFDpQvg4
   g==;
X-CSE-ConnectionGUID: 7SKAiTZzRB26mk6lFzzdIQ==
X-CSE-MsgGUID: oGlbZHMbTearGfApzfCxjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="45648865"
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
   d="scan'208";a="45648865"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 04:14:40 -0800
X-CSE-ConnectionGUID: f+cNPa4vRLumvnURGS/SwA==
X-CSE-MsgGUID: 2T0lszcrQBCSRsAAJYJhMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
   d="scan'208";a="118478736"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 04:14:38 -0800
Date: Mon, 3 Mar 2025 14:14:35 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: lee@kernel.org, giometti@enneenne.com, gregkh@linuxfoundation.org,
	raymond.tan@intel.com, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] mfd: intel_ehl_pse_gpio: Introduce Intel Elkhart
 Lake PSE GPIO and TIO
Message-ID: <Z8WdK7wkNnAerkCO@black.fi.intel.com>
References: <20250303044745.268964-1-raag.jadav@intel.com>
 <20250303044745.268964-2-raag.jadav@intel.com>
 <Z8VnSyH_DBuJpW2o@smile.fi.intel.com>
 <Z8WU5NiIsu34Gz-Z@black.fi.intel.com>
 <Z8WWXxTrd1e5V3qb@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8WWXxTrd1e5V3qb@smile.fi.intel.com>

On Mon, Mar 03, 2025 at 01:45:35PM +0200, Andy Shevchenko wrote:
> On Mon, Mar 03, 2025 at 01:39:16PM +0200, Raag Jadav wrote:
> > On Mon, Mar 03, 2025 at 10:24:43AM +0200, Andy Shevchenko wrote:
> > > On Mon, Mar 03, 2025 at 10:17:41AM +0530, Raag Jadav wrote:
> 
> ...
> 
> > > > +INTEL GPIO MFD DRIVER
> > > 
> > > This also needs to be more precise and follow the name. We have more Intel GPIO
> > > drivers, and MFD doesn't ring any bell about the platform or so. Are you going
> > > to support all of them (existing and comining)?
> > 
> > Not that it is planned as of now but I wouldn't mind :)
> 
> It sounds like solving the problem that even might never appear :-)

Right, somehow that sounds familiar :D

Raag

