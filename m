Return-Path: <linux-gpio+bounces-31842-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mHdYAVrBlmmzlwIAu9opvQ
	(envelope-from <linux-gpio+bounces-31842-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 08:52:58 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5898715CD3D
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 08:52:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BC3A3304EF70
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 07:52:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBE61307492;
	Thu, 19 Feb 2026 07:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R4pHv1vr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 639643093DE;
	Thu, 19 Feb 2026 07:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771487521; cv=none; b=JV7qpfihIZISfI30O8iQJv1wFHN6f7MFd+F6HIlCkMpJJoHZV47rsxe9laX77wPt7ajo/V6uqPLaocWMdLSfgUvwDnIgL2O9EHeZj/h8V1QN3kcFMJktbE4XcpSdVMBDh9I2No3Q/UXd41Allk1NDqhMIWCzQH/MKZVlhOfr2yU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771487521; c=relaxed/simple;
	bh=TufajdXiMQuR/SqoAVtUOhXrE7s2yEQP8uIjTxaCB/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F+bRxL4CNXvEGf1HJ23Ji8d+W8X4LZCKhZSYzfJqcm5mslITY0AqwnKY+TeWBP7bUgl0WY4jtdrP254wc4MkCtZNPk/Gt4AwMO4KTGGFQaglVj9Ibi/rMUxJDyj7eqKjK+uKO/Eu75hr+PcPGTI3qZbO8tlgXh6rD2oT2sMjO7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R4pHv1vr; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771487520; x=1803023520;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TufajdXiMQuR/SqoAVtUOhXrE7s2yEQP8uIjTxaCB/k=;
  b=R4pHv1vrsY8mTq3oZUpNDSz8MsX7UHHtao8TVMLV0Q0WTSr2Eq4N2afA
   E+xyRQqCclGU4+PnxyKVN95/hE8TsIYV7nZMIqTi7SIHaEh1vOqaXRPrc
   sO90/8kSLz/eXTd8ygEWB/dozqknThzaXyKZo4Mpj+HlGgBEhB8mkM+/5
   vf2+yOm07z9uAMsGof7bhv7rG8qkHfO5+sa8M4A4JlmQ4R77PhmmL1Dea
   Kyan1JpTqvTwe6rYoyhu2MbnYedTo6QA9bHfhecddWUTDqC5MruIsa72j
   pHGvVeUOncG21ZtuU6rYuAWMpocZqhEyadgMVhGXF5eYB/IXbWsBXilEf
   g==;
X-CSE-ConnectionGUID: IP8CfvwBR7igA1+A76KmIw==
X-CSE-MsgGUID: jj19aPdnQyi37Fza0oJ6mQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="98030033"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; 
   d="scan'208";a="98030033"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 23:51:59 -0800
X-CSE-ConnectionGUID: 9+Y1DJrTT6yTuSgNaTAIzQ==
X-CSE-MsgGUID: luJYbTxQT7KpVvmrNPtxFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; 
   d="scan'208";a="213681158"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.114])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 23:51:57 -0800
Date: Thu, 19 Feb 2026 09:51:54 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 3/4] iio: adc: ti-ads7950: switch to using guard()
 notation
Message-ID: <aZbBGomQi0l84An_@smile.fi.intel.com>
References: <20260219022929.3558081-1-dmitry.torokhov@gmail.com>
 <20260219022929.3558081-4-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260219022929.3558081-4-dmitry.torokhov@gmail.com>
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
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-31842-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,smile.fi.intel.com:mid]
X-Rspamd-Queue-Id: 5898715CD3D
X-Rspamd-Action: no action

On Wed, Feb 18, 2026 at 06:29:27PM -0800, Dmitry Torokhov wrote:
> guard() notation allows early returns when encountering errors, making

guard()()

// strictly speaking

> control flow more obvious. Use it.

I like the change, but...

> Also variables that now only hold error codes (or 0) are renamed to
> "error" to make their purpose clearer.

...this does not belong to the patch. If you wish to rename, better doing
it separately. This, in particular, adds undesired churn in the change making
it unclear.

-- 
With Best Regards,
Andy Shevchenko



