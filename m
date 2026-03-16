Return-Path: <linux-gpio+bounces-33486-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aHK1HzLOt2mDVgEAu9opvQ
	(envelope-from <linux-gpio+bounces-33486-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 10:32:34 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D382970E7
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 10:32:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A4306303748C
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 09:31:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B07138C40F;
	Mon, 16 Mar 2026 09:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B61oDTIb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA446388E74;
	Mon, 16 Mar 2026 09:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773653474; cv=none; b=M0RH8Y2K4qKgVn7ZTZIFnbdL2t3AkZMXY4/d8Cb8pmhH1Q6FZeyDyY0Ad+aZz7X/cqIzYN2FQ8jMBJNLCnz08cSani2DDlodEN/dJZpgiRdtlYFLM8Zh2xzal+VmmM2B3e8JzdNXHgdTPIW/ChowuXW671LRztmAYkRbRl1Mm8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773653474; c=relaxed/simple;
	bh=kSVqVI3tl4CEdc3HT3nuLlKyFWKHu8Du1OapQS0jaP0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PpbGTj1JnlV06x6xqUIKAdvvNNBum/ZYAadu0+Hm1G0i5KYgQd+P86445zLAWledM5UJeQvsGCahcL0lzMr+OVe5U+/LvQAZblIZ2SscXRZsiGb9I5YG830vcP5Q0tTEN59CGKfXx++hW/dMjwj19RaTOg+SRFWbcdUntjBpKLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B61oDTIb; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773653474; x=1805189474;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kSVqVI3tl4CEdc3HT3nuLlKyFWKHu8Du1OapQS0jaP0=;
  b=B61oDTIbqb3R+Ogejp05E/W9BU+uwTqSDi2Q6+3O9YWsl6DbNOjcG2lT
   1cZ7ZeZ+bZmvZnQQUn3473Rlk+gL6NWVc55QnZg3Rzd2kuTmSw5f2VUdW
   v6F2x9WI+09/7pHV5f7NI+bAhisDZz6M86vIU0jaiTekjlA7Mq+2bczXT
   nPYN2oLvunWkIFcMH136b4dgKNTQoo25sVv/N9Ts9IhNx+LvGlPdTzuNy
   Hv9J82CuBnIJ99JfHJ4wBeDJlLRnlRdKvdP+CFpNHA1PJVMsaAhlxXJYG
   DO59xrk5P3F+JfW+2ETEhWKkoNixVJn9FaJdWnLSF0V6wQpJ+uOwrd7ks
   w==;
X-CSE-ConnectionGUID: ycIa99j6SbGGaoW3amU53A==
X-CSE-MsgGUID: yhMPvkmyTxqWb1ojOqGruQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="92047489"
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; 
   d="scan'208";a="92047489"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 02:31:14 -0700
X-CSE-ConnectionGUID: N+cW/zBKRb2JkN8sMpsQYQ==
X-CSE-MsgGUID: 5NwN6mSASXiJMtW4dyihFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; 
   d="scan'208";a="226850010"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.237])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 02:31:11 -0700
Date: Mon, 16 Mar 2026 11:31:09 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Do not enable the v1 uAPI by default
Message-ID: <abfN3bE0BMhkj0_R@ashevche-desk.local>
References: <20260314-no-y-uapi1-default-v2-1-578f09c91b8f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260314-no-y-uapi1-default-v2-1-578f09c91b8f@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33486-lists,linux-gpio=lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim,ashevche-desk.local:mid]
X-Rspamd-Queue-Id: E2D382970E7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 14, 2026 at 12:07:50AM +0100, Linus Walleij wrote:
> It's been five years since we introduced the v2 uAPI and
> the major consumer libgpiod is at v2.2.3.

Buildroot is still at libgpiod v1.6.5.

> Let's discourage the old ABI.


Anybody to ping them?

-- 
With Best Regards,
Andy Shevchenko



