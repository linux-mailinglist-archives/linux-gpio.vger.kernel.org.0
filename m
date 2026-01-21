Return-Path: <linux-gpio+bounces-30868-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mA2FNKbkcGk+awAAu9opvQ
	(envelope-from <linux-gpio+bounces-30868-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 15:37:26 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6630C5887E
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 15:37:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4E14A7CE3DA
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 14:12:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B2063DA7E5;
	Wed, 21 Jan 2026 14:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SXaS/ymS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CEB83AA1B8;
	Wed, 21 Jan 2026 14:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769004295; cv=none; b=YUnrUuD8eqSIddzFKnGI8t6RXrSrM4pntBbaxVPgo5U0hGC8iN9fg5NmIGvjxJWBYnmbWD3jNFHQ7iTc73cOROwmuZ0Kk7AjhQFt1KZ01UArYXJsP0V4gUjO24yI/cCWYY4VhkvnXj3KVck8GUwnP3PKmhZ1m6UlFO0GVtxWxRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769004295; c=relaxed/simple;
	bh=0D8wOvMSVmiUTG+Bjko3y2R8OC1TwqlDlfRVjyQgpL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l6zgnIOk2j0ESf9tYR6HrFU0isAmclAjtqUnIuVwKOt4ibVUu160lFcYcUAzveLBcJGr8Q9oGkFABnkG4xuh3tjGfWPpgx90c8AQeY0PhcnX8PRcwkAJ6kiX47X3C3qYsEpUswHmStluy04l2Gn7cMkPutH3pDghAa7XodENJag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SXaS/ymS; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769004292; x=1800540292;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0D8wOvMSVmiUTG+Bjko3y2R8OC1TwqlDlfRVjyQgpL0=;
  b=SXaS/ymSHAsG1HDNzZot24Fqh6CB5xr0OhZz6dKVGJe0qV0hQ/zn/Tb6
   o62cKRJXj8qkGAwijRFVaG8xxpeQrhH9AzsBiPGCT2MN18iUFDh5ku52S
   nZKZKSjg2C7i9ru5E+8XIVo331uqgpNzoFMy1A2jCwWJT1rlBkaiV5E9J
   yH12MjdLwFoIOovCABGEcg/u/gR9sCFO9IGu2jDfgR3Kw/Gt/ibnqqNW8
   UuPGi2FhGuoe2tLwYQBQ2Nb94s5mo7XNJyE+xwdhdaGD98phmdAhg1kJd
   J/jJLxStNpsUDYIrQ3LY279BgAjkzKPy7+K4oyPiOwEwOsAndrY+6sRHL
   A==;
X-CSE-ConnectionGUID: mJAnOrZmTjCl1AyR6iSKUA==
X-CSE-MsgGUID: ShT61bpjSqO6ZD+F4h7WXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="74082570"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="74082570"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 06:04:51 -0800
X-CSE-ConnectionGUID: dN0JmBO1QNur58MRDoKl/w==
X-CSE-MsgGUID: wDaR26q6SUq+lPahsv/kZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="206514650"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa007.jf.intel.com with ESMTP; 21 Jan 2026 06:04:51 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id B29E799; Wed, 21 Jan 2026 15:04:49 +0100 (CET)
Date: Wed, 21 Jan 2026 15:04:49 +0100
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Koichiro Den <koichiro.den@canonical.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] gpio: aggregator: fix "_sysfs" prefix check in
 gpio_aggregator_make_group()
Message-ID: <aXDdARDpyzF_jC4l@black.igk.intel.com>
References: <cover.1744452787.git.dan.carpenter@linaro.org>
 <30210ed77b40b4b6629de659cb56b9ec7832c447.1744452787.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <30210ed77b40b4b6629de659cb56b9ec7832c447.1744452787.git.dan.carpenter@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[intel.com,none];
	DKIM_TRACE(0.00)[intel.com:+];
	TAGGED_FROM(0.00)[bounces-30868-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 6630C5887E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Apr 12, 2025 at 01:15:00PM +0300, Dan Carpenter wrote:
> This code is intended to reject strings that start with "_sysfs" but the
> strcmp() limit is wrong so checks the whole string instead of the prefix.

...

>  	if (strncmp(name, AGGREGATOR_LEGACY_PREFIX,
> -		    sizeof(AGGREGATOR_LEGACY_PREFIX)) == 0)
> +		    sizeof(AGGREGATOR_LEGACY_PREFIX) - 1) == 0)
>  		return ERR_PTR(-EINVAL);

Wouldn't be better to use strstarts() / str_has_prefix()?

-- 
With Best Regards,
Andy Shevchenko



