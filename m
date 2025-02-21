Return-Path: <linux-gpio+bounces-16411-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 116E0A40106
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2025 21:34:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E7227166CDE
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2025 20:33:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7CD3253F0D;
	Fri, 21 Feb 2025 20:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iZqozJbC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963A3253B64;
	Fri, 21 Feb 2025 20:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740169970; cv=none; b=ZjFSJjreYDi9pejqR2yfRJPmBykC57G1dEMg7qdkZ82E1fSMKbsTgm5eJ0RBwHmztLOA6di9utv6AAfCuswi3BtstbPGtpG4C8icGsCgNTwOQPc9qOT+fc+RPdZtFiq4l8rfMa3jKz3ihSaSh3xaCJZs/vKfh27lRPZ6UDLyfBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740169970; c=relaxed/simple;
	bh=8Mipz4VrzSKXY8BbbxBUC3KcuVRejyAjsTstQRtR2iA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JL6nUa3asMV4IdnBF8G6CsnT0sKkMK6Wvt2gw3YZ4dY8C4qzrb3Pymht4fTMgJEnFnQyLzaOykYn+LMpmgx46xcK96dykAjoZhheM56cUt1G+p1+iUhpzeiEJGg3bi1i9rnz0kDiqUhvdCZ68rSNxwIdOoXemGzn73AIEOY5R6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iZqozJbC; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5e04f87584dso3797970a12.3;
        Fri, 21 Feb 2025 12:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740169967; x=1740774767; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=snTumn4iv+UCdzCDJTBtnrtlkQDZvBl625j3dPFfzu0=;
        b=iZqozJbCpyIQT+uuGW+slWiRwDAXN9+2VHLrO55ozRiqsC/wBlXF7/50ABatBLosRo
         Y7YXXH5LN1KKUPKnyyA+ciOp/P/1m5gVFGM0CFfaLyozec0fQtHFmmlE49kj7oTlXJqo
         R/H9vhQ0M1+XwnRq2YQGNHrKdQV5bsUwsc4t4/s50qjc4EQoZN1i+A62WzYgvKd5Naqw
         zbRvAY+i+YjjJMUQ/CL1igJkHgjv0fvDsivqJBTZKOKg9Gywttpa16ELSM7LMqEh9Uv7
         Y4oGAaA1FMWeF/MJtqNFMyodmUxiZOQkW3qZE12C03uQojnjzK3Ypd3OuA8Jv0kGD0A6
         5rFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740169967; x=1740774767;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=snTumn4iv+UCdzCDJTBtnrtlkQDZvBl625j3dPFfzu0=;
        b=ZLkdPUqigOEJXla5pYV5+NWowa/bJ8DNDDatTsr+a0lfsDiCXDiu9RhTnnFIFZLmn1
         +wuSJKPyUOdLuLhnH6rUIQinncyauYyYOFd7KMaXPztPaDHeDgvUp+eHvRRFlW38a9Zc
         RBlIvLp294AV2GWHmzVsyN0VSBTv+Pxi9Qji/WN/Xq68usubtO04jFQgjGd6SOOqGxpc
         tHBvT0CRJrehhY0pMXZ/uNk6o3d9QDjwFdMFzkSq1Yy5aKPfa/VOxjWr14h1qltrZtXz
         MMZRKu58UkfLrdeuMRxB0Pl2i3P9e3VW902K4MoIn5TZNiGAaDcbXRJ4d0CBm86xvnom
         JoyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFiTHhMD74XA5clJ4UxWkTGTRGE7qRcvPaYnTXJb8pPEiiVS7+BbN3zUrPaX8rt781VKBLVHDDr4iQZT32@vger.kernel.org, AJvYcCWzL+afQ/Vi87DLW5DYBPS1XXpa2hs8ERnCq5sTeX2LycISp3qV1eh3sWOTyHfwKXSAPug78oHzl87p@vger.kernel.org
X-Gm-Message-State: AOJu0YygJBme0IQxkqbTjfQljzqDergSmBeO9CgH+1yL1QcizMRcQrsY
	U2XOf6rYs83NfYS19Zv5ewb4LHcbZnK9dBqEe159/6rbcwfFieSI
X-Gm-Gg: ASbGnct9H/uycVRuIg44iyewzdaA3AthqNoRRM2mq8gGLzQRey5MrvyY/VIgUrW3+qU
	T6gvnBG/7h8Ri/RhacGD2Pk+1d1Kj9KgLB//vaPFGR0UKNca/YItJOBw1FrP57wq88KGxdDZgbB
	sJdmzHfabIYyIYwMj3IEEs/YXzVnvfjm31g13AU6cz/bBzQCUToluCky8uwdile14zSiTAdXEb0
	PXsLuhnSIdmVSnuIP2rn6uOeT9hNK8YRcaZq/MhtTbEiW6OqBC0OhoUYZa4JMjvAJfYMIWFwZ4p
	j7BjSX7/OkpKME5FARjKsLjHT006En7mzWiYgrdL60gDX84CdoWM5kPQDYfa7zP5IznkTUXG
X-Google-Smtp-Source: AGHT+IFTxkMlCgyEhrq+P+QrT3EEXq7+LvpCxZ7kChZ/0Jf/Wob5JHP2c7HEHF/fdXcS44PmZFoEWw==
X-Received: by 2002:a05:6402:388e:b0:5e0:818a:5f43 with SMTP id 4fb4d7f45d1cf-5e0b723ee9cmr4508702a12.30.1740169966265;
        Fri, 21 Feb 2025 12:32:46 -0800 (PST)
Received: from hex.my.domain (83.8.202.192.ipv4.supernova.orange.pl. [83.8.202.192])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1c418bsm14653485a12.24.2025.02.21.12.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 12:32:45 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Fri, 21 Feb 2025 21:32:38 +0100
Subject: [PATCH v2 2/6] pinctrl: bcm281xx: Use "unsigned int" instead of
 bare "unsigned"
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250221-bcm21664-pinctrl-v2-2-7d1f0279fe16@gmail.com>
References: <20250221-bcm21664-pinctrl-v2-0-7d1f0279fe16@gmail.com>
In-Reply-To: <20250221-bcm21664-pinctrl-v2-0-7d1f0279fe16@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Stanislav Jakubek <stano.jakubek@gmail.com>, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740169959; l=5672;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=8Mipz4VrzSKXY8BbbxBUC3KcuVRejyAjsTstQRtR2iA=;
 b=361j678cJVEP1V9qvwiEzsITzWeF0xPxKGUFsbIxvFBTKMrsoLTjkkVw8eJ1g9mNiTBiDa2m9
 swVJ5JJYpnoATWOl4KmsMUCH2hQpfUOge9WUV+wrwskkWxXCCScvD+O
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


