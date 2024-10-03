Return-Path: <linux-gpio+bounces-10784-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B19B98ECB9
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2024 12:15:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2CE6E1C21330
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2024 10:15:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4329B149C69;
	Thu,  3 Oct 2024 10:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="met/71qD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7F014601C;
	Thu,  3 Oct 2024 10:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727950501; cv=none; b=GmFGaicK3SwLHXpn3IKyF7PSWliEMBsRcsL3hTtnTHoxPbHAnO3dvUfs6IfugENyXS+9GymL2f6arEZA4Fr36z1ge6dY14UjPNisr1mclRvCfuiWrK54/R6i9mzEWYdu6GBvsk6orh7WthKdSivwaxb8uRnsJBKJaNHONVfVajQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727950501; c=relaxed/simple;
	bh=DAdHbKj+3oyZaLA5bHhqbHUDyQskbVNhOk4Eci5N/d8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V+vHuqpIPCw8IZIN0N3cfCluNufIhUwF308Jh1GcB76/u1nFyzeBCcIuI4RKHKM+dJZ9OQmeHKNW42SXdDhQJTWE+3cJN6d7dCYGwUUAI7Rm2E0alvesha/Oy6rUp3HL2Tq0IIWwa+3EJdLE5TsnycRiPFbVy7GqkBO7IH9/mQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=met/71qD; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727950500; x=1759486500;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DAdHbKj+3oyZaLA5bHhqbHUDyQskbVNhOk4Eci5N/d8=;
  b=met/71qD9difwEdVBumLz/PGAaf58XSvVaMKxYeGTU6hegXMJhcdS1dO
   IJmpxEdqZ/4D6FxMeNVYhRFLW0czIKtyHxay4vPYpQoi379GgxrY3VdjC
   OrQyVp/3mJYB2iBOcdlF4UuKWzCakwFoXLUy1AQ6GXIhtj0cXpGg/t6Ut
   eKoXgvXrLRUBEysR0cnsq+V4Uaj+dzTImVCZeBxQVrwXUMBPCIXkXEaeC
   yCa7IpkZfqS4vH/nFPcsR8a7r+JU6OL0rIjUHyyICefvv+1ZAQ47VjMbo
   OqBMyqJDA7q2KkMZFr2+asv7UGeb+E0cmeLEFWwxzWgdc5M/9Hwg4+7mt
   w==;
X-CSE-ConnectionGUID: VhJVlxw5QWWwroO/yHSRFw==
X-CSE-MsgGUID: f5Njp73fR5e0FhuKY4pSsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="27316498"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; 
   d="scan'208";a="27316498"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 03:14:59 -0700
X-CSE-ConnectionGUID: PQLKY6x6SsWlLq8Yy9uFiw==
X-CSE-MsgGUID: MUqZf/+DTBCe7hQgg4qP7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; 
   d="scan'208";a="111764695"
Received: from unknown (HELO smile.fi.intel.com) ([10.237.72.154])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 03:14:57 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1swIrG-0000000G5Ep-42FN;
	Thu, 03 Oct 2024 13:14:54 +0300
Date: Thu, 3 Oct 2024 13:14:54 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Raag Jadav <raag.jadav@intel.com>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/1] pinctrl: intel: platform: Add Panther Lake to the
 list of supported
Message-ID: <Zv5uns-q2e5i8M7h@smile.fi.intel.com>
References: <20241002150036.3698181-1-andriy.shevchenko@linux.intel.com>
 <20241002152758.GL275077@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241002152758.GL275077@black.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Oct 02, 2024 at 06:27:58PM +0300, Mika Westerberg wrote:
> On Wed, Oct 02, 2024 at 06:00:36PM +0300, Andy Shevchenko wrote:
> > Intel Panther Lake is supported by the generic platform driver,
> > so add it to the list of supported in Kconfig.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Pushed to my review and testing queue, thanks!

-- 
With Best Regards,
Andy Shevchenko



