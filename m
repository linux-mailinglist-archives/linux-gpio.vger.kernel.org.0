Return-Path: <linux-gpio+bounces-37845-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mRrlASdTH2r6kQAAu9opvQ
	(envelope-from <linux-gpio+bounces-37845-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 00:03:19 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 750C2632519
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 00:03:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=EV6+790M;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37845-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37845-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 003AD301ABB7
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jun 2026 22:03:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBE54383338;
	Tue,  2 Jun 2026 22:03:03 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65DA0381B1F;
	Tue,  2 Jun 2026 22:03:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780437783; cv=none; b=QvOsVhg/qnYJSbEguVf0LqyC42eLtG0HLFGPBHdmRoImRw2wHAqY5nFTZ0QnNxYzdm10MSxiofPYUIC8ulumvvglebi5LH/Be0lzejzA7hIIBgNlPBNElH5iVtenoj6i2ESQwskFpPTBtGkRWesVilf0NNLS6lXPfPGhwnBMHo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780437783; c=relaxed/simple;
	bh=5Eu+KLYLa0nbb+xrRIQGmpnkV2DnY5IS9nq+/lttbRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tVWvIu4AZTOp4gvaerh+5bfBo9okeEnRunojPtBY0E7+jELU5LP8bz83gjy4fIusfnGSIu1yq6xNCLfSRqoapVGqeRYvAehIWhNNO4quX7bddy7EOMUZFfDAUjiVYj4QHxxtiCY+32yfyH3/NhNAQOhzZg+oQ3dMljMY55guy4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EV6+790M; arc=none smtp.client-ip=192.198.163.16
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780437783; x=1811973783;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5Eu+KLYLa0nbb+xrRIQGmpnkV2DnY5IS9nq+/lttbRQ=;
  b=EV6+790MeN4WaFYVrRxBSkKmE267lV8ZtuamkLPK607eyRiP8NxfrVPs
   y5yIVOxV/XfGKeZrYejaQqPexijlZou10fb5rOE16H29RSWCpkNvC5GTK
   xFaOXzZDAuZbZdkH80j0sZErIsfoNiCukvIGzI8b3mvQLkUcARYBlW1eE
   e6QC38h+LxDIvShrKMBXVogdMTDEXoURKmmgUHrS6s6C2FqxMagjr95ni
   1f0TX9MQsgkaHA9uDau4Plx+UvMNjnOopTNmY+WgP7BJQh8nn3MWLQREZ
   VVULSXWleo/UReMvoQLGUMBeaTPnOtAw5Qls3hgwXmyPmpB/TS2N5LneW
   Q==;
X-CSE-ConnectionGUID: qoVrKFHXSlqYzYGs3N9cVA==
X-CSE-MsgGUID: 2fZ3HYOfRLWC0PBeqLUtJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="68778024"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="68778024"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 15:03:02 -0700
X-CSE-ConnectionGUID: YjSbJmO7SdqHodQ3uxUwsQ==
X-CSE-MsgGUID: lnBU+o19RgmQlsdItY2dVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="237674514"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.116])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 15:02:59 -0700
Date: Wed, 3 Jun 2026 01:02:56 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Arnd Bergmann <arnd@kernel.org>, linux-sh@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 3/5] sh: mach-rsk: rsk7203: use static device
 properties for LEDs and GPIO buttons
Message-ID: <ah9TEJ_jrfcJwrb9@ashevche-desk.local>
References: <20260520-rsk7203-properties-v2-0-465f3308021b@gmail.com>
 <20260520-rsk7203-properties-v2-3-465f3308021b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520-rsk7203-properties-v2-3-465f3308021b@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37845-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dmitry.torokhov@gmail.com,m:dalias@libc.org,m:glaubitz@physik.fu-berlin.de,m:ysato@users.sourceforge.jp,m:geert+renesas@glider.be,m:linusw@kernel.org,m:brgl@kernel.org,m:arnd@kernel.org,m:linux-sh@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:dmitrytorokhov@gmail.com,m:geert@glider.be,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	HAS_ORG_HEADER(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,linux.intel.com:from_mime,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ashevche-desk.local:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 750C2632519

On Wed, May 20, 2026 at 10:13:19PM -0700, Dmitry Torokhov wrote:
> Convert the board to use static device properties instead of platform
> data to describe LEDs and GPIO-connected buttons on the board, so
> that support for platform data can be removed from gpio-keys and other
> drivers, unifying their behavior.

...

> +	for (i = 0; i < ARRAY_SIZE(rsk7203_devices); i++) {

	for (unsigned int i = 0; i < ARRAY_SIZE(rsk7203_devices); i++) {

...and drop the above definition of i.

> +		pd = platform_device_register_full(&rsk7203_devices[i]);
> +		error = PTR_ERR_OR_ZERO(pd);
> +		if (error) {
> +			pr_err("failed to create platform device %s: %d\n",
> +			       rsk7203_devices[i].name, error);
> +			return error;
> +		}
> +	}

-- 
With Best Regards,
Andy Shevchenko



