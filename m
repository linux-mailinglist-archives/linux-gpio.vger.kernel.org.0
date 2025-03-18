Return-Path: <linux-gpio+bounces-17720-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B6127A66F94
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Mar 2025 10:23:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1815F17298A
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Mar 2025 09:23:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50AED206F2B;
	Tue, 18 Mar 2025 09:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fuikqSqi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874EA146D6A
	for <linux-gpio@vger.kernel.org>; Tue, 18 Mar 2025 09:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742289782; cv=none; b=YfhsQqV7F+GwFsoGvcLmx4VAo9d9Mz0Xi+4Ti7cRAWpdPKnSIyqIaAC6gfh86uAd+wabmzswYEpIU1GrvNrr/9mn4D8RVjdfG/o1iqte48g9/2y/GC/bjGBtSZSQN/GoiKEraBuL3J7puCPm5xsd++1cN1w/Rb4cDtPmToaKUYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742289782; c=relaxed/simple;
	bh=3TdZoY2Lpd00ggNaIUrE22wTIkA2MdOF3+qwZQOOyig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gh9jsaV3XfI84FVSwE1c2bSZq7ItRuDThL429C/cGX211IkaCbEQ5dvo2LvrlJYjgiIS8MdyzrY6odLE+k3EjF3bR3epkjmsq9g7AO1cDj7XX8bSjcJwcwHfAvVfj1qvlDsE1yUFNSoJ+Vp+Zqj3LaAFsGSRI0QakbnKqCXmC1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fuikqSqi; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742289781; x=1773825781;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3TdZoY2Lpd00ggNaIUrE22wTIkA2MdOF3+qwZQOOyig=;
  b=fuikqSqiFhWRnmaHtJG05JlnJv+GEkfGbNA+ctInzQvFpGjQxNF0updV
   QCFCnKZdnny5QiBDA9U9zzqngKKJ+P7wCRzjUi67v+BWD1VtKJMTLGXE6
   FYhlcJRo1K+Gqz+xvnyedSYsDuTxo/raIYhHOhgCb5hw1eYdn1tbfvVEw
   2FC4wwm8maADw3RxuDNVZEuNsYcSOE7jgZ4cEu2egjhVHglNBgWFTRYrr
   73MT5FvTEjLrUz5eBvw8Og5NSbmkyHeImmLzW5TfTANJ2UEBK6Mo+MUBZ
   VLtxh5xForlTDiGZJww7yH7Uq+H/C9uHBIY9tQmBmfyAPhs0o6kvTcAYE
   Q==;
X-CSE-ConnectionGUID: FEobeUd3RQG80aVXyQ3XcA==
X-CSE-MsgGUID: rZ/7BVhVTteIKuxohwWnlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="53629487"
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; 
   d="scan'208";a="53629487"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 02:23:00 -0700
X-CSE-ConnectionGUID: ufNH7jJQRlWu/DTcYK/B6Q==
X-CSE-MsgGUID: SiQPD2MzSwOWcur8xaavJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; 
   d="scan'208";a="122224094"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 02:22:58 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tuTA0-00000003ZnD-1kYM;
	Tue, 18 Mar 2025 11:22:56 +0200
Date: Tue, 18 Mar 2025 11:22:56 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Linus W <linus.walleij@linaro.org>, "brgl@bgdev.pl" <brgl@bgdev.pl>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Re: GPIO TODO
Message-ID: <Z9k7cL8W-TCBLK1f@smile.fi.intel.com>
References: <PAXPR04MB8459BEB700FB66FE693EF1CF88DE2@PAXPR04MB8459.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB8459BEB700FB66FE693EF1CF88DE2@PAXPR04MB8459.eurprd04.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Mar 18, 2025 at 07:37:59AM +0000, Peng Fan wrote:
> Hi All,
> 
> I did two patches to drop of_gpio.h for 
> drivers/spi/spi-stm32-ospi.c and drivers/regulator/s5m8767.c.

Dropping of_gpio.h from the latter is not just that, one needs to
convert it to use GPIO descriptor APIs first.

> But when I search lore.kernel.org, I see Andy did some
> work on the cleanup, hope there is no duplication with your
> work, and I wonder do you plan to cleanup the remaining
> ones under drivers/net/ drivers/nfc sound/ ?

There is no duplication for sure, any help will be appreciated.

> Besides the of_gpio.h, anyone working on immutable irq_chip?

As far as I know that work has been staled. Again, it would be nice
to continue.

-- 
With Best Regards,
Andy Shevchenko



