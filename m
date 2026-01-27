Return-Path: <linux-gpio+bounces-31177-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJiSG+8UeWl3vAEAu9opvQ
	(envelope-from <linux-gpio+bounces-31177-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 20:41:35 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E7AD79A10E
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 20:41:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 200BF301474F
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 19:40:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85661325706;
	Tue, 27 Jan 2026 19:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VpsgFx55"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43EE12BCF7F
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 19:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769542840; cv=none; b=TxE2DjekAIOnWDLjt3C+BRAAP6hJsvLoVpM15LadBd2HjEliK/dMQgP4SGHdjbhSiONbHAKEL4rrYKxBlgH58hkxTDz+IWnvNw8pqH/8MEp3sk7d+hJsEtTUynnRy9LQ4G/GNJQ6d/YN3IkM27tMnz0ROnePyFKTFgJRZ2vjCRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769542840; c=relaxed/simple;
	bh=hv6BFNvBBbAW+QouAbLNWR7bRP4VpuVjNFEz5rr/WXc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pzc5cGm/eaATAmllr/W+1tj+MJsXgNOXkvYyKB+tPgtJtoL9uzwUhfgDnH96mpLQoDVwYWOgBdOMQqwoGKSOGTDjy5KL8n6B2/WGWVrOJh1JYus0NuEYTTtgh640JXYX3tvUW6DkhQF0GIrK6Xcrq0n2oeRKGOxlMXM7wQNm7rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VpsgFx55; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769542838; x=1801078838;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hv6BFNvBBbAW+QouAbLNWR7bRP4VpuVjNFEz5rr/WXc=;
  b=VpsgFx55hnnqUoBMQHrEpvyfYxC6B+/CVbGbb9cNKGSPMq3R7yl5GBeT
   4QozD1XTZmzIx5XrVlPdHol4mbM/6KJPwcW5y1AlrNJAEaF629eAKH03n
   qc8wz35J7J8Z7/+6DkgP/K9T6fb7KWr2qdBeiXztstIZv/bwxH06Oizyg
   9Qmg/DO/ez7pdUnQKxbUmu9cPuulq33yrN8zO9UL/tGDESEA/M9sZ6a+R
   v8oEQRxRgFZx6SZKMWoESF4+t/tmEvN/wrdaWhXJeAs0Swo/b7J/MUGM5
   XDtiQxw2ORfsjL+CJwfMVzD6ti6rT0UARqSyNgH+mRrRS+L5MV7wOZIkF
   w==;
X-CSE-ConnectionGUID: DRLAU1yVRZOpNX0hmAKf7g==
X-CSE-MsgGUID: mvzqno7+SWG26Y8KB4lAPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="70465742"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="70465742"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 11:40:37 -0800
X-CSE-ConnectionGUID: Efi/cNiyQbOZi4TUuug/zw==
X-CSE-MsgGUID: dNMkvJaCQz+sY7dNvcQGiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="208077132"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa008.jf.intel.com with ESMTP; 27 Jan 2026 11:40:34 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 4BA9195; Tue, 27 Jan 2026 20:40:33 +0100 (CET)
Date: Tue, 27 Jan 2026 20:40:33 +0100
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Michael Tretter <m.tretter@pengutronix.de>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org,
	kernel@pengutronix.de, Stefan Kerkmann <s.kerkmann@pengutronix.de>
Subject: Re: [PATCH v2 1/2] gpiolib: introduce
 devm_fwnode_gpiod_get_optional() wrapper
Message-ID: <aXkUsRTYWiPPDDy2@black.igk.intel.com>
References: <20260126-gpio-devm_fwnode_gpiod_get_optional-v2-0-ec34f8e35077@pengutronix.de>
 <20260126-gpio-devm_fwnode_gpiod_get_optional-v2-1-ec34f8e35077@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126-gpio-devm_fwnode_gpiod_get_optional-v2-1-ec34f8e35077@pengutronix.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,pengutronix.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31177-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: E7AD79A10E
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 03:27:47PM +0100, Michael Tretter wrote:
> 
> The helper makes it easier to handle optional GPIOs and simplifies the
> error handling code.

This helper should be exported function which may use the existing internal
API, id est gpiod_not_found(). Another possibility to move the latter to
the tree wide header, but I'm not sure we can make the good choice for that.

-- 
With Best Regards,
Andy Shevchenko



