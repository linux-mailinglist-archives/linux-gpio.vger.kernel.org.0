Return-Path: <linux-gpio+bounces-31439-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPfuGOpWg2mJlQMAu9opvQ
	(envelope-from <linux-gpio+bounces-31439-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Feb 2026 15:25:46 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7F2E70E7
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Feb 2026 15:25:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2D413302DF49
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Feb 2026 14:22:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ADB740B6F9;
	Wed,  4 Feb 2026 14:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PImsfXR9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37CF280330;
	Wed,  4 Feb 2026 14:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770214967; cv=none; b=tvl94jx/sWa3WrrO8XdmnTyMxaZBXsWYhKW3R4ihSHFQcno+wjpKr4gBz57QdhDx3VijQzYKS17hVr2gd7AnlvNjv2/PJqdsoS2TzOuu8OWmw9exgy0UY2xlU+lpE55BXf+Bd5EVGnAW3JbNQ9uZbd2cSvd/7FhUE5QNzVma8rI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770214967; c=relaxed/simple;
	bh=IrNP9aPjvILwnwoEewPVQMmwUR+z+tWND+goKGd2lig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ohAhyGEmTwcWfEahSxTU6PrrjR6iD5HW0StR1w41Pi4iNjYmpHGaCICnpnng5DVA2agn2c3QO0DaZLJ/gIldJHVyZSlBywju+OrjX8BQ2cxYftfxg6UaMkYWR8qBXPkQKyHO2sTxJNZYf/cnmOIkjCIX0zudiAGuxkUfLQ8HoLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PImsfXR9; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770214968; x=1801750968;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=IrNP9aPjvILwnwoEewPVQMmwUR+z+tWND+goKGd2lig=;
  b=PImsfXR9BHic/fcwJrlYgM7qzsudEYTCiXl6vPOdMCoVyem38eDrH3jv
   IcgXBIxX9bsF/0kzmzTLA1QfgDmRi4kRZUyESDL2wxt01I+o8uv9TK0wQ
   /gyccaPIVqVd3VxmQZaI4QTd6wGneitY58Qs3du3vS1EZ8aXlsIrZm/7D
   k4cT5yL9z6/fG5ep6UVzcXnJn3KQmnIHBxozD5jBAddrAQ1Z7JE0rpmLD
   VEZ/+f3fiefsMHF/gcrssxzULtUAlIu5363b2+gm1W+WBJ9T/FV8ypz4b
   GGvoD9r1mxwyQ8R/A1q6Gfj9x8x8S3bKJGQvgJOBbruSWcJK+q2zp9/u4
   A==;
X-CSE-ConnectionGUID: kbE5SahjSfqZEeJBskmlCg==
X-CSE-MsgGUID: c2n8LpUTS1uQGydvPn99+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="75252955"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="75252955"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 06:22:47 -0800
X-CSE-ConnectionGUID: S2N85vwdSnaWdLO1IP1BCw==
X-CSE-MsgGUID: 7foP+xnfTiWmLWigJKydsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="214350282"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.188])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 06:22:45 -0800
Date: Wed, 4 Feb 2026 16:22:42 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Conor Dooley <conor@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC] pinctrl: pinconf-generic: move ..dt_node_to_map_pinmux()
 to amlogic-am4 driver
Message-ID: <aYNWMndBWxxoPABG@smile.fi.intel.com>
References: <20260203-craftsman-battered-3491ff68f462@spud>
 <CAD++jLn8WOobPaoSrMLitFgFZc_6CH9BQbRy_Gdqq3BLhDXWQg@mail.gmail.com>
 <aYL9zgEyCarrluvP@black.igk.intel.com>
 <20260204-crawlers-nacho-d7c9021cdb6f@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260204-crawlers-nacho-d7c9021cdb6f@spud>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,microchip.com,amlogic.com,linaro.org,baylibre.com,googlemail.com,lists.infradead.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-31439-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,smile.fi.intel.com:mid]
X-Rspamd-Queue-Id: AD7F2E70E7
X-Rspamd-Action: no action

On Wed, Feb 04, 2026 at 02:15:10PM +0000, Conor Dooley wrote:
> On Wed, Feb 04, 2026 at 09:05:34AM +0100, Andy Shevchenko wrote:
> > On Wed, Feb 04, 2026 at 12:34:36AM +0100, Linus Walleij wrote:
> > > On Tue, Feb 3, 2026 at 5:17 PM Conor Dooley <conor@kernel.org> wrote:

...

> > Note, please, remove extra '.' (dot) in the Subject.o
> 
> fwiw, the .. was intentional cos I was truncating the pinconf_generic
> from the function since the subject was really long, not referring to
> a member of an ops struct.

Yes, and that's how we refer to the callbacks — with a single dot and parentheses:

	.my_cool_cb()

Alternatively

	->my_cool_cb()

but it one character longer and TBH it slightly less readable (I personally
used the latter and then switched to the former in the recent years).

-- 
With Best Regards,
Andy Shevchenko



