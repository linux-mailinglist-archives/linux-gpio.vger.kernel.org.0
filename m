Return-Path: <linux-gpio+bounces-33593-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qCtuBCURuWmFowEAu9opvQ
	(envelope-from <linux-gpio+bounces-33593-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 09:30:29 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6548A2A5ADF
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 09:30:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EF6B4303F7ED
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 08:28:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D40839C657;
	Tue, 17 Mar 2026 08:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="khO9T7cm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7F339A06F;
	Tue, 17 Mar 2026 08:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773736133; cv=none; b=Acsv8UwwkZ6cAye3xd8DYew7+TjDIKIdvUNsjFHIUxvrF5YxUCMK3RD/VEmuG3w7oD0a0vrnPJl/geCzdPaa6SN9MBsF/26bNpZdvnscjoEe6lh7xu4RQaMXeQBXpz0kMxM/7bV4HtAMb5F66+/9rGgp0a0IIPqi+mYh1pdaBjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773736133; c=relaxed/simple;
	bh=kmzBqM8gQ+tsBKWGaNc8uJvQEKMgTzC+vS/+w5s2LT4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a6fAifQnWwd8nnckYuaDYrymzeGMwD+NLzbJbOGKCz5/cP0B1sKbLsYA3RLAOQcFhgJKFV++lpMAkEU+Uc2LB2e/pQAUsSXoJUQuTZ7tkvf4mzdh4Xtz4jXbtmCPho2VsqHA70GZ9Qqu79IXR+zsJ2zP1tFQMnDwJpc4oq348JU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=khO9T7cm; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773736129; x=1805272129;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=kmzBqM8gQ+tsBKWGaNc8uJvQEKMgTzC+vS/+w5s2LT4=;
  b=khO9T7cmMa6fuKMqPBWMe5VLhpOJPBCOofGNp4LpRdAGbHCk306boa/B
   LHIdaf1IHwumqv7KFq/3KXuw4tb6mbfgQ94CSPtPhblSaEyJU/tqUY/RN
   o/uJih+Jf+qMwI/FNU3KEiXrSpduu01kWUK7Y01lNWkETgpJbXFSeQtq3
   g2wjkyGew6AaCNDYW20bwz0XFRtKt3jEhINt46KybrSEm7Yu4cl/jlG67
   9OOcA7PJlYGxMsGlLLvcdPQxxzlalQJ8p+F4OyMDpRunblLpLC6o/13xu
   VLcPjjMpJNC/YGWsrFkTMUo3oT72dVqhfGYzA+NNi7UQv6YEUDTyMTPGl
   Q==;
X-CSE-ConnectionGUID: rnHWOwmHR1S879F/VEBGpg==
X-CSE-MsgGUID: WT0beOrvSxyejY5rpwH1bA==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="78366776"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="78366776"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 01:28:48 -0700
X-CSE-ConnectionGUID: S0hT0mVyR6iQuvL1yvCyyQ==
X-CSE-MsgGUID: c54Q6FNARbCZlvPUS/+Vng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="221224649"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.97])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 01:28:47 -0700
Date: Tue, 17 Mar 2026 10:28:44 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] pinctrl: pinconf-generic: Use only fwnode API in
 parse_dt_cfg()
Message-ID: <abkQvKtZW24LLMiI@ashevche-desk.local>
References: <20260305095014.3221492-1-andriy.shevchenko@linux.intel.com>
 <CAD++jL=N1vxiNEDMO5quFvYOi=u4FZdgUf7fLrhDDEB0mNnqbg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jL=N1vxiNEDMO5quFvYOi=u4FZdgUf7fLrhDDEB0mNnqbg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33593-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_THREE(0.00)[3];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ashevche-desk.local:mid]
X-Rspamd-Queue-Id: 6548A2A5ADF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 10, 2026 at 10:19:40AM +0100, Linus Walleij wrote:
> On Thu, Mar 5, 2026 at 10:50 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> 
> > The parse_dt_cfg() uses OF and fwnode APIs. Fix this inconsistency by
> > fully switching it to use fwnode API and rename the function accordingly.
> >
> > While at it, add missing linux/property.h inclusion.
> >
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Patch applied, because obviously the kernel looks better after
> this patch than before it.
> 
> I had to rebase the last hunk of changes manually.
> 
> I think there is something more to do, but you probably
> already have a plan:
> 
> > -       ret = parse_dt_cfg(np, dt_params, ARRAY_SIZE(dt_params), cfg, &ncfg);
> > +       ret = parse_fw_cfg(fwnode, dt_params, ARRAY_SIZE(dt_params), cfg, &ncfg);
> 
> and that uses:
> 
> #ifdef CONFIG_OF
> static const struct pinconf_generic_params dt_params[] = {
>     { "bias-bus-hold", PIN_CONFIG_BIAS_BUS_HOLD, 0 },
>     { "bias-disable", PIN_CONFIG_BIAS_DISABLE, 0 },

Yes, this all is still OF-centric code. The patch was solely for bringing a bit
of consistency into one (parse_fw_cfg()) function. For now not much plans are here
because ACPI case most likely will require something totally (with the reuse of
the opaque pointers to the mappings, though) different.

> Are you already working on a patch? ;)

Actually I found one improvement I need to submit.

And looking now at pinconf_generic_parse_dt_pinmux() it also can be translated
to fwnode inside.

-- 
With Best Regards,
Andy Shevchenko



