Return-Path: <linux-gpio+bounces-35755-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2AiFNc6x8WmwjgEAu9opvQ
	(envelope-from <linux-gpio+bounces-35755-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 09:22:54 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 315B5490634
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 09:22:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2DCA730087A8
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 07:19:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 843B93A3E84;
	Wed, 29 Apr 2026 07:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HW3Nz36e"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1185F3A257F;
	Wed, 29 Apr 2026 07:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777447156; cv=none; b=cYgeS5IzzqRBPbuKSMZO/ldkyQqfvIarUtiTx4jR+FwTzrjpVYDrsyyIJyoe8EJ2ZHRJN5ckblI0C2Ocf1pvYXVdHglhw91HSVrVpOTPPj/x5kyAFcKxToDQAbKPOzAj/XA7Ribq7qplyAXI0K+xHt2+hJ/1zgd4OduiOMFo2ZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777447156; c=relaxed/simple;
	bh=/dyBE2LzobrYrQWPogsatP6ANqkMRMG+/NBhCIlk8jw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y7tCBDbx0SJ9kU3TwQ7yeagjk0peCarfHxK3SoAMrwwTciJY4tGeylThcfM7gB74LCGyfC8cqI3ms1JJFpYkYoaXF0vMUUTtNdHxV+jUc0Ji6sgJR3bO53xTXcnWq+zWleoKAgwaPIfl3sM9/p+QNa5UsrlFNA17x0fh/Yoal/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HW3Nz36e; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777447155; x=1808983155;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/dyBE2LzobrYrQWPogsatP6ANqkMRMG+/NBhCIlk8jw=;
  b=HW3Nz36e4f3qAghDpgcNEenPJeZVJg3nb2GeACf1WJOXqOQBkoHti6ii
   dRGEf6Ikw3kT/nNQo+pSeZx5rhPUfRw+PsOmlxOOxI6BirA5bnENvNG0F
   Cjjf/qvhwjnpZj+dIOUzVZGm056/YMk738WIi5oCDV8P6CsaBCfo1T2aG
   HI9H3vqJprAtRKbMd3kkefDWpVuEYr+IjgiPAHwMoszOymw0mR+QVe6WW
   AU/EW3BhkAIy4UdOXn4oL/2EViMQ32W7um/zvdEksRnQjILq8tZmvay2f
   dfthSV8fKrnI2U0au8N8QrS9ike2WsDKqHHOBXD0wxp5gvbPij1yW5u09
   w==;
X-CSE-ConnectionGUID: 4U9+MJX2SCG2gUCT5e/oSw==
X-CSE-MsgGUID: R4E6jzZiTHubfI04/XOb8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="78079143"
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; 
   d="scan'208";a="78079143"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 00:19:14 -0700
X-CSE-ConnectionGUID: 8LDl7vqpSnqLVbfyQ9XNbw==
X-CSE-MsgGUID: FEZ4flpjQKy+HZiDCNBnig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; 
   d="scan'208";a="238517923"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.141])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 00:19:11 -0700
Date: Wed, 29 Apr 2026 10:19:09 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: westeri@kernel.org, linusw@kernel.org, brgl@kernel.org,
	bentiss@kernel.org, hansg@kernel.org,
	Francesco Lauritano <francesco.lauritano1@protonmail.com>,
	Marco Scardovi <mscardovi95@gmail.com>, Armin Wolf <W_Armin@gmx.de>,
	mika.westerberg@linux.intel.com, linux-gpio@vger.kernel.org,
	linux-acpi@vger.kernel.org
Subject: Re: [PATCH] gpiolib: acpi: Only trigger ActiveBoth interrupts on boot
Message-ID: <afGw7aC4HVXWoygi@ashevche-desk.local>
References: <20260429025247.1372984-1-mario.limonciello@amd.com>
 <afGuw9VbvnGTQW0F@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afGuw9VbvnGTQW0F@ashevche-desk.local>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Queue-Id: 315B5490634
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,protonmail.com,gmail.com,gmx.de,linux.intel.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-35755-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ashevche-desk.local:mid]

On Wed, Apr 29, 2026 at 10:10:00AM +0300, Andy Shevchenko wrote:
> On Tue, Apr 28, 2026 at 09:52:39PM -0500, Mario Limonciello wrote:

...

> > -	    (event->irqflags & (IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING))) {
> > +	    ((event->irqflags & (IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING)) ==
> > +	     (IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING))) {
> 
> Use _MASK in both cases.
> 
> 	    ((event->irqflags & IRQF_TRIGGER_MASK) == IRQF_TRIGGER_MASK)) {

Ah, I thought it was only for edge ones, seems we can't use it in the second part.

The other definitions are for TYPE, there we have IRQ_TYPE_EDGE_BOTH.

-- 
With Best Regards,
Andy Shevchenko



