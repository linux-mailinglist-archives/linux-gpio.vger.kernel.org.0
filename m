Return-Path: <linux-gpio+bounces-36428-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKkBBUl+/WnnegAAu9opvQ
	(envelope-from <linux-gpio+bounces-36428-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 08 May 2026 08:10:17 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 803154F242B
	for <lists+linux-gpio@lfdr.de>; Fri, 08 May 2026 08:10:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EF701309B888
	for <lists+linux-gpio@lfdr.de>; Fri,  8 May 2026 06:04:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DF50347518;
	Fri,  8 May 2026 06:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RzqPl2K6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029BF3537C7
	for <linux-gpio@vger.kernel.org>; Fri,  8 May 2026 06:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778220247; cv=none; b=V9NN+5UR+tPcWRH1Hhl8oBHGdqYSx3zmdGi+fFO9i4ku1aHNUfiMZ4VlvBq1qyM9RcEYagbGY0Wx1G4CfPJ+pVkuba3XJUIw4r4rXej3kqxx15Mb6Wm2I7zRWJTicYBxojg4xPGuhlCdahq20vr1WyksYeQM0xYqoE8bFtxQ/3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778220247; c=relaxed/simple;
	bh=ha+Myc3+RQ2XdM0knSj3ZEXZZwjIhTDQ2c1+8gSfVdg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Np0no1ymCowtHsnYr448L2z1mnJlxtlwzvmzCOugNYoraT5Gwia9lDH2xykplpR8BeQZ6zdqlFazCayqu0PUASoqr9Umb+4EXYK7rT+RdcTKpCzYITBU6lEXya7ENyQPtzwk4VzDitWQzpzke6TDgccFVv5pVeqamYUIgKQW3CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RzqPl2K6; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778220242; x=1809756242;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ha+Myc3+RQ2XdM0knSj3ZEXZZwjIhTDQ2c1+8gSfVdg=;
  b=RzqPl2K6TJP5DDE0/T6nK7Q2v1oAqtyAbttTtq/vl7Xbh5qNAn3/1N5E
   tX2zZniGhZgB7qca9qwtl20lhBLafYn2mJjQfoXHIsPk4EWF1Psu41bh+
   PGk0uSghzctkgednynj5gOipfjo5644IsDQp3hKJooFOWFZkhYksz/iqi
   wvs0IiLbAaCkTLMdHsGEU382UzqfCHVnAqiDOZzJaiLsNYdUOQW7vxYOg
   YeidV2f8/IoU0BMPutBhpB3QM7a1nWk8HS9IC1KhY/42EpLYRqvmxhzsR
   iURbgVeH/EB+QRwUg2YClzTfm+N0Bak5/022wXCVtP6vdsxsGr0lc4AVL
   Q==;
X-CSE-ConnectionGUID: TmAjN5Q2RjmxOWU+cA/vgQ==
X-CSE-MsgGUID: rGrf2FYzTxWDKxk2BhN2mQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="79290310"
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="79290310"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 23:04:00 -0700
X-CSE-ConnectionGUID: T01xFDVaTN2d7wUcI42uOg==
X-CSE-MsgGUID: QG2z3RZARwSTUgQ4iynGCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="236925493"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa007.jf.intel.com with ESMTP; 07 May 2026 23:03:59 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 544C598; Fri, 08 May 2026 08:03:57 +0200 (CEST)
Date: Fri, 8 May 2026 08:03:57 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linux GPIO <linux-gpio@vger.kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Andy Shevchenko <andy@kernel.org>
Subject: [GIT PULL] intel-gpio for 7.1-1
Message-ID: <af18zdP5HF3_P9Vo@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Rspamd-Queue-Id: 803154F242B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36428-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi Linux GPIO  maintainers,

A single fix for ACPI interrupts handling on boot. Have been in Linux Next for
a while without reported regressions. Please, pull for the current, v7.1 cycle.

Thanks,

With Best Regards,
Andy Shevchenko

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel.git tags/intel-gpio-v7.1-1

for you to fetch changes up to 3bb62e3f99a557d257e5f5a803200051b7de3afa:

  gpiolib: acpi: Only trigger ActiveBoth interrupts on boot (2026-04-29 15:47:02 +0200)

----------------------------------------------------------------
intel-gpio for v7.1-1

* Only trigger interrupts that defined ActiveBoth in ACPI on boot

----------------------------------------------------------------
Mario Limonciello (1):
      gpiolib: acpi: Only trigger ActiveBoth interrupts on boot

 drivers/gpio/gpiolib-acpi-core.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

-- 
With Best Regards,
Andy Shevchenko



