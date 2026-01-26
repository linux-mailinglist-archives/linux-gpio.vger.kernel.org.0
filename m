Return-Path: <linux-gpio+bounces-31083-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sEtoN2qDd2m9hgEAu9opvQ
	(envelope-from <linux-gpio+bounces-31083-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 16:08:26 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E42389EE9
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 16:08:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A42163002E6C
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 15:04:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13C3E23EA89;
	Mon, 26 Jan 2026 15:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hpmwqojN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9182B1EB5FD
	for <linux-gpio@vger.kernel.org>; Mon, 26 Jan 2026 15:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769439878; cv=none; b=DqnjvIdMccy4kEBoiWo+Va+j1rB1FN3V1MF7KGhnYsR8qeQQDyMzWwNeLVVhYmaMtOciJeYb2XCXDUKutJai7WRfReWrijb9MWhr2N5x0e7tyJFFQE11R+0eDsbX7x7j/D4SSh8LL14TYU3TvmVJgCQGJ8IROknRO3fog7Wnupc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769439878; c=relaxed/simple;
	bh=bBF1DYfrYyLqnkSavdVzFuDkSxHYJwB0Z89u0YaCQ14=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sBWHYF3g2tT0iaEkcqI/e3yrMG8xi+sERNL591FUbj79Kpy+/gJj9gaLH/1ftNavRrUPyf/kiD0yIpjSzYboXteVBDVPp3VsTutvudtrBQvwjDRj7sBN5l6pWnzmZDYMT68UcTa0RltH40yiFHoeujJRIVgXpEH5+cL/VMq1R/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hpmwqojN; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769439877; x=1800975877;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bBF1DYfrYyLqnkSavdVzFuDkSxHYJwB0Z89u0YaCQ14=;
  b=hpmwqojNi0EnVhZhjIvk49JPubGhlHJ8VZ9qhW6ea8vMjI2hOKnuSF3+
   EqlHdLQG7P76V0ZU/dBqbIE2u2hX4LZBlmOnUxqGyQMXbMbRXuaMMzk1O
   03zT8dfv5i6IR9zK6+vHSSdmo4Cpn6wYsfEC0TtZLycBUrbNEBlfu67ck
   qqtlsqPeevrJGk5KqAwMuic1yScieMFoql7CsctjaJAZfw8sQhXcdH8m+
   yJZw2no481WmmzR6yCjFXg7xQOyf0ymgc46ZvlxRsdh78uH3yY3u3en29
   okYhsauAKS4uwAgrvGLuNWNfvjDIkeq8ooSPWBRh3xc/Nlx2UFARLkBJ9
   A==;
X-CSE-ConnectionGUID: EQrB1P1fTiKUEjKFsOw03g==
X-CSE-MsgGUID: B7weSqF2RUCw7WKDRlOGtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="69638941"
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="69638941"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 07:04:37 -0800
X-CSE-ConnectionGUID: E+LLwsU8QVOSiAdeHIZJUg==
X-CSE-MsgGUID: 35G3VYcsQ42Xm27Hvka54g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="212242065"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa004.jf.intel.com with ESMTP; 26 Jan 2026 07:04:36 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 78EAF95; Mon, 26 Jan 2026 16:04:34 +0100 (CET)
Date: Mon, 26 Jan 2026 16:04:34 +0100
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linux pin control <linux-gpio@vger.kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [GIT PULL] intel-pinctrl for 6.20-1
Message-ID: <aXeCgo5w1YOHUKiK@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
	TAGGED_FROM(0.00)[bounces-31083-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,black.igk.intel.com:mid]
X-Rspamd-Queue-Id: 7E42389EE9
X-Rspamd-Action: no action

Hi Linux pin control  maintainers,

A small but important update to Intel pin control drivers. The main thing is
documentation fix by Raag to make users less confused about list of supported
HW. Everything was floating in Linux Next for at least a few days.


Thanks,

With Best Regards,
Andy Shevchenko

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel.git tags/intel-pinctrl-v6.20-1

for you to fetch changes up to fc32c5725fbe1164d353400389d3e29d19960a3a:

  pinctrl: intel: Add code name documentation (2026-01-24 10:56:22 +0100)

----------------------------------------------------------------
intel-pinctrl for v6.20-1

* Add Nova Lake to the list of supported platforms by platform driver
* Update Kconfig help text to clarify which drivers supports which platforms
* Convert more Intel pin control drivers to use intel_gpio_add_pin_ranges()

----------------------------------------------------------------
Andy Shevchenko (3):
      pinctrl: baytrail: Convert to use intel_gpio_add_pin_ranges()
      pinctrl: lynxpoint: Convert to use intel_gpio_add_pin_ranges()
      pinctrl: intel: platform: Add Nova Lake to the list of supported

Raag Jadav (1):
      pinctrl: intel: Add code name documentation

 drivers/pinctrl/intel/Kconfig             | 22 ++++++++++++-----
 drivers/pinctrl/intel/pinctrl-baytrail.c  | 41 +++++++++++++++++--------------
 drivers/pinctrl/intel/pinctrl-lynxpoint.c | 27 +++++++++-----------
 3 files changed, 50 insertions(+), 40 deletions(-)

-- 
With Best Regards,
Andy Shevchenko



