Return-Path: <linux-gpio+bounces-38455-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6p6rNrenL2qhEAUAu9opvQ
	(envelope-from <linux-gpio+bounces-38455-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 09:20:23 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB2F684220
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 09:20:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=g+CeLBep;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38455-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38455-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 51D4F3008D74
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 07:20:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 325553BD246;
	Mon, 15 Jun 2026 07:20:11 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9983BCD3A
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 07:20:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781508011; cv=none; b=Q9Tx8b63hBvwKXYDDB3pmR/gx4h+/T6RoK8y7V3ho3PcasDsZwfulIZ5Rhk+xkOaS6G/1itMkraRHeUU4tj7Vlff/eHf1DEcVwO/dvf4lckidsttF9SZIxuXbe2/HwHJ/qvb/vgKjiwnrsyUAKi6xF0NGJ7tx5iPldBA6DC9ZBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781508011; c=relaxed/simple;
	bh=2bZt2a2zRVSBV3MA0JWJ6SLazOmmGt1tpatOsImPFW4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dJ4bt2wS/argZEQPUqf59Iqt/cpwQhPoQhHDvyWW3dagTwM2QYnJg4ZWaL31+WL6bD6vWlMX51MPS0erQEDOHjgmdkhPLJoPTCROAdIikUyJwByA+qeeh7pbIeSqfjVsktDc500AIPAQxK3eKnpwzT3Y5JPwM+EauXffe4eG2uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g+CeLBep; arc=none smtp.client-ip=209.85.128.43
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490ae94a89eso25913465e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 00:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781508008; x=1782112808; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RzvCFyjr8bx4d2LvTNFN/pQ0QZHT1mGXGPc+CarTw40=;
        b=g+CeLBepzKb75Gvc/6kDeXUm7wIWCHcpUFR7NHWkOZZhvDpVYTC/ZWAVy73BQmOrop
         RmDQSXMI7rqSeLMQ20l/kBFrcpEEcKYy6OEAeCraMoMK3iRYeLBZ0vzPrrqHO0Lsl8me
         iO6kQjrfNtzAjjHHkgG7M59fBF1uMMp4AWbvis0dgatazdSmgp6GWl8ftWIdzQlDxVxA
         4lsV+sLvosy/7ClhEPcKq+AaM4ZoyxOTu6rRjg2ug1cT0ly/oi5iWitQR7ghbcz3Cw5I
         m+cmiAFoOtLSU1ya9QQpyvFoW1D6DXZ0Ik4jnn8zDF2hWl5TnHDVHfd3askIGn2fyzYL
         ozcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781508008; x=1782112808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RzvCFyjr8bx4d2LvTNFN/pQ0QZHT1mGXGPc+CarTw40=;
        b=cTOkb6LBADt4wIhdXAWOB0QnTzPz6/YvGUqBWlcnsn5qJJ4lBUxRaZvesKLZ/QmBxq
         Zm6BgEuW3P3F9IPaI168iA/XIvPGeU1n6vuuuvcUCq1MldHAUSCEYo8YNBDPwPqKrYl2
         ChcmaqxjN4GaVqxsoa5jYjPfWPKEyI6rXYIpKltzKWGsvwCY0Ga0kKGyvd3hfn/Q4cPd
         AGp2kDDSjlIq/3fmgUWHHEF5pl+1pi54M6waWJqtNIoFHOJQm5IhQGQQHkDxxlAxJWKG
         vetSqyMXnF7Dnw3DuBnRPbaS992N638Zo31cDRZkwldi4lS/FOLSoZQXOD2STWvn2/0x
         2L0g==
X-Forwarded-Encrypted: i=1; AFNElJ+M+cL8qPQnKxDfmw4nGb6VDJQYdGDBZTRcUnw4dJS8nYLwrlI3f2kLFL9+odH7jjm9B77M2c/vawsv@vger.kernel.org
X-Gm-Message-State: AOJu0YzsBZR0NYPCBEcpHOnnIBNb39S2Df/8HGPTmupIbo9oJollhdAk
	YXA9dz6LeRaCFcWVG7QTh8XOdNupYXyeKiSK32GyeKH+nk1Gd1pC5urv
X-Gm-Gg: Acq92OHdRQIzxZ+gwFJnwmqMxcKx83vsl0YroSlXNRZqqyZT0B7yuQKtnszutxSlQxG
	cPStIkdAdeNTD6V+HTt3anLgi6Jmd5Ty9GWvVHyRSnKhJwGkCOJXr1a3l1k+/vQSVle7FQVfzGl
	atSr7c6BmZkjnF74CIncHj10f86GAY+JpJbgAm9qxQKYvIAAUv1TkV1ufgv1DQ5Q+xMNTrsZrad
	VmEP/j5dR1JDKDKHJvacBrbnzaPAvoCOFpnjIw5r0uwkYS/+JPdxjJFeRZKMth0LQwXEJexy9YB
	1ymdNCaaoYrCJoc9a3oFoBCadpdPOgszuMcDxBMtyvmQSSxmepDHZVqO6cncpbU1EWTPf07+MXq
	9cTEYa1h/Q4UMIVPyzt465p0XiQdoFaXcf0JU8U0sX1Tx2TgUsdxzQGn0CFIy2x+Ae/bNZWEgBQ
	43HPzBxSh1wfnLT3wm
X-Received: by 2002:a7b:c7c1:0:b0:490:ba0a:1178 with SMTP id 5b1f17b1804b1-492200e7bf4mr83916975e9.28.1781508007746;
        Mon, 15 Jun 2026 00:20:07 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492203c0801sm200181015e9.10.2026.06.15.00.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 00:20:06 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v7 6/9] input: keyboard: mtk-pmic-keys: Add MT6392 support
