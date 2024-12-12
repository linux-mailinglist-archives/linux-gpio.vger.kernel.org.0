Return-Path: <linux-gpio+bounces-13831-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C6FC99EF218
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2024 17:45:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9295C17A6F6
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2024 16:35:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2204D2288ED;
	Thu, 12 Dec 2024 16:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M8a8uezA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E90A2288CD;
	Thu, 12 Dec 2024 16:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734020724; cv=none; b=An1s9TrX6716RinQBroT38gkdnorw4JQXkMJgNyY6PXEmBA2xyGTSuWq7KVt+L3plLQaHhsQZbZHmEffqeUv2BySYeK9NTMPcN/eK+xNQ9aOL2Y+8pwsI7D+L9XhXp7YLxpF7CXe42YDTfBiH0nPNABERxyvfq9kyPgovaC1mNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734020724; c=relaxed/simple;
	bh=jmircCLNqfQBhuh2VCOQbpQ4E46VLkw0Jv1d0IeEevU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eWxOpMmaWIjXmn/1Of0Si6BWTgTiBrrPvbbVhFPdKp6l4j4nFGpFXeWB6Cw2EnAu1ohWNE9jsvJbRVZkg7Dz8Tyn920IjuozIDDY45ifQnKzDpWtWMeWzzJCB1+LDaxHti2Fg6JkQdTIpEMrnnGyGdYPt+RRPxyO66nDm+5ucNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M8a8uezA; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734020723; x=1765556723;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=jmircCLNqfQBhuh2VCOQbpQ4E46VLkw0Jv1d0IeEevU=;
  b=M8a8uezA0QeUDBHdtGWLJYrrs96aH4C1lkKscpE7ioapkn0GwKWj99Ut
   63obqdxGzo3V1nkYoPAMYVLPXUXCFlNQA8wFUt19ZxctniOkf3PL+tXCV
   cOehs3xJxjIaIArw16sKEHZ3ztIxIQo35uaF0B2/d56lMiEGMi6MJDTr/
   RX56CDwCVNBwsyLH1eUARCL564nlWOlkqU6myygmKVbp9dmKh+AJEUdjH
   xjNwbAL3HJTo9p2d+Fw9Pyk3YissF7FGPWauTRAc5bCaLOTwvQpSnGX+r
   VRlhUcQ3seQ/yojw4NDNmWl75mqs9p70qC5NToJKKU36HyFgoIh4u7wlI
   w==;
X-CSE-ConnectionGUID: f7w2L+EiTVOcDzDIJGhbaw==
X-CSE-MsgGUID: bT7KFElVSuqdBFlF86eX+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="34368149"
X-IronPort-AV: E=Sophos;i="6.12,229,1728975600"; 
   d="scan'208";a="34368149"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 08:25:22 -0800
X-CSE-ConnectionGUID: 2x7poQK9TiiSPVbNWMCpWQ==
X-CSE-MsgGUID: Nvb/8M3pTEaYxgnQxD2u7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,229,1728975600"; 
   d="scan'208";a="96163080"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 08:25:20 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tLm04-00000006xxb-3o8b;
	Thu, 12 Dec 2024 18:25:16 +0200
Date: Thu, 12 Dec 2024 18:25:16 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Raag Jadav <raag.jadav@intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	mika.westerberg@linux.intel.com, dmitry.torokhov@gmail.com,
	broonie@kernel.org, pierre-louis.bossart@linux.dev,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 0/6] Introduce devm_kmemdup_array() helper
Message-ID: <Z1sObNubEnsFwzOD@smile.fi.intel.com>
References: <20241126172240.6044-1-raag.jadav@intel.com>
 <CACRpkdZqdE8gQCre=zR2cN17oKfwBSnWuVwzQsbRO7-ENVnPNg@mail.gmail.com>
 <Z0nNnsmYIil0OZpy@smile.fi.intel.com>
 <Z1Rfuo3jq7rO0cqb@black.fi.intel.com>
 <Z1r0EPC9gumruFKU@smile.fi.intel.com>
 <2024121242-saturday-aqua-9ac6@gregkh>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2024121242-saturday-aqua-9ac6@gregkh>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Dec 12, 2024 at 03:39:57PM +0100, Greg KH wrote:
> On Thu, Dec 12, 2024 at 04:32:48PM +0200, Andy Shevchenko wrote:
> > On Sat, Dec 07, 2024 at 04:46:18PM +0200, Raag Jadav wrote:
> > > On Fri, Nov 29, 2024 at 04:20:14PM +0200, Andy Shevchenko wrote:
> > > > On Fri, Nov 29, 2024 at 11:17:02AM +0100, Linus Walleij wrote:
> > > > > On Tue, Nov 26, 2024 at 6:22 PM Raag Jadav <raag.jadav@intel.com> wrote:
> > > > > 
> > > > > > This series introduces a more robust and cleaner devm_kmemdup_array()
> > > > > > helper and uses it across drivers.
> > > > > 
> > > > > For the series:
> > > > > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> > > > > 
> > > > > It seems like Andy will push it to me which is excellent.
> > > > 
> > > > Yep, that's the plan after we get all necessary ACKs.
> > > 
> > > Greg, anything I can do to move this forward?
> > 
> > Greg, is it possible to give your Ack or comment or guidance of the preferences
> > with the first patch?
> 
> $ mdfrm -c ~/mail/todo/
> 2293 messages in /home/gregkh/mail/todo/

Oh my...

> Please be patient.

Sure!


-- 
With Best Regards,
Andy Shevchenko



