Return-Path: <linux-gpio+bounces-38233-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5+ZBDFcqKWplRwMAu9opvQ
	(envelope-from <linux-gpio+bounces-38233-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 11:11:51 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C935667AE1
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 11:11:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Us2SU9PV;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38233-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38233-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 94B6C3172144
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 09:01:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9828E3B9DAD;
	Wed, 10 Jun 2026 09:00:22 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7493B774B
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 09:00:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781082022; cv=none; b=ioUdmPWKJS+u60TeAROV/Hl5A7iFYSjvCyYhwvopDJWUF8QmISoxgjNUtaiL+23GdWwxKIkW13/LCrCkxB1Xpznod0hQr91C37/6E7gUo6RQl4d0acB1OD3DRvAUS8mPhfnQJWJ6/JgCdb5eayTgwKvoBl809qualoW5BGldT4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781082022; c=relaxed/simple;
	bh=bLwChESGbZtz/2x058HtLBA1jHktHhTBvzQNfjT9q/s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VLfkSnaCHwnnFPMwjptjGpA5qnbicPOxxcbhRGU92yZJDdYsjVMOFKomsZarkVw/2ztNfSnKMip10HwMuNX+YhLN3HmM5H0Zk1+qJwdvECGHtOnwcaD7gRpnhmNIjXUMOjjcPP7mzLpH7C0ow6DAy+1rW5grgxZNj7s0TcWGbfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Us2SU9PV; arc=none smtp.client-ip=209.85.216.49
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-36bcf3d2565so4554150a91.3
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 02:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781082020; x=1781686820; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=akyQhflaBKd1fIBT6+6thwEUVwavJvRtr15bNxaWbNY=;
        b=Us2SU9PVNaiQFSi9A+Wk2AONfG8ldkRDEm3cSJYDIm9evoFIZi1xPvMyPc4TUAwrd8
         /s3e8XdM3PfL1ujRgaVHDRw9lOUqGfNxgUXYBZjqq6tpDxZ3mS/Pm8LaXFCQAYfr+cA6
         QqC1UZjnTSeLW2kUkDe4yHfqeY0gYUc5WKNUbeC9e+2N2GBTK7+ff3lZL6Q5FvgBdnUT
         IgTZNKildlqeDDNrveAyZTICpAryDBfbzlGbyvQilkzt31jPHQyZjE9jJhDodWUrogez
         ki6pyhboe5Rw/v7NR2EluQMhrYmw68JDyzmCmwNazQP6UbmF5EumBO74OqM0HeT+Kx4G
         W2+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781082020; x=1781686820;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=akyQhflaBKd1fIBT6+6thwEUVwavJvRtr15bNxaWbNY=;
        b=chbpdFNJe5GwYHDwqybO9MOTzEiKLIuPczzcHA8zOTtn79xXqbhhDAvo4DKPtBvXrK
         2R+tIhRZlMlKqASK/4IY/k8qsiP52OPs80CpD6oBKeB8TUNpErX1VEq68X6zlENsPi5A
         Jmxkho6RgoFdvOBdJs/dwpCDOJZA7sdS/HWuG2H6bNrzCsHs5DZ+Cpnbs5bz5RbZjtqO
         277i5aFn34aLCOYxdgSSMN+hZJj+/qSwZyUJ5GQ1nzDO//j/f7GvPwmlYtGmn0HHbanQ
         dTfoPqTdhHrmBTK7gAV0oLCzY6h+ISegUaBEKldhdHEfEfuAY6dPTYl2bbV3LPhyBLzs
         T3nQ==
X-Forwarded-Encrypted: i=1; AFNElJ/n0s1V64VOPNNb9Ot/9znO8WGNh3lON0pCUwpTAa/xTnOXgo7Uu3PP0bwfItpcmTSYamR2J8/BLKGR@vger.kernel.org
X-Gm-Message-State: AOJu0YyPbTgbddZyCirxTbom+bCAr4lgWA7ShfckoZJH2yhn4L0NBC07
	YtGrufVRjwX1le5giKJQNXyOqpJUVITdnIyVZbvnXPUY9pdBQNgQMBF/
X-Gm-Gg: Acq92OFq2yJPDhn6+p4UlQjhiyswaXTcTkqww9QbGsGCfmv/oAT8nXPPMBCICkPgspU
	+FOBr4m8viwQS4iUKX/sRNDuywwoYA83vw+bLNHy9crmaweUfz5nfnjuBNnxbPMJmgdhnyJ7Uo5
	ExmLCW0xqpIYXDx+nwWwiJ1bfeKM8CBrCJc1z/pt9MlICbKHvhKTH1Vr+wZq19cJFsYLxlE1FE2
	3cFvWxZnw08gXrLApFv1FE7ImRpXdhF8KvHnVixdKwc2ceiLcYWUlm5Qh92VZxDr8x/6H+sWpxF
	N54bkgKlGUTyu/c1cAcGqUXY0Pd+MyaQKBf+Gs8cejaAkR+oeTMVuh1zbtgWddHSoyCgtPzBza4
	rrxlCLIuLDaOaSNMohkodMeGYWix8mEdFJd/Ep/8lSbpU3yic8W5bINuuOsYQrxONuSfduRV2j2
	0oO9UxqA4oAKCwTbSnNiQIovSqLohtn8Q=
X-Received: by 2002:a17:90b:4d81:b0:36d:66d4:270d with SMTP id 98e67ed59e1d1-370f0582547mr26420780a91.20.1781082019678;
        Wed, 10 Jun 2026 02:00:19 -0700 (PDT)
Received: from [127.0.1.1] ([150.117.174.129])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-376465ca306sm1308995a91.2.2026.06.10.02.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 02:00:19 -0700 (PDT)
From: GaryWang <is0124@gmail.com>
Date: Wed, 10 Jun 2026 16:34:23 +0800
Subject: [PATCH 1/2] pinctrl: tigerlake: add some pin groups and functions
 for INTC1055
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-upboard-pinctrl-add-upboard-intc1055-support-v1-1-8185d2abbfb1@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38233-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7C935667AE1

Add i2c0, i2c1, pwm0, uart1, ssp2 pin groups & functions in tgllp_soc_data
 for device id INTC1055.

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


