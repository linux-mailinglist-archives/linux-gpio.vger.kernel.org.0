Return-Path: <linux-gpio+bounces-18436-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D82C1A7F656
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 09:33:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 18C7416F0B6
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 07:32:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 525E6263F20;
	Tue,  8 Apr 2025 07:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="WHuEO0vi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BAF8263F48
	for <linux-gpio@vger.kernel.org>; Tue,  8 Apr 2025 07:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744097516; cv=none; b=cVktaK+ZeipwGGG3nMW+/5Ca1CcQAyxx+IH8bbuRRXuhjzIzmeJUU/tnRRyi6kSFTmI3lp3mEb68ix3hruxmQNld+OyNR2u5EgKPG9msnEDKpPHWQB9hE+ZGB1zTulIRv+GEBz54nf3gw9oPsJ74+pabiXN6d959VonUlr4nEDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744097516; c=relaxed/simple;
	bh=FUbTRighwa5eieYU38YRchMwR46Y0TXpyhzds2/dP/I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Yql4QO9bOLTN3t3yDHdoSON+igJJsvnxQcqoA4Etl8FWhyw4XGIMKqoz3YU8KQyZ1XX2ciqG7qB/kZ3OfLgweoClRzoATez8tGvAy0Adgr+JiXQbfgmnLtxt0uFW5qGZay7wT0UAZZy9jmst7iU+sXo//QdDq56K6DpWnx5vahM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=WHuEO0vi; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so22986825e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 08 Apr 2025 00:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744097513; x=1744702313; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6BtbHqsMhUos67G6Oxw8ZXZLpL8UlKP9+lIMwAqXx4A=;
        b=WHuEO0vi43eHm/RWEOpLb35RowTgAKYK3Tp96gi+aLgsPb4fbfwqwyTZHk5oucC5yf
         jdNWsShbw4eX75qhK6pK6vG6Sc7J9/Dmsg2Law+jFt0tZGpLACmKWzXcLdQD4x745q9Y
         gefZOiJE196ljyJQoyk8fJUl+NDkQFApYHl7rpVwjZHcfw9+KJehe3YYW1xFk1PM8n0z
         1LQM3gHDZX0E4Rjo06D7pLQ5mLTwhUrBMQXfI5MQR/WIYtt9SIEkjRBUoBxjE5+tzQjR
         Oj5b3eJEG7tu/+VF79zN4Qhm7C3UauwJxNqoN4WIi7EFtCpAwKx95EqcH2gg3TmO859A
         zUlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744097513; x=1744702313;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6BtbHqsMhUos67G6Oxw8ZXZLpL8UlKP9+lIMwAqXx4A=;
        b=YY9iR0fci/gyKw2SDPHFNWtWgqduFwrnfkRMgWnZbVA1g2G1C7/SdV+4MG1qa7kTzR
         wLfzw7pXo2ZkE7baTFs1RugEyALO1r8jRkWYoH/VwXMafvPBDx5z+7VqRipzUZTJy7RV
         n52vae1EpRrMTVo4xFhDTCFz+gTe0KbKVgRhTp3mMmDj3M9Vje9YuXW/RPQl3xEN1M3m
         U+NAdOsxjYX3+rWPSKIFO/tI6IIcuwm9JDrwkfygEVvy2FB40Kw/7G7Zs8YwAjstjN/8
         r81Qhrcpvs/eY+67MN2geZFV0QaBRGlcmBV5+aAh+ZF8B4yTaRB69e2VFv17kFSREV9y
         spYA==
X-Forwarded-Encrypted: i=1; AJvYcCUZMyyi5cjEdhsyHyiU/WadkLtkBv7BDZbIM/ZCiQG9EabhoISKQ3ovAGRiLDWKMkZImOL2z4PF2ord@vger.kernel.org
X-Gm-Message-State: AOJu0YwcEhThnZpAICUjrTqdWJqkbWwz1W/SBtbUUtzVbVbm+KBnboJn
	1cbs1xZBrToGwlg8KS10xWh8dpSIwtBNO36jDF2qDGojOtQ4GyUVBtTyRYgUuF0=
X-Gm-Gg: ASbGnculhb1K2FvEJrKObCqdb6qbtG7114romy6JtG2QQoF2ErNegcz2OmqKlItq6wn
	io0pH3a+Xk628dAdZu5yzBLr3vuabUY7DQlvshTxX9jfyTbkTFu8tVGYXbGqMXORHkj+XJDrMAt
	+AzNph3kgJgv9y23ayt1le0IrFiXNTZMv1UGfjyW63YTel5ElVD0nLhgUAcIOTgD96Oc10HrMyI
	DtubuPyGKUd/mdQc6/QatR1ikshHHi32FUlPaL4KvfIxrfUv6Uxz1fg2XCQmpD4PBYqPltyw+EB
	fYuj1fFJlLlyhzbhCne/qm5rX7M/pPWAnq0ltQ==
