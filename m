Return-Path: <linux-gpio+bounces-35004-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MHTlB5bz2GlJkAgAu9opvQ
	(envelope-from <linux-gpio+bounces-35004-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 14:56:54 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE0D3D7C37
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 14:56:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DE13D302C5FC
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 12:48:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E20B31F419A;
	Fri, 10 Apr 2026 12:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ue2V5D/Z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2422175A9C;
	Fri, 10 Apr 2026 12:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775825288; cv=none; b=baUQW2gOgpDRKssAQ7Vb1ZurLuyDQ0i1pen+Ct9KZoJ3m1+lgcAY/LDT4vY707DHf/VuHUnRCzOeHSdYDlT24gqfB0+TnIi4491gh/maEi1yJd93VrV/DpFBp3w4CysvTgIwji0W77WjHale75D5PiG9XO42FOze+HIb1v6SIqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775825288; c=relaxed/simple;
	bh=s/5cnWDFflPnlnen/OEb9l9KdA4tZCc0mIertwXNYls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IvvcPmD/ndTAAEDUBT1glyunQIFmliJxoWwdVLtldheYlDEBhsOem3nZXzZ9/JKIJLU72+KqDG11foam1PpTaKUZIjmZkYT4eOxuXlRf9NPgIoZM7/ACkiUjSpFyAqIjb1iWGX+PZITnnvhJUZlRUVpeBVBCAx0qSNhl70ooUOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ue2V5D/Z; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775825287; x=1807361287;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=s/5cnWDFflPnlnen/OEb9l9KdA4tZCc0mIertwXNYls=;
  b=Ue2V5D/Zu+xAJCmfHfAaZ5lZzsZyGPoAJy0WCozK4Hqj2mbsUsYh9dPF
   Uchw5wjVp+rms75a4xBaxxeLjFanlMcBy3u8s2V+p8YbckXxVmaOZXVkT
   rTSRUKdj1d7kmTXgpcFzrxkfO4f6AxrGzoRQ2NUzVTDFkcYoZCJTQqQdd
   EhJAclUXXLkgy7DNpBNkcHV9KpPJfr7SDqQZ1xN1v++QCGLgJZ41W0wrq
   4tfiucGLjx7dhPfPSGHyMxNn3ki5bkw5wrvMuMs/2BUqs2n6m7JysYbyz
   ac87am2ttXEy8c1KohBdFxvNgvd0kuq5OrhCOlIDDLRj5HkzL3jDmkjr2
   w==;
X-CSE-ConnectionGUID: F/Px6eoAQpSdXrVB4O3g1A==
X-CSE-MsgGUID: fmV2c8EuRkGz+KPJ/lksBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="76860060"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="76860060"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 05:48:06 -0700
X-CSE-ConnectionGUID: gYnkSLu3RdmBRgv6D7yI1Q==
X-CSE-MsgGUID: Q0zl4a9JSGey2SPpAWLHbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="228077606"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.73])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 05:48:05 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id B70CD11FA4F;
	Fri, 10 Apr 2026 15:48:18 +0300 (EEST)
Date: Fri, 10 Apr 2026 15:48:18 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Arun T <arun.t@intel.com>
Cc: israel.a.cepeda.lopez@intel.com, hansg@kernel.org, linusw@kernel.org,
	brgl@kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, miguel.vadillo@intel.com
Subject: Re: [PATCH 1/2] gpio: usbio: Add ACPI device-id for NVL platforms
Message-ID: <adjxkijIn0nGV3LF@kekkonen.localdomain>
References: <20260410080229.562160-1-arun.t@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410080229.562160-1-arun.t@intel.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35004-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 7BE0D3D7C37
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Arun,

On Fri, Apr 10, 2026 at 01:32:29PM +0530, Arun T wrote:
> Add device IDs of Nova Lake into gpio-usbio support list

Sentences end in a period.

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

> 
> Signed-off-by: Arun T <arun.t@intel.com>
> Reviewed-by: Vadillo Miguel <miguel.vadillo@intel.com>
> ---
>  drivers/gpio/gpio-usbio.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpio/gpio-usbio.c b/drivers/gpio/gpio-usbio.c
> index 34d42c743d5b..489c8ac6299e 100644
> --- a/drivers/gpio/gpio-usbio.c
> +++ b/drivers/gpio/gpio-usbio.c
> @@ -31,6 +31,7 @@ static const struct acpi_device_id usbio_gpio_acpi_hids[] = {
>  	{ "INTC10B5" }, /* LNL */
>  	{ "INTC10D1" }, /* MTL-CVF */
>  	{ "INTC10E2" }, /* PTL */
> +	{ "INTC1116" }, /* NVL */
>  	{ }
>  };
>  

-- 
Sakari Ailus

