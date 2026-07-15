Return-Path: <linux-gpio+bounces-40117-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id E8gbB41+V2pATQAAu9opvQ
	(envelope-from <linux-gpio+bounces-40117-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 14:35:25 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1F375E340
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 14:35:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="g3LXj/0N";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40117-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40117-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 03B8A304CAD5
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 12:29:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0867747A0B4;
	Wed, 15 Jul 2026 12:29:42 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18473477E4A
	for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 12:29:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784118579; cv=none; b=Ae9/bEAPQFkH93j9eRajTH4FFQN1JNgekUTazvx4N2y5dQCj/YuyUfE7JhF/GYGIWsw2q4sqzxvaTBIzgnN6ds/CIeX6ZmyoFN440NpVcchARU8lDJiP/WnBfch1B2R0BGT/Odj6LeILhx11x9IqYHq5Wzn2oz1K50hWFpz6OuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784118579; c=relaxed/simple;
	bh=7llQApEnqRUf+y2HW6MDlK9YjCFwPMY/ybzG2yeXDo0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TsEVhlhbY/ptphSGuiz1tdLyQIRRMOhHtuKyAECjWMv78EBOBBaqG4NPgXR0KVcFWibZx9bK6PTM+vApgoV7KomwbJrTePNJACGRT47J0vOvfW1Yv7RzuWuBE1s6IobPYU621X5BmTHf0bUMPVZkULn3valTfd//D0F57DGL2e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g3LXj/0N; arc=none smtp.client-ip=209.85.128.53
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493bfe9f886so29094685e9.0
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 05:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784118575; x=1784723375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hGjJScr/bxpJuGG5Tma4ac3F09jinueH/67kipY/w2k=;
        b=g3LXj/0NCWmbARhwAEQZcK2gY0s1UZYCXc7wrAZfXdZnYKE3hmoGGGFlZ+mu98cEC7
         ieRkYbUqynfgtIsSAW+3siQt/6dj+x724lzWamWhG1RlO7jToxoOcwDtsg7irBOe49h+
         EBUlM6TNLPa3QF7shS2eFbcAUeWgxYoT2MLP3492uNljHeLMiPKj6AALcG9v7VDb0OoO
         jfSQH3kiL1sBlfar0e8TcEzZDjnk7EZYtAcTOztfiYdn03YM8YSh0w9Sb5lFk0y6skeB
         SbITDURaSYzlrVRkJVZLscDq6Y6h5+NsdzG6r6RAhkEIIMBhSLWHORkDS68hEPAtxFGP
         RuAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784118575; x=1784723375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hGjJScr/bxpJuGG5Tma4ac3F09jinueH/67kipY/w2k=;
        b=BZB2Q56PesL7bGqe6S9ka6ZUDi60jnmgUg8ZtDsrq7NE6HSRukmhODShB34TIqALmF
         5r6KySFkB88NFeEmMlQta18p+AKEPahiDDRfQs8bIeaW5tynb6zmq6FyHNcr775eonhO
         eG4tmgQWgJTBe7tiCCVv31+iAJbCIADHLWZMDP3i1b0QEs+yleFSwQ/4cevpgdV3mNsY
         FCBTqalqQdDaYJrWxaEbZJ0XKERx+DH6lSlrzc4oe5Fo/RedL/60ea7Z/4XZe14StM10
         yGa7FgZ4CyOkV7/twnb1sdDKHZzHCOvsM/1kbQdGqbBLHLlIA53URr4+zj0Jmjmho9aW
         gMUA==
X-Forwarded-Encrypted: i=1; AHgh+Rq9HtKRLz3SC68WcTFVbaZSZU4PlnvafsZWsfF843ZPNu4HWmCizXz4f7eXqtKv4vklLEEZdhC/XhOF@vger.kernel.org
X-Gm-Message-State: AOJu0YzJjZjuC9q+yvGs3GR32c1tDaOCxEzn+ZwsUmkFu/5Yx8uTWTcm
	7kTfVZ3xq6POG1MYo+NYA6XvrhpfvqGny2QxTRvoJojp+tc1w2N/oqu0
X-Gm-Gg: AfdE7ck6YTVUsZP8B5LRZkDEBhNDXTM53Fvuso3ykF9msFi7wIaq9ismSWdouP+B8VU
	+VsmLGq6t5alA2et3WhqB7fq9GVJGtQg+zjgO1dl6OzCfYIN3U+afkE3GcjA5Ekoq8grywnDu2y
	EiUwLsuOCCmGKbg4GXlB5gu0spHmE76XvbhXUQkSHDiFN2VKXrvv+1kvSZdrBRy5C2RfXrZwXIH
	YSwyOHYi2Edk+nHrUX6+2MclU0slt0SrBPAgaGYhgIRsh93hwADCBTjCDprFKeBssXL2PYGPBhA
	GHZNBJvW+wiMuveZ6gTEsdRqXe5hooV+aen/FeKWyVn/oRmPvPzgmzqVKnbhUOtuBO1GOlhrHCD
	7dZEjDNLS+M3giWvmLPI3pkiOQkjLTLzGpN4HmhD8zmSczv6ttGp9ToJvW7Hv43+RqEAVM0h8fu
	Yp7XOzEjJYlYYOxV62HqsLqpFWrELvqruMWA==
X-Received: by 2002:a05:600c:3b20:b0:493:e974:41ac with SMTP id 5b1f17b1804b1-4953c168d09mr28802015e9.16.1784118574883;
        Wed, 15 Jul 2026 05:29:34 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4950a32a2casm216770715e9.12.2026.07.15.05.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:29:33 -0700 (PDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: andrew@codeconstruct.com.au,
	linusw@kernel.org,
	brgl@kernel.org
Cc: openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com
Subject: [PATCH v1 2/8] pinctrl: npcm8xx: enable RMII outputs from RMII groups
Date: Wed, 15 Jul 2026 15:29:17 +0300
Message-Id: <20260715122923.1938327-3-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260715122923.1938327-1-tmaimon77@gmail.com>
References: <20260715122923.1938327-1-tmaimon77@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[lists.ozlabs.org,vger.kernel.org,gmail.com,google.com];
	TAGGED_FROM(0.00)[bounces-40117-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew@codeconstruct.com.au,m:linusw@kernel.org,m:brgl@kernel.org,m:openbmc@lists.ozlabs.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:avifishman70@gmail.com,m:tmaimon77@gmail.com,m:tali.perry1@gmail.com,m:venture@google.com,m:yuenn@google.com,m:benjaminfair@google.com,m:taliperry1@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[tmaimon77@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tmaimon77@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1C1F375E340
X-Rspamd-Action: no action

NPCM8xx uses GCR_INTCR4 bits to release the R1, R2 and RMII3
transmit outputs from Hi-Z.

Those bits need to follow the mandatory r1, r2 and rmii3 pin
groups. The R1_OEn, R2_OEn and R3_OEn side groups are optional and
should not be required just to enable RMII transmit outputs.

Program the INTCR4 bits when the corresponding RMII groups are
selected and clear them again when those pins switch back to GPIO or
another shared function.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c | 61 +++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
index c859dca4b..1d5b3c648 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
@@ -26,6 +26,7 @@
 #define NPCM8XX_GCR_SRCNT	0x068
 #define NPCM8XX_GCR_FLOCKR1	0x074
 #define NPCM8XX_GCR_DSCNT	0x078
+#define NPCM8XX_GCR_INTCR4	0x0c0
 #define NPCM8XX_GCR_I2CSEGSEL	0x0e0
 #define NPCM8XX_GCR_MFSEL1	0x260
 #define NPCM8XX_GCR_MFSEL2	0x264
@@ -78,6 +79,9 @@
 #define NPCM8XX_GPIO_PER_BANK	32
 #define NPCM8XX_GPIO_BANK_NUM	8
 #define NPCM8XX_GCR_NONE	0
+#define NPCM8XX_INTCR4_R1_RMII_EN	BIT(12)
+#define NPCM8XX_INTCR4_R2_RMII_EN	BIT(13)
+#define NPCM8XX_INTCR4_RMII3_EN	BIT(14)
 
 #define NPCM8XX_DEBOUNCE_MAX		4
 #define NPCM8XX_DEBOUNCE_NSEC		40
@@ -1796,6 +1800,61 @@ static const struct pinctrl_pin_desc npcm8xx_pins[] = {
 	PINCTRL_PIN(251, "JM2/CP1_GPIO"),
 	};
 
+static u32 npcm8xx_rmii_output_enable_mask(unsigned int pin)
+{
+	switch (pin) {
+	case 178:
+	case 179:
+	case 180:
+	case 181:
+	case 182:
+	case 193:
+	case 201:
+		return NPCM8XX_INTCR4_R1_RMII_EN;
+	case 84:
+	case 85:
+	case 86:
+	case 87:
+	case 88:
+	case 89:
+	case 200:
+		return NPCM8XX_INTCR4_R2_RMII_EN;
+	case 110:
+	case 111:
+	case 209:
+	case 210:
+	case 211:
+	case 214:
+	case 215:
+		return NPCM8XX_INTCR4_RMII3_EN;
+	default:
+		return 0;
+	}
+}
+
+static void npcm8xx_set_rmii_output_enable(struct regmap *gcr_regmap,
+					   const unsigned int *pin,
+					   int pin_number, int mode)
+{
+	u32 mask = 0;
+	u32 val = 0;
+	u32 bit;
+	int i;
+
+	for (i = 0; i < pin_number; i++) {
+		bit = npcm8xx_rmii_output_enable_mask(pin[i]);
+		mask |= bit;
+
+		if ((mode == fn_r1 && bit == NPCM8XX_INTCR4_R1_RMII_EN) ||
+		    (mode == fn_r2 && bit == NPCM8XX_INTCR4_R2_RMII_EN) ||
+		    (mode == fn_rmii3 && bit == NPCM8XX_INTCR4_RMII3_EN))
+			val |= bit;
+	}
+
+	if (mask)
+		regmap_update_bits(gcr_regmap, NPCM8XX_GCR_INTCR4, mask, val);
+}
+
 /* Enable mode in pin group */
 static void npcm8xx_setfunc(struct regmap *gcr_regmap, const unsigned int *pin,
 			    int pin_number, int mode)
@@ -1834,6 +1893,8 @@ static void npcm8xx_setfunc(struct regmap *gcr_regmap, const unsigned int *pin,
 						   BIT(cfg->bit4) : 0);
 		}
 	}
+
+	npcm8xx_set_rmii_output_enable(gcr_regmap, pin, pin_number, mode);
 }
 
 static int npcm8xx_get_slew_rate(struct npcm8xx_gpio *bank,
-- 
2.34.1


