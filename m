Return-Path: <linux-gpio+bounces-11000-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACAAA9938A7
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 22:59:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DF89EB22984
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 20:59:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C7D11DE3BE;
	Mon,  7 Oct 2024 20:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="kfxVBSoI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7D41D31A0
	for <linux-gpio@vger.kernel.org>; Mon,  7 Oct 2024 20:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728334735; cv=none; b=E76xBzzPAosV5BsX0JDleOGnKlOpxTb+v/j+Wbi8qYv26XbPwQJomlm+JJOgAxR20I3Pf8i2veJPXHgYK4VXkjDGwFGl6bLL+zJkU0FAeWF9leN+q59VITa70wDMyuLbdRG0c5hRDKyt5NwvYpdOv2IucJiBgnKq7ZKbRCstr4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728334735; c=relaxed/simple;
	bh=fouy9xjncwAz8lSRR1+Dtn63ztQyA86Os9ljGkQjq9U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=p86e3ORbK14pUNX2BXDQ8jM/m+wPAIhABTOCq1/oDIpPuXLvlm5Tswk1wLWK5Q+39tx21QrKiQoi86pp6pmjSGqTiiQqSgNu7QcCVQc0SaAUMubCVx6YHmaJYrSu2L7ZbmRcQReBEST+y7rCVr/2jMLP32/YixK9NbW1yCBbtCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=kfxVBSoI; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5c8844f0ccaso6726208a12.0
        for <linux-gpio@vger.kernel.org>; Mon, 07 Oct 2024 13:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1728334730; x=1728939530; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0j1MdMCHhbqa4p8KBI+85861zKuTgXxYVvnkYnmha34=;
        b=kfxVBSoI4aVOxULNOCejiEylSWOESo2JSWymE2Q8nBy/4C7Cz+lNU40fP62Fhm/ia3
         c3ks5CxXIP31e2tqAFb9HzcCtd7JqFp+/CM+OydDR9MuAmug5vPAcKrOfC3kjPcmHKiB
         gNGugz3B3vjROfIHoFWgCoJWekh74fA0ntrkGYGi3OuOWgtydAIcjgjOBjGl6l58kiK7
         4t1fWqye1kOuTYOL2TG8AFSlJBGuEFpaxrnoysEId8Dx2uRxJUkndaKKodAByV36CPSV
         plhytqUBOF/AAif87TJQhomOHyG6f4ZWL1udoK2ZTF/9eS7h5A6ZulErKeZtz1sVitJp
         otrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728334730; x=1728939530;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0j1MdMCHhbqa4p8KBI+85861zKuTgXxYVvnkYnmha34=;
        b=cNXIRZcr650ZdlzOTZD7WxmyzxUVe+MUDBCLluaTLv1JHw715FkZKetNIxloyXS9uK
         DMDvYwKbU/najQ9wmbsIT0DFLEdV/NGhzuAOa6JK5BAipG3+4BOdtSjEqX2qDAEWetOY
         XZDYToKiaQfb99xKNlNKpcI09VCE6soCDj0Y0B28qbgiZhOpo00c7upmpDlUU9HjAS+5
         TobAu7uyzy9nQfZVe1LmosfL/lv6+TwlztPH6+ruOADCc7UwY6ObnnBi3E84xEGdqM9s
         BB8Y2R7h3u6r3Sd9wXb52187r7vUaHCo+tTGs85nm9RHUm0MTXWE1qvoLEjqHsMmPBl1
         izXw==
X-Gm-Message-State: AOJu0Yys5WT5KRZT0483/yR1xWB/cfMPpfaptSKtCALhgylzVF3iOOJZ
	44ByHM/QjOqx2BQvRt0QkX8FsNcvo1PGIkEvHUeBbkr6QQ/BWW2AzzlrDBiOxTQ=
X-Google-Smtp-Source: AGHT+IFUMoSdQTHtLlRX8TISGFztzuCKdmXH7Z02GAJJyTKwChTkHNhoUsm+U3QGTLl59wNM74kuwg==
X-Received: by 2002:a05:6402:4006:b0:5c8:8e9b:17b3 with SMTP id 4fb4d7f45d1cf-5c8d2e989acmr10975676a12.31.1728334725755;
        Mon, 07 Oct 2024 13:58:45 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:492d:9548:aca1:239d])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c8e05f3c06sm3553418a12.91.2024.10.07.13.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 13:58:44 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [PATCH] pinctrl: Switch back to struct platform_driver::remove()
Date: Mon,  7 Oct 2024 22:58:05 +0200
Message-ID: <20241007205803.444994-8-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=44469; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=fouy9xjncwAz8lSRR1+Dtn63ztQyA86Os9ljGkQjq9U=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBnBEth54Z2whZyLXC/CVJmaQODdXGeaGEXmEwNf 1wL3uzTwGOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZwRLYQAKCRCPgPtYfRL+ TtSXB/4s2tuFMJ0G2W8m6XgJvyG1Q9MxntRKLMyW4GdzVfZaFnwkyH09QQAyPF6SMV+VOgLntn2 oV4SK86bRJYBqA6XH6HG5mzm3xofj9fQDbE149BmG48E0x+TlnD9SX9lBgsD1JblR5EfC53Wp/D aDfgk37qGlejCNGLvbV+GiKUx4vSRZaY/FkGlfV7QAQeB0uS3/CgpltQBiguo7dFPeN0zEvUF0G mmEWKOTVhvzoDmLuaee7Ljd1nr0X/zgKlq08LmEnB7OSp9Mo5Pg9KkCTEYEH5GmYv0IIlGM7Qbs QUPm7uGL+OzdcieNqp365iTEVkBHKBMhiB4cKHSVelVIe2WO
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
return void") .remove() is (again) the right callback to implement for
platform drivers.

Convert all platform drivers below drivers/pinctrl to use .remove(),
with the eventual goal to drop struct platform_driver::remove_new(). As
.remove() and .remove_new() have the same prototypes, conversion is done
by just changing the structure member name in the driver initializer.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

given the simplicity of the individual changes I do this all in a single
patch. I you don't agree, please tell and I will happily split it.

It's based on Friday's next, feel free to drop changes that result in a
conflict when you come around to apply this. I'll care for the fallout
at a later time then. (Having said that, if you use b4 am -3 and git am
-3, there should be hardly any conflict.)

Note I didn't Cc: all the individual driver maintainers to not trigger
sending limits and spam filters.

