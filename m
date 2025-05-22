Return-Path: <linux-gpio+bounces-20495-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E05AC126D
	for <lists+linux-gpio@lfdr.de>; Thu, 22 May 2025 19:42:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D3CE1893A9B
	for <lists+linux-gpio@lfdr.de>; Thu, 22 May 2025 17:42:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E612829B798;
	Thu, 22 May 2025 17:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l2B0ltgC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7E919DF40
	for <linux-gpio@vger.kernel.org>; Thu, 22 May 2025 17:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747935670; cv=none; b=LEBUGO6YmYqNJnD1k/ZJl9ovJbQmqNWPN89KwCpGib+x2Z33K2sz6VPhxQh+hi2Nwef2NuR5/TQ/27YKPPsByKQkGD3PD5QeqwMVzRpXKRzVpWRhWnrauku+FWWqT72akPXdtOP1g776CimSZ9dHbUku1yqX39jUzXxpo0k1jo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747935670; c=relaxed/simple;
	bh=pCFsOsuV0pj+x09SXIwLqjOzUfqLyO5ZH7u0NMzqFwk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BgiM3fp6UN/8tgMKsPzHjZOhBBLlOTfaYsiIU5tCJNR2OHeSjIBI+FHbEqaUNKxOoUS8uMxN7kq3DkfOCKR3d0XLU21hv3MplPezBU6Cc/a7z9j4GGXHEP116pHXG808Rrc9A4W6AMdqYSzRNC8l8kgTWFwA1GYNkXLsLaMhfI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l2B0ltgC; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-442ed8a275fso104912105e9.2
        for <linux-gpio@vger.kernel.org>; Thu, 22 May 2025 10:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747935661; x=1748540461; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gMrFaIWvHPQ+ccxJtwRGXDZ445qQMOBN4kgpSPRZMWc=;
        b=l2B0ltgCF1QabNWI2+1dBFF2R0vdF3IzB1LfiyKzx5amoWgp5ZO6QtLwwftpOl1fHo
         iVd/WYDr1QBgX17hcdiUc3rYxXaiRjryNX5Ku6SdNtQFNIwAubO7NitKWldV/GbD3x39
         AKN2UcpeqItStEROhjeeqTZHPK/sc6LDl21wy9t86Yext/puKacl1LdTdQWMQEMAqAuy
         Zf4GC8ktsQJNOKpwKiu2ZZuAGT/DPNXOnQS0xo+otRdKYKBFz6ht8gJ2wY0UKv/dMJHO
         rEa8dYVVYwkGzs28JEqTHZvya12zBOPLxrWJeh6z4MV38xyLa97WvFP9onXCPc/uXMeV
         FwMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747935661; x=1748540461;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gMrFaIWvHPQ+ccxJtwRGXDZ445qQMOBN4kgpSPRZMWc=;
        b=M8N8LvL8iwsY3f9e5VCiI/sTvgYtuTWCvbpoMOC9EqRV2ZxBK9yHdA32D98IqwAZo4
         6X+WXryaSImbPTgB8rdMWCsYy1+5enkjmX8DSNdwmuZ1v8iLS8lJNi6NNKMOSORuAEzO
         zyApb++jls9MJq0UamlwDKuZ4wEv4L/lNHxACjlHRBXEzAY4v6Jbs2lr0Zo/uQHAfNa7
         bbLwHupqEUca3MDNWfYpFSjm3sdf1WGPtKlvwwxiS5bdy0L0uMpuQGS5+t/H/xzPtY7d
         2U7HUgltw5Ctr1fzF7nVe/TSaul24K2/tZ9NwvQkY1Nd+ZqtH0/tVeHNSvDjPGkvZ+Dj
         gsyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXYvFLQed/lmCPp7A13l31PlNoFA50YaBoMYJyyVXHnpN2JvKz8F4RZyHyKziJa78G0frLLMHwx+sY@vger.kernel.org
X-Gm-Message-State: AOJu0YyyOcXG0c/NZm673nA3aI3hv9yqLZhqJWnr7YXrJ9uHUuoYrZXy
	SbJ60IpZJp/g+jMkWeGdYtrsk4xKiWams26y7zjprvjPXLxjJF25quDs5LuN00unYbw=
X-Gm-Gg: ASbGncsuNIuINVloY/iGcES12fkcNvkcaq/Pk5iiChW/XRXxxxaFzERqP9Ji5yspt7K
	/Bysaby4lv5mVuNGirpat+EAgpJBhFP1JZoFaFQzrDyPqC9HQ0ybFgxefv7Z9snRbD6ciZcztaX
	VOjKjxd0Fcx9qp8QPC4uyZYSDvo7ZBtWRATrAoT78SRO2KNdIHYxkM3ErLkZ088V8am91jdOxRg
	WVwQbkt5kgYSGvPFXdEORCjwGOHejJfQGcq6N8KT6MQITAeencfhrxoQlZgLvS35AbYVMUWeIHG
	89Lct8pEEpl8V4FzKhkTuXMWg0B4TnumDZWUueEUZR9XYdqGeIhdQhKMbnA=
X-Google-Smtp-Source: AGHT+IFU2i1B2b0IAynR0kRMHPhC9jY3UpaBcLc0pxzvTOUZ0SDg73qBs1JNdW0OIXLpsXCv+aL5Lw==
X-Received: by 2002:a05:600c:8597:b0:43c:fe15:41cb with SMTP id 5b1f17b1804b1-442fd780527mr275805105e9.15.1747935660684;
        Thu, 22 May 2025 10:41:00 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7213:c700:6c33:c245:91e5:a9f4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f7bae847sm109563195e9.36.2025.05.22.10.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 10:40:59 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 22 May 2025 18:40:56 +0100
Subject: [PATCH v3 06/12] ASoC: codecs: add wsa881x-i2c amplifier codec
 driver
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-rb2_audio_v3-v3-6-9eeb08cab9dc@linaro.org>
References: <20250522-rb2_audio_v3-v3-0-9eeb08cab9dc@linaro.org>
In-Reply-To: <20250522-rb2_audio_v3-v3-0-9eeb08cab9dc@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>, 
 linux-sound@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
X-Mailer: b4 0.14.2

Add support to analog mode of WSA8810/WSA8815 Class-D Smart Speaker
family of amplifiers. Such amplifiers are primarily interfaced with
SoundWire but they also support analog mode which is configurable by
setting one of the pins to high/low. In such case the WSA881X amplifier
is configurable only using i2c.

To have stereo two WSA881X amplifiers are required but mono
configurations are also possible.

Cc: Srinivas Kandagatla <srini@kernel.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 sound/soc/codecs/Kconfig          |   11 +
 sound/soc/codecs/Makefile         |    2 +
 sound/soc/codecs/wsa881x-common.h |   20 +
 sound/soc/codecs/wsa881x-i2c.c    | 1353 +++++++++++++++++++++++++++++++++++++
 4 files changed, 1386 insertions(+)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index ba6e4504b5e9951203bd61fae894e86e9d40048e..9fef16003e2b7bb650c9a6bbcfd5d2f58626a5ae 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -357,6 +357,7 @@ config SND_SOC_ALL_CODECS
 	imply SND_SOC_WM9712
 	imply SND_SOC_WM9713
 	imply SND_SOC_WSA881X
+	imply SND_SOC_WSA881X_I2C
 	imply SND_SOC_WSA883X
 	imply SND_SOC_WSA884X
 	imply SND_SOC_ZL38060
@@ -2555,6 +2556,16 @@ config SND_SOC_WSA881X
 	  This enables support for Qualcomm WSA8810/WSA8815 Class-D
 	  Smart Speaker Amplifier.
 
+config SND_SOC_WSA881X_I2C
+	tristate "WSA881X Codec - Analog mode"
+	depends on I2C
+	select REGMAP_I2C
+	select SND_SOC_WSA881X_COMMON
+	help
+	  This enables support for Qualcomm WSA8810/WSA8815 Class-D Smart
+	  Speaker Amplifier that works in analog mode and configurable
+	  via I2C.
+
 config SND_SOC_WSA883X
 	tristate "WSA883X Codec"
 	depends on SOUNDWIRE
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index 212d419cfe3c0fbd5d4e475e5d81c69ef930b3e1..7f2ec25a279087078d9480c1b14506e70c80d552 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -407,6 +407,7 @@ snd-soc-wm9713-y := wm9713.o
 snd-soc-wm-hubs-y := wm_hubs.o
 snd-soc-wsa881x-y := wsa881x.o
 snd-soc-wsa881x-common-y := wsa881x-common.o
+snd-soc-wsa881x-i2c-y := wsa881x-i2c.o
 snd-soc-wsa883x-y := wsa883x.o
 snd-soc-wsa884x-y := wsa884x.o
 snd-soc-zl38060-y := zl38060.o
@@ -837,6 +838,7 @@ obj-$(CONFIG_SND_SOC_WM_ADSP)	+= snd-soc-wm-adsp.o
 obj-$(CONFIG_SND_SOC_WM_HUBS)	+= snd-soc-wm-hubs.o
 obj-$(CONFIG_SND_SOC_WSA881X)	+= snd-soc-wsa881x.o
 obj-$(CONFIG_SND_SOC_WSA881X_COMMON)	+= snd-soc-wsa881x-common.o
+obj-$(CONFIG_SND_SOC_WSA881X_I2C)	+= snd-soc-wsa881x-i2c.o
 obj-$(CONFIG_SND_SOC_WSA883X)	+= snd-soc-wsa883x.o
 obj-$(CONFIG_SND_SOC_WSA884X)	+= snd-soc-wsa884x.o
 obj-$(CONFIG_SND_SOC_ZL38060)	+= snd-soc-zl38060.o
