Return-Path: <linux-gpio+bounces-18444-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DCB4A7F68D
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 09:40:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 801AD18911E7
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 07:40:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36853263F44;
	Tue,  8 Apr 2025 07:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ylP8jOKj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320D4263C91
	for <linux-gpio@vger.kernel.org>; Tue,  8 Apr 2025 07:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744097910; cv=none; b=ouDh4ctFR++4l3uyeA9QqgU6peoSmIkoYcwd6t5s8eANlAwSoTqkWacTa63AOb1DDz+iLPKdlduh45wn9sDIbw91GMWvIpib8GwZ5UFyZvSIRPWdu3t+gWL3cwiHyx/3VhcsTVYiweQ2GGXsbFEBBoeSMAtlt7xdajwaKoeKQC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744097910; c=relaxed/simple;
	bh=H1/r13cT2Qzqk1U86sWdRYzAebCzT/guHQtTx86LWdU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qqQHavUKPBVQ6moq3gA19a3TKsK5Ljr+qoFI9SwghiNdS0BT11dHnPOmbI/VeEGkZsZbkUB2HTZpqKfFQlu8PD1MsAFxCkpBwu12VNqpIN4Bs/cw38dRc91UPb5DrpaR9y7NaZfIBoi5En/rw77NapG2pfdCvJQ81NgDnZ/2A50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ylP8jOKj; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39129fc51f8so4208716f8f.0
        for <linux-gpio@vger.kernel.org>; Tue, 08 Apr 2025 00:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744097906; x=1744702706; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dOnP59hUnqLwlou/8ixKvgPYKb1YxP7pgKnSRZqR8uc=;
        b=ylP8jOKj7WUDvXH8qBtaGThA4HArqUj9VAd0pNZoW8PpuTBRFHY+FRzvML/sn8sNQZ
         80qb4wEov3kmjvJfPYsaA2wgfjX0y0cXva96BfIlDLuxL1NAD7Zt4swM2zIU2OQRJjFs
         9UV9QwWUWlCuqUpBcucSGl94NPBvMDXo24LE0BAi8K85P6caGAR1GP6ClTIzla/tfekt
         rMOFjDrnA6BQ0VLm5tGX9kPC35f0Un/TUyeaaoZ5MCMbWd9/yjMD5UFXX1AXaHOcdf14
         mxZAMn+8rrasAu9nDaoIk1vtpjcTlzzc8xzjzwaltWxaUzfYbmxEztaanM5MKFGX/5wW
         ZStQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744097906; x=1744702706;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dOnP59hUnqLwlou/8ixKvgPYKb1YxP7pgKnSRZqR8uc=;
        b=L0GIe+BDWIFYFJJYhG70tNAdQ5AUjbFzw1mu/n2NnTTf2+Umn4zr5ALgjx9TPn4WHW
         k5v1zSrZNItPlhOiuDfViS7teupqtI8IPpygRSjikW4g48QX4fR7w87Tga2LFuUNbAeU
         Rvx4EbPbbrZsJCymD/wzCeuSsJ0JHVH2mIEs1rWfUWpG9pN7l7rA1UyXAmSZn8yVF67t
         ucmAddh/wq8bMNuxnsmqvx3rYXW1pPAeZXKTcQiLJ3dULDWFG7Or/Migl5doHgC/mxhs
         oPqSUdt/vVRDsoZ0b+Rr/EBy73gj/B5bawqiWXdV+axhw6bhzrHhM+oNMH0UA749J5Mp
         UvxA==
X-Forwarded-Encrypted: i=1; AJvYcCXd/EMN4MXkHxrfvrYZp/aW1F/eWTtGMEs1OzIrsBB+d8K/L7zLyeFKX0mH9+J7sveMLVpU1lJ+s/Ra@vger.kernel.org
X-Gm-Message-State: AOJu0YxJEl6+zNqRJu0KL6pRgKJJcQH9sH5ZBuw3mnjRTuXWYH5OKn35
	jyVV1SiNj78XrvwI/8FMVAm0woxPgxH1ORc3MeBrign85xWeXjFEau93oatP53Q=
X-Gm-Gg: ASbGnctPwhSYYJNbsK9IJcOEf+TCzKcQ8Ou+gqFlLSemWUsbN1shOCKcI8ZAr1sCeGr
	lw8TEiKqEe8VzbHVSia0bGuz+VO4BNBtoK14MX+O9Md3/yb7HKbYCMU86bX4hEHw7mEsb4VbHh9
	N/Xw0iupz1epmzLK//K5Zd0QZLRcY42Pm7bLSIv9FpEdEoU8bwuUj8nq7DSrQJ8EYcMm9sHW4Q6
	RYzu1gJrxe6ZxuXBrT/AVX/oeEQUOx7yH9UUn85vN1pLhs0m/kUxoJtD/6n72ANpf2TBZppzxak
	X1UFpCs3McAwL5snuLMVRfkScJY+6uRM8vEh/g==
