Return-Path: <linux-gpio+bounces-17838-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ED333A6B40E
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Mar 2025 06:28:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 385E517A0CE
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Mar 2025 05:28:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 462121E991C;
	Fri, 21 Mar 2025 05:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AiE75BYb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ACFD1E98E1;
	Fri, 21 Mar 2025 05:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742534910; cv=none; b=qY7+19jKm+zoBr064ikXOMr7oH1cQCgrvGQ7HHEFTYbt98E/b7FP3Il/Mt+77UD4QsZne2yTtYrUS04Zgp2rj5zRjpRHnUQTQTJRP+BTLonBElTYwZ2VigXgrlQyIyKrcr09yl1P47tf2lerPRtL3XO1H/Ih0M7cgp4Ph6yejGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742534910; c=relaxed/simple;
	bh=d+A5v4z1VqwkPwIlnIMnSoB4JUMGjeiiC2p4W11Hlww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FfRL+t4vIzl9Z5aymkPaQ/qxM50Ev9And4vLnBmtds6lO5MynEHUYg8hT1ImceSYQ6GF6sr5MqSl5gcjLKXgUA+fsN0tlB17FdZQU8mHX2YeL34/kmvKyivn21Dzxr7D9OoqtmpexDOtv4vb1FkBjl1KU0/Ph6xe6bwNfQma0jU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AiE75BYb; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742534908; x=1774070908;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=d+A5v4z1VqwkPwIlnIMnSoB4JUMGjeiiC2p4W11Hlww=;
  b=AiE75BYbEJkx2x0lZHN81l9WzmL4CZ5LTaQzKPPWAXClC4FKDra0GQ+g
   WwRGgCIy2YL5cr/RnVdg8y/PyXwNXfygPbBOVC8Z/vSC+pNAHHqtt+Ih5
   NqNkiHLuMIEBVODN6sKahGr025kZZ+qRxLy1z1fs/tqO+wiqEMy1Qwdqu
   8Do/HiNpPzb47MYVNYZtdNjk3LY4HCSlqzLT+PuXC/X7ea3SELwo7jD/L
   csCaihOxlMmZ7GExK8N1o3/9s67tulhAFho51XGQa5z6K7aFpCJnALW59
   0tlIi7Lpiwanx9v1362MlmAFLhjzUkRNKi4y6dLmRliIYTFas4ekIGXkV
   Q==;
X-CSE-ConnectionGUID: FKsb3bujTEmud+llxeHj4w==
X-CSE-MsgGUID: dTxaLozIRQ65eAlJvJ61ww==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="69147786"
X-IronPort-AV: E=Sophos;i="6.14,263,1736841600"; 
   d="scan'208";a="69147786"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2025 22:28:27 -0700
X-CSE-ConnectionGUID: /dR2s6RTQGqG7aWieZDvUg==
X-CSE-MsgGUID: BrGvTM65RZyb7AdyVEGsaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,263,1736841600"; 
   d="scan'208";a="124255137"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2025 22:28:26 -0700
Date: Fri, 21 Mar 2025 07:28:22 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Lee Jones <lee@kernel.org>, gregkh@linuxfoundation.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	giometti@enneenne.com, raymond.tan@intel.com,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/5] mfd: intel_ehl_pse_gpio: Introduce Intel Elkhart
 Lake PSE GPIO and TIO
Message-ID: <Z9z49lfWV6LjUnaI@black.fi.intel.com>
References: <20250307052231.551737-1-raag.jadav@intel.com>
 <20250307052231.551737-2-raag.jadav@intel.com>
 <20250314124450.GP3890718@google.com>
 <Z9QxqH3DJvyW3sjo@smile.fi.intel.com>
 <20250314135735.GQ3890718@google.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250314135735.GQ3890718@google.com>

On Fri, Mar 14, 2025 at 01:57:35PM +0000, Lee Jones wrote:
> On Fri, 14 Mar 2025, Andy Shevchenko wrote:
> > On Fri, Mar 14, 2025 at 12:44:50PM +0000, Lee Jones wrote:
> > > On Fri, 07 Mar 2025, Raag Jadav wrote:

...

> > > > +static void ehl_pse_gpio_remove(struct pci_dev *pdev)
> > > > +{
> > > > +	mfd_remove_devices(&pdev->dev);
> > > > +	pci_free_irq_vectors(pdev);
> > > > +}
> > 
> > Same here.
> 
> Also, Greg has been quite vocal about converting PCI devices to Platform
> ones in the past.  We may wish to run this past him before continuing.

Greg, any objections on moving forward with platform device?

Raag

