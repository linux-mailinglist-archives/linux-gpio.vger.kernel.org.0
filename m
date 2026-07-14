Return-Path: <linux-gpio+bounces-40046-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Zs1qLlzzVWrywgAAu9opvQ
	(envelope-from <linux-gpio+bounces-40046-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 10:29:16 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A76B752657
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 10:29:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=MZ55e2Rt;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40046-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40046-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DB0A5300B1E9
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 08:29:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EE87400DE8;
	Tue, 14 Jul 2026 08:29:13 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BAF63FA5EF;
	Tue, 14 Jul 2026 08:29:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784017750; cv=none; b=ISZ6xk11x9REwZzjPiErwda8jQNyFTFz5uoH9n72QoJUYQ8hRnq4w3KlKRGELyEx8GVdIS8NU6o7KPUlhT3E/01r5AIXSjzgw8/E9Li9Ueyg3ePl5HHZjidQWLB+ZcaFjCDOIKDXnY2XygocYDf9Yc4ZE1LltTAqjagxpkENG/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784017750; c=relaxed/simple;
	bh=ZYsTwGRxS0A93y+E4400xQzGcnn4vftxauRj8YD03Aw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a4hEmOvmNXveOG7JbdMIEWwAUNpQP16Rpoz5p76TuxtMCAghgFGVvQiIRlKkZEMdqjJ9DCsa1Kg8QL11aGRvPZzfcnjQNcUQx3qOVXe2owfOniFETYgsrDDURKBNR5xhyT/Q1ATZFlRVSV3e1lbK4mcRO7udTv23wj5YWVy2KJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MZ55e2Rt; arc=none smtp.client-ip=198.175.65.10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784017744; x=1815553744;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ZYsTwGRxS0A93y+E4400xQzGcnn4vftxauRj8YD03Aw=;
  b=MZ55e2Rt9MtXwnj+8Tvu0bXV7CLyA2HjlxR3wKJJ2cqX2lafwqGHOFhT
   V/hXi8+NZ14bvKbEsLoTR5xVX3QbhcfbTCpZps6AWSl9FDWYH4X0mLb7a
   wEKNd7PzK51gCmKznkr5MRLxrtzzLDM++SGII+XJyWUMrL5SOVHmOWRsv
   kJN+wSFAovTnOOxBM6rDvzwHXbEF8jZSt2cCH4/LSy/WmN7mKgAJG3dOO
   M9Bkhm44mjkkAPuceU1l0hCFyBTTVxrzQ/V/EpdvjLwD7OwS0BG+LNxa0
   yGnA2sKc3mb5ZFlEHTLKo2IxvRwNfOohLn4hStc3evwYmoesf/KIEZTlZ
   A==;
X-CSE-ConnectionGUID: fzNo1p6uR66RL3NmUiXq1g==
X-CSE-MsgGUID: U28Pax/eQbSNGJcwMK1dlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="102060801"
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="102060801"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 01:28:56 -0700
X-CSE-ConnectionGUID: e2o78RtYQzqhgljWol4osw==
X-CSE-MsgGUID: HViNstywSLWJCNonQxfKpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="251846691"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.189])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 01:28:53 -0700
Date: Tue, 14 Jul 2026 11:28:51 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Hoan Tran <hoan@os.amperecomputing.com>,
	Andy Shevchenko <andy@kernel.org>,
	Yang Shen <shenyang39@huawei.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Mika Westerberg <westeri@kernel.org>,
	Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 11/20] gpio: Use named initializers for acpi_device_id
 array
Message-ID: <alXzQ1lmiucQLMyh@ashevche-desk.local>
References: <cover.1784013063.git.u.kleine-koenig@baylibre.com>
 <b0d21017a30fa40dd737695140a08397c07dae88.1784013063.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b0d21017a30fa40dd737695140a08397c07dae88.1784013063.git.u.kleine-koenig@baylibre.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-40046-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:u.kleine-koenig@baylibre.com,m:linusw@kernel.org,m:brgl@kernel.org,m:hoan@os.amperecomputing.com,m:andy@kernel.org,m:shenyang39@huawei.com,m:alan.borzeszkowski@linux.intel.com,m:westeri@kernel.org,m:israel.a.cepeda.lopez@intel.com,m:hansg@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7A76B752657

On Tue, Jul 14, 2026 at 09:24:12AM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> While being less compact, using named initializers allows to more easily
> see which members of the structs are assigned which value without having
> to lookup the declaration of the struct. And it's also more robust
> against changes to the struct definition.
> 
> The mentioned robustness is relevant for a planned change to struct
> acpi_device_id that replaces .driver_data by an anonymous union.
> 
> This patch doesn't modify the compiled arrays, only their representation
> in source form benefits.

...

> +++ b/drivers/gpio/gpio-dwapb.c

>  static const struct acpi_device_id dwapb_acpi_match[] = {
> -	{"HISI0181", GPIO_REG_OFFSET_V1},
> -	{"APMC0D07", GPIO_REG_OFFSET_V1},
> -	{"APMC0D81", GPIO_REG_OFFSET_V2},
> -	{"FUJI200A", GPIO_REG_OFFSET_V1},
> -	{"LECA0001", GPIO_REG_OFFSET_V1},
> +	{ .id = "HISI0181", .driver_data = GPIO_REG_OFFSET_V1 },
> +	{ .id = "APMC0D07", .driver_data = GPIO_REG_OFFSET_V1 },
> +	{ .id = "APMC0D81", .driver_data = GPIO_REG_OFFSET_V2 },
> +	{ .id = "FUJI200A", .driver_data = GPIO_REG_OFFSET_V1 },
> +	{ .id = "LECA0001", .driver_data = GPIO_REG_OFFSET_V1 },

While at it, sort them alphabetically by ID.
Please, check all your patches for the same opportunity.

	{ .id = "APMC0D07", .driver_data = GPIO_REG_OFFSET_V1 },
	{ .id = "APMC0D81", .driver_data = GPIO_REG_OFFSET_V2 },
	{ .id = "FUJI200A", .driver_data = GPIO_REG_OFFSET_V1 },
	{ .id = "HISI0181", .driver_data = GPIO_REG_OFFSET_V1 },
	{ .id = "LECA0001", .driver_data = GPIO_REG_OFFSET_V1 },

>  	{ }
>  };

-- 
With Best Regards,
Andy Shevchenko



