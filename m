Return-Path: <linux-gpio+bounces-32352-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iM0zHJ6do2k3IQUAu9opvQ
	(envelope-from <linux-gpio+bounces-32352-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 01 Mar 2026 02:59:58 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E17601CC8C2
	for <lists+linux-gpio@lfdr.de>; Sun, 01 Mar 2026 02:59:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8B4B431DFFF8
	for <lists+linux-gpio@lfdr.de>; Sun,  1 Mar 2026 01:43:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 346672D837E;
	Sun,  1 Mar 2026 01:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="de/vmyz4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAEB92C1788;
	Sun,  1 Mar 2026 01:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772329417; cv=none; b=JO1VkmbjHcGVcBFMijdsL5EQZH1oJGw2r8dEF4v5OO0yoy+p4GTGeCFMPs47lz7oA6HiioDU2h0kx1hxXCBUiXBamU+DzGsADSMSc1G3xMIToT8t696Bheom62rBCMFgSGSCKQBH0lPgjOQ5eyHASdOq8pCJ7LnNK8BNnndh0+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772329417; c=relaxed/simple;
	bh=IXWbr2BmcSQaRJ+ruuri2YRvYBnWII6PJVJxze3oYWo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=niOfGiogA4aD2ckB4bjl6OM+ostdkLA8RRP3C6+JctxUfG8x9WVSKC4xq+XNvDpWukeQF1hKhehAG8jpWMUZ5kwJmI9PVzSBGtwqPic3DfcITuIwPnv0YKJcV83Yub+sZ922YlpQNEjukskdd9V8yAWUh1OJvdzdcpf5vbIp0Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=de/vmyz4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3FB0C19421;
	Sun,  1 Mar 2026 01:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772329416;
	bh=IXWbr2BmcSQaRJ+ruuri2YRvYBnWII6PJVJxze3oYWo=;
	h=From:To:Cc:Subject:Date:From;
	b=de/vmyz4yCjC2VQbUaQ7KgdSB2As8G4ww+nx8zRya2eHUGzeGSb9twQKNazMkFYgr
	 sHwBOYPvgyj0CIDA2A/DV/IYhtWOBc2aLGnyurEyE/nrzGMxDp53hWtxbNs9dakMdS
	 KKtJmPpuHcGpWR4l29Ax/462Sbz/p51JiXf15slm4h+71NfVCM+FIIIrLAmdfz84vD
	 nnInt00TF3dQACa/OWVIx0CeoLtQfPAEdX1J8QthCcRFn1weCZazhCzx8QamP8TbmU
	 n3hmsoPxTY9MBru/lz0J7Bio16Nw70eqp46LkteKgovd9fs5jyYuc5zU1vSKz4VUrj
	 cWSuxEJc5St2Q==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	raag.jadav@intel.com
Cc: Guido Trentalancia <guido@trentalancia.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org
Subject: FAILED: Patch "pinctrl: intel: Add code name documentation" failed to apply to 6.1-stable tree
Date: Sat, 28 Feb 2026 20:43:34 -0500
Message-ID: <20260301014334.1705692-1-sashal@kernel.org>
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
	TAGGED_FROM(0.00)[bounces-32352-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,trentalancia.com:email]
X-Rspamd-Queue-Id: E17601CC8C2
X-Rspamd-Action: no action

The patch below does not apply to the 6.1-stable tree.
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





