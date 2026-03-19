Return-Path: <linux-gpio+bounces-33792-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJpaJsGSu2mYlgIAu9opvQ
	(envelope-from <linux-gpio+bounces-33792-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 07:08:01 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0F02C6881
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 07:08:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CC3E43159A81
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 06:02:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 486BF1E7C23;
	Thu, 19 Mar 2026 06:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hc2tfJ87"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAFAB22083;
	Thu, 19 Mar 2026 06:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773900146; cv=none; b=kGt6c2qRf4wolqrW/wqVl8fsQZF0AGvuhDu4WXb8TMo2AKQn4kWNKSYzRKFbq624wnxRXBGWn+cwtqXW7bUbKwU8HHwkkpVYAp0wIDHvqW1XMsYjlmnr2URUJP91tTW/AV9cY+YRx+ghB3NB5r28RCn/+4IBcewxjCQnJI7S7NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773900146; c=relaxed/simple;
	bh=pjHZGYXYiPWB3HEBQne4NQMLRnz83keaN2ens3p7EOY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z3zo45nXY7bE3Kc23QioQqh5gOxowov5UmyBKtsPAeSowYsErky6Bg8u9RsbHJrJAb/I/wff/+Twwd5rRb3/TPGB5mQELCSgPUZsnETfLWvgJE8fNzG8jf+ZrujW8mOEXS2e+FlSns+juBGIqc5en2onpoWWXTELFj4gLK2FY0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hc2tfJ87; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773900145; x=1805436145;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pjHZGYXYiPWB3HEBQne4NQMLRnz83keaN2ens3p7EOY=;
  b=Hc2tfJ87yHmVP2qYu1U9Jw/w4GRP7TPpmiR/ybUa4wfRWCCHuJAlqh1I
   qvJ1Id+x+eP+SShkESiZUgl31um0sc1aFWuhsY2H0wIBdicaFl8CFCraL
   1eKXYSb4d3RUAIlmHCLgeCDFP2vPoHFZ1NLhamMzz7NMqMeGAdQQqdZBy
   iEKLo/lMARKdhecw5hXlCilKSs0Vpxt3bNIm9pI4z67kKiEbCuC5nyWnS
   WgzUpg7J01v/0FoHrqecRt+oBFi2nlW4fshWWcX6Cv6S4jEcX8Wlx5jWo
   3XMWKbCUiUNCHJGrZDYeFymX40bwy73f4AntKGMDp0nEN9nowjvQfZsBd
   A==;
X-CSE-ConnectionGUID: vqGnEB24QfyQDpAZSqyzIw==
X-CSE-MsgGUID: pOxOtgQ9Q7i78XQ3cYwtrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="85594587"
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="85594587"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 23:02:24 -0700
X-CSE-ConnectionGUID: mhJXvmlHSkyKI46nwmpqEw==
X-CSE-MsgGUID: 4CxCsPp9SVqBeK8I6ODpCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="222901390"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa008.jf.intel.com with ESMTP; 18 Mar 2026 23:02:23 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id CC8BC95; Thu, 19 Mar 2026 07:02:21 +0100 (CET)
Date: Thu, 19 Mar 2026 07:02:21 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v1 5/5] pinctrl: intel: define iterator variables inside
 for-loop
Message-ID: <20260319060221.GP2275908@black.igk.intel.com>
References: <20260318151256.2590375-1-andriy.shevchenko@linux.intel.com>
 <20260318151256.2590375-6-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260318151256.2590375-6-andriy.shevchenko@linux.intel.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33792-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-0.992];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[black.igk.intel.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,intel.com:email]
X-Rspamd-Queue-Id: 2D0F02C6881
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 04:10:19PM +0100, Andy Shevchenko wrote:
> Reduce the scope of the iterator variables by defining them inside
> the respective for-loops. This makes code more robust against reuse
> of the same variable in the future, which might lead to some mistakes.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/pinctrl/intel/pinctrl-intel.c | 44 ++++++++++++---------------
>  1 file changed, 19 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
> index 7311b787dfc6..c506f9f343c3 100644
> --- a/drivers/pinctrl/intel/pinctrl-intel.c
> +++ b/drivers/pinctrl/intel/pinctrl-intel.c
> @@ -431,7 +431,6 @@ static int intel_pinmux_set_mux(struct pinctrl_dev *pctldev,
>  {
>  	struct intel_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
>  	const struct intel_pingroup *grp = &pctrl->soc->groups[group];
> -	int i;

If there are multiple loops, I prefer to declare the variable outside of
them.

If it is just a single loop then for (int i = 0, ..) is fine.

>  
>  	guard(raw_spinlock_irqsave)(&pctrl->lock);
>  
> @@ -439,13 +438,13 @@ static int intel_pinmux_set_mux(struct pinctrl_dev *pctldev,
>  	 * All pins in the groups needs to be accessible and writable
>  	 * before we can enable the mux for this group.
>  	 */
> -	for (i = 0; i < grp->grp.npins; i++) {
> +	for (unsigned int i = 0; i < grp->grp.npins; i++) {

also why you use "unsigned int". int i is fine here.

>  		if (!intel_pad_usable(pctrl, grp->grp.pins[i]))
>  			return -EBUSY;
>  	}

