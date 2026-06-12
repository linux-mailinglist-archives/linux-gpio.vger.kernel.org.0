Return-Path: <linux-gpio+bounces-38368-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8nIKAQrcK2pIGgQAu9opvQ
	(envelope-from <linux-gpio+bounces-38368-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jun 2026 12:14:34 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 701A1678A20
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jun 2026 12:14:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=VpYABd48;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38368-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38368-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BD6D0319047C
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jun 2026 10:14:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF0723A9DB2;
	Fri, 12 Jun 2026 10:14:01 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801593AD524
	for <linux-gpio@vger.kernel.org>; Fri, 12 Jun 2026 10:14:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781259241; cv=none; b=KmGdFGV0M5dasGCZxBHYDk36gsol5XGLmewiktaRS1uPn8SMoJ0kPQ5puHCplqa1/x+fxyA/DG/g6uJ0dGFy1sTzxE9fONPc2Itt4/X+2DVGRfFonPEpHc40aR6rJjSPVSXq9xGs4lhucmJ5FKsN9jtgeR8ufEnPia2r/3F6qTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781259241; c=relaxed/simple;
	bh=UVsYCrTgabPt3+1KO398dNio5IWM0Bffio+EXkZMC24=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tLDsP97DM1BPunyWGximXjUBnOOLzyHL+HGxg5o7km1u6td9JCBZ/42mTwZR7RmRpTmWRyMpzmHWHC7XzL8zrZqrPnNxYodJhIP4awKJQVHn1BlM7xBaVe+UPEfc1XaNSs77dGHRS6m4rlHvy66H2igSmFWEngZA/twcS0ybOaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VpYABd48; arc=none smtp.client-ip=209.85.215.169
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c86307c4e6bso308817a12.0
        for <linux-gpio@vger.kernel.org>; Fri, 12 Jun 2026 03:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781259240; x=1781864040; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qRIQSXlzENM4jEBupLB81DONFaVdzlOx+4/Y850SEjk=;
        b=VpYABd48xVXG0LfcZ6wp/A7UUJrWmiMS/gEWmNN3GthV8viWPzEGveKV6NhbbR/V3r
         PUlYOSx2RCFCZByhY96I6NZgPf7UCgdLw36jGIUTmEXtVVD47sMgZi8P/a8ddqKcD5sS
         DPPWdAhhs7kyM2fBcN0VNRQRWLnfok6ov5oqoVz4YTqtcZHCdDk6hx74VGZAOFwgK83g
         SQgWf7RqQUfw8Yry96mCgO6g4m6x9+0FOjpDbqSw9D0xE01MhVYCw/u530KRu2q/k8vc
         WyrO1QvOJFBZ9kw1QCf/jxTkp5y85y8H/0U0D/ug1w8FlL1uHVZnI0GxUPdz57op2xjM
         GgUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781259240; x=1781864040;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qRIQSXlzENM4jEBupLB81DONFaVdzlOx+4/Y850SEjk=;
        b=gEkdBF8VfAVurrDsUXl5/AZ0Hy0NyJTMexUFY7RgdssPp3GUtfLHs6fWdn8RNSb4TI
         vm3/HnDBk/3smbR36PuQvkrCiwkHmNCPaOcO4iQ+RwShh22wEdvKaJSCKdfzzJixdDQL
         eY6/z1ViAZ86D6LRIIwdWoggy+7Bao+s5EniefAq0H+P9+braTvUDl70RQM39ra1dsXZ
         sMjSoUNqX0RDEVLAR66vTuAA2KmqBoIvzUjx4kFWQAK3IRLsvsroogDl51XEnaPJjt/6
         lrkx/0z6/j62g0RfkrL6xA5XYku0ej7hQ+xJRTvwiTvHSwi6rQ54dUKgSas5Vj3NbhUz
         4Ctw==
X-Forwarded-Encrypted: i=1; AFNElJ+AfBHEPQPTDfo2+GP4MgGNO412Chq/BdAdiwkhS8u3Y8O+YWknu0pvH1b4649Qz18ce1kVyRaphRVx@vger.kernel.org
X-Gm-Message-State: AOJu0Yyad44vlWC+BWxTetMnTSAdB4wK0cVioS1rYsbxsw0MlZevzwnc
	azzLhwx0MIWvEa4TCsRb+xu5IW8ShwxOLavnWo+f8ruBLcA4O4wo5mwzpwbwRhKCcuU=
X-Gm-Gg: Acq92OEASwPMPfwjywA5ApHAhnHGQv06iOUww+hnukOiNrxPEEd0GEQWmh0DGLu01y7
	Sqmw5G/rnUDS6tmt1kjZZrZghgs1jYZBP9Evnmx3qXrPOzDW0cMmyJv61nX5TZl5EFRp8PxQRBb
	Vt2AKEwlDbTj/lZhnJTFNtX7en00lSTyzJVQuCPB5ZJv7sRuNF3YgZ2W9AYup5/vk/LSpbYF+/D
	xDc55OO3kXRT2JTZBWI1HiLA1tPZjJwY9MEPX6jFhdVShBP8i18MOpCKksBn2var+UaA8JYe59J
	KMl/eFGltaKnNTeNehACgDPF5j2a127Dhh6+cbj++zABi5ySZE1DY5JwRghvZYQUD9SZ7Pn20xs
	30JRuCqCRnelMXlFvKgf48+aZ2XgrKo+4sR0Exv7efLkwyy+ylVuAS3HkAY1E7SqljnhND0KBSl
	hb1e88GSndbTwxaqqYiDbl
X-Received: by 2002:a05:6a20:d04f:b0:398:6ea8:21d2 with SMTP id adf61e73a8af0-3b783c1bc74mr2993626637.19.1781259239751;
        Fri, 12 Jun 2026 03:13:59 -0700 (PDT)
Received: from [127.0.1.1] ([150.117.174.129])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c86651adc16sm1557909a12.31.2026.06.12.03.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 03:13:59 -0700 (PDT)
From: GaryWang <is0124@gmail.com>
Date: Fri, 12 Jun 2026 18:13:33 +0800
Subject: [PATCH v2 2/2] pinctrl: upboard: add device id INTC1055 based UP
 boards support
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-upboard-pinctrl-add-upboard-intc1055-support-v2-2-4111b256c840@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38368-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 701A1678A20

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


