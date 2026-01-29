Return-Path: <linux-gpio+bounces-31277-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QB+xIaw0e2mGCQIAu9opvQ
	(envelope-from <linux-gpio+bounces-31277-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 11:21:32 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 31353AE8FA
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 11:21:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3858C3021722
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 10:17:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF07037FF72;
	Thu, 29 Jan 2026 10:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W34IeDKH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC02733CE8F
	for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 10:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769681820; cv=none; b=e3iqQdHY13iWdebTHZFyk8IqNYLvWaPnMmb40FL9Vb3e09UWT9W0Vxw51dUl/J7EYiXlMFtr6ICd1X2+3NKD8p1wL/4cRbwnCyGDbEaalSUQU3YYoQdGf3LG7UAjBdcwaiZNtayr359thLT6u0fBDKiQPXpLPZWlDyY9rhHLF+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769681820; c=relaxed/simple;
	bh=clZzrs0xiHiuryZmmiswKWziwPY99rU9AuPvqtXxfmc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F/IoWnCOKZusrwSxkUq5IGiHX6OV7PuwYgA7BsSVOqn2TGJT8HEGV149Pz2icNVJ5DmpcLNOORh19jPIcuyl7lmOTzCLDqho4Cd7qc+HQfBL0z1W3YxqfxaIRBatJ2dIMlL++M1M/KSBaADw3ug7uaAwEgWlHJANa7p7Lu3SGfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W34IeDKH; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4806ce0f97bso6604545e9.0
        for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 02:16:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769681815; x=1770286615; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M9Q0bB59x9gNqAfAEZotgxiHV1QyCskKWM3iqLx4w7w=;
        b=W34IeDKHsbrg4pJLKFevy2JnFjYCx/HGEkbKdSKOrT9OkWelr3LfrM8Hv8g5+bJ5iC
         IAr9Wg9HbMHgnuBZm1SzFvxvhZj4f2GKlp3MmT9sR5sUngiTG1aEJS0ZVtCrBOLLnNzL
         hx2FcGWdOvMdR63hySHrt4LJGflmhWF5lEJTLlS7wSIqeKRqJXjxl+8A5SVDUmzsl5r0
         ZoEVm/KMwwM0aj9L8Y4cCB8QpHCfkFGyE4RfO0ZmCePMMXhYtu6QiXm54J646lwmOPWJ
         hMv6kq0VS281NALq/94FEIMi19TpaUdgnXn+CAQhFsRGb/zOp8IPyq1R7mh48HSV7Tv6
         4Qvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769681815; x=1770286615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M9Q0bB59x9gNqAfAEZotgxiHV1QyCskKWM3iqLx4w7w=;
        b=HZCENnnkp7xyMlDhEhrL+wodl5kvOPsV+o3rAIvJyxBZfibWcldPsdL/E94PkxfxJm
         t5n4wX6D1XqFE7WY4Il1u8IEd7Z/ycXvebByy3uG3xcrNWPRbzpdSawiIIbmWKpc+9ir
         A+CmnGn7aQjH6Wplpw9BVUTN8dZHoltIaLP/Wn2fuUsrlG2kktPWpZo5TGzpPQNNiMY6
         l6Yjl/wpoqLNV/e2VYuNdH8rRblDUuh/4OGXqH+FV2FyISjGTzgJdrdOZLXHFSvcG2Tf
         RxoJYkcetvVTlIg2+awmbppuzIAVzMUxcf9ZVyqWRHfsVYU5/kTa5tK3v4+TZQkjjyMs
         UfFA==
X-Forwarded-Encrypted: i=1; AJvYcCVWdMBPEto6uS309UAUvqegnyeUzUZn6lShFAiZvABUVz5Uxlp08hF/gzE9QWqe0RS9YqDNejZFvT4g@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/pWUFTVJaxY9Kna4H+3eLTdPKoC9H3dA+BQQMtVxoih6tvkIm
	2PY1CLeTc82vvdMxtLdqblvdg2usK003x2EDVbXxaPBCPZr+1ZfbE5VM
X-Gm-Gg: AZuq6aJdW5BTA/AS9V7gveoPmYPgtjkf9tY5UzYSL2TRdhtERxrhlkM5v7zjB1venIG
	kSDP1FCeaN6MjZnrpMUEki6ilZOcSZvSRIamQby4oVcvi24agbeqn7MqbFzBRv8FFSKK/y8a9SZ
	9pq7wr5udukjGrCE6k1BdMo+8M98Z4t3TtbKrwRN58q2XqFhh4b8MHBownH5RVvIH3+9WeB+yf4
	zAD30DfLKsaGWUPEpTRPOLZ0CjG2rS9a3jyUhbHrs3/v0hhLsijKlEP1o52mhaiOJAuCEFX0jnI
	Oswbre/ukyq4zcNIh0Kn3BJyqyOm+YrLdBCUcp9Mb2OLej0wM2l+1CYH/GXEpFoPsRVxUUJgfru
	ho4FuZTK8MI3uxjhV26Hq2PSK3vl9EkoQHKgdXKsshpdv7URJf9H5VjQeRh1tbCuhhQjETc+ZUt
	TzpEdOVVNz1r7SEB0mnK7g9tUHTOU=
X-Received: by 2002:a05:600c:3acd:b0:480:690e:f14a with SMTP id 5b1f17b1804b1-48069c32249mr99271735e9.14.1769681814472;
        Thu, 29 Jan 2026 02:16:54 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:5792:2065:403:a80b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066be77b5sm178642065e9.2.2026.01.29.02.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 02:16:54 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: biju.das.au@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH RESEND 6/9] pinctrl: renesas: rzg2l: Add support for RZ/G3L SoC
