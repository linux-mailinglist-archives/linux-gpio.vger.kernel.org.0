Return-Path: <linux-gpio+bounces-32342-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eNdME8y/omk+5QQAu9opvQ
	(envelope-from <linux-gpio+bounces-32342-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Feb 2026 11:13:32 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A80351C1E96
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Feb 2026 11:13:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EAE30302C6DA
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Feb 2026 10:13:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 219DF413239;
	Sat, 28 Feb 2026 10:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pv9vWs4r"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A759D41322E;
	Sat, 28 Feb 2026 10:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772273604; cv=none; b=uAsRMd6+cev8i+vv34zSRRX7qAUur59eX1FGvq919twIOHO7lIvVUg4CxnvycMXppyHQKKMxdNpNkCkXATPM0+cTH5b5pODumfjMkbMpZjYO5+yB4uQGZ1NGKWmsw6WtHFo7ZXrxgWJKJHjL+5b0J1NleIn9GC/LAYOKYy91twY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772273604; c=relaxed/simple;
	bh=KKTIGqwOfr+WXF8iU3KjQXNHBmBhV1xK4/8tfjKIJgU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EK33ANIpvaOID6BBBuwrfw2Mf5sc1xAyxGopSxlHuFtVBeuGs1hNy2xkH0XcQc+Bso4dRhZHQXXS5R/xlWIWUxKxxlxmRhsonlUl6eyoprPG3TSzBk4ahd4B0Fy/jKUXOGWfHuoOM1ybGQW/oHyBty/dLimrqbPnhdKD3nIqodo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pv9vWs4r; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772273603; x=1803809603;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KKTIGqwOfr+WXF8iU3KjQXNHBmBhV1xK4/8tfjKIJgU=;
  b=Pv9vWs4rMr0P1AzhZ/kv5G1LRsnegcbqp7mhq/k3rVpoeACUq7qkogaO
   zGjvY6iesNK8MbizISRJx549LgOzJZqARw4R5gUNzGgBTA9r4RQEVqGg1
   hPNJhlPUEJE4nT53cKE+4dpgnqpw825wWpeTncOLmARInajEce1qs2/RJ
   eIFP2cBIk9XkrsmV4Bbdz1qGC10V70rHvzGaQ/dflsIe6+8tcBPCQ+YVD
   nS9SBMHLHRZQXFCig+Jitf/hI2Xrs7LD82t1ZSbu4mMO94Za0RsShCvZN
   ExW8uH47l8cMwqSHzVlomU8bNjaEQZa8UT9ft/9eREkl7qAOsJ9+hLMUE
   A==;
X-CSE-ConnectionGUID: k2iJ7Vh3SxamzGeBzTlo+g==
X-CSE-MsgGUID: Z4UkgiJQRVKPnvF7Qj/WwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="77191866"
X-IronPort-AV: E=Sophos;i="6.21,315,1763452800"; 
   d="scan'208";a="77191866"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2026 02:13:23 -0800
X-CSE-ConnectionGUID: DZNJR3teTU2199G6JjxgjA==
X-CSE-MsgGUID: fulAKX9kSSG9ftEuhrikyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,315,1763452800"; 
   d="scan'208";a="217246577"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost) ([10.245.245.224])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2026 02:13:21 -0800
Date: Sat, 28 Feb 2026 12:13:19 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ethan Tidmore <ethantidmore06@gmail.com>
Cc: Patrick Rudolph <patrick.rudolph@9elements.com>,
	Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: cy8c95x0: Use proper error code
Message-ID: <aaK_v2sSCRe9CVYL@ashevche-desk.local>
References: <20260228020538.1103307-1-ethantidmore06@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260228020538.1103307-1-ethantidmore06@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
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
	TAGGED_FROM(0.00)[bounces-32342-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim]
X-Rspamd-Queue-Id: A80351C1E96
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 08:05:38PM -0600, Ethan Tidmore wrote:
> The function cy8c95x0_irq_pending() returns type bool not an error code.
> 
> Use error code -EIO if cy8c95x0_irq_pending() fails.
> 
> Detected by Smatch:
> drivers/pinctrl/pinctrl-cy8c95x0.c:1303 cy8c95x0_irq_setup() warn:
> passing positive error code '1' to 'dev_err_probe'

I sent already a patch and the code is -EBUSY, because if we ever get non-zero
here, it means that IO was fine, the interrupt status was not cleared.

-- 
With Best Regards,
Andy Shevchenko



