Return-Path: <linux-gpio+bounces-17989-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F55A70E4A
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Mar 2025 01:46:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9BD903B2274
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Mar 2025 00:46:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 116C0111BF;
	Wed, 26 Mar 2025 00:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="HozrPrDr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56513C1F;
	Wed, 26 Mar 2025 00:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742950012; cv=none; b=mzIRIJgCB7RJMGUHaJkMvDM9gSuBlVlpl7GEufF0VJv+ChxKGHLoTINWP2Ea5agCFje2d8L0eRzKqF3njs7tAe7uJkYeIFx7du7Gtn+8NxRiGMe8kbQrGyvRjaj4FYoua36BmSzFS94Pxc5EeHjnHa3vHnX+JDLmMxr1HpGJZ+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742950012; c=relaxed/simple;
	bh=EJhGVtvblB5u8mqKayDM9dm4ZKNJvU7x/R5GvShO35o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UWLQmgW79YPdy1aCtPrLvtUQXpJE7ye7iPlyBD/r2Ortw2pLj+JeJFAvXUcOWqPf/HLruNPt/XEOe/fErBArK14DdjjslmDctpiMOFgDkcMkMrjT3+3dPc7XjaHQMOtzpzM6QtEEVA4+TY7RsI5DE/wZpXZnmWmzUMkpXgvgZb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=HozrPrDr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F14A3C4CEE4;
	Wed, 26 Mar 2025 00:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1742950012;
	bh=EJhGVtvblB5u8mqKayDM9dm4ZKNJvU7x/R5GvShO35o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HozrPrDr2j/VNcNpZlHoxZfE1VOBIt1G4x0F+vVKAY2VkgxWUBs+TYSdoprsCfTnJ
	 kUfhsNuLOf5CE7B/s4v96Xx/woXAx/ipEzzAD/ti5ZvlWkXfX5mbwNBhLMXBZJK5U4
	 CBatyIaPdDBwbDEdFikfNxbJ2UFU5pHagGaW9Fb4=
Date: Tue, 25 Mar 2025 20:45:29 -0400
From: Greg KH <gregkh@linuxfoundation.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Raag Jadav <raag.jadav@intel.com>, Lee Jones <lee@kernel.org>,
	giometti@enneenne.com, raymond.tan@intel.com,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/5] mfd: intel_ehl_pse_gpio: Introduce Intel Elkhart
 Lake PSE GPIO and TIO
Message-ID: <2025032514-ipad-schilling-9928@gregkh>
References: <20250307052231.551737-1-raag.jadav@intel.com>
 <20250307052231.551737-2-raag.jadav@intel.com>
 <20250314124450.GP3890718@google.com>
 <Z9QxqH3DJvyW3sjo@smile.fi.intel.com>
 <20250314135735.GQ3890718@google.com>
 <Z9z49lfWV6LjUnaI@black.fi.intel.com>
 <2025032115-gloomily-cubbyhole-dd8e@gregkh>
 <Z91oHCpfOkvgJmzP@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z91oHCpfOkvgJmzP@smile.fi.intel.com>

On Fri, Mar 21, 2025 at 03:22:36PM +0200, Andy Shevchenko wrote:
> On Fri, Mar 21, 2025 at 06:04:38AM -0700, Greg KH wrote:
> > On Fri, Mar 21, 2025 at 07:28:22AM +0200, Raag Jadav wrote:
> > > On Fri, Mar 14, 2025 at 01:57:35PM +0000, Lee Jones wrote:
> > > > On Fri, 14 Mar 2025, Andy Shevchenko wrote:
> 
> ...
> 
> > > > Also, Greg has been quite vocal about converting PCI devices to Platform
> > > > ones in the past.  We may wish to run this past him before continuing.
> > > 
> > > Greg, any objections on moving forward with platform device?
> > 
> > I have no context here at all, why would a PCI device EVER be a platform
> > device?  That feels wrong on so many levels...
> 
> It's a multi-functional device, in other words that device provides a set of
> (dependent or independent) subdevices. But do you have other suggestion?
> The auxiliary bus?

Yes, that is exactly what the auxiliary bus code was designed and
written for.