Date: Thu, 29 Jan 2026 10:16:41 +0000
Message-ID: <a88c7959d1b35256eb02e793c924102785dbc86e.1769681553.git.biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1769681553.git.biju.das.jz@bp.renesas.com>
References: <cover.1769681553.git.biju.das.jz@bp.renesas.com>
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31277-lists,linux-gpio=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,glider.be,kernel.org,gmail.com,baylibre.com];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 31353AE8FA
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

Add pinctrl driver support for RZ/G3L SoC.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 228 ++++++++++++++++++++++++
 1 file changed, 228 insertions(+)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 5e3e56e32cea..e45282afcf86 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -26,6 +26,7 @@
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinmux.h>
 
+#include <dt-bindings/pinctrl/renesas,r9a08g046-pinctrl.h>
 #include <dt-bindings/pinctrl/renesas,r9a09g047-pinctrl.h>
 #include <dt-bindings/pinctrl/renesas,r9a09g057-pinctrl.h>
 #include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
@@ -93,6 +94,17 @@
 
 #define RZG2L_MPXED_ETH_PIN_FUNCS(x)	((x) | PIN_CFG_NF)
 
+#define RZG3L_MPXED_ETH_PIN_FUNCS(ether) \
+					(PIN_CFG_IO_VMC_##ether | \
+					 PIN_CFG_IOLH_C | \
+					 PIN_CFG_NF)
+
+#define RZG3L_MPXED_PIN_FUNCS(group)	(RZG2L_MPXED_COMMON_PIN_FUNCS(group) | \
+					 PIN_CFG_SOFT_PS)
+
+#define RZG3L_MPXED_PIN_FUNCS_POC(grp, poc) (RZG3L_MPXED_PIN_FUNCS(grp) | \
+					 PIN_CFG_PVDD1833_OTH_##poc##_POC)
+
 #define PIN_CFG_PIN_MAP_MASK		GENMASK_ULL(61, 54)
 #define PIN_CFG_PIN_REG_MASK		GENMASK_ULL(53, 46)
 #define PIN_CFG_MASK			GENMASK_ULL(31, 0)
