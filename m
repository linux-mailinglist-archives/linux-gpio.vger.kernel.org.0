Return-Path: <linux-gpio+bounces-39345-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5GwvBJwQRmpUIwsAu9opvQ
	(envelope-from <linux-gpio+bounces-39345-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Jul 2026 09:17:48 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A46E6F4153
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Jul 2026 09:17:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=OYrsZaqQ;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39345-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39345-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C8126303C4D2
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jul 2026 07:14:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D03E390214;
	Thu,  2 Jul 2026 07:14:23 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F7238E8DC
	for <linux-gpio@vger.kernel.org>; Thu,  2 Jul 2026 07:14:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782976463; cv=none; b=VCfeGXb5cfB8ujx30Fg2D3Q8bwOPGzuq296oVex/nLOapfwR+eSNwoMcHmCuP0hf0h9ArSxT3M/0N5QUz/c6icXhjiJoAxDx4mHTXvB/AtcnlO5W0TW0uf20+wElTqH1gKtQeXHNDacIcoWfDK+TrmXX3MjOh0byAd+yvRFGu/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782976463; c=relaxed/simple;
	bh=JrxMmy7kU45L0TOw069hmCLgiMhQgi/rQW8pDZBTrUk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dp+cKM0YbWpNaCrrvd3VlWUFgpV4/RLOOadZy786yA+ZGiggBcUNgxuiVIMEBBFpbI3fWQk7eiRoGgnEMiDTVBQ3VPTS4vETEro3+kfMBdG69E/Xxr4Yj6yFvFuUa3kdzZAp2m87r4n1y/tTYNcfh1TkbbGasyF4MKfks6gowfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OYrsZaqQ; arc=none smtp.client-ip=209.85.210.181
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-847a69ba83dso806558b3a.2
        for <linux-gpio@vger.kernel.org>; Thu, 02 Jul 2026 00:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782976461; x=1783581261; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=amELj/zgx5HbejkuXj3A+nabkcDZuat3E4Pa/4tvMlQ=;
        b=OYrsZaqQ+6MTedMm1PQwqMxJTtXx6HA4JwME/Mm/9I5YwENfhqLeturTAqMi4JqZww
         OGWOzjEjQqbTLmE50Nc3Li4QS94Kb1jnWtAmZsbS9CufLQ5Y1Fma3QcPFQdVSvBoTF8D
         8xdYVhYRPmdRhe3nIJkxnQZ6lDKS0jc1x7zpOv0H6firhn+jexFe7/jMwVW9ljSIqc1Y
         VF/Ruo3SUBXF9ZDT3j1OFJnlk0dkm5tT7S8+kWeW7QhAf21u9OpbtBD7T7Ezq51dmEP6
         cpmer/sXC6VzfLl+pTkoxnLe81TmOdyxcH/t3JMN8qiJYDN1oUxVBZtIZjTQiX2HZq3m
         y7zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782976461; x=1783581261;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=amELj/zgx5HbejkuXj3A+nabkcDZuat3E4Pa/4tvMlQ=;
        b=OToBcOfZtcwUUL6y571m9Ut82VMKnUlsyyM5mYj5jkdeTWF7Wt29eDSn/NapuqBwQ9
         wfKgQ+jV5l5xr51l4WIDOYJGqyCWLfW6wgYKbkLYh7H0YOk0EsCZvKqFGWdtPMIJSGsp
         X7rWRNH/mb4v2RgOHd5YebWTBJB1G7GmtJkcbjqCLsyIooFWAx2apgc1u/8cHbsskLWc
         SKIV24FD+kriu2HXkKS8we4lMysWDgPZJ+f4m3oiS9aVinSb3/K0Ct1P23AWyz3+6Zai
         kf0bUKzclGN6P6e6dRFI1qUfshXBXZZbhOWPHDm/rphxkfe/oxirnaB+UsJ1Ro2B4cx3
         nmdw==
X-Forwarded-Encrypted: i=1; AHgh+Ro2IRaZvhT6ElP0A+1FOVpjoMp6dZK2o+N+ld9eNzBnyxvRslDCuyI+GU8twQCOevoDMd+JeqcFI2tH@vger.kernel.org
X-Gm-Message-State: AOJu0YyLDXjL1cwQI8jP6dw7nm/7ttTzATJ5zitC2ny/sFkMKe9Cb3Ub
	+ujcMe8VgQ22sQ+0lTmcQnY/X10p13JXmW31dL82jkUstyh6kKvuwdMR
X-Gm-Gg: AfdE7ckuunzTpZNjRwJgX86jtDSSv0XI3m7UGqmiyxIE3JRIein3Su2SxW987j9Hdg9
	ny9NXgphUHJ01ws7boilI35gUk4WGMkLVRObu8yZXkCFclZyghSi1wILImySr/AtJScK708io6s
	GIzKa5fIJ3uVFgrcIcmRYmcIKhV+DXBaT2MsCpymGkmjsYzWqkt3HaOAdJst3ABAS9m74YZ5fyd
	ZBUjAqlKT/n+XEwpqo0Nr1MyIL9N0JRWtam25tVuBsEgJmq9MuaqKh8VPIHSr0GfOQzmG5T/65I
	ndl3SImsPgkuUW8BlCewuOa4yPrts+8DCWiWjxW0x8p5FV41LvTa0Q6lLYqsOiRilNEqIXCq0Bp
	/Aws020k3cojceEUa2IV6Qa/QrWbqkkWmopNcMs3jYzmCjbgsdAyYemO0eolhB2YzBj904xD/G7
	vg6fx6cv3euwRsnblzbYKh
X-Received: by 2002:a05:6a00:ad84:b0:847:95a6:eb74 with SMTP id d2e1a72fcca58-847c073141dmr4915267b3a.23.1782976460859;
        Thu, 02 Jul 2026 00:14:20 -0700 (PDT)
Received: from [127.0.1.1] ([150.117.174.129])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb9a394asm878809b3a.47.2026.07.02.00.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 00:14:20 -0700 (PDT)
From: GaryWang <is0124@gmail.com>
Date: Thu, 02 Jul 2026 15:10:38 +0800
Subject: [PATCH v3 1/2] pinctrl: tigerlake: add some pin groups and
 functions for INTC1055
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-upboard-pinctrl-add-upboard-intc1055-support-v3-1-e6bda3032914@gmail.com>
References: <20260702-upboard-pinctrl-add-upboard-intc1055-support-v3-0-e6bda3032914@gmail.com>
In-Reply-To: <20260702-upboard-pinctrl-add-upboard-intc1055-support-v3-0-e6bda3032914@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39345-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5A46E6F4153

Add i2c0, i2c1, pwm0, uart1, ssp2 pin groups & functions in tgllp_soc_data
 for device id INTC1055.
The pinctrl-upboard driver set the correct pin function corresponding to
 these data.

Signed-off-by: GaryWang <is0124@gmail.com>
---
 drivers/pinctrl/intel/pinctrl-tigerlake.c | 32 +++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/pinctrl/intel/pinctrl-tigerlake.c b/drivers/pinctrl/intel/pinctrl-tigerlake.c
index ae231f7fba49..0a11b9dac3dd 100644
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
+	PIN_GROUP("pwm0_grp", tgllp_pwm0_pins, 2),
+	PIN_GROUP("uart1_grp", tgllp_uart1_pins, 2),
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


