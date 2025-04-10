Return-Path: <linux-gpio+bounces-18648-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CCCAA83EFC
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Apr 2025 11:37:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B7A7319E384E
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Apr 2025 09:36:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AA252571CB;
	Thu, 10 Apr 2025 09:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="W9qccO3b"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C904B2673B7
	for <linux-gpio@vger.kernel.org>; Thu, 10 Apr 2025 09:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744277708; cv=none; b=EC6cZbsFOIoB6woF6SWsu6uKvWO/rJ1745B2CbVYuw4k2+GZfbNVbvn/CJqxhDlcmEiokOmfvYFa4ypptcTF15wIQn13TlD3tEPHFC99Oyn1ySQNfOGafz7Lm2vEF5w9aOtipN9OJGaXbm7oC5x0OLm1yuuv82qsoioN2kfoLlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744277708; c=relaxed/simple;
	bh=zFunwlPY75c5O2YN8hwBDuNKH7oOIClUtknUohNLaUk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DO0UrAKswxas0PcJSmyXvZKFvfHLwzVTcqWKR0GK4fQX9xBotg2pU54VQihVMz0aFe2/XhQGWVT7HS4HtQJ8oOlLk86qldk9gq4/7dupN3YWxbMRuw0BB6jhPbHxlXkEUGtqqkcEkaUEqgXB6HrKkxKLUk/1TPzOQj9iBTPRgVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=W9qccO3b; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso3869035e9.0
        for <linux-gpio@vger.kernel.org>; Thu, 10 Apr 2025 02:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744277705; x=1744882505; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7uVB7is+yptYnkVSs1mCx+BRG/1hovP9Bmmev11MiCo=;
        b=W9qccO3bs6lgYt4fi704JjP9iyOQAk5T5Yzw7Q3EMnJTWiRfETqJN553LTikUogc12
         UMDEqCss5a7Du3E1qkDheSgTa+5xrcEUHygNJ+B043UAww3hNtcXfrIwx/DNPAOuEpgC
         ZzeaQSneb87FqCI1b88K/SEqi0KRPGGY+N9WE5M76i8o7kgowsrUcTBlPPvNgD0qbZEk
         tLNeJkRA0r1GYOtcvCK6wd7nExfWMAtmpp8AYB+eikAl/2jD7vYwec7AdNBfK8nMgokg
         g3VmnxN+UgL6B4cZy/C7UVcOWdt9CLkpbOHs4TzDRTjkt/5Y7qWs2aBOkz5rR011QRzt
         3zdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744277705; x=1744882505;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7uVB7is+yptYnkVSs1mCx+BRG/1hovP9Bmmev11MiCo=;
        b=W17wZJoLWZwv1TfUHrg9+to2znb/903cZbUaUstjtiELqc/SduAX8h4tuI07do/qso
         lzIgFgTKWLpAxQeB3I+Pa6MFpUIRr+JpeipGCNOokxS5QqtzTYQ8Hrik5yH80TI9K3hc
         bo3+GzwRDPP+9CwYcBA4P+9EnyxiW+QQvr6h5Nk1NFO3+RGQDPvoIjLDxtt9evhtGgiM
         SFB/Es/fGlhuzK3aIwnF9fDt4JK6ieHW3U+PVu3qqiKstuDY0D3LoiKDybiJekHorMDk
         6eWIamxTxjxDUjb5UZek8cgZFD9R34i0/FANM7kb0bO6sSBPSFfpq0n9cNIsQ3ufT804
         g7jQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6Mofk0UsW1MZuV/yWYTVmtEi2BLcHMZaf12Fc9Ot05o7YaiXSvOk+kVQsgSqMjuCTE3W2nHQ4vFxh@vger.kernel.org
X-Gm-Message-State: AOJu0Yycqz1yo1+Kv85sSBlDSI6G4/3rcwxvNES3eIMIYyCXThoXXrVt
	jMWw7Dn1t+NY5VuQQpCeo+M99JuOMD2+nOo2ucoY9E+JK80pnyKpxHSjJpoWGjM=
X-Gm-Gg: ASbGncsQNlnwFCsCmhaI1yGLK2UmqIG7LGVxqTVv+E+dX5kFZtO/dpvIiuoONVdD/yV
	fEVawt4Dr8Z4vBQExQxC0T0TsKsjhSV27OSwHp38gHDnby83dAXUpuEhAxfYKC8IgzQikKWfnmJ
	AXl0TpQAOmpFn/v6CSDuZ2F0vHE27kE6icHGgEjPdxSQKPXTbJMN3se0YKzo5jbGU0IQdGe3EeV
	wtOr+1cm1PxGusCTtEVt58J0Ovv4lo1xD8aOfncuhQSS6+xSAzRb4Kl3UA2kZtMKhnCne5i/+mU
	y/e0xT6ZqNLbE00H00S0fXu6BoWGoHiH2A==
