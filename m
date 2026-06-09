Return-Path: <linux-gpio+bounces-38189-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yrrXA4EyKGrK/wIAu9opvQ
	(envelope-from <linux-gpio+bounces-38189-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 17:34:25 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DFBA661CBE
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 17:34:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38189-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38189-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AF12A3118EC0
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jun 2026 15:09:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EADB47D937;
	Tue,  9 Jun 2026 15:08:43 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2D04418CC;
	Tue,  9 Jun 2026 15:08:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781017723; cv=none; b=PVyhE15espQi5F2TCwEVoJ+M6A0VM02UR4V47wxiQOHP3rbESW8LcmRdfkx4UTC1HErNwrYc5u8anaPXo2KapgShQkCG7izCQYpQUvVatrcvMdYIxNnE+At+lAGS0vyvuCs0hqxnJCdx+niPe+kmlvaRlfxT9geMNcKjEbsJ5ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781017723; c=relaxed/simple;
	bh=y9XfLGpO2F9+W6YO/LJ0IOSOkJDaULwimy+6X8W02ak=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MLOyeGUJfP7FU8U4TwJahrXpk/TVquhmnJ87+er379bv2OBZQNeVXP5CZVxGHZ3EEtg9J9VzLdO7+ssKofQYC938wAdbJCZBS5NgNd8wxWq7ZdJmUzYBCXpvfyrh5AVldffhW4zEH+HVH7GEIJO2nzqkbb/NhBmgPWIVnR3ctgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FB981F00893;
	Tue,  9 Jun 2026 15:08:40 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Prathamesh Shete <pshete@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Linus Walleij <linusw@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	linux-gpio@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/2] pinctrl: tegra: PINCTRL_TEGRA238 should depend on ARCH_TEGRA
Date: Tue,  9 Jun 2026 17:08:34 +0200
Message-ID: <0643b689f0f4a453d31183d9f598a6f53574ecbc.1781017599.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38189-lists,linux-gpio=lfdr.de,renesas];
	DMARC_NA(0.00)[glider.be];
	FORGED_RECIPIENTS(0.00)[m:pshete@nvidia.com,m:thierry.reding@kernel.org,m:jonathanh@nvidia.com,m:linusw@kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:linux-gpio@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:geert+renesas@glider.be,m:geert@glider.be,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[geert@glider.be,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@glider.be,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,glider.be:email,glider.be:mid,glider.be:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9DFBA661CBE

The NVIDIA Tegra238 MAIN and AON pin controllers are only present on
NVIDIA Tegra238 SoCs.  Hence add a dependency on ARCH_TEGRA, to prevent
asking the user about this driver when configuring a kernel without
NVIDIA Tegra SoC support.

Fixes: 25cac7292d49f4fc ("pinctrl: tegra: Add Tegra238 pinmux driver")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/tegra/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/tegra/Kconfig b/drivers/pinctrl/tegra/Kconfig
index c7507193044f4af3..eea7ec9688b6460b 100644
--- a/drivers/pinctrl/tegra/Kconfig
+++ b/drivers/pinctrl/tegra/Kconfig
@@ -39,6 +39,7 @@ config PINCTRL_TEGRA234
 
 config PINCTRL_TEGRA238
 	tristate "NVIDIA Tegra238 pinctrl driver"
+	depends on ARCH_TEGRA || COMPILE_TEST
 	default m if ARCH_TEGRA_238_SOC
 	select PINCTRL_TEGRA
 	help
-- 
2.43.0


