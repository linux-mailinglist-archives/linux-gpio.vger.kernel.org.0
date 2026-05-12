Return-Path: <linux-gpio+bounces-36692-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFo+GnhxA2q55wEAu9opvQ
	(envelope-from <linux-gpio+bounces-36692-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 20:29:12 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DA92D5279CE
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 20:29:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DA72A30F8D8C
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 18:13:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E991836D9FE;
	Tue, 12 May 2026 18:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GnpZi2Xy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F7236B043;
	Tue, 12 May 2026 18:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778609580; cv=none; b=jdAv9e7hCNx2zd+smRkx9OzbF9BaQciqXDu3EX6TGm5NjnjHTIVQKyTjUcEVDHlAeyyu8cMVXnE5bZdMSXypRMqBHw+wiCVTyyTWKg9C/L2/PrOvUFz/5a4jr5yGqc8ZZmutxz3S3rHwoNJpOkHeQz2Fo/zG8/ih6pRqiBk89xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778609580; c=relaxed/simple;
	bh=kVfoR+AdplYfIvhGONb3dXURbBAhg05PeV7RbNU8OdA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EEryK7J9V8vJG+yDJw2NlwjmTk+oGwrjK1Bm8a9lyk7bF+i7w869jvmVkqqI9bKGzNlsCMloq+9YCqeyFJwi9KY66PZxR1UQU4oJhfYeLO44LnQ4WAhTZTHWJW8gnBei489BbhzFUgQv1qPJILgVcQ5lJq20NbqwlCJ7QhID6QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GnpZi2Xy; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778609579; x=1810145579;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kVfoR+AdplYfIvhGONb3dXURbBAhg05PeV7RbNU8OdA=;
  b=GnpZi2XyR0gwxZMeLWxSuuNNEAlwHu/Q4NL81MrO7M1TWvHkhBI0eWmd
   8tJaBXQCo9X1iVuovojgvywa62gg/lWJA7nHKfzYoK48+OzVnbj9WqV1V
   CyyxsLVqLRxnbvdQLpv0Cz2y+9SI/fMsA4WzPOYN0+aHGeqDJcUZSwzPb
   W7BUTCowYpvQz6Xamo5mf9o0MhazFqI8bQVGqKl5BSzhB+ksQjBcd1DBF
   RKfTbgTGxLiJp0UqgQ7D32ZuSpQh5bKFNQLKhNO7R7JWCffiz1dj8NFNS
   dZfBSu+9Jkourdjg9FJTTrgwJi/1XHYUTCyuE/odSt81IcamNPTv311tW
   w==;
X-CSE-ConnectionGUID: SbQ+5Yl0QVCTJTea5JZ8wA==
X-CSE-MsgGUID: mhjxQZ25Q86YQTaKyPuqwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="79549988"
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="79549988"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 11:12:58 -0700
X-CSE-ConnectionGUID: y73hOpATTu2pBU/3FyrbEA==
X-CSE-MsgGUID: nDNi67M3SVG6IGS6BXBILg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="236986462"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.244])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 11:12:53 -0700
Date: Tue, 12 May 2026 21:12:50 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: linusw@kernel.org, brgl@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, afaerber@suse.com, wbg@kernel.org,
	mathieu.dubois-briand@bootlin.com, mwalle@kernel.org,
	lars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org,
	nuno.sa@analog.com, andy@kernel.org, dlechner@baylibre.com,
	tychang@realtek.com, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org, linux-iio@vger.kernel.org,
	cy.huang@realtek.com, stanley_chang@realtek.com,
	james.tai@realtek.com
Subject: Re: [PATCH v3 4/7] gpio: regmap: Add set_config callback
Message-ID: <agNtok_vgcph1TZK@ashevche-desk.local>
References: <20260512033317.1602537-1-eleanor.lin@realtek.com>
 <20260512033317.1602537-5-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512033317.1602537-5-eleanor.lin@realtek.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Queue-Id: DA92D5279CE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36692-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,ashevche-desk.local:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Tue, May 12, 2026 at 11:33:14AM +0800, Yu-Chun Lin wrote:
> Add a new set_config callback to struct gpio_regmap_config to allow drivers
> to implement hardware-specific configuration such as debounce settings,
> or other platform-specific GPIO properties.

Okay, if it's needed...
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko



