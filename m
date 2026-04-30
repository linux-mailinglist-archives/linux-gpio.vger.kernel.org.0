Return-Path: <linux-gpio+bounces-35828-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KI/aLOEA82kvwgEAu9opvQ
	(envelope-from <linux-gpio+bounces-35828-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 09:12:33 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFD949E723
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 09:12:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2C72C3049292
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 07:10:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CC8F3793DA;
	Thu, 30 Apr 2026 07:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="AwxS28zD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB71539A07B
	for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 07:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777533055; cv=none; b=ir7MQgNwkpiJS1pBNzOgDxUPo2MEEedMG4drJ7QzAqBjbt7JghrOQtkIAV3bUK6sKaVnqeNXx6Ln/3ON4jEgToQKX/9yYbgem8hM8Y08qe/eH7tU9YHAioe3rrDrCzQToAF9Vj8ttbXujJNz23QgQEgAY40q1BUONcoGrIN4Mxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777533055; c=relaxed/simple;
	bh=8AL+NQRRa6kPH6NzCfcOC2Llr5owhpqb7+IMEyXnI98=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dwSCJMKioF3meOU1HgAk3P5bW+0txg3gDsSGIbLTSSSnCMD2QC1awnI8smn8nXJR1ctsbrU/5PtBC1g28ZQYSc82rSYcM0joUxU61M/5v7nmswypEynyb8k9kxd3Jzl84pKQBIUZOi+ebNXRIBIdAnp/gOHUK0W1Ox+bgCBkX4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=AwxS28zD; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488af96f6b2so7263905e9.0
        for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 00:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1777533052; x=1778137852; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NTAqoytpCjl9hfv6cX5jUP3f+PX5WWo9Fv2pGJKBaeY=;
        b=AwxS28zDjvWEb+gdh+pfIDPQLtR/0ks+4ylcY4HCnuADJUeHxieOkPwgLJ4M5YEc1r
         0VPccQ+CIO0h7kHi6TZhL5RvX6PY/wCQni3pImVYDMjP6GskY+X6HJGtkoGkEvechfAL
         sPB6fOKTLi0RPmIU4HmucxVx2R/KTSaw9JqdN7afXDNKI0o9IhULPr98VI0RI6QA02hK
         p09Iwueyg6cgi5Ff57M8eKncpgkmhExebtP6iKOIfrEDy4GBAAL0o5HZzk1yA6CDNO/a
         wK5k+TYCVsc12gqnPc2zRbXjSXUotVAD/2upeKydNhEQ0eH9L6ZGSpbU2mHMmwwTDd+N
         NLfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777533052; x=1778137852;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NTAqoytpCjl9hfv6cX5jUP3f+PX5WWo9Fv2pGJKBaeY=;
        b=WyNtRQwL6mZfe1/YqZqbYyZOHuYbnD2qXbCVbd/40v1MU7gtCzsyocGgBkgsTM4TNq
         UnSBSv5Z3k5vazC0B2Oc+j/8MTd2Zfy1a8Ck2a72ebc/DIoeWGfBw/HKhsTELua39fwy
         UOCIn69EdMfNVsJ1cOesxEVBBDWZ2s/owaup+Gxb0gBse2xEq0409n6b/LsX050r+1x7
         x07PGWsiD7PEsUQz6aj0hUwlVVEhFMPjwQvb71RuHdGNP5tpGU5tHUFsFHcQy/4mvsSP
         2UhVxfq6ht7isFZNWb4H47S+JScXzyAIt3f3MLZaukfjLqPbre7SZz4x1fwiZyGdFhM+
         Mnuw==
X-Forwarded-Encrypted: i=1; AFNElJ+FhzJLmKzQwQcO6DuEHmEv4xUHcpr2AgjY/Sc44knmVEM5XgyXAqNZbTNpWItWEc/2uGquZs+7FSzm@vger.kernel.org
X-Gm-Message-State: AOJu0YxoL2nRTShf+hk0tGaabJkMI38200VXp6S8lUfyYSDAFBP6fI3R
	zizzQ4YevPdHzZt7RXHXARkRcX+xpCnU5JFv/PR3SE+HDTRcjRj4zCzchuHobbv6P4s=
X-Gm-Gg: AeBDievrsFlul2jsSFhF+P7r0wdc2IDsn/FD+pngGYkkPprRXecP9CBHUhraUFn88Zn
	eEjdbLFQyfKFXsL1cji8xUtbmsrsBHhS1VBV1CN76p2RbQn5/WzST29pZrTXN7yf3bMG23k2nfI
	VHXbQ2it3JYm9D+GGnrkjcWibKaJZUh0AhMcvhLArGtvKQLHbX8LDC3jl1zT39FipPM8sLf1eTA
	mbXMSa98Ktc215FQq0pwBoAM+JdIT+Vc0x/rq3ZnqNWTX3w5lLaErVbm5zhzMY5SfbS+xsVBTPF
	DLtABoXoODEsdzPjK2b4yZ/A25UZSJX3UNY8UemQ9q6CiFINbFNq/QuvT61LnxE1cHbEn5ZIcdC
	5yQX8wg0D0QI/MtRfPU2iCSR6FOkrD12jIOvOgMw3tBFmR8JW8Ay1YyJFb2tHuEZUpL1gi2HeQ3
	Baa4cyfo0yWPm7cQcPuz/8K9BomI/1QoVVutjbf6GPa9chOCOaDmvUNiewr8UICi8hlAUYzC/kX
	Hkkirc0
X-Received: by 2002:a05:600c:a593:b0:489:e126:b757 with SMTP id 5b1f17b1804b1-48a8447c7dfmr14224895e9.25.1777533052159;
        Thu, 30 Apr 2026 00:10:52 -0700 (PDT)
Received: from [192.168.178.36] (046124200255.public.t-mobile.at. [46.124.200.255])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a81ed6b89sm46080825e9.1.2026.04.30.00.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 00:10:51 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Thu, 30 Apr 2026 09:10:42 +0200
Subject: [PATCH v2 2/5] pinctrl: qcom: lpass-lpi: Add ability to use
 SPARE_1 for slew control
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-sm6350-lpi-tlmm-v2-2-81d068025b97@fairphone.com>
References: <20260430-sm6350-lpi-tlmm-v2-0-81d068025b97@fairphone.com>
In-Reply-To: <20260430-sm6350-lpi-tlmm-v2-0-81d068025b97@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777533047; l=2676;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=8AL+NQRRa6kPH6NzCfcOC2Llr5owhpqb7+IMEyXnI98=;
 b=+MrwYSNWoWi0pZLMiyT+PYWHDz4bMO5KSMD0GqsL/a7Q4KPUi3ktOJmileienxzbK2uLaAs5e
 WIBgh2XEgoJCWbC3JqImBCKNIg8DSDE0HZ/15ncEtwbvPRXvJCQv9LR
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Rspamd-Queue-Id: 1CFD949E723
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35828-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[fairphone.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:email,fairphone.com:dkim,fairphone.com:mid,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On some platforms like SM6350 (Bitra), some pins have their slew
controlled with the SPARE_1 register. Add support for that.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c |  2 ++
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.h | 20 ++++++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
index 76aed3296279..15ced5027579 100644
--- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
@@ -220,6 +220,8 @@ static int lpi_config_set_slew_rate(struct lpi_pinctrl *pctrl,
 
 	if (pctrl->data->flags & LPI_FLAG_SLEW_RATE_SAME_REG)
 		reg = pctrl->tlmm_base + LPI_TLMM_REG_OFFSET * group + LPI_GPIO_CFG_REG;
+	else if (g->slew_base_spare_1)
+		reg = pctrl->slew_base + LPI_SPARE_1_REG;
 	else
 		reg = pctrl->slew_base + LPI_SLEW_RATE_CTL_REG;
 
diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h
index f48368492861..6ba0c4eba984 100644
--- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h
+++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h
@@ -16,6 +16,7 @@ struct platform_device;
 struct pinctrl_pin_desc;
 
 #define LPI_SLEW_RATE_CTL_REG	0xa000
+#define LPI_SPARE_1_REG		0xc000
 #define LPI_TLMM_REG_OFFSET		0x1000
 #define LPI_SLEW_RATE_MAX		0x03
 #define LPI_SLEW_BITS_SIZE		0x02
@@ -47,6 +48,7 @@ struct pinctrl_pin_desc;
 	{						\
 		.pin = id,				\
 		.slew_offset = soff,			\
+		.slew_base_spare_1 = false,		\
 		.funcs = (int[]){			\
 			LPI_MUX_gpio,			\
 			LPI_MUX_##f1,			\
@@ -62,6 +64,7 @@ struct pinctrl_pin_desc;
 	{							\
 		.pin = id,					\
 		.slew_offset = soff,				\
+		.slew_base_spare_1 = false,			\
 		.funcs = (int[]){				\
 			LPI_MUX_gpio,				\
 			LPI_MUX_##f1,				\
@@ -73,6 +76,22 @@ struct pinctrl_pin_desc;
 		.pin_offset = poff,				\
 	}
 
+#define LPI_PINGROUP_SLEW_SPARE_1(id, soff, f1, f2, f3, f4)	\
+	{							\
+		.pin = id,					\
+		.slew_offset = soff,				\
+		.slew_base_spare_1 = true,			\
+		.funcs = (int[]){				\
+			LPI_MUX_gpio,				\
+			LPI_MUX_##f1,				\
+			LPI_MUX_##f2,				\
+			LPI_MUX_##f3,				\
+			LPI_MUX_##f4,				\
+		},						\
+		.nfuncs = 5,					\
+		.pin_offset = 0,				\
+	}
+
 /*
  * Slew rate control is done in the same register as rest of the
  * pin configuration.
@@ -87,6 +106,7 @@ struct lpi_pingroup {
 	unsigned int *funcs;
 	unsigned int nfuncs;
 	unsigned int pin_offset;
+	bool slew_base_spare_1;
 };
 
 struct lpi_function {

-- 
2.54.0


