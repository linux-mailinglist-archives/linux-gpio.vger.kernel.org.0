Return-Path: <linux-gpio+bounces-33801-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MLPiJUuju2kLmAIAu9opvQ
	(envelope-from <linux-gpio+bounces-33801-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 08:18:35 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F13302C72EE
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 08:18:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2782A30745DC
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 07:18:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 736A22FD673;
	Thu, 19 Mar 2026 07:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X4ZRYb3N"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2835E19CC0C;
	Thu, 19 Mar 2026 07:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773904710; cv=none; b=c+8fOxvAUkwSGmTOWDYCo+lU0EIw790SMmK52VLYvxkKA1leLG3xPxrpsXar87ISnp7nug3/knxZ+pVYD/qZyZskpD4GlqkGHzdW8gHeiVFOQ0PpUk+Pz5RV2tMmo7Yj/U5AiG5rFIkQQ8i0BOlerR8sGVMZhzJYeIZM1KH7ejs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773904710; c=relaxed/simple;
	bh=iaYVFkToW/uZaJbu1k/+m/UVGAGRP++G8dYhwbPwX3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JyqDiNCdfnO1+AsLgb9aVPcYFt9TtchuiReKQ1x9nHQQjbQWcNdzl7q3Aj1ZuNzRp99Q4L4xC6BnkzVsxmUEUxNxWWHaBDnCeiFi9cbN744IagPiYElMSVfMMlP1pYQJCPvzlAKcNdJp3Pe0FkuDW8DiXafb9JFY9xg98RWMTIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X4ZRYb3N; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773904709; x=1805440709;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=iaYVFkToW/uZaJbu1k/+m/UVGAGRP++G8dYhwbPwX3M=;
  b=X4ZRYb3NHreRACTXKTIrACgqurijN26BhVk6wDvyS2PpowJgKzQOWpmi
   6c8bmJdpVRaZYuPss0pHWoC8bc4h4DR0tDbTGaEZsG8E++FKSZmvFxIQX
   KeYrb/PcYer5yjUj8ZUXl64SNdWDh4ydJLEGw3XuE8zyOmVnYq2+KtSjx
   +UGXxdsa3rWCnzUdpkaWUl0zeOg9E0lxBopUuI0VLlIAjl5D+N1vQUwd/
   HQ+H1b6Q7c+bkkFVYPOgxuJiYOCNW2xr1Yp3noreW/wEbGe53NPXq+P5Q
   JwgrYCDBmbMP2sAox1GsKWVuWswpzuAL+r5qJUX8ja4heAzctI42enuCg
   g==;
X-CSE-ConnectionGUID: YMy3xRCwQ56rk27K5IhCiQ==
X-CSE-MsgGUID: W1lKlYkgTJKA04HdZk7SUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="85287840"
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="85287840"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 00:18:29 -0700
X-CSE-ConnectionGUID: 96hFi/QLRA2fGSuU/2dxqQ==
X-CSE-MsgGUID: yQs3A2M/TpmLGPMP8eizWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="260775629"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.120])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 00:18:27 -0700
Date: Thu, 19 Mar 2026 09:18:25 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v1 4/5] pinctrl: intel: Refactor
 intel_gpio_add_pin_ranges() to make it shorter
Message-ID: <abujQT2aodzm89qP@ashevche-desk.local>
References: <20260318151256.2590375-1-andriy.shevchenko@linux.intel.com>
 <20260318151256.2590375-5-andriy.shevchenko@linux.intel.com>
 <20260319060345.GQ2275908@black.igk.intel.com>
 <abueBMq5VcKdUOEf@ashevche-desk.local>
 <20260319070716.GR2275908@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260319070716.GR2275908@black.igk.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33801-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-0.997];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ashevche-desk.local:mid]
X-Rspamd-Queue-Id: F13302C72EE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 08:07:16AM +0100, Mika Westerberg wrote:
> On Thu, Mar 19, 2026 at 08:56:04AM +0200, Andy Shevchenko wrote:
> > On Thu, Mar 19, 2026 at 07:03:45AM +0100, Mika Westerberg wrote:
> > > On Wed, Mar 18, 2026 at 04:10:18PM +0100, Andy Shevchenko wrote:
> > > > Refactor intel_gpio_add_pin_ranges() to make it shorter in binary
> > > > and source formats.
> > > > 
> > > > Function                                     old     new   delta
> > > > intel_gpio_add_pin_ranges                    219     215      -4
> > > > Total: Before=15522, After=15518, chg -0.03%
> > > 
> > > Well if you enable optimization the compiler probably puts this into
> > > register and you don't see any changes here.
> > 
> > What do you mean? I do not alter what kernel uses.
> 
> Enable -Ox and compare then. I think there is Kconfig option for that too.

I don't see it. Can you elaborate?

> > > Also code-wise this is neglible IMHO.
> > 
> > Maybe, but still good to have also shorter in source as well — we have
> > -1 LoC at the end of the day.
> 
> Well this is silly.

You usually likes - statistics. So, here we are.

> Your other patch adds "unsigned " to every other place
> growing the driver "horizonally" but that's okay.

That's unrelated to this patch and to this certain improvement.

-- 
With Best Regards,
Andy Shevchenko



