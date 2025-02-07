Return-Path: <linux-gpio+bounces-15572-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C63A2CD6F
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 21:03:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F3F8188AFE4
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 20:03:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C8541A8407;
	Fri,  7 Feb 2025 20:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iE+9w9X4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640A41A5B85;
	Fri,  7 Feb 2025 20:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738958574; cv=none; b=quYp9eG/UlGO1J6tLxkT8dN9FsmIQdEjlmb7djCfRnLu3s/4jC0RSrZji49qIWVSvRImbWl7Scp9sl2S6zoGEtZgaujwcekQxtN5cON52prrpzN+Dxge4p24HUItZ6Tr+mt3i7KBDNSGUGrL0vEPqyciuzq82BHZxmSZGq74C/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738958574; c=relaxed/simple;
	bh=8Mipz4VrzSKXY8BbbxBUC3KcuVRejyAjsTstQRtR2iA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cMtnIoLV7no7/YKTO4pdm1uEFIvmB7sn9+COzC8ClM1yU7rf5SRdCwPNmnpZ5SZ3tDFVzMlCJzDbGkWqwamyPPWPmCjW5rEY7krrt3CfzBiEQmXfGwReZC9yKFunkNV6f+FVqTSURMcb+eT3c8mX72qoEvOxXii9kImBRH1YI7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iE+9w9X4; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5de5bf41652so130956a12.1;
        Fri, 07 Feb 2025 12:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738958570; x=1739563370; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=snTumn4iv+UCdzCDJTBtnrtlkQDZvBl625j3dPFfzu0=;
        b=iE+9w9X4MDpX3yRFGzaxvzNiOmjNWQFmPZG1Xk/2ZA3JYYwtGS5uPoQq/duEBkM7sb
         IlUk6i7vLGfW0wJYfTdnCNi6aP3ZyFNwtQxHMgcUj7NW80LupHha3eREHpTbtJdiX6Ad
         QWw9RxO0VKINT/eHqAdHt1fhsBapjm6QM0glfNrwunp4Cow2Cqpzwf9r8niE80K0OYwe
         rRbKYn5qlrrVfLu8fSibz9rwBvVFYL2obRlCn1p08lQNrSm0vKnf1rACBKnr+a2vhI0Q
         cGkwdPhrSSxVTB9VidazovbwLSdXs8Bp+oNtcCpQMHTpfsQ1I29uOLt4iTrwcsNnkS8R
         YBiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738958570; x=1739563370;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=snTumn4iv+UCdzCDJTBtnrtlkQDZvBl625j3dPFfzu0=;
        b=vNkOXWAv/lVuCLWVnIYumnY97gtFjolSOXoqX5tIe27tLuVKtjqcB8ApsFqU9twFcU
         rP56qm5HsfweOp0fmx0CPP14rny2A7gJW/B/tEZXr2NQh1SwKzNYdKA4mJw33+M3/uF8
         EQbZS7/7teff5Qn+LpejGz027PXAPR2AVLXfEeuxKheTg6uhr/EkPLy0y2QXXWlwd4nC
         eDQBmWS23vYrtpEl6v77zZiZKjAdiht0xn5/LOxQwPsGCi5w7eHVYqJLLnmq8+MMwP2H
         wysq+yHZAPRMRyC0GsqySeJYion49ToWKJs0sAKR7y3VXB4QfFay8ReS8jKdKZtuC6v3
         f9/w==
X-Forwarded-Encrypted: i=1; AJvYcCUm6kXuQrEPO53EzNXW0yBo1gZd2wTrNlTMNwCyGFDcc15cs+a1Dpi6fhyP282SB6y/Y1OaJju2ZHcINKJr@vger.kernel.org, AJvYcCXLgVDbxbfVuehBHfOvnjBSca/bFOQwNOW/2ZhEDKuMWtesQJr0/w5YHc3IFqe11w9R805WL4jCfyR8@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2Sj7OqKiYhd+jGmN5EiCh2GYAkruocstgq+wCmGoVRyBsukUu
	Kv1T49lmueVJMZL2sjHDotu4LtIn2Ybyt50uybFBHwVf5g6bNbIojSpBoA==
X-Gm-Gg: ASbGncvHho2w/RyuWrE0WaJadV9OvkwzdlISZ8JHqSI1W+Umxizh0GuE9V6orakrDOl
	WUrJ/XAE1w6o1bAhFXA+Gy35NdBVktLZ38dVUZwq1UhMpRq6+miHccwP4iO1vml6H7sACLExGRy
	ZmppK9bbT/iH9lkpPLxEWjzQEkB2VqMyWupICP0yR3RActz6TJSkc/TPRrFNdXMVwfmmTSrm5G3
	VBycfGHj5p0kD3PV4KZFku6NzTV2vUigpmbr8UHVhByZrXXzCkCeCdRpiQAmimrar1kgJQfcVXt
	7xI1yqNN1OEpviJ8rGueJCkkWECC67IsGiSG1pZBUno7IvWTwbXeaiZE