X-Google-Smtp-Source: AGHT+IE+Xxom6NOhosQq0m8djhtf9SwUOVEwposQh1srQRR6dan0KmkkmgYrxGpxn0xF2WRjmrUqSw==
X-Received: by 2002:a05:600c:b8c:b0:43d:4e9:27ff with SMTP id 5b1f17b1804b1-43f09261197mr36027095e9.7.1744097512693;
        Tue, 08 Apr 2025 00:31:52 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30226be7sm13846370f8f.89.2025.04.08.00.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:31:51 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 08 Apr 2025 09:31:46 +0200
Subject: [PATCH] pwm: pca9685: use new GPIO line value setter callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gpiochip-set-rv-pwm-v1-1-61e5c3358a74@linaro.org>
X-B4-Tracking: v=1; b=H4sIAOHQ9GcC/x3MQQ5AMBBA0avIrE1SRaWuIha005oFmlaQiLtrL
 N/i/wcSRaYEffFApJMT71tGVRZglmnzhGyzQQrZiloq9IF3s3DARAfGE8O1ItWzbrTtpFYOchk
 iOb7/6zC+7wei4oJAZQAAAA==
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1992;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=1U8Gmj+3lvIlR8YGdhnk51HbgumUU7NfSqTqb+zvZ/o=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9NDjW+d7FBwyeFzKIyJR2a6Z8Gc6Y60t0jDGZ
 /WgrTFfIxuJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/TQ4wAKCRARpy6gFHHX
 ckkPD/9y497qWEAtRXgBzMVqqT3uDVMKf3CMYude1aFE44ClsHYEYEWcRLXgzvOOOM4KyzStQFy
 HanKEHM+uSdXPs82ipC0Kiz+f4HXP1KuMdpNNIvYufMU2RzE7U2w/wCAQ+b/x4QCFfHo0rvYroI
 XwrbdJAmIx2+DmAvS0JRrejn4yaOAE2zUsW47/tNotpwAJhhh/vJ5md4D+AbAaJ0fPiQLMqmFVq
 rtDJf5sE4/BffloxGLmOpMHNqfv97a89Cy6cy1TMlEfo67QAK2Qx/cqmD/LwFSGXgBSLvPh9T+T
 KN1ZnVup0UTT46XsOAdaGvbqA8pg4ddFedXOmLNt2q1UmspB8G2rt4IQ3cyuUugiOGWkAHYYWgc
 4zvfeso1bKKV2HpXd1NIgf0wMyir7k26qXJuKicJiKWY88hSP7uFLeBSvuTA+nrmraemlDVgGzx
 X/1Izx0qBxGZT5HzW9zKz0SpwXic2BQQ5nvaICnOG2Gpzd7Rcw4e2fJIrvFqXuCkz70GZ1G5LRS
 8zes4tYb2/Jx7HwbBRq0DW4nA1IYd7ywvXx0rUgl9ZOkSPjSqyNnKP6/g5TPDFjPE22MOpNGlrL
 9C15eNYBk8V8e0ToggORnHjL3a1tXnMlYir//YSSuvdcPBBec5iYZfWvlRvmtdIoTNCs77b73Zk
 JCb6zElp8Q2puhQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
values") added new line setter callbacks to struct gpio_chip. They allow
to indicate failures to callers. We're in the process of converting all
GPIO controllers to using them before removing the old ones.
---
 drivers/pwm/pwm-pca9685.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/pwm/pwm-pca9685.c b/drivers/pwm/pwm-pca9685.c
index 5162f3991644..eb03ccd5b688 100644
--- a/drivers/pwm/pwm-pca9685.c
+++ b/drivers/pwm/pwm-pca9685.c
@@ -263,12 +263,14 @@ static int pca9685_pwm_gpio_get(struct gpio_chip *gpio, unsigned int offset)
 	return pca9685_pwm_get_duty(chip, offset) != 0;
 }
 
-static void pca9685_pwm_gpio_set(struct gpio_chip *gpio, unsigned int offset,
-				 int value)
+static int pca9685_pwm_gpio_set(struct gpio_chip *gpio, unsigned int offset,
+				int value)
 {
 	struct pwm_chip *chip = gpiochip_get_data(gpio);
 
 	pca9685_pwm_set_duty(chip, offset, value ? PCA9685_COUNTER_RANGE : 0);
+
+	return 0;
 }
 
 static void pca9685_pwm_gpio_free(struct gpio_chip *gpio, unsigned int offset)
@@ -321,7 +323,7 @@ static int pca9685_pwm_gpio_probe(struct pwm_chip *chip)
 	pca->gpio.direction_input = pca9685_pwm_gpio_direction_input;
 	pca->gpio.direction_output = pca9685_pwm_gpio_direction_output;
 	pca->gpio.get = pca9685_pwm_gpio_get;
-	pca->gpio.set = pca9685_pwm_gpio_set;
+	pca->gpio.set_rv = pca9685_pwm_gpio_set;
 	pca->gpio.base = -1;
 	pca->gpio.ngpio = PCA9685_MAXCHAN;
 	pca->gpio.can_sleep = true;

---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250326-gpiochip-set-rv-pwm-e3b949d7296f

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


