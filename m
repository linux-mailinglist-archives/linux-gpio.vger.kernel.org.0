Return-Path: <linux-gpio+bounces-6976-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F5E8D515B
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 19:44:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E024DB25EB9
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 17:44:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18AD754F91;
	Thu, 30 May 2024 17:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m2FUvWEe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A3A4F5EA;
	Thu, 30 May 2024 17:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717090956; cv=none; b=iNEYZ4IPW6c9F05GXCzRCKs2urd3DMB+9BmnYc9ELTpjaTbl4mQDcKD5mI3A2oiwMnd0FEZE/bwzUCET6UrQe0FRAGrnOIAEtLphlaFGr80ODvRaSESnxIftJGDKJu1giBzZ8r30X7GQhommKQ/2Teul8RQMIbd0sLNct39UoZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717090956; c=relaxed/simple;
	bh=q0csrNRsixEX0TyQyIu5xaVSDKbgOtS1QmtlSnL9s9I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kIQvZkQKZa8H1rZ1AqsVP0q4vr+9WtGoaNQ8onX885peZ4ObmIxqLV5mYeYhizWm+8uA8SryfQVkTneaUUIAJ7mVTFbPHTJjY3DoWX1bbG/IR3+N/9XC2vxfKy7uBw+je5GMui8IMO86UY0vSjsW2VEnfslesR8vZzUrt3mW5+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m2FUvWEe; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1f62fae8c1aso2049095ad.3;
        Thu, 30 May 2024 10:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717090955; x=1717695755; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+NLOuHzEcMgVIytxEmRGRAjntJCNFity9U+tUnuma0Y=;
        b=m2FUvWEelRqfs8q0b5/tlb/eC0QFwyKq448pROYxgc0kdPpKre8UMYNEjA6NGM7N8X
         rBDnaSWTAnKGGmTEx0tc0E922+5bvxLe29hC/IaWSn52LGYlLnq9ahViit05i2jbsDRZ
         EsDJdK0oiYh7lrOxKFnq3i1Ngi1CVHSb1wsAmRr0YcIndcwEXW2SqekM9XRS+aoKfbXN
         uOjG0kAsNIBVdZTe06sQ38ocm9hMfwNPt4CxlqsaG9tYMFyTNpU0l5fjv8FAcU3cdTwR
         WllUWycHob3hZSfX/xzKfZz2PCt6sVPStxQRf5fLSK0qel8wxq0gRkUqTI6gNgDq7cMl
         94Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717090955; x=1717695755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+NLOuHzEcMgVIytxEmRGRAjntJCNFity9U+tUnuma0Y=;
        b=b7ackqMXQgfHqiwwzPXjB9BTrT4yGpSRoieLY9YDevsVUr2myd2DsZIWD2hNGG801g
         aynlJfUcH4YdCuLU2lpNVI3nbc8/fmeWcJcKa/DXfzRb1qVPVdm4rBKUw8pqfB3TMxUf
         AagZGyKE6ejkL6e5f9NotoaODk8f/MetC84pPRbf2gflOcOe2NvekLtV3lwFEO+YU0N7
         slZBiOvkCwDT/TkfFftdwO46VH023zrgLSQiuSmwoed+qHatpji+7oZo28CBssJnjs5T
         knhZyLW/lOVAfatUHLWX0p3+yDJph2hw8G8HEFGC7uZ2qnMh1cRnWMjUhCUJDHQmZCi4
         cscw==
X-Forwarded-Encrypted: i=1; AJvYcCWadGZRugf1e8SCZecoThJc+/PZIY0TryXKuvs3GUszgQ6eyo1VmZwLhIxPCB2wB9LjigTIHgDYhqEjE79SfTPBd8mHqn6nC+PD3izzt/LtwpE6rKrB9XcA8Ut40qpUUpNwxucGdqJ4ApvxHNzhJoW05bIVeTaJLCjGuXggTOj9vOuLpjA=
X-Gm-Message-State: AOJu0YxGpB7B2EsyNMiFBX0i+hY+8ev4I9bnhaHcvgyEvZ+yckxXtLNk
	k37naexIQIBWuT5dPwQ4Icv18nvF+8MiAESA4DUlzYjwwZoamX+b1a2/INIbQf4=
