Return-Path: <linux-gpio+bounces-34686-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EIFyKZyJ0mn9YgcAu9opvQ
	(envelope-from <linux-gpio+bounces-34686-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 05 Apr 2026 18:11:08 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E5C39EF32
	for <lists+linux-gpio@lfdr.de>; Sun, 05 Apr 2026 18:11:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BA1593002B5C
	for <lists+linux-gpio@lfdr.de>; Sun,  5 Apr 2026 16:11:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BE4030DEA3;
	Sun,  5 Apr 2026 16:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IKhSL51w"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B842FFF8B;
	Sun,  5 Apr 2026 16:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775405460; cv=none; b=PXHUwPuJHkMOg3m9DAZ3lfMJqktS7C0PgvpIGu2WWha/AaqOLmuwVY4TzV/BL5u0qGpTDJvzECegUApTB+LERgZ55weo/2j8RzpvlefttniUvZVZHt4goW1XvJdooygOb2XK4slmWSq4i61RHJPCm8G8Z0vPEUjkd8EOdtyNNBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775405460; c=relaxed/simple;
	bh=mLgeKAIaCaCX7MXF6L5i+ewBQaFcQMdNH225F1Hnf5w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kXwttgFLQSZDK25qP4WE4EIEyc8CoKIo+q+Orkh+b68cvxX327HdzcyCBeEWfO6pyrInO5wtqUn3fI2b0vU+lZeeAnD/VkIWzGCq1Iwe37TSKb10/yEirF3idC9GDbhpy/Ms6DggpeosyaWFqWVbGB7DZGUK7dwB9W9+lEJayMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IKhSL51w; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775405458; x=1806941458;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mLgeKAIaCaCX7MXF6L5i+ewBQaFcQMdNH225F1Hnf5w=;
  b=IKhSL51wXpJdkNUeZ/I26pQVFAt6BOWtBAPtcKN+CBIRujtnBg39Y9lV
   mz9IrnYeVhDv4aoyo4psDUK+9wjbgJhZLFOhE6HnZJ14q/lqEvIGaX5Rg
   q1CEt84zHbH6Z4MYXrn/vF5z359cLrljEOds0BosWNRtlV3jxyBZ3sS0F
   ic0hCLpmH8owFMvUmaSYB0Tyg9ZAUc/rmPWoSt1DLih0ECOWQmY2ma3BI
   wvO5PTnMEXOWv8xmi/LS3Dn+ELodMzAKeP+H2SX6jScsSCZmqEDFuo1Zq
   aUvEDiKWmu6B/MsVWICWKAKg9zGj7MB/yi6yNaLLKe/w24XXUmblINaqk
   A==;
X-CSE-ConnectionGUID: c6Is1a0MTEiVBNvhCW60mA==
X-CSE-MsgGUID: lneYrLVFTuCS9pzVZqFEdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11750"; a="87089179"
X-IronPort-AV: E=Sophos;i="6.23,161,1770624000"; 
   d="scan'208";a="87089179"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2026 09:10:58 -0700
X-CSE-ConnectionGUID: 0KvTipItTfyf4wol7D290Q==
X-CSE-MsgGUID: g4omDZqMS0GgCHIT9hiRXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,161,1770624000"; 
   d="scan'208";a="232539051"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.12])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2026 09:10:56 -0700
Date: Sun, 5 Apr 2026 19:10:54 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Vasu <vasuhansalia05@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, djrscally@gmail.com,
	mika.westerberg@linux.intel.com
Subject: Re: [PATCH 2/2] platform/x86: int3472: Handle GPIO types 0x02 and
 0x12 for Lunar Lake
Message-ID: <adKJjmcdrgS_X8wL@ashevche-desk.local>
References: <adIk5GhZ9ZXj1kt9@ashevche-desk.local>
 <20260405092714.6203-1-vasuhansalia05@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260405092714.6203-1-vasuhansalia05@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34686-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,linux.intel.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-0.994];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: 89E5C39EF32
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Apr 05, 2026 at 02:57:14PM +0530, Vasu wrote:

> After checking the mainline kernel source, I found that
> INT3472_GPIO_TYPE_HANDSHAKE (0x12) is already defined and fully
> handled in mainline. So no v2 patch is needed for mainline.
> 
> The fix just needs to be backported to the Ubuntu OEM kernels
> (6.11-oem, 6.17-oem) where affected users are running Ubuntu 24.04.
> 
> Should I send a backport request to the Ubuntu kernel team, or is
> there another process you would recommend?

It's documented:
Documentation/process/stable-kernel-rules.rst

-- 
With Best Regards,
Andy Shevchenko



