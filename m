Return-Path: <linux-gpio+bounces-18446-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFA9A7F6A6
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 09:43:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A0EA3BF4B2
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 07:39:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32622264608;
	Tue,  8 Apr 2025 07:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="MOhg8jqE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C3F263F48
	for <linux-gpio@vger.kernel.org>; Tue,  8 Apr 2025 07:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744097912; cv=none; b=BjfSSZk1DDC1RN9KSlYCQoofSlC0n6lPicXffSG5N13/uVgHlDGzVCM7HJHl/okvXOrparPf/svHgpHuf27dnRpixDCIa6dtZhN9kDdn49ZrMtt8GWixTJPfhZ6niWFe6RmDMpXgRYVlHtc5wfsQ81zK4mExpW8mbHVG7G45OWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744097912; c=relaxed/simple;
	bh=1IUDawPuMnzL1syBH36aZZ6k9aIzZFFvZJrc5M9W+h0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CXT3UamP28+g6WFbE4QKLVwZzqHal6inpWn1PHsid41aESPvjKr0AJ4CpH+PdS5EbtVEnld2ChaOSCTdy1fFClVgXScoz//ySyQxQnjpS2ujLvmmzmg3Kr55QaXGxK0RfimyyvBPmhhVs1nok3STYPJUH9qi7nK9wDG+dBhIroQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=MOhg8jqE; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-39ac9aea656so4449058f8f.3
        for <linux-gpio@vger.kernel.org>; Tue, 08 Apr 2025 00:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744097909; x=1744702709; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/qLbnSxZuvxxqgDY8JPrap5c14Fhz4xBCnHroQ52eE8=;
        b=MOhg8jqEjcQpPV6BaiKAsgGYgaOkkNOP2X1EC6trdGOqOP0dM9DHTYCAjyIufrvGgk
         idFSLSLXZqvX3CkI8LosZLf+B6345iZSF9BwYLs36LFcG48+Mwo4HT7wwaOKz7iEr/Tt
         O89Bz3NAVP2dOKHFcVRZjm8OS89Z8OmNvZDqQUQyg6FsJoh5JJfgVw73z6uysXXUO6hV
         JCyPlO6LgfuwQVqV7QPlst+nrtN7AAjlhBg5Y//WZXDc/KewzqPb61G7bBuvOkJQKdC2
         0hDkku5TNsn2UisDSn7HPIU+iFuqmbIpPfFdkZgMFznYChoEw/Xn1bGXvJwzZN4Y9CQ1
         4oXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744097909; x=1744702709;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/qLbnSxZuvxxqgDY8JPrap5c14Fhz4xBCnHroQ52eE8=;
        b=ZJ4rAR8b1Lm87MBO1TDrGGFfRGO7MisvBbHECqDaFbcr8S7Z7mSy0vU9CpjyjwwNJ9
         cv2ltsd4kLJTKlXohB8r4QYqDjIrVouW6otXW6LKyFcKwDSmKcF8GyhfAGB+81dFE2ak
         cfJ+uNOVGsgfGBXywyEquifZBFfplzVb6AFYP2JYlXlU+NiKUlVv9KWky9jO5IO/PYTc
         eXp4ja+V05tVCK/uvB4EA9iXlnFRjl/zArpq5enpAVaVP4kDUqGUInXGeZhm1ub6pThV
         OhfYOYwtwtL3+pwMCP81S3qGQO5CcZfs9X0h4ifq4YTlYgL2OjGfb+gexJhbvJGT2NP2
         FTHg==
X-Forwarded-Encrypted: i=1; AJvYcCWtCCkl2n8/3D7ZAJ88MT1o/kLMdHVqNZMmG+y/k06FjOZX53JkRo8cGuAKaXN6CGUew/i1+cWWcTbY@vger.kernel.org
X-Gm-Message-State: AOJu0YzS/Lzetqr/ns+Q6za7ZWr1FE38B9Tt/v6KR9hrKhMHB9ByDvwf
	mP1vfC9UwcA2ZXaQLfkbuObWcpG6zaKI0sI2sbPjpna8xVhx8Xs2afgCLppAPdk=
X-Gm-Gg: ASbGncvhcs4OyrAAbGYPLSUmiwuzj3zg0Y7ORSme/pcgs9AEW+EgvDBVzAqeBcOCh7R
	zroS6QH2hi4lV2ohsSC/H7InaNpOBVvAeLQv3iVLcNKGIkMvr53TX7ME6ikWRtxzjlmiKwqa/cI
	NHIc1RCaYeyIPvpZxWnDZTSQ5Nq3zNpDnbpd1fnChUwH/g77UyAZWCTn8oVYuYruZBNNHw4pZq5
	8w686vWTM9ZvRq+WgajTqmWB43XoWYts8pajUbt/5I54jnyEXPjmG8dZhR2vd+TSIwBJuwPzRip
	CIHLsgCQBYQWiXui9dr8tmD68ofyTbTDNtJk/Q==
