Return-Path: <linux-gpio+bounces-16923-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C395DA4C0F4
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 13:48:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A4A2318978A0
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 12:48:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB92C21128D;
	Mon,  3 Mar 2025 12:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XX+/C2cE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B120210191;
	Mon,  3 Mar 2025 12:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741006056; cv=none; b=bZjZjAFTDKNXK+J+8bWLiKZL3tmmySKCTRsX7lC/OS7UBWm+FgjGvThLJnpfIz+ed5cqMM15eeYz3H3t4nSKjjZoj3+cXmvnqTQHZraoGVmLFU2/UuzpDCMVsQqTqsD76Zf6Huq2ScPP49UcgavncTKvZS8/1J4G884uy2smRX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741006056; c=relaxed/simple;
	bh=ZuPX7eSFq6V6WILAzIHrHuBxzy4xj88xCYbFZiRKRUo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WuFB6uHQbMTWju2QHgtgh5qL4AGsZblA6YMLNCJnBleQuy8GwvrFIxVdBw2l5JDwfzut8Muqw3bHyqSfdAyIjrSjRP+0VL7F/YLQBakK1q71/+X8DUjgFhnoRMZm5EWGmSFc1kkMwkWF0Z4xMT6fHd/3wGRTxnXXMNeRQRp/cQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XX+/C2cE; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741006055; x=1772542055;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZuPX7eSFq6V6WILAzIHrHuBxzy4xj88xCYbFZiRKRUo=;
  b=XX+/C2cE3hffQl7jLh537I8oRN5AifgEmEmDAprdz1bUUzjBRoG9Qej5
   OHuKeOqOcn4w7HNZpnZsyN7MSrGD1Grvp8NHOEAH/V0ytsh867ATmIXED
   vaG/Ba6D0UG9HzFdR6aCgA6bgKY/vOmNOtP8OtQC8n57ndttMtNEeC4Qo
   b6664vjWVulEKB0mHKr+LFDBSnBzxewn2i8un+ldgdwNfRXpNn1SBjvqt
   N0dsGjXHn4JJtATDdmLB4xuKakEaabxhBusQpWRVRYNK6EplQCTibdWeY
   4bB5Vn525BZMb0eqdA5CX01FT42Su1TsYIzacxxwes9vUvXyk7pBWcCfO
   Q==;
X-CSE-ConnectionGUID: S8YizcLhS2ibwQc1akI3yA==
X-CSE-MsgGUID: 2a/SniMYRHOS3oPuPphq7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="67248570"
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
   d="scan'208";a="67248570"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 04:47:34 -0800
X-CSE-ConnectionGUID: ug0Odv6ZRJyDMw7YSr1l+Q==
X-CSE-MsgGUID: 3X2vMFaISD2skzMMRL6K4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
   d="scan'208";a="122956328"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 04:47:32 -0800
Date: Mon, 3 Mar 2025 14:47:29 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: lee@kernel.org, giometti@enneenne.com, gregkh@linuxfoundation.org,
	raymond.tan@intel.com, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] mfd: intel_ehl_pse_gpio: Introduce Intel Elkhart
 Lake PSE GPIO and TIO
Message-ID: <Z8Wk4dj7MvrW1-Ou@black.fi.intel.com>
References: <20250303044745.268964-1-raag.jadav@intel.com>
 <20250303044745.268964-2-raag.jadav@intel.com>
 <Z8VnSyH_DBuJpW2o@smile.fi.intel.com>
 <Z8WU5NiIsu34Gz-Z@black.fi.intel.com>
 <Z8WWXxTrd1e5V3qb@smile.fi.intel.com>
 <Z8WdK7wkNnAerkCO@black.fi.intel.com>
 <Z8WfESNmu4MjEbcx@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8WfESNmu4MjEbcx@smile.fi.intel.com>

On Mon, Mar 03, 2025 at 02:22:41PM +0200, Andy Shevchenko wrote:
> On Mon, Mar 03, 2025 at 02:14:35PM +0200, Raag Jadav wrote:
> > On Mon, Mar 03, 2025 at 01:45:35PM +0200, Andy Shevchenko wrote:
> > > On Mon, Mar 03, 2025 at 01:39:16PM +0200, Raag Jadav wrote:
> > > > On Mon, Mar 03, 2025 at 10:24:43AM +0200, Andy Shevchenko wrote:
> > > > > On Mon, Mar 03, 2025 at 10:17:41AM +0530, Raag Jadav wrote:
> 
> ...
> 
> > > > > > +INTEL GPIO MFD DRIVER
> > > > > 
> > > > > This also needs to be more precise and follow the name. We have more Intel GPIO
> > > > > drivers, and MFD doesn't ring any bell about the platform or so. Are you going
> > > > > to support all of them (existing and comining)?
> > > > 
> > > > Not that it is planned as of now but I wouldn't mind :)
> > > 
> > > It sounds like solving the problem that even might never appear :-)
> > 
> > Right, somehow that sounds familiar :D
> 
> So, can we rename the MAINTAINERS record as the result of our discussion?

Yep, but perhaps wait a few days for review comments.

Raag

