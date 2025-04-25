Return-Path: <linux-gpio+bounces-19302-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8143EA9C2C9
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Apr 2025 11:07:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED3021B87AE1
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Apr 2025 09:07:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0EDA24E4A6;
	Fri, 25 Apr 2025 09:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="H0lBOLMg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0565824BD0C
	for <linux-gpio@vger.kernel.org>; Fri, 25 Apr 2025 09:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745571675; cv=none; b=hFcnmy6H1yhlEsvl59QjNeU66xQNEJIVnNSXXhhkGUpp1YwrewCK4rYn77FviZQFuehMN7pGWbCQBA0JZgfVrmxmW1ukAbKlmDxSV2M5uNRsp2+7bK+ELM8pzRYq4IxRt6x0ehvNLe/985acEFo+8U3KvFmyXUQPT5ggw1TNF9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745571675; c=relaxed/simple;
	bh=jbtD4lxoo1Rym8zGIQhQtZtmYwoyyWZdSONqwD+LmXY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R2QlyynPZvy4Z5Tu51bj5DsawOobFDgVzT8oR99je//KBVmMHagYMnb+Uyl0+tHZrXmHviWhZAqofhER5WIg5hYeqqZF/hIcHHhkw9Sfnmy0kwGzOL8DM7T4Fbz4wyLCrzhz4YB94xi/ex0fFGZ9Wr0SQsUvpTf09LjJn1wbWgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=H0lBOLMg; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-39c13fa05ebso1286268f8f.0
        for <linux-gpio@vger.kernel.org>; Fri, 25 Apr 2025 02:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745571672; x=1746176472; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bSvrLQBfLq+B4ut1ceVEmi9/bo2rmWrizkJ6hXk1M/s=;
        b=H0lBOLMgy6mEpMCFeYJOt4AYsHm0+x5PW3AxnlmDOHAoEtnxziU02zBEN8dLJmFdy0
         1z9E/BcVUqKsVmQOcaSTPkGdKhtnv7QMdPurpIAZ+OWnzZCRHaNmYuMWr5KjGZc+IAVR
         jyKqQO+AG39VmHx269jdEtCyIZbIhxCxrT35guldMi0/8nTyb7KOJFutI1ZikvZ1JfjR
         i4ynuU3F02m62MBmZeRuoL2nuqVtfPsjBZI21qzQbwxqgbXkOHIrE11lQAcLQgjTFGS7
         FnTH1Y939hW03Cyx1PFL4oyMikGDtsLKGFo28lhB5hcPc4baVLkCP4FP5S8W9iV/B0CC
         9/1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745571672; x=1746176472;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bSvrLQBfLq+B4ut1ceVEmi9/bo2rmWrizkJ6hXk1M/s=;
        b=FS6BPrxW4qArVFrQA1OCeCjv4HvzV2jP3GIwABZvRbOWXPjzrdGRhpG2jbJwoN25Wc
         zwDpiYEX18E14NmAoCa+KzTh0qQAOAe0T/Hx+r/KkT7SUalhK81Kt4DGrgqlxpuZKTo/
         mA4Ek3JxRsZOiE+YbgBCWfSwb5Y0+qn8HeNi6iJzXgH3yTyu1WpwLsbZ9PjrfI2W458q
         sJiEAHZFvvQ3Wd800wRGexfZnuFSmiFEH92e+7sXiU77falcUo8jshR8w7y8YoIVq9k+
         UQ9hlupk8RttqeYbxWPB0BZpty85pnod1Rcme1ESK5thg8J5wxH2zSgGlXs7jzDK/E06
         Mwrg==
X-Forwarded-Encrypted: i=1; AJvYcCXjfbR/4RaszxAD6T+RHv4IEJ0CdI0w2E1FUs4QBRzBtpSUZMOYzr5vTn2PoPnQWODbMdWOhMSOpk0C@vger.kernel.org
X-Gm-Message-State: AOJu0YyRp1Id6woNEaRbrSbcIUzrg9qltPi6qat41TMeSf/Ie4ooYT3r
	GQ/pL/idfnNWhbNmiMY43uFPGbbSgd6PfANyCT1pcrFaRtZUCsE3OwobpInUizI=
X-Gm-Gg: ASbGnctYP84vTyfsXqy0ti05Cnba2CrfYRJF+4XG3RoeF7QiFcg6K316X4St45yVUpO
	ck6VmPIObiKdfUXUk2N7LyjrM8s5YaZaZNyxJW7qvsRw3gl79ZqynwhMOXBKJflyrLe0aT8w2zo
	BxX8XHfmexOpwxkAURf4cBaDf5RkQ0BChk2cVmWzBdBvSDYLVcYNmQbiGfObTgSGCm6bG8jlOEQ
	ZDf9i+qSI7Vk8GKvpnyUB1lJpAN0os7TS2E/D44lC3pp43HXeQzWKZvYIEcLUouqfoohxshgopJ
	V9bdgWLAVkId5aFJQDELHpF1sLoA1Iscdw==
