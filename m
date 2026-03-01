Return-Path: <linux-gpio+bounces-32357-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALayAGmuo2kmJwUAu9opvQ
	(envelope-from <linux-gpio+bounces-32357-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 01 Mar 2026 04:11:37 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 28DA31CE4CA
	for <lists+linux-gpio@lfdr.de>; Sun, 01 Mar 2026 04:11:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3B4043311F00
	for <lists+linux-gpio@lfdr.de>; Sun,  1 Mar 2026 02:02:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 430492F39C2;
	Sun,  1 Mar 2026 02:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N8GYwGIm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B32259C80;
	Sun,  1 Mar 2026 02:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772330523; cv=none; b=TPT7pgVRqSdPxP9PzhiGu+rawfnZO18IHJI8wziy4OtkLpOPIt773f02ymJ/fumhM2cN9AnyOeKTP9ivMJaGD14EdqB+5QhpOeZqOD130ZIvM42qg/mhwANpFQQRXPGOS+VKGY6XyEvvW1qRdb15GXEExLuwApRVoA0JHCCrkCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772330523; c=relaxed/simple;
	bh=OaARiU2V97zcxx5wDw3VqcFr9rDXhNBAk19csGgqDLU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CkF6TdGXL1uRaaVAxoAlIG6EogHFt4VbhLv53864Q0cGDhQARZjvxt/yf/GHpBQUKrvkAdAvLF+F/Q7syhGTnvO22rKhDUBYyJlKHDw2m9VJlzk7LQk3KVAxxir8WL92+yZOa0ctRxISZ1YEfKc58QqUNeEYCj7mqRqavKACYM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N8GYwGIm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CA37C19421;
	Sun,  1 Mar 2026 02:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772330522;
	bh=OaARiU2V97zcxx5wDw3VqcFr9rDXhNBAk19csGgqDLU=;
	h=From:To:Cc:Subject:Date:From;
	b=N8GYwGImNiCKin0lB1Cq3ceQg5zL59wVR06jdIg9XshyURuEkhd5+Z6gUPSeGziiG
	 o32Zz+xi9iaWyK6aDdvFBbXaYzvmVJ5XsHdnP9QKVwY9k7Jtfc0QWaBs93KYCvUUDX
	 MoavXTHBzbkeqzle/QfqiDFdIRhqVRgegGZRie+xnoWE6OsacnjR3KV6KB6LzLmpzZ
	 uONG1B2iz8f27PLKKsliooVht7xbkoAunJhjZ/Q0FZyQI9+zhgA+uoeyMCBWWyDTk7
	 seCLDkNRvP6A6zgHMrvfS/0f4cGvmsx+OaNf3rGXshqMSN9t4qs+h6LIZWupa47ajP
	 3qL5T0zZUF2YQ==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	raag.jadav@intel.com
Cc: Guido Trentalancia <guido@trentalancia.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org
Subject: FAILED: Patch "pinctrl: intel: Add code name documentation" failed to apply to 5.10-stable tree
Date: Sat, 28 Feb 2026 21:02:00 -0500
Message-ID: <20260301020200.1729403-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32357-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: 28DA31CE4CA
X-Rspamd-Action: no action

The patch below does not apply to the 5.10-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From fc32c5725fbe1164d353400389d3e29d19960a3a Mon Sep 17 00:00:00 2001
From: Raag Jadav <raag.jadav@intel.com>
Date: Sat, 24 Jan 2026 13:44:54 +0530
Subject: [PATCH] pinctrl: intel: Add code name documentation

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
[andy: added Oxford comma]
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/Kconfig | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/intel/Kconfig b/drivers/pinctrl/intel/Kconfig
index e4dc9ba899bde..04c3a5b581f3c 100644
--- a/drivers/pinctrl/intel/Kconfig
+++ b/drivers/pinctrl/intel/Kconfig
@@ -53,7 +53,10 @@ config PINCTRL_ALDERLAKE
 	select PINCTRL_INTEL
 	help
 	  This pinctrl driver provides an interface that allows configuring
-	  of Intel Alder Lake PCH pins and using them as GPIOs.
+	  PCH pins of the following platforms and using them as GPIOs:
+	  - Alder Lake HX, N, and S
+	  - Raptor Lake HX, E, and S
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
+	  - Alder Lake H, P, PS, and U
+	  - Raptor Lake H, P, PS, PX, and U
+	  - Rocket Lake S
+	  - Tiger Lake (all variants)
 
 source "drivers/pinctrl/intel/Kconfig.tng"
 endmenu
-- 
2.51.0





