Return-Path: <linux-gpio+bounces-19300-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC5DA9C2C2
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Apr 2025 11:06:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3641F17EE95
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Apr 2025 09:06:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 346CB24BBF3;
	Fri, 25 Apr 2025 09:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="l26cjLMP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50810238C10
	for <linux-gpio@vger.kernel.org>; Fri, 25 Apr 2025 09:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745571673; cv=none; b=KopOJAUg6/q2FMSfanAuUXEzw9cC99f0WNH3Kyvoa7H28MUlpHuDOKHEmF8FfXAcJ0xEYvh11jxzPZW+7BCIxXK3tBj3/bsxzqgY85Cg+df8uwiHVS4NY38bXOqhEGHEhija3M4k5g2j5b9LfXaRPeMCuHiNJMXV0MZvMwwAXfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745571673; c=relaxed/simple;
	bh=hZpJKZ+GQSZQ/UbnOT9RImA04jIADFnimUHfJV9B/o8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e9eZSi3OLmfyFXhR2oT1JEbOHTIty6aF9QaEgPuMsGd7r76R6f+0edNaG0x/tN/WAQdT2s5JuL+jr1+c//44CdqAbAc0K1WCxcVlIYyTZSCUxAK9f6W3NHCz2lFIwjogFmrSWHtUJNaBNl4eN+A6MR8M1105SoVe5aXH7qC16KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=l26cjLMP; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-39c0dfad22aso1457998f8f.2
        for <linux-gpio@vger.kernel.org>; Fri, 25 Apr 2025 02:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745571669; x=1746176469; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r8UXZTozvJzjGLspnxEWNqMkDpoXY67SelwpGY/ZF58=;
        b=l26cjLMP21yfZ46wDo+Cd5wXTo1lG1MZFKrrpmISrY2fTnxNYM+R1g4f9/H7WqQyn2
         dyMHcdpik4qP456sNC2EX+/vMSQ9TRNOTEPZiGkasa+L/l6wuWeyCS4Sep/M8OZH8vEK
         wDXleA8VmxgR3s9j+6LUTpbMifmZJJpjNJGyYOev+NeC7sWbTuCGLiGQZKqwwJXJWKkE
         kZ7B7eN39o1cZAoqH/W3edoyr/j6fB6scfZFME+Mlv/tktA+pVduU/yEMVYZ5PV5cGi0
         VdYYMZ+0pqUHx52IMcpmg8kRtN4WkRUn1QXQfnLxectJqJpz8A1D93h4fCwwEbJ0w6/a
         zbbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745571669; x=1746176469;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r8UXZTozvJzjGLspnxEWNqMkDpoXY67SelwpGY/ZF58=;
        b=iWNQAPZI5enxKaz8z3hx8Odgt7t4AeNYLEuwnyprthDnPSIi8d239ugG0jjIl7BB1v
         KSJsz3WUBN9K42v/Q8J99tWb3PV5anFIShJjCgII3P1OzqmLTvE2qIVJKUVvlCMXGrT+
         LmoKFnErR6YV71Nc6Rs24zQ2kdNV09uq6efRWF+GiJ5PAmCsjy74qELabCmvNSo9YRlV
         johpxYn6Lg/BZdLuLfOVO5LQ/PRgs4CJ8+vvo00qfTRt7TV5W2sFIFklSL4O2ilGGbMv
         EYvHk2U1kCIXyvTVNynTWVkhscrvmrRU1biNvKO94jHYdYf72RP8EDdopvfZWjyPmF62
         Z9DA==
X-Forwarded-Encrypted: i=1; AJvYcCVb3tSi1zcCaW0qZeWEAimsWxhsSJrWykyi0Vymp/Ax3D43UXMAmbjMcxmGwIAwKuXmrhxN0hcu5QBD@vger.kernel.org
X-Gm-Message-State: AOJu0YxczvhIw/hOavEqyTc7AZauNkSQKwRT/I83r+w9ktUNq/orI+gw
	JvORTeAhyzLeetgtjq3QNflDmoupLzNV4VcJhZlwb8WBrKxAXbv4zxhyXronfh4=
X-Gm-Gg: ASbGncuDpvfAXuoyiySzBCyNezKz+3Jf3lp29kkbSm2GzC5jLb2zW5l8PRRPfm8YtSl
	PVJZuKEyCIYHnKgQVocz431+tIbL/cdgMxgvZMZXVoyFTYV75rEntbiLQlJj5VBJsmnLQB6DyUU
	u45Rni8FXQWFMPeV8FGUgMZhXfSRahaOZj7fDjHw7yeHCjxU5EhVsiokqo7xOG35rsCytnRMJat
	+JB/zLBSvQF1iNq/XTFaoWpAibCebXNcgZm/mpsVrV/ADCq+TCGOHePo5rm8eADZU3KD57tSgUd
	4v2vbbAFmUaMbfpLXlPruQ3BwSB+sFbMeQ==