Best regards
Uwe

 drivers/pinctrl/cirrus/pinctrl-madera-core.c      | 2 +-
 drivers/pinctrl/intel/pinctrl-cherryview.c        | 2 +-
 drivers/pinctrl/nomadik/pinctrl-abx500.c          | 2 +-
 drivers/pinctrl/pinctrl-amd.c                     | 2 +-
 drivers/pinctrl/pinctrl-artpec6.c                 | 2 +-
 drivers/pinctrl/pinctrl-rockchip.c                | 2 +-
 drivers/pinctrl/pinctrl-single.c                  | 2 +-
 drivers/pinctrl/pinctrl-stmfx.c                   | 2 +-
 drivers/pinctrl/pinctrl-tb10x.c                   | 2 +-
 drivers/pinctrl/qcom/pinctrl-apq8064.c            | 2 +-
 drivers/pinctrl/qcom/pinctrl-apq8084.c            | 2 +-
 drivers/pinctrl/qcom/pinctrl-ipq4019.c            | 2 +-
 drivers/pinctrl/qcom/pinctrl-ipq5018.c            | 2 +-
 drivers/pinctrl/qcom/pinctrl-ipq5332.c            | 2 +-
 drivers/pinctrl/qcom/pinctrl-ipq6018.c            | 2 +-
 drivers/pinctrl/qcom/pinctrl-ipq8064.c            | 2 +-
 drivers/pinctrl/qcom/pinctrl-ipq8074.c            | 2 +-
 drivers/pinctrl/qcom/pinctrl-ipq9574.c            | 2 +-
 drivers/pinctrl/qcom/pinctrl-mdm9607.c            | 2 +-
 drivers/pinctrl/qcom/pinctrl-mdm9615.c            | 2 +-
 drivers/pinctrl/qcom/pinctrl-msm8226.c            | 2 +-
 drivers/pinctrl/qcom/pinctrl-msm8660.c            | 2 +-
 drivers/pinctrl/qcom/pinctrl-msm8909.c            | 2 +-
 drivers/pinctrl/qcom/pinctrl-msm8916.c            | 2 +-
 drivers/pinctrl/qcom/pinctrl-msm8953.c            | 2 +-
 drivers/pinctrl/qcom/pinctrl-msm8960.c            | 2 +-
 drivers/pinctrl/qcom/pinctrl-msm8976.c            | 2 +-
 drivers/pinctrl/qcom/pinctrl-msm8994.c            | 2 +-
 drivers/pinctrl/qcom/pinctrl-msm8996.c            | 2 +-
 drivers/pinctrl/qcom/pinctrl-msm8998.c            | 2 +-
 drivers/pinctrl/qcom/pinctrl-msm8x74.c            | 2 +-
 drivers/pinctrl/qcom/pinctrl-qcm2290.c            | 2 +-
 drivers/pinctrl/qcom/pinctrl-qcs404.c             | 2 +-
 drivers/pinctrl/qcom/pinctrl-qcs615.c             | 2 +-
 drivers/pinctrl/qcom/pinctrl-qdf2xxx.c            | 2 +-
 drivers/pinctrl/qcom/pinctrl-qdu1000.c            | 2 +-
 drivers/pinctrl/qcom/pinctrl-sa8775p.c            | 2 +-
 drivers/pinctrl/qcom/pinctrl-sc7180.c             | 2 +-
 drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c   | 2 +-
 drivers/pinctrl/qcom/pinctrl-sc7280.c             | 2 +-
 drivers/pinctrl/qcom/pinctrl-sc8180x.c            | 2 +-
 drivers/pinctrl/qcom/pinctrl-sc8280xp-lpass-lpi.c | 2 +-
 drivers/pinctrl/qcom/pinctrl-sc8280xp.c           | 2 +-
 drivers/pinctrl/qcom/pinctrl-sdm660.c             | 2 +-
 drivers/pinctrl/qcom/pinctrl-sdm670.c             | 2 +-
 drivers/pinctrl/qcom/pinctrl-sdm845.c             | 2 +-
 drivers/pinctrl/qcom/pinctrl-sdx55.c              | 2 +-
 drivers/pinctrl/qcom/pinctrl-sdx65.c              | 2 +-
 drivers/pinctrl/qcom/pinctrl-sdx75.c              | 2 +-
 drivers/pinctrl/qcom/pinctrl-sm4250-lpass-lpi.c   | 2 +-
 drivers/pinctrl/qcom/pinctrl-sm4450.c             | 2 +-
 drivers/pinctrl/qcom/pinctrl-sm6115-lpass-lpi.c   | 2 +-
 drivers/pinctrl/qcom/pinctrl-sm6115.c             | 2 +-
 drivers/pinctrl/qcom/pinctrl-sm6125.c             | 2 +-
 drivers/pinctrl/qcom/pinctrl-sm6350.c             | 2 +-
 drivers/pinctrl/qcom/pinctrl-sm6375.c             | 2 +-
 drivers/pinctrl/qcom/pinctrl-sm7150.c             | 2 +-
 drivers/pinctrl/qcom/pinctrl-sm8150.c             | 2 +-
 drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c   | 2 +-
 drivers/pinctrl/qcom/pinctrl-sm8250.c             | 2 +-
 drivers/pinctrl/qcom/pinctrl-sm8350-lpass-lpi.c   | 2 +-
 drivers/pinctrl/qcom/pinctrl-sm8350.c             | 2 +-
 drivers/pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c   | 2 +-
 drivers/pinctrl/qcom/pinctrl-sm8450.c             | 2 +-
 drivers/pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c   | 2 +-
 drivers/pinctrl/qcom/pinctrl-sm8550.c             | 2 +-
 drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c   | 2 +-
 drivers/pinctrl/qcom/pinctrl-sm8650.c             | 2 +-
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c          | 2 +-
 drivers/pinctrl/qcom/pinctrl-spmi-mpp.c           | 2 +-
 drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c          | 2 +-
 drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c           | 2 +-
 drivers/pinctrl/qcom/pinctrl-x1e80100.c           | 2 +-
 drivers/pinctrl/renesas/pinctrl-rzn1.c            | 2 +-
 drivers/pinctrl/sprd/pinctrl-sprd-sc9860.c        | 2 +-
 75 files changed, 75 insertions(+), 75 deletions(-)

diff --git a/drivers/pinctrl/cirrus/pinctrl-madera-core.c b/drivers/pinctrl/cirrus/pinctrl-madera-core.c
index 2932d7aba725..73ec5b9beb49 100644
--- a/drivers/pinctrl/cirrus/pinctrl-madera-core.c
+++ b/drivers/pinctrl/cirrus/pinctrl-madera-core.c
@@ -1091,7 +1091,7 @@ static void madera_pin_remove(struct platform_device *pdev)
 
 static struct platform_driver madera_pin_driver = {
 	.probe = madera_pin_probe,
-	.remove_new = madera_pin_remove,
+	.remove = madera_pin_remove,
 	.driver = {
 		.name = "madera-pinctrl",
 	},
diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
index 067b0d344f0e..9f938718927b 100644
--- a/drivers/pinctrl/intel/pinctrl-cherryview.c
+++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
@@ -1792,7 +1792,7 @@ MODULE_DEVICE_TABLE(acpi, chv_pinctrl_acpi_match);
 
 static struct platform_driver chv_pinctrl_driver = {
 	.probe = chv_pinctrl_probe,
-	.remove_new = chv_pinctrl_remove,
+	.remove = chv_pinctrl_remove,
 	.driver = {
 		.name = "cherryview-pinctrl",
 		.pm = pm_sleep_ptr(&chv_pinctrl_pm_ops),
diff --git a/drivers/pinctrl/nomadik/pinctrl-abx500.c b/drivers/pinctrl/nomadik/pinctrl-abx500.c
index 68750b6f8e57..4ce2e35a6373 100644
--- a/drivers/pinctrl/nomadik/pinctrl-abx500.c
+++ b/drivers/pinctrl/nomadik/pinctrl-abx500.c
@@ -1089,7 +1089,7 @@ static struct platform_driver abx500_gpio_driver = {
 		.of_match_table = abx500_gpio_match,
 	},
 	.probe = abx500_gpio_probe,
-	.remove_new = abx500_gpio_remove,
+	.remove = abx500_gpio_remove,
 };
 
 static int __init abx500_gpio_init(void)
diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index 7f66ec73199a..b0fab262d534 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -1204,7 +1204,7 @@ static struct platform_driver amd_gpio_driver = {
 #endif
 	},
 	.probe		= amd_gpio_probe,
-	.remove_new	= amd_gpio_remove,
+	.remove		= amd_gpio_remove,
 };
 
 module_platform_driver(amd_gpio_driver);
diff --git a/drivers/pinctrl/pinctrl-artpec6.c b/drivers/pinctrl/pinctrl-artpec6.c
index dd93f124e0a0..717f9592b28b 100644
--- a/drivers/pinctrl/pinctrl-artpec6.c
+++ b/drivers/pinctrl/pinctrl-artpec6.c
@@ -988,7 +988,7 @@ static struct platform_driver artpec6_pmx_driver = {
 		.of_match_table = artpec6_pinctrl_match,
 	},
 	.probe = artpec6_pmx_probe,
-	.remove_new = artpec6_pmx_remove,
+	.remove = artpec6_pmx_remove,
 };
 
 static int __init artpec6_pmx_init(void)
diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 04e85a6037c9..36d4eaf0ebd1 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -4221,7 +4221,7 @@ static const struct of_device_id rockchip_pinctrl_dt_match[] = {
 
 static struct platform_driver rockchip_pinctrl_driver = {
 	.probe		= rockchip_pinctrl_probe,
-	.remove_new	= rockchip_pinctrl_remove,
+	.remove		= rockchip_pinctrl_remove,
 	.driver = {
 		.name	= "rockchip-pinctrl",
 		.pm = &rockchip_pinctrl_dev_pm_ops,
diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index 2ec599e383e4..8addb08d81a1 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -1981,7 +1981,7 @@ MODULE_DEVICE_TABLE(of, pcs_of_match);
 
 static struct platform_driver pcs_driver = {
 	.probe		= pcs_probe,
-	.remove_new	= pcs_remove,
+	.remove		= pcs_remove,
 	.driver = {
 		.name		= DRIVER_NAME,
 		.of_match_table	= pcs_of_match,
diff --git a/drivers/pinctrl/pinctrl-stmfx.c b/drivers/pinctrl/pinctrl-stmfx.c
index d2c5321dd025..bfeb2edbeec5 100644
--- a/drivers/pinctrl/pinctrl-stmfx.c
+++ b/drivers/pinctrl/pinctrl-stmfx.c
@@ -855,7 +855,7 @@ static struct platform_driver stmfx_pinctrl_driver = {
 		.pm = &stmfx_pinctrl_dev_pm_ops,
 	},
 	.probe = stmfx_pinctrl_probe,
-	.remove_new = stmfx_pinctrl_remove,
+	.remove = stmfx_pinctrl_remove,
 };
 module_platform_driver(stmfx_pinctrl_driver);
 
diff --git a/drivers/pinctrl/pinctrl-tb10x.c b/drivers/pinctrl/pinctrl-tb10x.c
index 4f98f72565f4..d6bb8f58978d 100644
--- a/drivers/pinctrl/pinctrl-tb10x.c
+++ b/drivers/pinctrl/pinctrl-tb10x.c
@@ -820,7 +820,7 @@ MODULE_DEVICE_TABLE(of, tb10x_pinctrl_dt_ids);
 
 static struct platform_driver tb10x_pinctrl_pdrv = {
 	.probe   = tb10x_pinctrl_probe,
-	.remove_new = tb10x_pinctrl_remove,
+	.remove  = tb10x_pinctrl_remove,
 	.driver  = {
 		.name  = "tb10x_pinctrl",
 		.of_match_table = of_match_ptr(tb10x_pinctrl_dt_ids),
diff --git a/drivers/pinctrl/qcom/pinctrl-apq8064.c b/drivers/pinctrl/qcom/pinctrl-apq8064.c
index a18df4162299..20c3b9025044 100644
--- a/drivers/pinctrl/qcom/pinctrl-apq8064.c
+++ b/drivers/pinctrl/qcom/pinctrl-apq8064.c
@@ -629,7 +629,7 @@ static struct platform_driver apq8064_pinctrl_driver = {
 		.of_match_table = apq8064_pinctrl_of_match,
 	},
 	.probe = apq8064_pinctrl_probe,
-	.remove_new = msm_pinctrl_remove,
+	.remove = msm_pinctrl_remove,
 };
 
 static int __init apq8064_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-apq8084.c b/drivers/pinctrl/qcom/pinctrl-apq8084.c
index afada80e52a2..3fc0a40762b6 100644
--- a/drivers/pinctrl/qcom/pinctrl-apq8084.c
+++ b/drivers/pinctrl/qcom/pinctrl-apq8084.c
@@ -1207,7 +1207,7 @@ static struct platform_driver apq8084_pinctrl_driver = {
 		.of_match_table = apq8084_pinctrl_of_match,
 	},
 	.probe = apq8084_pinctrl_probe,
-	.remove_new = msm_pinctrl_remove,
+	.remove = msm_pinctrl_remove,
 };
 
 static int __init apq8084_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-ipq4019.c b/drivers/pinctrl/qcom/pinctrl-ipq4019.c
index cb13576ad6cf..1f7944dd829d 100644
--- a/drivers/pinctrl/qcom/pinctrl-ipq4019.c
+++ b/drivers/pinctrl/qcom/pinctrl-ipq4019.c
@@ -710,7 +710,7 @@ static struct platform_driver ipq4019_pinctrl_driver = {
 		.of_match_table = ipq4019_pinctrl_of_match,
 	},
 	.probe = ipq4019_pinctrl_probe,
-	.remove_new = msm_pinctrl_remove,
+	.remove = msm_pinctrl_remove,
 };
 
 static int __init ipq4019_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-ipq5018.c b/drivers/pinctrl/qcom/pinctrl-ipq5018.c
index 68f65b57003e..e2951f81c3ee 100644
--- a/drivers/pinctrl/qcom/pinctrl-ipq5018.c
+++ b/drivers/pinctrl/qcom/pinctrl-ipq5018.c
@@ -754,7 +754,7 @@ static struct platform_driver ipq5018_pinctrl_driver = {
 		.of_match_table = ipq5018_pinctrl_of_match,
 	},
 	.probe = ipq5018_pinctrl_probe,
-	.remove_new = msm_pinctrl_remove,
+	.remove = msm_pinctrl_remove,
 };
 
 static int __init ipq5018_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-ipq5332.c b/drivers/pinctrl/qcom/pinctrl-ipq5332.c
index 882175118970..625f8014051f 100644
--- a/drivers/pinctrl/qcom/pinctrl-ipq5332.c
+++ b/drivers/pinctrl/qcom/pinctrl-ipq5332.c
@@ -834,7 +834,7 @@ static struct platform_driver ipq5332_pinctrl_driver = {
 		.of_match_table = ipq5332_pinctrl_of_match,
 	},
 	.probe = ipq5332_pinctrl_probe,
-	.remove_new = msm_pinctrl_remove,
+	.remove = msm_pinctrl_remove,
 };
 
 static int __init ipq5332_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-ipq6018.c b/drivers/pinctrl/qcom/pinctrl-ipq6018.c
index ac330d8712b5..0ad08647dbcd 100644
--- a/drivers/pinctrl/qcom/pinctrl-ipq6018.c
+++ b/drivers/pinctrl/qcom/pinctrl-ipq6018.c
@@ -1080,7 +1080,7 @@ static struct platform_driver ipq6018_pinctrl_driver = {
 		.of_match_table = ipq6018_pinctrl_of_match,
 	},
 	.probe = ipq6018_pinctrl_probe,
-	.remove_new = msm_pinctrl_remove,
+	.remove = msm_pinctrl_remove,
 };
 
 static int __init ipq6018_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-ipq8064.c b/drivers/pinctrl/qcom/pinctrl-ipq8064.c
