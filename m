Return-Path: <linux-gpio+bounces-37817-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HkHDMGzLHmrWVAAAu9opvQ
	(envelope-from <linux-gpio+bounces-37817-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 14:24:12 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0AB62DFE0
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 14:24:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=e5IgM09v;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37817-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37817-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D742E305A384
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jun 2026 12:17:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E8983E51EB;
	Tue,  2 Jun 2026 12:15:41 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984EE3D6471;
	Tue,  2 Jun 2026 12:15:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780402541; cv=none; b=NUVv0J+hbK/OQZCq3hnuIISTgT97Q+Uhr+j7qcgX57bmodUYcDqyp49BFVrWXK+YxbYh4Cfx/ydBiRVhXH008dm7g7jWo+8Aj3ZzIjh+fxLVLU5MveT+B3moLgua/6ggMoUV50ZARUpPK1PG54HdqBaOxk2vbbV/3ZFW9O1twhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780402541; c=relaxed/simple;
	bh=DALm11u0DP3CuOZchTDgz8esDk71Sl3LZkAYh+SokpM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pt6s7aGJyccBnbxQDIPrTOsp1wF2EnGwk39IiqpK7x5FUXd65gXjlXFcpGHbad6ex2HPPLAXsbpE6MHMBgDfNWFd8sT1oLcLKdaaIoNpaodAbKmf0F61zMnjc1ptzhbEECkyPbiF0Q2wQupoQ9+ziVmQyWiI14BTEZUi5nUZXz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e5IgM09v; arc=none smtp.client-ip=198.175.65.11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780402539; x=1811938539;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DALm11u0DP3CuOZchTDgz8esDk71Sl3LZkAYh+SokpM=;
  b=e5IgM09vZ1SjPihLp5VYKUhLMlpDphbKWJiYSnwHM+WoyCIRPBrHz+EZ
   nT2nWmu9w8R1jlTKp6hAdZLBR6FKTRwgUHGAKSdRPqI7yt/QxdZh0aGst
   0uPc0X4fv6ZobL1f/aq/l74mWVfA0fodRpP9v5AlFQbTHv0Pt4OJ+3E5+
   vhPxW7rTgyZZTLaKdqy+XRLyVROEly8UkqM+FTl/Sq9+A8jOEZp0WfkD/
   YRTt4GBeybbji+r/C6eoY6UyjmucPUI2g8GmtW0jZaYaWk2FwgForDfVu
   OSz57L/bmMAAkZ9DM/qnCWawziSWwyzUWoiv1IQqOaZfhXeNy1Pzw4Ifg
   Q==;
X-CSE-ConnectionGUID: hSR7wQmoQjCsJJXCN9IVsA==
X-CSE-MsgGUID: UMSdTBiPSNCcu7JA1EX71w==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="91491714"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="91491714"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 05:15:38 -0700
X-CSE-ConnectionGUID: jdLtT0NPTeKWIIyumi3AFg==
X-CSE-MsgGUID: RPv7fYVBTlqHnepjq+9Xcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="248177461"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa004.jf.intel.com with ESMTP; 02 Jun 2026 05:15:37 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 001E995; Tue, 02 Jun 2026 14:15:35 +0200 (CEST)
Date: Tue, 2 Jun 2026 14:15:35 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Marco Scardovi <scardracs@disroot.org>
Cc: andriy.shevchenko@linux.intel.com, brgl@kernel.org, linusw@kernel.org,
	linux-acpi@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] gpiolib: acpi: prevent address truncation in
 OperationRegion handler
Message-ID: <20260602121535.GC2990@black.igk.intel.com>
References: <20260602113529.52570-1-scardracs@disroot.org>
 <20260602113529.52570-3-scardracs@disroot.org>
 <20260602114540.GB2990@black.igk.intel.com>
 <vzcrnFOfR861L-H21KjtDQ@disroot.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <vzcrnFOfR861L-H21KjtDQ@disroot.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37817-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:scardracs@disroot.org,m:andriy.shevchenko@linux.intel.com,m:brgl@kernel.org,m:linusw@kernel.org,m:linux-acpi@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mika.westerberg@linux.intel.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[black.igk.intel.com:mid,intel.com:dkim,vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BA0AB62DFE0

Hi,

On Tue, Jun 02, 2026 at 01:59:36PM +0200, Marco Scardovi wrote:
> Hi Mika,
> 
> On Tue, Jun 02, 2026 at 01:45:40PM +0200, Mika Westerberg wrote:
> > How in practice this can be done given that the GPIO resource has only 2
> > bytes for the index?
> 
> The 2-byte limitation is in the GPIO resource descriptor representation of the 
> pin table, not in the ACPI address space handler interface itself.
> 
> The acpi_gpio_adr_space_handler() receives the access offset as a 64-bit 
> acpi_physical_address from ACPICA. This value is generated when AML
> accesses a Field within the GPIO OperationRegion, and it is not constrained
> by the GPIO resource descriptor's pin_table_length.

Yes, but you access it from AML like this:

Field(\_SB.GPI2.GPO2, ByteAcc, NoLock, Preserve)
{
	Connection (GpioIo(Exclusive, PullUp, , , , "\\_SB.GPI2") {7}),
	STAT, 1,           // e.g. Status signal from the device
	Connection (GpioIo (Exclusive, PullUp, , , , "\\_SB.GPI2") {9}),
	RSET, 1            // e.g. Reset signal to the device
}

In other words it still uses GPIO resource descriptor (so 2 bytes per pin),
nothing else is accepted as far as I understand.

The example is here: 

https://uefi.org/specs/ACPI/6.5/05_ACPI_Software_Programming_Model.html#declaring-generalpurposeio-fields

