Return-Path: <linux-gpio+bounces-22565-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C494CAF0E51
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 10:45:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C33A483364
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 08:45:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A70C23CEF9;
	Wed,  2 Jul 2025 08:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="KJ6O/cCq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A206B1ACEAF
	for <linux-gpio@vger.kernel.org>; Wed,  2 Jul 2025 08:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751445944; cv=none; b=gC9yEnQfNevFSEITiJc4jYzT1O9pQmWnoqh8uRVBbnU1bhG6g2FDmONzAvMQA/nbGnUVSgjU2JsgLi0MVLJRxK7+4I1vqM+0kGIFkLuNdk+vPVjj/++MFpBSdl1cmnF7zy8uqH/3YceSmuwJvTtIvEUFPGxZH/IdzQYr9O1nR5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751445944; c=relaxed/simple;
	bh=WAFN3XMGJl1YSCRSRQ49asmYULSwnRZTgEOnMEgM9kI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UksJYMiua+0n11hAgwDUfIWv+XlTqw4eo9aeu5RYz/R1+tPf+JEQZjZOZT1NLlMfBUE1pVhP8Ia++VizraQHTbEpBke1YOtXRhDYuyZvVgICM02Zasy0Z4cM7Fi9qtuceO7dhwFwGP67ABHNefx1fXydNBfBpPzJH6P5Dsa6Wj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=KJ6O/cCq; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4538bc1cffdso39689605e9.0
        for <linux-gpio@vger.kernel.org>; Wed, 02 Jul 2025 01:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751445940; x=1752050740; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eT32Fo8JzyMKt5wvkWJtbuCECu+UVVsWJUiz4fSfT0s=;
        b=KJ6O/cCqtMNNgYnMau6uatdkqTeTWbE8bTWNz5Brmfc6hRBNzO+SjV6dAeKTYez01j
         7mBSFqJ+NJhAETDqoss3Sv+B0VNfvSY2ZkAJ84Chn39wZNR/wvk1k6oA+xUuDzA3ZwdS
         +SugGRThsDZgyRCG91tkxFP1GkXr8SBmWzMtfGX8YzN6E64KDSf12ryWPeYnCjuKRDbp
         URcFegRLkieClV2yAlO1dO598IarfBECdwZmSpY2rghC5aLmfWJdc4r7es4pretvm5B2
         4FBBh4bgrhPIzlpvj9SGELdQYvYPkWUvM+g50x8P3drhGvTdGxexPkJDGOl/1K0+pDZC
         N2/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751445940; x=1752050740;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eT32Fo8JzyMKt5wvkWJtbuCECu+UVVsWJUiz4fSfT0s=;
        b=B1+lDT4TzujiC6WoMCUAAThmIcStDLBsv28qFd52HrcOY4+l9/auWPAGaAQGaK2lHj
         thrmG9nkG1lOG2MxHgYFxCQyyoipoj6YzWJsiW8Nvi5S7qRlV7dwxc+u8NgxW5rJX58w
         +deFh6PQasPWZKTG3PQ3vZTV3BPq2RH/pfdSO0YtHIclZybiFt4e8LTSdR1lsy5PYOiH
         D881l9JAp80dTCkgEoK2EMpsVxATEa2ZpmMrBFQPMxClUZuAXzfCnjwxHPXXkoIyj2RT
         oW9UqM4aOJSqhr2i/Np1avLoYuom1A9ClH4Vu+Vj+4oGsMVeri93BxEqzyPegQrN+Npq
         fzDg==
X-Gm-Message-State: AOJu0YzJ1tGaToDSWUT4LwdWc0Rolqc6Ucg9ZnVgX7ftxvM7vAXrcI16
	54BmRCA2Yhb3gjltLDRBWIqCaiUHWztbZLTvuZymlzqf7ySS7wPXW15YtQ8jWr+iS2Y=
X-Gm-Gg: ASbGnctHNNOdEoWREh9SuNoJcwHHLolYMbEXDGQYOmmiurbJZfzI0ZaYGACC8GQxUde
	Uc8C3JePdCNgqk22+dStDVcumpqzkRJ/hO+znAtoI7SAhIWZGsURguRnrekzkAEtPT8ANiyZclu
	WfziXJ7slWVH6U+UjCbBOAno0bEnKBjpaQJkSK5sVx7/Z6hLr6K76uzB6yvfgFySHtqaOFO2wkG
	QgDe0VvfuItWwScD/sZbbRCQ/tnznf14+a0Sbax4foWWw0zyA7W9lvmd88OvBcC7yIcOjyFNvax
	tNEgEXj/LP6QVsA7egmrJK3ozKUTLPgIdZikW7RflOXvscegBtoq0A==
