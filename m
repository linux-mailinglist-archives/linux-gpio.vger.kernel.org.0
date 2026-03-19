Return-Path: <linux-gpio+bounces-33794-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mDUZNxCeu2mclwIAu9opvQ
	(envelope-from <linux-gpio+bounces-33794-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 07:56:16 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 449F72C6EEA
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 07:56:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B12B53077216
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 06:56:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D255836404F;
	Thu, 19 Mar 2026 06:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ijwRqS5W"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0759053E0B;
	Thu, 19 Mar 2026 06:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773903370; cv=none; b=VHss36+UgJs2t2PnEIIpaptD73dI+b5fYtiBfT9cJYjJQlw0UXHD39SCIHdhgiBQfe1iz+ZWijS/63I6nd2H7BF6nLsSXDJgPlxk5WR7BD4G5NkvMUn98TX5xd6tD3la/v23sVsjJY8hys6RbVpw73D3Ceb+TBM8bPqYAkHeKVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773903370; c=relaxed/simple;
	bh=c1JEUziuqfkogYqdJhGXJmjyqDxBheMAxSGpHLpSzL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DUgVXzsy00mSUc1/DSATtTZitZz3OmWocolJqnCYyUUA+JJAFq1aqhGS5XjB+LV/kKXHlwc67Z5JilD1vui0n3pVBPvU27QY17D7UQN3bwUJM4tjhVimnQ0fXDRMCuMttPzUm2+kAaUdQNvnBEZn9uQ55YAJ9OtmsGws/HqTEIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ijwRqS5W; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773903369; x=1805439369;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=c1JEUziuqfkogYqdJhGXJmjyqDxBheMAxSGpHLpSzL0=;
  b=ijwRqS5WCv8l0WjydmspslexPygxuIYfyQeZGtZfIFPDzHLvXMJWYHtz
   uLd67OZsd2AZPfG8xfu1OX117fvtBTBG4EZM13VS12VYpa16268yK6Qt9
   dmE7Pkwm7egx6W9SS18EWDByYc8kl6/G3t9BaRHYsyhfPqXCz7TMzlk2c
   DqhqDMa9mu+bx7VKnBdW9ODB3/vTbK/bozca8GjqdHQ4q947Pb6f6RZnA
   uIYPK4gT1un/0+rmqzAHuuqPJ0Cs7qwdljpUD/QY5zEHn0Np4FV+WB8k5
   OGsGYxciTaaMXx79QKNVirsgfBwBiKHmlCCX2zpmlWIbgqDkcHf9AEQyB
   g==;
X-CSE-ConnectionGUID: 7PwJfwz4Riam8oglth0klA==
X-CSE-MsgGUID: vHnGM9UlRQOPhRQozSj3pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="100429527"
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="100429527"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 23:56:08 -0700
X-CSE-ConnectionGUID: UGutgLKJSBe6Vu9+G+qW3Q==
X-CSE-MsgGUID: 2AQCqIJpT+WBKundObJJvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="227821865"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.120])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 23:56:07 -0700
Date: Thu, 19 Mar 2026 08:56:04 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v1 4/5] pinctrl: intel: Refactor
 intel_gpio_add_pin_ranges() to make it shorter
Message-ID: <abueBMq5VcKdUOEf@ashevche-desk.local>
References: <20260318151256.2590375-1-andriy.shevchenko@linux.intel.com>
 <20260318151256.2590375-5-andriy.shevchenko@linux.intel.com>
 <20260319060345.GQ2275908@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260319060345.GQ2275908@black.igk.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33794-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 449F72C6EEA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 07:03:45AM +0100, Mika Westerberg wrote:
> On Wed, Mar 18, 2026 at 04:10:18PM +0100, Andy Shevchenko wrote:
> > Refactor intel_gpio_add_pin_ranges() to make it shorter in binary
> > and source formats.
> > 
> > Function                                     old     new   delta
> > intel_gpio_add_pin_ranges                    219     215      -4
> > Total: Before=15522, After=15518, chg -0.03%
> 
> Well if you enable optimization the compiler probably puts this into
> register and you don't see any changes here.

What do you mean? I do not alter what kernel uses.

> Also code-wise this is neglible IMHO.

Maybe, but still good to have also shorter in source as well — we have
-1 LoC at the end of the day.

-- 
With Best Regards,
Andy Shevchenko



