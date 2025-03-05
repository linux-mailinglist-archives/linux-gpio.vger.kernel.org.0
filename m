Return-Path: <linux-gpio+bounces-17086-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E896A4F806
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 08:39:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 85B95188A9BB
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 07:39:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D19D1F419C;
	Wed,  5 Mar 2025 07:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O69d4sz0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381D11F3FC2
	for <linux-gpio@vger.kernel.org>; Wed,  5 Mar 2025 07:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741160364; cv=none; b=L5a1kaSqKsPPMbSArkF8ktqNhmMvR2KCR8SZGJ01CFsnVkALpmDZS1OzVraxYahwi4o5Z6aqS77LtkzfT0tPS38BK1Ed8yttw+OLokgsoFD2924Zxw9Js2P2rUhAFgS26OU39wQR7K16dK2G5dxTC6e0F90yVePoITgOABcmDKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741160364; c=relaxed/simple;
	bh=wz+GUKs5sT4ddAqlQYMCQcJWzUoa5qPy3ygAkzEl610=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ubHK9QL4iAE04dKFh6IWx8n7d2eOgB+NfyPUiXUTQrTBuappbKJ1z5F9AWZCYv22ca/ft5J8rPXze7Jy0e7qa9nhaHaUUpf4q44O5Mu+1CJYskeklysaZQW6RXjlcrnp9f93pnyZfE8vQdIRMP8WEwbV8NdIcp/SakWwxu3kWA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O69d4sz0; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30ba92c846eso38029331fa.3
        for <linux-gpio@vger.kernel.org>; Tue, 04 Mar 2025 23:39:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741160360; x=1741765160; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PwgqV7JMKM+1Tdt6knk3Cvvf9DNI3Ep7WFwi1Aj3y68=;
        b=O69d4sz0rH5sjxyJSAqhkgp6Sn96f1Q7+jLm1nWBvmwQsb5vKTzKWckOxO7RJTvELr
         1ZqAJEelrHIdTxeYEPeczVYAJw29YEhu5gEHu4TzdmLbKS6KwFecUVX/bl2GVqiiGmdq
         rDYlIk3OHlogWWdv2ouIvfqAxLBYzvYz8+BEG+XyLmsChdr48dmt3ak4OL1uS6GcOKmq
         z6BI1tDgqkiGAoR9xPqYY3DKSuucedPKylMO2ZyBqxyvlHtCE8dq8fmuWQbuuFDjnTO2
         fDFPzMmjjfj9R3E+qhD75aIi+S9KGODVrXKFP9y4o2H/em4prbhCIfGa3jPRylvDqHsC
         /NjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741160360; x=1741765160;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PwgqV7JMKM+1Tdt6knk3Cvvf9DNI3Ep7WFwi1Aj3y68=;
        b=nO0R3lmf/hwI4us6r6Ut3I0VQlxeABragcBh/9kv+opsX5JOmbM+4ZTtUeFYP97UOi
         kdCgEgeopPQpGilvG6XCYomVasqR09zin/PWRm+/udJbL/qgGF6pwlTycgNcIvCFFWFJ
         oap8tAZuZDQyFaCyuoBcGEUXPx8yoYvdT4bwWIuJISw2K+HQWeet4U9v1unJ70poYL3z
         7EgbA1HyM+lqYaVgDHMGNo6con21SKR0SPOXzadojsC+1F3VwqcoFJ8AK9saNxagGP/i
         QxQ/74IUZmpee43LPetujyHLKbElWfXFNxTualnkZS6bfFbru5LIWj8oBp5yZsWlBi5k
         KAFA==
X-Forwarded-Encrypted: i=1; AJvYcCUiyTlWuPlfRWuBechcrQWwj/ctpFD056B1rbZ2ZAVdHGhnHSyuL0y52DEvqZ86P/kYO/9FiiqS7Y8K@vger.kernel.org
X-Gm-Message-State: AOJu0YyvLVvT6CV1RSoMzo4vPjzOLZbruOiHAumZPMU2/d4VjIdr4D/F
	R/+NO/sMJU1pEZe9mDwOxZqyiolGq4b7QpsVVV0yy9a9Q+wpSE72bLr340PSGIg=
X-Gm-Gg: ASbGnctgYDRfTASs7xNR3AUlzIj+yljOAJlBB3Vs11i9y6iHakgxhFn94HGuMG7PvBO
	OJOKzQytVOkmZbsfH+pLOX/gXcmaRzAFCgxkvr+tRNu1E4vSV2E22ertq6YdqQPLRJwo57EUS2d
	a6QMAJtBmYsNchR0LoPKZtEXCyvkORERk+s2wc3iTaNi1kHiDeaGDnybqgqFNs17A4B/jEcEFJ9
	lHqaddC8yraWgMVeixQvblRD8f5OBX/8XFpSOMYKBqvGm2vUx1aoBzHvHUCaB8DmRIknx6QX+VO
	9efoPiZXxvApC9kELFOiyc4NeTCL0Cpe0d/VVN5MzFRLMw0vqz7jlYM=
X-Google-Smtp-Source: AGHT+IETHX3WLF7A8QYZdcOSJX3vTAinkijtOtXIBDhRzk3pdGH5kt3jK5fgx1/s0BdnTDWh4IXh3Q==
X-Received: by 2002:a05:651c:8c:b0:306:501:4772 with SMTP id 38308e7fff4ca-30bd7b173b9mr7061171fa.37.1741160360083;
        Tue, 04 Mar 2025 23:39:20 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30bbae78e73sm8902351fa.75.2025.03.04.23.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 23:39:19 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 05 Mar 2025 08:39:16 +0100