@@ -229,12 +241,14 @@ static const struct pin_config_item renesas_rzv2h_conf_items[] = {
  * @sd_ch: SD_CH register offset
  * @eth_poc: ETH_POC register offset
  * @oen: OEN register offset
+ * @other_poc: OTHER_POC register offset
  */
 struct rzg2l_register_offsets {
 	u16 pwpr;
 	u16 sd_ch;
 	u16 eth_poc;
 	u16 oen;
+	u16 other_poc;
 };
 
 /**
@@ -333,6 +347,7 @@ struct rzg2l_pinctrl_pin_settings {
  * @smt: SMT registers cache
  * @sd_ch: SD_CH registers cache
  * @eth_poc: ET_POC registers cache
+ * @other_poc: OTHER_POC register cache
  * @oen: Output Enable register cache
  * @qspi: QSPI registers cache
  */
@@ -348,6 +363,7 @@ struct rzg2l_pinctrl_reg_cache {
 	u8	sd_ch[2];
 	u8	eth_poc[2];
 	u8	oen;
+	u8      other_poc;
 	u8	qspi;
 };
 
@@ -397,6 +413,60 @@ static u64 rzg2l_pinctrl_get_variable_pin_cfg(struct rzg2l_pinctrl *pctrl,
 	return 0;
 }
 
+static const u64 r9a08g046_variable_pin_cfg[] = {
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PA, 0, RZG3L_MPXED_ETH_PIN_FUNCS(ETH0) | PIN_CFG_IEN),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PA, 1, RZG3L_MPXED_ETH_PIN_FUNCS(ETH0)),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PA, 2, RZG3L_MPXED_ETH_PIN_FUNCS(ETH0)),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PA, 3, RZG3L_MPXED_ETH_PIN_FUNCS(ETH0)),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PA, 4, RZG3L_MPXED_ETH_PIN_FUNCS(ETH0)),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PA, 5, RZG3L_MPXED_ETH_PIN_FUNCS(ETH0)),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PA, 6, RZG3L_MPXED_ETH_PIN_FUNCS(ETH0) | PIN_CFG_IEN),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PA, 7, RZG3L_MPXED_ETH_PIN_FUNCS(ETH0)),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PB, 0, RZG3L_MPXED_ETH_PIN_FUNCS(ETH0)),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PB, 1, RZG3L_MPXED_ETH_PIN_FUNCS(ETH0) | PIN_CFG_OEN),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PB, 2, RZG3L_MPXED_ETH_PIN_FUNCS(ETH0)),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PB, 3, RZG3L_MPXED_ETH_PIN_FUNCS(ETH0)),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PB, 4, RZG3L_MPXED_ETH_PIN_FUNCS(ETH0)),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PB, 5, RZG3L_MPXED_ETH_PIN_FUNCS(ETH0)),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PB, 6, RZG3L_MPXED_ETH_PIN_FUNCS(ETH0)),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PB, 7, RZG3L_MPXED_ETH_PIN_FUNCS(ETH0)),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PD, 0, RZG3L_MPXED_ETH_PIN_FUNCS(ETH1) | PIN_CFG_IEN),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PD, 1, RZG3L_MPXED_ETH_PIN_FUNCS(ETH1)),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PD, 2, RZG3L_MPXED_ETH_PIN_FUNCS(ETH1)),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PD, 3, RZG3L_MPXED_ETH_PIN_FUNCS(ETH1)),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PD, 4, RZG3L_MPXED_ETH_PIN_FUNCS(ETH1)),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PD, 5, RZG3L_MPXED_ETH_PIN_FUNCS(ETH1)),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PD, 6, RZG3L_MPXED_ETH_PIN_FUNCS(ETH1)),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PD, 7, RZG3L_MPXED_ETH_PIN_FUNCS(ETH1)),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PE, 0, RZG3L_MPXED_ETH_PIN_FUNCS(ETH1)),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PE, 1, RZG3L_MPXED_ETH_PIN_FUNCS(ETH1) | PIN_CFG_OEN),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PE, 2, RZG3L_MPXED_ETH_PIN_FUNCS(ETH1)),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PE, 3, RZG3L_MPXED_ETH_PIN_FUNCS(ETH1)),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PE, 4, RZG3L_MPXED_ETH_PIN_FUNCS(ETH1)),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PE, 5, RZG3L_MPXED_ETH_PIN_FUNCS(ETH1)),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PE, 6, RZG3L_MPXED_ETH_PIN_FUNCS(ETH1)),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PE, 7, RZG3L_MPXED_ETH_PIN_FUNCS(ETH1)),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 0, RZG3L_MPXED_PIN_FUNCS(B)),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 1, RZG3L_MPXED_PIN_FUNCS(B) | PIN_CFG_IEN),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 2, RZG3L_MPXED_PIN_FUNCS(B) | PIN_CFG_IEN),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 3, RZG3L_MPXED_PIN_FUNCS(B) | PIN_CFG_IEN),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 4, RZG3L_MPXED_PIN_FUNCS(B) | PIN_CFG_IEN),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 5, RZG3L_MPXED_PIN_FUNCS(B) | PIN_CFG_IEN),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 6, RZG3L_MPXED_PIN_FUNCS_POC(B, ISO)),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PG, 7, RZG3L_MPXED_PIN_FUNCS_POC(B, ISO)),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 0, RZG3L_MPXED_PIN_FUNCS(B)),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 1, RZG3L_MPXED_PIN_FUNCS(B) | PIN_CFG_IEN),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 2, RZG3L_MPXED_PIN_FUNCS(B) | PIN_CFG_IEN),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 3, RZG3L_MPXED_PIN_FUNCS(B) | PIN_CFG_IEN),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 4, RZG3L_MPXED_PIN_FUNCS(B) | PIN_CFG_IEN),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PH, 5, RZG3L_MPXED_PIN_FUNCS(B) | PIN_CFG_IEN),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PJ, 0, RZG3L_MPXED_PIN_FUNCS(A) | PIN_CFG_IEN),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PJ, 1, RZG3L_MPXED_PIN_FUNCS(A)),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PJ, 2, RZG3L_MPXED_PIN_FUNCS(A)),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PJ, 3, RZG3L_MPXED_PIN_FUNCS(A)),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3L_PJ, 4, RZG3L_MPXED_PIN_FUNCS(A)),
+};
+
 static const u64 r9a09g047_variable_pin_cfg[] = {
 	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3E_PA, 0, RZV2H_MPXED_PIN_FUNCS | PIN_CFG_IEN),
 	RZG2L_VARIABLE_PIN_CFG_PACK(RZG3E_PA, 1, RZV2H_MPXED_PIN_FUNCS),