index e10e1bc4c911..e2bb94e86aef 100644
--- a/drivers/pinctrl/qcom/pinctrl-ipq8064.c
+++ b/drivers/pinctrl/qcom/pinctrl-ipq8064.c
@@ -631,7 +631,7 @@ static struct platform_driver ipq8064_pinctrl_driver = {
 		.of_match_table = ipq8064_pinctrl_of_match,
 	},
 	.probe = ipq8064_pinctrl_probe,
-	.remove_new = msm_pinctrl_remove,
+	.remove = msm_pinctrl_remove,
 };
 
 static int __init ipq8064_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-ipq8074.c b/drivers/pinctrl/qcom/pinctrl-ipq8074.c
index fee32c1d1d3e..337f3a1c92c1 100644
--- a/drivers/pinctrl/qcom/pinctrl-ipq8074.c
+++ b/drivers/pinctrl/qcom/pinctrl-ipq8074.c
@@ -1041,7 +1041,7 @@ static struct platform_driver ipq8074_pinctrl_driver = {
 		.of_match_table = ipq8074_pinctrl_of_match,
 	},
 	.probe = ipq8074_pinctrl_probe,
-	.remove_new = msm_pinctrl_remove,
+	.remove = msm_pinctrl_remove,
 };
 
 static int __init ipq8074_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-ipq9574.c b/drivers/pinctrl/qcom/pinctrl-ipq9574.c
index 20ab59cb621b..e2491617b236 100644
--- a/drivers/pinctrl/qcom/pinctrl-ipq9574.c
+++ b/drivers/pinctrl/qcom/pinctrl-ipq9574.c
@@ -799,7 +799,7 @@ static struct platform_driver ipq9574_pinctrl_driver = {
 		.of_match_table = ipq9574_pinctrl_of_match,
 	},
 	.probe = ipq9574_pinctrl_probe,
-	.remove_new = msm_pinctrl_remove,
+	.remove = msm_pinctrl_remove,
 };
 
 static int __init ipq9574_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-mdm9607.c b/drivers/pinctrl/qcom/pinctrl-mdm9607.c
index 415d24e16267..e7cd3ef1cf3e 100644
--- a/drivers/pinctrl/qcom/pinctrl-mdm9607.c
+++ b/drivers/pinctrl/qcom/pinctrl-mdm9607.c
@@ -1059,7 +1059,7 @@ static struct platform_driver mdm9607_pinctrl_driver = {
 		.of_match_table = mdm9607_pinctrl_of_match,
 	},
 	.probe = mdm9607_pinctrl_probe,
-	.remove_new = msm_pinctrl_remove,
+	.remove = msm_pinctrl_remove,
 };
 
 static int __init mdm9607_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-mdm9615.c b/drivers/pinctrl/qcom/pinctrl-mdm9615.c
index 3f2eafea0b24..0a2ae383d3d5 100644
--- a/drivers/pinctrl/qcom/pinctrl-mdm9615.c
+++ b/drivers/pinctrl/qcom/pinctrl-mdm9615.c
@@ -446,7 +446,7 @@ static struct platform_driver mdm9615_pinctrl_driver = {
 		.of_match_table = mdm9615_pinctrl_of_match,
 	},
 	.probe = mdm9615_pinctrl_probe,
-	.remove_new = msm_pinctrl_remove,
+	.remove = msm_pinctrl_remove,
 };
 
 static int __init mdm9615_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-msm8226.c b/drivers/pinctrl/qcom/pinctrl-msm8226.c
index 40806c0650ef..64fee70f1772 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm8226.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm8226.c
@@ -654,7 +654,7 @@ static struct platform_driver msm8226_pinctrl_driver = {
 		.of_match_table = msm8226_pinctrl_of_match,
 	},
 	.probe = msm8226_pinctrl_probe,
-	.remove_new = msm_pinctrl_remove,
+	.remove = msm_pinctrl_remove,
 };
 
 static int __init msm8226_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-msm8660.c b/drivers/pinctrl/qcom/pinctrl-msm8660.c
index dba6d531b4a1..999a5f867eb5 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm8660.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm8660.c
@@ -981,7 +981,7 @@ static struct platform_driver msm8660_pinctrl_driver = {
 		.of_match_table = msm8660_pinctrl_of_match,
 	},
 	.probe = msm8660_pinctrl_probe,
-	.remove_new = msm_pinctrl_remove,
+	.remove = msm_pinctrl_remove,
 };
 
 static int __init msm8660_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-msm8909.c b/drivers/pinctrl/qcom/pinctrl-msm8909.c
index 14b17ba9f906..756856d20d6b 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm8909.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm8909.c
@@ -929,7 +929,7 @@ static struct platform_driver msm8909_pinctrl_driver = {
 		.of_match_table = msm8909_pinctrl_of_match,
 	},
 	.probe = msm8909_pinctrl_probe,
-	.remove_new = msm_pinctrl_remove,
+	.remove = msm_pinctrl_remove,
 };
 
 static int __init msm8909_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-msm8916.c b/drivers/pinctrl/qcom/pinctrl-msm8916.c
index 184dcf842273..cea5c54f92fe 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm8916.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm8916.c
@@ -969,7 +969,7 @@ static struct platform_driver msm8916_pinctrl_driver = {
 		.of_match_table = msm8916_pinctrl_of_match,
 	},
 	.probe = msm8916_pinctrl_probe,
-	.remove_new = msm_pinctrl_remove,
+	.remove = msm_pinctrl_remove,
 };
 
 static int __init msm8916_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-msm8953.c b/drivers/pinctrl/qcom/pinctrl-msm8953.c
index c2253821ae8d..998351bdfee1 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm8953.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm8953.c
@@ -1816,7 +1816,7 @@ static struct platform_driver msm8953_pinctrl_driver = {
 		.of_match_table = msm8953_pinctrl_of_match,
 	},
 	.probe = msm8953_pinctrl_probe,
-	.remove_new = msm_pinctrl_remove,
+	.remove = msm_pinctrl_remove,
 };
 
 static int __init msm8953_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-msm8960.c b/drivers/pinctrl/qcom/pinctrl-msm8960.c
index 6b9148d226e9..ebe230b3b437 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm8960.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm8960.c
@@ -1246,7 +1246,7 @@ static struct platform_driver msm8960_pinctrl_driver = {
 		.of_match_table = msm8960_pinctrl_of_match,
 	},
 	.probe = msm8960_pinctrl_probe,
-	.remove_new = msm_pinctrl_remove,
+	.remove = msm_pinctrl_remove,
 };
 
 static int __init msm8960_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-msm8976.c b/drivers/pinctrl/qcom/pinctrl-msm8976.c
index 9a951888e8a1..c30d80e4e98c 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm8976.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm8976.c
@@ -1096,7 +1096,7 @@ static struct platform_driver msm8976_pinctrl_driver = {
 		.of_match_table = msm8976_pinctrl_of_match,
 	},
 	.probe = msm8976_pinctrl_probe,