X-Google-Smtp-Source: AGHT+IGCPUsAGzXP7K9RVxO9Z6WwP3Y5roj4zr79piTcVK2Ignfim9J1sMITZ1seLm//dPBP7tYh7g==
X-Received: by 2002:a05:6402:4344:b0:5de:5718:296 with SMTP id 4fb4d7f45d1cf-5de571802bemr1906286a12.13.1738958570162;
        Fri, 07 Feb 2025 12:02:50 -0800 (PST)
Received: from hex.my.domain (83.8.206.8.ipv4.supernova.orange.pl. [83.8.206.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5de59f893ebsm256797a12.45.2025.02.07.12.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 12:02:49 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Fri, 07 Feb 2025 21:02:42 +0100
Subject: [PATCH 3/7] pinctrl: bcm281xx: Use "unsigned int" instead of bare
 "unsigned"
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250207-bcm21664-pinctrl-v1-3-e7cfac9b2d3b@gmail.com>
References: <20250207-bcm21664-pinctrl-v1-0-e7cfac9b2d3b@gmail.com>
In-Reply-To: <20250207-bcm21664-pinctrl-v1-0-e7cfac9b2d3b@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Christian Daudt <bcm@fixthebug.org>, Sherman Yin <syin@broadcom.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Stanislav Jakubek <stano.jakubek@gmail.com>, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738958562; l=5672;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=8Mipz4VrzSKXY8BbbxBUC3KcuVRejyAjsTstQRtR2iA=;
 b=K+VSp96VQgN7Bros04P/ItSpC06vyqMsR23IgxV8MplxUQarkS9iQvu0J0uGzMFKinz3YzfeB
 DybagnrN2ytBkaHqtPDcbXgK2QIM2lu+es+9LhNknEnThX8jfmwOUrR
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=

Replace uses of bare "unsigned" with "unsigned int" to fix checkpatch
warnings. No functional change.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
 drivers/pinctrl/bcm/pinctrl-bcm281xx.c | 44 +++++++++++++++++-----------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm281xx.c b/drivers/pinctrl/bcm/pinctrl-bcm281xx.c
index cf6efa9c0364a1ad65885c982e7634f26d19c944..a039b490cdb8e6c41169bfd48abb371447c150a0 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm281xx.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm281xx.c
@@ -72,7 +72,7 @@ static enum bcm281xx_pin_type hdmi_pin = BCM281XX_PIN_TYPE_HDMI;
 struct bcm281xx_pin_function {
 	const char *name;
 	const char * const *groups;
-	const unsigned ngroups;
+	const unsigned int ngroups;
 };
 
 /*
@@ -84,10 +84,10 @@ struct bcm281xx_pinctrl_data {
 
 	/* List of all pins */
 	const struct pinctrl_pin_desc *pins;
-	const unsigned npins;
+	const unsigned int npins;
 
 	const struct bcm281xx_pin_function *functions;
-	const unsigned nfunctions;
+	const unsigned int nfunctions;
 
 	struct regmap *regmap;
 };
@@ -941,7 +941,7 @@ static struct bcm281xx_pinctrl_data bcm281xx_pinctrl = {
 };
 
 static inline enum bcm281xx_pin_type pin_type_get(struct pinctrl_dev *pctldev,
-						  unsigned pin)
+						  unsigned int pin)
 {
 	struct bcm281xx_pinctrl_data *pdata = pinctrl_dev_get_drvdata(pctldev);
 
@@ -985,7 +985,7 @@ static int bcm281xx_pinctrl_get_groups_count(struct pinctrl_dev *pctldev)
 }
 
 static const char *bcm281xx_pinctrl_get_group_name(struct pinctrl_dev *pctldev,
-						   unsigned group)
+						   unsigned int group)
 {
 	struct bcm281xx_pinctrl_data *pdata = pinctrl_dev_get_drvdata(pctldev);
 
@@ -993,9 +993,9 @@ static const char *bcm281xx_pinctrl_get_group_name(struct pinctrl_dev *pctldev,
 }
 
 static int bcm281xx_pinctrl_get_group_pins(struct pinctrl_dev *pctldev,
-					   unsigned group,
+					   unsigned int group,
 					   const unsigned **pins,
-					   unsigned *num_pins)
+					   unsigned int *num_pins)
 {
 	struct bcm281xx_pinctrl_data *pdata = pinctrl_dev_get_drvdata(pctldev);
 
@@ -1007,7 +1007,7 @@ static int bcm281xx_pinctrl_get_group_pins(struct pinctrl_dev *pctldev,
 
 static void bcm281xx_pinctrl_pin_dbg_show(struct pinctrl_dev *pctldev,
 					  struct seq_file *s,
-					  unsigned offset)
+					  unsigned int offset)
 {
 	seq_printf(s, " %s", dev_name(pctldev->dev));
 }
@@ -1029,7 +1029,7 @@ static int bcm281xx_pinctrl_get_fcns_count(struct pinctrl_dev *pctldev)
 }
 
 static const char *bcm281xx_pinctrl_get_fcn_name(struct pinctrl_dev *pctldev,
-						 unsigned function)
+						 unsigned int function)
 {
 	struct bcm281xx_pinctrl_data *pdata = pinctrl_dev_get_drvdata(pctldev);
 
@@ -1037,9 +1037,9 @@ static const char *bcm281xx_pinctrl_get_fcn_name(struct pinctrl_dev *pctldev,
 }
 
 static int bcm281xx_pinctrl_get_fcn_groups(struct pinctrl_dev *pctldev,
-					   unsigned function,
+					   unsigned int function,
 					   const char * const **groups,
-					   unsigned * const num_groups)
+					   unsigned int * const num_groups)
 {
 	struct bcm281xx_pinctrl_data *pdata = pinctrl_dev_get_drvdata(pctldev);
 
@@ -1050,8 +1050,8 @@ static int bcm281xx_pinctrl_get_fcn_groups(struct pinctrl_dev *pctldev,
 }
 
 static int bcm281xx_pinmux_set(struct pinctrl_dev *pctldev,
-			       unsigned function,
-			       unsigned group)
+			       unsigned int function,
+			       unsigned int group)
 {
 	struct bcm281xx_pinctrl_data *pdata = pinctrl_dev_get_drvdata(pctldev);
 	const struct bcm281xx_pin_function *f = &pdata->functions[function];
@@ -1082,7 +1082,7 @@ static const struct pinmux_ops bcm281xx_pinctrl_pinmux_ops = {
 };
 
 static int bcm281xx_pinctrl_pin_config_get(struct pinctrl_dev *pctldev,
-					   unsigned pin,
+					   unsigned int pin,
 					   unsigned long *config)
 {
 	return -ENOTSUPP;
@@ -1091,9 +1091,9 @@ static int bcm281xx_pinctrl_pin_config_get(struct pinctrl_dev *pctldev,
 
 /* Goes through the configs and update register val/mask */
 static int bcm281xx_std_pin_update(struct pinctrl_dev *pctldev,
-				   unsigned pin,
+				   unsigned int pin,
 				   unsigned long *configs,
-				   unsigned num_configs,
+				   unsigned int num_configs,
 				   u32 *val,
 				   u32 *mask)
 {
@@ -1207,9 +1207,9 @@ static const u16 bcm281xx_pullup_map[] = {
 
 /* Goes through the configs and update register val/mask */
 static int bcm281xx_i2c_pin_update(struct pinctrl_dev *pctldev,
-				   unsigned pin,
+				   unsigned int pin,
 				   unsigned long *configs,
-				   unsigned num_configs,
+				   unsigned int num_configs,
 				   u32 *val,
 				   u32 *mask)
 {
@@ -1277,9 +1277,9 @@ static int bcm281xx_i2c_pin_update(struct pinctrl_dev *pctldev,
 
 /* Goes through the configs and update register val/mask */
 static int bcm281xx_hdmi_pin_update(struct pinctrl_dev *pctldev,
-				    unsigned pin,
+				    unsigned int pin,
 				    unsigned long *configs,
-				    unsigned num_configs,
+				    unsigned int num_configs,
 				    u32 *val,
 				    u32 *mask)
 {
@@ -1321,9 +1321,9 @@ static int bcm281xx_hdmi_pin_update(struct pinctrl_dev *pctldev,
 }
 
 static int bcm281xx_pinctrl_pin_config_set(struct pinctrl_dev *pctldev,
-					   unsigned pin,
+					   unsigned int pin,
 					   unsigned long *configs,
-					   unsigned num_configs)
+					   unsigned int num_configs)
 {
 	struct bcm281xx_pinctrl_data *pdata = pinctrl_dev_get_drvdata(pctldev);
 	enum bcm281xx_pin_type pin_type;

-- 
2.48.1


