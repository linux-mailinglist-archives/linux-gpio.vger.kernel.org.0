Return-Path: <linux-gpio+bounces-18450-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E05A7F69A
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 09:41:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9FA3A188B5E7
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 07:41:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19A8C26562F;
	Tue,  8 Apr 2025 07:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="pR1kh0jM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0742265627
	for <linux-gpio@vger.kernel.org>; Tue,  8 Apr 2025 07:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744097917; cv=none; b=ZrmM+0RuaxJLV64+v6I0nIee2npA4kWwaEWJBND/Y/lAnE00muluqHh5WApUWbfcH67Uxx4Sq9U8tZB96wz5CERyI47tCxW/sL8pNrFcp8pHe4PcKsrJCdXPW9vToOSFbRCQ8mZYJdsN0DSdJSC6pCUXSBEeFQcEK0YmaUR3dIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744097917; c=relaxed/simple;
	bh=fY+pWVILXqb5/itiCqfMZP6GT1wrAGbxEdKCgLUSImI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GeK1YBfbChoVV+5k2gfQFoiwbmLGK5RC1NdCa7J4A+pfFmxrzHdp7AHemBHKa23wjqkWyhmpYQgTC2HbcL6/wr9cQzq09itlbk+ImnsRSWtJZkfDxlkvPIJ3nR3V6xuefYsEO58RRKikW0g/i9dEv6Jf72rg5sfaULDNh8wQXg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=pR1kh0jM; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-391342fc0b5so4056766f8f.3
        for <linux-gpio@vger.kernel.org>; Tue, 08 Apr 2025 00:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744097914; x=1744702714; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZBoBUt087bpPfgkOHFFjzVkIh+yz5QA3imLs9YI01iA=;
        b=pR1kh0jMaSHRGOEu5hNXz0u+MAyf9MFYaUuYEX5V9gWwUla0RfLyQ/xPIob7bTdEo8
         90IY8VfLQNGKwBHONqlok3/gnmMFF2Ri481Ztq02+USCWKTO+iiBkRBlJ7LxxO3oUHbt
         /7M7mait8DxmbxihJUmxPSvBoFJ7OMl6IhOYaAngxXeOtrCivzusGB9Rk7s4P3FhUQs7
         8yYXUEeH8WSJvivxjfAFlCP6x1ud7geOdlQo29khNbzuptAqio3GeswnJR7S3hQz30es
         3257T+xsr7bPfikv3zwFj56mNAzzuwX4gSnpCdO8k0SXZkx/EV5ComDSbBogjsW6tf1S
         fJkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744097914; x=1744702714;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZBoBUt087bpPfgkOHFFjzVkIh+yz5QA3imLs9YI01iA=;
        b=TnxTtFzo99hx0NoJ67/EtReRlNLrmYkaB9CPfjVg/H2S0lh4u7vm+kMK1cG3nZ19LA
         oQhX5kFwpf/V80h9qBNx/L3JT/QgARMI1VTwwIS2g2qwONEYZCdHcEyWm3m1YL8lAq6M
         NDzckVuIjmwzBUIPwXMWGULPddeEE7GZh6dQ5wZB0BcxOYXpPHaZsV5cln6z8cysqybD
         gfMredHeosgSjQCDIXI4ZzOKwWoEsyc7jraRJ1rxDdXVYP1XsVJVf54nqK+7WLajoXP9
         0b9eMxHSrvGFj+smTpCKGFK/GAezhHp/WnlfX+buROQytQ0jWhi2N+0ZqFO6Et3GsiC3
         wRkw==
X-Forwarded-Encrypted: i=1; AJvYcCWQ1+7Vb+gE24nbhFQeXgXQMaaUDW8z3lpliQ/8owjrj0lyEK62EclGRCXF+a9YjXalsDmUa02zJaW1@vger.kernel.org
X-Gm-Message-State: AOJu0YzZTmfWm4mcWxYSBPoypZNXw1nA2uwO03wK2ExbV6h/94UZ0O2f
	CCwcjRJ1GHkTCGtj+lb8aQ8EsNHYZP8ofOx6HACRKaZpgw89m6K5/RVpoSHjy2g=
X-Gm-Gg: ASbGncucaEJMPEeBSzIgP5l/tc0cCSe3mtx78uATfhoA33acCEZ7YIij/ksW4UfNH6p
	diP7VG6vRuv+DRvcsiBaZvYH17kFlw8J7x04qk22kAdKjFdgQokJTm1KQ9zpRqp8mgG+8jeK3cH
	on3Lqt7t/0KrpsES4PgTu7HkcPasP3imzLnDLQgehs4PVVkSKGA2SSQtqs8QIBRXsi5M7s4vBnH
	eIlywqOrRscd3aAayHtEblH0B3HJ+QX0Ca2nIqmx1ey6dSll2olRNoIJTdil16Xjlk5/fQC7nSi
	Wd7OQRAcfyU/72wBfL7yitlMAPgvsjCjstsdAQ==
X-Google-Smtp-Source: AGHT+IGZzWPqum+g/fh0DG9ZeMxuwA7hGhCymtHVGUiGXAbEqjqT2osxcevrD/xaQ1rQvP2TSbkLzQ==
X-Received: by 2002:a5d:6d8c:0:b0:39c:1429:fa57 with SMTP id ffacd0b85a97d-39cb36b2a54mr14794973f8f.3.1744097914304;
        Tue, 08 Apr 2025 00:38:34 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30239813sm13892137f8f.101.2025.04.08.00.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:38:33 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 08 Apr 2025 09:38:26 +0200
