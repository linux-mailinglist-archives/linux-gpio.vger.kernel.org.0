Return-Path: <linux-gpio+bounces-17627-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F8BA61333
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Mar 2025 14:57:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5618118913E6
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Mar 2025 13:57:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBED61FFC63;
	Fri, 14 Mar 2025 13:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q1NMBXR2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890A61FF7D0;
	Fri, 14 Mar 2025 13:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741960660; cv=none; b=K4FENUPNrmykMsLDU9GyuTbC4DFLlUCsvg0QJr+ANsSctpZqIh/Jj6FCuqiYG7TTci3KS5r9Y0R31TI11U94SwH+TkAU77kc0Pv8hJw40K0BuuV5UStH9UeOVCJo8ppayS6j3WEtUwx3e/ty2aKzeg+7ybwmkQxNqqaLkyflcx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741960660; c=relaxed/simple;
	bh=N0yYU5+15Ys+DJvx6CTLdFfOTne1R47pRi6mznUGWeM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PKW2YL+N4pEFKAole/38YuQFTzSwzSi/be36lav9JEfy09Gh6pBaRZrxhWGViLUgI+1QWpqA+SIcGtUxzz3lcmh2qqxMHz9xs9sG4g1uqHkXPfr3hQlnR82L/dI4DfWqsSt9Zp/ayfjNa+wd91bBd7SpxerGtIAcDVudvFVn2Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q1NMBXR2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AB72C4CEE9;
	Fri, 14 Mar 2025 13:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741960660;
	bh=N0yYU5+15Ys+DJvx6CTLdFfOTne1R47pRi6mznUGWeM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q1NMBXR2uXANFdaO2KkOr6dleUjsoOW6WZFuqqFEFDignJ7wWouqPPWFPKIVeJZRI
	 yAeIUx462VTZTVjsP8L+FrbIOjTmA/qKVv0JqPoIx0VivUV8a69ftoruS01gKT7FpG
	 B1WKzmr/AfJNQKFhVVRNhGHIdH6N7SwfU+BY8YSsmwnd8VRsoJ3SCkp7/6AZy3Q6VN
	 uLWcBl8xHtMgyhP4i5uxrKxCR/i2SgfG0pFqboYWx5a8/EcAoqT9fJrkT/e4hAS7HZ
	 z8BsFljSGmMlGbNpMJFJSkjfhu9EcTrW2/rfLx3UxjECjEiYBfno/Aw2hohQ+yKD28
	 jQ2ns1NvUeS1w==
Date: Fri, 14 Mar 2025 13:57:35 +0000
From: Lee Jones <lee@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Raag Jadav <raag.jadav@intel.com>, giometti@enneenne.com,
	gregkh@linuxfoundation.org, raymond.tan@intel.com,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/5] mfd: intel_ehl_pse_gpio: Introduce Intel Elkhart
 Lake PSE GPIO and TIO
Message-ID: <20250314135735.GQ3890718@google.com>
References: <20250307052231.551737-1-raag.jadav@intel.com>
 <20250307052231.551737-2-raag.jadav@intel.com>
 <20250314124450.GP3890718@google.com>
 <Z9QxqH3DJvyW3sjo@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z9QxqH3DJvyW3sjo@smile.fi.intel.com>

On Fri, 14 Mar 2025, Andy Shevchenko wrote:

> On Fri, Mar 14, 2025 at 12:44:50PM +0000, Lee Jones wrote:
> > On Fri, 07 Mar 2025, Raag Jadav wrote:
> > 
> > > Intel Elkhart Lake Programmable Service Engine (PSE) includes two PCI
> > > devices that expose two different capabilities of GPIO and Timed I/O
> > > as a single PCI function through shared MMIO.
> 
> ...
> 
> > > +	ret = pci_alloc_irq_vectors(pci, 2, 2, PCI_IRQ_ALL_TYPES);
> > > +	if (ret < 0)
> > > +		return ret;
> > > +
> > > +	ret = mfd_add_devices(&pci->dev, PLATFORM_DEVID_AUTO, ehl_pse_gpio_devs,
> > 
> > dev_*?
> 
> devm_* ?

Yes, typo.

> > > +			      ARRAY_SIZE(ehl_pse_gpio_devs), pci_resource_n(pci, 0),
> > > +			      pci_irq_vector(pci, 0), NULL);
> > > +	if (ret)
> > > +		pci_free_irq_vectors(pci);
> 
> Anyway, the choice as far as I understood it is motivated by usage of
> pci_*_irq_vector() APIs, which are officially not manageable (however
> in practice they are).
> 
> > > +	return ret;
> > > +}
> > > +
> > > +static void ehl_pse_gpio_remove(struct pci_dev *pdev)
> > > +{
> > > +	mfd_remove_devices(&pdev->dev);
> > > +	pci_free_irq_vectors(pdev);
> > > +}
> 
> Same here.

Also, Greg has been quite vocal about converting PCI devices to Platform
ones in the past.  We may wish to run this past him before continuing.

-- 
Lee Jones [李琼斯]

