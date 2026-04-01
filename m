Return-Path: <linux-gpio+bounces-34563-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kOZwCVBBzWkkbAYAu9opvQ
	(envelope-from <linux-gpio+bounces-34563-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Apr 2026 18:01:20 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E3637D969
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Apr 2026 18:01:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 303E3317EC0C
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Apr 2026 15:35:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E24C437C926;
	Wed,  1 Apr 2026 15:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jeLPA09+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A84314B62
	for <linux-gpio@vger.kernel.org>; Wed,  1 Apr 2026 15:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775057719; cv=none; b=bioY/7mKMH4VMtRwhy+Sph4n0rEw5CnlJswBFKyVq2gIchrhgttPfDZiryEbXu3JkhXbRD64/n58F9jptl4gKfE8m9qsjRbcXDC4BTfKzMcTxfaYZphd2PjoNWQlAbKRhQ+DbnnNkZIUB3jAYko2uyVIWa7U0CHsZhtPBFldLpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775057719; c=relaxed/simple;
	bh=LT5QEL6hP1MS65VYkO2ppS81HniHkoDD6UYgtYqdlfo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xibp+hBaMkSzM6nBauaw8xjlwjmQOmL+AFdiQV0JV2ASnOM8WLCcIvSyBnp1cFJpBxfGwyLqsZIB40Ujrc05l2tdqLEjVkZ0gLO6THVnuWEOeZkZtV4YuE+3V1ADLc4oPFtVaZDZxO1bTAcDr73vm3nRD5s85LrDsPUul+P9lrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jeLPA09+; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775057718; x=1806593718;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LT5QEL6hP1MS65VYkO2ppS81HniHkoDD6UYgtYqdlfo=;
  b=jeLPA09+3B7xEuY3pReNYiGj5d1hOaYH+UZd9lntE2+3waTLnNbfpu8S
   8bF1wO54QXPUNpXYTAQ4tv3zfxvBen3uMqh5Iq5g1B70k7Lwvvd6gC9kN
   rhwl68mfcubmL93DCH5lrDbKSsvL54eqEoA5g/wznzr4pYFaY8H4ag0e2
   oBaLNQDYwx0Pl7/Q/SUNjc4cxHRJXLt0G/OEMBC6yu36r/HsUVt6F/6uM
   bBdmR9vfuOI1DobeXisOES8ZA3gyoIGLKDYuUAOL6RGkeIQwRLu4EfWT4
   JFlQAZ9PNPvMerDUjepXLOJwzGRDWrLgc6qWCTAZZsjrh+7glhkX4Q1di
   Q==;
X-CSE-ConnectionGUID: iLHeUK31Sia7rkLeCebATg==
X-CSE-MsgGUID: jsYqhWQLSfaUWkrVshsjMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="78692072"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="78692072"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 08:35:17 -0700
X-CSE-ConnectionGUID: BdIFe/0yQnuif7lRC34fAg==
X-CSE-MsgGUID: wQ13TfqlSOG4/eeKTCKYsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="231654635"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa005.jf.intel.com with ESMTP; 01 Apr 2026 08:35:16 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 3F82098; Wed, 01 Apr 2026 17:35:14 +0200 (CEST)
Date: Wed, 1 Apr 2026 17:35:14 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linux pin control <linux-gpio@vger.kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Subject: [GIT PULL] intel-pinctrl for 7.0-2
Message-ID: <ac07MgfZtcVG-zQ3@black.igk.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34563-lists,linux-gpio=lfdr.de];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[intel.com:query timed out];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,black.igk.intel.com:mid]
X-Rspamd-Queue-Id: B0E3637D969
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Linux pin control  maintainers,

A few fixes to the generic Intel pin control driver. These have been
for a couple of weeks in Linux Next without reported regressions.
Please, pull for this, v7.0 cycle.

Note, they don't have the Fixes tags, but since we declared Nova Lake
support already in v7.0, it will be really nice to have this PR applied
to the current cycle as fixes.

Thanks,

With Best Regards,
Andy Shevchenko

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel.git tags/intel-pinctrl-v7.0-2

for you to fetch changes up to 1ca468e78ea97c3365befdd408f71bda4b295134:

  pinctrl: intel: Enable 3-bit PAD_OWN feature (2026-03-19 07:58:53 +0100)

----------------------------------------------------------------
intel-pinctrl for v7.0-2

* Fix 1kOhm, debounce, and PWM capability support
* Add support for new PAD_OWN layout

----------------------------------------------------------------
Andy Shevchenko (3):
      pinctrl: intel: Improve capability support
      pinctrl: intel: Fix the revision for new features (1kOhm PD, HW debouncer)
      pinctrl: intel: Enable 3-bit PAD_OWN feature

 drivers/pinctrl/intel/pinctrl-intel.c | 36 +++++++++++++++++++++++++----------
 drivers/pinctrl/intel/pinctrl-intel.h |  1 +
 2 files changed, 27 insertions(+), 10 deletions(-)

-- 
With Best Regards,
Andy Shevchenko



