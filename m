Return-Path: <linux-gpio+bounces-31271-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cKB0Fpgke2nXBgIAu9opvQ
	(envelope-from <linux-gpio+bounces-31271-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 10:12:56 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 18763AE014
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 10:12:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CE0B430498E0
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 09:11:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9152337F8D5;
	Thu, 29 Jan 2026 09:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Eq+L8Q6a"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32CD937F10C
	for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 09:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769677880; cv=none; b=Zw9fIc5csifTMr+IJqWMzxaMOhsXHh29/IlBPD4hbu3td7J0/9Q1FWgSY1efbab8oy5xQ9YlzAwQvrJ57XFnaoRv3nz9CZ5yaIDAmfYiYjB5rTCBFr1AjtTVHIFPHJg2NXgZPm5qMyFD04sI3/zcgs8M53sS0r/sCjpAA8U/xsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769677880; c=relaxed/simple;
	bh=clZzrs0xiHiuryZmmiswKWziwPY99rU9AuPvqtXxfmc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K1LmfGYhFWI/RVpNE8pjGzGVILpP7vuCE9Dn3+STweeiuTy0wFbPReMm1/F9vtWmPAD0zI8igZqL/CEzlB/bQrIOXW5Ip0irjN7900BnzFuBGIXPAgRcidpK0x+sXw5RgjxX0EvKD3IOrFMa5CISDNdN7QKdhLd+AN5ssXwACOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Eq+L8Q6a; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-481188b7760so3454005e9.0
        for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 01:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769677874; x=1770282674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M9Q0bB59x9gNqAfAEZotgxiHV1QyCskKWM3iqLx4w7w=;
        b=Eq+L8Q6anAONgU0BQbkcvfvVaKzHfjCjUSSrcOb/sl3kc6TJO3463f3G2BA2QwxuH4
         hSiCoUEGlz4reCtq06dre/kcu6xTSbhVkIVHNY8XVnlnjQngREdRmXtUAJ3VSk2usPkG
         2eTpQqQmmn6RZy0KGaj6fpgc5ZCr/9DUjOE5cBSvznevxjbYoeTd/weaRO13wlULyVwg
         BQxQ8cH6+pTU3IEdftY1Iez/kZHaCkXNqMQRXDZBsQFHsMYNW4WmTMkEOSafMd8lRhD5
         etQkWO4syacfEhE64+ulu84tvIxz2V0VJd7Ha29SYP24sx4rytjLtQyr9oXcaJ1gImnv
         +ktg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769677874; x=1770282674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M9Q0bB59x9gNqAfAEZotgxiHV1QyCskKWM3iqLx4w7w=;
        b=Z9SzNFyYqN2C83tbZAkaE8Wsb15ohlzXDPVqngafvprxO36ruoB2HxVHTnh4mu/6Z+
         TjC2RYNQh3YkEDp1I/wW/j0aiX4XEn26gDkrmqXyKvXSAHo9kUQ+Sla4N3U8tkJvyilI
         Yp3IHrJkXd3uxidtb6b+2lyTtYllx9OYuP8znWXlpCOV4o95Y1M7HqDXqhTITVIBO9M4
         YfajE+ov815N4xpOU12k/bC0MQBYqezQQDOJlkSqbGer8wP8owHfuMc240ttg6OCIgaz
         7ke2SJ7M+8LErQSwl+s2mXUZ/PSmrKYBW9YgDBzjfXcFPnNb1soEBvye1EBD+jSWqaj9
         cgZA==
X-Forwarded-Encrypted: i=1; AJvYcCW3UkaJGnQd2/9roB+CP289E9eRpE//bycj1SHOWwIyK9oUPw1Ne3zHyU40R9zW2MtyEpio1stW7mmr@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd836ZaPfWVJEhcYXOJ9m6vwU8uChaSqVv10/S6hVYIma0yh5P
	1dGr4n0CDd9r1eY5yJRua4zSok6iG3Y1gpNSwyy3DTXU688KlVyPGjMm
X-Gm-Gg: AZuq6aJtmDDGJiOR9lAr4CLf7JCcj35ljf/tZMxjr4looTE8QmeFqqIA59azuxb+7i0
	EEIJYa0rD3Op0ZMft/74YT1b1kX7n1Y/63Csluwskz+TOflb1fxS8z2nP15kP00YKBZ55y5PcK3
	qa2Zg9CVpupULPwZTZ9aWBEmaDfwpz9mqECFfb0jvbwk9MYNwOYZ4dgpTqqrIM0yjdQKbRqjXtI
	5DNKXzvco36qayFbpFy84B74COqwXrg40bN1kbRuZh/l7xeBKWSSJvjAUmCciQKljOaEB8EzBu6
	tGnwcHcqtFWeHPpO7NUJgMNoTFMtq9Ae3UjtbXiIB56IbOAsvzIKyjkR0Rfu+kh6FtuXVJDG750
	q2bKax3M0N1EJYDJrEvuXDwiA+TzmJstb+AvlmsaDuW7L+lwi1MeXHiVQzEFKv65BpOXNHU01HR
	gYlGGlIFOpyFUeEI6n
X-Received: by 2002:a05:600c:1e1c:b0:479:2f95:5179 with SMTP id 5b1f17b1804b1-48069c161d3mr102454155e9.15.1769677874065;
        Thu, 29 Jan 2026 01:11:14 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:5792:2065:403:a80b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066be77b5sm175338875e9.2.2026.01.29.01.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 01:11:13 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 6/9] pinctrl: renesas: rzg2l: Add support for RZ/G3L SoC
Date: Thu, 29 Jan 2026 09:10:57 +0000
Message-ID: <20260129091108.95277-7-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260129091108.95277-1-biju.das.jz@bp.renesas.com>
References: <20260129091108.95277-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31271-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	FREEMAIL_TO(0.00)[glider.be,kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-gpio@vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 18763AE014
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


