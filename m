Return-Path: <linux-gpio+bounces-35851-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJvKEt4i82nIxQEAu9opvQ
	(envelope-from <linux-gpio+bounces-35851-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 11:37:34 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A9D49FEC3
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 11:37:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D29F9305615B
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 09:34:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DBBD3A0EB8;
	Thu, 30 Apr 2026 09:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CVZ0T1kU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B564A3A5E81
	for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 09:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777541673; cv=none; b=m8455UvnFN2bJfXTZfIQGk/RlBMoBXiVeG6NbqBokbmDxa/jfZ1L7Kd5Mm2f34uJC0HokxfKrdG5MAD4CyIw0fbYH8Y0V9yCWwRQJobKnyxPTJY8nxnu2ey2LsJszWkomSpWn56/ZM36bYbQkm5U4ByUKA0a9U1QY2ULdNqWYuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777541673; c=relaxed/simple;
	bh=L2M4Vqp9RfqgGtk1NVtU80uZ/o8rWFC6KgMYLqkjKRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VEP+vejpMrGyHxy788vsOPyG0nhfiT06D3pv/9w4wgEOzugH2HwghqVRet/+AorMr/cqjhjM/5+00DBiTlJ1M4ZSJkrjUH6LOjy6+c6YPkKL+cUNETX2GS7W696O6XMio/dMvMlKUFZxnEKTQGIOC1m6BMNdn0/yT9B0Y/0xGrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CVZ0T1kU; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43cfce3a195so372171f8f.2
        for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 02:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777541669; x=1778146469; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z3rCYOpWHkYf3cWmjVv7h50il+B2+zlhmGM/eE2K0hU=;
        b=CVZ0T1kUz/qtXrtZ6JMq8HzyOS3Ls6W+2ZY8yUyl2syO8VXDyjxnY4x5JRXloPmkDs
         pL+ccJvmDUO0H0CzyHPc4/mdWa6M3F9oUa1PLqMZaPpCoFYv16+FhIB/PlLu41WhVY9K
         7JZHwqCLjevdl5cwEqXlRbPr2K2fChLzMFpV79q4DrdYMfKP7n5HjfPoeOcxyxdqge/J
         BGtip0sQWsbOIS0/2fYkqLTtFToawfSM8ee6Ve15p9tvQoWmYxrocF4wfxxYw3uWz+HJ
         JFEa+f/PXNfeUudMSorrTFNj5djXSz25Lj6An+md2hPbmnOHKpXP1FSdbx63ljsIsqfF
         et4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777541669; x=1778146469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z3rCYOpWHkYf3cWmjVv7h50il+B2+zlhmGM/eE2K0hU=;
        b=UJB1DDvdMnVLE0/8sG1A0qD04HPquVDhewAYMNV99Fa1mWNfePc8Zh5pdmouZBOZh0
         Ny3eUgkdz8JgNVKflCP7+0kUZDj5BZ5qKRabZB65tLBqjNlrT+9Z6wPwt9lXiHi37HGi
         VLn6rUxujn202f7WHgljFwio2LpSwghQNbpKYVXJ4Ttj35qeYF+GtU+MUbWuXlMD3eeX
         3EVeLgXOFDGiDs9xzteqPR75uhHQfDM7VyVGISd2NWcnCMXNi7I+5P2tH1umM9uCb7Ib
         QyWqr6iyu22V34zCF/CezDSOM6EygHSq2o6JoW3CnoRgo4D2VsbBkXnJ6/yAd/FMS57D
         PUAQ==
X-Forwarded-Encrypted: i=1; AFNElJ/55i1UIR4wq/QlC8J8i2mSl2OS44v+qEntiHCUjEoqbpkZxedynJzL5XGYBenxD3IKbXSjcDo3Lvyk@vger.kernel.org
X-Gm-Message-State: AOJu0Yzkh/MGesQkpoZi0tEKDPx63p3j8A/NlSA1IAMAy7XNZWdONyie
	2cJUBZH6qYoYaXqLkhfQein9QcOBAkHU4cBDIo0rwRD8dq07PqnS+J/IHuTFxg==
X-Gm-Gg: AeBDiesR/+yTj7nAmLyJ0hgu8fXCka6d0DVFmvG4i553gtQ++JLPgBV+CIMk/OTmhzJ
	4e5zM0qx4AqcBouVg6/DMyYZQz+9G543OBzs+qpCzPbwk/FQf4YdMOvBwczaga1sc9pq3+NDCY2
	B4o1k+ssWhBMtGvEsdP9nMhLd0MwBqkar56kJzEuuMTnTx2rRE93/lWhI9lh5PKjYfAPhB5oRqe
	bGuLSOvhEzqxtKIw3qkvcdBdO05aUn2kMcXnidevW1WXisRG8yXFibclu4e6vcy8LWHfLkxhc9b
	N6VZCkAxdYe+8OXnwC4Xx8lCNqxfEXVNSwjfhKnaw0+PCwj/qJg8KYY7v0FJmlzefu9f7hCBI1p
	xNJTgCKltPWhI4A9jsMuUrpqvEvSATfLFTRn75XW/x+MnyuRUlTOEe4VaZeG8j4fMp9Zi5tZ47U
	z1H1MTQQHSh8Q9md2a0yEcgOU20tJlooDJQNKLtNV7P7yEAHjEik3FSYyH
X-Received: by 2002:a05:6000:26c8:b0:43f:e22f:606 with SMTP id ffacd0b85a97d-4493dbdb55dmr3077275f8f.2.1777541668897;
        Thu, 30 Apr 2026 02:34:28 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:342:901:e785:f7d2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b76e5c22sm11953913f8f.28.2026.04.30.02.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 02:34:28 -0700 (PDT)
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
Subject: [PATCH v4 3/7] pinctrl: renesas: rzg2l: Add support for selecting power source for {WDT,AWO,ISO}
Date: Thu, 30 Apr 2026 10:34:08 +0100
Message-ID: <20260430093422.74812-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430093422.74812-1-biju.das.jz@bp.renesas.com>
References: <20260430093422.74812-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 95A9D49FEC3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35851-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-gpio@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:mid]

