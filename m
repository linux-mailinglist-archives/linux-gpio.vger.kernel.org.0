Return-Path: <linux-gpio+bounces-31031-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBqkD4WAdGlW6QAAu9opvQ
	(envelope-from <linux-gpio+bounces-31031-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Jan 2026 09:19:17 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A987CF81
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Jan 2026 09:19:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1AAE8300404F
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Jan 2026 08:19:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6908927874F;
	Sat, 24 Jan 2026 08:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fUzx5NjL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0895517A2FA;
	Sat, 24 Jan 2026 08:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769242744; cv=none; b=uwmfd8elR2EBh3d093cKNPUNaWGHuzklC4YSMYxrALnpdY3UI/V486BHTPUDtjLs+p1sPXKDuLqL8vOzNY9A+QVgXswrd5vZXs7RcbJvtVjx9FWdhD7WBzbHgiYa+cwJWwTWDzoMGiPMgVV0Sukjwo60teZCLA/8H2tqRDsmP8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769242744; c=relaxed/simple;
	bh=AMnH0QtFjl3n/0xsDWzwFyQgEa0rGMigQfdlStwAhsQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MitselP41UtRC8hzRBolTEwKyp2VYf0X3+vhhoWER7N4PPcdhRhwTytagLdBLYbiqEW3wV8SIO2AIlI9x5c7BxG7qE6IdfUPyko0MTcwDKcKm2BMckMf568ydlzWw7EI9Wtq/fRfrSGdu3zJpiOTSXhlilhiLElqceOd5a+C+M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fUzx5NjL; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769242742; x=1800778742;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=AMnH0QtFjl3n/0xsDWzwFyQgEa0rGMigQfdlStwAhsQ=;
  b=fUzx5NjLFcz4v2cBanQGmGc/yBrp09uadY9mHTti4rqncxOEAGeIBiZt
   8Su+xeafUVhs6QbUVWzFVBEaJAO0tVWmtfWQIg+m/wTio6Bo9DMOidFMG
   H4imXR67eFpWxCivwUWFibUvGmV84Ic9XofT3+469O6TldFULxMubpNbl
   jEoRGJra4xtS6EDWeofUr6+1jmCTLcSNv/a8xE5mEq1YBu87MlwtQn4L0
   eV+D0J7OkXjPJLhZEWHR6vW+BUdxIpilaTlci/BhTcSoOMH7FWB3lnFVY
   da9tO8B+k1ciirZeWgxIhIO0DPOf9GbVpgGJFHsVlw+iwME6SAnn0lP70
   Q==;
X-CSE-ConnectionGUID: StPNTSXqRY2ivROh/2lXHw==
X-CSE-MsgGUID: HnCttpD5Ri6dEVz2uaI5ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="73071389"
X-IronPort-AV: E=Sophos;i="6.21,250,1763452800"; 
   d="scan'208";a="73071389"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2026 00:19:02 -0800
X-CSE-ConnectionGUID: AeE2BLTaTQ2CA0g+ri4oNw==
X-CSE-MsgGUID: BI1AguuFQz27+rUamKlAOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,250,1763452800"; 
   d="scan'208";a="207125896"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
  by fmviesa006.fm.intel.com with ESMTP; 24 Jan 2026 00:18:59 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: andriy.shevchenko@linux.intel.com,
	mika.westerberg@linux.intel.com,
	linusw@kernel.org
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Raag Jadav <raag.jadav@intel.com>,
	stable@vger.kernel.org,
	Guido Trentalancia <guido@trentalancia.com>
Subject: [PATCH v2] pinctrl: intel: Add code name documentation
Date: Sat, 24 Jan 2026 13:44:54 +0530
Message-ID: <20260124081708.1141884-1-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31031-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[raag.jadav@intel.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[intel.com:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,trentalancia.com:email,intel.com:email,intel.com:dkim,intel.com:mid]
X-Rspamd-Queue-Id: 39A987CF81
X-Rspamd-Action: no action

Intel pinctrl drivers support large set of platforms and the IPs are
often reused by their different variants, but it's currently not possible
to figure out the exact driver that supports specific variant. Add user
friendly documentation for them.

Cc: stable@vger.kernel.org
Reported-by: Guido Trentalancia <guido@trentalancia.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=220056
Signed-off-by: Raag Jadav <raag.jadav@intel.com>
Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Acked-by: Guido Trentalancia <guido@trentalancia.com>
---

v2: Also document for other similar drivers (Andy)

 drivers/pinctrl/intel/Kconfig | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/intel/Kconfig b/drivers/pinctrl/intel/Kconfig
index e4dc9ba899bd..488344f53d45 100644
--- a/drivers/pinctrl/intel/Kconfig
+++ b/drivers/pinctrl/intel/Kconfig
@@ -53,7 +53,10 @@ config PINCTRL_ALDERLAKE
 	select PINCTRL_INTEL
 	help
 	  This pinctrl driver provides an interface that allows configuring
-	  of Intel Alder Lake PCH pins and using them as GPIOs.
+	  PCH pins of the following platforms and using them as GPIOs:
+	  - Alder Lake HX, N and S
+	  - Raptor Lake HX, E and S
+	  - Twin Lake
 
 config PINCTRL_BROXTON
 	tristate "Intel Broxton pinctrl and GPIO driver"
@@ -137,15 +140,17 @@ config PINCTRL_METEORLAKE
 	select PINCTRL_INTEL
 	help
 	  This pinctrl driver provides an interface that allows configuring
-	  of Intel Meteor Lake pins and using them as GPIOs.
+	  SoC pins of the following platforms and using them as GPIOs:
+	  - Arrow Lake (all variants)
+	  - Meteor Lake (all variants)
 
 config PINCTRL_METEORPOINT
 	tristate "Intel Meteor Point pinctrl and GPIO driver"
 	select PINCTRL_INTEL
 	help
-	  Meteor Point is the PCH of Intel Meteor Lake. This pinctrl driver
-	  provides an interface that allows configuring of PCH pins and
-	  using them as GPIOs.
+	  This pinctrl driver provides an interface that allows configuring
+	  PCH pins of the following platforms and using them as GPIOs:
+	  - Arrow Lake HX and S
 
 config PINCTRL_SUNRISEPOINT
 	tristate "Intel Sunrisepoint pinctrl and GPIO driver"
@@ -160,7 +165,11 @@ config PINCTRL_TIGERLAKE
 	select PINCTRL_INTEL
 	help
 	  This pinctrl driver provides an interface that allows configuring
-	  of Intel Tiger Lake PCH pins and using them as GPIOs.
+	  PCH pins of the following platforms and using them as GPIOs:
+	  - Alder Lake H, P, PS and U
+	  - Raptor Lake H, P, PS, PX and U
+	  - Rocket Lake S
+	  - Tiger Lake (all variants)
 
 source "drivers/pinctrl/intel/Kconfig.tng"
 endmenu
-- 
2.43.0


