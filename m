Return-Path: <linux-gpio+bounces-36902-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QCkKBUHvBmr1owIAu9opvQ
	(envelope-from <linux-gpio+bounces-36902-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 12:02:41 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2C054CF1D
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 12:02:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9004330DFB69
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 09:37:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B032D43DA29;
	Fri, 15 May 2026 09:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fRwvrri6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9D843CEFD;
	Fri, 15 May 2026 09:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778837846; cv=none; b=kUFah3bOyBvAOmYVUdPpPlkdDgqQsrZPCoN39ZYPZKYIDOPBf5oByoQDPdaJNc3jGggXc7LBcxMujherl22jaNJNu98ddc7nUMLCenJIHxBFU8cmoqU42pn1ztxgp2mJJvhtYnojYiZM6QQTmtQ0M5uZu4S9cDq054eiwEQzpk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778837846; c=relaxed/simple;
	bh=gG1ywkBAjUlB4a2tbjQaAGvh8uGthSIzxehw/CPcnmI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iW8Lgtqhba8PfyiXlLD8uDxXk0FkUa5dZJpyA3sv4HaRAMni+9j2DBkaBC6MVx+Q8vXDEtRH+bUMwjaxpe9QNEMrauTT3/PFSjPHTM3WwHQ0Zws01xi7B8EBIKfWBrjHDknDiCtCiF3JdTOMl9SFRjuW+bVSTg8EujpjIdE6Mkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fRwvrri6; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778837845; x=1810373845;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=gG1ywkBAjUlB4a2tbjQaAGvh8uGthSIzxehw/CPcnmI=;
  b=fRwvrri6WErvcNwtcH3sEBqmF98Gp6rl2PMAWEShd+pyVeqylUxPc7Gb
   Qgy5Y8T+Ibl+0T9542ItYJ5a1utOrpbhBsv2V+ZKgpGxSCthzycwvnivt
   GZtcOvU7zw2t0PvyBTJef0shlLCam1HXr2xOcuHYOmGEEVJGSVgmtTAcw
   5cdZLZ3Yezqn/47ngFDk9tfCohD1EU6Q3TpJDn5/hEiHNKsweaDSIh+i4
   N126s0Kj14z/uOWs1OHT2rbw10rEJEv5E0/h55oqrh4C1hevot+p9hwBh
   7XxBoAN5KDGP0Woa+/DJpBV9MZGOzhu3r045N7ba2nQEV+DyGKBKHNSuX
   g==;
X-CSE-ConnectionGUID: miQJ9NzTT7e6Lh5yPHwQwg==
X-CSE-MsgGUID: /J4YWQ3rQbCGvFv9oQhcbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="83646981"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="83646981"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 02:37:22 -0700
X-CSE-ConnectionGUID: TF1+n6K5RLa015PSiiEdqQ==
X-CSE-MsgGUID: lUkwBfkNQEmqV7zNXB4i4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="238759700"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.33])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 02:37:13 -0700
Date: Fri, 15 May 2026 12:37:11 +0300
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
Subject: Re: [PATCH 0/3] Add LECARC ACPI IDs for DesignWare GPIO, SPI, I2C
Message-ID: <agbpR8z9kNIUInla@ashevche-desk.local>
References: <20260514024014.3376511-1-thomas_lin@lecomputing.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260514024014.3376511-1-thomas_lin@lecomputing.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Queue-Id: 8E2C054CF1D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36902-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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

On Thu, May 14, 2026 at 10:40:09AM +0800, thomas wrote:

This is a v2 of the series (Mark commented on the wrong one AFAICS), please
make sure you do proper versioning and changelog is provided.

> This patch series adds ACPI identification for LECARC SoCs that
> integrate Synopsys DesignWare peripherals.
> 
> LECARC platforms use the following ACPI HIDs:
> - GPIO: LECA0001 (V1 register offsets)
> - SPI:  LECA0002 (requires custom init function)
> - I2C:  LECA0003
> 
> The patches are independent but share a common dependency on the
> ACPI description file (drivers/acpi/acpi_apd.c) for SPI and I2C.
> To avoid merge conflicts, they are submitted as a single series
> with the following order:

> Patch 1: gpio: dwapb – add LECA0001 to dwapb_acpi_match[].
> Patch 2: spi: dw-mmio – add LECA0002 and dw_spi_lecarc_init(),
>          plus corresponding entry in acpi_apd.c.
> Patch 3: i2c: designware – add LECA0003 to dw_i2c_acpi_match[],
>          plus corresponding entry in acpi_apd.c.

You have to fix your SoB. There should be your real name and not an alias.

> All changes have been tested on LECARC evaluation board with
> kernel v7.0.0-rc6. No regressions observed on existing hardware.

Otherwise I can confirm that LECA is officially registered ACPI vendor ID and
the IDs look legit (it's up to the company to map the device ID parts to
whatever devices they have properly).

When you address the SoB and other comments, I ack them.

-- 
With Best Regards,
Andy Shevchenko



