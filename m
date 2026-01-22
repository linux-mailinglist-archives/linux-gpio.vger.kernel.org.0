Return-Path: <linux-gpio+bounces-30899-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aMbpFMFFcmlCgQAAu9opvQ
	(envelope-from <linux-gpio+bounces-30899-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 16:44:01 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BC01C691C2
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 16:44:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9BC7654C735
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 15:01:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A919435F8B5;
	Thu, 22 Jan 2026 14:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dfrHH9R7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DAA0352F85;
	Thu, 22 Jan 2026 14:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769093944; cv=none; b=diej0wtzfDHN7ubn93KlP/mH+0YdiLEgQ98o/q0H92chOGvwNF1Ilo05MNvoR092Ym3O1wZMtjHuOgozD6vHMrmrklnBbS5qlG7Bhy4hfmlB8kIa7ofK9IK72Y81tNf4SiD5JU468SGYN4JAWj+F9oyiCIbTlVQSrHtUmU1egBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769093944; c=relaxed/simple;
	bh=oyBYVx2rxUgDxsxWHuGCigCnNM9b0fNxSCX++nnttu8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kU8JlAfLlT3p61jRu0s5hzXXWO25x3giZsmow7/p8F8jnUK53pP76eNdfvqWirdQtTXnCTLtKUIJq0PMteWGvvcPIRlsR6ZCxLkukASnor1CukW85ZjgMxslDwFOAhmNPBCjaorVSCo1zQQKbet0HnrQm9WiILcjgYfD+bIH6hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dfrHH9R7; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769093942; x=1800629942;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oyBYVx2rxUgDxsxWHuGCigCnNM9b0fNxSCX++nnttu8=;
  b=dfrHH9R7w3ThacT+2zGLEdSZI6u9jVoI4FKLr68iqNZYgGfurTJdDRKJ
   ZIpwyEQ+pOhwGaylfyghXhfCZ0KmpRP3IVOAXUsozsQdKM8jpmKbjTeio
   S6SQxNGx7vkzjgqsctYoT7lTWVRvQvMHBBi5ft8UGDUc+MEr+1KLNbsc0
   ElvVFbesIFOThwHdI+5IYjP0OOhPxeNwst9YDC8svKhOOLb90Piqc+ani
   H5RdH5YltDloirS/IUFLkR6ApUxJARBAm517fMP/yoSZMs2kKollFSENn
   ZrldBudvEs1spHB0XfbQLHjvlU+tUBK4kRyqRXOw+yB5DYNtvGJh5Tn/l
   Q==;
X-CSE-ConnectionGUID: cce5v50sQ3GaFdxlvXHeIA==
X-CSE-MsgGUID: ONISM26lTU+3XQ8oZ8mzkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="70502576"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="70502576"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 06:59:00 -0800
X-CSE-ConnectionGUID: onz+BkllTjeppd7SmTHZzw==
X-CSE-MsgGUID: ilFgMdaOQo6AaamBHD+l2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="229719256"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.225])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 06:58:56 -0800
Date: Thu, 22 Jan 2026 16:58:54 +0200
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
Subject: Re: [PATCH 3/4] ASoC: pxa2xx-ac97: Remove platform_data
Message-ID: <aXI7LlXOiLSD2K1a@smile.fi.intel.com>
References: <20260122-sound-cleanup-v1-0-0a91901609b8@nxp.com>
 <20260122-sound-cleanup-v1-3-0a91901609b8@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260122-sound-cleanup-v1-3-0a91901609b8@nxp.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,gmail.com,kernel.org,zonque.org,free.fr,vger.kernel.org,lists.infradead.org,nxp.com];
	DMARC_POLICY_ALLOW(0.00)[intel.com,none];
	TAGGED_FROM(0.00)[bounces-30899-lists,linux-gpio=lfdr.de];
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
	R_SPF_SOFTFAIL(0.00)[~all:c];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns,intel.com:dkim]
X-Rspamd-Queue-Id: BC01C691C2
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 08:44:59PM +0800, Peng Fan (OSS) wrote:

> Since commit d6df7df7ae5a0 ("ARM: pxa: remove unused board files"), there
> has been no in-tree user to create the device with platform data. So remove
> them.

I like the changes for PXA27x, but one important comment below.

...

> +	if (dev->dev.of_node) {
> +		reset_gpio = of_get_named_gpio(dev->dev.of_node, "reset-gpios", 0);
> +		if (reset_gpio == -ENOENT)
> +			reset_gpio = -1;
> +		else if (reset_gpio < 0)
> +			return reset_gpio;

No, please convert to devm_gpiod_get*() or even better to use reset-gpio driver.
TL;DR: no (reinstantiated) of_get_named_gpio() or alike must be in the kernel.

>  	} else {
>  		if (cpu_is_pxa27x())
>  			reset_gpio = 113;

-- 
With Best Regards,
Andy Shevchenko



