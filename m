Return-Path: <linux-gpio+bounces-35533-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eP/9Jcjs7mlV0wAAu9opvQ
	(envelope-from <linux-gpio+bounces-35533-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 06:57:44 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC8546D1C2
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 06:57:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BD1D0300AB08
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 04:57:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 777DA346FCA;
	Mon, 27 Apr 2026 04:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z17TkTM6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326712EDD62;
	Mon, 27 Apr 2026 04:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777265857; cv=none; b=pWQmm02Uo8acGAq5jL4jJXceGStDN33c8FU89agPgNG7n4+IG2KWPf4Jz7ilo1dPwNxs+kkzqpJ402zrDNLomd8PQlcGFCXhKhwZj6Ut9nLFOPOCE7HUXrrmb5NHyWiv9iiS0SNzEMNdOPuvUHzWkdQ5okgU34okrcPeRWhampo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777265857; c=relaxed/simple;
	bh=jZ/gQyskDf9bpQeRgub9iz10gqKL3J/aAnToYVfGb5M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nq8ogbg//JXXAlhnujGHErT2jYQ1iurCvv2vu+TH9sKTgj0JF6fDVTMTKSayvyyUNxqmuiju//YgFe93UoadU3OHBtjENk4alpOW0Dlezf+gJTP7FXi5ADgI9kyDpajlZ5MWd+AwpdlzOcxAQx/o3Yquti+av7SDXV6Ha8yPCJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z17TkTM6; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777265855; x=1808801855;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jZ/gQyskDf9bpQeRgub9iz10gqKL3J/aAnToYVfGb5M=;
  b=Z17TkTM6/hdIK583V2vp1xSdhEbTB19/5sU2BfBYX9YyjhvC9kYFNfPJ
   4Dgz7xPcWxeeiWcurUotNBVnV5mJQkkwGeaoB0LXGDY6csAGqLSSrqykn
   Sb+EVZs+OO3iIWNkSkC35WKEIjLrpGfSryTlbS3iIMgjunAoQFtbsH+qR
   wXD151WleEk4wp8E7xkJaA03dImWSdhZkIT3PWCPy2q1YtdPrQkfWCtsD
   CUw4S5Do4tfiOp1Q/zub2T52nIi2KmvjqXkIL46MghH38iGhUVScXUYw+
   J0hQi2wy41uMCqqvl+WlFuGSn+kuGszdLnbTv0+VnOkTWkLt9b2/2y2JJ
   A==;
X-CSE-ConnectionGUID: Y+Ev2GXYQ8+C6YzN+3P4+A==
X-CSE-MsgGUID: NE0c7awPSwaPqtkIK64zIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="78034473"
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; 
   d="scan'208";a="78034473"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2026 21:57:35 -0700
X-CSE-ConnectionGUID: 8rqvHTCuQ3eocDuDgTFMYw==
X-CSE-MsgGUID: V1wDDYX7SdOeOKk1NOgFxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; 
   d="scan'208";a="271659496"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa001.jf.intel.com with ESMTP; 26 Apr 2026 21:57:32 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 6F1DB95; Mon, 27 Apr 2026 06:57:31 +0200 (CEST)
Date: Mon, 27 Apr 2026 06:57:31 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Armin Wolf <W_Armin@gmx.de>
Cc: Mario Limonciello <superm1@kernel.org>,
	Marco Scardovi <mscardovi95@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Francesco Lauritano <francesco.lauritano1@protonmail.com>,
	"linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
	"open list:GPIO ACPI SUPPORT" <linux-gpio@vger.kernel.org>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
	"westeri@kernel.org" <westeri@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Subject: Re: [BUG] 36-second boot delay due to by
 acpi_gpio_handle_deferred_request_irqs on ASUS ROG Strix G16 (2025)
Message-ID: <20260427045731.GI557136@black.igk.intel.com>
References: <20260422090709.GB557136@black.igk.intel.com>
 <4e55e31e-a5e8-4098-8a7f-bb52476b882a@gmail.com>
 <20260422095558.GC557136@black.igk.intel.com>
 <5a36760d-5d1e-4eee-9006-3fed042aa2cd@gmail.com>
 <20260423044211.GD557136@black.igk.intel.com>
 <3d562963-9581-4e0f-b9a0-5f0fe28d2495@kernel.org>
 <f72a1da5-2cc1-4e08-9441-ea252062b4e5@gmail.com>
 <a2a187d9-363c-48fe-8301-6a199366c478@gmx.de>
 <f4979d43-f61f-4387-8490-ccec7043c940@kernel.org>
 <bcdd110b-489e-4f09-892d-b2d6ce4b0ff0@gmx.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <bcdd110b-489e-4f09-892d-b2d6ce4b0ff0@gmx.de>
X-Rspamd-Queue-Id: 3BC8546D1C2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,protonmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-35533-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[gmx.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,black.igk.intel.com:mid]

On Sat, Apr 25, 2026 at 10:41:46PM +0200, Armin Wolf wrote:
> > > according to the Microsoft documentation
> > > (https://learn.microsoft.com/
> > > en-us/windows-hardware/drivers/bringup/general-purpose-i-o--gpio-,
> > > section "GPIO controllers and ActiveBoth interrupts"), triggering
> > > GPIO interrupts marked as ActiveBoth during initialization is
> > > correct as long as the associated GPIO line is already "asserted"
> > > (aka logic level low). I think the problem is that we also trigger
> > > edge-based GPIO interrupts _not_ marked as ActiveBoth.
> > > 
> > > Based on this i agree with Hans, except that we should continue you
> > > trigger ActiveBoth GPIO interrupts as long as the above
> > > condition applies.
> > > 
> > > Thanks,
> > > Armin Wolf
> > > 
> > 
> > So maybe something like this (attached)?
> 
> Yes, exactly.

This is good information and definitely scales better than the quirk list.
The linked document also mentions that there is _DSM under GPIO device that
could be used to override the asserted state:

https://learn.microsoft.com/en-us/windows-hardware/drivers/bringup/gpio-controller-device-specific-method---dsm-

I wonder if we should implement that as well?

