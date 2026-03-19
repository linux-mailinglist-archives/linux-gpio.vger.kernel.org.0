Return-Path: <linux-gpio+bounces-33793-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2L5jBdWSu2mYlgIAu9opvQ
	(envelope-from <linux-gpio+bounces-33793-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 07:08:21 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE952C6890
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 07:08:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EBD10301A922
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 06:03:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB63528A3FA;
	Thu, 19 Mar 2026 06:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EyP7Mh5H"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9774A275112;
	Thu, 19 Mar 2026 06:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773900229; cv=none; b=nr2W/rzU+FV3bR+iF/TwakFw6nhYOkn893u5Zm3jgTCHmbtzHQdDGWbtyd/h6EYxlmCaWmDTManEPXgtr+ZSHgUar+cb31DjG/c/fxt3jG2fXd6m+v3y0hgtjzh68zb7OJVyXaCnOFm7XCg8UkpFL8E4IpTPLjaXXaF56/dh9Ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773900229; c=relaxed/simple;
	bh=XAo31wvjchd7qx2WnncgWBVcs2xh52+7PQsbU/PUW28=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rj3eNpcyUc/G0gNmCQ45veY6hUDVezjG2eccMqqItE4HULGnaOgAzmJVyk6gJfURc1iYV/iXZ+VvLa6ROoC8uvTpTRCuDFTlLRzU5d1rN+dxXVei+48/2DnLeoTpDNFtW1DZwxA9s6r3vVsVuyAmbW5xtnrpJxg96jVPGkUqaPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EyP7Mh5H; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773900229; x=1805436229;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XAo31wvjchd7qx2WnncgWBVcs2xh52+7PQsbU/PUW28=;
  b=EyP7Mh5HxywN1WH5EMiHmjiTbqR9aIbxuwKPAvGrR/L3E4/nJ//5mk6J
   hWIet4QlshxHh20YQGLzW/41kXdEWVx9sIwNodbnTxsW9xctyXW9xlSb0
   47cq3G/QzXYZGB+JPS2RSSsK3RIkbrjAurCkM8rSEgVMyOCCtuEI4WAT4
   L7CJF1n+z3PypHV8wYtGp9tdJnKaj1RIKqpeCNMOXF1yvWyNL4TJnrkRL
   sjEpRqkc+GiDU0S4WZ6JVrg2oOMjP487kPt0mjMhMAtNHOIS714kcx68j
   fisaBC7zv0zgreFqihgEq6Tfb7W4XpQnMlEcls7wE54LSlkjBoFF/wi8T
   Q==;
X-CSE-ConnectionGUID: AEUDn3uPRs+0DbuAQ+6NHw==
X-CSE-MsgGUID: cuAscEFmSTSOT0T3FVOXLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="75151078"
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="75151078"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 23:03:49 -0700
X-CSE-ConnectionGUID: Msz9q5KsTZaYlGaW7Tv8RQ==
X-CSE-MsgGUID: KyKsGxeQQnen16/M/SLxog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="221968155"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa006.jf.intel.com with ESMTP; 18 Mar 2026 23:03:47 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id DEB5995; Thu, 19 Mar 2026 07:03:45 +0100 (CET)
Date: Thu, 19 Mar 2026 07:03:45 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v1 4/5] pinctrl: intel: Refactor
 intel_gpio_add_pin_ranges() to make it shorter
Message-ID: <20260319060345.GQ2275908@black.igk.intel.com>
References: <20260318151256.2590375-1-andriy.shevchenko@linux.intel.com>
 <20260318151256.2590375-5-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260318151256.2590375-5-andriy.shevchenko@linux.intel.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33793-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-0.992];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[black.igk.intel.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim]
X-Rspamd-Queue-Id: 7FE952C6890
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 04:10:18PM +0100, Andy Shevchenko wrote:
> Refactor intel_gpio_add_pin_ranges() to make it shorter in binary
> and source formats.
> 
> Function                                     old     new   delta
> intel_gpio_add_pin_ranges                    219     215      -4
> Total: Before=15522, After=15518, chg -0.03%

Well if you enable optimization the compiler probably puts this into
register and you don't see any changes here. Also code-wise this is
neglible IMHO.

