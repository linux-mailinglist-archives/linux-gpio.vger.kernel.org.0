Return-Path: <linux-gpio+bounces-30902-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UOoeLm08cmnpfAAAu9opvQ
	(envelope-from <linux-gpio+bounces-30902-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 16:04:13 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E01684F6
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 16:04:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9B1593000517
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 15:04:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 228EB2FCC04;
	Thu, 22 Jan 2026 15:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l3PzFTfa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C1330CD81;
	Thu, 22 Jan 2026 15:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769094243; cv=none; b=bz+cqcbDfnrnEPGEwvj8fs37kc1Uv9WkHPCQ2jHqW4KedGoolUZ+4kQ4HCSSUEtdnypny5uCdUFNMYResEPxSr/wVTdPwvBePv8zfQ1zO+7/fUmmihDR9A4K3AN79ITIZCDVn/xI9iz0n7JTRKbgdF7c0owIVyRHtDwVIHNcdP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769094243; c=relaxed/simple;
	bh=28p2vVGccZIm3pnrzlf3VCf9R7Ryv+4T3kD1Z6HKlzI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OZTFLg2kPG8JEC/k7V2XegsHFqa5FBbKlUN8CvyfpQaOHGj929ijmxZEUYmMHlI3vfJyfJQLX6TmE9lcp8k9mwg86GT+X3qWSM4jtsJylX+y9TgU8tnygxiQ0CchzByHLKhT9AFkLyqFFsdMitsK1+ceSvyHIyxrObMPHE6qjQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l3PzFTfa; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769094241; x=1800630241;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=28p2vVGccZIm3pnrzlf3VCf9R7Ryv+4T3kD1Z6HKlzI=;
  b=l3PzFTfa9KGGWsayUkBk+8Gp9DSNiAGWSrbCOwyEQUXvfBfVOyS8BkBx
   EpOENNRzwl4LScOgREGRfCoBHZXqPCauGttOIgRFN8dig8sH1maE9mc6L
   LCdnaLyiIFlKAOU4cDCBs3IHyPbNteDHoh9eB9PtSYxlF8IvFV7XMsdLd
   09RSM5Krszoy2kgjNXQH/ny59TlENMk2lxnlZ01C+B4V09QZbCU8dCKdg
   I9lopqq18zfEhccB457OM4n67QBBuxPNEH994Lq6z7ojQpUAtQNJHt0yL
   boBA7ED/ulOjKfUUmCS9V0pRz/+rk/y5VoulEjbMDfb9jSK7gylJRL/wP
   Q==;
X-CSE-ConnectionGUID: cNpMi1XeT5alyc0n7Erg/A==
X-CSE-MsgGUID: mfkARf0uQhOSJ1I+ImLxsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="70237090"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="70237090"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 07:04:00 -0800
X-CSE-ConnectionGUID: vtsLTx2NQsmzBOtSMuLquw==
X-CSE-MsgGUID: nVWxHgAmQvS0eXsrQtQj7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="206659868"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.225])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 07:03:57 -0800
Date: Thu, 22 Jan 2026 17:03:54 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 1/4] ASoC: codec: Remove ak4641
Message-ID: <aXI8WuxLOJfiUSGe@smile.fi.intel.com>
References: <20260122-sound-cleanup-v1-0-0a91901609b8@nxp.com>
 <20260122-sound-cleanup-v1-1-0a91901609b8@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260122-sound-cleanup-v1-1-0a91901609b8@nxp.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,gmail.com,kernel.org,zonque.org,free.fr,vger.kernel.org,lists.infradead.org,nxp.com];
	TAGGED_FROM(0.00)[bounces-30902-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smile.fi.intel.com:mid,intel.com:email,intel.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 36E01684F6
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 08:44:57PM +0800, Peng Fan (OSS) wrote:

> Since commit d6df7df7ae5a0 ("ARM: pxa: remove unused board files"), there
> has been no in-tree user of the AK4641 codec driver. The last user
> (HP iPAQ hx4700) was a non-DT PXA board file that instantiated the device
> via I2C board data; that code was removed as part of the PXA board-file
> purge.
> 
> The AK4641 driver was introduced ~2011 and still probes only via the I2C
> device-ID table ('.id_table'), without an 'of_match_table', so there are
> no upstream Devicetree users to retain. With no in-tree users left, remove
> the driver.

Yep, and if needed they may resurrect it, clean up and resubmit using proper
(modern) APIs.

Acked-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko



