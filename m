Return-Path: <linux-gpio+bounces-31687-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mMIuOvW8kGntcgEAu9opvQ
	(envelope-from <linux-gpio+bounces-31687-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Feb 2026 19:20:37 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C73B13CD0B
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Feb 2026 19:20:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DB870301D338
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Feb 2026 18:20:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11CD63101B9;
	Sat, 14 Feb 2026 18:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YRKAU7OS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A39930E0D4;
	Sat, 14 Feb 2026 18:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771093197; cv=none; b=Lq3GE1rEBJasZCCp+fJ2lo0GBKhVmYKdvStx7UEv9kqros2GeGtg57Pvvq2yzuKU/WpnVr1roHalWSfpKb3vUYt8pYwADmNmYDJSlvvzhOD1eJRhbZjxKmw9u7OMahXWRhtkw7w4Nt/e8c5lsBC/LHVzDWsuLlYpjNVcPdY199o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771093197; c=relaxed/simple;
	bh=nlwN7W8dolZXiM1dLKVSUHD6gpvA8g94SZA3JIWgiZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=egPBhpyIUP/GTPqJwv2xeRgyMeEXualns1DI6oeq2Yx5ExvGf7Oo+N5YhCHTGiiT3PoIroEceXW8SSRc85Mth8yh9otgQ7FvZaGtZhSNZqS1gryBAgK69nNMJqaPqVEDAMHEhF2Mteu6I230iKcCDbfxC0VTSq9rMcmMI+mXCS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YRKAU7OS; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771093196; x=1802629196;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nlwN7W8dolZXiM1dLKVSUHD6gpvA8g94SZA3JIWgiZ8=;
  b=YRKAU7OSxq4hD/tVb+WsKxgH85GohWn4s/bxT6i1sZz/eY3DdcGBWvKx
   zqzSDJitqRVcW2qYvhNg8tKZ4tO5l409wosVCu5EAHUDyoE6CC61Kilo3
   sOAYTi+FkEeTG2NMHYrp8iR+nUzseE+iRzPHri5RpKyMnMGErJHNFkrBw
   yQmCM+yxs0Zp4vwJyrprRw3oxihzFffBplOeOC7BVIk+hPkSfPtz4iSEl
   IGisHvPML7uDRFv/WuMdsq1AgIR57ERdUqmZMe5TqN6ZuOaM8qzgn3vsv
   HBmPdZ0yBitPSgyDGEb+2zE4d7d1E/ONHtn9CC3ZVtEZdkumWzUVcUYFH
   g==;
X-CSE-ConnectionGUID: XmOW+ZrQRnqMpl7W7iufYg==
X-CSE-MsgGUID: ZA5/ulyERAigdI4hbTDwdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11701"; a="94878487"
X-IronPort-AV: E=Sophos;i="6.21,291,1763452800"; 
   d="scan'208";a="94878487"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2026 10:19:56 -0800
X-CSE-ConnectionGUID: LoQrdODdQXWDU0d8Un8Jcw==
X-CSE-MsgGUID: 1Gh/ErF/S8aT7PiEZNxCLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,291,1763452800"; 
   d="scan'208";a="218179931"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.136])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2026 10:19:52 -0800
Date: Sat, 14 Feb 2026 20:19:50 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: 434779359@qq.com, David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	liufulin <frank.liu@faiot.com>,
	Waqar Hameed <waqar.hameed@axis.com>, linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] tof: Add VL53L4CX TOF drivers
Message-ID: <aZC8xn2jzZYEefIr@smile.fi.intel.com>
References: <tencent_326708D02875274DF25B10B91402B3828606@qq.com>
 <20260207134950.0f064905@jic23-huawei>
 <aYiL89Lx9r8tJT0K@smile.fi.intel.com>
 <20260214162526.01e1e336@jic23-huawei>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260214162526.01e1e336@jic23-huawei>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[qq.com,baylibre.com,analog.com,kernel.org,gmail.com,faiot.com,axis.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-31687-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,smile.fi.intel.com:mid,qq.com:email]
X-Rspamd-Queue-Id: 7C73B13CD0B
X-Rspamd-Action: no action

On Sat, Feb 14, 2026 at 04:25:26PM +0000, Jonathan Cameron wrote:
> On Sun, 8 Feb 2026 15:13:23 +0200
> Andy Shevchenko <andriy.shevchenko@intel.com> wrote:
> > On Sat, Feb 07, 2026 at 01:49:50PM +0000, Jonathan Cameron wrote:
> > > On Sat,  7 Feb 2026 17:42:35 +0800
> > > 434779359@qq.com wrote:  

...

> > Yeah, this is even barely satisfies requirement to put into staging/iio.
> 
> Just to cut off any chance of wrong interpretation: We don't put new devices
> through staging/iio any more.  There is little reason to do so now that the core
> is out of there and mass refactors and ABI changes are a thing of the distant
> past.
> 
> Now it's much swifter to clean a driver up on list.
> 
> Maybe there is a reason we might consider drivers/staging again for IIO
> device drivers, but I've not thought of it yet!

Depends on the quality of the driver and eagerness to have it in the kernel.

> > It has so-o-o many style issues and other small things (I just pressed PgDn
> > several times within 5 seconds). You need to take your time and invest into:
> > - creating an upstream plan (roadmap)
> > - as Jonathan said, start with a minimalistic setup (not more than a couple of
> >   thousands of LoCs
> > - be sure the style follows the Coding Style and IIO subsystem specifics
> > - be sure the code uses modern APIs from kernel and not some outdated stuff

-- 
With Best Regards,
Andy Shevchenko



