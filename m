Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D9D37B0F04
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Sep 2023 00:47:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229878AbjI0WrU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Sep 2023 18:47:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229906AbjI0WrT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Sep 2023 18:47:19 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE43B102
        for <linux-gpio@vger.kernel.org>; Wed, 27 Sep 2023 15:47:17 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-5031ccf004cso19822402e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 27 Sep 2023 15:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695854836; x=1696459636; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OpV1FPJ6dyO8NC9vUuzjI6C6mCi6OEhOeoX88LtgNes=;
        b=uxd444EGpz33wKvqKz/+cv8OlWHPQZvBfUUo/cO4roFf0h7SMvFcm8TsYhVz7W6ecN
         AGAejGMa4yPutTSQQJD2KIJAcnxkEmAD88OuhzbYCxZjsgetghmJF20+mFWNK4QqtXxR
         nTk/xe2MADZGbGubGP2MNQ+0Sm2Mvt9qiMXkeiJVI/Q50QEaOxV5YiHjltmsoPl+r9w0
         73ZmqiwqeBACoZQvkZcar8WOMBPfdPym0AJlpXy8csEh87w1uYH6Mm2u9mKKs7xQB/gc
         fNtj2TdnMkXg18OiSpzIDyEj+nD7G9aoCf+alQk2avQZ6lGyFXPYrRuCIYc3FuD6t5fx
         LDtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695854836; x=1696459636;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OpV1FPJ6dyO8NC9vUuzjI6C6mCi6OEhOeoX88LtgNes=;
        b=I9E2DVC4q4J23PmA+huxybLgjqeyMjdO1voY6zVVehjyrnrzrTFVvvU/tbDE19/f0H
         vbNaXZ6JPwq6ridZOG80Y/RXRlmEVZoJ0Vaquh0VuafI8aaGQv72rcpbJyXnGV4w5qPN
         LW7qdosaCVfoAZB5dyYlG9jikC7idlhwcUbmqjhVSFER61o3jXtllsCFsfjsBUJMhMdc
         BWKoHoKFYURYRRmMAImipYVs2YBbvHgDi3p0JR8n3Jlp1q8sOXkT1JBQEA6DzSMUv3Ty
         h9qWBSLwzxGyqokbEWWW7K88X/yb9SDTm7MV/i4TSjde2j1M4ml+DgIQPmFCwblsggVw
         S4nA==
X-Gm-Message-State: AOJu0YwMdbU+Qu02AUQ/dZqfuWOEXFc+36aT44hf0SeqcVf7cO6yFVh0
        NTElZA+rFYBVVObZRD7OYXHlmA==
X-Google-Smtp-Source: AGHT+IFnmsvK1nxU2ZWigAtiHCfvQZQxWBNESo/oxRorRUK1l2swAncu+UDIFedYPQJbRbubcGQzmA==
X-Received: by 2002:a05:6512:159c:b0:500:8fc1:8aba with SMTP id bp28-20020a056512159c00b005008fc18abamr3338721lfb.26.1695854835883;
        Wed, 27 Sep 2023 15:47:15 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id ep14-20020a056512484e00b0050296068a12sm2801746lfb.30.2023.09.27.15.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 15:47:15 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 28 Sep 2023 00:47:14 +0200
Subject: [PATCH 1/4] ASoC: rockchip: Convert RK3288 HDMI to GPIO
 descriptors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230928-descriptors-asoc-rockchip-v1-1-a142a42d4787@linaro.org>
References: <20230928-descriptors-asoc-rockchip-v1-0-a142a42d4787@linaro.org>
In-Reply-To: <20230928-descriptors-asoc-rockchip-v1-0-a142a42d4787@linaro.org>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Heiko Stuebner <heiko@sntech.de>
Cc:     alsa-devel@alsa-project.org, linux-gpio@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This converts the Rockchip RK3288 HDMI driver to use GPIO
descriptors:

- Look up the HP EN GPIO as a descriptor and handle it directly.

- Let the Jack detection core obtain and handle the HP detection
  GPIO, just pass the right name and gpiod_dev and it will
  do the job.

- As the probe() code is very insistent on getting valid
  GPIOs out of the device before it will continue, there
  is no point to carry all the code handling the GPIOs as
  optional, drop all these checks.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/rockchip/rk3288_hdmi_analog.c | 54 +++++++++++----------------------
 1 file changed, 17 insertions(+), 37 deletions(-)

