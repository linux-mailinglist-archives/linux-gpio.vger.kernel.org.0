Return-Path: <linux-gpio+bounces-39511-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zSYNKGuFS2p5SwEAu9opvQ
	(envelope-from <linux-gpio+bounces-39511-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Jul 2026 12:37:31 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5093270F442
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Jul 2026 12:37:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=UflmA6zO;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39511-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39511-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 660333000B2D
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jul 2026 10:37:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADC943DD874;
	Mon,  6 Jul 2026 10:37:07 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BDB93DB321
	for <linux-gpio@vger.kernel.org>; Mon,  6 Jul 2026 10:37:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783334227; cv=none; b=KKGOh80+wwEPwqPcbOPa0UQxwL6O/tBchGaV6cUOqlGgeUxYLGnaSRZDu8/Bo3thoAcd1vDsiyxeqgvw1u+9hpyDPYxaRonr0Z5WQSNoJzN/9WuNZuJtYQe+v3CdxNOhTCh7lSxL5IqsxnjJ69toLrD6qzu+Hkl8QJ0ye6UvpSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783334227; c=relaxed/simple;
	bh=/uSUtu9UrBkRqJc8DzNPUEjuHfk+c4v6jKsiFoMOWIE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jGNnV4k8ycly29XRyIsWjYlvs223A3KwJEBaQs5uYtGMIIhsPg1Dx47ZJef1TUYPwblDzGP7jxAt5k2x6QRmSlcdxpIh1R/L2KrfIVIXcl01+1oxwh3JT7DZmIrew9YmOonz9ACTp4ccFknuggOy1Ru6RVAbMTlej55xaf2d9Eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UflmA6zO; arc=none smtp.client-ip=209.85.214.179
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2caea3f742bso37872485ad.0
        for <linux-gpio@vger.kernel.org>; Mon, 06 Jul 2026 03:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783334225; x=1783939025; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gQCFHiPUtrzx9M/KDBHAndVk82sYPvwu/95Z/S9ygn0=;
        b=UflmA6zOZc/aCrFSbKqpvZ2Duv+Snmms6UI4tqvbtxq22WMDHETNGan9dPT+uteoqF
         BE36TWmeTHqdjlpfCG0MT7D6VGM0IuaFfrzr+aaIUa/LBzrahf+Z3xxRnJufBE0AFJ/b
         8MRQB52qbeWPJeEmVXkRD8xv7Wlg6J9QGHn9VPZbXZ6zdA4F9RB3oBbNmFAvKk9jWwWg
         qE4skWBOhOwsoeJwhOQy7RgqxFZu5AKpShVN0UDbsbkO/J4skihvDb6nJxNU4xXpFXYn
         7jNosZdTgZJ3f6Bv/G22PFpRwY3RP5xuZg+v8MjKSXCoOEgM4/J3QqD2JRC8xQ7ZNowA
         eGTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783334225; x=1783939025;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gQCFHiPUtrzx9M/KDBHAndVk82sYPvwu/95Z/S9ygn0=;
        b=ZOJczsF3JjS56cCoMRzSQS2f5CmRieFRrhX40bQvMF0eMAa7rMrUbwzY7y0nn0y0jN
         cFM3T97DP+fgKGn57Vn3K3ZjkuFjXABk8so/Kz0/mslF6yC0JODfMT3ksV0xp9rq6GcE
         9V7U4ustJQB6uUEa3fdR6Nsxj/h7kamtUJCEbZAhEXaXP0eb/I51n1FMary833t79pkw
         IBjG/EQtO+m/8vSwDCp74IHnZohb137YyOP8s7i/ZxU4pXNvci79dkmOhqqXZXXURCx/
         qYPNY09/SsmOHXQttGr+8fIFgG8Y4/g6pH2wlRAzU4/UBGQ5a6G2Tas01cP3gfRkjK2l
         rcmg==
X-Forwarded-Encrypted: i=1; AHgh+Rr+8qVfwAwWO/Xs1pPc+NHSZV3Mw7or1aE9ZD+r/9cUUciIlV887ujrKnPrHhPisZq7nw2IqloRuvHu@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg0+wIkaqwUdKA+2vPvXLarN8h7sPSxhjq6dWvCz3DvOI24uAf
	aA9zt/WUCjgx2bQdiM8FgPMrp8uzkqxpfdhe3FuN7xW9vkcPJcNfJWFi
X-Gm-Gg: AfdE7cnqv0SzSGBesJA5ofUPZLvpq9qmDUDk080S3EGaD2LfDzenI+bsrVSf6tHZGUt
	u/iAQaKv0r/qxKuSWhxZzyPY5zxyF0VHaLYZIlwrFO5VrZ542eeRtFagFZezd2oPOGzbaWdaD5R
	/9MIYz5ETG44TKm8DTb5l9ETOfC009zX/Ormg/7DYoao5WVq6lao8F9tm2Qk/SlhRyuPLUYDg+j
	bIAzUmJxJryoiIyVC7Z6/wmnbni2h4egIn+4z+TD54L6d5nzxwIaNUogyVRaTs0O3V7B13qQ6OY
	wtBo0emQXe5bIdemDEvWh2P5g+C2LP+QfjwU/zmW9w4m4GEuTRhNyURCzpYQi3OVb4FJDCAETm3
	uN4TT2lEA+gtSyCxK1I+7qY3fAO6pZzpgFYzymD52iACiz83weJ0tlkJ44LigzrIeOfWBHA2oRN
	lW1TgJf+Jsuw==
X-Received: by 2002:a17:902:f54b:b0:2cb:3f5b:6663 with SMTP id d9443c01a7336-2cbb74fe932mr98149235ad.11.1783334225585;
        Mon, 06 Jul 2026 03:37:05 -0700 (PDT)
Received: from [127.0.1.1] ([150.117.174.129])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cb3f5b7090sm36802845ad.26.2026.07.06.03.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 03:37:05 -0700 (PDT)
From: Gary Wang <is0124@gmail.com>
Date: Mon, 06 Jul 2026 18:36:35 +0800
Subject: [PATCH v4 2/2] pinctrl: upboard: add device id INTC1055 based UP
 boards support
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-upboard-pinctrl-add-upboard-intc1055-support-v4-2-cedce0802d3d@gmail.com>
References: <20260706-upboard-pinctrl-add-upboard-intc1055-support-v4-0-cedce0802d3d@gmail.com>
In-Reply-To: <20260706-upboard-pinctrl-add-upboard-intc1055-support-v4-0-cedce0802d3d@gmail.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Thomas Richard <thomas.richard@bootlin.com>
Cc: Daniele Cleri <danielecleri@aaeon.eu>, 
 JunYingLai <junyinglai@aaeon.com.tw>, Louis Chen <louischen@aaeon.com.tw>, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gary Wang <is0124@gmail.com>
X-Mailer: b4 0.13.0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39511-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,intel.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,bootlin.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5093270F442

Add support "UP Xtreme i12" and I2C/PWM/UART/SPI pins mapping data.

Signed-off-by: Gary Wang <is0124@gmail.com>
Reviewed-by: Thomas Richard <thomas.richard@bootlin.com>
Acked-by: Linus Walleij <linusw@kernel.org>
Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/pinctrl/pinctrl-upboard.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-upboard.c b/drivers/pinctrl/pinctrl-upboard.c
index f8c8b9d84990..de1920a3387d 100644
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
@@ -921,6 +934,14 @@ static const struct dmi_system_id dmi_platform_info[] = {
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
 	{ }
 };
 

-- 
2.43.0


