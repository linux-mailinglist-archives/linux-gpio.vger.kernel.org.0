Return-Path: <linux-gpio+bounces-30775-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gEf/M6gScGlyUwAAu9opvQ
	(envelope-from <linux-gpio+bounces-30775-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 00:41:28 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED464DFBA
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 00:41:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id EE6AA5E90C6
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jan 2026 11:03:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E97E413232;
	Tue, 20 Jan 2026 11:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m48fQEcT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2766C39903F;
	Tue, 20 Jan 2026 11:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768906991; cv=none; b=mtS4et+oygB0Lhn7Ln7yfaM+BimYu+IbOm8xUxbwpyBNizYO/T7XBVr1QAg04QiU/ta+Jl6UyEGDgK8YPucVeA/xIdKu0BeOdczc9++13JbRh2MjgkjrROQviUslDNU2vA/IUjPhkmkjX2IpUrJUjluYeFv4vtlhG66ktInLQNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768906991; c=relaxed/simple;
	bh=MOlVYHiV8U/xnwdcg+LjR5LC2vh7h/sh+K0ucqRyMF0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ubIXCsgWmBnMBS40zeqoJ5qQkF3+n7NSoO3nOBZn+OayU35anU2IEU8jUFRGyUVBkTm5SwyvcYGveC7BT046ptOHpfxCd5ep1yTKg4FabPIYDDdsAFV+2DlN0SOtAxogxaqAnNM+Ua2pV4BwuWMlMfNHQFcDnaThTL5pJ6BdMQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m48fQEcT; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768906990; x=1800442990;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=MOlVYHiV8U/xnwdcg+LjR5LC2vh7h/sh+K0ucqRyMF0=;
  b=m48fQEcT+QPF47qG3MX38vTjj6IjppqXP95G7RPGx6kWNRQxTD0ASCPX
   zjnzKL8KMFwZfBmkpwtDzsoT3gVDPQ11oC4jrYUUEIrKyPYVFe3CB58m3
   d+6Q2jkVPJVx/9yYUJ1wkzJWl5wYAiCZ+Mb8LPjr1g+UWWkFksLaOaEDE
   Wl0RUAVygCrCEf/1sddyLXPZs90AJSXevY9dP33ziTBsR2R1Xg3DEvxGw
   gO2vtGyAejworRNrhjZWPre1nzcQKwcIM7NUPwh/okU3FLbjTGCw3aY1C
   mBRBYoZw5p1IibqroOKMsQ7NTJaNh6hrzgzqBQZ+sTifqthMSJ5yTnkNO
   A==;
X-CSE-ConnectionGUID: aaH+Ms/9RvO8mDow1xWXTg==
X-CSE-MsgGUID: mLfRMpigQDymplDHuSj7tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="70083855"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="70083855"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 03:03:10 -0800
X-CSE-ConnectionGUID: AAuJRWxgR9ieh6HtNe8Hkw==
X-CSE-MsgGUID: 6F0HU8VTSqaAGMae1wFccg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="210237476"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
  by orviesa003.jf.intel.com with ESMTP; 20 Jan 2026 03:03:07 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: andriy.shevchenko@linux.intel.com,
	mika.westerberg@linux.intel.com,
	linusw@kernel.org
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Raag Jadav <raag.jadav@intel.com>,
	stable@vger.kernel.org,
	Guido Trentalancia <guido@trentalancia.com>
Subject: [PATCH] pinctrl: tigerlake: Add Alder Lake-P documentation
Date: Tue, 20 Jan 2026 16:30:42 +0530
Message-ID: <20260120110042.1021199-1-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.46 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	TAGGED_FROM(0.00)[bounces-30775-lists,linux-gpio=lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[intel.com,none];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_NEQ_ENVFROM(0.00)[raag.jadav@intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,intel.com:email,intel.com:dkim,intel.com:mid]
X-Rspamd-Queue-Id: 6ED464DFBA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Intel Alder Lake-P PCH reuses pinctrl IP from Tiger Lake-LP. Add user
friendly documentation for it.

Cc: stable@vger.kernel.org
Fixes: 0e793a4e2834 ("pinctrl: tigerlake: Add Alder Lake-P ACPI ID")
Reported-by: Guido Trentalancia <guido@trentalancia.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=220056
Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/pinctrl/intel/Kconfig | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/intel/Kconfig b/drivers/pinctrl/intel/Kconfig
index e4dc9ba899bd..045651fde31f 100644
--- a/drivers/pinctrl/intel/Kconfig
+++ b/drivers/pinctrl/intel/Kconfig
@@ -160,7 +160,9 @@ config PINCTRL_TIGERLAKE
 	select PINCTRL_INTEL
 	help
 	  This pinctrl driver provides an interface that allows configuring
-	  of Intel Tiger Lake PCH pins and using them as GPIOs.
+	  PCH pins of the following platforms and using them as GPIOs.
+	  - Tiger Lake
+	  - Alder Lake-P
 
 source "drivers/pinctrl/intel/Kconfig.tng"
 endmenu
-- 
2.43.0


