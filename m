Return-Path: <linux-gpio+bounces-37728-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eF1+FZkLG2qH+ggAu9opvQ
	(envelope-from <linux-gpio+bounces-37728-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 30 May 2026 18:08:57 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B73A60DE9F
	for <lists+linux-gpio@lfdr.de>; Sat, 30 May 2026 18:08:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B0B61300D55C
	for <lists+linux-gpio@lfdr.de>; Sat, 30 May 2026 16:08:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D0DA3246E8;
	Sat, 30 May 2026 16:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aPCKSUWY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960AF33F8C2
	for <linux-gpio@vger.kernel.org>; Sat, 30 May 2026 16:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780157317; cv=none; b=CPu8NYynPN6iDKoudT4UZyFZk9qPxdoWWhL67vMnN/hlkHX6UUv8Bt96OzIASwT02T8vBTFTf9aEb+GINxa6wYV+J2/Q7H6vg/Dcj9EVgl88NgwuuLyCtW+y6/A4hq1OaNJi30avwfoE2BcIy66csPCR2cMD9csZ8OmmRqm4vOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780157317; c=relaxed/simple;
	bh=XMnNoE7QPg4Ai5rvzModT1Pbta9rIvMoYojoGIsAT5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qTr3gANIMOdbeypV9yFeS71Viy66g2ETTkG1aAhoZ6qHSrnZbhkR8oJUEJ9ZpLvFI92gVVYJEKmW6nT28KDmb/axdJRZ+y8KylTSgKZS9t9dAL65v1JOIiG6idrpDYO3RSBucPHrHwVoJDYnVlfoUa2f7QDmRROLTJUnVR05lPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aPCKSUWY; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-45ee6d32402so1543215f8f.1
        for <linux-gpio@vger.kernel.org>; Sat, 30 May 2026 09:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780157312; x=1780762112; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WP0Z1EJnUcALSxmebIHxeJFKui005xWjkpsiYrTbzbM=;
        b=aPCKSUWYgzrb51VNZrYlWdsC8oo5TO68sazmCi/uDZQbcRjxEiWU4YRcVhos+38gpM
         ExtdEll1W/CKSCdUcetQIfYQPzwc4iZ8tUTiXjAzasz8DjOEn69LfqdL0FZLPuHmYfOG
         OSyM+wZSNSYPXOXaYR5osYD+XZnmhBdivN61R4eBkvGB1aaiiP4EobDi7KEK51y4KuSD
         uglr+2r03VXaWV3FtCU5/ZPPbgU5VRavwyY2EeTDx9jlzDQyU6OytwXL+VtZ67hyhnRo
         IxC7zrjZ2CGz+ZEhEB5RLawgytICK02aiEsjBn2uw6nWpUzwzvg5cmjwWALEzhqq74Zo
         iJ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780157312; x=1780762112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WP0Z1EJnUcALSxmebIHxeJFKui005xWjkpsiYrTbzbM=;
        b=ZP/Lxwcsd0zJv6wW3epBSnNoOC0rUHo/ySa++osMYDah+GtJSQumbOjuvhuCg+BJXT
         35bh9r0L1FCj0JKAIGd0VOjz/7Hz9YeQENgTWbPnqSdeRWPdzcQbYRAgVagmY3USzvC8
         Hf0xbxg8tg+r+KGu2sBCyOcYFmxxah/QlEHa7h4ZfTrZaDwx97rDTqgx2VmtxVGG7xr/
         ZhY6up1H+9vk3PrNI6FB2lPV/lq5x9WmdQA+YQw0mSi630zn1lXHzBfD8fzj6cSQtL6M
         ZQ5ytFDYiTjL56IkpeHg0mt9OFs8M4VPHSremYIICDvFZAcgfJ2dPPsjJVDW2DdfB9lp
         T7/A==
X-Forwarded-Encrypted: i=1; AFNElJ89CBDJij/9m9xFc+kzH8+CgZ55vKo5xBS/mpah+EsQLT0G06uoocN4U13c4p0ISKkHVGS12CEpy79a@vger.kernel.org
X-Gm-Message-State: AOJu0YxOME8j9Kteq7YMeoyBaSBF0X94sw5RxHXCgbU4csMSKTG4DSMH
	+iFVp6Q+6iyMezrjIsaiRiVoxkmnf7cQmyR7qy0sUaqQ8c5ZiUEcA1qe
X-Gm-Gg: Acq92OF6DfivB+3jNUOphebHNrmYqCrSE9xYTtgwuoLtnZfIHsyzrDsEHb547YnjrAy
	9h4TId0QTOUNKnnu57Xg3JjfCcfVWx7hV3U6z6CXl3w7vlWxvHb6NQl910XxdthaRss4hzjypKK
	2cLjm7GufenylfuZtBdMWgAHy/nDKweUXImAaIc+2HlcbSnbEYvIqRLHcgTp2GicjCRxeidQ4ZV
	D/vDkC2mdFfmrKHPy5KzNAlQbwF37Zpuvt9KVXTWoShZX9FK+7nBALddU+CDUiVw5UHMnWAeYcA
	iCOK9kLJ+tHIatZxEO8QkwnJljWLna7b7Zob8g0h4/i1Wz7p27mDx304PDkig0i7fqyfjS1NCJN
	G9l67U52kH4Bjm3z2T6GPtM5A1vj/m7/MK8eO2si3AATFy6CQaqWhKZRvGxdkHzNjB43FpVWevp
	bWse6Vmc/XcM0KVpFRwNE9uaDjRQjQj02KspaSl5iCOUaDlaJKRwdvAxMA2jhx3hhzcXCe2A==
X-Received: by 2002:a5d:6d43:0:b0:43d:e31:68d1 with SMTP id ffacd0b85a97d-45ef6b5fe99mr5910102f8f.21.1780157311733;
        Sat, 30 May 2026 09:08:31 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:5db6:a512:6ab4:aa07])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef35874b7sm12170799f8f.35.2026.05.30.09.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 09:08:31 -0700 (PDT)
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
Subject: [PATCH 03/17] pinctrl: renesas: rzg2l: Add SD channel POC support for RZ/G3L
Date: Sat, 30 May 2026 17:07:57 +0100
Message-ID: <20260530160823.130907-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260530160823.130907-1-biju.das.jz@bp.renesas.com>
References: <20260530160823.130907-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-37728-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,renesas.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 4B73A60DE9F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

