Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6359A7B282B
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Sep 2023 00:13:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231446AbjI1WND (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Sep 2023 18:13:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231980AbjI1WNC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Sep 2023 18:13:02 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1531319D
        for <linux-gpio@vger.kernel.org>; Thu, 28 Sep 2023 15:13:00 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5041d6d8b10so22069664e87.2
        for <linux-gpio@vger.kernel.org>; Thu, 28 Sep 2023 15:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695939178; x=1696543978; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gEziQa3WMTxBubEiTduzNr8x972su8Z0Wh8gtotlZpA=;
        b=Jrsy9OPvOmcpaz6l7EykNeboJULka4nTfglc432rcjyB47/DngVva7/qdFN6tXLIHH
         uYxsVpMfyywGYtz35uGR+pVrTL6Mg77hi+F4QtyOv4L0jirY8fAPfk7uB+b3ZHeZLCcw
         gch//Rg8r+DwB43PiA+VNbcwwBKq1TS3KIpGkEFU4iBF3fo2A0OkcJjM62YUSEhaa0Wr
         cg87dd0kdT5XkKp4WJFg7T8kn99SbGFK9oUh3Ts61IyWfiGVqWCFHHJhC+8OvVch/IKM
         1tg1GeNIp8Z0fVTCf9p/cPcD6YeGEmT+ghhNSqoZ6FwG5//blCgnpDAqYdu0MdmUQS3v
         RnpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695939178; x=1696543978;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gEziQa3WMTxBubEiTduzNr8x972su8Z0Wh8gtotlZpA=;
        b=iLwhQMzISwR3+bUBmi3laxThvH3mmAlSPPkYQ00i7xo7/rMcbI0LBSOT/qeYaeFRsx
         TroaRB+73vgTJ44yT/umr4DI3hXEoW4aBqDLNzzxk0x7Cu+u3+43UVgxVe/HZ31d95p+
         5WrJ0Ri4YsmS+pkCFnOo5tfOlnSzWgWMOD4bMmMdPfKN4QkKfkKbTFgL1ILYKTJQzvkz
         PoSpme7g2VC5CW/R/zX3R+s52lRAIXXruLZBXubzUNKHfZ60S7z1Qq0I2fF+CKEsciuk
         y9mcCOSBkSgetPKkvaiqHQxW8heWWVigZqovubMpkTRAQrncv655BAYfKHmU8/M9xNVE
         5h4Q==
X-Gm-Message-State: AOJu0Yz5bdv5Cs1dG30v5reOQ8KTQ9TY4ZMARa7R8hPXxdV3J7VO5TJg
        Lj2PlFWIHlDzhUGd3e3xMzX7yQ==
X-Google-Smtp-Source: AGHT+IGzel1RkPZ4JzmTAzm8NUoePCdFt5ZlaT/NGsNucaV0V6gsJlM+udU+/kODIJyvFU9Ivj83aA==
X-Received: by 2002:a05:6512:448:b0:4e0:a426:6ddc with SMTP id y8-20020a056512044800b004e0a4266ddcmr2091697lfk.0.1695939177623;
        Thu, 28 Sep 2023 15:12:57 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id r27-20020ac25a5b000000b005030cef433esm3271964lfn.94.2023.09.28.15.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 15:12:56 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 29 Sep 2023 00:12:54 +0200
Subject: [PATCH v2 1/4] ASoC: rockchip: Convert RK3288 HDMI to GPIO
 descriptors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230929-descriptors-asoc-rockchip-v2-1-2d2c0e043aab@linaro.org>
References: <20230929-descriptors-asoc-rockchip-v2-0-2d2c0e043aab@linaro.org>
In-Reply-To: <20230929-descriptors-asoc-rockchip-v2-0-2d2c0e043aab@linaro.org>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Heiko Stuebner <heiko@sntech.de>
Cc:     alsa-devel@alsa-project.org, linux-gpio@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This converts the Rockchip RK3288 HDMI driver to use GPIO
descriptors:

- Look up the HP EN GPIO as an optional descriptor and handle
  it directly, the gpiod API is NULL-tolerant so no special
  guards are needed.

- Let the Jack detection core obtain and handle the HP detection
  GPIO, just pass the right name and gpiod_dev and it will
  do the job. Make sure to check that the GPIO property
  is there first, so it becomes optional.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/rockchip/rk3288_hdmi_analog.c | 46 ++++++++++-----------------------
 1 file changed, 14 insertions(+), 32 deletions(-)

diff --git a/sound/soc/rockchip/rk3288_hdmi_analog.c b/sound/soc/rockchip/rk3288_hdmi_analog.c
index 0c6bd9a019db..cdb5dfd0d1d4 100644
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
@@ -113,22 +108,23 @@ static int rk_hw_params(struct snd_pcm_substream *substream,
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
 
-	/* Enable Headset Jack detection */
-	if (gpio_is_valid(machine->gpio_hp_det)) {
+	/* Enable optional Headset Jack detection */
+	if (of_property_present(dev->of_node, "rockchip,hp-det-gpios")) {
+		rk_hp_jack_gpio.gpiod_dev = dev;
 		snd_soc_card_jack_new_pins(runtime->card, "Headphone Jack",
 					   SND_JACK_HEADPHONE, &headphone_jack,
 					   headphone_jack_pins,
 					   ARRAY_SIZE(headphone_jack_pins));
-		rk_hp_jack_gpio.gpio = machine->gpio_hp_det;
 		snd_soc_jack_add_gpios(&headphone_jack, 1, &rk_hp_jack_gpio);
 	}
 
@@ -182,24 +178,10 @@ static int snd_rk_mc_probe(struct platform_device *pdev)
 
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
+	machine->gpio_hp_en = devm_gpiod_get_optional(&pdev->dev, "rockchip,hp-en", GPIOD_OUT_LOW);
+	if (IS_ERR(machine->gpio_hp_en))
+		return PTR_ERR(machine->gpio_hp_en);
+	gpiod_set_consumer_name(machine->gpio_hp_en, "hp_en");
 
 	ret = snd_soc_of_parse_card_name(card, "rockchip,model");
 	if (ret) {

-- 
2.34.1