diff --git a/sound/soc/rockchip/rk3288_hdmi_analog.c b/sound/soc/rockchip/rk3288_hdmi_analog.c
index 0c6bd9a019db..7199f991ec26 100644
--- a/sound/soc/rockchip/rk3288_hdmi_analog.c
+++ b/sound/soc/rockchip/rk3288_hdmi_analog.c
@@ -12,8 +12,7 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
-#include <linux/gpio.h>
-#include <linux/of_gpio.h>
+#include <linux/gpio/consumer.h>
 #include <sound/core.h>
 #include <sound/jack.h>
 #include <sound/pcm.h>
@@ -26,8 +25,7 @@
 #define DRV_NAME "rk3288-snd-hdmi-analog"
 
 struct rk_drvdata {
-	int gpio_hp_en;
-	int gpio_hp_det;
+	struct gpio_desc *gpio_hp_en;
 };
 
 static int rk_hp_power(struct snd_soc_dapm_widget *w,
@@ -35,11 +33,8 @@ static int rk_hp_power(struct snd_soc_dapm_widget *w,
 {
 	struct rk_drvdata *machine = snd_soc_card_get_drvdata(w->dapm->card);
 
-	if (!gpio_is_valid(machine->gpio_hp_en))
-		return 0;
-
-	gpio_set_value_cansleep(machine->gpio_hp_en,
-				SND_SOC_DAPM_EVENT_ON(event));
+	gpiod_set_value_cansleep(machine->gpio_hp_en,
+				 SND_SOC_DAPM_EVENT_ON(event));
 
 	return 0;
 }
@@ -113,24 +108,23 @@ static int rk_hw_params(struct snd_pcm_substream *substream,
 }
 
 static struct snd_soc_jack_gpio rk_hp_jack_gpio = {
-	.name = "Headphone detection",
+	.name = "rockchip,hp-det",
 	.report = SND_JACK_HEADPHONE,
 	.debounce_time = 150
 };
 
 static int rk_init(struct snd_soc_pcm_runtime *runtime)
 {
-	struct rk_drvdata *machine = snd_soc_card_get_drvdata(runtime->card);
+	struct snd_soc_card *card = runtime->card;
+	struct device *dev = card->dev;
 
 	/* Enable Headset Jack detection */
-	if (gpio_is_valid(machine->gpio_hp_det)) {
-		snd_soc_card_jack_new_pins(runtime->card, "Headphone Jack",
-					   SND_JACK_HEADPHONE, &headphone_jack,
-					   headphone_jack_pins,
-					   ARRAY_SIZE(headphone_jack_pins));
-		rk_hp_jack_gpio.gpio = machine->gpio_hp_det;
-		snd_soc_jack_add_gpios(&headphone_jack, 1, &rk_hp_jack_gpio);
-	}
+	rk_hp_jack_gpio.gpiod_dev = dev;
+	snd_soc_card_jack_new_pins(runtime->card, "Headphone Jack",
+				   SND_JACK_HEADPHONE, &headphone_jack,
+				   headphone_jack_pins,
+				   ARRAY_SIZE(headphone_jack_pins));
+	snd_soc_jack_add_gpios(&headphone_jack, 1, &rk_hp_jack_gpio);
 
 	return 0;
 }
@@ -182,24 +176,10 @@ static int snd_rk_mc_probe(struct platform_device *pdev)
 
 	card->dev = &pdev->dev;
 
-	machine->gpio_hp_det = of_get_named_gpio(np,
-		"rockchip,hp-det-gpios", 0);
-	if (!gpio_is_valid(machine->gpio_hp_det) && machine->gpio_hp_det != -ENODEV)
-		return machine->gpio_hp_det;
-
-	machine->gpio_hp_en = of_get_named_gpio(np,
-		"rockchip,hp-en-gpios", 0);
-	if (!gpio_is_valid(machine->gpio_hp_en) && machine->gpio_hp_en != -ENODEV)
-		return machine->gpio_hp_en;
-
-	if (gpio_is_valid(machine->gpio_hp_en)) {
-		ret = devm_gpio_request_one(&pdev->dev, machine->gpio_hp_en,
-					    GPIOF_OUT_INIT_LOW, "hp_en");
-		if (ret) {
-			dev_err(card->dev, "cannot get hp_en gpio\n");
-			return ret;
-		}
-	}
+	machine->gpio_hp_en = devm_gpiod_get(&pdev->dev, "rockchip,hp-en", GPIOD_OUT_LOW);
+	if (IS_ERR(machine->gpio_hp_en))
+		return PTR_ERR(machine->gpio_hp_en);
+	gpiod_set_consumer_name(machine->gpio_hp_en, "hp_en");
 
 	ret = snd_soc_of_parse_card_name(card, "rockchip,model");
 	if (ret) {

-- 
2.34.1

