Return-Path: <linux-gpio+bounces-16904-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C209A4B99C
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 09:41:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8188C3A8AC6
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 08:41:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3462C1EF096;
	Mon,  3 Mar 2025 08:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DiAmEt05"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231AA1EFF85
	for <linux-gpio@vger.kernel.org>; Mon,  3 Mar 2025 08:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740991310; cv=none; b=JjtSqUKtuMOdyPge4zKZgpyLkYnpZCHdACUAqqUVsiy3FeT+Q6e4Yu97ry/5NQOckBkRWOr1MxJaGoqO4CerK2eD44ENU3Z8tsNOP1h6Eddf9dXAoXR5CK3jJC9QJ1iqgqttwyY/rsNpK+dg4Th3Cz0ncRZ3sv4VKAev009/0LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740991310; c=relaxed/simple;
	bh=eNJCxP0xI756A28+CYKsljy8EYfo5JkNWdxg5zhmKxY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mNKDlVC5I2ucE8DtZbRJ73XXzdSX+5QTaJpYbzdJd3sJDuLEaEKxNdmq1o6hM86jIYsgjmrEGg5CFApHAnbf1f0uxtXXa0Nj+zRWH/7jaYZPRRJsZYIopPdFpkc8c/Y9zxB0CmTnPLIiYSMph35HE4hL1Zqe7IyZukRnakRV01E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DiAmEt05; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30bb75492e4so9411091fa.1
        for <linux-gpio@vger.kernel.org>; Mon, 03 Mar 2025 00:41:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740991307; x=1741596107; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QSwJcdDFh8D6SKpgTLO17+NlEvY9pqV/dD+QbbnNntw=;
        b=DiAmEt05UurRHtwoZ31a3sL8iQK7ZrNd6Wz/q6QL/+hUltAdO7wIwU9/tJ6Nlsde8n
         KXrsqiO7suAZjp7JsZ8gNdzvPa30GUqamsmvFVm49D+VSGhE+yy1v39B5OfNZZ3OJ4EB
         vhEIDX2NVpeA4G/RoTjbpzPIA5xbhn/O5UPYecJmytheB2NmvlrvU9huFBDVp/sd3oVm
         qZ3/GBC4MIR0v3fIIMa58L3akec+UayxQLX6ctrUAtDKu+fqOiINUG7yF47zmtgIblW5
         709J2iD+HTzYKalJTWCHG8XR7l54ErO+pIZWSC+GB7dJ/19GKg7F/trM7wF7s3bCJdBt
         QY0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740991307; x=1741596107;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QSwJcdDFh8D6SKpgTLO17+NlEvY9pqV/dD+QbbnNntw=;
        b=cG9qfFQsFq9AGuBY1OTfVaip6MlJjoJRh+GeYYlCvZI+aDzB8xNwCep1u/ZC9vLUIt
         KzJRkXxERnbABoIvtwhW2lPn3TCnAGZ8yQJjueT6BWUIyMHgDPHgM6FurSuX25//r8F4
         HecTNJQ+FjOko+ORBY+5C/AFqD4b7j4Gp+lMTN/QUAjCljIKgCcRdFMgMruo8BFGh9fF
         ZVgl72udv9tm8bt5/uN5BlVOrPevK8IXjmZFAI9oYK4ldcJVzBqzvCtQAonVSwTUReBM
         LIMBv7TCoBT4CtQBaIhJFc+T86tfRC4Hf5qlLr/KEdjuPC5tXmHZZaNSsGgFqrtCy1MY
         2oHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyvJ2GuHYL2bdhUHElYAxzxz6mtJzulrWcjs+714ZWGrAotqOnYeO36DS84NSLCLChqrDfY3wzJso7@vger.kernel.org
X-Gm-Message-State: AOJu0YzgmQDblUEKWBoLaAMT3EekwLImPg2cgQOBiIAKbC2Ck0AwNhAQ
	aRESXNq9fwvr5m8f2L9jaRtMC2Sr7dIi2JnTpTbmExPflZuUTB8O2oRT5Su3IrI=
X-Gm-Gg: ASbGnct0xBphQXE5R43Wv0pohrvGk3icLWOByFm7ymAO6MmCiaF3IYx1cDUkAVsUCYc
	nyjeSQwqXoRj6iI4BrsV8rHYn69rRf4shbu5V86am2ri80rGxt4bV8V1SOBYd8Dv3/xyhNk4NK3
	TOlT5eMzmwE2f8IEQtdvX/eqcaXI0nl1AlP8wE42UpUcIbuJB+nKOqFx8pd/efCVVniY9miBKCB
	+mJXK46QaUmqlUCfSC/FvgStsJ63/xlmNAVmh0cBnb4u5V3clBNqO1nEYqXQFiy0bFuB/R5aCcS
	BShnkzD7DEnPOcqlDIs8KwugDSy64QVsU/srrgJCfelBsw5h2D06J1I=
X-Google-Smtp-Source: AGHT+IF6Gh/owdQANIvhyYACKJwghbMIJCt42VIMQ7h6UQPochcPtTUdjjYYrRpdf3fMrNRP+dsYqQ==
X-Received: by 2002:a05:651c:2227:b0:30b:b908:cddb with SMTP id 38308e7fff4ca-30bb908d758mr10862631fa.16.1740991307204;
        Mon, 03 Mar 2025 00:41:47 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30bc49d8b56sm827371fa.80.2025.03.03.00.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 00:41:46 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 03 Mar 2025 09:41:44 +0100
Subject: [PATCH 4/6] ASoC: samsung: speyside: Convert to GPIO descriptor
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-samsung-codecs-v1-4-56a2299dd928@linaro.org>
References: <20250303-samsung-codecs-v1-0-56a2299dd928@linaro.org>
In-Reply-To: <20250303-samsung-codecs-v1-0-56a2299dd928@linaro.org>
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
 sound/soc/samsung/speyside.c | 37 ++++++++++++++++++++++++++++++-------
 1 file changed, 30 insertions(+), 7 deletions(-)

diff --git a/sound/soc/samsung/speyside.c b/sound/soc/samsung/speyside.c
index 79476e8eb680984434a1198ff691ddd4b9fe07c1..947b85ff83f036a0814fd477f5f6f69253a2a2d8 100644
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
@@ -325,6 +332,21 @@ static struct snd_soc_card speyside = {
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
 static int speyside_probe(struct platform_device *pdev)
 {
 	struct snd_soc_card *card = &speyside;
@@ -332,6 +354,7 @@ static int speyside_probe(struct platform_device *pdev)
 
 	card->dev = &pdev->dev;
 
+	gpiod_add_lookup_table(&wm8996_gpiod_table);
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
 	if (ret)
 		dev_err_probe(&pdev->dev, ret, "snd_soc_register_card() failed\n");

-- 
2.48.1


