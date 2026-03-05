Return-Path: <linux-gpio+bounces-32539-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EEsjDqBIqWnw3gAAu9opvQ
	(envelope-from <linux-gpio+bounces-32539-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Mar 2026 10:10:56 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B52A720E0C0
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Mar 2026 10:10:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B5697312C75D
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Mar 2026 09:05:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FD15377039;
	Thu,  5 Mar 2026 09:05:18 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76BE4377EDE;
	Thu,  5 Mar 2026 09:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772701518; cv=none; b=CvGTvSfniESg/AVP/or6kv/kt47INMrpIMX+5SsyT7fxVlSTp1IAQoQvlAxbMeuhxBM7TnmCTpQ72ujHWGzbSD+Zh0Np5hUsmHd3ePXqeCXx9JB8ADx5exElnHoQgUUZ5S+eOTwePlpzp0TucmW7R0tRxtVGU5DbW399yrock3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772701518; c=relaxed/simple;
	bh=N8fts9LMnCE1UC5jbqujvOELhIZP25Ky0sIJSBG71kQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RDBsKhfD7XfsbLNmGeVDFpxAJIvYxnwG4yEIyQaniQOtaQBhysWDfFbeP9s9q8+pIyccj68PuA3nmk7PTQqEn0PX+YEr1liAJhiqtZasexbDErRDanJgQ11+7ZaaZ7yUQNFBBlIdu4Wy5gUUHh9JATzNo34ovHKPwEOejJl5A2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA162C19425;
	Thu,  5 Mar 2026 09:05:15 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Linus Walleij <linusw@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP S32 Linux Team <s32@nxp.com>
Cc: linux-gpio@vger.kernel.org,
	arm-scmi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] pinctrl: imx: PINCTRL_IMX_SCMI should depend on ARCH_MXC
Date: Thu,  5 Mar 2026 10:05:12 +0100
Message-ID: <d5aff6931bbc95a16f049163c682ad08d1f0f04b.1772701307.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: B52A720E0C0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[glider.be];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32539-lists,linux-gpio=lfdr.de,renesas];
	FREEMAIL_TO(0.00)[nxp.com,gmail.com,kernel.org,arm.com,pengutronix.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[geert@glider.be,linux-gpio@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.808];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,i.mx:url,glider.be:mid,glider.be:email]
X-Rspamd-Action: no action

i.MX95 SCMI firmware is only present on NXP i.MX94 and i.MX95 SoCs.
Hence add a dependency on ARCH_MXC, to prevent asking the user about
this driver when configuring a kernel without NXP i.MX SoC family
support.

While at it, relax the dependencies on ARM_SCMI_PROTOCOL and OF when
compile-testing.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Drop Fixes tag,
  - Relax dependencies on ARM_SCMI_PROTOCOL and OF when compile-testing.
---
 drivers/pinctrl/freescale/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/freescale/Kconfig b/drivers/pinctrl/freescale/Kconfig
index 8d24decd3f074ece..fd53cf5bb843dfaf 100644
--- a/drivers/pinctrl/freescale/Kconfig
+++ b/drivers/pinctrl/freescale/Kconfig
@@ -9,7 +9,7 @@ config PINCTRL_IMX
 
 config PINCTRL_IMX_SCMI
 	tristate "i.MX95 pinctrl driver using SCMI protocol interface"
-	depends on ARM_SCMI_PROTOCOL && OF
+	depends on (ARM_SCMI_PROTOCOL && OF && ARCH_MXC) || COMPILE_TEST
 	select PINMUX
 	select GENERIC_PINCONF
 	select GENERIC_PINCTRL_GROUPS
-- 
2.43.0


