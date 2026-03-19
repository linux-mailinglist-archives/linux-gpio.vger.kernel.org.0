Return-Path: <linux-gpio+bounces-33790-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4A7yHtiQu2lmlgIAu9opvQ
	(envelope-from <linux-gpio+bounces-33790-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 06:59:52 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C362C66EF
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 06:59:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8AB903030496
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 05:58:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB4B339A7E9;
	Thu, 19 Mar 2026 05:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N+mYlmRY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35012285CB9;
	Thu, 19 Mar 2026 05:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773899897; cv=none; b=GcbQI46+8VmMx2QkN0CrGnStJ6MrTuFD94B1/SKjiF7KWR42tSa+TPGo1wQj3b7j0KIUd5KG7IwoGejp1crmkEnfQt9M3s2aYGD6SNLeB4NOvSzv+MkJqSyiwIE7rT2ChP51ZTXvupWiqrffcSBjgA5aaokAdpWgflLKJ/CNVoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773899897; c=relaxed/simple;
	bh=QZxn0Kwf/CxIY1T9EjaymI5pxtLyENLlL2gRjIISLT8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z7rTjBq3I/mgs93dX1QLj5390+Gw3zbvRPLKfyQ7Uc2eKnvH3xcGsjci9gpm1oDAAlQH5gtNSKWdS9lyy29+zqVZIiK/D/rN/5slJVM2pKjmGYizbZXAHvmCMs0mTxaHVO6IdvUsqPFuR+Xi8ErMin0WUW9kVtWDl8jPsjxrjKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N+mYlmRY; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773899896; x=1805435896;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QZxn0Kwf/CxIY1T9EjaymI5pxtLyENLlL2gRjIISLT8=;
  b=N+mYlmRY//CBffKs1uo6+82a4bwcBLoOaqdCKUDeyuQZ4vX6CN26PHuF
   mSeOKWblDRL3d9JBtJv3kbPDMs306Z0msCoGfMoPHY9YNitUhBboSx4ZJ
   ZBPjLfr07DvzHodlGcPBUrlfTWP7HB1jQAhz6mS+pvw6HccjZGhFrbYm2
   rTzyyags8bnVcfxH/fWx4OFPNavAxano5T0le4diKdSmDvAvjJvsfyKXq
   oaQ0YFJaMaENdV9eW9hSfD7WHHloLecljmSNnQoYyHnrBdj2kuod4D7KM
   EbZdYQOEw3y7MJuzhO+hBGr3ujtD+o/MRip1iLrktkBkxSm4Qr5mWLHlP
   A==;
X-CSE-ConnectionGUID: elakywYCT3Sl1IIsPv+a3w==
X-CSE-MsgGUID: aeByhSb+SYqf8YxpGfeu2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="73980956"
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="73980956"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 22:58:15 -0700
X-CSE-ConnectionGUID: mwgXemcfRcWMZb81kUeDUA==
X-CSE-MsgGUID: kiNkfE9LR32eGWIzWyyakw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="260761114"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa001.jf.intel.com with ESMTP; 18 Mar 2026 22:58:14 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id A0FEE95; Thu, 19 Mar 2026 06:58:12 +0100 (CET)
Date: Thu, 19 Mar 2026 06:58:12 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v1 2/5] pinctrl: intel: Fix the revision for new features
 (1kOhm PD, HW debouncer)
Message-ID: <20260319055812.GN2275908@black.igk.intel.com>
References: <20260318151256.2590375-1-andriy.shevchenko@linux.intel.com>
 <20260318151256.2590375-3-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260318151256.2590375-3-andriy.shevchenko@linux.intel.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33790-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[black.igk.intel.com:mid,intel.com:dkim,intel.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 10C362C66EF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 04:10:16PM +0100, Andy Shevchenko wrote:
> The 1kOhm pull down and hardware debouncer are features of the revision 0.92
> of the Chassis specification. Fix that in the code accordingly.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

