Return-Path: <linux-gpio+bounces-39346-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kLpGBrYQRmpyIwsAu9opvQ
	(envelope-from <linux-gpio+bounces-39346-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Jul 2026 09:18:14 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 935D46F4165
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Jul 2026 09:18:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=jQP805vx;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39346-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39346-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 37F003049FCB
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jul 2026 07:14:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B948F39021F;
	Thu,  2 Jul 2026 07:14:31 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34915390204
	for <linux-gpio@vger.kernel.org>; Thu,  2 Jul 2026 07:14:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782976471; cv=none; b=NAfnKUAx//P+L90Pze8K+gEL40smcoBYtr7UzmsGuVTyyVSbI/6vdtDklpWYoZdGDApAahrNDhzKMAoYaAwEiJVaYtSZkoDRiUotXn6oU4WZlxyoA3qo6Fkp0uYdNb8H7qZDMtplGdg6SsixuIYOnGTqQ2X1Gee6s5eZjAav0jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782976471; c=relaxed/simple;
	bh=oBKIS45bkJhCmoNXDm4EUJWdyfKHBmPXUVOUIcO3X+Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fm/vu0n5syQFebWnx3kJ3L5/RoZT3/tmzZJbLJS8wYMLVB2U3HWYVq5zOATSfsDOUwPYZ5YDhJORjZrAchihrIiHmy3R9k4bMH2BjPbP0x0ilyGM+CBbFpMoJvq/vB8zZodRKuQTwEBWAodxE1RR+BqPLbf6mZZkmEmaQAQPtmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jQP805vx; arc=none smtp.client-ip=209.85.210.180
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8478fe07f65so1227871b3a.0
        for <linux-gpio@vger.kernel.org>; Thu, 02 Jul 2026 00:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782976469; x=1783581269; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iRvm47ghyrglS17YyW8ejofp+1PISwxWPEK3XMgrqP0=;
        b=jQP805vxOQNBr3/jIx2WsfkvsawP05wpVXjrW14xcEcKi6W9NNgk2eJXj64Cn0RSxM
         OjL8ZBxmpr7ZWK/mB4EDWnQzInJ+V9yd8tdSLkt89L8ny/mbhhytKsy2ujwZMRXI+KU/
         8hMiWr6jlwfr6bpx9/JOOYDnkEGdMkXSx9aIruOeHHEtjB6n8X3PnG0/wOfE3IKBxuPJ
         Rtnxx/70EIPSrF/t4WFXu5Ub+9zp37c/znzIVMfnCRvUhXQQomZs153gM0jsJG2cPj2f
         jfRsOz7k5BWrRh3mBGhwCTQdxbwHtyjcWVMdh14VY3KwBtlULZszYvM0wmHKyUzcZsTV
         0RNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782976469; x=1783581269;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iRvm47ghyrglS17YyW8ejofp+1PISwxWPEK3XMgrqP0=;
        b=kDaQY6Of+M0Ri+8S97hPoM5sjaxbSTnMNh4HYKRLA0LahkhPGUoVRqglW9I5CgTosK
         x/7j3XrkXf9fgDYHvn2ewb9Z9QioAqeRbX8UwzvT3J/scX4Zf2xZQmAu5V+yd+FL1eBw
         bXqdEyplz0QBzS0o+9iMhDmMXeu51r7fCP7lPgE/K92/QNf+kyAnzwdD7+bLlBeAr6m7
         0S0u9oPLaGvtSDlkXbEE0Z16Yu9IsRXVnp0HDaiRnHh03YE6UCHfWlAjp0N/FOh4KYM1
         GHEpjqWxtZDW6jwdHyoTSYPa7NAw1lSt2yLm77N4N4aP0phFFSmVSsGopcuYI/l/xSje
         Gg1g==
X-Forwarded-Encrypted: i=1; AFNElJ+vd35Sjx1cfJhBn2T0tlSYZFwji1ovTJLFmuQHaup25oIznMeIr9q3KwWehuw9QfPzGCS8ps/P3WTY@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4aZqRdh2Ve3QMQOtF3xHEjcqDme3vSTq2lu1wGFC8bv7a1ETR
	iZrKtvmfoWXZN3bNKQOjosd2PTYdvAyfCQI4yl8AQ8xrz0OsA8El0/68
X-Gm-Gg: AfdE7clfkLl7dmpSd1iHoU3fOTxz58Ig4JE3zbQ29uCckPOZDsAoiD9RtQvWqm5GIhj
	1n489FzWF6zjMqKqTEzFmwlqy7nQgZZFMZvKDB3h1A1Qyf3cEIbn7OheIh9q4BSapwklH0Zmisb
	YSadHdWBYLlPq46fwSOj6akwlUxVgq3SyBZ3ensVIGdtJYRbZBcYUT0d08TmDyPbScVs4EIVu2s
	1qhmTI5RQkgyODLxOX0/dhYB1ruVM3GGG7v4SwsiFtPrBON5jzJjDasskRlTlBiAZcD3co27b/r
	GwVZOt42OPlDz+XdjOccRJfuMdgG25Xl5F6T67Kc7KJmBuxb7gj6+cBwKUBiailw0uw9QQW131n
	dmsayHBVnpPV/WyEgs3RolKU0PecvkuWqoX4YQ+HeHtIt7oRfjQqX17h02koMNSjx8gpYfjfrn9
	NKeHaoiSvwYkC+O9obV7bc
X-Received: by 2002:aa7:8894:0:b0:847:98fd:5a9b with SMTP id d2e1a72fcca58-847c094905amr4652243b3a.49.1782976469410;
        Thu, 02 Jul 2026 00:14:29 -0700 (PDT)
Received: from [127.0.1.1] ([150.117.174.129])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb9a394asm878809b3a.47.2026.07.02.00.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 00:14:29 -0700 (PDT)
From: GaryWang <is0124@gmail.com>
Date: Thu, 02 Jul 2026 15:10:39 +0800
Subject: [PATCH v3 2/2] pinctrl: upboard: add device id INTC1055 based UP
 boards support
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-upboard-pinctrl-add-upboard-intc1055-support-v3-2-e6bda3032914@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39346-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 935D46F4165

Add support "UP Xtreme i12" and I2C/PWM/UART/SPI pins mapping data.

Signed-off-by: GaryWang <is0124@gmail.com>
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


