Return-Path: <linux-gpio+bounces-31388-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SCQyILz0gWljNAMAu9opvQ
	(envelope-from <linux-gpio+bounces-31388-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Feb 2026 14:14:36 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D74D9C6E
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Feb 2026 14:14:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B31CA30AF201
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Feb 2026 13:11:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 015CF350A3B;
	Tue,  3 Feb 2026 13:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ms+egXTn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8089234F492
	for <linux-gpio@vger.kernel.org>; Tue,  3 Feb 2026 13:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770124258; cv=none; b=ryVE1qGf460DdaZDP1DvAm5fkrKRIMjFP1iRJaaWOniF2Q4COEpfruCpp7C+dfqlpGmH/fTBC+NaF9RcQFvZKQihlxrWQUskuXxEsuebDERtEzUgaI33RfDApVw/JyfQDrCRd7vBAyMn1BZrxmrsa9TL5nL30BC4qa1kwCYW+AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770124258; c=relaxed/simple;
	bh=RhB2cmEe74xR1OlQfbUCwRRu1BmBz5QzcgeyA8XCh2s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FiZE1LUfzI4+Z0koCS2o9CVHkpr7qo7CXpgrxKUo/c8rncovvSxXRMoEWceTBrNpW6gYK5SSGOM8lA7N8nAHtrR+KEMxUKtUXRsV5/3CDxupTAi+og/7O/jrNBIqq93/YUi1OLs6gd1QA0ffPP7iDKoPYl4JNzh6Vcgy8qhJUdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ms+egXTn; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47edd6111b4so59714905e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 03 Feb 2026 05:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770124254; x=1770729054; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aO2walfYvRcAq+Sg3syyTpjnzgJWxL9Ltw2W6HjtfVI=;
        b=ms+egXTn7bU2MIYXG+vpuPY4BuQd28nShceylxIDorSl9pZn5Mb4DoUiBAg/VjuBT+
         /xGxODU06jT8O+cwivWuR2r5gZiGInh727YPX54sAf4OcOVp9R8rpJVQbk5y82bytGht
         O3h8jcRFPKzqZzV9SvBBgoHgFu3pk7joEW9k+9aFEfb/W91O4FCkuszGGU4awiBRX5kA
         RTcI9iyMjPav7ni+paWqfuIKYDT9oKgNv7mAUitjgJ0A0oNfniYoeZofYVggU/OGf3DH
         OOjf/faslg8gJh8nJAOIIeh3sy684TPVZB5U/xXonh7W7f0829sS6Zyj5DMuChK6HtEA
         dz8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770124254; x=1770729054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aO2walfYvRcAq+Sg3syyTpjnzgJWxL9Ltw2W6HjtfVI=;
        b=spYH5yuFkd9liPgFhghMIkD9sP0DR8/DaCEzmI5AjIiV0KEKxbH5WkY8xPfNqadcwE
         RWtdz++Rko4cXHQhl0xUT2ApcqC5lK4LmhBuJxA7HuG2ibrf4/d8v3uorZhssmcqE9sX
         SsITGpx2t1NTTMQSnczrPlYEsAQjDX3K8j+mu0IhPATaUgomTGldSOsRaOyt3UDo/I3U
         MYfzBxlHAmBZU6Ca41xhgaR9EBLW0Fg8Vy2hwccBl6dKNFNJKxCJxC49msqyBgpf3vSN
         1AI01NCx2p2itQu72mLULOVaFAr8uC3avUR1iKYQBAxBvA0a5GMIYWlp3jQZDsH8gqs0
         C35Q==
X-Forwarded-Encrypted: i=1; AJvYcCUP+WUV7Nzmg+aGByh/sfvQr4ZIiUpGUL+fueqwgaV6VyzQNHm4FT3spVAQZGNCRnNWcQcDePr1TqNi@vger.kernel.org
X-Gm-Message-State: AOJu0YyQXn6QWi5K0p+kXKdAoix9GCZb8Ygl9zu535f4JspCeom3M77i
	k5BA/tMc0AxchHa77eTHA6Gx6gDHpgA35bK0i5wT01QLvWHjIQS7Nqc7
X-Gm-Gg: AZuq6aKOFOFCZRKIXXM/yQd3V70Su5+MHL9/fGcs3g+Y7g9uFm2v2vP5b4uEF8hzkqx
	1zrsDQDBdc9PY217xVEXbDjDL/hnUbhyGTj/LNWtcRQCssiakSxPzF1Q595N0HgUrrYWRNWTvcw
	Wf4FC8ybWHV+7jlngLjKf5qsUdbNYz33z/hNqojo02GhSOCw5iHWfbSQaYXhrP7MU+Oqo8Uxod2
	+GwKs99Le6Dy8Q4jncqoqGDOmZp4/botceuLUghFSEO8V5NnGVUnJLSV3wiTSvplyEAmoRh33Xu
	CpykEyF0MQ+yqrmDfRQV6q1VE+A27m2hcm3ahWPvL73e8tRKjr9lFMhsDPNn714ukJEFvKc4cpY
	1jOs67Hu6FILIW2dA1qEMtKVZillu3VR1zo2kQpUrZVmRauselHhwfV/tmlI7U5bh8ciUErI2LY
	wdMH9xSDi71IgCU1MQPg==
X-Received: by 2002:a05:600c:8716:b0:47e:d943:ec08 with SMTP id 5b1f17b1804b1-482db4919a6mr187779395e9.28.1770124254376;
        Tue, 03 Feb 2026 05:10:54 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:9cd9:f748:166d:55fc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4830512ddd0sm63662185e9.9.2026.02.03.05.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 05:10:54 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 04/10] pinctrl: renesas: rzg2l: Add support for selecting power source for {WDT,AWO,ISO}
