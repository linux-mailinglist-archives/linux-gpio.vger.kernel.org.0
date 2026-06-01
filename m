Return-Path: <linux-gpio+bounces-37758-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EB/tM7BlHWqwaAkAu9opvQ
	(envelope-from <linux-gpio+bounces-37758-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 01 Jun 2026 12:57:52 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFE261DFB3
	for <lists+linux-gpio@lfdr.de>; Mon, 01 Jun 2026 12:57:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 22F203009CFF
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Jun 2026 10:57:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C798C39DBCF;
	Mon,  1 Jun 2026 10:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fywMzrkn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7304438D6AD
	for <linux-gpio@vger.kernel.org>; Mon,  1 Jun 2026 10:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780311468; cv=none; b=Oie1DuoZXp5Gn1OhViI5I3fw9Gp7hzG0hAiI4FUS+Kj0lsPzSXs/glmqwSqaknw1VRsznDrvzwWdWgYDhp2Tb6vZnPKM3oEklNHpwHun++Ex4EsiWTfvQ+Q3qFeb5d3WMJB6R+9kKbvwEOSgLIn2HIOq3MoAV8m6na/E6gaIQbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780311468; c=relaxed/simple;
	bh=vCurQUndleDK5XtXIdBJ1dAuH2Q3hMPjns7dgBUaNVs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TwX4avF3odd4OX34SsZlk+RG1HofBPA5reXD/g3YaHv8foSEMR78qnABH938YqayIe6mfJaSC4vx1xubUFoNp6vt8NYncjmubzf18GWCD7rZPLN7blTYCogR86f7t1AYd1krdNRE2ufkVxLqEWYC1RQYkEy2igoLcEUw3KJo7Bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fywMzrkn; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780311467; x=1811847467;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vCurQUndleDK5XtXIdBJ1dAuH2Q3hMPjns7dgBUaNVs=;
  b=fywMzrknquUeD2gEkQ3MAiZ3On3kmB2QXWMuSu4mki6Kvo8UU1pPqN3+
   NNAk7TtpRSG4tFM8DY6iQ8E31FpQ6a7T7G78HxG76LtSmdQx2PmD9n5l3
   rQtzo0qZcailUiHmR+fpa2DSRnR4AjcoFuXrzcnfCqC27NfZ0+ZNo/Axr
   lHksozqB69/S94OZyI9w28ROkhePDOrHksrMMNe9kiqUTeRkxlOOz/BZw
   0o5jDWpYJlrZHxH8qg0qpLaoMVO89+FzUX0yeMxCzBIPJ+QyKx52l9Sh+
   rYtmgwzfQZTlaVY+C8Djje+Fe0Og0ebgTcQdT7C0M56V5/JmMSL0j6Y8I
   A==;
X-CSE-ConnectionGUID: 6Y5dVATDS7aniw2FEopdRw==
X-CSE-MsgGUID: /XD7yqDTTq++mj/a7xW7PQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="80099471"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="80099471"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 03:57:47 -0700
X-CSE-ConnectionGUID: ZYxdRy6DQ5CAnqGUVlcwFw==
X-CSE-MsgGUID: OuJSlqiPQfetVHQFLHTMNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="267185975"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa002.fm.intel.com with ESMTP; 01 Jun 2026 03:57:46 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 029F595; Mon, 01 Jun 2026 12:57:44 +0200 (CEST)
Date: Mon, 1 Jun 2026 12:57:44 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linux pin control <linux-gpio@vger.kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Subject: [GIT PULL] intel-pinctrl for 7.2-1
Message-ID: <ah1lqC1yscn5x5dN@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37758-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 7AFE261DFB3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Linux pin control  maintainers,

A tiny development in Intel pin control area. A single patch that has been in
Linux Next for a couple of weeks without reported issues. Please, pull.

Thanks,

With Best Regards,
Andy Shevchenko

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel.git tags/intel-pinctrl-v7.2-1

for you to fetch changes up to 2b9ef70d3abe1eaa9b37253fd7765cf40ff2a5ad:

  pinctrl: intel: move PWM base computation past feature check (2026-05-18 09:01:17 +0200)

----------------------------------------------------------------
intel-pinctrl for v7.2-1

* Tidy up the PWM base computation to avoid false positive *SAN warnings

----------------------------------------------------------------
Stepan Ionichev (1):
      pinctrl: intel: move PWM base computation past feature check

 drivers/pinctrl/intel/pinctrl-intel.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

-- 
With Best Regards,
Andy Shevchenko