Add power-on control (POC) support for SD channels 1 and 2 on the RZ/G3L
SoC (r9a08g046).

Introduce PIN_CFG_IO_VMC_SD2 capability flag (bit 22) and SD_CH2_POC
register offset (0x3024). Extend rzg2l_caps_to_pwr_reg() to return
SD_CH2_POC when PIN_CFG_IO_VMC_SD2 is set.

Replace RZG3L_MPXED_PIN_FUNCS() with RZG2L_MPXED_COMMON_PIN_FUNCS() for
port PG and PH pins, dropping PIN_CFG_SOFT_PS which is inappropriate for
SD pins, and annotate them with PIN_CFG_IO_VMC_SD1 and PIN_CFG_IO_VMC_SD2
respectively.

Annotate all RZ/G3L SD0 dedicated pins (CLK, CMD, RST#, DS, DAT0–DAT7)
with PIN_CFG_IO_VMC_SD0 so that power-source register lookups work
correctly for those pins.

Add sd_ch2 field to rzg2l_register_offsets and rzg2l_pinctrl_reg_cache to
save and restore the SD_CH2_POC register across suspend/resume cycles.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 74 +++++++++++++++++--------
 1 file changed, 50 insertions(+), 24 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 83c61dcb24b1..b1d4b2b9e176 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -69,6 +69,7 @@
 #define PIN_CFG_PVDD1833_OTH_AWO_POC	BIT(19) /* known on RZ/G3L only */
 #define PIN_CFG_PVDD1833_OTH_ISO_POC	BIT(20) /* known on RZ/G3L only */
 #define PIN_CFG_WDTOVF_N_POC		BIT(21) /* known on RZ/G3L only */
+#define PIN_CFG_IO_VMC_SD2		BIT(22) /* known on RZ/G3L only */
 
 #define RZG2L_SINGLE_PIN		BIT_ULL(63)	/* Dedicated pin */
 #define RZG2L_VARIABLE_CFG		BIT_ULL(62)	/* Variable cfg for port pins */
@@ -258,6 +259,7 @@ static const struct pin_config_item renesas_rzv2h_conf_items[] = {
  * @oen: OEN register offset
  * @qspi: QSPI register offset
  * @other_poc: OTHER_POC register offset
+ * @sd_ch2: SD_CH2_POC register offset
  */
 struct rzg2l_register_offsets {
 	u16 pwpr;
@@ -266,6 +268,7 @@ struct rzg2l_register_offsets {
 	u16 oen;
 	u16 qspi;
 	u16 other_poc;
+	u16 sd_ch2;
 };
 
 /**
@@ -372,6 +375,7 @@ struct rzg2l_pinctrl_pin_settings {
  * @oen: Output Enable register cache
  * @other_poc: OTHER_POC register cache
  * @qspi: QSPI registers cache
+ * @sd_ch2: SD_CH2_POC registers cache
  */
 struct rzg2l_pinctrl_reg_cache {
 	u8	*p;
@@ -390,6 +394,7 @@ struct rzg2l_pinctrl_reg_cache {
 	u8	oen;
 	u8	other_poc;
 	u8	qspi;
+	u8	sd_ch2;
 };
 
 struct rzg2l_pinctrl {
@@ -474,20 +479,32 @@ static const u64 r9a08g046_variable_pin_cfg[] = {
 	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PE, 5, RZG3L_MPXED_ETH_PIN_FUNCS(ETH1)),
 	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PE, 6, RZG3L_MPXED_ETH_PIN_FUNCS(ETH1)),
 	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PE, 7, RZG3L_MPXED_ETH_PIN_FUNCS(ETH1)),
-	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 0, RZG3L_MPXED_PIN_FUNCS(B)),
-	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 1, RZG3L_MPXED_PIN_FUNCS(B) | PIN_CFG_IEN),
-	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 2, RZG3L_MPXED_PIN_FUNCS(B) | PIN_CFG_IEN),
-	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 3, RZG3L_MPXED_PIN_FUNCS(B) | PIN_CFG_IEN),
-	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 4, RZG3L_MPXED_PIN_FUNCS(B) | PIN_CFG_IEN),
-	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 5, RZG3L_MPXED_PIN_FUNCS(B) | PIN_CFG_IEN),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 0, RZG2L_MPXED_COMMON_PIN_FUNCS(B) |
+				    PIN_CFG_IO_VMC_SD1),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 1, RZG2L_MPXED_COMMON_PIN_FUNCS(B) |
+				    PIN_CFG_IEN | PIN_CFG_IO_VMC_SD1),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 2, RZG2L_MPXED_COMMON_PIN_FUNCS(B) |
+				    PIN_CFG_IEN | PIN_CFG_IO_VMC_SD1),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 3, RZG2L_MPXED_COMMON_PIN_FUNCS(B) | PIN_CFG_IEN |
+				    PIN_CFG_IO_VMC_SD1),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 4, RZG2L_MPXED_COMMON_PIN_FUNCS(B) |
+				    PIN_CFG_IEN | PIN_CFG_IO_VMC_SD1),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 5, RZG2L_MPXED_COMMON_PIN_FUNCS(B) |
+				    PIN_CFG_IEN | PIN_CFG_IO_VMC_SD1),
 	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 6, RZG3L_MPXED_PIN_FUNCS_POC(B, ISO)),
 	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 7, RZG3L_MPXED_PIN_FUNCS_POC(B, ISO)),
