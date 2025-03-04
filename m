Return-Path: <linux-gpio+bounces-17024-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 711A7A4DC50
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 12:20:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6EEC03A3FEA
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 11:17:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AA6A203707;
	Tue,  4 Mar 2025 11:13:47 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50211FF7B0;
	Tue,  4 Mar 2025 11:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741086827; cv=none; b=VCfRT8jeaUlqG2TW6tBCyyWR3RYCUm8eDIQsai8KBaBTCRURMCt2imoYi4h7A7TdHJxlx4kkJdoWtzui4bwUu1ORBeB4fK9o3Oxz/1YQPaGTkpvU5rwSXWBvG5eNE4djAOs/pJjFyV8JpVWjjJSaq3VjDTVjs6QQG9jWYoIaM7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741086827; c=relaxed/simple;
	bh=1XrR23gtRCCWnn8HjV8+1EZ/Y4XWuQSeZP4DSP6Nyjs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kapT5Zbf48LDHxp+PNmv7ObuSjOTP+MP4yR9+O+F69nn3iNhJIYCXDnXVT56/pVTqAwXiwq1l3RnP1QcujLDdFeSRuxkIEfhVvKPMTf5B3ANKy0jh3i5UW5Q0oPAtIIswNTX+t9+1Mii+YPNlg35h6D95PyGEQwcb6TcXVTGMOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
X-CSE-ConnectionGUID: /X2zx7coRQ60GdqhuuFsLQ==
X-CSE-MsgGUID: NVgJkUvlRv2sF66I1jpSFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="44806818"
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; 
   d="scan'208";a="44806818"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 03:13:43 -0800
X-CSE-ConnectionGUID: 8kpm7LFaQ0KZUprkU+NvXA==
X-CSE-MsgGUID: rcobdrylR/qFJ27MTu/dpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; 
   d="scan'208";a="119033059"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 03:13:39 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andy.shevchenko@gmail.com>)
	id 1tpQDQ-0000000H6My-19Lz;
	Tue, 04 Mar 2025 13:13:36 +0200
Date: Tue, 4 Mar 2025 13:13:36 +0200
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-wpan@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	Alexander Aring <alex.aring@gmail.com>,
	Stefan Schmidt <stefan@datenfreihafen.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH net-next v2 3/3] ieee802154: ca8210: Switch to using
 gpiod API
Message-ID: <Z8bgYFUds3UU96Mo@smile.fi.intel.com>
References: <20250303164928.1466246-1-andriy.shevchenko@linux.intel.com>
 <20250303164928.1466246-4-andriy.shevchenko@linux.intel.com>
 <CACRpkdbCfhqRGOGrCgP-e3AnK_tmHX+eUpZKjitbfemzAXCcWg@mail.gmail.com>
 <Z8YThNku95-oPPNB@surfacebook.localdomain>
 <CACRpkdbqYoY1vYGii1SyPL1mkULGXYX7vFwu+U9u2w9--EYAsQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdbqYoY1vYGii1SyPL1mkULGXYX7vFwu+U9u2w9--EYAsQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Mar 04, 2025 at 01:03:41AM +0100, Linus Walleij wrote:
> On Mon, Mar 3, 2025 at 9:39 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> 
> > > Maybe add a comment in the code that this is wrong and the
> > > driver and DTS files should be fixed.
> >
> > Or maybe fix in the driver and schema and add a quirk to gpiolib-of.c?
> 
> Even better!

I am about to send a v3, I'm going to leave your tag despite a few changes as
discussed. I hope this is okay with you.

-- 
With Best Regards,
Andy Shevchenko