-	.remove_new = msm_pinctrl_remove,
+	.remove = msm_pinctrl_remove,
 };
 
 static int __init msm8976_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-msm8994.c b/drivers/pinctrl/qcom/pinctrl-msm8994.c
index 1ed1dd32d6c7..b1a6759ab4a5 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm8994.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm8994.c
@@ -1343,7 +1343,7 @@ static struct platform_driver msm8994_pinctrl_driver = {
 		.of_match_table = msm8994_pinctrl_of_match,
 	},
 	.probe = msm8994_pinctrl_probe,
-	.remove_new = msm_pinctrl_remove,
+	.remove = msm_pinctrl_remove,
 };
 
 static int __init msm8994_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-msm8996.c b/drivers/pinctrl/qcom/pinctrl-msm8996.c
index 777c2a74036e..1b5d80eaab83 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm8996.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm8996.c
@@ -1920,7 +1920,7 @@ static struct platform_driver msm8996_pinctrl_driver = {
 		.of_match_table = msm8996_pinctrl_of_match,
 	},
 	.probe = msm8996_pinctrl_probe,
-	.remove_new = msm_pinctrl_remove,
+	.remove = msm_pinctrl_remove,
 };
 
 static int __init msm8996_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-msm8998.c b/drivers/pinctrl/qcom/pinctrl-msm8998.c
index 4aaf45e54f3a..b7cbf32b3125 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm8998.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm8998.c
@@ -1535,7 +1535,7 @@ static struct platform_driver msm8998_pinctrl_driver = {
 		.of_match_table = msm8998_pinctrl_of_match,
 	},
 	.probe = msm8998_pinctrl_probe,
-	.remove_new = msm_pinctrl_remove,
+	.remove = msm_pinctrl_remove,
 };
 
 static int __init msm8998_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-msm8x74.c b/drivers/pinctrl/qcom/pinctrl-msm8x74.c
index 750a8272ded7..238c83f6ec4f 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm8x74.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm8x74.c
@@ -1083,7 +1083,7 @@ static struct platform_driver msm8x74_pinctrl_driver = {
 		.of_match_table = msm8x74_pinctrl_of_match,
 	},
 	.probe = msm8x74_pinctrl_probe,
-	.remove_new = msm_pinctrl_remove,
+	.remove = msm_pinctrl_remove,
 };
 
 static int __init msm8x74_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-qcm2290.c b/drivers/pinctrl/qcom/pinctrl-qcm2290.c
index f5c1c427b44e..ba699eac9ee8 100644
--- a/drivers/pinctrl/qcom/pinctrl-qcm2290.c
+++ b/drivers/pinctrl/qcom/pinctrl-qcm2290.c
@@ -1113,7 +1113,7 @@ static struct platform_driver qcm2290_pinctrl_driver = {
 		.of_match_table = qcm2290_pinctrl_of_match,
 	},
 	.probe = qcm2290_pinctrl_probe,
-	.remove_new = msm_pinctrl_remove,
+	.remove = msm_pinctrl_remove,
 };
 
 static int __init qcm2290_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-qcs404.c b/drivers/pinctrl/qcom/pinctrl-qcs404.c
index 9a875b7dc998..ae7224012f8a 100644
--- a/drivers/pinctrl/qcom/pinctrl-qcs404.c
+++ b/drivers/pinctrl/qcom/pinctrl-qcs404.c
@@ -1644,7 +1644,7 @@ static struct platform_driver qcs404_pinctrl_driver = {
 		.of_match_table = qcs404_pinctrl_of_match,
 	},
 	.probe = qcs404_pinctrl_probe,
-	.remove_new = msm_pinctrl_remove,
+	.remove = msm_pinctrl_remove,
 };
 
 static int __init qcs404_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-qcs615.c b/drivers/pinctrl/qcom/pinctrl-qcs615.c
index 8380e22b2faa..23015b055f6a 100644
--- a/drivers/pinctrl/qcom/pinctrl-qcs615.c
+++ b/drivers/pinctrl/qcom/pinctrl-qcs615.c
@@ -1087,7 +1087,7 @@ static struct platform_driver qcs615_tlmm_driver = {
 		.of_match_table = qcs615_tlmm_of_match,
 	},
 	.probe = qcs615_tlmm_probe,
-	.remove_new = msm_pinctrl_remove,
+	.remove = msm_pinctrl_remove,
 };
 
 static int __init qcs615_tlmm_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-qdf2xxx.c b/drivers/pinctrl/qcom/pinctrl-qdf2xxx.c
index 4d2f6f495163..b5808fcfb13c 100644
--- a/drivers/pinctrl/qcom/pinctrl-qdf2xxx.c
+++ b/drivers/pinctrl/qcom/pinctrl-qdf2xxx.c
@@ -145,7 +145,7 @@ static struct platform_driver qdf2xxx_pinctrl_driver = {
 		.acpi_match_table = qdf2xxx_acpi_ids,
 	},
 	.probe = qdf2xxx_pinctrl_probe,
-	.remove_new = msm_pinctrl_remove,
+	.remove = msm_pinctrl_remove,
 };
 
 static int __init qdf2xxx_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-qdu1000.c b/drivers/pinctrl/qcom/pinctrl-qdu1000.c
index da4f940bc8d4..47bc529ef550 100644
--- a/drivers/pinctrl/qcom/pinctrl-qdu1000.c
+++ b/drivers/pinctrl/qcom/pinctrl-qdu1000.c
@@ -1248,7 +1248,7 @@ static struct platform_driver qdu1000_tlmm_driver = {
 		.of_match_table = qdu1000_tlmm_of_match,
 	},
 	.probe = qdu1000_tlmm_probe,
-	.remove_new = msm_pinctrl_remove,
+	.remove = msm_pinctrl_remove,
 };
 
 static int __init qdu1000_tlmm_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-sa8775p.c b/drivers/pinctrl/qcom/pinctrl-sa8775p.c
index 5459c0c681a2..8fdea25d8d67 100644
--- a/drivers/pinctrl/qcom/pinctrl-sa8775p.c
+++ b/drivers/pinctrl/qcom/pinctrl-sa8775p.c
@@ -1530,7 +1530,7 @@ static struct platform_driver sa8775p_pinctrl_driver = {
 		.of_match_table = sa8775p_pinctrl_of_match,
 	},
 	.probe = sa8775p_pinctrl_probe,
-	.remove_new = msm_pinctrl_remove,
+	.remove = msm_pinctrl_remove,
 };
 
 static int __init sa8775p_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-sc7180.c b/drivers/pinctrl/qcom/pinctrl-sc7180.c
index c27aaa599b91..6eb0c73791c0 100644
--- a/drivers/pinctrl/qcom/pinctrl-sc7180.c
+++ b/drivers/pinctrl/qcom/pinctrl-sc7180.c
@@ -1159,7 +1159,7 @@ static struct platform_driver sc7180_pinctrl_driver = {
 		.of_match_table = sc7180_pinctrl_of_match,
 	},
 	.probe = sc7180_pinctrl_probe,
-	.remove_new = msm_pinctrl_remove,
+	.remove = msm_pinctrl_remove,
 };
 
 static int __init sc7180_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
