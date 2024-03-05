Return-Path: <linux-gpio+bounces-4136-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 084CE871BE3
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Mar 2024 11:45:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B6977284846
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Mar 2024 10:45:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC00955C1B;
	Tue,  5 Mar 2024 10:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZW9fq1bs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71AA5675B
	for <linux-gpio@vger.kernel.org>; Tue,  5 Mar 2024 10:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709634567; cv=none; b=Y1YR4BvZpxcGE84IMuFg4kzdtrfxhOGtwRhCOfn5rYZX3BNAD7+M2H9pF98zXM3PetAmsoa9cV/NWsF3NTu/2QHGvObheTYVAj5fVG+d9HFeoVYl6tZzEEWTFjy3cp2uLVrjr2Dc/GGgixc0MXOUDMR6SZTimX/+aFn78HuXazA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709634567; c=relaxed/simple;
	bh=M49FV2wGI9GKWo5wiUZVB9EjtYCxOP/vCjecHwE0q3Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ZvlpqN0XZRjU0xw7dvB4gPlVkZEHCWa3++YX1um00lut8AmceLpMvF/mFzp66DGNlbYoXh9B9YLdz83ugamQytJ3H6ukGxsiE7SuPWqye1UroOXadhylJ9KpqP2oikCrndokZ5Pf3kUD6aVtCFnNDYiKMI7C1XgXZFdcWDIehMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZW9fq1bs; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a3ed9cae56fso1211323666b.1
        for <linux-gpio@vger.kernel.org>; Tue, 05 Mar 2024 02:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709634564; x=1710239364; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2ysp6CGNvLQjrGy5D/izjF8sGNLm6VGbaYUoWi3eOa0=;
        b=ZW9fq1bs2l0zQuw5ovG48PHSUxEDm3vIYfH0zN66imgSux8QyS0acIlF2t6d84WfpP
         RJEmZNhPivedVR7tsTAgir+liWtNWkSy8Nv1eNrwFIWuqyoR359qa1OMlpmqoOf3BExF
         vK/X30f9VQyyqRQIqZK8V79RDXCMvrq4LlvuX3NOR6IudHOniP0wixwu9gppv1qB8YOH
         YW/qB0juA4j+cBWURo3BkZOLvMs+51gLGdPsYJ9ifi6IeQqzWREBDFCrGtxTX6OWrPhI
         ciAfpeGITdhByZg13Ra8Dsbi+1BgqmDiqoa0pFH25LBYvqZFNPVwNeVHMDsu3iLXuO9H
         zbmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709634564; x=1710239364;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2ysp6CGNvLQjrGy5D/izjF8sGNLm6VGbaYUoWi3eOa0=;
        b=fgWAAW83515xLw5wCg8sXwmewoH1taYi15gTI2MD+YmUldCX8QaO01cCP1pRLQWhYD
         3wCgvSZKTBhPuVTKCbMBOoHBaz1Q41DyYMre1igGp/1ES72rafWrk365NGhoftyFA35G
         gb4/JYIgcb/i58Y0lHMqGOVVKE9BYVFKkiOGM3VLMLiIHFAmxlAcurX2V4SeMUg1K6cr
         eKD1fPrFtJ6b68ak5hYaXSeYCnlURH/hu+08eWwFC0bc9LuPu0IuY6Q5Y2E+A6rrmXru
         6UkawGF4PdSSrNJrEKgFzmqnb4QWy83Xz20KT8kq08E4z0DbPA/buNP4oTmurQDFc1rZ
         /Eqw==
X-Gm-Message-State: AOJu0YwzX6x4YEPcO9jvPU5S3Znl30vTOSX0kmEU+AwaJE0tGFZxLnl0
	ocufsKTkE49kvPieZW1sVqWIzbO0UKOTs2cfMXtf0vnWceAR5nrOL8ni7iyWJDYems+8EOT9M3J
	62cY=
X-Google-Smtp-Source: AGHT+IEW3J8JgtiDU9fc/iLdMdklcMT6DrDbVOn/ewFATLz893Io2GNxqfPiDK+36+2AnJ6cZ3itmA==
X-Received: by 2002:a17:906:7fd8:b0:a45:297d:52b9 with SMTP id r24-20020a1709067fd800b00a45297d52b9mr2157013ejs.26.1709634564131;
        Tue, 05 Mar 2024 02:29:24 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id n7-20020a05640206c700b00566757b30fbsm5614209edy.45.2024.03.05.02.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Mar 2024 02:29:23 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 05 Mar 2024 11:29:15 +0100
Subject: [PATCH] pinctrl: aw9523: Fix I2C=y dependency
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240305-fix-aw9523-v1-1-97205563645b@linaro.org>
X-B4-Tracking: v=1; b=H4sIAPrz5mUC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDYwNT3bTMCt3EcktTI2NdEwMDsyQLizTzJFNTJaCGgqJUoCzYsOjY2lo
 Awec2c1wAAAA=
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, 
 David Bauer <mail@david-bauer.net>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-gpio@vger.kernel.org, kernel test robot <lkp@intel.com>, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.4

The AW9523 driver fails to build in some allmod configs since the
I2C core can be a module, but AW9523 can not. Fix it up so we depend
on I2C being compiled-in.

Fixes: a4f15a8d4c82 ("pinctrl: Add driver for Awinic AW9523/B I2C GPIO Expander")
Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202403050916.KBtE6eEj-lkp@intel.com/
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 21d38bf2d1ca..a273a9b03122 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -129,7 +129,7 @@ config PINCTRL_AXP209
 
 config PINCTRL_AW9523
 	bool "Awinic AW9523/AW9523B I2C GPIO expander pinctrl driver"
-	depends on OF && I2C
+	depends on OF && I2C=y
 	select PINMUX
 	select PINCONF
 	select GENERIC_PINCONF

---
base-commit: a4f15a8d4c8253d44830731d99be869d273c0c82
change-id: 20240305-fix-aw9523-4006b88f7b55

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>


