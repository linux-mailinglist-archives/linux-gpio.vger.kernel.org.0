Return-Path: <linux-gpio+bounces-16962-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6DBA4C6D8
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 17:24:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D8CE188B679
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 16:21:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D084215F6E;
	Mon,  3 Mar 2025 16:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="frYhSB76"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1EB213227;
	Mon,  3 Mar 2025 16:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741018369; cv=none; b=Hc23F1NkB4ASJVuEoXbSCJZ58ppoWgyAa9Z7YU5saXzLJl5CFNDEaXbxakvUteuZYbzRGXUxl7AMxGSO3Gi9pogR3b+u8PbRckfTDrlN1OeZ6SV1suPwuV2DF10y2h33s0kOXQv+72hazuBnz15l0OCewtlUT9n39SlnsOKy4/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741018369; c=relaxed/simple;
	bh=/ghFgI/MaEP2uWJLGRydPD82IY9KviAq8ItyxZP3F3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QwLU42WOgAx36hQMsGxiBJyUBrOOIA4gKa6EdoyAaYD9PotiFOvYsdw6pKe0hT68Ck2HOWWiRB7M8o47ePERG7ezKNT0UJCzLaHRZEWC2uhTBRZoLPTrOqgsFtkIfigaCAtmFGdFo5evuV0MUksy3CC9vVmT5H27LNGi/Q5JBxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=frYhSB76; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741018368; x=1772554368;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/ghFgI/MaEP2uWJLGRydPD82IY9KviAq8ItyxZP3F3I=;
  b=frYhSB76pyHrOeso6DSErgn2BK5IBWqfLXUoEm2Evyrif396SGYovTN4
   9/g2maF7dYUW3rH+UselsWJl89Ozkg7SjcU3UzLBPFnvrbGmk0gTzBoYW
   vFnQzozXPnaui+zOyGM2elLnHgM8JBySI83ri2NifrVnlUCZyQBDi5ZZ1
   jN5Fu2FxxYzUfs4ibnG3NJEoco3haQ63NccS39YuJMPVKDoVA7OUzwQf9
   vE4DSWFAYqXoSKmhtYcXQylvHKZoB9pjY0emTcVZ0xVaSIxu6Jsp5XbPN
   TMVJqJrD1o/jf1occPLoHAKb8q5uYP7H5uq0ue5n1F3SebQrdvPqUKAs2
   g==;
X-CSE-ConnectionGUID: VQCwBHdKQWiBBrbLs8cvcA==
X-CSE-MsgGUID: UluX1RN4QmWLkgsFIS+Ujw==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="29487887"
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; 
   d="scan'208";a="29487887"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 08:12:40 -0800
X-CSE-ConnectionGUID: ti4rvz4KQDmph+7VX9bzAA==
X-CSE-MsgGUID: KMs/TJwKR1qSrtq8RTCfCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="155252358"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 08:12:36 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tp8PA-0000000GrNj-45Uh;
	Mon, 03 Mar 2025 18:12:32 +0200
Date: Mon, 3 Mar 2025 18:12:32 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-wpan@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	Alexander Aring <alex.aring@gmail.com>,
	Stefan Schmidt <stefan@datenfreihafen.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH net-next v1 1/2] ieee802154: ca8210: Use proper setter
 and getters for bitwise types
Message-ID: <Z8XU8Dh6Ks5Eao6d@smile.fi.intel.com>
References: <20250303150855.1294188-1-andriy.shevchenko@linux.intel.com>
 <20250303150855.1294188-2-andriy.shevchenko@linux.intel.com>
 <87mse285fb.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87mse285fb.fsf@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Mar 03, 2025 at 05:06:32PM +0100, Miquel Raynal wrote:
> On 03/03/2025 at 17:07:39 +02, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> 
> > Sparse complains that the driver doesn't respect the bitwise types:
> >
> > drivers/net/ieee802154/ca8210.c:1796:27: warning: incorrect type in assignment (different base types)
> > drivers/net/ieee802154/ca8210.c:1796:27:    expected restricted __le16 [addressable] [assigned] [usertype] pan_id
> > drivers/net/ieee802154/ca8210.c:1796:27:    got unsigned short [usertype]
> > drivers/net/ieee802154/ca8210.c:1801:25: warning: incorrect type in assignment (different base types)
> > drivers/net/ieee802154/ca8210.c:1801:25:    expected restricted __le16 [addressable] [assigned] [usertype] pan_id
> > drivers/net/ieee802154/ca8210.c:1801:25:    got unsigned short [usertype]
> > drivers/net/ieee802154/ca8210.c:1928:28: warning: incorrect type in argument 3 (different base types)
> > drivers/net/ieee802154/ca8210.c:1928:28:    expected unsigned short [usertype] dst_pan_id
> > drivers/net/ieee802154/ca8210.c:1928:28:    got restricted __le16 [addressable] [usertype] pan_id
> >
> > Use proper setter and getters for bitwise types.
> >
> > Note, in accordance with [1] the protocol is little endian.
> >
> > Link: https://www.cascoda.com/wp-content/uploads/2018/11/CA-8210_datasheet_0418.pdf [1]
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Looks correct indeed,

TBH, my guts feeling is that this driver was never tested on BE platforms...

> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks for review!

-- 
With Best Regards,
Andy Shevchenko



