Return-Path: <linux-gpio+bounces-36900-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WNvaAMfqBmqCowIAu9opvQ
	(envelope-from <linux-gpio+bounces-36900-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 11:43:35 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3F654CA7D
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 11:43:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2471C30C2F25
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 09:34:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F08FD43CEDB;
	Fri, 15 May 2026 09:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c+e93sCw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41908401489;
	Fri, 15 May 2026 09:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778837668; cv=none; b=tmWt0jffzNJSuEAp9Omk3ht4QOazaxdBt5hjT4H/nLvwKwiIlOjYsHwMQgviR0CvJfE+bhYMkLATxQ4oqyNnObCqZc6WhSVM12/zYGfhDEoveDjA/96SUBlqlZADa4jJCHohMTvc0agAw3ZWjI5TmSBmP1d1CHce77rltahTC84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778837668; c=relaxed/simple;
	bh=HnWWIdvb1tx14H5OxFyttFQM8slsQGnOefYn/wt07h0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lkzIOLqfByuNWhZM+oIZavOKreCrjrqHn0MkaEiRJ5vjK2xnp0qQCdINb3mDOsdMf/ABGghhKCQmwo6dGGHJoiEc3d6TZ2C40nyGU5RpcgYwprxCWG2jO/iDRJr8fhfCU9ytqGBli+JFNmuy2V8FrWhM6+q3YlE/G1+AHP9ItTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c+e93sCw; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778837667; x=1810373667;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HnWWIdvb1tx14H5OxFyttFQM8slsQGnOefYn/wt07h0=;
  b=c+e93sCwZqPdfHZsRWRCVp3QzFeRK/bKAXHZnQITj4wu20eUQLdLD41y
   lK+/FJaeKdVXTTzKuuO/fNolMVg4XVNNExaoe5uDzWmTc25h4doZbRWPJ
   dQ+L1izLrPvm2iu3BMToEYY8c0oP5YI9ZIHU7DOu/FNf+/o+z0Di48wxo
   I6E9LO17JmSec7rfwb6sbxksmVRSXzIBU+7CcETOJhd5QbCFKuaImr8UE
   frnIt65DcgnwlsaPkKMHvG3Qdm50QLKqj10anfe8KdPL/6GZndINLwfcd
   WYzGiJASPn0CZjLQb/Zyxm6f0dR0bJGJFl+GUhJQSnIEI60wBnqSAodQ0
   Q==;
X-CSE-ConnectionGUID: 5MwWrlgQT+uYnGU18toGxA==
X-CSE-MsgGUID: cSy3WDYvRyKDyT5NTmP4tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="83646722"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="83646722"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 02:34:26 -0700
X-CSE-ConnectionGUID: S9W6yTTYRiO5QoHLzCyFTg==
X-CSE-MsgGUID: 4A/IikBIQEWuafcqoW/syQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="237661813"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.33])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 02:32:34 -0700
Date: Fri, 15 May 2026 12:32:32 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: thomas <thomas_lin@lecomputing.com>
Cc: rafael@kernel.org, lenb@kernel.org, hoan@os.amperecomputing.com,
	linusw@kernel.org, brgl@kernel.org, mika.westerberg@linux.intel.com,
	jsd@semihalf.com, andi.shyti@kernel.org, broonie@kernel.org,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-spi@vger.kernel.org, lucas_hao@lecomputing.com,
	puntar_liu@lecomputing.com, jihua_tao@lecomputing.com,
	stan_xu@lecomputing.com, lumin_liu@lecomputing.com,
	notics_zhang@lecomputing.com, braden_zhang@lecomputing.com,
	harold_wu@lecomputing.com, will_zhang@lecomputing.com,
	aurora_jiang@lecomputing.com, ryen_lin@lecomputing.com,
	andy_jiang@lecomputing.com
Subject: Re: [PATCH 2/3] spi: dw-mmio: Add LECARC ACPI ID and init hook
Message-ID: <agboMC07Xojt5x2c@ashevche-desk.local>
References: <20260514024014.3376511-1-thomas_lin@lecomputing.com>
 <20260514024014.3376511-3-thomas_lin@lecomputing.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514024014.3376511-3-thomas_lin@lecomputing.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Queue-Id: AF3F654CA7D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36900-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_TWELVE(0.00)[27];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Thu, May 14, 2026 at 10:40:11AM +0800, thomas wrote:
> Add ACPI ID "LECA0002" for LECARC SoCs. This ID requires a custom
> initialization function dw_spi_lecarc_init() that sets dws->dws.ip
> to DW_HSSI_ID.
> 
> Also add corresponding ACPI description in acpi_apd.c.

...

>  	{ "HISI02A3", APD_ADDR(hip08_lite_i2c_desc) },
>  	{ "HISI0173", APD_ADDR(hip08_spi_desc) },
>  	{ "NXP0001", APD_ADDR(nxp_i2c_desc) },
> +	{ "LECA0002", APD_ADDR(leca_spi_desc) },

Keep them ordered or close enough to be ordered. Id est in this case
locate it before NXP.

...

> +static int dw_spi_lecarc_init(struct platform_device *pdev,
> +			     struct dw_spi_mmio *dwsmmio)
> +{
> +	dwsmmio->dws.ip = DW_HSSI_ID;
> +
> +	return 0;
> +}

dw_spi_intel_init() is the same, why not reusing it?

Note, if uncomfortable with the name, make a patch to rename it to something like
dw_spi_hssi_no_dma_init().

-- 
With Best Regards,
Andy Shevchenko