diff --git a/sound/soc/codecs/wsa881x-common.h b/sound/soc/codecs/wsa881x-common.h
index ab4ee5848b10fe6ca4160b7ff634e7e06b6e41e6..a3322ad1a6eac220244a29c0540ea5dbe3118106 100644
--- a/sound/soc/codecs/wsa881x-common.h
+++ b/sound/soc/codecs/wsa881x-common.h
@@ -2,6 +2,7 @@
 #ifndef __WSA881x_COMMON_H__
 #define __WSA881x_COMMON_H__
 
+#include <linux/i2c.h>
 #include <linux/soundwire/sdw.h>
 #include <sound/soc.h>
 
@@ -245,6 +246,25 @@ struct wsa881x_priv {
 	bool port_enable[WSA881X_MAX_SWR_PORTS];
 #endif
 
+#if IS_ENABLED(CONFIG_SND_SOC_WSA881X_I2C)
+	/* i2c interace for analog mode */
+	struct regmap *regmap_analog;
+	/*
+	 * First client is for the digital part,
+	 * the second one is for analog part
+	 */
+	struct i2c_client *client[2];
+	struct i2c_msg xfer_msg[2];
+	struct snd_soc_component *component;
+	struct snd_soc_dai_driver *dai_driver;
+	const struct snd_soc_component_driver *driver;
+	struct gpio_desc *mclk_pin;
+	struct clk *wsa_mclk;
+	bool regmap_flag;
+	bool boost_enable;
+	int spk_pa_gain;
+	int version;
+#endif
 	struct gpio_desc *sd_n;
 	/*
 	 * Logical state for SD_N GPIO: high for shutdown, low for enable.
diff --git a/sound/soc/codecs/wsa881x-i2c.c b/sound/soc/codecs/wsa881x-i2c.c
new file mode 100644
index 0000000000000000000000000000000000000000..5fa3940c65877e480aecb53acdfad5fd6ff905bd
--- /dev/null
+++ b/sound/soc/codecs/wsa881x-i2c.c
@@ -0,0 +1,1353 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2015-2016, 2018-2020, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2025, Linaro Limited
+ */
+
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/gpio.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/platform_device.h>
+#include <linux/printk.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include <sound/soc-dapm.h>
+#include "wsa881x-common.h"
+
+#define I2C_ANALOG_OFFSET		0x36
+#define SPK_GAIN_12DB			4
+
+#define WSA881X_RATES (SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |\
+			SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_48000 |\
+			SNDRV_PCM_RATE_96000 | SNDRV_PCM_RATE_192000 |\
+			SNDRV_PCM_RATE_384000)
+/* Fractional Rates */
+#define WSA881X_FRAC_RATES (SNDRV_PCM_RATE_44100 | SNDRV_PCM_RATE_88200 |\
+				SNDRV_PCM_RATE_176400 | SNDRV_PCM_RATE_352800)
+
+#define WSA881X_FORMATS (SNDRV_PCM_FMTBIT_S16_LE |\
+			SNDRV_PCM_FMTBIT_S24_LE |\
+			SNDRV_PCM_FMTBIT_S24_3LE | SNDRV_PCM_FMTBIT_S32_LE)
+
+#define WSA881X_I2C_DRV_NAME	"wsa881x_i2c_codec"
+
+#define DIGITAL		0
+#define ANALOG		1
+
+enum {
+	WSA881X_1_X = 0,
+	WSA881X_2_0,
+};
+
+#define WSA881X_IS_2_0(ver)		((ver == WSA881X_2_0) ? 1 : 0)
+
+struct reg_default wsa881x_ana_reg_defaults[] = {
+	{WSA881X_CHIP_ID0, 0x00},
+	{WSA881X_CHIP_ID1, 0x00},
+	{WSA881X_CHIP_ID2, 0x00},
+	{WSA881X_CHIP_ID3, 0x02},
+	{WSA881X_BUS_ID, 0x00},
+	{WSA881X_CDC_RST_CTL, 0x00},
+	{WSA881X_CDC_TOP_CLK_CTL, 0x03},
+	{WSA881X_CDC_ANA_CLK_CTL, 0x00},
+	{WSA881X_CDC_DIG_CLK_CTL, 0x00},
+	{WSA881X_CLOCK_CONFIG, 0x00},
+	{WSA881X_ANA_CTL, 0x08},
+	{WSA881X_SWR_RESET_EN, 0x00},
+	{WSA881X_TEMP_DETECT_CTL, 0x01},
+	{WSA881X_TEMP_MSB, 0x00},
+	{WSA881X_TEMP_LSB, 0x00},
+	{WSA881X_TEMP_CONFIG0, 0x00},
+	{WSA881X_TEMP_CONFIG1, 0x00},
+	{WSA881X_CDC_CLIP_CTL, 0x03},
+	{WSA881X_SDM_PDM9_LSB, 0x00},
+	{WSA881X_SDM_PDM9_MSB, 0x00},
+	{WSA881X_CDC_RX_CTL, 0x7E},
+	{WSA881X_DEM_BYPASS_DATA0, 0x00},
+	{WSA881X_DEM_BYPASS_DATA1, 0x00},
+	{WSA881X_DEM_BYPASS_DATA2, 0x00},
+	{WSA881X_DEM_BYPASS_DATA3, 0x00},
+	{WSA881X_OTP_CTRL0, 0x00},
+	{WSA881X_OTP_CTRL1, 0x00},
+	{WSA881X_HDRIVE_CTL_GROUP1, 0x00},
+	{WSA881X_INTR_MODE, 0x00},
+	{WSA881X_INTR_MASK, 0x1F},
+	{WSA881X_INTR_STATUS, 0x00},
+	{WSA881X_INTR_CLEAR, 0x00},
+	{WSA881X_INTR_LEVEL, 0x00},
+	{WSA881X_INTR_SET, 0x00},
+	{WSA881X_INTR_TEST, 0x00},
+	{WSA881X_PDM_TEST_MODE, 0x00},
+	{WSA881X_ATE_TEST_MODE, 0x00},
+	{WSA881X_PIN_CTL_MODE, 0x00},
+	{WSA881X_PIN_CTL_OE, 0x00},
+	{WSA881X_PIN_WDATA_IOPAD, 0x00},
+	{WSA881X_PIN_STATUS, 0x00},
+	{WSA881X_DIG_DEBUG_MODE, 0x00},
+	{WSA881X_DIG_DEBUG_SEL, 0x00},
+	{WSA881X_DIG_DEBUG_EN, 0x00},
+	{WSA881X_SWR_HM_TEST1, 0x08},
+	{WSA881X_SWR_HM_TEST2, 0x00},
+	{WSA881X_TEMP_DETECT_DBG_CTL, 0x00},
+	{WSA881X_TEMP_DEBUG_MSB, 0x00},
+	{WSA881X_TEMP_DEBUG_LSB, 0x00},
+	{WSA881X_SAMPLE_EDGE_SEL, 0x0C},
+	{WSA881X_SPARE_0, 0x00},
+	{WSA881X_SPARE_1, 0x00},
+	{WSA881X_SPARE_2, 0x00},
+	{WSA881X_OTP_REG_0, 0x01},
+	{WSA881X_OTP_REG_1, 0xFF},
+	{WSA881X_OTP_REG_2, 0xC0},
+	{WSA881X_OTP_REG_3, 0xFF},
+	{WSA881X_OTP_REG_4, 0xC0},
+	{WSA881X_OTP_REG_5, 0xFF},
+	{WSA881X_OTP_REG_6, 0xFF},
+	{WSA881X_OTP_REG_7, 0xFF},
+	{WSA881X_OTP_REG_8, 0xFF},
+	{WSA881X_OTP_REG_9, 0xFF},
+	{WSA881X_OTP_REG_10, 0xFF},
+	{WSA881X_OTP_REG_11, 0xFF},
+	{WSA881X_OTP_REG_12, 0xFF},
+	{WSA881X_OTP_REG_13, 0xFF},
+	{WSA881X_OTP_REG_14, 0xFF},
+	{WSA881X_OTP_REG_15, 0xFF},
+	{WSA881X_OTP_REG_16, 0xFF},
+	{WSA881X_OTP_REG_17, 0xFF},
+	{WSA881X_OTP_REG_18, 0xFF},
+	{WSA881X_OTP_REG_19, 0xFF},
+	{WSA881X_OTP_REG_20, 0xFF},
+	{WSA881X_OTP_REG_21, 0xFF},
+	{WSA881X_OTP_REG_22, 0xFF},
+	{WSA881X_OTP_REG_23, 0xFF},
+	{WSA881X_OTP_REG_24, 0x03},
+	{WSA881X_OTP_REG_25, 0x01},
+	{WSA881X_OTP_REG_26, 0x03},
+	{WSA881X_OTP_REG_27, 0x11},
+	{WSA881X_OTP_REG_28, 0xFF},
+	{WSA881X_OTP_REG_29, 0xFF},
+	{WSA881X_OTP_REG_30, 0xFF},
+	{WSA881X_OTP_REG_31, 0xFF},
+	{WSA881X_OTP_REG_63, 0x40},
+	/* WSA881x Analog registers */
+	{WSA881X_BIAS_REF_CTRL, 0x6C},
+	{WSA881X_BIAS_TEST, 0x16},
+	{WSA881X_BIAS_BIAS, 0xF0},
+	{WSA881X_TEMP_OP, 0x00},
+	{WSA881X_TEMP_IREF_CTRL, 0x56},
+	{WSA881X_TEMP_ISENS_CTRL, 0x47},
+	{WSA881X_TEMP_CLK_CTRL, 0x87},
+	{WSA881X_TEMP_TEST, 0x00},
+	{WSA881X_TEMP_BIAS, 0x51},
+	{WSA881X_TEMP_ADC_CTRL, 0x00},
+	{WSA881X_TEMP_DOUT_MSB, 0x00},
+	{WSA881X_TEMP_DOUT_LSB, 0x00},
+	{WSA881X_ADC_EN_MODU_V, 0x00},
+	{WSA881X_ADC_EN_MODU_I, 0x00},
+	{WSA881X_ADC_EN_DET_TEST_V, 0x00},
+	{WSA881X_ADC_EN_DET_TEST_I, 0x00},
+	{WSA881X_ADC_SEL_IBIAS, 0x25},
+	{WSA881X_ADC_EN_SEL_IBIAS, 0x10},
+	{WSA881X_SPKR_DRV_EN, 0x74},
+	{WSA881X_SPKR_DRV_GAIN, 0x01},
+	{WSA881X_SPKR_DAC_CTL, 0x40},
+	{WSA881X_SPKR_DRV_DBG, 0x15},
+	{WSA881X_SPKR_PWRSTG_DBG, 0x00},
+	{WSA881X_SPKR_OCP_CTL, 0xD4},
+	{WSA881X_SPKR_CLIP_CTL, 0x90},
+	{WSA881X_SPKR_BBM_CTL, 0x00},
+	{WSA881X_SPKR_MISC_CTL1, 0x80},
+	{WSA881X_SPKR_MISC_CTL2, 0x00},
+	{WSA881X_SPKR_BIAS_INT, 0x56},
+	{WSA881X_SPKR_PA_INT, 0x54},
+	{WSA881X_SPKR_BIAS_CAL, 0xAC},
+	{WSA881X_SPKR_BIAS_PSRR, 0x54},
+	{WSA881X_SPKR_STATUS1, 0x00},
+	{WSA881X_SPKR_STATUS2, 0x00},
+	{WSA881X_BOOST_EN_CTL, 0x18},
+	{WSA881X_BOOST_CURRENT_LIMIT, 0x7A},
+	{WSA881X_BOOST_PS_CTL, 0xC0},
+	{WSA881X_BOOST_PRESET_OUT1, 0x77},
+	{WSA881X_BOOST_PRESET_OUT2, 0x70},
+	{WSA881X_BOOST_FORCE_OUT, 0x0E},
+	{WSA881X_BOOST_LDO_PROG, 0x16},
+	{WSA881X_BOOST_SLOPE_COMP_ISENSE_FB, 0x71},
+	{WSA881X_BOOST_RON_CTL, 0x0F},
+	{WSA881X_BOOST_LOOP_STABILITY, 0xAD},
+	{WSA881X_BOOST_ZX_CTL, 0x34},
+	{WSA881X_BOOST_START_CTL, 0x23},
+	{WSA881X_BOOST_MISC1_CTL, 0x80},
+	{WSA881X_BOOST_MISC2_CTL, 0x00},
+	{WSA881X_BOOST_MISC3_CTL, 0x00},
+	{WSA881X_BOOST_ATEST_CTL, 0x00},
+	{WSA881X_SPKR_PROT_FE_GAIN, 0x46},
+	{WSA881X_SPKR_PROT_FE_CM_LDO_SET, 0x3B},
+	{WSA881X_SPKR_PROT_FE_ISENSE_BIAS_SET1, 0x8D},
+	{WSA881X_SPKR_PROT_FE_ISENSE_BIAS_SET2, 0x8D},
+	{WSA881X_SPKR_PROT_ATEST1, 0x01},
+	{WSA881X_SPKR_PROT_ATEST2, 0x00},
+	{WSA881X_SPKR_PROT_FE_VSENSE_VCM, 0x8D},
+	{WSA881X_SPKR_PROT_FE_VSENSE_BIAS_SET1, 0x4D},
+	{WSA881X_BONGO_RESRV_REG1, 0x00},
+	{WSA881X_BONGO_RESRV_REG2, 0x00},
+	{WSA881X_SPKR_PROT_SAR, 0x00},
+	{WSA881X_SPKR_STATUS3, 0x00},
+};
+
+const struct reg_default wsa881x_ana_reg_defaults_0[] = {
+	{WSA881X_CHIP_ID0, 0x00},
+	{WSA881X_CHIP_ID1, 0x00},
+	{WSA881X_CHIP_ID2, 0x00},
+	{WSA881X_CHIP_ID3, 0x02},
+	{WSA881X_BUS_ID, 0x00},
+	{WSA881X_CDC_RST_CTL, 0x00},
+	{WSA881X_CDC_TOP_CLK_CTL, 0x03},
+	{WSA881X_CDC_ANA_CLK_CTL, 0x00},
+	{WSA881X_CDC_DIG_CLK_CTL, 0x00},
+	{WSA881X_CLOCK_CONFIG, 0x00},
+	{WSA881X_ANA_CTL, 0x08},
+	{WSA881X_SWR_RESET_EN, 0x00},
+	{WSA881X_TEMP_DETECT_CTL, 0x01},
+	{WSA881X_TEMP_MSB, 0x00},
+	{WSA881X_TEMP_LSB, 0x00},
+	{WSA881X_TEMP_CONFIG0, 0x00},
+	{WSA881X_TEMP_CONFIG1, 0x00},
+	{WSA881X_CDC_CLIP_CTL, 0x03},
+	{WSA881X_SDM_PDM9_LSB, 0x00},
+	{WSA881X_SDM_PDM9_MSB, 0x00},
+	{WSA881X_CDC_RX_CTL, 0x7E},
+	{WSA881X_DEM_BYPASS_DATA0, 0x00},
+	{WSA881X_DEM_BYPASS_DATA1, 0x00},
+	{WSA881X_DEM_BYPASS_DATA2, 0x00},
+	{WSA881X_DEM_BYPASS_DATA3, 0x00},
+	{WSA881X_OTP_CTRL0, 0x00},
+	{WSA881X_OTP_CTRL1, 0x00},
+	{WSA881X_HDRIVE_CTL_GROUP1, 0x00},
+	{WSA881X_INTR_MODE, 0x00},
+	{WSA881X_INTR_MASK, 0x1F},
+	{WSA881X_INTR_STATUS, 0x00},
+	{WSA881X_INTR_CLEAR, 0x00},
+	{WSA881X_INTR_LEVEL, 0x00},
+	{WSA881X_INTR_SET, 0x00},
+	{WSA881X_INTR_TEST, 0x00},
+	{WSA881X_PDM_TEST_MODE, 0x00},
+	{WSA881X_ATE_TEST_MODE, 0x00},
+	{WSA881X_PIN_CTL_MODE, 0x00},
+	{WSA881X_PIN_CTL_OE, 0x00},
+	{WSA881X_PIN_WDATA_IOPAD, 0x00},
+	{WSA881X_PIN_STATUS, 0x00},
+	{WSA881X_DIG_DEBUG_MODE, 0x00},
+	{WSA881X_DIG_DEBUG_SEL, 0x00},
+	{WSA881X_DIG_DEBUG_EN, 0x00},
+	{WSA881X_SWR_HM_TEST1, 0x08},
+	{WSA881X_SWR_HM_TEST2, 0x00},
+	{WSA881X_TEMP_DETECT_DBG_CTL, 0x00},
+	{WSA881X_TEMP_DEBUG_MSB, 0x00},
+	{WSA881X_TEMP_DEBUG_LSB, 0x00},
+	{WSA881X_SAMPLE_EDGE_SEL, 0x0C},
+	{WSA881X_SPARE_0, 0x00},
+	{WSA881X_SPARE_1, 0x00},
+	{WSA881X_SPARE_2, 0x00},
+	{WSA881X_OTP_REG_0, 0x01},
+	{WSA881X_OTP_REG_1, 0xFF},
+	{WSA881X_OTP_REG_2, 0xC0},
+	{WSA881X_OTP_REG_3, 0xFF},
+	{WSA881X_OTP_REG_4, 0xC0},
+	{WSA881X_OTP_REG_5, 0xFF},
+	{WSA881X_OTP_REG_6, 0xFF},
+	{WSA881X_OTP_REG_7, 0xFF},
+	{WSA881X_OTP_REG_8, 0xFF},
+	{WSA881X_OTP_REG_9, 0xFF},
+	{WSA881X_OTP_REG_10, 0xFF},
+	{WSA881X_OTP_REG_11, 0xFF},
+	{WSA881X_OTP_REG_12, 0xFF},
+	{WSA881X_OTP_REG_13, 0xFF},
+	{WSA881X_OTP_REG_14, 0xFF},
+	{WSA881X_OTP_REG_15, 0xFF},
+	{WSA881X_OTP_REG_16, 0xFF},
+	{WSA881X_OTP_REG_17, 0xFF},
+	{WSA881X_OTP_REG_18, 0xFF},
+	{WSA881X_OTP_REG_19, 0xFF},
+	{WSA881X_OTP_REG_20, 0xFF},
+	{WSA881X_OTP_REG_21, 0xFF},
+	{WSA881X_OTP_REG_22, 0xFF},
+	{WSA881X_OTP_REG_23, 0xFF},
+	{WSA881X_OTP_REG_24, 0x03},
+	{WSA881X_OTP_REG_25, 0x01},
+	{WSA881X_OTP_REG_26, 0x03},
+	{WSA881X_OTP_REG_27, 0x11},
+	{WSA881X_OTP_REG_28, 0xFF},
+	{WSA881X_OTP_REG_29, 0xFF},
+	{WSA881X_OTP_REG_30, 0xFF},
+	{WSA881X_OTP_REG_31, 0xFF},
+	{WSA881X_OTP_REG_63, 0x40},
+};
+
+const struct reg_default wsa881x_ana_reg_defaults_1[] = {
+	{WSA881X_BIAS_REF_CTRL - WSA881X_ANALOG_BASE, 0x6C},
+	{WSA881X_BIAS_TEST - WSA881X_ANALOG_BASE, 0x16},
+	{WSA881X_BIAS_BIAS - WSA881X_ANALOG_BASE, 0xF0},
+	{WSA881X_TEMP_OP - WSA881X_ANALOG_BASE, 0x00},
+	{WSA881X_TEMP_IREF_CTRL - WSA881X_ANALOG_BASE, 0x56},
+	{WSA881X_TEMP_ISENS_CTRL - WSA881X_ANALOG_BASE, 0x47},
+	{WSA881X_TEMP_CLK_CTRL - WSA881X_ANALOG_BASE, 0x87},
+	{WSA881X_TEMP_TEST - WSA881X_ANALOG_BASE, 0x00},
+	{WSA881X_TEMP_BIAS - WSA881X_ANALOG_BASE, 0x51},
+	{WSA881X_TEMP_ADC_CTRL - WSA881X_ANALOG_BASE, 0x00},
+	{WSA881X_TEMP_DOUT_MSB - WSA881X_ANALOG_BASE, 0x00},
+	{WSA881X_TEMP_DOUT_LSB - WSA881X_ANALOG_BASE, 0x00},
+	{WSA881X_ADC_EN_MODU_V - WSA881X_ANALOG_BASE, 0x00},
+	{WSA881X_ADC_EN_MODU_I - WSA881X_ANALOG_BASE, 0x00},
+	{WSA881X_ADC_EN_DET_TEST_V - WSA881X_ANALOG_BASE, 0x00},
+	{WSA881X_ADC_EN_DET_TEST_I - WSA881X_ANALOG_BASE, 0x00},
+	{WSA881X_ADC_SEL_IBIAS - WSA881X_ANALOG_BASE, 0x25},
+	{WSA881X_ADC_EN_SEL_IBIAS - WSA881X_ANALOG_BASE, 0x10},
+	{WSA881X_SPKR_DRV_EN - WSA881X_ANALOG_BASE, 0x74},
+	{WSA881X_SPKR_DRV_GAIN - WSA881X_ANALOG_BASE, 0x01},
+	{WSA881X_SPKR_DAC_CTL - WSA881X_ANALOG_BASE, 0x40},
+	{WSA881X_SPKR_DRV_DBG - WSA881X_ANALOG_BASE, 0x15},
+	{WSA881X_SPKR_PWRSTG_DBG - WSA881X_ANALOG_BASE, 0x00},
+	{WSA881X_SPKR_OCP_CTL - WSA881X_ANALOG_BASE, 0xD4},
+	{WSA881X_SPKR_CLIP_CTL - WSA881X_ANALOG_BASE, 0x90},
+	{WSA881X_SPKR_BBM_CTL - WSA881X_ANALOG_BASE, 0x00},
+	{WSA881X_SPKR_MISC_CTL1 - WSA881X_ANALOG_BASE, 0x80},
+	{WSA881X_SPKR_MISC_CTL2 - WSA881X_ANALOG_BASE, 0x00},
+	{WSA881X_SPKR_BIAS_INT - WSA881X_ANALOG_BASE, 0x56},
+	{WSA881X_SPKR_PA_INT - WSA881X_ANALOG_BASE, 0x54},
+	{WSA881X_SPKR_BIAS_CAL - WSA881X_ANALOG_BASE, 0xAC},
+	{WSA881X_SPKR_BIAS_PSRR - WSA881X_ANALOG_BASE, 0x54},
+	{WSA881X_SPKR_STATUS1 - WSA881X_ANALOG_BASE, 0x00},
+	{WSA881X_SPKR_STATUS2 - WSA881X_ANALOG_BASE, 0x00},
+	{WSA881X_BOOST_EN_CTL - WSA881X_ANALOG_BASE, 0x18},
+	{WSA881X_BOOST_CURRENT_LIMIT - WSA881X_ANALOG_BASE, 0x7A},
+	{WSA881X_BOOST_PS_CTL - WSA881X_ANALOG_BASE, 0xC0},
+	{WSA881X_BOOST_PRESET_OUT1 - WSA881X_ANALOG_BASE, 0x77},
+	{WSA881X_BOOST_PRESET_OUT2 - WSA881X_ANALOG_BASE, 0x70},
+	{WSA881X_BOOST_FORCE_OUT - WSA881X_ANALOG_BASE, 0x0E},
+	{WSA881X_BOOST_LDO_PROG - WSA881X_ANALOG_BASE, 0x16},
+	{WSA881X_BOOST_SLOPE_COMP_ISENSE_FB - WSA881X_ANALOG_BASE, 0x71},
+	{WSA881X_BOOST_RON_CTL - WSA881X_ANALOG_BASE, 0x0F},
+	{WSA881X_BOOST_LOOP_STABILITY - WSA881X_ANALOG_BASE, 0xAD},
+	{WSA881X_BOOST_ZX_CTL - WSA881X_ANALOG_BASE, 0x34},
+	{WSA881X_BOOST_START_CTL - WSA881X_ANALOG_BASE, 0x23},
+	{WSA881X_BOOST_MISC1_CTL - WSA881X_ANALOG_BASE, 0x80},
+	{WSA881X_BOOST_MISC2_CTL - WSA881X_ANALOG_BASE, 0x00},
+	{WSA881X_BOOST_MISC3_CTL - WSA881X_ANALOG_BASE, 0x00},
+	{WSA881X_BOOST_ATEST_CTL - WSA881X_ANALOG_BASE, 0x00},
+	{WSA881X_SPKR_PROT_FE_GAIN - WSA881X_ANALOG_BASE, 0x46},
+	{WSA881X_SPKR_PROT_FE_CM_LDO_SET - WSA881X_ANALOG_BASE, 0x3B},
+	{WSA881X_SPKR_PROT_FE_ISENSE_BIAS_SET1 - WSA881X_ANALOG_BASE, 0x8D},
+	{WSA881X_SPKR_PROT_FE_ISENSE_BIAS_SET2 - WSA881X_ANALOG_BASE, 0x8D},
+	{WSA881X_SPKR_PROT_ATEST1 - WSA881X_ANALOG_BASE, 0x01},
+	{WSA881X_SPKR_PROT_ATEST2 - WSA881X_ANALOG_BASE, 0x00},
+	{WSA881X_SPKR_PROT_FE_VSENSE_VCM - WSA881X_ANALOG_BASE, 0x8D},
+	{WSA881X_SPKR_PROT_FE_VSENSE_BIAS_SET1 - WSA881X_ANALOG_BASE, 0x4D},
+	{WSA881X_BONGO_RESRV_REG1 - WSA881X_ANALOG_BASE, 0x00},
+	{WSA881X_BONGO_RESRV_REG2 - WSA881X_ANALOG_BASE, 0x00},
+	{WSA881X_SPKR_PROT_SAR - WSA881X_ANALOG_BASE, 0x00},
+	{WSA881X_SPKR_STATUS3 - WSA881X_ANALOG_BASE, 0x00},
+};
+
+static const struct reg_sequence wsa881x_rev_2_0_dig[] = {
+	{WSA881X_RESET_CTL, 0x00},
+	{WSA881X_TADC_VALUE_CTL, 0x01},
+	{WSA881X_INTR_MASK, 0x1B},
+	{WSA881X_IOPAD_CTL, 0x00},
+	{WSA881X_OTP_REG_28, 0x3F},
+	{WSA881X_OTP_REG_29, 0x3F},
+	{WSA881X_OTP_REG_30, 0x01},
+	{WSA881X_OTP_REG_31, 0x01},
+};
+
+static const struct reg_sequence wsa881x_rev_2_0_ana[] = {
+	{WSA881X_TEMP_ADC_CTRL, 0x03},
+	{WSA881X_ADC_SEL_IBIAS, 0x45},
+	{WSA881X_SPKR_DRV_GAIN, 0xC1},
+	{WSA881X_SPKR_DAC_CTL, 0x42},
+	{WSA881X_SPKR_BBM_CTL, 0x02},
+	{WSA881X_SPKR_MISC_CTL1, 0x40},
+	{WSA881X_SPKR_MISC_CTL2, 0x07},
+	{WSA881X_SPKR_BIAS_INT, 0x5F},
+	{WSA881X_SPKR_BIAS_PSRR, 0x44},
+	{WSA881X_BOOST_PS_CTL, 0xA0},
+	{WSA881X_BOOST_PRESET_OUT1, 0xB7},
+	{WSA881X_BOOST_LOOP_STABILITY, 0x8D},
+	{WSA881X_SPKR_PROT_ATEST2, 0x02},
+	{WSA881X_BONGO_RESRV_REG1, 0x5E},
+	{WSA881X_BONGO_RESRV_REG2, 0x07},
+};
+
+static const struct reg_default wsa881x_rev_2_0_regmap_ana[] = {
+	{WSA881X_TEMP_ADC_CTRL - WSA881X_ANALOG_BASE, 0x03},
+	{WSA881X_ADC_SEL_IBIAS - WSA881X_ANALOG_BASE, 0x45},
+	{WSA881X_SPKR_DRV_GAIN - WSA881X_ANALOG_BASE, 0xC1},
+	{WSA881X_SPKR_DAC_CTL - WSA881X_ANALOG_BASE, 0x42},
+	{WSA881X_SPKR_BBM_CTL - WSA881X_ANALOG_BASE, 0x02},
+	{WSA881X_SPKR_MISC_CTL1 - WSA881X_ANALOG_BASE, 0x40},
+	{WSA881X_SPKR_MISC_CTL2 - WSA881X_ANALOG_BASE, 0x07},
+	{WSA881X_SPKR_BIAS_INT - WSA881X_ANALOG_BASE, 0x5F},
+	{WSA881X_SPKR_BIAS_PSRR - WSA881X_ANALOG_BASE, 0x44},
+	{WSA881X_BOOST_PS_CTL - WSA881X_ANALOG_BASE, 0xA0},
+	{WSA881X_BOOST_PRESET_OUT1 - WSA881X_ANALOG_BASE, 0xB7},
+	{WSA881X_BOOST_LOOP_STABILITY - WSA881X_ANALOG_BASE, 0x8D},
+	{WSA881X_SPKR_PROT_ATEST2 - WSA881X_ANALOG_BASE, 0x02},
+	{WSA881X_BONGO_RESRV_REG1 - WSA881X_ANALOG_BASE, 0x5E},
+	{WSA881X_BONGO_RESRV_REG2 - WSA881X_ANALOG_BASE, 0x07},
+};
+
+/**
+ * wsa881x_update_reg_defaults_2_0 - update default values of regs for v2.0
+ *
+ * wsa881x v2.0 has different default values for certain analog and digital
+ * registers compared to v1.x. Therefore, update the values of these registers
+ * with the values from tables defined above for v2.0.
+ */
+static void wsa881x_update_reg_defaults_2_0(void)
+{
+	int i, j;
+
+	for (i = 0; i < ARRAY_SIZE(wsa881x_rev_2_0_dig); i++) {
+		for (j = 0; j < ARRAY_SIZE(wsa881x_ana_reg_defaults); j++)
+			if (wsa881x_ana_reg_defaults[j].reg ==
+						wsa881x_rev_2_0_dig[i].reg)
+				wsa881x_ana_reg_defaults[j].def =
+						wsa881x_rev_2_0_dig[i].def;
+	}
+	for (i = 0; i < ARRAY_SIZE(wsa881x_rev_2_0_ana); i++) {
+		for (j = 0; j < ARRAY_SIZE(wsa881x_ana_reg_defaults); j++)
+			if (wsa881x_ana_reg_defaults[j].reg ==
+						wsa881x_rev_2_0_ana[i].reg)
+				wsa881x_ana_reg_defaults[j].def =
+						wsa881x_rev_2_0_ana[i].def;
+	}
+}
+
+/**
+ * wsa881x_update_regmap_2_0 - update regmap framework with new tables
+ * @regmap: pointer to wsa881x regmap structure
+ * @flag: indicates digital or analog wsa881x slave
+ *
+ * wsa881x v2.0 has some new registers for both analog and digital slaves.
+ * Update the regmap framework with all the new registers.
+ */
+static void wsa881x_update_regmap_2_0(struct regmap *regmap, int flag)
+{
+	u16 ret;
+
+	switch (flag) {
+	case DIGITAL:
+		ret = regmap_register_patch(regmap, wsa881x_rev_2_0_dig,
+					ARRAY_SIZE(wsa881x_rev_2_0_dig));
+		break;
+	case ANALOG:
+		ret = regmap_register_patch(regmap, wsa881x_rev_2_0_ana,
+					ARRAY_SIZE(wsa881x_rev_2_0_ana));
+		break;
+	default:
+		pr_debug("%s: unknown version", __func__);
+		ret = -EINVAL;
+		break;
+	}
+	if (ret)
+		pr_err("%s: failed to update regmap defaults ret=%d\n",
+			__func__, ret);
+}
+
+const struct regmap_config wsa881x_ana_regmap_config[] = {
+	{
+		.reg_bits = 8,
+		.val_bits = 8,
+		.cache_type = REGCACHE_NONE,
+		.reg_defaults = wsa881x_ana_reg_defaults_0,
+		.num_reg_defaults = ARRAY_SIZE(wsa881x_ana_reg_defaults_0),
+		.max_register = WSA881X_SPKR_STATUS3,
+		.volatile_reg = wsa881x_volatile_register,
+		.readable_reg = wsa881x_readable_register,
+		.reg_format_endian = REGMAP_ENDIAN_NATIVE,
+		.val_format_endian = REGMAP_ENDIAN_NATIVE,
+	},
+	{
+		.reg_bits = 8,
+		.val_bits = 8,
+		.cache_type = REGCACHE_NONE,
+		.reg_defaults = wsa881x_ana_reg_defaults_1,
+		.num_reg_defaults = ARRAY_SIZE(wsa881x_ana_reg_defaults_1),
+		.max_register = WSA881X_SPKR_STATUS3,
+		.volatile_reg = wsa881x_volatile_register,
+		.readable_reg = wsa881x_readable_register,
+		.reg_format_endian = REGMAP_ENDIAN_NATIVE,
+		.val_format_endian = REGMAP_ENDIAN_NATIVE,
+	}
+};
+
+static const struct i2c_device_id wsa881x_i2c_id[];
+
+static const int delay_array_msec[] = {10, 20, 30, 40, 50};
+
+static const char * const wsa881x_spk_pa_gain_text[] = {
+"POS_13P5_DB", "POS_12_DB", "POS_10P5_DB", "POS_9_DB", "POS_7P5_DB",
+"POS_6_DB", "POS_4P5_DB", "POS_3_DB", "POS_1P5_DB", "POS_0_DB"};
+
+static const struct soc_enum wsa881x_spk_pa_gain_enum[] = {
+		SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(wsa881x_spk_pa_gain_text),
+				    wsa881x_spk_pa_gain_text),
+};
+
+static int wsa881x_spk_pa_gain_get(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+			snd_soc_kcontrol_component(kcontrol);
+	struct wsa881x_priv *wsa881x =
+			snd_soc_component_get_drvdata(component);
+
+	ucontrol->value.integer.value[0] = wsa881x->spk_pa_gain;
+	return 0;
+}
+
+static int wsa881x_spk_pa_gain_put(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+			snd_soc_kcontrol_component(kcontrol);
+	struct wsa881x_priv *wsa881x =
+			snd_soc_component_get_drvdata(component);
+
+	if (ucontrol->value.integer.value[0] < 0 ||
+		ucontrol->value.integer.value[0] > 0xC) {
+		dev_err(component->dev, "unsupported gain val %ld\n",
+			ucontrol->value.integer.value[0]);
+		return -EINVAL;
+	}
+	wsa881x->spk_pa_gain = ucontrol->value.integer.value[0];
+	return 0;
+}
+
+/* Helpers to figure out which regmap or client contains the register */
+static struct regmap *find_regmap(struct wsa881x_priv *wsa881x, u16 reg)
+{
+	if (reg >= WSA881X_ANALOG_BASE)
+		return wsa881x->regmap_analog;
+	else
+		return wsa881x->regmap;
+}
+
+static int find_client_index(u16 reg)
+{
+	return reg >= WSA881X_ANALOG_BASE ? ANALOG : DIGITAL;
+}
+
+static int wsa881x_i2c_write_device(struct wsa881x_priv *wsa881x,
+				    unsigned int reg, unsigned int val)
+{
+	struct regmap *wsa881x_regmap;
+	struct i2c_msg *msg;
+	int bytes = 1;
+	int ret, i, index;
+	u8 reg_addr = 0;
+	u8 data[2];
+
+	if (wsa881x->regmap_flag) {
+		wsa881x_regmap = find_regmap(wsa881x, reg);
+		ret = regmap_write(wsa881x_regmap, reg, val);
+		for (i = 0; ret && i < ARRAY_SIZE(delay_array_msec); i++) {
+			dev_err_ratelimited(wsa881x->dev,
+					    "failed writing reg=%x-retry(%d)\n",
+					    reg, i);
+			/* retry after delay of increasing order */
+			msleep(delay_array_msec[i]);
+			ret = regmap_write(wsa881x_regmap, reg, val);
+		}
+		if (ret)
+			dev_err_ratelimited(wsa881x->dev,
+					    "failed writing reg=%x ret=%d\n",
+					    reg, ret);
+		else
+			dev_dbg(wsa881x->dev, "wrote reg=%x val=%x\n",
+				reg, val);
+	} else {
+		index = find_client_index(reg);
+		reg_addr = (u8)reg;
+		msg = &wsa881x->xfer_msg[0];
+		msg->addr = wsa881x->client[index]->addr;
+		msg->len = bytes + 1;
+		msg->flags = 0;
+		data[0] = reg;
+		data[1] = (u8)val;
+		msg->buf = data;
+
+		ret = i2c_transfer(wsa881x->client[index]->adapter,
+				   wsa881x->xfer_msg, 1);
+		/* Try again if the write fails */
+		if (ret != 1) {
+			pr_err("write failed\n");
+			ret = i2c_transfer(wsa881x->client[index]->adapter,
+					   wsa881x->xfer_msg, 1);
+			if (ret != 1) {
+				dev_err_ratelimited(wsa881x->dev,
+						    "failed i2c transfer\n");
+				return ret;
+			}
+		}
+		dev_dbg(wsa881x->dev, "wrote reg=%x val=%x\n", reg, data[1]);
+	}
+	return ret;
+}
+
+static int wsa881x_i2c_read_device(struct wsa881x_priv *wsa881x,
+					    unsigned int reg)
+{
+	struct regmap *wsa881x_regmap;
+	struct i2c_msg *msg;
+	unsigned int val;
+	int ret, i, index;
+	u8 reg_addr = 0;
+	u8 dest[5] = {0};
+
+	if (wsa881x->regmap_flag) {
+		wsa881x_regmap = find_regmap(wsa881x, reg);
+		if (!wsa881x_regmap) {
+			dev_err_ratelimited(wsa881x->dev,
+					    "invalid register to read\n");
+			return -EINVAL;
+		}
+		ret = regmap_read(wsa881x_regmap, reg, &val);
+		for (i = 0; ret && i < ARRAY_SIZE(delay_array_msec); i++) {
+			dev_err_ratelimited(wsa881x->dev,
+					    "failed to read reg=%x-retry(%d)\n",
+					    reg, i);
+			/* retry after delay of increasing order */
+			msleep(delay_array_msec[i]);
+			ret = regmap_read(wsa881x_regmap, reg, &val);
+		}
+		if (ret) {
+			dev_err_ratelimited(wsa881x->dev,
+					    "failed to read reg=%x ret=%d\n",
+					    reg, ret);
+			return ret;
+		}
+		dev_dbg(wsa881x->dev, "read success, reg=%x val=%x\n",
+			reg, val);
+	} else {
+		index = find_client_index(reg);
+		reg_addr = (u8)reg;
+		msg = &wsa881x->xfer_msg[0];
+		msg->addr = wsa881x->client[index]->addr;
+		msg->len = 1;
+		msg->flags = 0;
+		msg->buf = &reg_addr;
+
+		msg = &wsa881x->xfer_msg[1];
+		msg->addr = wsa881x->client[index]->addr;
+		msg->len = 1;
+		msg->flags = I2C_M_RD;
+		msg->buf = dest;
+
+		ret = i2c_transfer(wsa881x->client[index]->adapter,
+				   wsa881x->xfer_msg, 2);
+		/* Try again if read fails first time */
+		if (ret != 2) {
+			ret = i2c_transfer(wsa881x->client[index]->adapter,
+					   wsa881x->xfer_msg, 2);
+			if (ret != 2) {
+				dev_err_ratelimited(wsa881x->dev,
+						    "failed to read reg=%d\n",
+						    reg);
+				return ret;
+			}
+		}
+		val = dest[0];
+	}
+	return val;
+}
+
+static unsigned int wsa881x_i2c_read(struct snd_soc_component *component,
+				     unsigned int reg)
+{
+	struct wsa881x_priv *wsa881x;
+	int retval;
+
+	wsa881x = snd_soc_component_get_drvdata(component);
+
+	retval = wsa881x_i2c_read_device(wsa881x, reg);
+
+	return retval >= 0 ? retval : 0;
+}
+
+static int wsa881x_i2c_write(struct snd_soc_component *component,
+			     unsigned int reg, unsigned int val)
+{
+	struct wsa881x_priv *wsa881x;
+
+	wsa881x = snd_soc_component_get_drvdata(component);
+
+	return wsa881x_i2c_write_device(wsa881x, reg, val);
+}
+
+static int wsa881x_boost_ctrl(struct snd_soc_component *component, bool enable)
+{
+	struct wsa881x_priv *wsa881x =
+			snd_soc_component_get_drvdata(component);
+
+	if (enable) {
+		if (!WSA881X_IS_2_0(wsa881x->version)) {
+			snd_soc_component_update_bits(component,
+						WSA881X_ANA_CTL, 0x01, 0x01);
+			snd_soc_component_update_bits(component,
+						WSA881X_ANA_CTL, 0x04, 0x04);
+			snd_soc_component_update_bits(component,
+						WSA881X_BOOST_PS_CTL,
+						0x40, 0x00);
+			snd_soc_component_update_bits(component,
+						WSA881X_BOOST_PRESET_OUT1,
+						0xF0, 0xB0);
+			snd_soc_component_update_bits(component,
+						WSA881X_BOOST_ZX_CTL,
+						0x20, 0x00);
+			snd_soc_component_update_bits(component,
+						WSA881X_BOOST_EN_CTL,
+						0x80, 0x80);
+		} else {
+			snd_soc_component_update_bits(component,
+						WSA881X_BOOST_LOOP_STABILITY,
+						0x03, 0x03);
+			snd_soc_component_update_bits(component,
+						WSA881X_BOOST_MISC2_CTL,
+						0xFF, 0x14);
+			snd_soc_component_update_bits(component,
+						WSA881X_BOOST_START_CTL,
+						0x80, 0x80);
+			snd_soc_component_update_bits(component,
+						WSA881X_BOOST_START_CTL,
+						0x03, 0x00);
+			snd_soc_component_update_bits(component,
+					WSA881X_BOOST_SLOPE_COMP_ISENSE_FB,
+					0x0C, 0x04);
+			snd_soc_component_update_bits(component,
+					WSA881X_BOOST_SLOPE_COMP_ISENSE_FB,
+					0x03, 0x00);
+			if (snd_soc_component_read(component, WSA881X_OTP_REG_0))
+				snd_soc_component_update_bits(component,
+					WSA881X_BOOST_PRESET_OUT1,
+					0xF0, 0x70);
+			else
+				snd_soc_component_update_bits(component,
+					WSA881X_BOOST_PRESET_OUT1,
+					0xF0, 0xB0);
+			snd_soc_component_update_bits(component,
+						WSA881X_ANA_CTL, 0x03, 0x01);
+			snd_soc_component_update_bits(component,
+						WSA881X_SPKR_DRV_EN,
+						0x08, 0x08);
+			snd_soc_component_update_bits(component,
+						WSA881X_ANA_CTL, 0x04, 0x04);
+			snd_soc_component_update_bits(component,
+						WSA881X_BOOST_CURRENT_LIMIT,
+						0x0F, 0x08);
+			snd_soc_component_update_bits(component,
+						WSA881X_BOOST_EN_CTL,
+						0x80, 0x80);
+		}
+		/* For WSA8810, start-up time is 1500us as per qcrg sequence */
+		usleep_range(1500, 1510);
+	} else {
+		/* ENSURE: Class-D amp is shutdown. CLK is still on */
+		snd_soc_component_update_bits(component, WSA881X_BOOST_EN_CTL,
+					      0x80, 0x00);
+		/* boost settle time is 1500us as per qcrg sequence */
+		usleep_range(1500, 1510);
+	}
+	return 0;
+}
+
+static void wsa881x_bandgap_ctrl(struct snd_soc_component *component,
+				 bool enable)
+{
+	if (enable) {
+		snd_soc_component_update_bits(component, WSA881X_TEMP_OP,
+					      0x08, 0x08);
+		/* 400usec sleep is needed as per HW requirement */
+		usleep_range(400, 410);
+		snd_soc_component_update_bits(component, WSA881X_TEMP_OP,
+					      0x04, 0x04);
+	} else {
+		snd_soc_component_update_bits(component, WSA881X_TEMP_OP,
+					      0x04, 0x00);
+		snd_soc_component_update_bits(component, WSA881X_TEMP_OP,
+					      0x08, 0x00);
+	}
+}
+
+static void wsa881x_clk_ctrl(struct snd_soc_component *component, bool enable)
+{
+	struct wsa881x_priv *wsa881x =
+				snd_soc_component_get_drvdata(component);
+
+	if (enable) {
+		snd_soc_component_write(component,
+					WSA881X_CDC_RST_CTL, 0x02);
+		snd_soc_component_write(component,
+					WSA881X_CDC_RST_CTL, 0x03);
+		snd_soc_component_write(component,
+					WSA881X_CLOCK_CONFIG, 0x01);
+
+		snd_soc_component_write(component,
+					WSA881X_CDC_DIG_CLK_CTL, 0x01);
+		snd_soc_component_write(component,
+					WSA881X_CDC_ANA_CLK_CTL, 0x01);
+	} else {
+		snd_soc_component_write(component,
+					WSA881X_CDC_ANA_CLK_CTL, 0x00);
+		snd_soc_component_write(component,
+					WSA881X_CDC_DIG_CLK_CTL, 0x00);
+		if (WSA881X_IS_2_0(wsa881x->version))
+			snd_soc_component_update_bits(component,
+					WSA881X_CDC_TOP_CLK_CTL, 0x01, 0x00);
+	}
+}
+
+static int wsa881x_rdac_ctrl(struct snd_soc_component *component, bool enable)
+{
+	struct wsa881x_priv *wsa881x =
+				snd_soc_component_get_drvdata(component);
+
+	if (enable) {
+		snd_soc_component_update_bits(component,
+					WSA881X_ANA_CTL, 0x08, 0x00);
+		snd_soc_component_update_bits(component,
+					WSA881X_SPKR_DRV_GAIN, 0x08, 0x08);
+		snd_soc_component_update_bits(component,
+					WSA881X_SPKR_DAC_CTL, 0x20, 0x20);
+		snd_soc_component_update_bits(component,
+					WSA881X_SPKR_DAC_CTL, 0x20, 0x00);
+		snd_soc_component_update_bits(component,
+					WSA881X_SPKR_DAC_CTL, 0x40, 0x40);
+		snd_soc_component_update_bits(component,
+					WSA881X_SPKR_DAC_CTL, 0x80, 0x80);
+		if (WSA881X_IS_2_0(wsa881x->version)) {
+			snd_soc_component_update_bits(component,
+					WSA881X_SPKR_BIAS_CAL, 0x01, 0x01);
+			snd_soc_component_update_bits(component,
+					WSA881X_SPKR_OCP_CTL, 0x30, 0x30);
+			snd_soc_component_update_bits(component,
+					WSA881X_SPKR_OCP_CTL, 0x0C, 0x00);
+		}
+		snd_soc_component_update_bits(component,
+					WSA881X_SPKR_DRV_GAIN, 0xF0, 0x40);
+		snd_soc_component_update_bits(component,
+					WSA881X_SPKR_MISC_CTL1, 0x01, 0x01);
+	} else {
+		/* Ensure class-D amp is off */
+		snd_soc_component_update_bits(component,
+					WSA881X_SPKR_DAC_CTL, 0x80, 0x00);
+	}
+	return 0;
+}
+
+static int wsa881x_spkr_pa_ctrl(struct snd_soc_component *component,
+				bool enable)
+{
+	struct wsa881x_priv *wsa881x =
+				snd_soc_component_get_drvdata(component);
+
+	if (enable) {
+		/*
+		 * Ensure: Boost is enabled and stable, Analog input is up
+		 * and outputting silence
+		 */
+		if (!WSA881X_IS_2_0(wsa881x->version)) {
+			snd_soc_component_update_bits(component,
+						WSA881X_ADC_EN_DET_TEST_I,
+						0xFF, 0x01);
+			snd_soc_component_update_bits(component,
+						WSA881X_ADC_EN_MODU_V,
+						0x02, 0x02);
+			snd_soc_component_update_bits(component,
+						WSA881X_ADC_EN_DET_TEST_V,
+						0xFF, 0x10);
+			snd_soc_component_update_bits(component,
+						WSA881X_SPKR_PWRSTG_DBG,
+						0xA0, 0xA0);
+			snd_soc_component_update_bits(component,
+						WSA881X_SPKR_DRV_EN,
+						0x80, 0x80);
+			usleep_range(700, 710);
+			snd_soc_component_update_bits(component,
+						WSA881X_SPKR_PWRSTG_DBG,
+						0x00, 0x00);
+			snd_soc_component_update_bits(component,
+						WSA881X_ADC_EN_DET_TEST_V,
+						0xFF, 0x00);
+			snd_soc_component_update_bits(component,
+						WSA881X_ADC_EN_MODU_V,
+						0x02, 0x00);
+			snd_soc_component_update_bits(component,
+						WSA881X_ADC_EN_DET_TEST_I,
+						0xFF, 0x00);
+		} else
+			snd_soc_component_update_bits(component,
+					WSA881X_SPKR_DRV_EN, 0x80, 0x80);
+		/* add 1000us delay as per qcrg */
+		usleep_range(1000, 1010);
+		snd_soc_component_update_bits(component,
+					WSA881X_SPKR_DRV_EN, 0x01, 0x01);
+		if (WSA881X_IS_2_0(wsa881x->version))
+			snd_soc_component_update_bits(component,
+						WSA881X_SPKR_BIAS_CAL,
+						0x01, 0x00);
+		usleep_range(1000, 1010);
+		snd_soc_component_update_bits(component,
+					WSA881X_SPKR_DRV_GAIN,
+					0xF0, (wsa881x->spk_pa_gain << 4));
+	} else {
+		/*
+		 * Ensure: Boost is still on, Stream from Analog input and
+		 * Speaker Protection has been stopped and input is at 0V
+		 */
+		if (WSA881X_IS_2_0(wsa881x->version)) {
+			snd_soc_component_update_bits(component,
+						WSA881X_SPKR_BIAS_CAL,
+						0x01, 0x01);
+			usleep_range(1000, 1010);
+			snd_soc_component_update_bits(component,
+						WSA881X_SPKR_BIAS_CAL,
+						0x01, 0x00);
+			msleep(20);
+			snd_soc_component_update_bits(component,
+						WSA881X_ANA_CTL, 0x03, 0x00);
+			usleep_range(200, 210);
+		}
+		snd_soc_component_update_bits(component,
+					WSA881X_SPKR_DRV_EN, 0x80, 0x00);
+	}
+	return 0;
+}
+
+static int wsa881x_get_boost(struct snd_kcontrol *kcontrol,
+			       struct snd_ctl_elem_value *ucontrol)
+{
+
+	struct snd_soc_component *component =
+					snd_soc_kcontrol_component(kcontrol);
+	struct wsa881x_priv *wsa881x =
+				snd_soc_component_get_drvdata(component);
+
+	ucontrol->value.integer.value[0] = wsa881x->boost_enable;
+	return 0;
+}
+
+static int wsa881x_set_boost(struct snd_kcontrol *kcontrol,
+			       struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+					snd_soc_kcontrol_component(kcontrol);
+	struct wsa881x_priv *wsa881x =
+				snd_soc_component_get_drvdata(component);
+	int value = ucontrol->value.integer.value[0];
+
+	wsa881x->boost_enable = value;
+	return 0;
+}
+
+static const struct snd_kcontrol_new wsa881x_snd_controls[] = {
+	SOC_SINGLE_EXT("BOOST Switch", SND_SOC_NOPM, 0, 1, 0,
+		wsa881x_get_boost, wsa881x_set_boost),
+
+	SOC_ENUM_EXT("WSA_SPK PA Gain", wsa881x_spk_pa_gain_enum[0],
+		wsa881x_spk_pa_gain_get, wsa881x_spk_pa_gain_put),
+};
+
+static const char * const rdac_text[] = {
+	"ZERO", "Switch",
+};
+
+static const struct soc_enum rdac_enum =
+	SOC_ENUM_SINGLE(SND_SOC_NOPM, 0, ARRAY_SIZE(rdac_text), rdac_text);
+
+static const struct snd_kcontrol_new rdac_mux[] = {
+	SOC_DAPM_ENUM("RDAC", rdac_enum)
+};
+
+static int wsa881x_rdac_event(struct snd_soc_dapm_widget *w,
+			      struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component =
+					snd_soc_dapm_to_component(w->dapm);
+	struct wsa881x_priv *wsa881x =
+				snd_soc_component_get_drvdata(component);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		wsa881x_clk_ctrl(component, true);
+		snd_soc_component_update_bits(component, WSA881X_SPKR_DAC_CTL,
+					      0x02, 0x02);
+		if (!WSA881X_IS_2_0(wsa881x->version))
+			snd_soc_component_update_bits(component,
+						WSA881X_BIAS_REF_CTRL,
+						0x0F, 0x08);
+		wsa881x_bandgap_ctrl(component, true);
+		if (!WSA881X_IS_2_0(wsa881x->version))
+			snd_soc_component_update_bits(component,
+						      WSA881X_SPKR_BBM_CTL,
+						      0x02, 0x02);
+		snd_soc_component_update_bits(component, WSA881X_SPKR_MISC_CTL1,
+					      0xC0, 0x80);
+		snd_soc_component_update_bits(component, WSA881X_SPKR_MISC_CTL1,
+					      0x06, 0x06);
+		if (!WSA881X_IS_2_0(wsa881x->version)) {
+			snd_soc_component_update_bits(component,
+					WSA881X_SPKR_MISC_CTL2,
+					0x04, 0x04);
+			snd_soc_component_update_bits(component,
+					WSA881X_SPKR_BIAS_INT,
+					0x09, 0x09);
+		}
+		snd_soc_component_update_bits(component, WSA881X_SPKR_PA_INT,
+					      0xF0, 0x20);
+		if (WSA881X_IS_2_0(wsa881x->version))
+			snd_soc_component_update_bits(component,
+					WSA881X_SPKR_PA_INT,
+					0x0E, 0x0E);
+		if (wsa881x->boost_enable)
+			wsa881x_boost_ctrl(component, true);
+		break;
+	case SND_SOC_DAPM_POST_PMU:
+		wsa881x_rdac_ctrl(component, true);
+		break;
+	case SND_SOC_DAPM_PRE_PMD:
+		wsa881x_rdac_ctrl(component, false);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		if (wsa881x->boost_enable)
+			wsa881x_boost_ctrl(component, false);
+		wsa881x_clk_ctrl(component, false);
+		wsa881x_bandgap_ctrl(component, false);
+
+		break;
+	default:
+		dev_err(component->dev, "invalid event:%d\n", event);
+		return -EINVAL;
+	}
+	return 0;
+}
+
+static int wsa881x_spkr_pa_event(struct snd_soc_dapm_widget *w,
+			struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component =
+					snd_soc_dapm_to_component(w->dapm);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		snd_soc_component_update_bits(component, WSA881X_SPKR_OCP_CTL,
+					      0xC0, 0x80);
+		break;
+	case SND_SOC_DAPM_POST_PMU:
+		wsa881x_spkr_pa_ctrl(component, true);
+		break;
+	case SND_SOC_DAPM_PRE_PMD:
+		wsa881x_spkr_pa_ctrl(component, false);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		snd_soc_component_update_bits(component, WSA881X_SPKR_OCP_CTL,
+					      0xC0, 0xC0);
+		break;
+	default:
+		dev_err(component->dev, "invalid event:%d\n", event);
+		return -EINVAL;
+	}
+	return 0;
+}
+
+static const struct snd_soc_dapm_widget wsa881x_dapm_widgets[] = {
+	SND_SOC_DAPM_INPUT("WSA_IN"),
+
+	SND_SOC_DAPM_DAC_E("RDAC Analog", NULL, SND_SOC_NOPM, 0, 0,
+		wsa881x_rdac_event,
+		SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+		SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
+
+	SND_SOC_DAPM_MUX("WSA_RDAC", SND_SOC_NOPM, 0, 0,
+		rdac_mux),
+
+	SND_SOC_DAPM_PGA_S("WSA_SPKR PGA", 1, SND_SOC_NOPM, 0, 0,
+			wsa881x_spkr_pa_event,
+			SND_SOC_DAPM_PRE_PMU |
+			SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD |
+			SND_SOC_DAPM_POST_PMD),
+
+	SND_SOC_DAPM_OUTPUT("WSA_SPKR"),
+};
+
+static const struct snd_soc_dapm_route wsa881x_audio_map[] = {
+	{"WSA_RDAC", "Switch", "WSA_IN"},
+	{"RDAC Analog", NULL, "WSA_RDAC"},
+	{"WSA_SPKR PGA", NULL, "RDAC Analog"},
+	{"WSA_SPKR", NULL, "WSA_SPKR PGA"},
+};
+
+static int wsa881x_probe(struct snd_soc_component *component)
+{
+	struct wsa881x_priv *wsa881x = snd_soc_component_get_drvdata(component);
+
+	wsa881x->component = component;
+	wsa881x->spk_pa_gain = SPK_GAIN_12DB;
+
+	return 0;
+}
+
+static const struct snd_soc_dai_ops wsa881x_dai_ops = {
+	.set_stream = wsa881x_set_stream,
+	.mute_stream = wsa881x_digital_mute,
+	.mute_unmute_on_trigger = false,
+};
+
+static const struct snd_soc_component_driver soc_codec_dev_wsa881x = {
+	.probe = wsa881x_probe,
+	.read = wsa881x_i2c_read,
+	.write = wsa881x_i2c_write,
+	.controls = wsa881x_snd_controls,
+	.num_controls = ARRAY_SIZE(wsa881x_snd_controls),
+	.dapm_widgets = wsa881x_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(wsa881x_dapm_widgets),
+	.dapm_routes = wsa881x_audio_map,
+	.num_dapm_routes = ARRAY_SIZE(wsa881x_audio_map),
+};
+
+static const struct snd_soc_dai_driver wsa_dai[] = {
+	{
+		.name = "wsa_rx0",
+		.id = 0,
+		.playback = {
+			.stream_name = "",
+			.rates = WSA881X_RATES | WSA881X_FRAC_RATES,
+			.formats = WSA881X_FORMATS,
+			.rate_max = 384000,
+			.rate_min = 8000,
+			.channels_min = 1,
+			.channels_max = 1,
+		},
+		.ops = &wsa881x_dai_ops,
+	},
+};
+
+static int check_wsa881x_presence(struct wsa881x_priv *wsa881x)
+{
+	struct i2c_client *client = wsa881x->client[DIGITAL];
+	int ret;
+
+	ret = wsa881x_i2c_read_device(wsa881x, WSA881X_CDC_RST_CTL);
+	if (ret < 0) {
+		dev_err(&client->dev, "failed to read from addr=%x\n",
+			client->addr);
+		return ret;
+	}
+
+	ret = wsa881x_i2c_write_device(wsa881x, WSA881X_CDC_RST_CTL, 0x01);
+	if (ret < 0) {
+		dev_err(&client->dev, "failed write addr=%x reg:0x5 val:0x1\n",
+			client->addr);
+		return ret;
+	}
+
+	/* allow 20ms before trigger next write to verify wsa881x presence */
+	msleep(20);
+	ret = wsa881x_i2c_write_device(wsa881x, WSA881X_CDC_RST_CTL, 0x00);
+	if (ret < 0) {
+		dev_err(&client->dev, "failed write addr=%x reg:0x5 val:0x0\n",
+			client->addr);
+		return ret;
+	}
+	return ret;
+}
+
+static int wsa881x_i2c_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct wsa881x_priv *wsa881x;
+	int leftright;
+	int ret;
+
+	ret = wsa881x_probe_common(&wsa881x, dev);
+	if (ret)
+		return ret;
+
+	wsa881x->mclk_pin = devm_gpiod_get(dev, "mclk",
+					   GPIOD_FLAGS_BIT_NONEXCLUSIVE);
+	if (IS_ERR(wsa881x->mclk_pin))
+		dev_err_probe(dev, PTR_ERR(wsa881x->mclk_pin),
+			      "MCLK GPIO not found\n");
+
+	wsa881x->wsa_mclk = devm_clk_get_enabled(&client->dev, NULL);
+	if (IS_ERR(wsa881x->wsa_mclk))
+		return dev_err_probe(dev, PTR_ERR(wsa881x->wsa_mclk),
+				     "failed to get mclk\n");
+	gpiod_direction_output(wsa881x->mclk_pin, 1);
+	clk_set_rate(wsa881x->wsa_mclk, 9600000);
+
+	wsa881x->client[DIGITAL] = client;
+	ret = check_wsa881x_presence(wsa881x);
+	if (ret < 0) {
+		dev_err(&client->dev,
+			"failed to ping wsa with addr:%x, ret = %d\n",
+			client->addr, ret);
+		return -ENODEV;
+	}
+
+	wsa881x->regmap = devm_regmap_init_i2c(client,
+					&wsa881x_ana_regmap_config[DIGITAL]);
+	if (IS_ERR(wsa881x->regmap)) {
+		dev_err(dev, "digital regmap init failed %d\n", ret);
+		return PTR_ERR(wsa881x->regmap);
+	}
+	regcache_cache_bypass(wsa881x->regmap, true);
+
+	wsa881x_init_common(wsa881x);
+
+	wsa881x->version = wsa881x_i2c_read_device(wsa881x, WSA881X_CHIP_ID1);
+	if (wsa881x->version == WSA881X_2_0) {
+		wsa881x_update_reg_defaults_2_0();
+		wsa881x_update_regmap_2_0(wsa881x->regmap, DIGITAL);
+	}
+
+	/*
+	 * If we reached this point, then device is present and we're good to
+	 * go to initialise analog part of the amplifier
+	 */
+	wsa881x->client[ANALOG] = devm_i2c_new_dummy_device(&client->dev,
+							    client->adapter,
+					client->addr + I2C_ANALOG_OFFSET);
+	if (IS_ERR(wsa881x->client[ANALOG])) {
+		dev_err(dev,
+			"failed to register i2c device for analog part\n");
+		return PTR_ERR(wsa881x->client[ANALOG]);
+	}
+
+	wsa881x->regmap_analog = devm_regmap_init_i2c(wsa881x->client[ANALOG],
+					&wsa881x_ana_regmap_config[ANALOG]);
+	if (IS_ERR(wsa881x->regmap_analog)) {
+		dev_err(dev, "analog regmap init failed %d\n", ret);
+		return PTR_ERR(wsa881x->regmap_analog);
+	}
+	regcache_cache_bypass(wsa881x->regmap_analog, true);
+
+	wsa881x->client[ANALOG]->dev.platform_data = wsa881x;
+	i2c_set_clientdata(wsa881x->client[ANALOG], wsa881x);
+	wsa881x->regmap_flag = true;
+
+	if (wsa881x->version == WSA881X_2_0)
+		wsa881x_update_regmap_2_0(wsa881x->regmap_analog, ANALOG);
+	/* finished initialising analog part */
+
+	leftright = wsa881x_i2c_read_device(wsa881x, WSA881X_BUS_ID) & 0x1;
+
+	wsa881x->driver = devm_kmemdup(dev, &soc_codec_dev_wsa881x,
+				       sizeof(*wsa881x->driver), GFP_KERNEL);
+	if (!wsa881x->driver)
+		return -ENOMEM;
+
+	wsa881x->dai_driver = devm_kmemdup(dev, wsa_dai,
+					   sizeof(struct snd_soc_dai_driver),
+					   GFP_KERNEL);
+	if (!wsa881x->dai_driver)
+		return -ENOMEM;
+
+	wsa881x->driver->name = devm_kasprintf(dev, GFP_KERNEL, "wsa-codec%d",
+					       leftright);
+	if (!wsa881x->driver->name)
+		return -ENOMEM;
+
+	wsa881x->dai_driver->name = devm_kasprintf(dev, GFP_KERNEL,
+						   "wsa_rx%d", leftright);
+	if (!wsa881x->dai_driver->name)
+		return -ENOMEM;
+
+	wsa881x->dai_driver->playback.stream_name = devm_kasprintf(dev,
+					GFP_KERNEL, "WSA881X_AIF%d Playback",
+					leftright);
+	if (!wsa881x->dai_driver->playback.stream_name)
+		return -ENOMEM;
+
+	pm_runtime_set_autosuspend_delay(dev, 3000);
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_set_active(dev);
+	pm_runtime_enable(dev);
+
+	return devm_snd_soc_register_component(dev,
+					       wsa881x->driver,
+					       wsa881x->dai_driver,
+					       ARRAY_SIZE(wsa_dai));
+}
+
+static int __maybe_unused wsa881x_i2c_suspend(struct device *dev)
+{
+	struct wsa881x_priv *wsa881x = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(wsa881x->wsa_mclk);
+
+	gpiod_direction_output(wsa881x->sd_n, wsa881x->sd_n_val);
+
+	return 0;
+}
+
+static int __maybe_unused wsa881x_i2c_resume(struct device *dev)
+{
+	struct wsa881x_priv *wsa881x = dev_get_drvdata(dev);
+	int ret;
+
+	gpiod_direction_output(wsa881x->sd_n, !wsa881x->sd_n_val);
+
+	gpiod_direction_output(wsa881x->mclk_pin, 1);
+	ret = clk_prepare_enable(wsa881x->wsa_mclk);
+	if (ret) {
+		dev_err(wsa881x->dev, "mclk enable failed\n");
+		return ret;
+	}
+
+	wsa881x_init_common(wsa881x);
+
+	return 0;
+}
+
+static const struct dev_pm_ops wsa881x_i2c_pm_ops = {
+	SET_RUNTIME_PM_OPS(wsa881x_i2c_suspend, wsa881x_i2c_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(wsa881x_i2c_suspend, wsa881x_i2c_resume)
+};
+
+static const struct i2c_device_id wsa881x_i2c_id[] = {
+	{"qcom,wsa8810"},
+	{"qcom,wsa8815"},
+	{}
+};
+
+MODULE_DEVICE_TABLE(i2c, wsa881x_i2c_id);
+
+static const struct of_device_id wsa881x_i2c_driver_table[] = {
+	{.compatible = "qcom,wsa8810"},
+	{.compatible = "qcom,wsa8815"},
+	{}
+};
+MODULE_DEVICE_TABLE(of, wsa881x_i2c_driver_table);
+
+static struct i2c_driver wsa881x_i2c_driver = {
+	.driver = {
+		.name = "wsa881x-i2c-codec",
+		.pm = &wsa881x_i2c_pm_ops,
+		.of_match_table = wsa881x_i2c_driver_table,
+	},
+	.id_table = wsa881x_i2c_id,
+	.probe = wsa881x_i2c_probe,
+};
+
+module_i2c_driver(wsa881x_i2c_driver);
+MODULE_DESCRIPTION("WSA881x Codec driver for Analog mode");
+MODULE_LICENSE("GPL");

-- 
2.47.2