Subject: [PATCH 08/12] ASoC: codecs: idt821034: use new GPIO line value
 setter callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gpiochip-set-rv-sound-v1-8-dd54b6ca1ef9@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2498;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=cgS6T7BQF961sKz8ax21RsHAauAs2dNcFyYRBwkQxTU=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9NJvNVwa+w21sExX3reksODhxqsavG/ZikzPz
 C1DStlIuC6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/TSbwAKCRARpy6gFHHX
 cqyvD/0dEy+efm6u6Nh8gozJACwedpwcG1L9GEZj2HrNlnETPemPzBV/eINPvN3vGDouJyJcQ+h
 mcVbVmQk1qeDyNm6vLLDdT7fOppv9yyEJiAEFI9tXbAw0wXoEDNO+wBH9n2Zw4IBmZ2eTn42seB
 MGZYb4bGFPo51kIYtzUQh4+w/XoX+0tH31w5jnWYEJwppxc5iaAVDC7HgtI+bBhx3cRKpKx5rlI
 TXQgDc0ixZEtE/VnxrBovtDsoOvcr7qG4xZHPBGk1zVtR+OBCmgattvW/xxMOwt8JCcv0N6mOPC
 n0GqgeKafgh61RwboTgtDYKpzOiS7TeDkQh422AbQeURJfjg7LK/PCJiluprXBhyn59bFJHFumW
 xWSwXLhBPwluM1Ku7BxyfUBYswwBcRDeUGaqKQMYyjBiw0dR4cNzMuaRmnRv0Tx+8SD3M8T3Cw3
 Nq64hJX/4LsjI2h8dO9xEJRNFMddYp8/NM+tNTdVW4DDN59cegxet9MPt2JVr6/zK3miWQWiBuS
 BI3lG6bP0W9ZIZnbD5vSAbA9SD5VOH3f93o9CWe5CODtOQs2SQ7w140dy8g4diVc3EMNwuqJk7Q
 SrCfeYdVjCV0Mpd9IlJ6TK+6WoQUQ286gbR/+GyuKZV0i+cC2uA8u/zt/rhxNlBB8tof79z2s5w
 b15sVZOUPaOJ/7A==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 sound/soc/codecs/idt821034.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/idt821034.c b/sound/soc/codecs/idt821034.c
index cb7a68c799f8..55e90604bbaa 100644
--- a/sound/soc/codecs/idt821034.c
+++ b/sound/soc/codecs/idt821034.c
@@ -957,7 +957,8 @@ static const struct snd_soc_component_driver idt821034_component_driver = {
 #define IDT821034_GPIO_OFFSET_TO_SLIC_CHANNEL(_offset) (((_offset) / 5) % 4)
 #define IDT821034_GPIO_OFFSET_TO_SLIC_MASK(_offset)    BIT((_offset) % 5)
 
-static void idt821034_chip_gpio_set(struct gpio_chip *c, unsigned int offset, int val)
+static int idt821034_chip_gpio_set(struct gpio_chip *c, unsigned int offset,
+				   int val)
 {
 	u8 ch = IDT821034_GPIO_OFFSET_TO_SLIC_CHANNEL(offset);
 	u8 mask = IDT821034_GPIO_OFFSET_TO_SLIC_MASK(offset);
@@ -973,12 +974,14 @@ static void idt821034_chip_gpio_set(struct gpio_chip *c, unsigned int offset, in
 	else
 		slic_raw &= ~mask;
 	ret = idt821034_write_slic_raw(idt821034, ch, slic_raw);
-	if (ret) {
-		dev_err(&idt821034->spi->dev, "set gpio %d (%u, 0x%x) failed (%d)\n",
-			offset, ch, mask, ret);
-	}
 
 	mutex_unlock(&idt821034->mutex);
+
+	if (ret)
+		dev_err(&idt821034->spi->dev, "set gpio %d (%u, 0x%x) failed (%d)\n",
+			offset, ch, mask, ret);
+
+	return ret;
 }
 
 static int idt821034_chip_gpio_get(struct gpio_chip *c, unsigned int offset)
@@ -1054,7 +1057,9 @@ static int idt821034_chip_direction_output(struct gpio_chip *c, unsigned int off
 	u8 slic_conf;
 	int ret;
 
-	idt821034_chip_gpio_set(c, offset, val);
+	ret = idt821034_chip_gpio_set(c, offset, val);
+	if (ret)
+		return ret;
 
 	mutex_lock(&idt821034->mutex);
 
@@ -1112,7 +1117,7 @@ static int idt821034_gpio_init(struct idt821034 *idt821034)
 	idt821034->gpio_chip.direction_input = idt821034_chip_direction_input;
 	idt821034->gpio_chip.direction_output = idt821034_chip_direction_output;
 	idt821034->gpio_chip.get = idt821034_chip_gpio_get;
-	idt821034->gpio_chip.set = idt821034_chip_gpio_set;
+	idt821034->gpio_chip.set_rv = idt821034_chip_gpio_set;
 	idt821034->gpio_chip.can_sleep = true;
 
 	return devm_gpiochip_add_data(&idt821034->spi->dev, &idt821034->gpio_chip,

-- 
2.45.2