-	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 0, RZG3L_MPXED_PIN_FUNCS(B)),
-	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 1, RZG3L_MPXED_PIN_FUNCS(B) | PIN_CFG_IEN),
-	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 2, RZG3L_MPXED_PIN_FUNCS(B) | PIN_CFG_IEN),
-	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 3, RZG3L_MPXED_PIN_FUNCS(B) | PIN_CFG_IEN),
-	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 4, RZG3L_MPXED_PIN_FUNCS(B) | PIN_CFG_IEN),
-	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 5, RZG3L_MPXED_PIN_FUNCS(B) | PIN_CFG_IEN),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 0, RZG2L_MPXED_COMMON_PIN_FUNCS(B) |
+				    PIN_CFG_IO_VMC_SD2),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 1, RZG2L_MPXED_COMMON_PIN_FUNCS(B) |
+				    PIN_CFG_IEN | PIN_CFG_IO_VMC_SD2),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 2, RZG2L_MPXED_COMMON_PIN_FUNCS(B) |
+				    PIN_CFG_IEN | PIN_CFG_IO_VMC_SD2),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 3, RZG2L_MPXED_COMMON_PIN_FUNCS(B) |
+				    PIN_CFG_IEN | PIN_CFG_IO_VMC_SD2),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 4, RZG2L_MPXED_COMMON_PIN_FUNCS(B) |
+				    PIN_CFG_IEN | PIN_CFG_IO_VMC_SD2),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 5, RZG2L_MPXED_COMMON_PIN_FUNCS(B) |
+				    PIN_CFG_IEN | PIN_CFG_IO_VMC_SD2),
 	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PJ, 0, RZG3L_MPXED_PIN_FUNCS(A) | PIN_CFG_IEN),
 	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PJ, 1, RZG3L_MPXED_PIN_FUNCS(A)),
 	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PJ, 2, RZG3L_MPXED_PIN_FUNCS(A)),
@@ -1053,6 +1070,8 @@ static int rzg2l_caps_to_pwr_reg(const struct rzg2l_register_offsets *regs,
 		return SD_CH(regs->sd_ch, 0);
 	if (caps & PIN_CFG_IO_VMC_SD1)
 		return SD_CH(regs->sd_ch, 1);
+	if (caps & PIN_CFG_IO_VMC_SD2)
+		return regs->sd_ch2;
 	if (caps & PIN_CFG_IO_VMC_ETH0)
 		return ETH_POC(regs->eth_poc, 0);
 	if (caps & PIN_CFG_IO_VMC_ETH1)
@@ -2677,28 +2696,28 @@ static const struct rzg2l_dedicated_configs rzg3l_dedicated_pins[] = {
 	  (PIN_CFG_IOLH_A | PIN_CFG_PUPD | PIN_CFG_PVDD1833_OTH_AWO_POC)) },
 	{ "SCIF0_TXD", RZG2L_SINGLE_PIN_PACK(0x6, 1,
 	  (PIN_CFG_IOLH_A | PIN_CFG_PUPD | PIN_CFG_PVDD1833_OTH_AWO_POC)) },
