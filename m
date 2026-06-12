Return-Path: <linux-gpio+bounces-38367-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0Gq7GvfbK2pCGgQAu9opvQ
	(envelope-from <linux-gpio+bounces-38367-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jun 2026 12:14:15 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CD799678A10
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jun 2026 12:14:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=LA8TuyMC;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38367-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38367-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 83D45317F4AD
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jun 2026 10:14:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D65C13ABD95;
	Fri, 12 Jun 2026 10:13:56 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D96D396590
	for <linux-gpio@vger.kernel.org>; Fri, 12 Jun 2026 10:13:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781259236; cv=none; b=Fg1c/03lwfUKkH3FRaKTw390ipAnsD4FVBLfJb9CuuN8khXXgehPgInsp5MgtoqlZP+Fy5JCf4KuQMuBoTf+GIiZc+p+45jhV3pdsyCBEJ0ygFf08M7F1r6D6uqoOAcdL2k9BohJCbB5Z/gl65ThmreiD5m8Iq+oNTrDPFa72Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781259236; c=relaxed/simple;
	bh=+y83APaq45dV6i91vialCAY55/KaS/+eVFtxxVd+HYw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fwM1U4YOmMs8S/wrD7NsBhuaC6pTFQ/Nm1xddjxFTHyu9XNepnUJy9xt6lzfZEZM+C85J5IXbNghSPIVSp9EeJadhFRk/74T4Q4svOmDSKazdXZlTeZ5XPlekW7PMqxsrQ+2WBZx3U2StiELTSciqkKmnpjOn/S3Yu90yyOmODY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LA8TuyMC; arc=none smtp.client-ip=209.85.215.178
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c8585cd8400so245038a12.3
        for <linux-gpio@vger.kernel.org>; Fri, 12 Jun 2026 03:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781259235; x=1781864035; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xpH6P+D9eFzK0L+hIpb7prgapd5YPxxTa6iJW4YdmSo=;
        b=LA8TuyMCU/+eLnmcDSjzpzY6TWbjQ6WrpNlNKnVkj+7Z2/UK+tBDpboV202Mi7kDEU
         KRMbO4mPtylf3JSLDLPBigijq6oJoFliPnrz5jKbdWGulZR+Hb/oH+aDJbUPDM5BY5OA
         j/GCOZ6uRJcV1zD6+JJkj/aXCB5xYVZqbzMR/vqYr0piCT3/rOV8dY54HVDWA8iBQT34
         w7OV+bC0iIViRoEnQzx6xviKvuz9vU3ywd4tN2/OAnDUaXadvMxtxl68BPoAoQprRS4j
         4fzYbXWbtXIpRUS2syae2HLO30Qu4T4AFTeYQ0BeFlIVPoXSLZZ9c6vwE74r2cLJF5Qi
         ubvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781259235; x=1781864035;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xpH6P+D9eFzK0L+hIpb7prgapd5YPxxTa6iJW4YdmSo=;
        b=MRgOaSH21nhlY6iKtJfRAvJiTek7lOaFynE+4+Al892fIYNsk7o9V2YvkahPlUy7f9
         C2yUqeWq0bPBQlfObpnVeacaaWDxzy9Wfx6xQEatFBrC4Ywpat0oBtBvZWaZvDn+9X0M
         gpaPTE3u5Ec1scFLxO38WFtc/mGbnZo0IiwbHouZ695IJTTZ6jxXQJfxbEv9ayT2zb7n
         PoiA/qDt+n/g98JfbhNJc6CcMDhLltO6evbsiOW9qBGXsoaHvPexEPTZYoHLlQLANYt3
         fRoYM/2H5wyBamyXevMUdvJkfn+f5h6Ld8o2sDJhXhMK30/PbJtacNkXDmA9LKV7bPBA
         kVig==
X-Forwarded-Encrypted: i=1; AFNElJ+2Xss+f8cZTKrn6iDrUNzATRCRgNyOcjOswx9B7SoHNtwXcVPwSCWm1sAQTSBvztlfpEqmp2MyiRZn@vger.kernel.org
X-Gm-Message-State: AOJu0YyWAjac+yu5JhI0qs1hFSDRrTBkxKRzrk1+SqDOUv3pMuKnkoga
	72oENkaPkWto/82hQnJ5urSN26rpYVqcMae4Gc/CPb/jNSmeyouBqGhyFSYZ+PB/2Yk=
X-Gm-Gg: Acq92OGlTL//yvwKwGG6vpU/095Ebr8mIkWsznz1/RPElsJWm33kS3RVb4mShrAbeQa
	S6KHypTNg267tkH9tfnvTYeePncXPpTbp64JmHpTTbTKie0fCEw5ekzfghTGGbruHZpJTktr2M3
	sXqgGHASOF6bfoDONzTI3qMG/DNlVib162U+I1B01fRcciMlru8SOREHJ4o+EcXw02lIhlwIpg7
	EXkwCI9NdSY+Ze6jaLz4tUcftqa3qnFNAEdlFFcxa6mNJuJfmPPmdqvs3+0cjWaduNFFbcifZaS
	qoXjWD+2hCgedkP6AALDbIbIua0I/G/u0wKsU0vrJyP3cdGeCEg+HH2ez2j5I0pqTW1Kt2UzIkY
	WIUyjI0M9m1XJh9viEdAseJgv78+SuzW7KN2Ot3c0Pd3LEbB/rpfktY6rk7CzWdc8a3e9HhJxQ6
	fJcGh0QLynH8bBBPJdv0is
X-Received: by 2002:a05:6a20:728d:b0:398:b178:a53f with SMTP id adf61e73a8af0-3b784021a1amr2833611637.40.1781259234808;
        Fri, 12 Jun 2026 03:13:54 -0700 (PDT)
Received: from [127.0.1.1] ([150.117.174.129])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c86651adc16sm1557909a12.31.2026.06.12.03.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 03:13:54 -0700 (PDT)
From: GaryWang <is0124@gmail.com>
Date: Fri, 12 Jun 2026 18:13:32 +0800
Subject: [PATCH v2 1/2] pinctrl: tigerlake: add some pin groups and
 functions for INTC1055
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-upboard-pinctrl-add-upboard-intc1055-support-v2-1-4111b256c840@gmail.com>
References: <20260612-upboard-pinctrl-add-upboard-intc1055-support-v2-0-4111b256c840@gmail.com>
In-Reply-To: <20260612-upboard-pinctrl-add-upboard-intc1055-support-v2-0-4111b256c840@gmail.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Thomas Richard <thomas.richard@bootlin.com>
Cc: Daniele Cleri <danielecleri@aaeon.eu>, 
 JunYingLai <junyinglai@aaeon.com.tw>, Louis Chen <louischen@aaeon.com.tw>, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 GaryWang <is0124@gmail.com>
X-Mailer: b4 0.13.0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38367-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[aaeon.eu,aaeon.com.tw,vger.kernel.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[is0124@gmail.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mika.westerberg@linux.intel.com,m:andy@kernel.org,m:linusw@kernel.org,m:thomas.richard@bootlin.com,m:danielecleri@aaeon.eu,m:junyinglai@aaeon.com.tw,m:louischen@aaeon.com.tw,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:is0124@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[is0124@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CD799678A10

Add i2c0, i2c1, pwm0, uart1, ssp2 pin groups & functions in tgllp_soc_data
 for device id INTC1055.
The pinctrl-upboard driver set the correct pin function corresponding to
 these data.

Signed-off-by: GaryWang <is0124@gmail.com>
---
 drivers/pinctrl/intel/pinctrl-tigerlake.c | 32 +++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/pinctrl/intel/pinctrl-tigerlake.c b/drivers/pinctrl/intel/pinctrl-tigerlake.c
index ae231f7fba49..aeb031570536 100644
--- a/drivers/pinctrl/intel/pinctrl-tigerlake.c
+++ b/drivers/pinctrl/intel/pinctrl-tigerlake.c
@@ -330,6 +330,34 @@ static const struct pinctrl_pin_desc tgllp_pins[] = {
 	PINCTRL_PIN(276, "SPI0_CLK_LOOPBK"),
 };
 
+static const unsigned int tgllp_i2c0_pins[] = { 5, 6 };
+static const unsigned int tgllp_i2c1_pins[] = { 7, 8 };
+static const unsigned int tgllp_pwm0_pins[] = { 99 };
+static const unsigned int tgllp_uart1_pins[] = { 85, 86, 87, 88 };
+static const unsigned int tgllp_ssp2_pins[] = { 108, 109, 110, 111 };
+
+static const struct intel_pingroup tgllp_groups[] = {
+	PIN_GROUP("i2c0_grp", tgllp_i2c0_pins, 2),
+	PIN_GROUP("i2c1_grp", tgllp_i2c1_pins, 2),
+	PIN_GROUP("pwm0_grp", tgllp_pwm0_pins, 1),
+	PIN_GROUP("uart1_grp", tgllp_uart1_pins, 1),
+	PIN_GROUP("ssp2_grp", tgllp_ssp2_pins, 7),
+};
+
+static const char * const tgllp_i2c0_groups[] = { "i2c0_grp" };
+static const char * const tgllp_i2c1_groups[] = { "i2c1_grp" };
+static const char * const tgllp_pwm0_groups[] = { "pwm0_grp" };
+static const char * const tgllp_uart1_groups[] = { "uart1_grp" };
+static const char * const tgllp_ssp2_groups[] = { "ssp2_grp" };
+
+static const struct intel_function tgllp_functions[] = {
+	FUNCTION("i2c0", tgllp_i2c0_groups),
+	FUNCTION("i2c1", tgllp_i2c1_groups),
+	FUNCTION("pwm0", tgllp_pwm0_groups),
+	FUNCTION("uart1", tgllp_uart1_groups),
+	FUNCTION("ssp2", tgllp_ssp2_groups),
+};
+
 static const struct intel_padgroup tgllp_community0_gpps[] = {
 	INTEL_GPP(0, 0, 25, 0),				/* GPP_B */
 	INTEL_GPP(1, 26, 41, 32),			/* GPP_T */
@@ -367,6 +395,10 @@ static const struct intel_community tgllp_communities[] = {
 static const struct intel_pinctrl_soc_data tgllp_soc_data = {
 	.pins = tgllp_pins,
 	.npins = ARRAY_SIZE(tgllp_pins),
+	.groups = tgllp_groups,
+	.ngroups = ARRAY_SIZE(tgllp_groups),
+	.functions = tgllp_functions,
+	.nfunctions = ARRAY_SIZE(tgllp_functions),
 	.communities = tgllp_communities,
 	.ncommunities = ARRAY_SIZE(tgllp_communities),
 };

-- 
2.43.0


