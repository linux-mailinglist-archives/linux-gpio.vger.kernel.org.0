Return-Path: <linux-gpio+bounces-17628-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B0FA6138D
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Mar 2025 15:20:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3778D1897EAE
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Mar 2025 14:20:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CFC7200BA9;
	Fri, 14 Mar 2025 14:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IME0zJTf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0B41FDE0E;
	Fri, 14 Mar 2025 14:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741962042; cv=none; b=CDWsMinOjgWp+ZqP6odyNqsC5u2CvSrRGgIG3Q2ousm9P6j4ceBcXWXXeAsyVdadD0qpr+Uh7ElLnDApr5iH3vip/hF2nhY9l/JqMwoSX12JlAtLaIxea9PfIJyHlfkkMTGHHMCc1gcQrk416msPda4F4z4ppo4n2UGRFRtf7rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741962042; c=relaxed/simple;
	bh=MXzcLnHBJzJYjTxLG1j07PTOBS0HItzaXjWqNGeP1k8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oQm0FmkdV6Ks/w+chq1dBHHEG0QSnmp9QmD6/yzruKuffYVYK4a0ZhDz86+dnos+yiL+EAeIRUngsY+gEd4SKeA5nKYwDRxHZo8QcaziUe9/Rgr+0uQASB+OpPZEQqbIwE6XM4K+KXZbE4QizrEUtVRFB5UoxM8Log5xhAmtZTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IME0zJTf; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741962041; x=1773498041;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MXzcLnHBJzJYjTxLG1j07PTOBS0HItzaXjWqNGeP1k8=;
  b=IME0zJTftjKCgnuHcMyEmuqUqObZu6V1iGBj2h2hfyDvKSwrgsx5OSMb
   s3t55y9P9JQ+rKK5LOyDK1yegNskPLJdgZ18rbnlAN0+TVhqSki31VM7g
   KSD+I7qszMXjwHahz+mDrsrtD9VyL79SjG9A0m3OsCFHZcWgFzP9auP+A
   HMddoPJQNoo9EUGGquWXpCody/ihDohbxwMBl+Zh+JMAKwZa56BCYzg9v
   96t/eNSVPikfZ7loNieDfHX/tPvZZLjQRwBncmIKvH4hhqOJqbkf/803r
   9xc9h8XisMf1t9E+NN5AWmeK45PUIL8neYYO9Qrgj+n2MbmzPN+itGcXq
   g==;
X-CSE-ConnectionGUID: nniYfErzQxyDo8cROLPosw==
X-CSE-MsgGUID: YcbvhK1ZQg2Z1pAe3m4LEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="54110273"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="54110273"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2025 07:20:40 -0700
X-CSE-ConnectionGUID: 7Wu3AfgLTXSdCITqLixLyg==
X-CSE-MsgGUID: H9YJBAPqQnu7c7LL7pAcvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="152175600"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2025 07:20:39 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tt5tr-00000002Txq-44qE;
	Fri, 14 Mar 2025 16:20:35 +0200
Date: Fri, 14 Mar 2025 16:20:35 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Lee Jones <lee@kernel.org>
Cc: Raag Jadav <raag.jadav@intel.com>, giometti@enneenne.com,
	gregkh@linuxfoundation.org, raymond.tan@intel.com,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/5] mfd: intel_ehl_pse_gpio: Introduce Intel Elkhart
 Lake PSE GPIO and TIO
Message-ID: <Z9Q7M1Cw8X0p9eXP@smile.fi.intel.com>
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
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Mar 14, 2025 at 01:57:35PM +0000, Lee Jones wrote:
> On Fri, 14 Mar 2025, Andy Shevchenko wrote:
> > On Fri, Mar 14, 2025 at 12:44:50PM +0000, Lee Jones wrote:
> > > On Fri, 07 Mar 2025, Raag Jadav wrote:

...

> > > > +	ret = pci_alloc_irq_vectors(pci, 2, 2, PCI_IRQ_ALL_TYPES);
> > > > +	if (ret < 0)
> > > > +		return ret;
> > > > +
> > > > +	ret = mfd_add_devices(&pci->dev, PLATFORM_DEVID_AUTO, ehl_pse_gpio_devs,
> > > 
> > > dev_*?
> > 
> > devm_* ?
> 
> Yes, typo.
> 
> > > > +			      ARRAY_SIZE(ehl_pse_gpio_devs), pci_resource_n(pci, 0),
> > > > +			      pci_irq_vector(pci, 0), NULL);
> > > > +	if (ret)
> > > > +		pci_free_irq_vectors(pci);
> > 
> > Anyway, the choice as far as I understood it is motivated by usage of
> > pci_*_irq_vector() APIs, which are officially not manageable (however
> > in practice they are).
> > 
> > > > +	return ret;
> > > > +}
> > > > +
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

What do you refer to? Any links to read?

-- 
With Best Regards,
Andy Shevchenko



