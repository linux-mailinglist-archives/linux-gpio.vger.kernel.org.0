Return-Path: <linux-gpio+bounces-36774-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MKg2AJ6vBGrENAIAu9opvQ
	(envelope-from <linux-gpio+bounces-36774-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 19:06:38 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 863D7537AD2
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 19:06:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D3B5230230C9
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 17:04:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE4CB4DB557;
	Wed, 13 May 2026 17:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dYdWMa7O"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122E243C044;
	Wed, 13 May 2026 17:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778691856; cv=none; b=Im+dfXr02twQJnNcs7DJ7/X51ALog/xkU4lL8iwKp4mjTG5Fl4Uj9imjJ05zY/PSSfTYUN32XMes7+lo07Oms+JZuH4IYLeQfl7EaPKRJCI9KamN3509TENie2bkRJWbSpsdKHXrG7s+VJlhl+bPtsKQW61NZC6qrgRK9pvxgqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778691856; c=relaxed/simple;
	bh=eV4VkmjOZBflvrQ7ayx8vbnB1g8ily4ftcd/ohNLm+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fls7nxHxZ5gNef8uFnaV2QKD7KfssfeO0GO8SBaFnyIuX3RSgn0NxXznjLdjLxjxdrHBMj6Ox1dW7KV7Hhz1oYR25YHJclXmWNA+uAbcTk3o2jjjKXZORDdWHBN0sPPqR39XWg+cV4uv3LP9jSFruZzdxVHG1P7mdvLKVn3TAWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dYdWMa7O; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778691851; x=1810227851;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eV4VkmjOZBflvrQ7ayx8vbnB1g8ily4ftcd/ohNLm+g=;
  b=dYdWMa7O55rI3c8eoblzqFm/1f6GfrrBk9b3sonah6fN38o64UGYlZ/2
   pfS4NjADww8kzUEaSIz6CFgiYrTYXD1G5luqIj3t05XXghXRmKBEWMghT
   X+Gcrf6Np+8iZK1ZsDaMoZGUMra8CSZHREZIkfQNX9PxUMIFWv0d4lk37
   oTsBRnkOzYfu0VheQzSohTshrpbklv2GuuwoQzhQqP4KhO6QvCjjCvrgo
   B6Zi1YLcExuES+tYVds4FX4+LvQICljLnfFsMrODiV9YvmmrI1eufAMkL
   M4xXx5A4DVUGeHG3+JJXCtrtB2hUqInAvE1Sh74AD0O08pCqCkj4p3Eex
   g==;
X-CSE-ConnectionGUID: X7pTtD96RiqMdPpQvlwcqg==
X-CSE-MsgGUID: dqmQE1ZKTJSS2zc4FNAljg==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="97052473"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="97052473"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 10:04:10 -0700
X-CSE-ConnectionGUID: mnJZyVevTUKapPf4Gfn8iw==
X-CSE-MsgGUID: FT39LlDGSNyoOmzXTnCVlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="233870116"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.106])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 10:03:56 -0700
Date: Wed, 13 May 2026 20:03:54 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Hardik Prakash <hardikprakash.official@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
	linus.walleij@linaro.org, wsa@kernel.org
Subject: Re: [PATCH v2 0/2] Fix WACF2200 touchscreen on Lenovo Yoga 7 14AGP11
Message-ID: <agSu-jGOuhMscg9A@ashevche-desk.local>
References: <20260513061338.9348-1-hardikprakash.official@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513061338.9348-1-hardikprakash.official@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Queue-Id: 863D7537AD2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36774-lists,linux-gpio=lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ashevche-desk.local:mid]
X-Rspamd-Action: no action

On Wed, May 13, 2026 at 11:43:36AM +0530, Hardik Prakash wrote:
> The Wacom WACF2200 touchscreen on the Lenovo Yoga 7 14AGP11 (83TD) is
> completely non-functional on Linux. The I2C bus (AMDI0010:02) fails with
> repeated lost arbitration errors at boot before any driver can probe the
> device. The touchscreen works correctly in UEFI and Windows.
> 
> Investigation using ACPI _CRS decode and Windows/Linux GPIO register
> comparison identified two bugs:
> 
> 1. GPIO 157 (WACF2200 GpioInt per ACPI _CRS) has INTERRUPT_ENABLE and
>    INTERRUPT_MASK cleared by amd_gpio_irq_init() and never restored,
>    preventing the device from signalling the driver. Windows keeps both
>    bits set after initialisation.
> 
> 2. i2c_designware probes AMDI0010:02 before pinctrl-amd's probe
>    completes. A DMI-matched deferral is added to correctly enforce
>    ordering using device_is_bound() under device_lock().
> 
> Patch 1 adds a DMI quirk in pinctrl-amd to restore GPIO 157 interrupt
> bits after amd_gpio_irq_init().
> 
> Patch 2 adds a probe deferral in i2c-designware-platdrv that correctly
> waits for pinctrl-amd to fully complete before AMDI0010:02 is probed,
> using acpi_dev_get_first_match_dev() and acpi_get_first_physical_node()
> for robust device lookup.
> 
> Both patches tested on Lenovo Yoga 7 14AGP11 (83TD), Fedora 44, kernel
> 7.1.0-rc2+. Touch and stylus fully functional across 4 stable reboots.

The Subject in the patches misses versioning, use

	git format-patch -v<N> --cover-letter ...

where <N> is the version, to get proper format in the Subject.

Also link to the bugzilla makes sense as BugLink tag in the patch(es):

BugLink: $URL

Or simple Link.

-- 
With Best Regards,
Andy Shevchenko