From: Biju Das <biju.das.jz@bp.renesas.com>

The RZ/G3L SoC has support for setting power source that are not
controlled by the following voltage control registers:
  - SD_CH{0,1,2}_POC, XSPI_POC, ETH{0,1}_POC, I3C_SET.POC

Add support for selecting voltages using OTHER_POC register for
setting I/O domain voltage for WDT, ISO and AWO by extending
rzg2l_caps_to_pwr_reg() with a mask output parameter so that callers
callers can identify which bit(s) within OTHER_POC correspond to the
requested domain. Update rzg2l_get_power_source() to extract the
relevant bit field via field_get() when reading OTHER_POC, and update
rzg2l_set_power_source() to perform a read-modify-write under the
spinlock when writing to OTHER_POC, since multiple domains share the
same register.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
 * Updated commit description.
 * Updated rzg2l_caps_to_pwr_reg() to return mask in addition to register
   offset.
 * Dropped ffs(), using field_get() instead to get PoC offset in
   rzg2l_get_power_source().
 * Simplified rzg2l_set_power_source() by using mask from
   rzg2l_caps_to_pwr_reg().
 * Added scoped_guard() for RMW operation in rzg2l_set_power_source().
v2->v3:
 * No change
v1->v2:
 * No change
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 53 ++++++++++++++++++++-----
 1 file changed, 44 insertions(+), 9 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index ca9d4a3ec737..7b1bb66d4ff6 100644
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
 #define QSPI			(0x3008) /* known on RZ/{G2L,G2LC,G2UL,Five} only */
+#define OTHER_POC		(0x3028) /* known on RZ/G3L only */
 
 #define PVDD_2500		2	/* I/O domain voltage 2.5V */
 #define PVDD_1800		1	/* I/O domain voltage <= 1.8V */
