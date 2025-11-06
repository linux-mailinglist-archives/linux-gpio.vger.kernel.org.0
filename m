Return-Path: <linux-gpio+bounces-28151-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 94689C3979B
	for <lists+linux-gpio@lfdr.de>; Thu, 06 Nov 2025 08:59:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D7BBF3B75C2
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Nov 2025 07:59:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D3242FABFF;
	Thu,  6 Nov 2025 07:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GiOMfMuN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F112F9DB2;
	Thu,  6 Nov 2025 07:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762415942; cv=none; b=FUXtx7xtQpiNnfeeE3AI2DteRf0poUsx6IVRLWYY7YfZaiNlPhmJ8ZQkZni/P2zBNbotYfP5ORGpbbiN5t4Lbtl18zj+8qi/ATomyT4ddybHn74M2nr9dQlaItLSXDpgsFPNL4XkHFMUfB1XTQGRu13lgEAYruVKG9qMPwGgbX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762415942; c=relaxed/simple;
	bh=RHkqZa0OAcOoDAZSopSmOrVU9RfrXT9X1ZBuczWNPbg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kUPyD96cClLKyW01RfpeO5YydoZH6wrqVIrKOrmh6F8syTE2XysUZWVXjGlAa9QiH6wbic4qF1Ysu1YSjAn4u1IyOsVivMzBi2VT6fyZ6YbFX0JX9l0MajMwbLeswy0xZe7+3/mMLJdYJ3nwnaKP9JlTtuW+BDPt1MZ0nMPOt4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GiOMfMuN; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762415941; x=1793951941;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RHkqZa0OAcOoDAZSopSmOrVU9RfrXT9X1ZBuczWNPbg=;
  b=GiOMfMuNxMQx5Be0ON9i52Mdn6fDkw1ZAS/fhTZXE8mvGH6sYCqrvyME
   qGjfneCyANvhj5kfvuiJrKTHJ3ijz6FmIQ9um5SqmQ2VILoDblnfY5bRc
   rU1T3+NFoLimCdsyTmiDzWRoOuOmWUtf2/TtkL3BKHyjTBaFY51DAuaBo
   kUhHVArDUXypVmdJIYeEqJaXWwmGGvJfOMarKS+qC37+2xwpJrYofzVcc
   pXWnO4QJD4/5EiMIKZKUyBfkqcuHsJLdELZ0vj4g6LgAOJyozKPBG9CiT
   Fd16FrjSbT74QNcRiwWeHq1m/RH5RydgSe/K4l6P4E/hNytC9JSUS+bAY
   g==;
X-CSE-ConnectionGUID: i+PFsmVkSGyERc5gd8h60g==
X-CSE-MsgGUID: f1npxIS3Rjub5uugO+D8vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="68385239"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="68385239"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 23:58:50 -0800
X-CSE-ConnectionGUID: doxmJYuZRqqYcqJ9d1/eSg==
X-CSE-MsgGUID: F/OU69ctQpy8mZ5etEZdPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; 
   d="scan'208";a="187853550"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 23:58:47 -0800
Date: Thu, 6 Nov 2025 08:58:44 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: kees@kernel.org, broonie@kernel.org, gregkh@linuxfoundation.org,
	arnd@arndb.de, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
	linus.walleij@linaro.org, brgl@bgdev.pl,
	platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mod_devicetable: Bump auxiliary_device_id name size
Message-ID: <aQxVNPRVdJvbqkiz@black.igk.intel.com>
References: <20251106052838.433673-1-raag.jadav@intel.com>
 <aQxQ_orRY1ceokdU@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQxQ_orRY1ceokdU@smile.fi.intel.com>

On Thu, Nov 06, 2025 at 09:40:46AM +0200, Andy Shevchenko wrote:
> On Thu, Nov 06, 2025 at 10:58:38AM +0530, Raag Jadav wrote:
> > We have an upcoming driver named "intel_ehl_pse_io". This creates an
> > auxiliary child device for it's GPIO sub-functionality, which matches
> > against "intel_ehl_pse_io.gpio-elkhartlake" and overshoots the current
> 
> Looking at the name there is another question: Why do we need 'elkhartlake in
> the GPIO driver's name now? It's a dup to 'ehl' in the first part.

Just kept it for historic consistency and I'm a bit terrible at naming.

Perhaps "gpio-aux"? But that's too generic from subsystem POV.

Open to suggestions.

Raag

> > maximum limit of 32 bytes for auxiliary device id string. Bump the size
> > to 40 bytes to satisfy such cases.
> 
> > ---
> > v2: Describe the use case (Greg, Andy)
> 
> Thanks for the update!