@@ -2141,6 +2211,70 @@ static const u64 r9a09g047_gpio_configs[] = {
 	RZG2L_GPIO_PORT_PACK(4, 0x3c, RZV2H_MPXED_PIN_FUNCS),	/* PS */
 };
 
+static const char * const rzg3l_gpio_names[] = {
+	"", "", "", "", "", "", "", "",
+	"", "", "", "", "", "", "", "",
+	"P20", "P21", "P22", "P23", "P24", "P25", "P26", "P27",
+	"P30", "P31", "P32", "P33", "P34", "P35", "P36", "P37",
+	"", "", "", "", "", "", "", "",
+	"P50", "P51", "P52", "P53", "P54", "P55", "P56", "P57",
+	"P60", "P61", "P62", "P63", "P64", "P65", "P66", "P67",
+	"P70", "P71", "P72", "P73", "P74", "P75", "P76", "P77",
+	"P80", "P81", "P82", "P83", "P84", "P85", "P86", "P87",
+	"", "", "", "", "", "", "", "",
+	"PA0", "PA1", "PA2", "PA3", "PA4", "PA5", "PA6", "PA7",
+	"PB0", "PB1", "PB2", "PB3", "PB4", "PB5", "PB6", "PB7",
+	"PC0", "PC1", "PC2", "PC3", "PC4", "PC5", "PC6", "PC7",
+	"PD0", "PD1", "PD2", "PD3", "PD4", "PD5", "PD6", "PD7",
+	"PE0", "PE1", "PE2", "PE3", "PE4", "PE5", "PE6", "PE7",
+	"PF0", "PF1", "PF2", "PF3", "PF4", "PF5", "PF6", "PF7",
+	"PG0", "PG1", "PG2", "PG3", "PG4", "PG5", "PG6", "PG7",
+	"PH0", "PH1", "PH2", "PH3", "PH4", "PH5", "PH6", "PH7",
+	"", "", "", "", "", "", "", "",
+	"PJ0", "PJ1", "PJ2", "PJ3", "PJ4", "PJ5", "PJ6", "PJ7",
+	"PK0", "PK1", "PK2", "PK3", "PK4", "PK5", "PK6", "PK7",
+	"PL0", "PL1", "PL2", "PL3", "PL4", "PL5", "PL6", "PL7",
+	"PM0", "PM1", "PM2", "PM3", "PM4", "PM5", "PM6", "PM7",
+	"", "", "", "", "", "", "", "",
+	"", "", "", "", "", "", "", "",
+	"", "", "", "", "", "", "", "",
+	"", "", "", "", "", "", "", "",
+	"", "", "", "", "", "", "", "",
+	"PS0", "PS1", "PS2", "PS3", "PS4", "PS5", "PS6", "PS7",
+};
+
+static const u64 r9a08g046_gpio_configs[] = {
+	0x0,
+	0x0,
+	RZG2L_GPIO_PORT_PACK(2, 0x22, PIN_CFG_NF | PIN_CFG_IEN),	/* P2 */
+	RZG2L_GPIO_PORT_PACK(7, 0x23, RZG3L_MPXED_PIN_FUNCS_POC(A, AWO)), /* P3 */
+	0x0,
+	RZG2L_GPIO_PORT_PACK(7, 0x25, RZG3L_MPXED_PIN_FUNCS_POC(A, AWO)), /* P5 */
+	RZG2L_GPIO_PORT_PACK(7, 0x26, RZG3L_MPXED_PIN_FUNCS_POC(A, AWO)), /* P6 */
+	RZG2L_GPIO_PORT_PACK(8, 0x27, RZG3L_MPXED_PIN_FUNCS_POC(A, AWO)), /* P7 */
+	RZG2L_GPIO_PORT_PACK(6, 0x28, RZG3L_MPXED_PIN_FUNCS_POC(A, AWO)), /* P8 */
+	0x0,
+	RZG2L_GPIO_PORT_PACK_VARIABLE(8, 0x2a),				/* PA */
+	RZG2L_GPIO_PORT_PACK_VARIABLE(8, 0x2b),				/* PB */
+	RZG2L_GPIO_PORT_PACK(3, 0x2c, RZG3L_MPXED_ETH_PIN_FUNCS(ETH0)),	/* PC */
+	RZG2L_GPIO_PORT_PACK_VARIABLE(8, 0x2d),				/* PD */
+	RZG2L_GPIO_PORT_PACK_VARIABLE(8, 0x2e),				/* PE */
+	RZG2L_GPIO_PORT_PACK(3, 0x2f, RZG3L_MPXED_ETH_PIN_FUNCS(ETH1)),	/* PF */
+	RZG2L_GPIO_PORT_PACK_VARIABLE(8, 0x30),				/* PG */
+	RZG2L_GPIO_PORT_PACK_VARIABLE(6, 0x31),				/* PH */
+	0x0,
+	RZG2L_GPIO_PORT_PACK_VARIABLE(5, 0x33),				/* PJ */
+	RZG2L_GPIO_PORT_PACK(4, 0x34, RZG3L_MPXED_PIN_FUNCS_POC(B, AWO)), /* PK */
+	RZG2L_GPIO_PORT_PACK(5, 0x35, RZG3L_MPXED_PIN_FUNCS(C)),	/* PL */
+	RZG2L_GPIO_PORT_PACK(8, 0x36, RZG3L_MPXED_PIN_FUNCS(C)),	/* PM */
+	0x0,
+	0x0,
+	0x0,
+	0x0,
+	0x0,
+	RZG2L_GPIO_PORT_PACK(2, 0x3c, RZG3L_MPXED_PIN_FUNCS(A)),	/* PS */
+};
+
 static const char * const rzv2h_gpio_names[] = {
 	"P00", "P01", "P02", "P03", "P04", "P05", "P06", "P07",
 	"P10", "P11", "P12", "P13", "P14", "P15", "P16", "P17",
@@ -2479,6 +2613,37 @@ static struct rzg2l_dedicated_configs rzg3e_dedicated_pins[] = {
 	 (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR | PIN_CFG_IEN | PIN_CFG_PUPD)) },
 };
 