X-Google-Smtp-Source: AGHT+IHG3Yj+dH/J1LSuzIb/KvrqdHiuMNAs7+JHPwiQz+8EIfOrd3c/qJCkVCObtKeDO0K6/uKVYQ==
X-Received: by 2002:a05:6000:4611:b0:3a6:ec1d:1cba with SMTP id ffacd0b85a97d-3b1fea90838mr1441696f8f.20.1751445939834;
        Wed, 02 Jul 2025 01:45:39 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8827:d0e:25e:834a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e52a26sm15620571f8f.51.2025.07.02.01.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 01:45:38 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 02 Jul 2025 10:45:31 +0200
Subject: [PATCH RFC 1/5] pinctrl: allow to mark pin functions as
 requestable GPIOs
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-pinctrl-gpio-pinfuncs-v1-1-ed2bd0f9468d@linaro.org>
References: <20250702-pinctrl-gpio-pinfuncs-v1-0-ed2bd0f9468d@linaro.org>
In-Reply-To: <20250702-pinctrl-gpio-pinfuncs-v1-0-ed2bd0f9468d@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Alexey Klimov <alexey.klimov@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5275;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=VoXODpXI27tHlO4yOhmbyOjvm5AV1TRNRVTTPs+jIns=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoZPGvlSUBKMn73XM8CBhUX3vLu3W2QtZGA8zPI
 hpUN2TYdDSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGTxrwAKCRARpy6gFHHX
 cpnZEACWs8czQlfIRRQH1G6v7fzPiWMAdQ+g29fdQS2NJufJm3dWG3YIcKTFaAo2i4981K7JDy5
 WRwLdGrY/OuAjE7s6/YRi8hT5klrMWD6R9Mzc2LSg368EqxUlTYZkXFcOT6XPuzlHmy/TLAq8HF
 jokOjYQTEfECNshM+Lxl1Q0UZdBhpvISVJJjTgx/oJ2i9owI/CRhm55V+u3Z8n4ox3qOoVN31XY
 +MgAQo0kGIRwHt90Ua4Yz66WxcU86Wh4iITMx42EFi68HaHsAZf5ernKb88suNf029SDMCWA44F
 RJqUxqfqFD/Rv3JZSqUbAbJTZIhwN62c1C/kXx6JFMVBfiqmJtgRW8BlNQ0+iwICAou8lbHmnVX
 mxPG4T/fURdaG+sum2aLEDBdDcK1oGVViRzNJQWJ7IA+9wAGDz8dCG2cR18L4zvGXjowqliXgrY
 O4xFA/GFC3t0u84BONgayXP5+uFhimQs+6MkP7QBujDykZNYR9aDb+3bDgrp9j4yJDyJf/9CHoN
 14ZbxJJCvW5YgOnTtBd519HkYpw6htYmJtPGpSgnlInDJD5C+lF6HmM5oMVRbY9dq9bsBSNR7+D
 3+XkpGCoNeHhZ/HGuLz+g8HKkqIHWvIlg+8WtT+GIKasj0xhlCqVwGz9LWCnhUHFxYEHS+tv+y6
 zyy62yylszHnA3w==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The name of the pin function has no real meaning to pinctrl core and is
there only for human readability of device properties. Some pins are
muxed as GPIOs but for "strict" pinmuxers it's impossible to request
them as GPIOs if they're bound to a devide - even if their function name
explicitly says "gpio". Add a new field to struct pinfunction that
allows to pass additional flags to pinctrl core. While we could go with
a boolean "is_gpio" field, a flags field is more future-proof.