X-Google-Smtp-Source: AGHT+IG7DQDDtJlKr0AX5fXm/0LslLDepU2Ul+w64BukKBUcPoEM95MldvgUmHprJ30qamN+W88wuw==
X-Received: by 2002:a05:6000:1844:b0:39b:f12c:385e with SMTP id ffacd0b85a97d-39d0de17bcfmr13214832f8f.20.1744097906542;
        Tue, 08 Apr 2025 00:38:26 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30239813sm13892137f8f.101.2025.04.08.00.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:38:26 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 08 Apr 2025 09:38:19 +0200
Subject: [PATCH 01/12] ASoC: soc-ac97: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gpiochip-set-rv-sound-v1-1-dd54b6ca1ef9@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2057;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=+s84gxi24INum35RXpjv/Lah+LzIeKYxE5tndjwwncg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9NJtls2wjcS0sj2b+6sSYrrAjLpD1ASs4aSuL
 YELPn9i8CqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/TSbQAKCRARpy6gFHHX
 cicrD/4p7G7svsv5v51KuFQmsokFKj2MMyKpLwVKzvPKUR3jJgiiG5jmmC73rdn6kP3B4c3WeX8
 ZZgxYEdYkQGY7ctLuTX72ERBUTwGVCuSmrWMJU9qTniEUBObxetXWgGXXFYjCm0VSGF7EV/VPVo
 dYTGMASWkugoa9q3BCaSobmbCA5T7lEZ0+tU4lNvlBzOFNLaQ+qw4aW7WftW90+h1LxvJna5thl
 OGyz4C4UdF7og62Qec1SwVv6ciKTNBUf6ZZQJKMhpSgGvgfrHT+qZhfbMaan2H8gPpWsxbSLRFh
 oVRAz5kmspkuf9VaUNHQ65dI9SR0+9BCgj8fguGQmLhuuoxo/NwV/aU5Vw2XYXYy9nPntrkF2FN
 oGOgbL+ENh7l4qfjtv7lRX1VEjSqjelGNeLP3SA1c03l09xi2og3veYHlmoFpqyTfK2Aq6rHHuf
 04XAWRIWBw/l/+ueNt35bQPmooh0zSXKg0YEaZI/2T1GbjcQ9GJK3RAHrEPqYeeA1xirxknPXpj
 Kca75P9W/+M1okpl+lgCcCn1qR4wYRXIIz287CYg2FZYX/P5GgBLdqzwWMoM1ddKapjdB/lRnjz
 7v0SNq1VDuWhoGZOSA9hTEAwyaFcOmQA1nivp1128qUknVGOWDZaMmA3Z++BWYlg8nwsAE/Jfqd
 2LTFtlJV7s0CGsw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 sound/soc/soc-ac97.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/sound/soc/soc-ac97.c b/sound/soc/soc-ac97.c
index 079e4ff5a14e..29790807d785 100644
--- a/sound/soc/soc-ac97.c
+++ b/sound/soc/soc-ac97.c
@@ -87,8 +87,8 @@ static int snd_soc_ac97_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	return !!(ret & (1 << offset));
 }
 
-static void snd_soc_ac97_gpio_set(struct gpio_chip *chip, unsigned int offset,
-				  int value)
+static int snd_soc_ac97_gpio_set(struct gpio_chip *chip, unsigned int offset,
+				 int value)
 {
 	struct snd_ac97_gpio_priv *gpio_priv = gpiochip_get_data(chip);
 	struct snd_soc_component *component = gpio_to_component(chip);
@@ -98,15 +98,22 @@ static void snd_soc_ac97_gpio_set(struct gpio_chip *chip, unsigned int offset,
 	snd_soc_component_write(component, AC97_GPIO_STATUS,
 				gpio_priv->gpios_set);
 	dev_dbg(component->dev, "set gpio %d to %d\n", offset, !!value);
+
+	return 0;
 }
 
 static int snd_soc_ac97_gpio_direction_out(struct gpio_chip *chip,
 				     unsigned offset, int value)
 {
 	struct snd_soc_component *component = gpio_to_component(chip);
+	int ret;
 
 	dev_dbg(component->dev, "set gpio %d to output\n", offset);
-	snd_soc_ac97_gpio_set(chip, offset, value);
+
+	ret = snd_soc_ac97_gpio_set(chip, offset, value);
+	if (ret)
+		return ret;
+
 	return snd_soc_component_update_bits(component, AC97_GPIO_CFG,
 					     1 << offset, 0);
 }
@@ -118,7 +125,7 @@ static const struct gpio_chip snd_soc_ac97_gpio_chip = {
 	.direction_input	= snd_soc_ac97_gpio_direction_in,
 	.get			= snd_soc_ac97_gpio_get,
 	.direction_output	= snd_soc_ac97_gpio_direction_out,
-	.set			= snd_soc_ac97_gpio_set,
+	.set_rv			= snd_soc_ac97_gpio_set,
 	.can_sleep		= 1,
 };
 

-- 
2.45.2