+static const struct rzg2l_dedicated_configs rzg3l_dedicated_pins[] = {
+	{ "WDTOVF_N", RZG2L_SINGLE_PIN_PACK(0x5, 0,
+	  (PIN_CFG_IOLH_A | PIN_CFG_WDTOVF_N_POC)) },
+	{ "SCIF_RXD", RZG2L_SINGLE_PIN_PACK(0x6, 0,
+	  (PIN_CFG_IOLH_A | PIN_CFG_PUPD | PIN_CFG_PVDD1833_OTH_AWO_POC)) },
+	{ "SCIF_TXD", RZG2L_SINGLE_PIN_PACK(0x6, 1,
+	  (PIN_CFG_IOLH_A | PIN_CFG_PUPD | PIN_CFG_PVDD1833_OTH_AWO_POC)) },
+	{ "SD0_CLK", RZG2L_SINGLE_PIN_PACK(0x9, 0,  PIN_CFG_IOLH_B) },
+	{ "SD0_CMD", RZG2L_SINGLE_PIN_PACK(0x9, 1,
+	  (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD)) },
+	{ "SD0_RST#", RZG2L_SINGLE_PIN_PACK(0x9, 2, PIN_CFG_IOLH_B) },
+	{ "SD0_DS", RZG2L_SINGLE_PIN_PACK(0x9, 5,
+	  (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD)) },
+	{ "SD0_DATA0", RZG2L_SINGLE_PIN_PACK(0x0a, 0,
+	  (PIN_CFG_IOLH_B |  PIN_CFG_IEN | PIN_CFG_PUPD)) },
+	{ "SD0_DATA1", RZG2L_SINGLE_PIN_PACK(0x0a, 1,
+	  (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD)) },
+	{ "SD0_DATA2", RZG2L_SINGLE_PIN_PACK(0x0a, 2,
+	  (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD)) },
+	{ "SD0_DATA3", RZG2L_SINGLE_PIN_PACK(0x0a, 3,
+	  (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD)) },
+	{ "SD0_DATA4", RZG2L_SINGLE_PIN_PACK(0x0a, 4,
+	  (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD)) },
+	{ "SD0_DATA5", RZG2L_SINGLE_PIN_PACK(0x0a, 5,
+	  (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD)) },
+	{ "SD0_DATA6", RZG2L_SINGLE_PIN_PACK(0x0a, 6,
+	  (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD)) },
+	{ "SD0_DATA7", RZG2L_SINGLE_PIN_PACK(0x0a, 7,
+	  (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD)) },
+};
+
 static int rzg2l_gpio_get_gpioint(unsigned int virq, struct rzg2l_pinctrl *pctrl)
 {
 	const struct pinctrl_pin_desc *pin_desc = &pctrl->desc.pins[virq];
@@ -3007,6 +3172,9 @@ static int rzg2l_pinctrl_probe(struct platform_device *pdev)
 	BUILD_BUG_ON(ARRAY_SIZE(r9a08g045_gpio_configs) * RZG2L_PINS_PER_PORT >
 		     ARRAY_SIZE(rzg2l_gpio_names));
 
+	BUILD_BUG_ON(ARRAY_SIZE(r9a08g046_gpio_configs) * RZG2L_PINS_PER_PORT >
+		     ARRAY_SIZE(rzg3l_gpio_names));
+
 	BUILD_BUG_ON(ARRAY_SIZE(r9a09g047_gpio_configs) * RZG2L_PINS_PER_PORT >
 		     ARRAY_SIZE(rzg3e_gpio_names));
 
@@ -3254,6 +3422,8 @@ static int rzg2l_pinctrl_suspend_noirq(struct device *dev)
 
 	cache->qspi = readb(pctrl->base + QSPI);
 	cache->oen = readb(pctrl->base + pctrl->data->hwcfg->regs.oen);
+	if (regs->other_poc)
+		cache->other_poc = readb(pctrl->base + regs->other_poc);
 
 	if (!atomic_read(&pctrl->wakeup_path))
 		clk_disable_unprepare(pctrl->clk);
@@ -3279,6 +3449,8 @@ static int rzg2l_pinctrl_resume_noirq(struct device *dev)
 	}
 
 	writeb(cache->qspi, pctrl->base + QSPI);
