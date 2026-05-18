Return-Path: <linux-gpio+bounces-37032-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wGEDMPXLCmqf8AQAu9opvQ
	(envelope-from <linux-gpio+bounces-37032-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 10:21:09 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2176D56899F
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 10:21:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C6872301186F
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 08:19:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 043B93E2AA0;
	Mon, 18 May 2026 08:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a0iZdLn4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6272C3C13F8;
	Mon, 18 May 2026 08:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779092356; cv=none; b=qKctBw0MUiFfzof7noCb0XPWBRAItgag7L7XAigjQV8AujHstGezsfHXvN4NWl7blfrwsofAs1t4ovzhsKPzXW5J+MGWACxv3NSQqfIVh2hT8l4E1FqGUor+Z4KZTGil0EAb0/DQOasdSHpwfFTswoGFr9n+57/qu69W/2Kfez0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779092356; c=relaxed/simple;
	bh=fyUjhAxuxLcosZMs9BfRW6eUPtUom832bOyzvg+uuJw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mFxMZrPbSifo61G9OIK+/76vYELnSWSNbaztNE8oLxgxJvfny/tljHAOsZX89CNMedgdg3AIlXPxv+WFfLiMhMJi7n3B9+W1kleb2rQNUx7Ziwma1+ZURTAQvdd0DANLiAjE37c/DWSGALtEtvUPUZS1AuVouHbwgfLh1So8IO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a0iZdLn4; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779092355; x=1810628355;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fyUjhAxuxLcosZMs9BfRW6eUPtUom832bOyzvg+uuJw=;
  b=a0iZdLn4CE8LBG1LSbvERw/kmhQe2/XPQ8s9FpLteqtA+rcg3rK8pyW7
   ec83BZMQTj0DeNrefuAgPHO8051N7ArRtukqQut4oD+BDoy2ZTGiLId7g
   ur634vjDl33IXjpJz571ss5AJfMbd1hwhPeb6c1AyZs5CxWQWMO02vOHb
   4SUS4mFYU8FsW3XC5yCIjvA0IAZ/jhVqTPM0L/g3rVtUufDNJ0m8z4jiP
   1U5Wkf8Qe3ZA//nZ9XZM/rK7jrvZRrxCMF7FkNhsilg7pw+Q1/JYwgBAG
   onB6OYduRIAphc9+z2Non2//Iq4tAMPcsxAMEzXLBrp9gejAHtWEsTnfo
   Q==;
X-CSE-ConnectionGUID: eVWAzpi+SJuYNkAjf4qgWw==
X-CSE-MsgGUID: EwDmV9u+Rgm+mYvYgjKvUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="80060934"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="80060934"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 01:19:15 -0700
X-CSE-ConnectionGUID: wmZfgo2JQvqKBckXlfQvQw==
X-CSE-MsgGUID: 5uuVJQCRTS24djFKhVMwTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="234901235"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.244.3])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 01:19:13 -0700
Date: Mon, 18 May 2026 11:19:10 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Marco Scardovi (scardracs)" <mscardovi95@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Mika Westerberg <westeri@kernel.org>, linux-gpio@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/12] gpiolib: acpi: Refactor, harden, and modularize
 ACPI GPIO support
Message-ID: <agrLfsjapkOn6YQ7@ashevche-desk.local>
References: <20260518075357.112584-1-mscardovi95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260518075357.112584-1-mscardovi95@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Queue-Id: 2176D56899F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-37032-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,ashevche-desk.local:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Mon, May 18, 2026 at 09:53:45AM +0200, Marco Scardovi (scardracs) wrote:
> Good morning everyone,
> 
> This patch series took fairly a bit of time because, well,

It needs more work. Please, take your time to get familiar with the Linux
kernel process and patches requirements (read Submitting Patches and related
documentation).

> it ended up going a "bit"
> out of hand. It improves style, robustness, resource safety, and modularity
> of the ACPI GPIO subsystem. The massive gpiolib-acpi-core.c driver (previously
> well over 1400 lines) has been significantly refactored, reducing its footprint
> by separating concerns into distinct, dedicated modules for ACPI Operation Region
> handling and ACPI Event/Interrupt processing.

> Key changes and structure of the series:
> 1. Hardening & Correctness (Patches 1-4):
>    - Style adjustments to match Linux Kernel coding standard.
>    - Modernized parsing in quirks using standard sysfs/kstrto helpers.
>    - Added robust bounds checking for ACPI GPIO resource pin ranges.
>    - Fixed a critical memory resource leak in the OpRegion cleanup path.

Start from fixing critical issues first.

> 2. ACPI Operation Region Modularization (Patches 5-9):
>    - Declared shared data structures in the local header.
>    - Exposed private-to-core registration helpers by making them non-static.
>    - Extracted Operation Region handling logic to gpiolib-acpi-opregion.c.
>    - Diverted callback registration to the new OpRegion module.
>    - Removed the unused static emulation handlers from the core driver.
> 
> 3. ACPI Event & Interrupt Handling Modularization (Patches 10-12):
>    - Declared shared helper prototypes in the local header.
>    - Extracted Event/Interrupt logic to gpiolib-acpi-events.c.
>    - Fully decoupled static event handlers and event structures from the core.
> 
> Build correctness and functional behavior were validated on x86 virtual
> platforms using virtme-ng under KASAN and kmemleak with successful boot,
> execution, and zero resource leaks.

I didn't get the point of the whole series. It also gets +80 or so LoC.

-- 
With Best Regards,
Andy Shevchenko