X-Google-Smtp-Source: AGHT+IFGnWu3K8laDIcig7kEnnq0Sz3AfcAYYzhWSFDyDw/nwL/I5DRG2GX1mYAB4rzSLFHA2G6mMg==
X-Received: by 2002:a17:902:f548:b0:1f4:a008:29d3 with SMTP id d9443c01a7336-1f6195f9ac8mr32031535ad.15.1717090954665;
        Thu, 30 May 2024 10:42:34 -0700 (PDT)
Received: from prasmi.. ([2401:4900:1c07:3bcb:e05d:a577:9add:a9ce])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f63240c947sm450105ad.269.2024.05.30.10.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 10:42:34 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Paul Barker <paul.barker.ct@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 11/15] pinctrl: renesas: pinctrl-rzg2l: Add support to set pulling up/down the pins
Date: Thu, 30 May 2024 18:38:53 +0100
Message-Id: <20240530173857.164073-12-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240530173857.164073-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240530173857.164073-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add support to configure bias-disable, bias-pull-up, and bias-pull-down
properties of the pin.

Two new function pointers, hw_to_bias_param() and bias_param_to_hw(), are
introduced in the struct rzg2l_pinctrl_data to configure bias settings,
as the values in the PUPD register differ when compared to the RZ/G2L
family and the RZ/V2H(P) SoC.

Value | RZ/G2L        | RZ/V2H
---------------------------------
00b:  | Bias Disabled | Pull up/down disabled
01b:  | Pull-up       | Pull up/down disabled
10b:  | Pull-down     | Pull-down
11b:  | Prohibited    | Pull-up

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3
- Updated commit message
- Renamed get_bias_param -> hw_to_bias_param
- Renamed get_bias_val -> bias_param_to_hw
- Dropped un-necessary block {}
- Now reading arg before calling hw_to_bias_param()

RFC->v2
- New patch
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 72 +++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 6b82e78afa7c..e60049b66203 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -129,6 +129,7 @@
 #define IOLH(off)		(0x1000 + (off) * 8)
 #define SR(off)			(0x1400 + (off) * 8)
 #define IEN(off)		(0x1800 + (off) * 8)
+#define PUPD(off)		(0x1C00 + (off) * 8)
 #define ISEL(off)		(0x2C00 + (off) * 8)
 #define SD_CH(off, ch)		((off) + (ch) * 4)
 #define ETH_POC(off, ch)	((off) + (ch) * 4)
@@ -147,6 +148,7 @@
 #define IEN_MASK		0x01
 #define IOLH_MASK		0x03
 #define SR_MASK			0x01
+#define PUPD_MASK		0x03
 
 #define PM_INPUT		0x1
 #define PM_OUTPUT		0x2
