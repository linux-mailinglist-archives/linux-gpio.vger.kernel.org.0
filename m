Return-Path: <linux-gpio+bounces-40055-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MeDCMTMeVmqjzQAAu9opvQ
	(envelope-from <linux-gpio+bounces-40055-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 13:32:03 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D73753EB0
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 13:32:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=lCt0WCbA;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40055-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40055-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 607B230E7F7E
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 11:31:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8D0B35C1BD;
	Tue, 14 Jul 2026 11:31:42 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156DB181334;
	Tue, 14 Jul 2026 11:31:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784028702; cv=none; b=NdyCYvzwRg+w7gmrlAWrK7UW/KPGMfB3zhdhrKu0InMZnS1gilljdKUVbXCIbzYwHItccmRFbb0UgQ9xqeB+de5lBvA7TumUovcjoOHRXXRSirEhCYwlbdks/OhfKisiVyNe4rlHXix7tLpCr7/03WWFuWMDzKLtYfQB3D80HRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784028702; c=relaxed/simple;
	bh=jcai0qjyo1b88jCQI1Se9jX27hbIxqqY8Uk5KZ+wrZg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lYk98sASwOz3GeFeo6vV3x3xJ6sLi00ODgXSKAU9ejt37obG991sinL/W+D8rPM2ngdoCleyn+O/l/kHFYDt5/sWokhDwwsZ9sfkCozov4iCE7eps0s3SBeMkMJiK3PsEMmENQP/9iZOMR4alMtFfkU23nrP7jNmHwcu/q3Y4wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lCt0WCbA; arc=none smtp.client-ip=198.175.65.9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784028701; x=1815564701;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jcai0qjyo1b88jCQI1Se9jX27hbIxqqY8Uk5KZ+wrZg=;
  b=lCt0WCbA18hKnAdoXyiKAhEcD7XpmGNfRd4ztpVgLGajNzsnVEWTGvH4
   hBW8Idq+7E28XozXaPxNCN8I37MGNetNlwnMIL88HquS1Wedp8HQ7cuH/
   ToTpltPvAFYCTXTFFhPEfQsa2Ztx9Hj6iQtOQdG8+xC1SRbS4RI10MWNt
   /Xu/bdm3Z03RhTJt1JK0/SJpqQgyHZFlGhT9qCYFbRmPoFtXUHxT/2bEm
   6UwkX8hkqTLttL6+mnYvJADIxSooVBnlVpzczI1S7QRGl3f30yBf1ygDi
   6+qnCM9Dq6BTSG/Z/6EIYysG+/J4spRGpHUQ5ZnZecJvab5mvxOTwbyTc
   Q==;
X-CSE-ConnectionGUID: sqkoaSmWSMyOkzkjKDHx0Q==
X-CSE-MsgGUID: OcMLykF0QV+t9LQDV4rQBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="107440500"
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="107440500"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 04:31:40 -0700
X-CSE-ConnectionGUID: 7pJYioDUQyKfbeqL+3ROag==
X-CSE-MsgGUID: 5HfEpHDXSleqBZxbte/6yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="254083358"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.189])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 04:31:36 -0700
Date: Tue, 14 Jul 2026 14:31:33 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Janani Sunil <jananisunil.dev@gmail.com>
Cc: Janani Sunil <janani.sunil@analog.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux@analog.com,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 5/6] gpio: ad7768: Add AD7768 GPIO auxiliary driver
Message-ID: <alYeFXzm56mvfdzi@ashevche-desk.local>
References: <20260709-ad7768-driver-v1-0-44e1194fd96a@analog.com>
 <20260709-ad7768-driver-v1-5-44e1194fd96a@analog.com>
 <ak-AcfH-Igsa_ksV@ashevche-desk.local>
 <1e353a66-3543-4a6f-91b6-d5e8524d9754@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1e353a66-3543-4a6f-91b6-d5e8524d9754@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-40055-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:jananisunil.dev@gmail.com,m:janani.sunil@analog.com,m:nuno.sa@analog.com,m:Michael.Hennerich@analog.com,m:jic23@kernel.org,m:dlechner@baylibre.com,m:andy@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:olivier.moysan@foss.st.com,m:p.zabel@pengutronix.de,m:linusw@kernel.org,m:brgl@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux@analog.com,m:linux-iio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-doc@vger.kernel.org,m:jananisunildev@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ashevche-desk.local:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:from_mime,intel.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 68D73753EB0

On Tue, Jul 14, 2026 at 01:03:40PM +0200, Janani Sunil wrote:
> On 7/9/26 13:05, Andy Shevchenko wrote:
> > On Thu, Jul 09, 2026 at 10:50:16AM +0200, Janani Sunil wrote:

...

> > So, I briefly looked at the implementation and I don't understand why
> > gpio-regmap can't be used. Do you need PM runtime there? It can be
> > done for all (if absent).

> gpio-regmap does not naturally model the AD7768's direction dependent
> readback behavior.

> On this device, GPIO Write data (0x0F) holds the latched output values and
> the GPIO Read Data (0x10) reads the logic input level only when the pins are
> configured as inputs. Using the generic gpio-regmap would always read 0x10
> including output GPIOs.

Will it? Even if you mark the corresponding registers volatile?
So, the problem is that it always tries to read input state even
for the output pins? I think this should be either configurable
(a flag in the respective gpio regmap config) or be clever to know
that the pin is in output and simply return what was latched.

> The custom implementation preserves the device specific behavior.

At bare minimum the summary of this should be mentioned in
the cover letter / comment block.

-- 
With Best Regards,
Andy Shevchenko



