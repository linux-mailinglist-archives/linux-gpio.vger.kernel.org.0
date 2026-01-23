Return-Path: <linux-gpio+bounces-30956-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IQfOOT/ucmksrQAAu9opvQ
	(envelope-from <linux-gpio+bounces-30956-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 04:42:55 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0847027A
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 04:42:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0EA04301AA70
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 03:42:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F7FD38884F;
	Fri, 23 Jan 2026 03:42:49 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F3136CE0A;
	Fri, 23 Jan 2026 03:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769139766; cv=none; b=GFunQEiHGJ45wml6Cn6G35XGS6apxScCK9ocKWEXKcJVrVuOvbZ0NDMOSaFEzhVA2gJ/vX9zUQ2CFkgJpAUzw0vgc0zTPOg/X/8xsjxFMuz9obdDyIq712BWz+bzeW3NmdPaPk86hDujhFELyuxDX4+mOX2fhpJcTndKKwoLdxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769139766; c=relaxed/simple;
	bh=1vs5PnqoRJopA2dwgDUvGNiB2XTPfNa8BYVIucjFDdw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=T62mr6K4ItXHnRhG0wXYewK2rjdY52U5u0MVH7xOOFpH4CSw9KT5FuAhnASb6z4qwlGNJRAMstDggU9b9ZX5P28SxbCMEOdvdmFrVb7SxWzjooUCq/1gdmirYFv8+f5F4fE4dVrhI75ApfSCzm3EhJO+NhW6/S5XmofeA6smuRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 23 Jan
 2026 11:41:23 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 23 Jan 2026 11:41:23 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Date: Fri, 23 Jan 2026 11:41:25 +0800
Subject: [PATCH v2 3/3] pinctrl: single: unify pinconf offset mapping with
 pinmux
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260123-upstream_pinctrl_single-v2-3-40f8063cc5a2@aspeedtech.com>
References: <20260123-upstream_pinctrl_single-v2-0-40f8063cc5a2@aspeedtech.com>
In-Reply-To: <20260123-upstream_pinctrl_single-v2-0-40f8063cc5a2@aspeedtech.com>
To: Tony Lindgren <tony@atomide.com>, Haojian Zhuang
	<haojian.zhuang@linaro.org>, Linus Walleij <linusw@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-omap@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<andrew@codeconstruct.com.au>, <BMC-SW@aspeedtech.com>, Billy Tsai
	<billy_tsai@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769139683; l=1379;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=1vs5PnqoRJopA2dwgDUvGNiB2XTPfNa8BYVIucjFDdw=;
 b=Xp+BDMZ+3vaiU6jyDkaMScaJOdePBtsGF/KOHL1afJ3zopelMclYGGgwILAFD7hAz7G4wP5bN
 7jfPptDOS6oACgRrjZJDyiV6XJuUfdj59sGqewOponSW1LMKzgFcZAw
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[aspeedtech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	FROM_NEQ_ENVFROM(0.00)[billy_tsai@aspeedtech.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-30956-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[aspeedtech.com:mid,aspeedtech.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2F0847027A
X-Rspamd-Action: no action

Use the same register offset calculation for pinconf as pinmux to
properly handle bit-per-mux configurations. Ensures consistent and
correct offset mapping for pin configuration operations.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 drivers/pinctrl/pinctrl-single.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index e65ae737b4c5..aaf830315c5d 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -505,7 +505,8 @@ static int pcs_pinconf_get(struct pinctrl_dev *pctldev,
 			continue;
 		}
 
-		offset = pin * (pcs->width / BITS_PER_BYTE);
+		/* Use the same offset mapping as pinmux (handles bit-per-mux) */
+		offset = pcs_pin_reg_offset_get(pcs, pin);
 		data = pcs->read(pcs->base + offset) & func->conf[i].mask;
 		switch (func->conf[i].param) {
 		/* 4 parameters */
@@ -573,7 +574,8 @@ static int pcs_pinconf_set(struct pinctrl_dev *pctldev,
 			if (param != func->conf[i].param)
 				continue;
 
-			offset = pin * (pcs->width / BITS_PER_BYTE);
+			/* Use the same offset mapping as pinmux (handles bit-per-mux) */
+			offset = pcs_pin_reg_offset_get(pcs, pin);
 			data = pcs->read(pcs->base + offset);
 			arg = pinconf_to_config_argument(configs[j]);
 			switch (param) {

-- 
2.34.1


