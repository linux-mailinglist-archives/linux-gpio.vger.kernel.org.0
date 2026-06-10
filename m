Return-Path: <linux-gpio+bounces-38234-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DyVyBqkpKWo4RwMAu9opvQ
	(envelope-from <linux-gpio+bounces-38234-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 11:08:57 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6D1667A72
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 11:08:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ADdhmcdR;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38234-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38234-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E0CDF34CB1B2
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 09:01:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6660A3C1082;
	Wed, 10 Jun 2026 09:00:27 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84183BD225
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 09:00:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781082026; cv=none; b=WoX4hNLlh1kFUOwv0/1SUrHq+qXBcs6tjov3ccThZ5bClEFUqL76qOcrhQBCWIbxHACyULBQfI2vgyUFscA/oxsqksrcbU16ZpoiabXLFlKfDAFkIW0KWpV5Lw+uMh/2Xsrjf/C6wxhzYQRVWWjN7sJWS+rzXfQD3BSN34X/4XE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781082026; c=relaxed/simple;
	bh=UVsYCrTgabPt3+1KO398dNio5IWM0Bffio+EXkZMC24=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KU/7D4oZslI+mpHmIxbJmUS95X/8Es1L9UCD7STCf1Gxb6IbSucWIGbE8UMFLrsPJR4NVEwzH63QtlRd74tWQk0cnmNniw3p2sM1/mxPa5pDoFRNQNd+yj5S6jkxJEScNHxLnFNcV1UEqeG4p1+uc6/W6csrY5jYzfOKLAfouVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ADdhmcdR; arc=none smtp.client-ip=209.85.216.51
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-36da8439078so5766281a91.2
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 02:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781082024; x=1781686824; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qRIQSXlzENM4jEBupLB81DONFaVdzlOx+4/Y850SEjk=;
        b=ADdhmcdRFzAI9coxhRoMF1PBQIZAbSJoE+UbroGoyp/Crl+2TErSVmQaTciNJB/Qjm
         Me2QX20TFnfY4FsCWySATaKpDeS+Y85iTRZfXBQXQ5kU1OZwXLedC1cZ26n8yggIKW2x
         cAI0cD04MnZpJlDKVebOpE0rDRFsgPvytQl3tQ+iGpv91FSqga82QHn6Hk84WVAgGnAF
         Bed7ef4IX33pZ9in0dynS4ZJGqDOPVbOv/BAMepWaqZ1R3bL7N+hYFpwNN12Kq5vBx8r
         AuPis6Mrbq3YA6A9BOtMOynA457WC2SdMJSSX5JeQeNXZzH0xrC/piOX5B3nm7SomSA5
         ZQYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781082024; x=1781686824;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qRIQSXlzENM4jEBupLB81DONFaVdzlOx+4/Y850SEjk=;
        b=WRvXQzhfQdc2mfWYA6zmhZE861hYcNc45vjjtEZ3oJ202eWW8ZaNITlj9bGeZJz9/D
         +l2ilK9nDer2NE/shXc2t1oGnR8eXAyE3COUGYJPYm5qaT6xcM0R0pur/ePSublseKF9
         94w5EMyXGEFYbU8W3KYryk6FkJVWd927HfBvUpD7Z1DF8gaoVFE4JoX6k15z/4UpLCFc
         dtcOFPGJzBiWivC2jq5Ern0xGy6f8bqMWj8rG4af2l6iGf84gkTGixXdn1xN8gCjyOXs
         dMg/aAlEHAOYChpo+GcoS833jf1oyyVYxPV0t8aE41y1CRDnjksMZaNNCh6owVWUaOdU
         EKSg==
X-Forwarded-Encrypted: i=1; AFNElJ9h5sWEN8A1T3rHXPYZ1BiEz95Fdvry5uETT39+agIaOuOyNVrXSgqWS9c7qg8nXmadVfCvYbHAxJnr@vger.kernel.org
X-Gm-Message-State: AOJu0YwkYka84WBYUZ5CjHrGPUzXVdhQnkVyUC1KtWYKsN99kNkeWllD
	oSzkwVIR7Du8BDmacxesw3b5IxZFhw1OYHoDlFj2PFz+tWs75T1pdquL
X-Gm-Gg: Acq92OFTp8qin4yRB2ehGV+mjuCas9lO7kw5TdyR0KJ2ZG7DW66mhZg102uk55bdrZD
	SO9eTR2leUkqBIbwFK1jrNXFvyXY+mzZ9HXKN/pm62bW1vY9aNzSdfYyekz3OTJYuuvixYOKmOf
	Wmg753tThU2r+7RGs8BHnoU/FSOAZIjzWeOKjuodCExxblM2gTLxb0AeMf2COJRJTY5e1CTmQsk
	4JxEefOvHCDnSx6xNcjNBnkyWWW+otaeKepYeslA1k1G2KlXu0REEzqDNVnnQIEjp3f+6QID15J
	hExgm4nPnZt1io8hwWiecvuayi8qzuJ3rxSnukSLG9Ko9+CCQCm/thBdGyPgKUgWEVdQL518hq3
	m6Z61nLuztGYeskocyRVmWoCo6ZntaSeq6EQpvlMpELDO4+cjbF6X/9/vc8ZGTg9ImblqDNf61n
	NOXZY+ssaW29Txae1CYklSBxJyvhRA8KM=
X-Received: by 2002:a17:90a:d40f:b0:36a:a16b:5f65 with SMTP id 98e67ed59e1d1-370ef1f3d01mr26131246a91.11.1781082023870;
        Wed, 10 Jun 2026 02:00:23 -0700 (PDT)
Received: from [127.0.1.1] ([150.117.174.129])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-376465ca306sm1308995a91.2.2026.06.10.02.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 02:00:23 -0700 (PDT)
From: GaryWang <is0124@gmail.com>
Date: Wed, 10 Jun 2026 16:34:24 +0800
Subject: [PATCH 2/2] pinctrl: upboard: add device id INTC1055 based UP
 boards support
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-upboard-pinctrl-add-upboard-intc1055-support-v1-2-8185d2abbfb1@gmail.com>
References: <20260610-upboard-pinctrl-add-upboard-intc1055-support-v1-0-8185d2abbfb1@gmail.com>
In-Reply-To: <20260610-upboard-pinctrl-add-upboard-intc1055-support-v1-0-8185d2abbfb1@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-38234-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5B6D1667A72

Add support "UP Xtreme i12", "UP Squared Pro 7000", "UP Squared i12",
 "UP 7000" boards and I2C/PWM/UART/SPI pins mapping data.

Signed-off-by: GaryWang <is0124@gmail.com>
---
 drivers/pinctrl/pinctrl-upboard.c | 45 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-upboard.c b/drivers/pinctrl/pinctrl-upboard.c
index f8c8b9d84990..09018b665ee3 100644
--- a/drivers/pinctrl/pinctrl-upboard.c
+++ b/drivers/pinctrl/pinctrl-upboard.c
@@ -912,6 +912,19 @@ static const struct upboard_pinctrl_map upboard_pinctrl_map_apl01 = {
 	.nmaps = ARRAY_SIZE(pinctrl_map_apl01),
 };
 
+static const struct pinctrl_map pinctrl_map_adl[] = {
+	PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC1055:00", "i2c0_grp", "i2c0"),
+	PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC1055:00", "i2c1_grp", "i2c1"),
+	PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC1055:00", "pwm0_grp", "pwm0"),
+	PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC1055:00", "uart1_grp", "uart1"),
+	PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC1055:00", "ssp2_grp", "ssp2"),
+};
+
+static const struct upboard_pinctrl_map upboard_pinctrl_map_adl = {
+	.maps = &pinctrl_map_adl[0],
+	.nmaps = ARRAY_SIZE(pinctrl_map_adl),
+};
+
 static const struct dmi_system_id dmi_platform_info[] = {
 	{
 		/* UP Squared */
@@ -921,6 +934,38 @@ static const struct dmi_system_id dmi_platform_info[] = {
 		},
 		.driver_data = (void *)&upboard_pinctrl_map_apl01,
 	},
+	{
+		/* UP Xtreme i12 */
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "AAEON"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "UPX-ADLP01"),
+		},
+		.driver_data = (void *)&upboard_pinctrl_map_adl,
+	},
+	{
+		/* UP Squared Pro 7000 */
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "AAEON"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "UPN-ADLN01"),
+		},
+		.driver_data = (void *)&upboard_pinctrl_map_adl,
+	},
+	{
+		/* UP Squared i12 */
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "AAEON"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "UPS-ADLP01"),
+		},
+		.driver_data = (void *)&upboard_pinctrl_map_adl,
+	},
+	{
+		/* UP 7000 */
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "AAEON"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "UP-ADLN01"),
+		},
+		.driver_data = (void *)&upboard_pinctrl_map_adl,
+	},
 	{ }
 };
 

-- 
2.43.0