X-Google-Smtp-Source: AGHT+IESAKBg/vUZr7+HdyTu7Zt6c8/2gvrqKe9AqCVjAbPvKvH7CRuaevUBHKKYT49ezlwSd/p7oQ==
X-Received: by 2002:a05:6000:290b:b0:39e:cbd2:9211 with SMTP id ffacd0b85a97d-3a074faf2f4mr1109587f8f.55.1745571672261;
        Fri, 25 Apr 2025 02:01:12 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3f35:2b31:c543:726d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073c8c95dsm1696571f8f.3.2025.04.25.02.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 02:01:11 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 25 Apr 2025 11:01:01 +0200
Subject: [PATCH 5/5] pinctrl: mediatek: common: use new GPIO line value
 setter callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-gpiochip-set-rv-pinctrl-mediatek-v1-5-93e6a01855e7@linaro.org>
References: <20250425-gpiochip-set-rv-pinctrl-mediatek-v1-0-93e6a01855e7@linaro.org>
In-Reply-To: <20250425-gpiochip-set-rv-pinctrl-mediatek-v1-0-93e6a01855e7@linaro.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1986;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=DhR5Cx+h0tuPThTQMfkVBP7GDMglNgqo3TCYghOZtTc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoC09Q1qfvXLmie8Ad0KxRLSMtwSzORIC9DHLME
 ux5GcRSG1uJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAtPUAAKCRARpy6gFHHX
 cin/D/wN4TReNcVZdJpBQ3ij4ORtqXCjpIzT8TejLJmPbAW7VRLBI73Sot2lYEh6ivMjaPGV+Ez
 ff8t2p6qHWL0XyeySWLjPm6Sa+nVqRjbyFGUOty8iQicWy3VgU0h6OZYaOlbXE3HSchUFE7AuvP
 l/20EdnceslbHDVHXe3uDbsWvxyZn5zCj0Kq78XggHgGsprpI2qVyAFDUBbwaWh+1+myh7YJx/X
 yJvdjTBEdvqoMiqeuJaYhx/t/paIekWXTGSEKqVdHPp1hzb6KRCrycp6u6jzsZvnNsrMKcXHxb8
 9/3Gc6GRcWE7CxSmBqB9B0mJTdhSHRZa3YIRQTpeMxWjxGa30VQ7vMJvHygVdwcFOueRtPlcXZz
 gU7YuuI7Ug885r7Xoodq798CBFf2KN6mjY699nAmfRjbxVv+FxH1WyP0WBmENEtDQ8VHxfPJbgP
 WWvfpj0aKZTuEMTvbguqYDv8tC6fjQApPkWtivimKfsAvwjsxNqFKKgcWTlaNMCai5ye1+WNLlF
 o2XVBinR1y8178arKTT0Sa1lWO97DQwu63sYqqlePtrT+KmXA6ixprYXzYR5iBLI0RZGMNF10bP
 T1xXXdlDIe8hx3XfKDVXoo/cUL60hAqfNjdG3/Z8zF7bbaR3dzsYYEOsDCOqiO/bRA3AGSM9R8D
 Y/dstQRT5IQGDZA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
index 8596f3541265..de7bebb9a6cd 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
@@ -86,7 +86,7 @@ static int mtk_pmx_gpio_set_direction(struct pinctrl_dev *pctldev,
 	return 0;
 }
 
-static void mtk_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static int mtk_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	unsigned int reg_addr;
 	unsigned int bit;
@@ -100,7 +100,7 @@ static void mtk_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 	else
 		reg_addr = CLR_ADDR(reg_addr, pctl);
 
-	regmap_write(mtk_get_regmap(pctl, offset), reg_addr, bit);
+	return regmap_write(mtk_get_regmap(pctl, offset), reg_addr, bit);
 }
 
 static int mtk_pconf_set_ies_smt(struct mtk_pinctrl *pctl, unsigned pin,
@@ -809,7 +809,12 @@ static const struct pinmux_ops mtk_pmx_ops = {
 static int mtk_gpio_direction_output(struct gpio_chip *chip,
 					unsigned offset, int value)
 {
-	mtk_gpio_set(chip, offset, value);
+	int ret;
+
+	ret = mtk_gpio_set(chip, offset, value);
+	if (ret)
+		return ret;
+
 	return pinctrl_gpio_direction_output(chip, offset);
 }
 
@@ -893,7 +898,7 @@ static const struct gpio_chip mtk_gpio_chip = {
 	.direction_input	= pinctrl_gpio_direction_input,
 	.direction_output	= mtk_gpio_direction_output,
 	.get			= mtk_gpio_get,
-	.set			= mtk_gpio_set,
+	.set_rv			= mtk_gpio_set,
 	.to_irq			= mtk_gpio_to_irq,
 	.set_config		= mtk_gpio_set_config,
 };

-- 
2.45.2


