Return-Path: <linux-gpio+bounces-30900-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GKdOgs9cmnpfAAAu9opvQ
	(envelope-from <linux-gpio+bounces-30900-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 16:06:51 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D51685DD
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 16:06:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A70EB3034039
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 15:02:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80E1333E36F;
	Thu, 22 Jan 2026 15:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U/kcM8Je"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994283314C8;
	Thu, 22 Jan 2026 15:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769094043; cv=none; b=tm/+PIyriLykqieQzhjQb/9XtuaJ8ubanJGNiasulOFpfXZkV0xO+AK9d9bKPAKiOAYZB2wnrF34B5MjoWP71M7eKCyPSmpDJxYC1J/y+QSn62CigX/FZudfv95qpeirSa7PyVOYeEFo3KWGgMgCl+TzaeIyDIR2f+w9WKz83tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769094043; c=relaxed/simple;
	bh=X7zWnrhnELL1bc6xcc8kRQKtXIMFazvS4dYQHiq/c+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NqfX/QgkhVVRyL1rIs/hYrEpP4SWXEtQ3kyJfjxy32Cc7FvGKfwknYkqQdhyq5C+Epj+UBYSPli8+qKmG0uHhTBO0ayIADf6nFpE3TnHLu06G6GvxxGeFbNlYAkqwQawtPkwxQBM6XH1vPOiuE85+Xdkno/s09gOFY8kOfrir3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U/kcM8Je; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769094042; x=1800630042;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=X7zWnrhnELL1bc6xcc8kRQKtXIMFazvS4dYQHiq/c+o=;
  b=U/kcM8JeKLk7Ps/SXfzQVet2R7y6EZKu0Ckuox229H/p01dffr6ALk/B
   +i358dN5IxyjPjIO7bBEkrDLNcgpVVdjE+swox+/Y/R2aENoVeXjhXCV4
   /NFz3CEYkKaYZnUhxE9DhjKL4LNOpMmMheaALfPEO1f0cvmrPEqXEgXAB
   KAmOZfNYvY99bT3ZsLTlSYIZT0uWJiPXEGLJyG3MGzkuG8EgxwKF/hLiW
   sD3duH35fgia6yUUzty18jVEZoC7+nKkL09qskqUj36s8w0l2feYEvS69
   7alrADU9P2jeoSgYdzluQ78fCGSbj8FwZGcFzp8j0FUWlR86Ar4d9xc7D
   Q==;
X-CSE-ConnectionGUID: WAhh8XAMTDOSRrrs6dGSHQ==
X-CSE-MsgGUID: gKYHsj9OQYmmoGhNNWNAiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="87752160"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="87752160"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 07:00:41 -0800
X-CSE-ConnectionGUID: sI3M4+J+TtmldkwInEu/ag==
X-CSE-MsgGUID: gQORa62nRyGdLkR669laUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="206003058"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.225])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 07:00:37 -0800
Date: Thu, 22 Jan 2026 17:00:35 +0200
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
Subject: Re: [PATCH 2/4] ASoC: codec: Remove pxa2xx-ac97.c
Message-ID: <aXI7k4HHcEAjWiMF@smile.fi.intel.com>
References: <20260122-sound-cleanup-v1-0-0a91901609b8@nxp.com>
 <20260122-sound-cleanup-v1-2-0a91901609b8@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260122-sound-cleanup-v1-2-0a91901609b8@nxp.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,gmail.com,kernel.org,zonque.org,free.fr,vger.kernel.org,lists.infradead.org,nxp.com];
	TAGGED_FROM(0.00)[bounces-30900-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smile.fi.intel.com:mid,intel.com:email,intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 46D51685DD
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 08:44:58PM +0800, Peng Fan (OSS) wrote:

> With commit ce79f3a1ad5f ("ARM: pxa: prune unused device support") and
> commit 2548e6c76ebf ("ARM: pxa: pxa2xx-ac97-lib: use IRQ resource"), there
> is no 'pxa2xx-ac97' platform device created by machine level code, so this
> driver could be removed.

So cool! Full support from me!
Acked-by: Andy Shevchenko <andriy.shevchenko@intel.com>

Would we able to clean up SPI PXA2xx headers after that? (We have SSI and SSP split)

-- 
With Best Regards,
Andy Shevchenko