@@ -259,6 +261,8 @@ struct rzg2l_pinctrl_data {
 	void (*pmc_writeb)(struct rzg2l_pinctrl *pctrl, u8 val, u16 offset);
 	u32 (*oen_read)(struct rzg2l_pinctrl *pctrl, u32 caps, u32 offset, u8 pin);
 	int (*oen_write)(struct rzg2l_pinctrl *pctrl, u32 caps, u32 offset, u8 pin, u8 oen);
+	int (*hw_to_bias_param)(unsigned int val);
+	int (*bias_param_to_hw)(enum pin_config_param param);
 };
 
 /**
@@ -1000,6 +1004,38 @@ static int rzg2l_write_oen(struct rzg2l_pinctrl *pctrl, u32 caps, u32 offset, u8
 	return 0;
 }
 
+static int rzg2l_hw_to_bias_param(unsigned int bias)
+{
+	switch (bias) {
+	case 0:
+		return PIN_CONFIG_BIAS_DISABLE;
+	case 1:
+		return PIN_CONFIG_BIAS_PULL_UP;
+	case 2:
+		return PIN_CONFIG_BIAS_PULL_DOWN;
+	default:
+		break;
+	}
+
+	return -EINVAL;
+}
+
+static int rzg2l_bias_param_to_hw(enum pin_config_param param)
+{
+	switch (param) {
+	case PIN_CONFIG_BIAS_DISABLE:
+		return 0;
+	case PIN_CONFIG_BIAS_PULL_UP:
+		return 1;
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+		return 2;
+	default:
+		break;
+	}
+
+	return -EINVAL;
+}
+
 static int rzg2l_pinctrl_pinconf_get(struct pinctrl_dev *pctldev,
 				     unsigned int _pin,
 				     unsigned long *config)
@@ -1058,6 +1094,23 @@ static int rzg2l_pinctrl_pinconf_get(struct pinctrl_dev *pctldev,
 		arg = rzg2l_read_pin_config(pctrl, SR(off), bit, SR_MASK);
 		break;
 
+	case PIN_CONFIG_BIAS_DISABLE:
+	case PIN_CONFIG_BIAS_PULL_UP:
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+		if (!(cfg & PIN_CFG_PUPD))
+			return -EINVAL;
+
+		arg = rzg2l_read_pin_config(pctrl, PUPD(off), bit, PUPD_MASK);
+		ret = pctrl->data->hw_to_bias_param(arg);
+		if (ret < 0)
+			return ret;
+
+		if (ret != param)
+			return -EINVAL;
+		/* for PIN_CONFIG_BIAS_PULL_UP/DOWN when enabled we just return 1 */
+		arg = 1;
+		break;
+
 	case PIN_CONFIG_DRIVE_STRENGTH: {
 		unsigned int index;
 
@@ -1173,6 +1226,19 @@ static int rzg2l_pinctrl_pinconf_set(struct pinctrl_dev *pctldev,
 			rzg2l_rmw_pin_config(pctrl, SR(off), bit, SR_MASK, arg);
 			break;
 
+		case PIN_CONFIG_BIAS_DISABLE:
+		case PIN_CONFIG_BIAS_PULL_UP:
+		case PIN_CONFIG_BIAS_PULL_DOWN:
+			if (!(cfg & PIN_CFG_PUPD))
+				return -EINVAL;
+
+			ret = pctrl->data->bias_param_to_hw(param);
+			if (ret < 0)
+				return ret;
+
+			rzg2l_rmw_pin_config(pctrl, PUPD(off), bit, PUPD_MASK, ret);
+			break;
+
 		case PIN_CONFIG_DRIVE_STRENGTH:
 			arg = pinconf_to_config_argument(_configs[i]);
 
@@ -2645,6 +2711,8 @@ static struct rzg2l_pinctrl_data r9a07g043_data = {
 	.pmc_writeb = &rzg2l_pmc_writeb,
 	.oen_read = &rzg2l_read_oen,
 	.oen_write = &rzg2l_write_oen,
+	.hw_to_bias_param = &rzg2l_hw_to_bias_param,
+	.bias_param_to_hw = &rzg2l_bias_param_to_hw,
 };
 
 static struct rzg2l_pinctrl_data r9a07g044_data = {
@@ -2660,6 +2728,8 @@ static struct rzg2l_pinctrl_data r9a07g044_data = {
 	.pmc_writeb = &rzg2l_pmc_writeb,
 	.oen_read = &rzg2l_read_oen,
 	.oen_write = &rzg2l_write_oen,
+	.hw_to_bias_param = &rzg2l_hw_to_bias_param,
+	.bias_param_to_hw = &rzg2l_bias_param_to_hw,
 };
 
 static struct rzg2l_pinctrl_data r9a08g045_data = {
@@ -2674,6 +2744,8 @@ static struct rzg2l_pinctrl_data r9a08g045_data = {
 	.pmc_writeb = &rzg2l_pmc_writeb,
 	.oen_read = &rzg2l_read_oen,
 	.oen_write = &rzg2l_write_oen,
+	.hw_to_bias_param = &rzg2l_hw_to_bias_param,
+	.bias_param_to_hw = &rzg2l_bias_param_to_hw,
 };
 
 static const struct of_device_id rzg2l_pinctrl_of_table[] = {
-- 
2.34.1


