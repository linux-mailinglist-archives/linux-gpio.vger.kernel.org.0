Return-Path: <linux-gpio+bounces-18286-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9D0A7D55E
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 09:19:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E3D63BB323
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 07:16:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6269229B03;
	Mon,  7 Apr 2025 07:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="NHBJCgDr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC50E225776
	for <linux-gpio@vger.kernel.org>; Mon,  7 Apr 2025 07:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010101; cv=none; b=VHk9kp34TC1mNQf5BG6tVw+BchRE4Gr/WARsdbPv7BOXO1kOknajhl0FL3NEp6CoJ2ouAf01X+NjYcjLtz653KcVrEoJBRSPWx4wJjYi4KZABUShRgaYBH+Yn9SsA3EfBwz1xbciue/7VmRUEOYzOvx+dL5LomtdUh/WrYyyMxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010101; c=relaxed/simple;
	bh=MbweKfDFcHiSBs1x7OoNhsHi066QD9imvaYUduhtZOk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=SBQ/W0fdSVp5jeRyEfhv5OzVvtKhPagcMuiUOrQTfpViss6Sk9O9SIe4CyAyh1q9XWh90GYHV4posmzCXcfMQNEnWekXWILELBbafSe5oOmroLlUkz//yZOsRs9NQ7nkXeNhD0Ef7t95o9DOzGVZOwBBA/6KlK7q4gVPl5aOmM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=NHBJCgDr; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39129fc51f8so3136771f8f.0
        for <linux-gpio@vger.kernel.org>; Mon, 07 Apr 2025 00:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744010098; x=1744614898; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qQJq7bLNv9KR26qv53DN+VLCkGsehwu1X3TDIPfPRkk=;
        b=NHBJCgDrCYbaFuZGMF2HaAeHCHV1m0oqEqcvmlRxSLPTcLwccObx/pQQynHFcQYKAc
         eOCKhVh9k1v7J98fRpUxYd7kVVWy31rTh7YLWB3VQISZ+F3CnWvfDwoFbuff/MGCH+SA
         QkWXJvOaKD+qYZjl2zr7rdiyjzK/MSdZDYDTgkgFZJNAml6y4RPggxvTeF/1lmPwhv5I
         r8762k76nX9tVI9uE4iEB7qlnnizbkgReH6Tnb/F9FfHIM5uIPk9KWF8BDvFH1H71JoU
         2WHjMKa3+j/xSdNIIXF4VIvFbHcnK74zBXqOIuddV0NnNBIQn6lO63HcbDOLvivPcFnD
         lhOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744010098; x=1744614898;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qQJq7bLNv9KR26qv53DN+VLCkGsehwu1X3TDIPfPRkk=;
        b=oJKZvg10yeOWSvUjz6Rd0ssCIQSQjFfiGmwbKkVQnVjUyVeT+3JTZrLR8rmjGgrDq9
         GRrAb2LDGNhdB1IZdGft7U1sPP6584Btg5ETlhr3eVKiCTx75/jiw5lPY2lF64F4IrXf
         xiYjFhyfG2Rj0d4imb08VSyvXAdaIqZ8FBd0EjIiM6sDiqFHDggMHrb200HnoKi4KNHU
         NhsJr0bFuJZSDiTJhsmxJzGyA1rWx7l2CmYaArrSzFCMCkbueCxFlYIMKEv96aQD5yls
         /VOIqoi9dIgCnLtsrypX8sN+0kA4oEMXgwCH+M7y0oSABF5oUN9+eQWDew6P+YU7OeaB
         hboQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCYrUHR8onxCokkdIgo/QMIbQlU+Njx3XIueXQ0OHHUII6MGnwJbPHZAAQu8m/UuW8ujfIYABVWX9V@vger.kernel.org
X-Gm-Message-State: AOJu0YxaP6VeUFhGZjnLUctxTnq1oV94ijdY+fbLYtaAGgpKa/m7ihhY
	1xi6ekfFCPyQNhyHbAyMdCFXdBXbn8qTvGveDDS0v2IM/+ThsdMNXEH7Q71pp34=
X-Gm-Gg: ASbGncu3+RsExBwRoLQ3umKMiI8xi0auTef51pZXCEOyUoidbMKUR9a0bODsrrkZHN1
	Cl9ou7EiPEIv8iRvLUxFV4eD3HEKVfTK7C1CaczuvsmUv1CUIsY3TlpuEUi9mEXyLl2N5y+JpVK
	YFdMW1c4YEYgwG5ny/Pn1gsuzPMIjCzS0Q73snnQ6NpUZXgdUOkrPbVPr/uhO+eEyDhh3qBcwVL
	S2fQyJ3DbQU6ZG5aL22/iVPQFULJEWzRe9DSAxe1U2Fzj9J3KhtPyg+yaxBN0i1WsJ8RV8Zlkwt
	E/ocH8x4kTjyJGVBRQw5yi3Z5MCpFE7mxKiiRIEuOuAqyyaa
X-Google-Smtp-Source: AGHT+IGP9iEwmcI9KW5YLuJo4zjunZA/QstskF0EVDjIclE0IgMIg3XGRl/bwqpue/ansqOprhfVRQ==
X-Received: by 2002:adf:9dc7:0:b0:39d:724f:a8a0 with SMTP id ffacd0b85a97d-39d724faacamr4274025f8f.58.1744010098097;
        Mon, 07 Apr 2025 00:14:58 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d9cfsm11171239f8f.78.2025.04.07.00.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:14:57 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Apr 2025 09:14:52 +0200
