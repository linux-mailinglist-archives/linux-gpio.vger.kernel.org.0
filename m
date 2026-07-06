Return-Path: <linux-gpio+bounces-39510-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NieZHl2FS2p2SwEAu9opvQ
	(envelope-from <linux-gpio+bounces-39510-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Jul 2026 12:37:17 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E02470F435
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Jul 2026 12:37:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="oJz/R2sc";
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39510-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39510-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 901993019FF0
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jul 2026 10:37:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3636F3BD643;
	Mon,  6 Jul 2026 10:37:04 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5FE3CB8E6
	for <linux-gpio@vger.kernel.org>; Mon,  6 Jul 2026 10:37:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783334224; cv=none; b=jAYQIFa99MqpJrIVZFPzVEQ/7+DKBXnh5aqqZdSHCAjXV63uvua7FlWLTxpF3QVmX3NrrxMVgkX6gE0ALKIxdV5CddfPMibw+MHb8CObx3paS/DiMdD+72VpS3vA6x2gRu8xu2HaCAIJVFnWoCgTN35Szo87c5sh9JQQ/cVlGVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783334224; c=relaxed/simple;
	bh=CCvimi0R+m9usSfJS7OKid+XCBD1qKLiMCROlbUSGnM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tEqx7Q5+/flBetXEpjNd71Cm1PcMU7mKhD1buUN0OYEqd72oN7Vjg7u7BCZAOaNWZhWbqwEnFGARUDU7Mnt9jcXEwmOGF1hpAuG4bY6Kpj+SeyxhOURtY7BAf+Sc1z4SWJ9TJfI46p1CCJjIYGz81j/gYjX/i8PG5nHptI6XND8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oJz/R2sc; arc=none smtp.client-ip=209.85.214.174
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cad4170e8eso33899395ad.3
        for <linux-gpio@vger.kernel.org>; Mon, 06 Jul 2026 03:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783334222; x=1783939022; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3opBcZGPfDcAMcNBO2t+ugmTYdOHuesje+7F6g/b55w=;
        b=oJz/R2scI5TDJ0Yrkl+N3bipKet/KRhUUMIeek4wSkYnEYnOlDITaDpNjYIt2o3FV4
         1e/Il5NNz8nEFf1XUCNUr0ztEWFJ4b1oEuHAV8EEQTQ8ZuS3U0jTFmo9MfYYE/wECljR
         gO/w5v24Nlf6clvqdwC3mnIT2bM9787daItJ+tTPDE18Y9ObMro+YcgSw7FviIjeVQjU
         acsQwNIGix1nI/9mjIrgEZXpE2EHnUKp1X44lDE5iHqx6mX0EaOp7nVQX1WOjhcncTxe
         RvGlviOliOxA0TDO43OKiuNVpKW3fcNubeYDZReN/OdrmOw1N87cPTkakQIKL0Fk10c+
         rXvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783334222; x=1783939022;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3opBcZGPfDcAMcNBO2t+ugmTYdOHuesje+7F6g/b55w=;
        b=i5vRtNgwioDzRQHjSCWOYgdZETWwoUHYW4agVVsYxRpzu6HyYb+ps6qyTCWcsBQ1Ao
         0gaWRNe8qz64mDWLH5haoIZgQLPOPFwQfhqHYh3bHL9rPB3/u3e6frK1QT+jv9W+PGBg
         MKYZw9AsRRavxxUPKBHQdr7zoB05DNtIHusRVI1Mocsitn2XF/7Uc4wmSsPEoKvmt5U2
         RAa3r7Q4JGvjjSyuvIjZk4IHiROf8d8Ik+ovmbZpQFOOXUCXYXTOnR4nZ8UCkG9YB0Fl
         gPGOOA5VUGDxuFRkQsqcN3YRA460G+RLOZMl4ioj+maA6l+ZEGSCj6h8kC5b1jrvZmyS
         KCWA==
X-Forwarded-Encrypted: i=1; AHgh+RopO1qhvVLgwoquU063AOuHpDD/9iqcK5nDuA7cmNOSVCmhgFd2EVouY0K8kmmA8aANVCe8wjiEBQ1p@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt1Mxrgv3ZIfafutCCtTkfa14I3th02QOogMIPmIKgqF/dU4z+
	zLD3XIaEJ9SBw/0pxXQ+xTgbVCAqEswzZwk7N/U4glSnFA1+6z/6BZ50
X-Gm-Gg: AfdE7cltPwxjTr8TzhwDzR6aeRadNx67Z5QSFg8E75vuN3+T4IRZN3fy0eWuHAyDNac
	iZoIHhbtcDNdR0t3dq2ehMtGyCi5nyXhRoZYyIndSxaT1JIQb/YZA/RRKcb1zSFiQEsu3OMJG4T
	qr4r16LwnHDxb6+zU0pkjvor+k5GqPO04APpmUc2sYt7c3zo77m7rkWso7AvS3phRiv24dPspVv
	nBAQbdagjjA15NmTPYrBmUkdFuacOroxDJQBinXal9qBp2zKFjjCd6ShY/Z8YPG0K7bqINHKuX/
	EchqIcLScw81KJLia9dHOL5MH82Rxj2ojncPjh/LRlU53lDZBOassObgIKYkLV/aqdrNvWsMg2Z
	qzEYlQL64dehz0Hyx8ZT4LfZGd/VuOSfqpQUGakG7e4F7nAbp/c07yqfX0htGJg5Ql+mpJKyRFa
	pv+kiEhzoelA==
X-Received: by 2002:a17:903:230b:b0:2c9:de53:f84f with SMTP id d9443c01a7336-2cbb9e4dd31mr98293255ad.19.1783334221822;
        Mon, 06 Jul 2026 03:37:01 -0700 (PDT)
Received: from [127.0.1.1] ([150.117.174.129])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cb3f5b7090sm36802845ad.26.2026.07.06.03.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 03:37:01 -0700 (PDT)
From: Gary Wang <is0124@gmail.com>
Date: Mon, 06 Jul 2026 18:36:34 +0800
Subject: [PATCH v4 1/2] pinctrl: tigerlake: add some pin groups and
 functions for INTC1055
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-upboard-pinctrl-add-upboard-intc1055-support-v4-1-cedce0802d3d@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39510-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,intel.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1E02470F435

Add i2c0, i2c1, pwm0, uart1, ssp2 pin groups & functions in tgllp_soc_data
for device id INTC1055. The pinctrl-upboard driver set the correct pin
function corresponding to these data.

Signed-off-by: Gary Wang <is0124@gmail.com>
Acked-by: Linus Walleij <linusw@kernel.org>
Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
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