X-Google-Smtp-Source: AGHT+IFckeNXXJag89Vd0W7MAUKrj0/boKLVXA4/ZToJROXBMZJpIxWvphXkHztSufJCbS1p52tVAQ==
X-Received: by 2002:a5d:5985:0:b0:39f:ed8:d6c2 with SMTP id ffacd0b85a97d-3a074e102fdmr1039852f8f.4.1745571669412;
        Fri, 25 Apr 2025 02:01:09 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3f35:2b31:c543:726d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073c8c95dsm1696571f8f.3.2025.04.25.02.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 02:01:08 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 25 Apr 2025 11:00:59 +0200
Subject: [PATCH 3/5] pinctrl: mediatek: paris: use new GPIO line value
 setter callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-gpiochip-set-rv-pinctrl-mediatek-v1-3-93e6a01855e7@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2008;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=+GvjQy682fLtJAVRTMRFy+x8ClXiXcJ5yyuJiL29z1g=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoC09QDlA6V2iktjKbxY3hklKfAJlA4oT2QZrGX
 wXC06aDqWGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAtPUAAKCRARpy6gFHHX
 crgBEACWxWgAT8cG/mDkoN2QVfPEWbfVWtvWFRQXv54q2Iw67Mow6zOgHOghjKXpL3F5MmAovsN
 Emfn+onAMvQI68zegwOSkt/BV8B29JP7kvYn09WEGSYg54V3sn6V+gzho2WzN8WwpHFitzxdeL6
 Qx75OBSlRSQvM+Rg1YOIAUNDCafWhbA7KAotx2YJeIM4T5h62okSwaTplWDAP41WFDFywwRjVl9
 JWhc1fGWSZTNrBtbeVHe6xKZSSt2qBQhoVl2Uz8o9q73DJ9+O3SyHomy3YVbvwRKj8aUWohlijR
 gTwN+ZQx3IFj6xoEwrdToBSusDzy5MU8LcOU0qoT8Q1BpWnmY9hHxECr/NFdbSrgKZRQhVqR6Py
 4vImpttpgKXrFDj0vYJdQ49exEqOj16V32VGbfcZOHEzXrfDn3kMlVS0NPDYG2pTmPYuCFjQ84E
 9PrGPAeGq3KesqBih6WbmwMKCV99lt2ob3xvDv2odYaXvG5O6t0SXtxGr1JAdpZg+X+d/SAZuLm
 pQnTg6IlkT0SZDoyNLTglOknViI/mBGdUzsBxWXmEHR5Agu+A49WHMihKIIWUrHlTjO6biMlilg
 kRA4CWZLI4Sl9xJA7CRIYu8fuqexaPEA6/o4taqQurhZlhFor6vIh5fXZePJsdudZx5Xj4k5wHF
 pyKFfkhYSs1PzCw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/mediatek/pinctrl-paris.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index 852ce0ac7ff9..89ef4e530fcc 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -874,14 +874,14 @@ static int mtk_gpio_get(struct gpio_chip *chip, unsigned int gpio)
 	return !!value;
 }
 
-static void mtk_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
+static int mtk_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
 {
 	struct mtk_pinctrl *hw = gpiochip_get_data(chip);
 	const struct mtk_pin_desc *desc;
 
 	desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio];
 
-	mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DO, !!value);
+	return mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DO, !!value);
 }
 
 static int mtk_gpio_direction_input(struct gpio_chip *chip, unsigned int gpio)
@@ -892,7 +892,11 @@ static int mtk_gpio_direction_input(struct gpio_chip *chip, unsigned int gpio)
 static int mtk_gpio_direction_output(struct gpio_chip *chip, unsigned int gpio,
 				     int value)
 {
-	mtk_gpio_set(chip, gpio, value);
+	int ret;
+
+	ret = mtk_gpio_set(chip, gpio, value);
+	if (ret)
+		return ret;
 
 	return pinctrl_gpio_direction_output(chip, gpio);
 }
@@ -945,7 +949,7 @@ static int mtk_build_gpiochip(struct mtk_pinctrl *hw)
 	chip->direction_input	= mtk_gpio_direction_input;
 	chip->direction_output	= mtk_gpio_direction_output;
 	chip->get		= mtk_gpio_get;
-	chip->set		= mtk_gpio_set;
+	chip->set_rv		= mtk_gpio_set;
 	chip->to_irq		= mtk_gpio_to_irq;
 	chip->set_config	= mtk_gpio_set_config;
 	chip->base		= -1;

-- 
2.45.2