-	{ "SD0_CLK", RZG2L_SINGLE_PIN_PACK(0x9, 0, PIN_CFG_IOLH_B) },
+	{ "SD0_CLK", RZG2L_SINGLE_PIN_PACK(0x9, 0, PIN_CFG_IOLH_B | PIN_CFG_IO_VMC_SD0) },
 	{ "SD0_CMD", RZG2L_SINGLE_PIN_PACK(0x9, 1,
-	  (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD)) },
-	{ "SD0_RST#", RZG2L_SINGLE_PIN_PACK(0x9, 2, PIN_CFG_IOLH_B) },
+	  (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD | PIN_CFG_IO_VMC_SD0)) },
+	{ "SD0_RST#", RZG2L_SINGLE_PIN_PACK(0x9, 2, PIN_CFG_IOLH_B | PIN_CFG_IO_VMC_SD0) },
 	{ "SD0_DS", RZG2L_SINGLE_PIN_PACK(0x9, 5,
-	  (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD)) },
+	  (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD | PIN_CFG_IO_VMC_SD0)) },
 	{ "SD0_DAT0", RZG2L_SINGLE_PIN_PACK(0x0a, 0,
-	  (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD)) },
+	  (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD | PIN_CFG_IO_VMC_SD0)) },
 	{ "SD0_DAT1", RZG2L_SINGLE_PIN_PACK(0x0a, 1,
-	  (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD)) },
+	  (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD | PIN_CFG_IO_VMC_SD0)) },
 	{ "SD0_DAT2", RZG2L_SINGLE_PIN_PACK(0x0a, 2,
-	  (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD)) },
+	  (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD | PIN_CFG_IO_VMC_SD0)) },
 	{ "SD0_DAT3", RZG2L_SINGLE_PIN_PACK(0x0a, 3,
-	  (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD)) },
+	  (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD | PIN_CFG_IO_VMC_SD0)) },
 	{ "SD0_DAT4", RZG2L_SINGLE_PIN_PACK(0x0a, 4,
-	  (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD)) },
+	  (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD | PIN_CFG_IO_VMC_SD0)) },
 	{ "SD0_DAT5", RZG2L_SINGLE_PIN_PACK(0x0a, 5,
-	  (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD)) },
+	  (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD | PIN_CFG_IO_VMC_SD0)) },
 	{ "SD0_DAT6", RZG2L_SINGLE_PIN_PACK(0x0a, 6,
-	  (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD)) },
+	  (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD | PIN_CFG_IO_VMC_SD0)) },
 	{ "SD0_DAT7", RZG2L_SINGLE_PIN_PACK(0x0a, 7,
-	  (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD)) },
+	  (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD | PIN_CFG_IO_VMC_SD0)) },
 };
 
 static const u32 r9a08g046_clone_channel_data[] = {
@@ -3672,6 +3691,9 @@ static int rzg2l_pinctrl_suspend_noirq(struct device *dev)
 			cache->eth_poc[i] = readb(pctrl->base + ETH_POC(regs->eth_poc, i));
 	}
 
+	if (regs->sd_ch2)
+		cache->sd_ch2 = readb(pctrl->base + regs->sd_ch2);
+
 	if (regs->qspi)
 		cache->qspi = readb(pctrl->base + regs->qspi);
 	cache->oen = readb(pctrl->base + pctrl->data->hwcfg->regs.oen);
@@ -3724,6 +3746,9 @@ static int rzg2l_pinctrl_resume_noirq(struct device *dev)
 	rzg2l_oen_write_with_pwpr(pctrl, cache->oen);
 	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
 
+	if (regs->sd_ch2)
+		writeb(cache->sd_ch2, pctrl->base + regs->sd_ch2);
+
 	for (u8 i = 0; i < 2; i++) {
 		if (regs->sd_ch)
 			writeb(cache->sd_ch[i], pctrl->base + SD_CH(regs->sd_ch, i));
@@ -3794,6 +3819,7 @@ static const struct rzg2l_hwcfg rzg3l_hwcfg = {
 		.eth_poc = 0x3010,
 		.oen = 0x3018,
 		.other_poc = OTHER_POC,
+		.sd_ch2 = 0x3024,
 	},
 	.iolh_groupa_ua = {
 		/* 1v8 power source */
-- 
2.43.0


