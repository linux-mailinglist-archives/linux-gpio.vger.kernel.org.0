Return-Path: <linux-gpio+bounces-18005-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A58EA717C9
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Mar 2025 14:51:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E5280170B5B
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Mar 2025 13:51:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6820C1EEA59;
	Wed, 26 Mar 2025 13:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="OO19TWv4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3011E1DEE;
	Wed, 26 Mar 2025 13:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742997105; cv=none; b=pE0DHMnS6vSVn4rPm3Mw6dTFfa2roAvd7PFtTls+xBsyLGZEbQHx4jbiLmctwkwk2ujakUzZwd/sFrM8liWTk0mJ7GQ2a355oFN9dRvg/5ERtXthaHvZCCVY1AMbM0+EZLEoTyW6AU0keN/ZLGfbDbOudj9wi+QTOHvPSmRacoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742997105; c=relaxed/simple;
	bh=0emlILhDt50Wd14Lf4Ha0ayGkkJ90W2Le45aaT8IgI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c2jM+iBOHep1Jk7nKlQdQV6WEhzk8CHsZhYqKaxIuajPVDgVbmz1SIZ6yxMP1db1uDI5x0/NKJgrtaJFY0mhRjgg7phBGCfP7azqkTiuF3Yhb8dR32Ap1LUtrZPZ5tniQgcQnLihTxPpcwrGuEShWmmiz9550poBjufPu4BupIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=OO19TWv4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEE5CC4CEE5;
	Wed, 26 Mar 2025 13:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1742997104;
	bh=0emlILhDt50Wd14Lf4Ha0ayGkkJ90W2Le45aaT8IgI4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OO19TWv4oD/Ga5VbGNTBP2DcziPpSOdI3luLMW6mnsuE1kTyMeT+5nHJSz6gdETDg
	 WxaNeUGP7UbtOUlxeRTnIYBLVdaw37/XAuAry5d32DwolRQDWFGqI9HeRI3TUoPadq
	 Kv/C8ILiny7IFQbC4zk7uW/bW69RqQ+pjOmtCHCM=
Date: Wed, 26 Mar 2025 09:50:19 -0400
From: Greg KH <gregkh@linuxfoundation.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Raag Jadav <raag.jadav@intel.com>, Lee Jones <lee@kernel.org>,
	giometti@enneenne.com, raymond.tan@intel.com,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/5] mfd: intel_ehl_pse_gpio: Introduce Intel Elkhart
 Lake PSE GPIO and TIO
Message-ID: <2025032609-query-limit-491b@gregkh>
References: <20250307052231.551737-1-raag.jadav@intel.com>
 <20250307052231.551737-2-raag.jadav@intel.com>
 <20250314124450.GP3890718@google.com>
 <Z9QxqH3DJvyW3sjo@smile.fi.intel.com>
 <20250314135735.GQ3890718@google.com>
 <Z9z49lfWV6LjUnaI@black.fi.intel.com>
 <2025032115-gloomily-cubbyhole-dd8e@gregkh>
 <Z91oHCpfOkvgJmzP@smile.fi.intel.com>
 <2025032514-ipad-schilling-9928@gregkh>
 <Z-PCgJY8qBPBWKVN@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-PCgJY8qBPBWKVN@smile.fi.intel.com>

On Wed, Mar 26, 2025 at 11:01:52AM +0200, Andy Shevchenko wrote:
> On Tue, Mar 25, 2025 at 08:45:29PM -0400, Greg KH wrote:
> > On Fri, Mar 21, 2025 at 03:22:36PM +0200, Andy Shevchenko wrote:
> > > On Fri, Mar 21, 2025 at 06:04:38AM -0700, Greg KH wrote:
> > > > On Fri, Mar 21, 2025 at 07:28:22AM +0200, Raag Jadav wrote:
> > > > > On Fri, Mar 14, 2025 at 01:57:35PM +0000, Lee Jones wrote:
> > > > > > On Fri, 14 Mar 2025, Andy Shevchenko wrote:
> 
> ...
> 
> > > > > > Also, Greg has been quite vocal about converting PCI devices to Platform
> > > > > > ones in the past.  We may wish to run this past him before continuing.
> > > > > 
> > > > > Greg, any objections on moving forward with platform device?
> > > > 
> > > > I have no context here at all, why would a PCI device EVER be a platform
> > > > device?  That feels wrong on so many levels...
> > > 
> > > It's a multi-functional device, in other words that device provides a set of
> > > (dependent or independent) subdevices. But do you have other suggestion?
> > > The auxiliary bus?
> > 
> > Yes, that is exactly what the auxiliary bus code was designed and
> > written for.
> 
> Lee, what do you think of extending mfd to cover this case, i.e. specifically
> for the PCI devices? Or maybe it makes sense to go to the auxiliary bus
> completely (I think this may break a lot of things on legacy systems, though).

Don't change existing drivers, only do it for new ones please.