Date: Mon, 15 Jun 2026 09:16:12 +0200
Message-ID: <20260615071836.362883-7-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260615071836.362883-1-l.scorcia@gmail.com>
References: <20260615071836.362883-1-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	URIBL_MULTI_FAIL(0.00)[packett.cool:server fail,sto.lore.kernel.org:server fail,collabora.com:server fail,vger.kernel.org:server fail];
	TAGGED_FROM(0.00)[bounces-38455-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-mediatek@lists.infradead.org,m:val@packett.cool,m:l.scorcia@gmail.com,m:angelogioacchino.delregno@collabora.com,m:dmitry.torokhov@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sen.chu@mediatek.com,m:sean.wang@mediatek.com,m:macpaul.lin@mediatek.com,m:lee@kernel.org,m:matthias.bgg@gmail.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:linusw@kernel.org,m:julien.massot@collabora.com,m:louisalexis.eyraud@collabora.com,m:parent.f@gmail.com,m:akkun11.open@gmail.com,m:chen.zhong@mediatek.com,m:linux-input@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-gpio@vger.kernel.org,m:lscorcia@gmail.com,m:dmitrytorokhov@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:matthiasbgg@gmail.com,m:parentf@gmail.com,m:akkun11open@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[packett.cool,gmail.com,collabora.com,kernel.org,mediatek.com,vger.kernel.org,lists.infradead.org];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[lscorcia@gmail.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lscorcia@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,packett.cool:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6EB2F684220

From: Val Packett <val@packett.cool>

Add support for the MT6392 PMIC to the keys driver.

Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/mtk-pmic-keys.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
index c78d9f6d97c4..8b4a89fce4fb 100644
--- a/drivers/input/keyboard/mtk-pmic-keys.c
+++ b/drivers/input/keyboard/mtk-pmic-keys.c
@@ -13,6 +13,7 @@
 #include <linux/mfd/mt6357/registers.h>
 #include <linux/mfd/mt6358/registers.h>
 #include <linux/mfd/mt6359/registers.h>
+#include <linux/mfd/mt6392/registers.h>
 #include <linux/mfd/mt6397/core.h>
 #include <linux/mfd/mt6397/registers.h>
 #include <linux/module.h>
@@ -69,6 +70,19 @@ static const struct mtk_pmic_regs mt6397_regs = {
 	.rst_lprst_mask = MTK_PMIC_RST_DU_MASK,
 };
 
+static const struct mtk_pmic_regs mt6392_regs = {
+	.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
+		MTK_PMIC_KEYS_REGS(MT6392_CHRSTATUS, 0x2,
+				   MT6392_INT_MISC_CON, 0x10,
+				   MTK_PMIC_PWRKEY_RST),
+	.keys_regs[MTK_PMIC_HOMEKEY_INDEX] =
+		MTK_PMIC_KEYS_REGS(MT6392_CHRSTATUS, 0x4,
+				   MT6392_INT_MISC_CON, 0x8,
+				   MTK_PMIC_HOMEKEY_RST),
+	.pmic_rst_reg = MT6392_TOP_RST_MISC,
+	.rst_lprst_mask = MTK_PMIC_RST_DU_MASK,
+};
+
 static const struct mtk_pmic_regs mt6323_regs = {
 	.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
 		MTK_PMIC_KEYS_REGS(MT6323_CHRSTATUS,
@@ -301,6 +315,9 @@ static const struct of_device_id of_mtk_pmic_keys_match_tbl[] = {
 	{
 		.compatible = "mediatek,mt6397-keys",
 		.data = &mt6397_regs,
+	}, {
+		.compatible = "mediatek,mt6392-keys",
+		.data = &mt6392_regs,
 	}, {
 		.compatible = "mediatek,mt6323-keys",
 		.data = &mt6323_regs,
-- 
2.43.0


