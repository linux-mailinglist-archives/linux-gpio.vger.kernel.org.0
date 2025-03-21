Return-Path: <linux-gpio+bounces-17859-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BF01BA6BB69
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Mar 2025 14:06:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 92CAC3ACD78
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Mar 2025 13:05:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51E77227EB6;
	Fri, 21 Mar 2025 13:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="FqsJVspC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA3D21A43C;
	Fri, 21 Mar 2025 13:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742562359; cv=none; b=mXCYeNaCuu1jnyAu8lyoSX+OVw79t/A45KtcTrtGMdNLsc4wSWBL0Lw3HgiWAWPRa/nVhQLXOhKmd1vOj9FuJ6bMSkDY/GKDd5w9MyLjTIncBj4f8MxfIeq6L3ZDRV7x9JWIm9HghpsFRc49sJB90bN1dhGJl78sgxnmlOwXznI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742562359; c=relaxed/simple;
	bh=X1O+1arEPV6/AUv15UWPF0jjCmFTImzoeqyDvwBUm5k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VplcwMgbrCoTNHmrbH8XMR6z5HgoIsRNK62+SYavDMlVj7glI8FMLaQ4m1Zsw871myAjT4X7lWJkn0IF7Zb86i8xP6+uQ868AaPLIV3FPuEssOP0OjkJP+HrZhAxiUzcrx3uYFD9SyJc/d3Ozi3ubvsxT5FNnUHevbkOytwSevE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=FqsJVspC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A271C4CEE3;
	Fri, 21 Mar 2025 13:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1742562358;
	bh=X1O+1arEPV6/AUv15UWPF0jjCmFTImzoeqyDvwBUm5k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FqsJVspCAIK+mBUpEFdMkDB46IrEeK5zVvQ9/Z0bzWOgaCuWOrma1Jgjk/JIYbxkD
	 Dz+SmZjxoLaHpIhqgzDRvR43iYM8W//Vj7s3rzoSlMfqpk6btzCyKsw7CAX4bQOlV1
	 Hbl7KjtFWVivNgh91eYWMhbbMjodEt6459+3GXTg=
Date: Fri, 21 Mar 2025 06:04:38 -0700
From: Greg KH <gregkh@linuxfoundation.org>
To: Raag Jadav <raag.jadav@intel.com>
Cc: Lee Jones <lee@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	giometti@enneenne.com, raymond.tan@intel.com,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/5] mfd: intel_ehl_pse_gpio: Introduce Intel Elkhart
 Lake PSE GPIO and TIO
Message-ID: <2025032115-gloomily-cubbyhole-dd8e@gregkh>
References: <20250307052231.551737-1-raag.jadav@intel.com>
 <20250307052231.551737-2-raag.jadav@intel.com>
 <20250314124450.GP3890718@google.com>
 <Z9QxqH3DJvyW3sjo@smile.fi.intel.com>
 <20250314135735.GQ3890718@google.com>
 <Z9z49lfWV6LjUnaI@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z9z49lfWV6LjUnaI@black.fi.intel.com>

On Fri, Mar 21, 2025 at 07:28:22AM +0200, Raag Jadav wrote:
> On Fri, Mar 14, 2025 at 01:57:35PM +0000, Lee Jones wrote:
> > On Fri, 14 Mar 2025, Andy Shevchenko wrote:
> > > On Fri, Mar 14, 2025 at 12:44:50PM +0000, Lee Jones wrote:
> > > > On Fri, 07 Mar 2025, Raag Jadav wrote:
> 
> ...
> 
> > > > > +static void ehl_pse_gpio_remove(struct pci_dev *pdev)
> > > > > +{
> > > > > +	mfd_remove_devices(&pdev->dev);
> > > > > +	pci_free_irq_vectors(pdev);
> > > > > +}
> > > 
> > > Same here.
> > 
> > Also, Greg has been quite vocal about converting PCI devices to Platform
> > ones in the past.  We may wish to run this past him before continuing.
> 
> Greg, any objections on moving forward with platform device?

I have no context here at all, why would a PCI device EVER be a platform
device?  That feels wrong on so many levels...