@@ -900,7 +909,8 @@ static void rzg2l_rmw_pin_config(struct rzg2l_pinctrl *pctrl, u32 offset,
 	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
 }
 
-static int rzg2l_caps_to_pwr_reg(const struct rzg2l_register_offsets *regs, u32 caps)
+static int rzg2l_caps_to_pwr_reg(const struct rzg2l_register_offsets *regs,
+				 u32 caps, u8 *mask)
 {
 	if (caps & PIN_CFG_IO_VMC_SD0)
 		return SD_CH(regs->sd_ch, 0);
@@ -912,6 +922,16 @@ static int rzg2l_caps_to_pwr_reg(const struct rzg2l_register_offsets *regs, u32
 		return ETH_POC(regs->eth_poc, 1);
 	if (caps & PIN_CFG_IO_VMC_QSPI)
 		return QSPI;
+	if (caps & PIN_CFG_OTHER_POC_MASK) {
+		if (caps & PIN_CFG_PVDD1833_OTH_AWO_POC)
+			*mask = BIT(0);
+		else if (caps & PIN_CFG_PVDD1833_OTH_ISO_POC)
+			*mask = BIT(1);
+		else
+			*mask = BIT(2);
+
+		return OTHER_POC;
+	}
 
 	return -EINVAL;
 }
@@ -920,17 +940,20 @@ static int rzg2l_get_power_source(struct rzg2l_pinctrl *pctrl, u32 pin, u32 caps
 {
 	const struct rzg2l_hwcfg *hwcfg = pctrl->data->hwcfg;
 	const struct rzg2l_register_offsets *regs = &hwcfg->regs;
+	u8 val, mask;
 	int pwr_reg;
-	u8 val;
 
 	if (caps & PIN_CFG_SOFT_PS)
 		return pctrl->settings[pin].power_source;
 
-	pwr_reg = rzg2l_caps_to_pwr_reg(regs, caps);
+	pwr_reg = rzg2l_caps_to_pwr_reg(regs, caps, &mask);
 	if (pwr_reg < 0)
 		return pwr_reg;
 
 	val = readb(pctrl->base + pwr_reg);
+	if (pwr_reg == OTHER_POC)
+		val = field_get(mask, val);
+
 	switch (val) {
 	case PVDD_1800:
 		return 1800;
@@ -948,8 +971,8 @@ static int rzg2l_set_power_source(struct rzg2l_pinctrl *pctrl, u32 pin, u32 caps
 {
 	const struct rzg2l_hwcfg *hwcfg = pctrl->data->hwcfg;
 	const struct rzg2l_register_offsets *regs = &hwcfg->regs;
+	u8 poc_val, val, mask;
 	int pwr_reg;
-	u8 val;
 
 	if (caps & PIN_CFG_SOFT_PS) {
 		pctrl->settings[pin].power_source = ps;
@@ -958,25 +981,37 @@ static int rzg2l_set_power_source(struct rzg2l_pinctrl *pctrl, u32 pin, u32 caps
 
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
 	}
 
-	pwr_reg = rzg2l_caps_to_pwr_reg(regs, caps);
+	pwr_reg = rzg2l_caps_to_pwr_reg(regs, caps, &mask);
 	if (pwr_reg < 0)
 		return pwr_reg;
 
-	writeb(val, pctrl->base + pwr_reg);
+	if (pwr_reg == OTHER_POC) {
+		scoped_guard(raw_spinlock, &pctrl->lock) {
+			val = readb(pctrl->base + pwr_reg);
+			if (poc_val)
+				val |= mask;
+			else
+				val &= ~mask;
+			writeb(val, pctrl->base + pwr_reg);
+		}
+	} else {
+		writeb(poc_val, pctrl->base + pwr_reg);
+	}
+
 	pctrl->settings[pin].power_source = ps;
 
 	return 0;
-- 
2.43.0


