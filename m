Return-Path: <linux-gpio+bounces-35208-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iPl/HN7i4WkKzgAAu9opvQ
	(envelope-from <linux-gpio+bounces-35208-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Apr 2026 09:35:58 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8DE417FB4
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Apr 2026 09:35:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 80ED9302B738
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Apr 2026 07:33:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C624374E43;
	Fri, 17 Apr 2026 07:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jsX83t1m"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6EB931ED68;
	Fri, 17 Apr 2026 07:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776411206; cv=none; b=WirrHlt2C8eS37T13rmdYk0AN/3yNNlKTUVqJgWUuYPePGSNRvbyEuDylfPJkZFWw1IYa2q6DbNGINe2dGnKa9T8BsC/M0mIF83HmgXX6uEkSVtuAX4X6zP9YgMQd1i82YY7iPWtg28MuYA+T31rJCQNpXmrabmLgzRRQazDpkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776411206; c=relaxed/simple;
	bh=0y/r0BPgfQrMIEgn+iiajBjp+LB9k0B/72E03JTlTDY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PxPK2IwzeddU3qE6pz3b5kErS4GMy6s1v6B02gsovgBEwlvYYNz8h+bFcR44GWfO4/nPvqDGS4hJS05anJpX9i4W9dpe0wq9fOwCdKdqYZVxz/6OHXyxvPdKKvrJeabsIij/OMjHwAPJMqIStcnnMj3Dmhjih5oBHlnEQSl3PFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jsX83t1m; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776411206; x=1807947206;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0y/r0BPgfQrMIEgn+iiajBjp+LB9k0B/72E03JTlTDY=;
  b=jsX83t1mXdM+PicEAKP2KxRZeLEeYVSgNYwo9fWRtobg7njAiAQ2wzk5
   dCvkkDnGBnbQ7vqEzWPf+hJUoh2nKYpcE0cHXwF3T+04N3vplSvzfjbiV
   FO0DCdTGr1VZcYNTKKQr75YZuOyjkh5Orq8ob0/sI4BMBDyqAh0VZROaX
   sbtcSFk3t7jDR+qHQDfqyDcGH3MsjhQnf2SNRFa/GjqJKwIcnm1L5iNt6
   58zr35FxUUbjxK2NavmdzrxuIYREPi0EtncsBMZq9jJT3+NbE00HRJQMm
   eO+T428kYTBW3Eg7eH2rytt8ju82yxvnzLNQORTMwHV78nILJfSm/Kjag
   g==;
X-CSE-ConnectionGUID: atu3X5c+SdGhOcltYmEpqw==
X-CSE-MsgGUID: xCzVQQkPTXuLO2ZfG6Updw==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="77332041"
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; 
   d="scan'208";a="77332041"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 00:33:26 -0700
X-CSE-ConnectionGUID: GKlm/5d3SL+NJtdbR5rOAw==
X-CSE-MsgGUID: KbXWwPcaQQKeZaZiDooZGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; 
   d="scan'208";a="230109306"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.78])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 00:33:23 -0700
Date: Fri, 17 Apr 2026 10:33:20 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Yury Norov <ynorov@nvidia.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] gpio: drop bitmap_complement() where feasible
Message-ID: <aeHiQJa93I6RgkUg@ashevche-desk.local>
References: <20260417033439.318930-1-ynorov@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260417033439.318930-1-ynorov@nvidia.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	URIBL_MULTI_FAIL(0.00)[intel.com:server fail,ashevche-desk.local:server fail,sin.lore.kernel.org:server fail];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TAGGED_FROM(0.00)[bounces-35208-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 5D8DE417FB4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 16, 2026 at 11:34:38PM -0400, Yury Norov wrote:
> The gpio drivers reproduce the following pattern:
> 
> 	bitmap_complement(tmp, data1, nbits);
> 	bitmap_and(dst, data2, tmp, nbits);
> 
> This can be done in a single pass:
> 
> 	bitmap_andnot(dst, data2, data1t, nbits);

Split on per-driver basis.
With this being done,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



