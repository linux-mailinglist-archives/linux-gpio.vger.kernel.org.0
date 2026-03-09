Return-Path: <linux-gpio+bounces-32796-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oHokOV6KrmmqFwIAu9opvQ
	(envelope-from <linux-gpio+bounces-32796-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Mar 2026 09:52:46 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 728A9235B02
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Mar 2026 09:52:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 66D21301469F
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Mar 2026 08:52:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18C3033A70F;
	Mon,  9 Mar 2026 08:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fpv5tnZe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCDDC1DF74F;
	Mon,  9 Mar 2026 08:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773046358; cv=none; b=V2URLAm9P2eQpKbO/Q3Tz5RZOH2Flf7WO5mQbLyXpXO+NRvV9ntCI/pcMGcJEXEI8O2JY3sqDaSddY+asZO1KdhtQZd0QnqsmQx1Bllb7Ggrp80AjCGfnJwcERu6av1SNOlQd9R07asY0KcUk5xsNc42aKmAoJyrEYcfR8Xor5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773046358; c=relaxed/simple;
	bh=HeqU8ro+uPeQp9tslIJnU33XdwI9Tosl5JY8WQmrTss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U+yryNBiVB5a6oGiKidGtg866yiqR0R7DbkdlQVuKKHUqT/XCnxrx5F/Wak/A2UYM19drrvfKMER7fRaiN/Xj+5mMOU/2zjzNFCohZhSfwqKDEFVMi3DZmIWDF8mDBKIznx1K09Wm46lxYfTuYu9Vlb+uqtf7fWONYAZ+uwPh24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fpv5tnZe; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773046357; x=1804582357;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HeqU8ro+uPeQp9tslIJnU33XdwI9Tosl5JY8WQmrTss=;
  b=fpv5tnZeST5lS1pmOOHXeilMAACTO+QGYGFCDEp6D3OFQcfwaKV1BwCr
   mOPQO/cpDKKWLvCV7bIL5hUoMiM/x+zXZLKmzaV+3waGOrbYmlZ3PMIMH
   bK1maajMC3gnFKOvDoUMIonZv7LeTbFbb39Skb3EQFnWKCEsct8YuSK6W
   3+w6N7/6QyZH7JPmg3n5QfVLQPpwTp7RQlt7hjkSkTp47d5lEyhp0BjLr
   MJ5fEXSipaXxZcg0juDpGSkRpj5+hx50TuNKJ0Lx6Jh3usDvyam0nLmTM
   3pDoWmXOOr1mXUp+Sjk6GmDUqhRBOPaqP2yRZrSGz2uQzSifmEReCWqZM
   Q==;
X-CSE-ConnectionGUID: RPiwYULNRe2xg8kiO706aQ==
X-CSE-MsgGUID: f9MJNc8ETTG+t9qQYHSRQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="96681652"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="96681652"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 01:52:37 -0700
X-CSE-ConnectionGUID: R/u4TXgFSTqLUw6P9ZV2+g==
X-CSE-MsgGUID: pRIAbBSGTieHzk2m3e3Dnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="257609604"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.181])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 01:52:33 -0700
Date: Mon, 9 Mar 2026 10:52:31 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v3 5/6] iio: adc: ti-ads7950: switch to using
 devm_regulator_get_enable_read_voltage()
Message-ID: <aa6KT-tzzEclXCA3@ashevche-desk.local>
References: <20260305-ti-ads7950-facelift-v3-0-a23fdd1a079e@gmail.com>
 <20260305-ti-ads7950-facelift-v3-5-a23fdd1a079e@gmail.com>
 <20260307114947.0b946dfb@jic23-huawei>
 <aa3czXB9tzLQgwha@ashevche-desk.local>
 <aa5ZA-CiIZuVkAdS@google.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa5ZA-CiIZuVkAdS@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Queue-Id: 728A9235B02
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32796-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
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
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 05:35:58AM +0000, Dmitry Torokhov wrote:
> On Sun, Mar 08, 2026 at 10:32:13PM +0200, Andy Shevchenko wrote:
> > On Sat, Mar 07, 2026 at 11:49:47AM +0000, Jonathan Cameron wrote:
> > > On Thu, 05 Mar 2026 11:21:56 -0800
> > > Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:

...

> > > > +	ret = devm_regulator_get_enable_read_voltage(&spi->dev, "vref");
> > > > +	if (ret < 0)
> > > 
> > > I think you need to check for -ENODEV and if you see than then
> > > see if the acpi route below applies.  Otherwise on ACPI this will fail
> > > and we'll fail the probe.
> > 
> > Yep, just make it default without even checking the fwnode type.
> > No need to bring the whole acpi.h into the mix.
> 
> I do not think this would be correct behavior. On non-ACPI systems the
> regulator is mandatory, and the driver should not blindly apply scale
> from ACPI systems just because regulator is missing in the DTS.

I mistakenly thought that original code doesn't have that cneck. Yes, the
ACPI_COMPANION() should be preserved.

-- 
With Best Regards,
Andy Shevchenko