+	if (regs->other_poc)
+		writeb(cache->other_poc, pctrl->base + regs->other_poc);
 
 	raw_spin_lock_irqsave(&pctrl->lock, flags);
 	rzg2l_oen_write_with_pwpr(pctrl, cache->oen);
@@ -3380,6 +3552,41 @@ static const struct rzg2l_hwcfg rzg3s_hwcfg = {
 	.oen_max_port = 7, /* P7_1 is the maximum OEN port. */
 };
 
+static const struct rzg2l_hwcfg rzg3l_hwcfg = {
+	.regs = {
+		.pwpr = 0x3000,
+		.sd_ch = 0x3004,
+		.eth_poc = 0x3010,
+		.oen = 0x3018,
+		.other_poc = 0x3028,
+	},
+	.iolh_groupa_ua = {
+		/* 1v8 power source */
+		[RZG2L_IOLH_IDX_1V8] = 2200, 4400, 9000, 10000,
+		/* 3v3 power source */
+		[RZG2L_IOLH_IDX_3V3] = 1900, 4000, 8000, 9000,
+	},
+	.iolh_groupb_ua = {
+		/* 1v8 power source */
+		[RZG2L_IOLH_IDX_1V8] = 7000, 8000, 9000, 10000,
+		/* 3v3 power source */
+		[RZG2L_IOLH_IDX_3V3] = 4000, 6000, 8000, 9000,
+	},
+	.iolh_groupc_ua = {
+		/* 1v8 power source */
+		[RZG2L_IOLH_IDX_1V8] = 5200, 6000, 6550, 6800,
+		/* 2v5 source */
+		[RZG2L_IOLH_IDX_2V5] = 4700, 5300, 5800, 6100,
+		/* 3v3 power source */
+		[RZG2L_IOLH_IDX_3V3] = 4500, 5200, 5700, 6050,
+	},
+	.tint_start_index = 17,
+	.drive_strength_ua = true,
+	.func_base = 0,
+	.oen_max_pin = 1, /* Pin 1 of PE1_ISO is the maximum OEN pin. */
+	.oen_max_port = 14, /* PE1_ISO is the maximum OEN port. */
+};
+
 static const struct rzg2l_hwcfg rzv2h_hwcfg = {
 	.regs = {
 		.pwpr = 0x3c04,
@@ -3439,6 +3646,23 @@ static struct rzg2l_pinctrl_data r9a08g045_data = {
 	.bias_param_to_hw = &rzg2l_bias_param_to_hw,
 };
 
+static struct rzg2l_pinctrl_data r9a08g046_data = {
+	.port_pins = rzg3l_gpio_names,
+	.port_pin_configs = r9a08g046_gpio_configs,
+	.n_ports = ARRAY_SIZE(r9a08g046_gpio_configs),
+	.variable_pin_cfg = r9a08g046_variable_pin_cfg,
+	.n_variable_pin_cfg = ARRAY_SIZE(r9a08g046_variable_pin_cfg),
+	.dedicated_pins = rzg3l_dedicated_pins,
+	.n_port_pins = ARRAY_SIZE(r9a08g046_gpio_configs) * RZG2L_PINS_PER_PORT,
+	.n_dedicated_pins = ARRAY_SIZE(rzg3l_dedicated_pins),
+	.hwcfg = &rzg3l_hwcfg,
+	.pwpr_pfc_lock_unlock = &rzg2l_pwpr_pfc_lock_unlock,
+	.pmc_writeb = &rzg2l_pmc_writeb,
+	.pin_to_oen_bit = &rzg3l_pin_to_oen_bit,
+	.hw_to_bias_param = &rzg2l_hw_to_bias_param,
+	.bias_param_to_hw = &rzg2l_bias_param_to_hw,
+};
+
 static struct rzg2l_pinctrl_data r9a09g047_data = {
 	.port_pins = rzg3e_gpio_names,
 	.port_pin_configs = r9a09g047_gpio_configs,
@@ -3519,6 +3743,10 @@ static const struct of_device_id rzg2l_pinctrl_of_table[] = {
 		.compatible = "renesas,r9a08g045-pinctrl",
 		.data = &r9a08g045_data,
 	},
+	{
+		.compatible = "renesas,r9a08g046-pinctrl",
+		.data = &r9a08g046_data,
+	},
 	{
 		.compatible = "renesas,r9a09g047-pinctrl",
 		.data = &r9a09g047_data,
-- 
2.43.0