index 6bb39812e1d8..1161f0a91a00 100644
--- a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
@@ -142,7 +142,7 @@ static struct platform_driver lpi_pinctrl_driver = {
 		   .of_match_table = lpi_pinctrl_of_match,
 	},
 	.probe = lpi_pinctrl_probe,
-	.remove_new = lpi_pinctrl_remove,
+	.remove = lpi_pinctrl_remove,
 };
 
 module_platform_driver(lpi_pinctrl_driver);
diff --git a/drivers/pinctrl/qcom/pinctrl-sc7280.c b/drivers/pinctrl/qcom/pinctrl-sc7280.c
index c2db663e396e..0c10eeb60b55 100644
--- a/drivers/pinctrl/qcom/pinctrl-sc7280.c
+++ b/drivers/pinctrl/qcom/pinctrl-sc7280.c
@@ -1505,7 +1505,7 @@ static struct platform_driver sc7280_pinctrl_driver = {
 		.of_match_table = sc7280_pinctrl_of_match,
 	},
 	.probe = sc7280_pinctrl_probe,
-	.remove_new = msm_pinctrl_remove,
+	.remove = msm_pinctrl_remove,
 };
 
 static int __init sc7280_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-sc8180x.c b/drivers/pinctrl/qcom/pinctrl-sc8180x.c
index cfa7c8be9770..d6a79ad41a40 100644
--- a/drivers/pinctrl/qcom/pinctrl-sc8180x.c
+++ b/drivers/pinctrl/qcom/pinctrl-sc8180x.c
@@ -1720,7 +1720,7 @@ static struct platform_driver sc8180x_pinctrl_driver = {
 		.acpi_match_table = sc8180x_pinctrl_acpi_match,
 	},
 	.probe = sc8180x_pinctrl_probe,
-	.remove_new = msm_pinctrl_remove,
+	.remove = msm_pinctrl_remove,
 };
 
 static int __init sc8180x_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-sc8280xp-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sc8280xp-lpass-lpi.c
index c0369baf3398..0e839b6aaaf4 100644
--- a/drivers/pinctrl/qcom/pinctrl-sc8280xp-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sc8280xp-lpass-lpi.c
@@ -179,7 +179,7 @@ static struct platform_driver lpi_pinctrl_driver = {
 		   .of_match_table = lpi_pinctrl_of_match,
 	},
 	.probe = lpi_pinctrl_probe,
-	.remove_new = lpi_pinctrl_remove,
+	.remove = lpi_pinctrl_remove,
 };
 
 module_platform_driver(lpi_pinctrl_driver);
diff --git a/drivers/pinctrl/qcom/pinctrl-sc8280xp.c b/drivers/pinctrl/qcom/pinctrl-sc8280xp.c
index 4b1c49697698..96f4fb5a5d29 100644
--- a/drivers/pinctrl/qcom/pinctrl-sc8280xp.c
+++ b/drivers/pinctrl/qcom/pinctrl-sc8280xp.c
@@ -1926,7 +1926,7 @@ static struct platform_driver sc8280xp_pinctrl_driver = {
 		.of_match_table = sc8280xp_pinctrl_of_match,
 	},
 	.probe = sc8280xp_pinctrl_probe,
-	.remove_new = msm_pinctrl_remove,
+	.remove = msm_pinctrl_remove,
 };
 
 static int __init sc8280xp_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-sdm660.c b/drivers/pinctrl/qcom/pinctrl-sdm660.c
index b93837c00954..907e4ffca5e7 100644
--- a/drivers/pinctrl/qcom/pinctrl-sdm660.c
+++ b/drivers/pinctrl/qcom/pinctrl-sdm660.c
@@ -1442,7 +1442,7 @@ static struct platform_driver sdm660_pinctrl_driver = {
 		.of_match_table = sdm660_pinctrl_of_match,
 	},
 	.probe = sdm660_pinctrl_probe,
-	.remove_new = msm_pinctrl_remove,
+	.remove = msm_pinctrl_remove,
 };
 
 static int __init sdm660_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-sdm670.c b/drivers/pinctrl/qcom/pinctrl-sdm670.c
index 894c042cb524..c76183ba95e1 100644
--- a/drivers/pinctrl/qcom/pinctrl-sdm670.c
+++ b/drivers/pinctrl/qcom/pinctrl-sdm670.c
@@ -1337,7 +1337,7 @@ static struct platform_driver sdm670_pinctrl_driver = {
 		.of_match_table = sdm670_pinctrl_of_match,
 	},
 	.probe = sdm670_pinctrl_probe,
-	.remove_new = msm_pinctrl_remove,
+	.remove = msm_pinctrl_remove,
 };
 
 static int __init sdm670_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-sdm845.c b/drivers/pinctrl/qcom/pinctrl-sdm845.c
index 3f3265e0018d..cc05c415ed15 100644
--- a/drivers/pinctrl/qcom/pinctrl-sdm845.c
+++ b/drivers/pinctrl/qcom/pinctrl-sdm845.c
@@ -1351,7 +1351,7 @@ static struct platform_driver sdm845_pinctrl_driver = {
 		.acpi_match_table = ACPI_PTR(sdm845_pinctrl_acpi_match),
 	},
 	.probe = sdm845_pinctrl_probe,
-	.remove_new = msm_pinctrl_remove,
+	.remove = msm_pinctrl_remove,
 };
 
 static int __init sdm845_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-sdx55.c b/drivers/pinctrl/qcom/pinctrl-sdx55.c
index c88b8bfcacb6..8826db9d21d0 100644
--- a/drivers/pinctrl/qcom/pinctrl-sdx55.c
+++ b/drivers/pinctrl/qcom/pinctrl-sdx55.c
@@ -990,7 +990,7 @@ static struct platform_driver sdx55_pinctrl_driver = {
 		.of_match_table = sdx55_pinctrl_of_match,
 	},
 	.probe = sdx55_pinctrl_probe,
-	.remove_new = msm_pinctrl_remove,
+	.remove = msm_pinctrl_remove,
 };
 
 static int __init sdx55_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-sdx65.c b/drivers/pinctrl/qcom/pinctrl-sdx65.c
index bd44ec0fcab4..f6f319c997fc 100644
--- a/drivers/pinctrl/qcom/pinctrl-sdx65.c
+++ b/drivers/pinctrl/qcom/pinctrl-sdx65.c
@@ -939,7 +939,7 @@ static struct platform_driver sdx65_pinctrl_driver = {
 		.of_match_table = sdx65_pinctrl_of_match,
 	},
 	.probe = sdx65_pinctrl_probe,
-	.remove_new = msm_pinctrl_remove,
+	.remove = msm_pinctrl_remove,
 };
 
 static int __init sdx65_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-sdx75.c b/drivers/pinctrl/qcom/pinctrl-sdx75.c
index 396f6fc779a2..3cfe8c7f04df 100644
--- a/drivers/pinctrl/qcom/pinctrl-sdx75.c
+++ b/drivers/pinctrl/qcom/pinctrl-sdx75.c
@@ -1124,7 +1124,7 @@ static struct platform_driver sdx75_pinctrl_driver = {
 		.of_match_table = sdx75_pinctrl_of_match,
 	},
 	.probe = sdx75_pinctrl_probe,
-	.remove_new = msm_pinctrl_remove,
+	.remove = msm_pinctrl_remove,
 };
 
 static int __init sdx75_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-sm4250-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sm4250-lpass-lpi.c
