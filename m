Return-Path: <linux-gpio+bounces-38190-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eR6pAZUuKGrU/gIAu9opvQ
	(envelope-from <linux-gpio+bounces-38190-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 17:17:41 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4B3661A1F
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 17:17:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38190-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38190-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D9E1230D7601
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jun 2026 15:09:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 730CC47CC85;
	Tue,  9 Jun 2026 15:08:54 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA61547D922;
	Tue,  9 Jun 2026 15:08:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781017734; cv=none; b=L9ER4lgOnSN7fI3JCeG22d2/aQOpzDHXiIdqpWBVjHvvOm4/xzCXgUIGFJvkBc7qvvrhdBykZn4YTua+WQwET3xBRXXOTPPmQP3un4A4CdHCK6qxl54L26P4SofCHOW4R4nRhC5ZdSyHYwLNsHaatFQqiiJBnwByU5e7bdmCI6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781017734; c=relaxed/simple;
	bh=SsgcI2ex5y479ZaXsVwXM4muoKoLvUOJjEjpijHTZQk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WNgHiONIAxRT9t2uPsgPyZIzNxykMGuIfsoDjGzgf9DWWF6/beU4oo7ooDGYI6In3z6vhL5PwelWDTrjnxViKBTXgxe1doJKPmyV0uCHgF/qtVPHdrAlROJ8xCMBqaWPgiLQRd4I9jVPPph7488UFpQK5p+jtVUvynwBFRk8/XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1FA01F00898;
	Tue,  9 Jun 2026 15:08:46 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Prathamesh Shete <pshete@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Linus Walleij <linusw@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	linux-gpio@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/2] pinctrl: tegra: PINCTRL_TEGRA264 should depend on ARCH_TEGRA
Date: Tue,  9 Jun 2026 17:08:35 +0200
Message-ID: <1a90a36a1f939406bdac6ac84c8f0b3ddf313bd5.1781017599.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <0643b689f0f4a453d31183d9f598a6f53574ecbc.1781017599.git.geert+renesas@glider.be>
References: <0643b689f0f4a453d31183d9f598a6f53574ecbc.1781017599.git.geert+renesas@glider.be>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38190-lists,linux-gpio=lfdr.de,renesas];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9A4B3661A1F

The NVIDIA Tegra264 MAIN, AON, and UPHY pin controllers are only present
on NVIDIA Tegra264 SoCs.  Hence add a dependency on ARCH_TEGRA, to
prevent asking the user about this driver when configuring a kernel
without NVIDIA Tegra SoC support.

Fixes: c98506206912dd0d ("pinctrl: tegra: Add Tegra264 pinmux driver")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/tegra/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/tegra/Kconfig b/drivers/pinctrl/tegra/Kconfig
index eea7ec9688b6460b..39a93733efa2f0a9 100644
--- a/drivers/pinctrl/tegra/Kconfig
+++ b/drivers/pinctrl/tegra/Kconfig
@@ -50,6 +50,7 @@ config PINCTRL_TEGRA238
 
 config PINCTRL_TEGRA264
 	tristate "NVIDIA Tegra264 pinctrl driver"
+	depends on ARCH_TEGRA || COMPILE_TEST
 	default m if ARCH_TEGRA_264_SOC
 	select PINCTRL_TEGRA
 	help
-- 
2.43.0


