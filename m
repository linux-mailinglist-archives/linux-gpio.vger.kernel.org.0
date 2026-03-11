Return-Path: <linux-gpio+bounces-33193-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJOHJe/QsWnQFQAAu9opvQ
	(envelope-from <linux-gpio+bounces-33193-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 21:30:39 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D31269F96
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 21:30:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CAA1D3013D6D
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 20:30:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D42F22C0274;
	Wed, 11 Mar 2026 20:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bYJTg90s"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DC384A35;
	Wed, 11 Mar 2026 20:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773261036; cv=none; b=HQfTk7AkQVhwRx19DxT8gcORethAMRAqiWYr5N7HZzpp7Hm2EkjecmGoFHp58JyNNEdUWeSvTfsv1lSvNitv7rhkcDUVnQqpauxxNqVvYUzzc5A7z7UHcAVx3/9WkRcPVRkOyQhtzfQvI3I/h7H4SIW6bTFVPYnYm4fjvphVglM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773261036; c=relaxed/simple;
	bh=h35kTcm6ycgaWl+X2P9pwb4/uBI4QjdQF0G56kGBpks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tz+ZTeuAQq697Uv7dqplvgNOZRtGXOuqG21fHOYdj1NXiaLygNKDFbBSgKSDo4Y0nCOz/KJxEwqA1CJloh4lNga5/I1UMmmFHjRkVn9T91A9vwN7+DAkH0lr2qR1D1dkIsDskgMrnICLIdLQ1TNQZ4eiGjlKujFiHtA4hVO1oac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bYJTg90s; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773261035; x=1804797035;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=h35kTcm6ycgaWl+X2P9pwb4/uBI4QjdQF0G56kGBpks=;
  b=bYJTg90saCR3/K8a6mcMPYGWS1Nto5kaGF5Jehy0btw4z+eymZfqf3iB
   T36XJnXBmy5zbCFt0R5eAy1Nj+1CF8uKbZr+GLBp7MYWZucZQoO3Y3o/k
   4oO1lLwXE2Mnpkxt171IEaiAELa6MzXAMlNgQFg/B2+HMCZWm+ZIA1xN+
   faMCTCtw53VUJel4Kkj/bANGbPQvi49zZT2HYgeJLRtp3wYzq4N3W5IbB
   K0Z5TfSvT1vg8TT5AqOax+TQDDTsi7rdCsDhHF8JTyhjOmnt80/2JdeWn
   OjmvAE2Mn7bpULP0tMTZRJKxh6A9m+LgulsjzFFRf9aQMTnLKQid/T6Ut
   A==;
X-CSE-ConnectionGUID: mi/XAD94QCa7Xz5K4GpejA==
X-CSE-MsgGUID: sapA2agdQSKw9N6E8OHCmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="85431228"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="85431228"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 13:30:34 -0700
X-CSE-ConnectionGUID: +uWo+v5UQNy0vlGChZk+NQ==
X-CSE-MsgGUID: QNctYwJgQp+WKyhQ8FtBYg==
X-ExtLoop1: 1
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.178])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 13:30:31 -0700
Date: Wed, 11 Mar 2026 22:30:29 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Linus Walleij <linusw@kernel.org>,
	AKASHI Takahiro <akashi.tkhro@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	arm-scmi@vger.kernel.org
Subject: Re: [PATCH v3 1/7] pinctrl: introduce pinctrl_gpio_get_config()
Message-ID: <abHQ5Ry3ASErxKvO@ashevche-desk.local>
References: <cover.1773150895.git.dan.carpenter@linaro.org>
 <350d922ad791ac72756caa91e1551e16d7f511eb.1773150895.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <350d922ad791ac72756caa91e1551e16d7f511eb.1773150895.git.dan.carpenter@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,oss.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-33193-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,ashevche-desk.local:mid]
X-Rspamd-Queue-Id: 17D31269F96
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 10:38:07PM +0300, Dan Carpenter wrote:

> This is a counterpart of pinctrl_gpio_set_config(), which will be used
> to implement the ->get() interface in a GPIO driver for SCMI.

...

> +/**
> + * pinctrl_gpio_get_config() - Get the config for a given GPIO pin
> + * @gc: GPIO chip structure from the GPIO subsystem
> + * @offset: hardware offset of the GPIO relative to the controller
> + * @config: the configuration to query.  On success it holds the result

kernel-doc is not happy: return section is missing.
Always run it with -Wall to see that.

> + */

...

I'm also wondering if this needs to be used in / already part of UP board pin
control and GPIO driver. There they used a proxy based on gpio-aggregator code.
With this it might be (I haven't checked at all) that the code can be simplified.

-- 
With Best Regards,
Andy Shevchenko