X-Google-Smtp-Source: AGHT+IEsH6d2SUTQWewRxYYD+N3HJJN6aM4+/YoTK55TGBszabn39T4iPSfWmelp16bXe8GM+S+YwQ==
X-Received: by 2002:a05:600c:4e0a:b0:43d:16a0:d98d with SMTP id 5b1f17b1804b1-43f2f0c349amr18244775e9.15.1744277705059;
        Thu, 10 Apr 2025 02:35:05 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:7c4f:f9d1:94e0:53f8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f206264a1sm49698435e9.9.2025.04.10.02.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 02:35:04 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 10 Apr 2025 11:34:46 +0200
Subject: [PATCH 4/6] pinctrl: qcom: spmi-mpp: use new GPIO line value
 setter callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-gpiochip-set-rv-pinctrl-qcom-v1-4-6a6891338aae@linaro.org>
References: <20250410-gpiochip-set-rv-pinctrl-qcom-v1-0-6a6891338aae@linaro.org>
In-Reply-To: <20250410-gpiochip-set-rv-pinctrl-qcom-v1-0-6a6891338aae@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1557;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=9gNF/FLINe1nNmHXmNH1kL01vFkFUIR6jrZxXCXKbZ0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn95DE5FqnvJL/um7huD4ErzXNAW7u8g/dlwnTw
 dLrHURMowCJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/eQxAAKCRARpy6gFHHX
 chTBEAC8mk8y+lhvKtCWUlvQJPn1B51EsVtS0ErSHQtK0p5t0NMlaF9XIIrqdvw4YymzXsR5/s2
 76727nalRQ1q/0JLios8Nu1JFo3h6YdLDLaTxULAjVLBr7LzCqOlBbyM5tp9Mjb6bSKPCEcsm5i
 gnouiHU6XyJurOVvtAlRG4iTYeFB4uOxdGLd8pkACDPYiLWIphPksFUTTSl/4Rx+y+bBLAKUrcG
 k4UgkWvWq8sz83McVXnvNBjhqNSTnawWDq4w1THUwBLoIaYDwzbP4iRayuf54LBRkCwWl06PU+d
 JcIJswT0zpWROJpfl6u9Yr/uNRwB5E44zj/dYaRqsgaY/dOlFVqJ1vGZWAm17kAuT6VJ3gD4XV8
 s5/e8nt0q0uMJUHQU1J1KYdssC7qbLCOlrjvFhqTiAw42xVCdOjgOiMbukQlIPw45W+SAvXuTKR
 FsLhnFNyTQBgxfUeHerTOhltmyLZULBwnfvnpeqB4iqYxTh1yuOqnvOgJFSSOltygjvrdithFll
 6fiTVuBWpVpjl6jEghdO67qqqL9dQWlGa1gDX3H4/ixZSOSMWyCIGHOCSXhHfLY1qmVcgri0xGs
 5ubxcdHDcPgTgd6dh7kQQZ6XCfJNUVbS33Tp17xiHrFFRuhY/CI4oHIYcZG94M277M6f7UZGjSe
 TrcNy1YdiTQT02g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-spmi-mpp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c b/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
index 7b28c5fb2402..ba9084978f90 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
@@ -600,14 +600,14 @@ static int pmic_mpp_get(struct gpio_chip *chip, unsigned pin)
 	return !!pad->out_value;
 }
 
-static void pmic_mpp_set(struct gpio_chip *chip, unsigned pin, int value)
+static int pmic_mpp_set(struct gpio_chip *chip, unsigned int pin, int value)
 {
 	struct pmic_mpp_state *state = gpiochip_get_data(chip);
 	unsigned long config;
 
 	config = pinconf_to_config_packed(PIN_CONFIG_OUTPUT, value);
 
-	pmic_mpp_config_set(state->ctrl, pin, &config, 1);
+	return pmic_mpp_config_set(state->ctrl, pin, &config, 1);
 }
 
 static int pmic_mpp_of_xlate(struct gpio_chip *chip,
@@ -638,7 +638,7 @@ static const struct gpio_chip pmic_mpp_gpio_template = {
 	.direction_input	= pmic_mpp_direction_input,
 	.direction_output	= pmic_mpp_direction_output,
 	.get			= pmic_mpp_get,
-	.set			= pmic_mpp_set,
+	.set_rv			= pmic_mpp_set,
 	.request		= gpiochip_generic_request,
 	.free			= gpiochip_generic_free,
 	.of_xlate		= pmic_mpp_of_xlate,

-- 
2.45.2