Date: Tue,  3 Feb 2026 13:10:27 +0000
Message-ID: <20260203131048.421708-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260203131048.421708-1-biju.das.jz@bp.renesas.com>
References: <20260203131048.421708-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31388-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-gpio@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 37D74D9C6E
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

The RZ/G3L SoC has support for setting power source that are not
controlled by the following voltage control registers:
  - SD_CH{0,1,2}_POC, XSPI_POC, ETH{0,1}_POC, I3C_SET.POC

Add support for selecting voltages using OTHER_POC register for
setting I/O domain voltage for WDT, ISO and AWO.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * No change
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 40 +++++++++++++++++++++++--
 1 file changed, 37 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 863e779dda02..cf7f9c2e37f8 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -63,10 +63,18 @@
 #define PIN_CFG_SMT			BIT(16)	/* Schmitt-trigger input control */
 #define PIN_CFG_ELC			BIT(17)
 #define PIN_CFG_IOLH_RZV2H		BIT(18)
+#define PIN_CFG_PVDD1833_OTH_AWO_POC	BIT(19) /* known on RZ/G3L only */
+#define PIN_CFG_PVDD1833_OTH_ISO_POC	BIT(20) /* known on RZ/G3L only */
+#define PIN_CFG_WDTOVF_N_POC		BIT(21) /* known on RZ/G3L only */
 
 #define RZG2L_SINGLE_PIN		BIT_ULL(63)	/* Dedicated pin */
 #define RZG2L_VARIABLE_CFG		BIT_ULL(62)	/* Variable cfg for port pins */
 
+#define PIN_CFG_OTHER_POC_MASK	\
+					(PIN_CFG_PVDD1833_OTH_AWO_POC | \
+					 PIN_CFG_PVDD1833_OTH_ISO_POC | \
+					 PIN_CFG_WDTOVF_N_POC)
+
 #define RZG2L_MPXED_COMMON_PIN_FUNCS(group) \
 					(PIN_CFG_IOLH_##group | \
 					 PIN_CFG_PUPD | \
@@ -146,6 +154,7 @@
 #define SD_CH(off, ch)		((off) + (ch) * 4)
 #define ETH_POC(off, ch)	((off) + (ch) * 4)
 #define QSPI			(0x3008)
+#define OTHER_POC		(0x3028) /* known on RZ/G3L only */
 
 #define PVDD_2500		2	/* I/O domain voltage 2.5V */
 #define PVDD_1800		1	/* I/O domain voltage <= 1.8V */
@@ -906,6 +915,12 @@ static int rzg2l_caps_to_pwr_reg(const struct rzg2l_register_offsets *regs, u32
 		return ETH_POC(regs->eth_poc, 1);
 	if (caps & PIN_CFG_IO_VMC_QSPI)
 		return QSPI;
+	if (caps & PIN_CFG_PVDD1833_OTH_AWO_POC)
+		return OTHER_POC;
+	if (caps & PIN_CFG_PVDD1833_OTH_ISO_POC)
+		return OTHER_POC;
+	if (caps & PIN_CFG_WDTOVF_N_POC)
+		return OTHER_POC;
 
 	return -EINVAL;
 }
@@ -925,6 +940,13 @@ static int rzg2l_get_power_source(struct rzg2l_pinctrl *pctrl, u32 pin, u32 caps
 		return pwr_reg;
 
 	val = readb(pctrl->base + pwr_reg);
+	if (pwr_reg == OTHER_POC) {
+		u32 poc = FIELD_GET(PIN_CFG_OTHER_POC_MASK, caps);
+		u8 offs = ffs(poc) - 1;
+
+		val = (val >> offs) & 0x1;
+	}
+
 	switch (val) {
 	case PVDD_1800:
 		return 1800;
@@ -943,6 +965,7 @@ static int rzg2l_set_power_source(struct rzg2l_pinctrl *pctrl, u32 pin, u32 caps
 	const struct rzg2l_hwcfg *hwcfg = pctrl->data->hwcfg;
 	const struct rzg2l_register_offsets *regs = &hwcfg->regs;
 	int pwr_reg;
+	u8 poc_val;
 	u8 val;
 
 	if (caps & PIN_CFG_SOFT_PS) {
@@ -952,15 +975,15 @@ static int rzg2l_set_power_source(struct rzg2l_pinctrl *pctrl, u32 pin, u32 caps
 
 	switch (ps) {
 	case 1800:
-		val = PVDD_1800;
+		poc_val = PVDD_1800;
 		break;
 	case 2500:
 		if (!(caps & (PIN_CFG_IO_VMC_ETH0 | PIN_CFG_IO_VMC_ETH1)))
 			return -EINVAL;
-		val = PVDD_2500;
+		poc_val = PVDD_2500;
 		break;
 	case 3300:
-		val = PVDD_3300;
+		poc_val = PVDD_3300;
 		break;
 	default:
 		return -EINVAL;
@@ -970,6 +993,17 @@ static int rzg2l_set_power_source(struct rzg2l_pinctrl *pctrl, u32 pin, u32 caps
 	if (pwr_reg < 0)
 		return pwr_reg;
 
+	if (pwr_reg == OTHER_POC) {
+		u32 poc = FIELD_GET(PIN_CFG_OTHER_POC_MASK, caps);
+		u8 offs = ffs(poc) - 1;
+
+		val = readb(pctrl->base + pwr_reg);
+		val &= ~BIT(offs);
+		val |= (poc_val << offs);
+	} else {
+		val = poc_val;
+	}
+
 	writeb(val, pctrl->base + pwr_reg);
 	pctrl->settings[pin].power_source = ps;
 
-- 
2.43.0