index 2d2c636a3e20..c0e178be9cfc 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm4250-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm4250-lpass-lpi.c
@@ -227,7 +227,7 @@ static struct platform_driver lpi_pinctrl_driver = {
 		.of_match_table = lpi_pinctrl_of_match,
 	},
 	.probe = lpi_pinctrl_probe,
-	.remove_new = lpi_pinctrl_remove,
+	.remove = lpi_pinctrl_remove,
 };
 
 module_platform_driver(lpi_pinctrl_driver);
diff --git a/drivers/pinctrl/qcom/pinctrl-sm4450.c b/drivers/pinctrl/qcom/pinctrl-sm4450.c
index 27317b86d835..622f20e6f6f8 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm4450.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm4450.c
@@ -994,7 +994,7 @@ static struct platform_driver sm4450_tlmm_driver = {
 		.of_match_table = sm4450_tlmm_of_match,
 	},
 	.probe = sm4450_tlmm_probe,
-	.remove_new = msm_pinctrl_remove,
+	.remove = msm_pinctrl_remove,
 };
 MODULE_DEVICE_TABLE(of, sm4450_tlmm_of_match);
 
diff --git a/drivers/pinctrl/qcom/pinctrl-sm6115-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sm6115-lpass-lpi.c
index 316d6fc69131..b7d9186861a2 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm6115-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm6115-lpass-lpi.c
@@ -147,7 +147,7 @@ static struct platform_driver lpi_pinctrl_driver = {
 		.of_match_table = lpi_pinctrl_of_match,
 	},
 	.probe = lpi_pinctrl_probe,
-	.remove_new = lpi_pinctrl_remove,
+	.remove = lpi_pinctrl_remove,
 };
 
 module_platform_driver(lpi_pinctrl_driver);
diff --git a/drivers/pinctrl/qcom/pinctrl-sm6115.c b/drivers/pinctrl/qcom/pinctrl-sm6115.c
index 7ce04144b6ed..4e91c75ad952 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm6115.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm6115.c
@@ -907,7 +907,7 @@ static struct platform_driver sm6115_tlmm_driver = {
 		.of_match_table = sm6115_tlmm_of_match,
 	},
 	.probe = sm6115_tlmm_probe,
-	.remove_new = msm_pinctrl_remove,
+	.remove = msm_pinctrl_remove,
 };
 
 static int __init sm6115_tlmm_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-sm6125.c b/drivers/pinctrl/qcom/pinctrl-sm6125.c
index 65de34c30759..c188842047aa 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm6125.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm6125.c
@@ -1266,7 +1266,7 @@ static struct platform_driver sm6125_tlmm_driver = {
 		.of_match_table = sm6125_tlmm_of_match,
 	},
 	.probe = sm6125_tlmm_probe,
-	.remove_new = msm_pinctrl_remove,
+	.remove = msm_pinctrl_remove,
 };
 
 static int __init sm6125_tlmm_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-sm6350.c b/drivers/pinctrl/qcom/pinctrl-sm6350.c
index 4aeb1ba43ee3..f3828c07b134 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm6350.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm6350.c
@@ -1373,7 +1373,7 @@ static struct platform_driver sm6350_tlmm_driver = {
 		.of_match_table = sm6350_tlmm_of_match,
 	},
 	.probe = sm6350_tlmm_probe,
-	.remove_new = msm_pinctrl_remove,
+	.remove = msm_pinctrl_remove,
 };
 
 static int __init sm6350_tlmm_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-sm6375.c b/drivers/pinctrl/qcom/pinctrl-sm6375.c
index d86630d7125c..c82c8516932e 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm6375.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm6375.c
@@ -1516,7 +1516,7 @@ static struct platform_driver sm6375_tlmm_driver = {
 		.of_match_table = sm6375_tlmm_of_match,
 	},
 	.probe = sm6375_tlmm_probe,
-	.remove_new = msm_pinctrl_remove,
+	.remove = msm_pinctrl_remove,
 };
 
 static int __init sm6375_tlmm_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-sm7150.c b/drivers/pinctrl/qcom/pinctrl-sm7150.c
index 095a1ca75849..3c7fd8af6635 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm7150.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm7150.c
@@ -1255,7 +1255,7 @@ static struct platform_driver sm7150_tlmm_driver = {
 		.of_match_table = sm7150_tlmm_of_match,
 	},
 	.probe = sm7150_tlmm_probe,
-	.remove_new = msm_pinctrl_remove,
+	.remove = msm_pinctrl_remove,
 };
 
 static int __init sm7150_tlmm_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-sm8150.c b/drivers/pinctrl/qcom/pinctrl-sm8150.c
index f8f5bee74f1d..01aea9c70b7a 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8150.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8150.c
@@ -1542,7 +1542,7 @@ static struct platform_driver sm8150_pinctrl_driver = {
 		.of_match_table = sm8150_pinctrl_of_match,
 	},
 	.probe = sm8150_pinctrl_probe,
-	.remove_new = msm_pinctrl_remove,
+	.remove = msm_pinctrl_remove,
 };
 
 static int __init sm8150_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c
index 9791d9ba5087..64494a86490e 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c
@@ -140,7 +140,7 @@ static struct platform_driver lpi_pinctrl_driver = {
 		   .of_match_table = lpi_pinctrl_of_match,
 	},
 	.probe = lpi_pinctrl_probe,
-	.remove_new = lpi_pinctrl_remove,
+	.remove = lpi_pinctrl_remove,
 };
 
 module_platform_driver(lpi_pinctrl_driver);
diff --git a/drivers/pinctrl/qcom/pinctrl-sm8250.c b/drivers/pinctrl/qcom/pinctrl-sm8250.c
index 54fda77bf296..e9961a49ff98 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8250.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8250.c
@@ -1351,7 +1351,7 @@ static struct platform_driver sm8250_pinctrl_driver = {
 		.of_match_table = sm8250_pinctrl_of_match,
 	},
 	.probe = sm8250_pinctrl_probe,
-	.remove_new = msm_pinctrl_remove,
+	.remove = msm_pinctrl_remove,
 };
 
 static int __init sm8250_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-sm8350-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sm8350-lpass-lpi.c
index 5b9a2cb216bd..7b146b4acfdf 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8350-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8350-lpass-lpi.c
@@ -142,7 +142,7 @@ static struct platform_driver lpi_pinctrl_driver = {
 		   .of_match_table = lpi_pinctrl_of_match,
 	},
 	.probe = lpi_pinctrl_probe,
-	.remove_new = lpi_pinctrl_remove,
+	.remove = lpi_pinctrl_remove,
 };
 module_platform_driver(lpi_pinctrl_driver);
 
diff --git a/drivers/pinctrl/qcom/pinctrl-sm8350.c b/drivers/pinctrl/qcom/pinctrl-sm8350.c
index ac7f2820f2cb..9c69458bd910 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8350.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8350.c
@@ -1642,7 +1642,7 @@ static struct platform_driver sm8350_tlmm_driver = {
 		.of_match_table = sm8350_tlmm_of_match,
 	},
 	.probe = sm8350_tlmm_probe,
-	.remove_new = msm_pinctrl_remove,
+	.remove = msm_pinctrl_remove,
 };
 
 static int __init sm8350_tlmm_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c
index a028cbb49947..439f6541622e 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c
@@ -208,7 +208,7 @@ static struct platform_driver lpi_pinctrl_driver = {
 		   .of_match_table = lpi_pinctrl_of_match,
 	},
 	.probe = lpi_pinctrl_probe,