Subject: [PATCH v2 4/6] ASoC: samsung: speyside: Convert to GPIO descriptor
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250305-samsung-codecs-v2-4-20bc980c6445@linaro.org>
References: <20250305-samsung-codecs-v2-0-20bc980c6445@linaro.org>
In-Reply-To: <20250305-samsung-codecs-v2-0-20bc980c6445@linaro.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2

The Speyside ASoC uses a single GPIO from the WM8996
that we can provide from the local offset on that chip
rather than from the global GPIO numberspace as is being
done currently.

The offset 2 was done by calculating the base offset
for the CODEC (i.e. wm8996) GPIOs to 212, by reading
arch/arm/mach-s3c/gpio-samsung-s3c64xx.h and
arch/arm/mach-s3c/crag6410.h and adding up all the
offsets that were occasionally adding a +1 blank GPIO
between each GPIO provider.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Patch in a devm action to drop the gpiod table.
---
 sound/soc/samsung/speyside.c | 47 +++++++++++++++++++++++++++++++++++++-------
 1 file changed, 40 insertions(+), 7 deletions(-)

diff --git a/sound/soc/samsung/speyside.c b/sound/soc/samsung/speyside.c
index 79476e8eb680984434a1198ff691ddd4b9fe07c1..d6b8c62e015a3114c7a746e1f754217ffacb7044 100644
--- a/sound/soc/samsung/speyside.c
+++ b/sound/soc/samsung/speyside.c
@@ -7,13 +7,13 @@
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
 #include <sound/jack.h>
-#include <linux/gpio.h>
+#include <linux/gpio/machine.h>
+#include <linux/gpio/consumer.h>
 #include <linux/module.h>
 
 #include "../codecs/wm8996.h"
 #include "../codecs/wm9081.h"
 
-#define WM8996_HPSEL_GPIO 214
 #define MCLK_AUDIO_RATE (512 * 48000)
 
 static int speyside_set_bias_level(struct snd_soc_card *card,
@@ -105,6 +105,7 @@ static struct snd_soc_jack_pin speyside_headset_pins[] = {
 	},
 };
 
+static struct gpio_desc *speyside_hpsel_gpio;
 /* Default the headphone selection to active high */
 static int speyside_jack_polarity;
 
@@ -123,7 +124,7 @@ static void speyside_set_polarity(struct snd_soc_component *component,
 				  int polarity)
 {
 	speyside_jack_polarity = !polarity;
-	gpio_direction_output(WM8996_HPSEL_GPIO, speyside_jack_polarity);
+	gpiod_direction_output(speyside_hpsel_gpio, speyside_jack_polarity);
 
 	/* Re-run DAPM to make sure we're using the correct mic bias */
 	snd_soc_dapm_sync(snd_soc_component_get_dapm(component));
@@ -145,16 +146,22 @@ static int speyside_wm8996_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_dai *dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct snd_soc_component *component = dai->component;
+	enum gpiod_flags flags;
 	int ret;
 
 	ret = snd_soc_dai_set_sysclk(dai, WM8996_SYSCLK_MCLK2, 32768, 0);
 	if (ret < 0)
 		return ret;
 
-	ret = gpio_request(WM8996_HPSEL_GPIO, "HP_SEL");
-	if (ret != 0)
-		pr_err("Failed to request HP_SEL GPIO: %d\n", ret);
-	gpio_direction_output(WM8996_HPSEL_GPIO, speyside_jack_polarity);
+	if (speyside_jack_polarity)
+		flags = GPIOD_OUT_HIGH;
+	else
+		flags = GPIOD_OUT_LOW;
+	speyside_hpsel_gpio = devm_gpiod_get(rtd->card->dev,
+					     "hp-sel",
+					     flags);
+	if (IS_ERR(speyside_hpsel_gpio))
+		return PTR_ERR(speyside_hpsel_gpio);
 
 	ret = snd_soc_card_jack_new_pins(rtd->card, "Headset",
 					 SND_JACK_LINEOUT | SND_JACK_HEADSET |
@@ -325,6 +332,26 @@ static struct snd_soc_card speyside = {
 	.late_probe = speyside_late_probe,
 };
 
+static struct gpiod_lookup_table wm8996_gpiod_table = {
+	/* Hardcoded device name in board file mach-crag6410.c */
+	.dev_id = "speyside",
+	.table = {
+		/*
+		 * This line was hardcoded to 214 in the global GPIO
+		 * number space, S3C GPIO macros seems top set the
+		 * wm8996 codec GPIO start offset to 212, so this will
+		 * be GPIO 214 - 212 = 2 on the wm8996.
+		 */
+		GPIO_LOOKUP("wm8996", 2, "hp-sel", GPIO_ACTIVE_HIGH),
+		{ },
+	},
+};
+
+static void speyside_gpiod_table_action(void *data)
+{
+	gpiod_remove_lookup_table(&wm8996_gpiod_table);
+}
+
 static int speyside_probe(struct platform_device *pdev)
 {
 	struct snd_soc_card *card = &speyside;
@@ -332,6 +359,12 @@ static int speyside_probe(struct platform_device *pdev)
 
 	card->dev = &pdev->dev;
 
+	gpiod_add_lookup_table(&wm8996_gpiod_table);
+	ret = devm_add_action_or_reset(&pdev->dev, speyside_gpiod_table_action,
+				       NULL);
+	if (ret)
+		return ret;
+
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
 	if (ret)
 		dev_err_probe(&pdev->dev, ret, "snd_soc_register_card() failed\n");

-- 
2.48.1