Subject: [PATCH] staging: greybus: use new GPIO line value setter callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-gpiochip-set-rv-greybus-v1-1-9d4f721db7ca@linaro.org>
X-B4-Tracking: v=1; b=H4sIAGt782cC/x3MwQ5FMBBA0V+RWZtE2xR5v/JiQY2aDc0MQsS/a
 yzP4t4blIRJ4VfcIHSw8rpkmLKAMPdLJOQxG2xlfeWcwZh4DTMnVNpQDoxC17ArhtG62jfem7a
 GXCehic/v/O+e5wUCf6oOaQAAAA==
To: Rui Miguel Silva <rmfrfs@gmail.com>, Johan Hovold <johan@kernel.org>, 
 Alex Elder <elder@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2795;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=lyZeQa2YMvW1R6DaShLQf+xZvZ4ShyP+YJTcj58/Ae4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn83txCrzzqktCdet4fuf9XzYf1ZwcHfntFZErp
 4ADsauyzUWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/N7cQAKCRARpy6gFHHX
 crAVD/9D1veSf7MDcWSr/6lqGTLb4aG6bDhwc7mW048pgU9xifNfOp8SgOzPHGGHRX6urg7Z/gk
 yd4lESSeEbkVRk+LdBIBFG6CZO2lcui2De1CMRvfwVi9KfazF8rHM1kqjSGD2XlVi5xxSDCi1FT
 usxfWpsVl2DOYO/Hh7UZ4YXfp1az0nPbSBSagjvtvxNVilWo0FXWS0Nh0E/lfoE7tGZJupTzkX3
 SLaVQcLtSYqtMOWM7U3uLFBm9NRRto74njjuWdjTVzHzlWHp9BxC4abWwUstkHRrc92CsE/Z+A7
 Ika8DzpqQKLXo0+Q4CpHmWDH/NKAjQsXSPnn6KtETA01GEs2f/JDxoTzo+v9oNXXagI+M7GWHKD
 k9z0fCb0lx/Yz1vQ34RDduoj0bJinM5068EedFCEIpRjXCaEcJcmobGrTXuxWHDA1S0RvgUO28E
 Uv6/v9qf0AmYdKBx7qwNpQ9U4kPFcmUH7xvG/RlLfMHSlcbSNMcRnulKXZqIXTKw+oTqkYriapo
 BCcefKnwzNERsenbpiVUVs1gBt0yVDMCPLDXbZUeTdM2ZEKL4k7qcNxuNE7g6UCF+bVD8/Wa7rl
 ntFFQYrgQSOSU211+Su3ufTL1N0h0yjF+6TnWaU85AJKfK/GxikZEjc4C4D6ySOJH10vZqqY3Gc
 4TYOf8py0zESLYg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/staging/greybus/gpio.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/greybus/gpio.c b/drivers/staging/greybus/gpio.c
index 16bcf7fc8158..f81c34160f72 100644
--- a/drivers/staging/greybus/gpio.c
+++ b/drivers/staging/greybus/gpio.c
@@ -185,8 +185,8 @@ static int gb_gpio_get_value_operation(struct gb_gpio_controller *ggc,
 	return 0;
 }
 
-static void gb_gpio_set_value_operation(struct gb_gpio_controller *ggc,
-					u8 which, bool value_high)
+static int gb_gpio_set_value_operation(struct gb_gpio_controller *ggc,
+				       u8 which, bool value_high)
 {
 	struct device *dev = &ggc->gbphy_dev->dev;
 	struct gb_gpio_set_value_request request;
@@ -195,7 +195,7 @@ static void gb_gpio_set_value_operation(struct gb_gpio_controller *ggc,
 	if (ggc->lines[which].direction == 1) {
 		dev_warn(dev, "refusing to set value of input gpio %u\n",
 			 which);
-		return;
+		return -EPERM;
 	}
 
 	request.which = which;
@@ -204,10 +204,12 @@ static void gb_gpio_set_value_operation(struct gb_gpio_controller *ggc,
 				&request, sizeof(request), NULL, 0);
 	if (ret) {
 		dev_err(dev, "failed to set value of gpio %u\n", which);
-		return;
+		return ret;
 	}
 
 	ggc->lines[which].value = request.value;
+
+	return 0;
 }
 
 static int gb_gpio_set_debounce_operation(struct gb_gpio_controller *ggc,
@@ -457,11 +459,11 @@ static int gb_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	return ggc->lines[which].value;
 }
 
-static void gb_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
+static int gb_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	struct gb_gpio_controller *ggc = gpiochip_get_data(chip);
 
-	gb_gpio_set_value_operation(ggc, (u8)offset, !!value);
+	return gb_gpio_set_value_operation(ggc, (u8)offset, !!value);
 }
 
 static int gb_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
@@ -555,7 +557,7 @@ static int gb_gpio_probe(struct gbphy_device *gbphy_dev,
 	gpio->direction_input = gb_gpio_direction_input;
 	gpio->direction_output = gb_gpio_direction_output;
 	gpio->get = gb_gpio_get;
-	gpio->set = gb_gpio_set;
+	gpio->set_rv = gb_gpio_set;
 	gpio->set_config = gb_gpio_set_config;
 	gpio->base = -1;		/* Allocate base dynamically */
 	gpio->ngpio = ggc->line_max + 1;

---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250331-gpiochip-set-rv-greybus-cd2365755186

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


