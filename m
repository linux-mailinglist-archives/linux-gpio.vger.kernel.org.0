Return-Path: <linux-gpio+bounces-13270-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0F09D8A2D
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Nov 2024 17:21:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 86B82B6510A
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Nov 2024 15:09:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DE8F1B4129;
	Mon, 25 Nov 2024 15:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gtMkDSqk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3FD61B3930;
	Mon, 25 Nov 2024 15:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732547303; cv=none; b=qJkQR67i7aEyyYrephesRVQD1UuQpZ+AykQKSGRSkCu0VDmzLHOG/3Xuzv7GMVSV4c3E8wR81r2fgVErVX5RoAuPqFRAuiZ0w0vSQmpDz7m1/CWhUGWJmhfyjjIQMYeZL7nAQeJh/8XHkljIVvm6oz62ak+8dIhUm5SyzkMFD6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732547303; c=relaxed/simple;
	bh=FzM84hsNZv04YOWDXQU7QdBBwm6izRYFHYgNHaUEgR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F+gXFkCjLk+RaP77GG4/m+ZaWDSF3y9bTbQE38HHKtRpHGsTdMHUtV0E4/rMrNHCMbO8Tm/Pbtq718192mSzgelVmpxAzVpPwKX4cHCNcRMlaAk1DEXm2JSZJNtMG4gNbh98FXyBzHvJDyLSagbNFGVLHV9dIGbpS/+sLHzPV/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gtMkDSqk; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732547303; x=1764083303;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FzM84hsNZv04YOWDXQU7QdBBwm6izRYFHYgNHaUEgR4=;
  b=gtMkDSqkjLw29X1jb6zMqqp7UVHsi9/nA8ugAic0QUv+0AeV1aBIUVIM
   8CecDtRZyXIRXaS2x923E4XYWTapcapzXeU+H4QWpyP1u6oF8mFPzS0gl
   7WRHwfW64HQ47tuQwwtCySqMf1HxcLDt77SnWvsIlL5zXF8ZvIcZedZL8
   04KfHtJV3f8qDhLF6euYptvlwoYv0vWJHy0uh9kGFEUIkZYdEz4hrbFf0
   aX0KtyWXWou/9H+Q/O5B6Yk3y8xNphkbWpUQ/+8RhHzS56VTtqvhYE0n2
   5M8B5Ly9u/rx5Vu/iw6wsucyyEzHCLFlGNxNcCStJZLp4++bOFdvzmXi5
   Q==;
X-CSE-ConnectionGUID: q4zbeE97R/uFe0YdiM+IMQ==
X-CSE-MsgGUID: FvVY1aLITUWDIIg6JbMb/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="32597365"
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; 
   d="scan'208";a="32597365"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 07:08:20 -0800
X-CSE-ConnectionGUID: lGq2BJWVRjaTLbllt2dAYw==
X-CSE-MsgGUID: Sb6jJuhaRk2VIvsOPWiynA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; 
   d="scan'208";a="91426783"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 07:08:17 -0800
Date: Mon, 25 Nov 2024 17:08:13 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, gregkh@linuxfoundation.org,
	linus.walleij@linaro.org, mika.westerberg@linux.intel.com,
	broonie@kernel.org, pierre-louis.bossart@linux.dev,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v1 1/5] devres: Introduce devm_kmemdup_array()
Message-ID: <Z0SS3cO4acfgz0iQ@black.fi.intel.com>
References: <20241123200527.7830-1-raag.jadav@intel.com>
 <20241123200527.7830-2-raag.jadav@intel.com>
 <Z0LPyMed-4a8cajD@google.com>
 <Z0QsAm3FdZDJ8kY0@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z0QsAm3FdZDJ8kY0@smile.fi.intel.com>

On Mon, Nov 25, 2024 at 09:49:22AM +0200, Andy Shevchenko wrote:
> On Sun, Nov 24, 2024 at 07:03:36AM +0000, Dmitry Torokhov wrote:
> > On Sun, Nov 24, 2024 at 01:35:23AM +0530, Raag Jadav wrote:
> > > Introduce '_array' variant of devm_kmemdup() for the users which lack
> > > multiplication overflow check.
> > 
> > I am not sure that this new helper is needed. Unlike allocators for
> > brand new objects, such as kmalloc_array(), devm_kmemdup() makes a copy
> > of already existing object, which is supposed to be a valid object and
> > therefore will have a reasonable size. So there should be no chance for
> > hitting this overflow unless the caller is completely confused and calls
> > devm_kmemdup() with random arguments (in which case all bets are off).
> 
> Don't we want to have a code more robust even if all what you say applies?
> Also this makes the call consistent with zillions of others from the alloc
> family of calls in the Linux kernel.

Agree. Although shooting in the foot is never the expectation, it is
atleast better than having to debug such unexpected cases.

Raag