If the PINFUNCTION_FLAG_GPIO is set for a given function, the pin muxed
to it can be requested as GPIO even on strict pin controllers. Add a new
callback to struct pinmux_ops - function_is_gpio() - that allows pinmux
core to inspect a function and see if it's a GPIO one.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinmux.c        | 17 +++++++++++++++--
 include/linux/pinctrl/pinctrl.h | 14 ++++++++++++++
 include/linux/pinctrl/pinmux.h  |  2 ++
 3 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index 0743190da59e819d1c72c1ed1ece72f206d60d65..49855e6c49616d70bf9c805fc7c11ef41284dc52 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -89,13 +89,19 @@ bool pinmux_can_be_used_for_gpio(struct pinctrl_dev *pctldev, unsigned int pin)
 {
 	struct pin_desc *desc = pin_desc_get(pctldev, pin);
 	const struct pinmux_ops *ops = pctldev->desc->pmxops;
+	const struct pinctrl_setting_mux *mux_setting = desc->mux_setting;
+	bool func_is_gpio = false;
 
 	/* Can't inspect pin, assume it can be used */
 	if (!desc || !ops)
 		return true;
 
 	guard(mutex)(&desc->mux_lock);
-	if (ops->strict && desc->mux_usecount)
+	if (ops->function_is_gpio && mux_setting)
+		func_is_gpio = ops->function_is_gpio(pctldev,
+						     mux_setting->func);
+
+	if (ops->strict && desc->mux_usecount && !func_is_gpio)
 		return false;
 
 	return !(ops->strict && !!desc->gpio_owner);
@@ -116,7 +122,9 @@ static int pin_request(struct pinctrl_dev *pctldev,
 {
 	struct pin_desc *desc;
 	const struct pinmux_ops *ops = pctldev->desc->pmxops;
+	const struct pinctrl_setting_mux *mux_setting;
 	int status = -EINVAL;
+	bool func_is_gpio = false;
 
 	desc = pin_desc_get(pctldev, pin);
 	if (desc == NULL) {
@@ -126,11 +134,16 @@ static int pin_request(struct pinctrl_dev *pctldev,
 		goto out;
 	}
 
+	mux_setting = desc->mux_setting;
+
 	dev_dbg(pctldev->dev, "request pin %d (%s) for %s\n",
 		pin, desc->name, owner);
 
 	scoped_guard(mutex, &desc->mux_lock) {
-		if ((!gpio_range || ops->strict) &&
+		if (ops->function_is_gpio && mux_setting)
+			func_is_gpio = ops->function_is_gpio(pctldev,
+							     mux_setting->func);
+		if ((!gpio_range || ops->strict) && !func_is_gpio &&
 		    desc->mux_usecount && strcmp(desc->mux_owner, owner)) {
 			dev_err(pctldev->dev,
 				"pin %s already requested by %s; cannot claim for %s\n",
diff --git a/include/linux/pinctrl/pinctrl.h b/include/linux/pinctrl/pinctrl.h
index d138e18156452e008f24ca06358fcab45135632f..1a8084e2940537f8f0862761d3e47c56c8783193 100644
--- a/include/linux/pinctrl/pinctrl.h
+++ b/include/linux/pinctrl/pinctrl.h
@@ -11,6 +11,7 @@
 #ifndef __LINUX_PINCTRL_PINCTRL_H
 #define __LINUX_PINCTRL_PINCTRL_H
 
+#include <linux/bits.h>
 #include <linux/types.h>
 
 struct device;
@@ -206,16 +207,20 @@ extern int pinctrl_get_group_pins(struct pinctrl_dev *pctldev,
 				  const char *pin_group, const unsigned int **pins,
 				  unsigned int *num_pins);
 
+#define PINFUNCTION_FLAG_GPIO	BIT(0)
+
 /**
  * struct pinfunction - Description about a function
  * @name: Name of the function
  * @groups: An array of groups for this function
  * @ngroups: Number of groups in @groups
+ * @flags: Additional pin function flags
  */
 struct pinfunction {
 	const char *name;
 	const char * const *groups;
 	size_t ngroups;
+	unsigned long flags;
 };
 
 /* Convenience macro to define a single named pinfunction */
@@ -226,6 +231,15 @@ struct pinfunction {
 		.ngroups = (_ngroups),			\
 	}
 
+/* Same as PINCTRL_PINFUNCTION() but for the GPIO category of functions */
+#define PINCTRL_GPIO_PINFUNCTION(_name, _groups, _ngroups)	\
+(struct pinfunction) {						\
+		.name = (_name),				\
+		.groups = (_groups),				\
+		.ngroups = (_ngroups),				\
+		.flags = PINFUNCTION_FLAG_GPIO,			\
+	}
+
 #if IS_ENABLED(CONFIG_OF) && IS_ENABLED(CONFIG_PINCTRL)
 extern struct pinctrl_dev *of_pinctrl_get(struct device_node *np);
 #else
diff --git a/include/linux/pinctrl/pinmux.h b/include/linux/pinctrl/pinmux.h
index d6f7b58d6ad0cce421aad80463529c9ccc65d68e..6db6c3e1ccc2249d4b4204e6fc19bf7b4397cc81 100644
--- a/include/linux/pinctrl/pinmux.h
+++ b/include/linux/pinctrl/pinmux.h
@@ -66,6 +66,8 @@ struct pinmux_ops {
 				    unsigned int selector,
 				    const char * const **groups,
 				    unsigned int *num_groups);
+	bool (*function_is_gpio) (struct pinctrl_dev *pctldev,
+				  unsigned int selector);
 	int (*set_mux) (struct pinctrl_dev *pctldev, unsigned int func_selector,
 			unsigned int group_selector);
 	int (*gpio_request_enable) (struct pinctrl_dev *pctldev,

-- 
2.48.1


