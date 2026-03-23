Return-Path: <linux-gpio+bounces-34008-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPEtKv8RwWk7QQQAu9opvQ
	(envelope-from <linux-gpio+bounces-34008-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 11:12:15 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 237602EFC7B
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 11:12:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A261A3041D4E
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 10:06:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A6B423BCE3;
	Mon, 23 Mar 2026 10:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BK8moRF6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5E5389E01;
	Mon, 23 Mar 2026 10:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774260356; cv=none; b=r7isGl5KV6Q8AYxx3xYkLajTvwS41Yr7+UYPAfPT/xYFpNoej30IXuh6qHUINj8+dbFKH9WSTlCnEPdyMJ1YkbI4hJz5WHr+Nwk/UPR1CtkJoDKu18fikD2NTCp4RlbhJ5OHC9snDf8sC4YUDnt0Tvr/7X5dZHcq8MCv0Pw8XnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774260356; c=relaxed/simple;
	bh=JJBE2H54vRz4zf4sW7rcTUZyA0w7Q6cpKGACdGRCEZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oMOtRviI7Az4Z32x5/d1j7gWdd2YniiQNqXeY1rR5to7zLI/okthloObYh42Ji2kF5KS8pbl+8xinYvDTTIXLv57Kae7KDkU8XF0Sh+nTEIdQvY06dv7b72ENq/9c9DDVprDR1s2krUpSc1jMGrsBd7BZpgKQDPue6i5F3W69+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BK8moRF6; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774260354; x=1805796354;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JJBE2H54vRz4zf4sW7rcTUZyA0w7Q6cpKGACdGRCEZE=;
  b=BK8moRF66vbpFZPsS8TbDCVAoHnV+qL7P46w77Pv+7tqZ06QFwR/3K2w
   uOEoVHaZfowtHw9n3RHPRKIpWbXTX1FD2CmekXGWltOAguppDce7KkQZl
   LDgxKi0Ys7ik3Bi1IJ0NnrDfUpaII24JVPwb+7+7GMy5jCk7+MW6XDKrW
   +gRSym7R7YIPremFv7ZKdprEgH9NiUD1DzooXK16HMW7JrPWnV9Kb6DMn
   hApBJwzelVOAVZ1whWUDNjw2M1TePy3iBOP3t7ef1XLH3VYh8Xb2WBEK1
   AMp3MXH31Hm1MS4i8n1V08yUFMd0Gai1hwO3VPsnTgmfJtRzHp6pryIBK
   w==;
X-CSE-ConnectionGUID: /UbQnRJETXG9A5j7NcFAzA==
X-CSE-MsgGUID: C/RNA7aRQDWDpuSGDy/+XQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="77864013"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="77864013"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 03:05:53 -0700
X-CSE-ConnectionGUID: eb4czH4MSYiQrLKddUYIAQ==
X-CSE-MsgGUID: cl0PiHs1Qw+V/iGcbH9/wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="217498130"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.22])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 03:05:51 -0700
Date: Mon, 23 Mar 2026 12:05:49 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Linus Walleij <linusw@kernel.org>,
	AKASHI Takahiro <akashi.tkhro@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	arm-scmi@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>,
	Michal Simek <michal.simek@amd.com>
Subject: Re: [PATCH v5 7/7] gpio: gpio-by-pinctrl: add pinctrl based generic
 GPIO driver
Message-ID: <acEQfZlh7SrQ-k8a@ashevche-desk.local>
References: <cover.1774087290.git.dan.carpenter@linaro.org>
 <4aabafcd30c1e5549dde11d6c2fe5f3f9976bce8.1774087290.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4aabafcd30c1e5549dde11d6c2fe5f3f9976bce8.1774087290.git.dan.carpenter@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,oss.qualcomm.com,linaro.org,arm.com,amd.com];
	TAGGED_FROM(0.00)[bounces-34008-lists,linux-gpio=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim,ashevche-desk.local:mid]
X-Rspamd-Queue-Id: 237602EFC7B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 21, 2026 at 01:14:06PM +0300, Dan Carpenter wrote:

> The ARM SCMI pinctrl protocol allows GPIO access.  Instead of creating
> a new SCMI GPIO driver, this driver is a generic GPIO driver that uses
> standard pinctrl interfaces.

...

> +static int pin_control_gpio_set(struct gpio_chip *chip, unsigned int offset,
> +				int val)
> +{
> +	unsigned long config;
> +
> +	config = PIN_CONF_PACKED(PIN_CONFIG_LEVEL, val);

No driver uses this macro directly.
pinconf_to_config_packed() is.

> +	return pinctrl_gpio_set_config(chip, offset, config);
> +}

-- 
With Best Regards,
Andy Shevchenko