X-Google-Smtp-Source: AGHT+IHvYGfZ7yR8oB9kGjMs/YRCRLgRd8dQnkUz0sLZd+LtxfPulakxOzObaL6yiBQuQ+UU4Yt92g==
X-Received: by 2002:a5d:5f83:0:b0:390:ee01:68fa with SMTP id ffacd0b85a97d-39d0de2564cmr13657198f8f.24.1744097908651;
        Tue, 08 Apr 2025 00:38:28 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30239813sm13892137f8f.101.2025.04.08.00.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:38:28 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 08 Apr 2025 09:38:21 +0200
Subject: [PATCH 03/12] ASoC: codecs: wm8962: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gpiochip-set-rv-sound-v1-3-dd54b6ca1ef9@linaro.org>
References: <20250408-gpiochip-set-rv-sound-v1-0-dd54b6ca1ef9@linaro.org>
In-Reply-To: <20250408-gpiochip-set-rv-sound-v1-0-dd54b6ca1ef9@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Peter Ujfalusi <peter.ujfalusi@gmail.com>, 
 Oder Chiou <oder_chiou@realtek.com>, Shenghao Ding <shenghao-ding@ti.com>, 
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
 Herve Codina <herve.codina@bootlin.com>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, patches@opensource.cirrus.com, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1574;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=0wuGbBgNgomJF8AO9tExLloUdiNGvc37irSst6MvvQg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9NJuYHJbAn0GFK6r9Phd4nSelz/JqRjF/cNIt
 9N6Zr862BmJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/TSbgAKCRARpy6gFHHX
 cucsD/0YLwi1Yh3e4x+YoiY7EbbSTHrO2YjLooW+nxXbIpy0FsF78TIVsyApbTfSTVUJwWqc+IY
 qpVzaaJ6IvAnFgcQYh1jhsEvaypV4KbuVLmDMA/dCx+h5KORRTFitTI8E/RdtRHU7KoSRcbrRLU
 uTFkwsamxnrd2bUU4LhNpsD5pqNRKsWSGbGwYKBlniTUApUl1fVW8ud/Jzji8sNBP6YXQq1/4kl
 uwnB6BOO2HmUGFKItvFHT9d8Y1sxzHFr0XAb8ywWuSedircQO2/Gd2B3n/L/045cL2I86JNxDbk
 2aUt3egi0UQFkpMt0FYJlptnT6Ym184FSm3uEYBPSroON6khC38Vgw1FOw4DxhdN/Hu/NLTJ5Y5
 pJnKy2KnEGlqzN/fsQRM3yZGcQe/SIu7Kgn+XQifR4jzU+QcNcy5kRIikigbSMenJcQtgKCMGoI
 PRKeXNUaFgnvG6iKYu0FdVoJfJQDfEchGz1vyRG1yHcNGVtPvHaQLuig79dLq5iSQzs/0Z+mySJ
 QjPKB2KRBFF4KVYZ36wK3ycwLLDwH+Qnvh6W6bfrE33fi59dFnEw5fgQZ2GABHHBEHuLG/8Ge5Y
 KJ4pSxc7IzpYr6yYgbrBWl1FwStcl5ofwY0TGQdl4zC1d2IW9Y4PFbdBtQXn9lTKyy9B8JZo/HM
 0ExCgf8kRRRqdxw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 sound/soc/codecs/wm8962.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
index 68f746626c33..d69aa8b15629 100644
--- a/sound/soc/codecs/wm8962.c
+++ b/sound/soc/codecs/wm8962.c
@@ -3407,13 +3407,16 @@ static int wm8962_gpio_request(struct gpio_chip *chip, unsigned offset)
 	return 0;
 }
 
-static void wm8962_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static int wm8962_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			   int value)
 {
 	struct wm8962_priv *wm8962 = gpiochip_get_data(chip);
 	struct snd_soc_component *component = wm8962->component;
 
-	snd_soc_component_update_bits(component, WM8962_GPIO_BASE + offset,
-			    WM8962_GP2_LVL, !!value << WM8962_GP2_LVL_SHIFT);
+	return snd_soc_component_update_bits(component,
+					     WM8962_GPIO_BASE + offset,
+					     WM8962_GP2_LVL,
+					     !!value << WM8962_GP2_LVL_SHIFT);
 }
 
 static int wm8962_gpio_direction_out(struct gpio_chip *chip,
@@ -3439,7 +3442,7 @@ static const struct gpio_chip wm8962_template_chip = {
 	.owner			= THIS_MODULE,
 	.request		= wm8962_gpio_request,
 	.direction_output	= wm8962_gpio_direction_out,
-	.set			= wm8962_gpio_set,
+	.set_rv			= wm8962_gpio_set,
 	.can_sleep		= 1,
 };
 

-- 
2.45.2