-	.remove_new = lpi_pinctrl_remove,
+	.remove = lpi_pinctrl_remove,
 };
 
 module_platform_driver(lpi_pinctrl_driver);
diff --git a/drivers/pinctrl/qcom/pinctrl-sm8450.c b/drivers/pinctrl/qcom/pinctrl-sm8450.c
index 617286711695..d11bb1ee9e3d 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8450.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8450.c
@@ -1677,7 +1677,7 @@ static struct platform_driver sm8450_tlmm_driver = {
 		.of_match_table = sm8450_tlmm_of_match,
 	},
 	.probe = sm8450_tlmm_probe,
-	.remove_new = msm_pinctrl_remove,
+	.remove = msm_pinctrl_remove,
 };
 
 static int __init sm8450_tlmm_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c
index 852192b044e1..73065919c8c2 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c
@@ -216,7 +216,7 @@ static struct platform_driver lpi_pinctrl_driver = {
 		   .of_match_table = lpi_pinctrl_of_match,
 	},
 	.probe = lpi_pinctrl_probe,
-	.remove_new = lpi_pinctrl_remove,
+	.remove = lpi_pinctrl_remove,
 };
 
 module_platform_driver(lpi_pinctrl_driver);
diff --git a/drivers/pinctrl/qcom/pinctrl-sm8550.c b/drivers/pinctrl/qcom/pinctrl-sm8550.c
index 9184e0183755..3c847d9cb5d9 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8550.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8550.c
@@ -1762,7 +1762,7 @@ static struct platform_driver sm8550_tlmm_driver = {
 		.of_match_table = sm8550_tlmm_of_match,
 	},
 	.probe = sm8550_tlmm_probe,
-	.remove_new = msm_pinctrl_remove,
+	.remove = msm_pinctrl_remove,
 };
 
 static int __init sm8550_tlmm_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c
index 04400c832327..f9fcedf5a65d 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c
@@ -223,7 +223,7 @@ static struct platform_driver lpi_pinctrl_driver = {
 		   .of_match_table = lpi_pinctrl_of_match,
 	},
 	.probe = lpi_pinctrl_probe,
-	.remove_new = lpi_pinctrl_remove,
+	.remove = lpi_pinctrl_remove,
 };
 
 module_platform_driver(lpi_pinctrl_driver);
diff --git a/drivers/pinctrl/qcom/pinctrl-sm8650.c b/drivers/pinctrl/qcom/pinctrl-sm8650.c
index adaddd728662..104708252d12 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8650.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8650.c
@@ -1742,7 +1742,7 @@ static struct platform_driver sm8650_tlmm_driver = {
 		.of_match_table = sm8650_tlmm_of_match,
 	},
 	.probe = sm8650_tlmm_probe,
-	.remove_new = msm_pinctrl_remove,
+	.remove = msm_pinctrl_remove,
 };
 
 static int __init sm8650_tlmm_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index d2dd66769aa8..c33af2d66778 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -1268,7 +1268,7 @@ static struct platform_driver pmic_gpio_driver = {
 		   .of_match_table = pmic_gpio_of_match,
 	},
 	.probe	= pmic_gpio_probe,
-	.remove_new = pmic_gpio_remove,
+	.remove = pmic_gpio_remove,
 };
 
 module_platform_driver(pmic_gpio_driver);
diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c b/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
index d16ece90d926..b5b3ac82f030 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
@@ -1000,7 +1000,7 @@ static struct platform_driver pmic_mpp_driver = {
 		   .of_match_table = pmic_mpp_of_match,
 	},
 	.probe	= pmic_mpp_probe,
-	.remove_new = pmic_mpp_remove,
+	.remove = pmic_mpp_remove,
 };
 
 module_platform_driver(pmic_mpp_driver);
diff --git a/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c b/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
index 9cd5247ea574..b750ff4db4c3 100644
--- a/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
@@ -866,7 +866,7 @@ static struct platform_driver pm8xxx_gpio_driver = {
 		.of_match_table = pm8xxx_gpio_of_match,
 	},
 	.probe = pm8xxx_gpio_probe,
-	.remove_new = pm8xxx_gpio_remove,
+	.remove = pm8xxx_gpio_remove,
 };
 
 module_platform_driver(pm8xxx_gpio_driver);
diff --git a/drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c b/drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c
index 3aee6835a2de..9b1039c08aa6 100644
--- a/drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c
+++ b/drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c
@@ -949,7 +949,7 @@ static struct platform_driver pm8xxx_mpp_driver = {
 		.of_match_table = pm8xxx_mpp_of_match,
 	},
 	.probe = pm8xxx_mpp_probe,
-	.remove_new = pm8xxx_mpp_remove,
+	.remove = pm8xxx_mpp_remove,
 };
 
 module_platform_driver(pm8xxx_mpp_driver);
diff --git a/drivers/pinctrl/qcom/pinctrl-x1e80100.c b/drivers/pinctrl/qcom/pinctrl-x1e80100.c
index abfcdd3da9e8..419cb8facb2f 100644
--- a/drivers/pinctrl/qcom/pinctrl-x1e80100.c
+++ b/drivers/pinctrl/qcom/pinctrl-x1e80100.c
@@ -1861,7 +1861,7 @@ static struct platform_driver x1e80100_pinctrl_driver = {
 		.of_match_table = x1e80100_pinctrl_of_match,
 	},
 	.probe = x1e80100_pinctrl_probe,
-	.remove_new = msm_pinctrl_remove,
+	.remove = msm_pinctrl_remove,
 };
 
 static int __init x1e80100_pinctrl_init(void)
diff --git a/drivers/pinctrl/renesas/pinctrl-rzn1.c b/drivers/pinctrl/renesas/pinctrl-rzn1.c
index 39af1fe79c84..d442d4f9981c 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzn1.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzn1.c
@@ -925,7 +925,7 @@ MODULE_DEVICE_TABLE(of, rzn1_pinctrl_match);
 
 static struct platform_driver rzn1_pinctrl_driver = {
 	.probe	= rzn1_pinctrl_probe,
-	.remove_new = rzn1_pinctrl_remove,
+	.remove = rzn1_pinctrl_remove,
 	.driver	= {
 		.name		= "rzn1-pinctrl",
 		.of_match_table	= rzn1_pinctrl_match,
diff --git a/drivers/pinctrl/sprd/pinctrl-sprd-sc9860.c b/drivers/pinctrl/sprd/pinctrl-sprd-sc9860.c
index 9c3c39dc6550..d14f382f2392 100644
--- a/drivers/pinctrl/sprd/pinctrl-sprd-sc9860.c
+++ b/drivers/pinctrl/sprd/pinctrl-sprd-sc9860.c
@@ -943,7 +943,7 @@ static struct platform_driver sprd_pinctrl_driver = {
 		.of_match_table = sprd_pinctrl_of_match,
 	},
 	.probe = sprd_pinctrl_probe,
-	.remove_new = sprd_pinctrl_remove,
+	.remove = sprd_pinctrl_remove,
 	.shutdown = sprd_pinctrl_shutdown,
 };
 module_platform_driver(sprd_pinctrl_driver);

base-commit: 58ca61c1a866bfdaa5e19fb19a2416764f847d75
-- 
2.45.2


