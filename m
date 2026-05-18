Return-Path: <linux-gpio+bounces-37063-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GRGA90cC2qiDgUAu9opvQ
	(envelope-from <linux-gpio+bounces-37063-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 16:06:21 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6B856E4BD
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 16:06:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B2C8E3020ED0
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 14:06:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95E644657F6;
	Mon, 18 May 2026 14:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cH3A8i0/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1463F6C25;
	Mon, 18 May 2026 14:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779113175; cv=none; b=XGdIxiHcXSa7idNWyXCcc1onnAn9/ILl2ocDLMMcfa3c5VOwZJ68I2ItYMhyONWPb8jKrPT9flBdoayKWi27m6h52srDDVsc/UgElIA+lbXhiyI3yyDVXAy1/QZ5LFBROXYNR+Mw3fEGy2XZeRkR9hiH9v0eFxIp2NWsNO+wfVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779113175; c=relaxed/simple;
	bh=UGWMOx4fLOilhghug0ddATpl/6Tbb/ZISs+O8GFdpsU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H72z76zEaRS7EBd9Dwc0V/qI1cpIQg3ENpnMkn+A/2JeZBvfn5UUy71oMVgSJdNd8ZXqb2+MIalYIN7j6aZExBHgb5Ifm0Wmjqkarzw/98BEb4t/daYI849laGtY6U0RQQ2APBlE/YI+zVL04hubEhuWQPpn+CeeIbfPxE4+bpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cH3A8i0/; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779113173; x=1810649173;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=UGWMOx4fLOilhghug0ddATpl/6Tbb/ZISs+O8GFdpsU=;
  b=cH3A8i0/gANJoC+tvZ5X3ne7IBdbrPpa2fVuNa6OIgsUvzLF7UD7lJtf
   9xudyezolZd10Zj/V7W7+wmEO2nWcM8gJ7LxIt1H16tp0RSquti4ZTlFa
   Sif/BMWGLJpZ5eOU7mzNZLA2C9JJOrDkoOXkedQh+aIpbNhkRUut03CYA
   d/+hTGYGhJAL4XB2djvhbPgH7OTfd71hyyEColn41YoQPmAx5idu/ZA3b
   V9uAjuYrCz+3LC7U22ffPJRqgMCEfyLIJnVx6X9RljvOB4X40iLFG4T3z
   CkUfDGjr6wLw5sz3DVBSbK/n2LjDVHozwIJ579MhDcNdOcD4aO6KYf5aU
   A==;
X-CSE-ConnectionGUID: j2+r941fSvOLCIJE38Ahdw==
X-CSE-MsgGUID: DNY/vnwlRhGBfaQMrpFV+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="91358432"
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="91358432"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 07:06:12 -0700
X-CSE-ConnectionGUID: +bLi7U9DQoe7sAIREfyZEQ==
X-CSE-MsgGUID: g5wJBE+LReKAWG2fpR4PLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="238569973"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.244.3])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 07:06:10 -0700
Date: Mon, 18 May 2026 17:06:08 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Hardik Prakash <hardikprakash.official@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
	linux-gpio@vger.kernel.org, wsa@kernel.org,
	mario.limonciello@amd.com, basavaraj.natikar@amd.com,
	linus.walleij@linaro.org
Subject: Re: [PATCH v4 1/1] i2c: designware: fix probe ordering for AMD GPIO
 on Lenovo Yoga 7 14AGP11
Message-ID: <agsc0NoznnVtclk0@ashevche-desk.local>
References: <20260518071816.26629-1-hardikprakash.official@gmail.com>
 <20260518071816.26629-2-hardikprakash.official@gmail.com>
 <CAMRc=Me8ieVzXojZ=eNhBPvjjmT5gc6hJXnpC8Bc6WofDbXP4A@mail.gmail.com>
 <CANTFpSU_Ba1c_R9wbjSSqnc1+_vBMAOKDvD=EVtct8hWU+Dxqw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANTFpSU_Ba1c_R9wbjSSqnc1+_vBMAOKDvD=EVtct8hWU+Dxqw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37063-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,intel.com:dkim,ashevche-desk.local:mid]
X-Rspamd-Queue-Id: 1A6B856E4BD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 18, 2026 at 05:55:02PM +0530, Hardik Prakash wrote:
> On Mon, May 18, 2026 at 16:24, Bartosz Golaszewski wrote:
> > The patch looks fine but I too would prefer this to be handled at a
> > higher-level. If we know which ACPI devices we're waiting for and what
> > the ordering should be - is it possible to somehow setup the devlink
> > for the platform devices that will be the children of these ACPI
> > devices?
> >
> > If that can't be done, I'm fine with this as a workaround.
> 
> I checked the DSDT and the kernel's ACPI dependency mechanisms. The
> DSDT has no _DEP object linking AMDI0010:02 to AMDI0030:00, so there
> is nothing for fw_devlink to act on. The GpioInt resource is on the
> touchscreen device (TPNL/WACF2200), not on the I2C controller itself.
> 
> Setting this up at the ACPI layer would require either a firmware
> change to add _DEP, or a DMI quirk in the ACPI scan path to synthesize
> the dependency — which would be equally quirk-based as the current
> approach, just in a different driver.

Don't we have already force and ignore lists for _DEP somewhere in the
drivers/acpi/?

> I'll send v5 with your two style fixes applied.

-- 
With Best Regards,
Andy Shevchenko



