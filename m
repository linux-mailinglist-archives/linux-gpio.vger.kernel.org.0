Return-Path: <linux-gpio+bounces-36980-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mHLwDgBvCWpUZwQAu9opvQ
	(envelope-from <linux-gpio+bounces-36980-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 17 May 2026 09:32:16 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E0155FA89
	for <lists+linux-gpio@lfdr.de>; Sun, 17 May 2026 09:32:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 443B1300E70B
	for <lists+linux-gpio@lfdr.de>; Sun, 17 May 2026 07:31:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC7ED2EBBA9;
	Sun, 17 May 2026 07:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jrMtk4oO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51EE226CE2C;
	Sun, 17 May 2026 07:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779003116; cv=none; b=KlLxC/+KlqEFwYRVQUVqoaJZN4iBoLxYNc1TczXXh3N8eaGPbJtqHgYLT4ZD+3IfM6f4eSROfUxgCeRGlmfBY9W0BUcDbh+cRGVwCaRFzASPWchHcNz9vnXY1n58ArKWmR8RWtdygA5upSd16j1damaWN6h+mc5yW9O2uSJ5SVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779003116; c=relaxed/simple;
	bh=HP2KPH8ua330vRwUfZtFFE0bX5IlVS9j7YE0i3xAkEM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JBXAyNrQHN1xEVS2p4KppCLy0eDnA9fe3MZwyyz/U1F6+WYGlhG9AY7KwPZBlTDYwvzAyEHuEkrYi0DkA8sobrcwDnm8K2hGhhVpXpdhvBFgkVrKDLTE7y/L2L18HKECJ/adwzulffVRDPLAjWdv7NbH5UqqJbvVDhuJImLrRaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jrMtk4oO; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779003115; x=1810539115;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HP2KPH8ua330vRwUfZtFFE0bX5IlVS9j7YE0i3xAkEM=;
  b=jrMtk4oO5qXb2Fl/9yLG/SDhTmB/h3rOSLh+QrgaE0JVjILPxwVrGwHi
   uSaRbP/EfXH9aCUxPj5qQbGZDniqX6Pz2AZ/rf1YIbdF+PmxIah60669N
   UrqLs/WwACGmQcqeED0uQyDhYlfHQ97rCxUVbWQ8SY8VOOu2rAXPVjjDQ
   T93EJwi47+MIREQ/yRWIDC1qVUf43icf8Kyg2t3k/FjRBkyxhR8dg7JMO
   Qe9yUEsBJwKZr0oFGYWvE2e0a3AwvPhWYvazDKv5VmQgTu+m+jEKaC/Dc
   CsJ6TK3jv1Imo9sFjptMQZ9+oj+mHaW6PZQXp/G/12oxx/QHUbbXeuyww
   A==;
X-CSE-ConnectionGUID: 6lqpA+bKTAqdOiSUljN5yg==
X-CSE-MsgGUID: B3RYN65DR9i4E3Q0DykJoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11788"; a="80013774"
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; 
   d="scan'208";a="80013774"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2026 00:31:55 -0700
X-CSE-ConnectionGUID: MIMP3O3ARhO0CMyoMq2W2w==
X-CSE-MsgGUID: hEAuA0iCREyQFrOdRoy49A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; 
   d="scan'208";a="277220724"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.182])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2026 00:31:53 -0700
Date: Sun, 17 May 2026 10:31:50 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Stepan Ionichev <sozdayvek@gmail.com>
Cc: andy@kernel.org, mika.westerberg@linux.intel.com, linusw@kernel.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: intel: zero-initialize capability_offset[] in
 probe
Message-ID: <aglu5jy5SbW9Wjwj@ashevche-desk.local>
References: <20260515150049.33761-1-sozdayvek@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515150049.33761-1-sozdayvek@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Queue-Id: 54E0155FA89
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-36980-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,ashevche-desk.local:mid]
X-Rspamd-Action: no action

On Fri, May 15, 2026 at 08:00:49PM +0500, Stepan Ionichev wrote:
> intel_pinctrl_probe() declares a per-community capability_offset[]
> array on the stack and only writes the slots whose CAPLIST entries
> the device actually advertises:

Thanks, this is very long, but unfortunately bogus report.
So, here basically the summary is "Check if the HW is broken".
If the answer to that "yes", we have much bigger issues than
some parameter being precalculated. Besides that, have you checked
the code generation? Does compiler is stupid enough to calculate
base before any checks? It's quite clear that the first use of base
is the devm_pwm_lpss_probe(). Instead of this patch I can accept
one that splits definition and assignment and be like

	void __iomem *base;
	...
	base = community->regs + capability_offset + 4;
	chip = devm_pwm_lpss_probe(pctrl->dev, base, &info);

(without any Fixes tag).

-- 
With Best Regards,
Andy Shevchenko



