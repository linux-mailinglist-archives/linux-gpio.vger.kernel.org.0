Return-Path: <linux-gpio+bounces-16913-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2E2A4BEEA
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 12:38:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 128BD7A42D9
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 11:37:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F05461FFC4E;
	Mon,  3 Mar 2025 11:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C9TWqZ5w"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213CE1FFC41;
	Mon,  3 Mar 2025 11:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741001902; cv=none; b=EFhO/ob7h8EtVkKkOX3zWKvN8VMu0hBxdmB9bhOayJE9bhbbi9hhvPrvO40NjvuNr27bfCMqbGIg5MxoCsXwN+3M5UYa1KD79uty8b1drpQTGIhQTzF8r4gG+SFQpiJEpQYVsVQaMnV9oVi3FYg7b25iv8YdIAw16slM//OwAbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741001902; c=relaxed/simple;
	bh=8g5XkS3p3EZERMkZa1Ftfxp/zc6MGGaz7kerN0DV6OA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=otSuvoKnzPEe/Bly4I9urMmohWIHIw49oSCO4teS5GEOaYlINv4+CSExrzLTLoQslyRYNMngB4KTcmAFe9zrMQD28R0yuC4n8weP7VbnylcqOiTKKVpvC21viHPUP9XET1tmohP9eX5Pu/JmIJ1oHr6LwQsfdoXQ3Ebhb4cm0x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C9TWqZ5w; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741001901; x=1772537901;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8g5XkS3p3EZERMkZa1Ftfxp/zc6MGGaz7kerN0DV6OA=;
  b=C9TWqZ5wyu6TD7iYNuTymBUgb0mSxWE1yBNE0MVy1Kr0JyFY0aj44OXo
   jGb2iwSnkAOKU9V44V+eSWnxn4zpmIgXI0ky2FDWMa9s446CYDexm58e6
   0PrbISUhW4ap0XD3BJzpgnFyMUnXVCBhZieVqAaWn6YzZDbiqKpkmNIgr
   JtZcRP+OK+82RgWrJw4jSBgEyxmUvxzZsnHaOnc2bcXQEtY48yqMJhgq8
   cMz/XoVqWHOROgVof+5jTb42jAY9wmXd8eQZcNqJhWGvATud/GV0lDSKc
   z00Abb5cr4W9VOY6aes7Uzh5Vo4hAXzH0aPJklUj/RxBUUwSWzLk2Rr5o
   g==;
X-CSE-ConnectionGUID: Qqzi7w7XSfOAO0qQfYa+NA==
X-CSE-MsgGUID: rk8++g69Q/qry/JKlN5QCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="53278247"
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
   d="scan'208";a="53278247"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 03:38:19 -0800
X-CSE-ConnectionGUID: u66U2HclQ1utJWcMzl7seg==
X-CSE-MsgGUID: MGNIbsWgQoCauMM2L36Q7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
   d="scan'208";a="117969709"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 03:38:18 -0800
Date: Mon, 3 Mar 2025 13:38:15 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: lee@kernel.org, giometti@enneenne.com, gregkh@linuxfoundation.org,
	raymond.tan@intel.com, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] gpio: elkhartlake: depend on
 MFD_INTEL_EHL_PSE_GPIO
Message-ID: <Z8WUpzDHbhp0aMoN@black.fi.intel.com>
References: <20250303044745.268964-1-raag.jadav@intel.com>
 <20250303044745.268964-3-raag.jadav@intel.com>
 <Z8VmebNcrH6CjHp6@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8VmebNcrH6CjHp6@smile.fi.intel.com>

On Mon, Mar 03, 2025 at 10:21:13AM +0200, Andy Shevchenko wrote:
> On Mon, Mar 03, 2025 at 10:17:42AM +0530, Raag Jadav wrote:
> > Now that we have Intel MFD driver for PSE GPIO, depend on it.
> 
> ...
> 
> >  config GPIO_ELKHARTLAKE
> >  	tristate "Intel Elkhart Lake PSE GPIO support"
> > -	depends on X86 || COMPILE_TEST
> > +	depends on (X86 && MFD_INTEL_EHL_PSE_GPIO) || COMPILE_TEST
> >  	select GPIO_TANGIER
> 
> Looking on how GPIO PMIC drivers are written, I would redo this as
> 
> 	depends on (X86 || COMPILE_TEST) && MFD_INTEL_EHL_PSE_GPIO

True, but perhaps allow independent COMPILE_TEST where possible?

Raag

