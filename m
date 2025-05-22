Return-Path: <linux-gpio+bounces-20492-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE4FAC1264
	for <lists+linux-gpio@lfdr.de>; Thu, 22 May 2025 19:42:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4890E502429
	for <lists+linux-gpio@lfdr.de>; Thu, 22 May 2025 17:42:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D75B29B21C;
	Thu, 22 May 2025 17:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U67657my"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8501A19DF61
	for <linux-gpio@vger.kernel.org>; Thu, 22 May 2025 17:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747935669; cv=none; b=W0PmP2uItndFIfv2jlDKPIIm3uxgRNArotbKhWLuOikb7Q/zfpHa1yH1H/X9bJs2rhDqcWNQOnm6aty4cc7PuMhSOMxmsV61S7hQpO4MLdu6rybCH+RoYY1+E1BNUmPtR6aUTbI+/7Gx3w32kO8x2jRgG7+HjpEgUVmTvrx37Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747935669; c=relaxed/simple;
	bh=fPeiwkJEvTsUTG5WQ9JfF0FBhiV69gi5BOKvZH9sFZM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AE6bl2BqBbXpHlYZNby7Xoj4VMJxxFZcbDBakcUKEBC2KuAuV/cyqzCKJo24YcKvtuDZmZKmhYRcPaE4p8DDfz+JsOp7H+egdMZ6lERAuoz6mx5lf0UEzKvl5+0mt9crOAhAkpR0DP0G665S6c/6sl6Or0FjpXjD00Adw45NtyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U67657my; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a367ec7840so3874014f8f.2
        for <linux-gpio@vger.kernel.org>; Thu, 22 May 2025 10:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747935660; x=1748540460; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TeAr8EL4oQPui+hhD2XCvPKkHcTv/J6VsW9NNOgXhKQ=;
        b=U67657mynQbf6hXYvl4boC3YlgjqzD7OeRaGlVpKbjcb5HbChbEsZmcN+NwlB+9O5W
         NrHVObtRHztCzNfY1lvBNgbGTHaUcr0GwNCKfP8KMbb0PcpJdCElxlUOi0RYVdAFEYTI
         cHfu8W3Ri2/wyzfbx0jzlQiRRAZ4b3LO3pcp/aX/MspS5pp6ILq8wKjNJWRqTDanR1ps
         I7/8lJ6coJTwqcCYAb7oFQXBxEoGCelGcAwciIbrzOLijcwHinuwohYG0tz8x59DaQ7T
         2Jloxx/KVnQCa/mnhjqsgpdWlTfCAyLwNhr/dYwa1YwjWk/SqLZGk2OGndw3txAodfpu
         xmvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747935660; x=1748540460;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TeAr8EL4oQPui+hhD2XCvPKkHcTv/J6VsW9NNOgXhKQ=;
        b=NDtZSjnETyKjb3Vww8uXDxqDyRfFkJmcc0R1Wrq17V3/uv6vqaTCdR0Z5MRJ7Zi2Jd
         B1pfN44An/KP5quZVauh0a10YJ4oZlIIEOtVNeAW7xxDpQE7krvity7BfoOSATOxzDZQ
         m3Vy7kKPd2oExV6d4TCfVOoeg3omDYZwfUUjqEx9tObJTvtJnqb7VQ3atBmp3aoAlHOC
         Fphomeqdfqt4tA8sgyxZeBGDvcbvq1FYztdY/j4yTRQdHww6iOs4mgD2LfJnpnj224G/
         lt7B74JPRMp0fXmGDnhF9mBymmasjg8fdKx0RWL0u4hObF+w/SEsPdWQUwzIHf9Ya3pY
         Uh8g==
X-Forwarded-Encrypted: i=1; AJvYcCWXGEbh1ANzuuHDjtloOTGizLqUp8iTVcltcul5/EDrQzIdNVIi+g4EP2OL2ueU9q4dom1Xz5Tgs9X4@vger.kernel.org
X-Gm-Message-State: AOJu0YylJNMXMIh6K8fN2zCDhgD0/yobu7RxB6p58D/FvUnQ8IrB7iCz
	0UpA572qc8/gDbZ4Yf71aofne20Pm9pbsZXKjF9euE9AAIfq+xfz8bdYsN+WWveacB8=
X-Gm-Gg: ASbGncsN8BxfkH16j7ERnJh1C5+kjOiku3L8QlA4oH9jJ+THA6WoFdDuvRlj3CFbV69
	ZiNATzfOXt7oP7oYAh+Kvh/yKLcRn+RzqNy3HyE5c4TmrUejavlNNkUnipwDpLDgkuCFVnU5smX
	fRB25KyP/aY+mW5iv+h+9eQiSJoCdikFtKqsPpjKzQcfkdILfFgPyILF4+rVCWJzHojYAcZ5kf/
	lv/3HWqDSTXkIZLXTjBUOIYTFm/eGRJQZBIOOVd0Rz77EVvCQO2sdDX+AvzVvNaZtCs3GqKg+gN
	Md/nhM0m1WN22nmzw+cJp614xzu/N4zKMEccsBexe3Vnwx3ewKakJke6vG4=
X-Google-Smtp-Source: AGHT+IHz8XbgOXRcXAj3UitOzCLAwz7FD4MY3pktOE9JI5RzgB4sZQzbOdVF20xF82sAnMfNovJ5Ew==
X-Received: by 2002:a05:6000:2281:b0:3a3:7be3:cba9 with SMTP id ffacd0b85a97d-3a37be3cebdmr9366496f8f.18.1747935659465;
        Thu, 22 May 2025 10:40:59 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7213:c700:6c33:c245:91e5:a9f4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f7bae847sm109563195e9.36.2025.05.22.10.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 10:40:58 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 22 May 2025 18:40:55 +0100
Subject: [PATCH v3 05/12] ASoC: codecs: wsa881x: split into common and
 soundwire drivers
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-rb2_audio_v3-v3-5-9eeb08cab9dc@linaro.org>
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

This is required in order to introduce wsa881x driver that works
in analog mode and is configurable via i2c only.
Functional changes, if any, are kept to be minimal and common
parts or parts that can be shared are moved into wsa881x-common
helper driver.
The regmap config structure now contains 0x3000 offset as required
by soundwire spec.

While at this, also fix the typo in WSA881X_ADC_EN_SEL_IBIAS
register name and rename wsa881x_set_sdw_stream() to
wsa881x_set_stream() and update registers description in the
header and use the new defines in wsa881x_init_common() and
in wsa881x_digital_mute().

Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Srinivas Kandagatla <srini@kernel.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 sound/soc/codecs/Kconfig          |   4 +
 sound/soc/codecs/Makefile         |   2 +
 sound/soc/codecs/wsa881x-common.c | 193 +++++++++++++++
 sound/soc/codecs/wsa881x-common.h | 458 +++++++++++++++++++++++++++++++++++
 sound/soc/codecs/wsa881x.c        | 493 +-------------------------------------
 5 files changed, 669 insertions(+), 481 deletions(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 8fe795504dbb5c91881e9de10f676c9d151b42d3..ba6e4504b5e9951203bd61fae894e86e9d40048e 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -2543,10 +2543,14 @@ config SND_SOC_WM9713
 	select REGMAP_AC97
 	select AC97_BUS_COMPAT if AC97_BUS_NEW
 
+config SND_SOC_WSA881X_COMMON
+	tristate
+
 config SND_SOC_WSA881X
 	tristate "WSA881X Codec"
 	depends on SOUNDWIRE
 	select REGMAP_SOUNDWIRE
+	select SND_SOC_WSA881X_COMMON
 	help
 	  This enables support for Qualcomm WSA8810/WSA8815 Class-D
 	  Smart Speaker Amplifier.
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index c92824713df0690998b76d43fcbe7c6e93dd5dd2..212d419cfe3c0fbd5d4e475e5d81c69ef930b3e1 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -406,6 +406,7 @@ snd-soc-wm9712-y := wm9712.o
 snd-soc-wm9713-y := wm9713.o
 snd-soc-wm-hubs-y := wm_hubs.o
 snd-soc-wsa881x-y := wsa881x.o
+snd-soc-wsa881x-common-y := wsa881x-common.o
 snd-soc-wsa883x-y := wsa883x.o
 snd-soc-wsa884x-y := wsa884x.o
 snd-soc-zl38060-y := zl38060.o
@@ -835,6 +836,7 @@ obj-$(CONFIG_SND_SOC_WM9713)	+= snd-soc-wm9713.o
 obj-$(CONFIG_SND_SOC_WM_ADSP)	+= snd-soc-wm-adsp.o
 obj-$(CONFIG_SND_SOC_WM_HUBS)	+= snd-soc-wm-hubs.o
 obj-$(CONFIG_SND_SOC_WSA881X)	+= snd-soc-wsa881x.o
+obj-$(CONFIG_SND_SOC_WSA881X_COMMON)	+= snd-soc-wsa881x-common.o
 obj-$(CONFIG_SND_SOC_WSA883X)	+= snd-soc-wsa883x.o
 obj-$(CONFIG_SND_SOC_WSA884X)	+= snd-soc-wsa884x.o
 obj-$(CONFIG_SND_SOC_ZL38060)	+= snd-soc-zl38060.o
diff --git a/sound/soc/codecs/wsa881x-common.c b/sound/soc/codecs/wsa881x-common.c
new file mode 100644
index 0000000000000000000000000000000000000000..fbc431bd059544505647688db0d09e407589e330
--- /dev/null
+++ b/sound/soc/codecs/wsa881x-common.c
@@ -0,0 +1,193 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2024 Linaro Ltd
+ */
+
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+#include <sound/soc.h>
+
+#include "wsa881x-common.h"
+
+int wsa881x_set_stream(struct snd_soc_dai *dai, void *stream, int direction)
+{
+#if IS_ENABLED(CONFIG_SND_SOC_WSA881X)
+	struct wsa881x_priv *wsa881x = dev_get_drvdata(dai->dev);
+
+	wsa881x->sruntime = stream;
+#endif
+	return 0;
+}
+EXPORT_SYMBOL_GPL(wsa881x_set_stream);
+
+int wsa881x_digital_mute(struct snd_soc_dai *dai, int mute, int stream)
+{
+	struct snd_soc_component *component = dai->component;
+
+	return snd_soc_component_update_bits(component,
+					     WSA881X_SPKR_DRV_EN,
+					     WSA881X_SPKR_DRV_EN_CLASS_PA_MASK,
+					     mute ?
+					     WSA881X_SPKR_DRV_EN_CLASS_PA_DIS :
+					     WSA881X_SPKR_DRV_EN_CLASS_PA_EN);
+}
+EXPORT_SYMBOL_GPL(wsa881x_digital_mute);
+
+void wsa881x_init_common(struct wsa881x_priv *wsa881x)
+{
+	struct regmap *rm = wsa881x->regmap;
+	unsigned int val = 0;
+
+	/* Bring out of analog reset */
+	regmap_update_bits(rm, WSA881X_CDC_RST_CTL,
+			   WSA881X_CDC_RST_CTL_ANA_RST,
+			   WSA881X_CDC_RST_CTL_ANA_RST);
+
+	/* Bring out of digital reset */
+	regmap_update_bits(rm, WSA881X_CDC_RST_CTL,
+			   WSA881X_CDC_RST_CTL_DIG_RST,
+			   WSA881X_CDC_RST_CTL_DIG_RST);
+	regmap_update_bits(rm, WSA881X_CLOCK_CONFIG,
+			   WSA881X_CLOCK_SCLK_SDM_DEM_DIV2_EN,
+			   WSA881X_CLOCK_SCLK_SDM_DEM_DIV2_EN);
+	regmap_update_bits(rm, WSA881X_SPKR_OCP_CTL,
+			   WSA881X_SPKR_OCP_CTL_RDAC_CLK_DIV2_MASK,
+			   FIELD_PREP(WSA881X_SPKR_OCP_CTL_RDAC_CLK_DIV2_MASK,
+				      WSA881X_SPKR_OCP_CTL_RDAC_CLK_DIV2));
+	regmap_update_bits(rm, WSA881X_SPKR_MISC_CTL1,
+			   WSA881X_SPKR_MISC_CTL1_DTIME_MASK,
+			   FIELD_PREP(WSA881X_SPKR_MISC_CTL1_DTIME_MASK,
+				      WSA881X_SPKR_MISC_CTL1_40NS));
+	regmap_update_bits(rm, WSA881X_SPKR_MISC_CTL1,
+			   WSA881X_SPKR_MISC_CTL1_SLEW_RATE_MASK,
+			   FIELD_PREP(WSA881X_SPKR_MISC_CTL1_SLEW_RATE_MASK,
+				      WSA881X_SPKR_MISC_CTL1_60NS));
+	regmap_update_bits(rm, WSA881X_SPKR_BIAS_INT,
+			   WSA881X_SPKR_BIAS_INT_FULL_MASK,
+			   0x0);
+	regmap_update_bits(rm, WSA881X_SPKR_PA_INT,
+			   WSA881X_SPKR_PA_INT_COMP_CURR_MASK,
+			   FIELD_PREP(WSA881X_SPKR_PA_INT_COMP_CURR_MASK,
+				      WSA881X_SPKR_PA_INT_COMP_CURR_2UA0));
+	regmap_update_bits(rm, WSA881X_SPKR_PA_INT,
+			   WSA881X_SPKR_PA_INT_LDO_CURR_MASK,
+			   FIELD_PREP(WSA881X_SPKR_PA_INT_LDO_CURR_MASK,
+				      WSA881X_SPKR_PA_INT_LDO_CURR_5UA0));
+	regmap_update_bits(rm, WSA881X_BOOST_LOOP_STABILITY,
+			   WSA881X_BOOST_LOOP_STAB_COMP_RES_MASK,
+			   FIELD_PREP(WSA881X_BOOST_LOOP_STAB_COMP_RES_MASK,
+				      WSA881X_BOOST_LOOP_STAB_COMP_RES_400K));
+	regmap_update_bits(rm, WSA881X_BOOST_MISC2_CTL,
+			   WSA881X_BOOST_MISC2_CTL_FULL_MASK,
+			   WSA881X_BOOST_MISC2_CTL_RST);
+	regmap_update_bits(rm, WSA881X_BOOST_START_CTL,
+			   WSA881X_BOOST_START_CTL_FAST_TRAN_MASK,
+			   WSA881X_BOOST_START_CTL_FAST_TRAN_EN);
+	regmap_update_bits(rm, WSA881X_BOOST_START_CTL,
+			   WSA881X_BOOST_START_CTL_PULSE_SKIP_MASK,
+			   FIELD_PREP(WSA881X_BOOST_START_CTL_PULSE_SKIP_MASK,
+				      WSA881X_BOOST_START_CTL_PULSE_SKIP_50MA));
+	regmap_update_bits(rm, WSA881X_BOOST_SLOPE_COMP_ISENSE_FB,
+			   WSA881X_BOOST_SLOPE_ERR_CURR_MASK,
+			   FIELD_PREP(WSA881X_BOOST_SLOPE_ERR_CURR_MASK,
+				      WSA881X_BOOST_SLOPE_ERR_CURR_11UA));
+	regmap_update_bits(rm, WSA881X_BOOST_SLOPE_COMP_ISENSE_FB,
+			   WSA881X_BOOST_SLOPE_ISENSE_FB_MASK,
+			   FIELD_PREP(WSA881X_BOOST_SLOPE_ISENSE_FB_MASK,
+				      WSA881X_BOOST_SLOPE_ISENSE_FB_03));
+
+	regmap_read(rm, WSA881X_OTP_REG_0, &val);
+	if (val)
+		regmap_update_bits(rm,
+			WSA881X_BOOST_PRESET_OUT1,
+			WSA881X_BOOST_PRESET_OUT1_1ST_LVL_MASK,
+			FIELD_PREP(WSA881X_BOOST_PRESET_OUT1_1ST_LVL_MASK,
+				   WSA881X_BOOST_PRESET_OUT1_5V5));
+
+	regmap_update_bits(rm, WSA881X_BOOST_PRESET_OUT2,
+			   WSA881X_BOOST_PRESET_OUT2_3RD_LVL_MASK,
+			   FIELD_PREP(WSA881X_BOOST_PRESET_OUT2_3RD_LVL_MASK,
+				      WSA881X_BOOST_PRESET_OUT2_9V));
+	regmap_update_bits(rm, WSA881X_SPKR_DRV_EN,
+			   WSA881X_SPKR_DRV_EN_INT_LDO_VOUT_MASK,
+			   FIELD_PREP(WSA881X_SPKR_DRV_EN_INT_LDO_VOUT_MASK,
+				      WSA881X_SPKR_DRV_EN_INT_LDO_VOUT_5V5));
+	regmap_update_bits(rm, WSA881X_BOOST_CURRENT_LIMIT,
+			   WSA881X_BOOST_CURRENT_LIMIT_SET_MASK,
+			   FIELD_PREP(WSA881X_BOOST_CURRENT_LIMIT_SET_MASK,
+				      WSA881X_BOOST_CURRENT_LIMIT_SET_4A));
+	regmap_update_bits(rm, WSA881X_SPKR_OCP_CTL,
+			   WSA881X_SPKR_OCP_CTL_CURR_LIMIT_MASK,
+			   FIELD_PREP(WSA881X_SPKR_OCP_CTL_CURR_LIMIT_MASK,
+				      WSA881X_SPKR_OCP_CTL_CURR_LIMIT_5A));
+	regmap_update_bits(rm, WSA881X_SPKR_OCP_CTL,
+			   WSA881X_SPKR_OCP_CTL_GLITCH_FLT_MASK,
+			   FIELD_PREP(WSA881X_SPKR_OCP_CTL_GLITCH_FLT_MASK,
+				      WSA881X_SPKR_OCP_CTL_GLITCH_FLT_128NS));
+	regmap_update_bits(rm, WSA881X_OTP_REG_28,
+			   WSA881X_OTP_REG_28_ISENSE_CAL_MASK,
+			   FIELD_PREP(WSA881X_OTP_REG_28_ISENSE_CAL_MASK,
+				      WSA881X_OTP_REG_28_ISENSE_CAL_RST_VAL));
+	regmap_update_bits(rm, WSA881X_BONGO_RESRV_REG1,
+			   WSA881X_BONGO_RESRV_REG1_TEMP_CMP_MASK,
+			   WSA881X_BONGO_RESRV_REG1_TEMP_CMP_EN);
+	regmap_update_bits(rm, WSA881X_BONGO_RESRV_REG1,
+			   WSA881X_BONGO_RESRV_REG1_ISENSE_MASK,
+			   FIELD_PREP(WSA881X_BONGO_RESRV_REG1_ISENSE_MASK,
+				      WSA881X_BONGO_RESRV_REG1_ISENSE_RST_VAL));
+	regmap_update_bits(rm, WSA881X_BONGO_RESRV_REG1,
+			   WSA881X_BONGO_RESRV_REG1_ATEST_MASK,
+			   WSA881X_BONGO_RESRV_REG1_ATEST_DIS);
+	regmap_update_bits(rm, WSA881X_BONGO_RESRV_REG2,
+			   WSA881X_BONGO_RESRV_REG2_FULL_MASK,
+			   WSA881X_BONGO_RESRV_REG2_RST_VAL);
+}
+EXPORT_SYMBOL_GPL(wsa881x_init_common);
+
+int wsa881x_probe_common(struct wsa881x_priv **wsa881x, struct device *dev)
+{
+	struct wsa881x_priv *wsa;
+
+	wsa = devm_kzalloc(dev, sizeof(*wsa), GFP_KERNEL);
+	if (!wsa)
+		return -ENOMEM;
+
+	wsa->dev = dev;
+	wsa->sd_n = devm_gpiod_get_optional(dev, "powerdown",
+					    GPIOD_FLAGS_BIT_NONEXCLUSIVE);
+	if (IS_ERR(wsa->sd_n))
+		return dev_err_probe(dev, PTR_ERR(wsa->sd_n),
+				     "Shutdown Control GPIO not found\n");
+	/*
+	 * Backwards compatibility work-around.
+	 *
+	 * The SD_N GPIO is active low, however upstream DTS used always active
+	 * high.  Changing the flag in driver and DTS will break backwards
+	 * compatibility, so add a simple value inversion to work with both old
+	 * and new DTS.
+	 *
+	 * This won't work properly with DTS using the flags properly in cases:
+	 * 1. Old DTS with proper ACTIVE_LOW, however such case was broken
+	 *    before as the driver required the active high.
+	 * 2. New DTS with proper ACTIVE_HIGH (intended), which is rare case
+	 *    (not existing upstream) but possible. This is the price of
+	 *    backwards compatibility, therefore this hack should be removed at
+	 *    some point.
+	 */
+	wsa->sd_n_val = gpiod_is_active_low(wsa->sd_n);
+	if (!wsa->sd_n_val)
+		dev_warn(dev,
+			 "Using ACTIVE_HIGH for shutdown GPIO. Your DTB might be outdated or you use unsupported configuration for the GPIO.\n");
+
+	dev_set_drvdata(dev, wsa);
+	gpiod_direction_output(wsa->sd_n, !wsa->sd_n_val);
+
+	*wsa881x = wsa;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(wsa881x_probe_common);
+
+MODULE_DESCRIPTION("WSA881x codec helper driver");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/codecs/wsa881x-common.h b/sound/soc/codecs/wsa881x-common.h
new file mode 100644
index 0000000000000000000000000000000000000000..ab4ee5848b10fe6ca4160b7ff634e7e06b6e41e6
--- /dev/null
+++ b/sound/soc/codecs/wsa881x-common.h
@@ -0,0 +1,458 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __WSA881x_COMMON_H__
+#define __WSA881x_COMMON_H__
+
+#include <linux/soundwire/sdw.h>
+#include <sound/soc.h>
+
+#define WSA881X_MAX_SWR_PORTS	4
+
+#define WSA881X_DIGITAL_BASE	0x0000
+#define WSA881X_ANALOG_BASE	0x0100
+
+/* Digital register address space */
+#define WSA881X_CHIP_ID0			(WSA881X_DIGITAL_BASE + 0x0000)
+#define WSA881X_CHIP_ID1			(WSA881X_DIGITAL_BASE + 0x0001)
+#define WSA881X_CHIP_ID2			(WSA881X_DIGITAL_BASE + 0x0002)
+#define WSA881X_CHIP_ID3			(WSA881X_DIGITAL_BASE + 0x0003)
+#define WSA881X_BUS_ID				(WSA881X_DIGITAL_BASE + 0x0004)
+#define WSA881X_CDC_RST_CTL			(WSA881X_DIGITAL_BASE + 0x0005)
+#define WSA881X_CDC_RST_CTL_ANA_RST		BIT(1)
+#define WSA881X_CDC_RST_CTL_DIG_RST		BIT(0)
+#define WSA881X_CDC_TOP_CLK_CTL			(WSA881X_DIGITAL_BASE + 0x0006)
+#define WSA881X_CDC_ANA_CLK_CTL			(WSA881X_DIGITAL_BASE + 0x0007)
+#define WSA881X_CDC_DIG_CLK_CTL			(WSA881X_DIGITAL_BASE + 0x0008)
+#define WSA881X_CLOCK_CONFIG			(WSA881X_DIGITAL_BASE + 0x0009)
+#define WSA881X_CLOCK_SCLK_SDM_DEM_DIV2_EN	BIT(4)
+#define WSA881X_ANA_CTL				(WSA881X_DIGITAL_BASE + 0x000A)
+#define WSA881X_SWR_RESET_EN			(WSA881X_DIGITAL_BASE + 0x000B)
+#define WSA881X_RESET_CTL			(WSA881X_DIGITAL_BASE + 0x000C)
+#define WSA881X_TADC_VALUE_CTL			(WSA881X_DIGITAL_BASE + 0x000F)
+#define WSA881X_TEMP_DETECT_CTL			(WSA881X_DIGITAL_BASE + 0x0010)
+#define WSA881X_TEMP_MSB			(WSA881X_DIGITAL_BASE + 0x0011)
+#define WSA881X_TEMP_LSB			(WSA881X_DIGITAL_BASE + 0x0012)
+#define WSA881X_TEMP_CONFIG0			(WSA881X_DIGITAL_BASE + 0x0013)
+#define WSA881X_TEMP_CONFIG1			(WSA881X_DIGITAL_BASE + 0x0014)
+#define WSA881X_CDC_CLIP_CTL			(WSA881X_DIGITAL_BASE + 0x0015)
+#define WSA881X_SDM_PDM9_LSB			(WSA881X_DIGITAL_BASE + 0x0016)
+#define WSA881X_SDM_PDM9_MSB			(WSA881X_DIGITAL_BASE + 0x0017)
+#define WSA881X_CDC_RX_CTL			(WSA881X_DIGITAL_BASE + 0x0018)
+#define WSA881X_DEM_BYPASS_DATA0		(WSA881X_DIGITAL_BASE + 0x0019)
+#define WSA881X_DEM_BYPASS_DATA1		(WSA881X_DIGITAL_BASE + 0x001A)
+#define WSA881X_DEM_BYPASS_DATA2		(WSA881X_DIGITAL_BASE + 0x001B)
+#define WSA881X_DEM_BYPASS_DATA3		(WSA881X_DIGITAL_BASE + 0x001C)
+#define WSA881X_OTP_CTRL0			(WSA881X_DIGITAL_BASE + 0x001D)
+#define WSA881X_OTP_CTRL1			(WSA881X_DIGITAL_BASE + 0x001E)
+#define WSA881X_HDRIVE_CTL_GROUP1		(WSA881X_DIGITAL_BASE + 0x001F)
+#define WSA881X_INTR_MODE			(WSA881X_DIGITAL_BASE + 0x0020)
+#define WSA881X_INTR_MASK			(WSA881X_DIGITAL_BASE + 0x0021)
+#define WSA881X_INTR_STATUS			(WSA881X_DIGITAL_BASE + 0x0022)
+#define WSA881X_INTR_CLEAR			(WSA881X_DIGITAL_BASE + 0x0023)
+#define WSA881X_INTR_LEVEL			(WSA881X_DIGITAL_BASE + 0x0024)
+#define WSA881X_INTR_SET			(WSA881X_DIGITAL_BASE + 0x0025)
+#define WSA881X_INTR_TEST			(WSA881X_DIGITAL_BASE + 0x0026)
+#define WSA881X_PDM_TEST_MODE			(WSA881X_DIGITAL_BASE + 0x0030)
+#define WSA881X_ATE_TEST_MODE			(WSA881X_DIGITAL_BASE + 0x0031)
+#define WSA881X_PIN_CTL_MODE			(WSA881X_DIGITAL_BASE + 0x0032)
+#define WSA881X_PIN_CTL_OE			(WSA881X_DIGITAL_BASE + 0x0033)
+#define WSA881X_PIN_WDATA_IOPAD			(WSA881X_DIGITAL_BASE + 0x0034)
+#define WSA881X_PIN_STATUS			(WSA881X_DIGITAL_BASE + 0x0035)
+#define WSA881X_DIG_DEBUG_MODE			(WSA881X_DIGITAL_BASE + 0x0037)
+#define WSA881X_DIG_DEBUG_SEL			(WSA881X_DIGITAL_BASE + 0x0038)
+#define WSA881X_DIG_DEBUG_EN			(WSA881X_DIGITAL_BASE + 0x0039)
+#define WSA881X_SWR_HM_TEST1			(WSA881X_DIGITAL_BASE + 0x003B)
+#define WSA881X_SWR_HM_TEST2			(WSA881X_DIGITAL_BASE + 0x003C)
+#define WSA881X_TEMP_DETECT_DBG_CTL		(WSA881X_DIGITAL_BASE + 0x003D)
+#define WSA881X_TEMP_DEBUG_MSB			(WSA881X_DIGITAL_BASE + 0x003E)
+#define WSA881X_TEMP_DEBUG_LSB			(WSA881X_DIGITAL_BASE + 0x003F)
+#define WSA881X_SAMPLE_EDGE_SEL			(WSA881X_DIGITAL_BASE + 0x0044)
+#define WSA881X_IOPAD_CTL			(WSA881X_DIGITAL_BASE + 0x0045)
+#define WSA881X_SPARE_0				(WSA881X_DIGITAL_BASE + 0x0050)
+#define WSA881X_SPARE_1				(WSA881X_DIGITAL_BASE + 0x0051)
+#define WSA881X_SPARE_2				(WSA881X_DIGITAL_BASE + 0x0052)
+#define WSA881X_OTP_REG_0			(WSA881X_DIGITAL_BASE + 0x0080)
+#define WSA881X_OTP_REG_1			(WSA881X_DIGITAL_BASE + 0x0081)
+#define WSA881X_OTP_REG_2			(WSA881X_DIGITAL_BASE + 0x0082)
+#define WSA881X_OTP_REG_3			(WSA881X_DIGITAL_BASE + 0x0083)
+#define WSA881X_OTP_REG_4			(WSA881X_DIGITAL_BASE + 0x0084)
+#define WSA881X_OTP_REG_5			(WSA881X_DIGITAL_BASE + 0x0085)
+#define WSA881X_OTP_REG_6			(WSA881X_DIGITAL_BASE + 0x0086)
+#define WSA881X_OTP_REG_7			(WSA881X_DIGITAL_BASE + 0x0087)
+#define WSA881X_OTP_REG_8			(WSA881X_DIGITAL_BASE + 0x0088)
+#define WSA881X_OTP_REG_9			(WSA881X_DIGITAL_BASE + 0x0089)
+#define WSA881X_OTP_REG_10			(WSA881X_DIGITAL_BASE + 0x008A)
+#define WSA881X_OTP_REG_11			(WSA881X_DIGITAL_BASE + 0x008B)
+#define WSA881X_OTP_REG_12			(WSA881X_DIGITAL_BASE + 0x008C)
+#define WSA881X_OTP_REG_13			(WSA881X_DIGITAL_BASE + 0x008D)
+#define WSA881X_OTP_REG_14			(WSA881X_DIGITAL_BASE + 0x008E)
+#define WSA881X_OTP_REG_15			(WSA881X_DIGITAL_BASE + 0x008F)
+#define WSA881X_OTP_REG_16			(WSA881X_DIGITAL_BASE + 0x0090)
+#define WSA881X_OTP_REG_17			(WSA881X_DIGITAL_BASE + 0x0091)
+#define WSA881X_OTP_REG_18			(WSA881X_DIGITAL_BASE + 0x0092)
+#define WSA881X_OTP_REG_19			(WSA881X_DIGITAL_BASE + 0x0093)
+#define WSA881X_OTP_REG_20			(WSA881X_DIGITAL_BASE + 0x0094)
+#define WSA881X_OTP_REG_21			(WSA881X_DIGITAL_BASE + 0x0095)
+#define WSA881X_OTP_REG_22			(WSA881X_DIGITAL_BASE + 0x0096)
+#define WSA881X_OTP_REG_23			(WSA881X_DIGITAL_BASE + 0x0097)
+#define WSA881X_OTP_REG_24			(WSA881X_DIGITAL_BASE + 0x0098)
+#define WSA881X_OTP_REG_25			(WSA881X_DIGITAL_BASE + 0x0099)
+#define WSA881X_OTP_REG_26			(WSA881X_DIGITAL_BASE + 0x009A)
+#define WSA881X_OTP_REG_27			(WSA881X_DIGITAL_BASE + 0x009B)
+#define WSA881X_OTP_REG_28			(WSA881X_DIGITAL_BASE + 0x009C)
+#define WSA881X_OTP_REG_28_ISENSE_CAL_MASK	GENMASK(5, 0)
+#define WSA881X_OTP_REG_28_ISENSE_CAL_RST_VAL	(0x3A)
+#define WSA881X_OTP_REG_29			(WSA881X_DIGITAL_BASE + 0x009D)
+#define WSA881X_OTP_REG_30			(WSA881X_DIGITAL_BASE + 0x009E)
+#define WSA881X_OTP_REG_31			(WSA881X_DIGITAL_BASE + 0x009F)
+#define WSA881X_OTP_REG_63			(WSA881X_DIGITAL_BASE + 0x00BF)
+
+/* Analog Register address space */
+#define WSA881X_BIAS_REF_CTRL			(WSA881X_ANALOG_BASE + 0x0000)
+#define WSA881X_BIAS_TEST			(WSA881X_ANALOG_BASE + 0x0001)
+#define WSA881X_BIAS_BIAS			(WSA881X_ANALOG_BASE + 0x0002)
+#define WSA881X_TEMP_OP				(WSA881X_ANALOG_BASE + 0x0003)
+#define WSA881X_TEMP_IREF_CTRL			(WSA881X_ANALOG_BASE + 0x0004)
+#define WSA881X_TEMP_ISENS_CTRL			(WSA881X_ANALOG_BASE + 0x0005)
+#define WSA881X_TEMP_CLK_CTRL			(WSA881X_ANALOG_BASE + 0x0006)
+#define WSA881X_TEMP_TEST			(WSA881X_ANALOG_BASE + 0x0007)
+#define WSA881X_TEMP_BIAS			(WSA881X_ANALOG_BASE + 0x0008)
+#define WSA881X_TEMP_ADC_CTRL			(WSA881X_ANALOG_BASE + 0x0009)
+#define WSA881X_TEMP_DOUT_MSB			(WSA881X_ANALOG_BASE + 0x000A)
+#define WSA881X_TEMP_DOUT_LSB			(WSA881X_ANALOG_BASE + 0x000B)
+#define WSA881X_ADC_EN_MODU_V			(WSA881X_ANALOG_BASE + 0x0010)
+#define WSA881X_ADC_EN_MODU_I			(WSA881X_ANALOG_BASE + 0x0011)
+#define WSA881X_ADC_EN_DET_TEST_V		(WSA881X_ANALOG_BASE + 0x0012)
+#define WSA881X_ADC_EN_DET_TEST_I		(WSA881X_ANALOG_BASE + 0x0013)
+#define WSA881X_ADC_SEL_IBIAS			(WSA881X_ANALOG_BASE + 0x0014)
+#define WSA881X_ADC_EN_SEL_IBIAS		(WSA881X_ANALOG_BASE + 0x0015)
+#define WSA881X_SPKR_DRV_EN			(WSA881X_ANALOG_BASE + 0x001A)
+#define WSA881X_SPKR_DRV_EN_CLASS_PA_MASK	BIT(7)
+#define WSA881X_SPKR_DRV_EN_CLASS_PA_DIS	0
+#define WSA881X_SPKR_DRV_EN_CLASS_PA_EN		BIT(7)
+#define WSA881X_SPKR_DRV_EN_INT_LDO_VOUT_MASK	BIT(3)
+#define WSA881X_SPKR_DRV_EN_INT_LDO_VOUT_5V	0
+#define WSA881X_SPKR_DRV_EN_INT_LDO_VOUT_5V5	1
+#define WSA881X_SPKR_DRV_GAIN			(WSA881X_ANALOG_BASE + 0x001B)
+#define WSA881X_PA_GAIN_SEL_MASK		BIT(3)
+#define WSA881X_PA_GAIN_SEL_REG			BIT(3)
+#define WSA881X_PA_GAIN_SEL_DRE			0
+#define WSA881X_SPKR_PAG_GAIN_MASK		GENMASK(7, 4)
+#define WSA881X_SPKR_DAC_CTL			(WSA881X_ANALOG_BASE + 0x001C)
+#define WSA881X_SPKR_DRV_DBG			(WSA881X_ANALOG_BASE + 0x001D)
+#define WSA881X_SPKR_PWRSTG_DBG			(WSA881X_ANALOG_BASE + 0x001E)
+#define WSA881X_SPKR_OCP_CTL			(WSA881X_ANALOG_BASE + 0x001F)
+#define WSA881X_SPKR_OCP_MASK			GENMASK(7, 6)
+#define WSA881X_SPKR_OCP_CTL_CURR_LIMIT_MASK	GENMASK(5, 4)
+#define WSA881X_SPKR_OCP_CTL_GLITCH_FLT_MASK	GENMASK(3, 2)
+#define WSA881X_SPKR_OCP_CTL_CURR_LIMIT_5A	(BIT(1) | BIT(0))
+#define WSA881X_SPKR_OCP_CTL_GLITCH_FLT_128NS	0
+#define WSA881X_SPKR_OCP_CTL_RDAC_CLK_DIV2_MASK	BIT(1)
+#define WSA881X_SPKR_OCP_CTL_RDAC_CLK_DIV2	1
+#define WSA881X_SPKR_OCP_EN			BIT(7)
+#define WSA881X_SPKR_OCP_HOLD			BIT(6)
+#define WSA881X_SPKR_CLIP_CTL			(WSA881X_ANALOG_BASE + 0x0020)
+#define WSA881X_SPKR_BBM_CTL			(WSA881X_ANALOG_BASE + 0x0021)
+#define WSA881X_SPKR_MISC_CTL1			(WSA881X_ANALOG_BASE + 0x0022)
+#define WSA881X_SPKR_MISC_CTL1_DTIME_MASK	GENMASK(7, 6)
+#define WSA881X_SPKR_MISC_CTL1_SLEW_RATE_MASK	GENMASK(2, 1)
+#define WSA881X_SPKR_MISC_CTL1_60NS		(BIT(1) | BIT(0))
+#define WSA881X_SPKR_MISC_CTL1_40NS		BIT(1)
+#define WSA881X_SPKR_MISC_CTL2			(WSA881X_ANALOG_BASE + 0x0023)
+#define WSA881X_SPKR_BIAS_INT			(WSA881X_ANALOG_BASE + 0x0024)
+#define WSA881X_SPKR_BIAS_INT_FULL_MASK		((u8)~0U)
+#define WSA881X_SPKR_PA_INT			(WSA881X_ANALOG_BASE + 0x0025)
+#define WSA881X_SPKR_PA_INT_COMP_CURR_MASK	GENMASK(7, 4)
+#define WSA881X_SPKR_PA_INT_LDO_CURR_MASK	GENMASK(3, 1)
+#define WSA881X_SPKR_PA_INT_COMP_CURR_2UA0	BIT(2)
+#define WSA881X_SPKR_PA_INT_LDO_CURR_5UA0	(BIT(2) | BIT(1) | BIT(0))
+#define WSA881X_SPKR_BIAS_CAL			(WSA881X_ANALOG_BASE + 0x0026)
+#define WSA881X_SPKR_BIAS_PSRR			(WSA881X_ANALOG_BASE + 0x0027)
+#define WSA881X_SPKR_STATUS1			(WSA881X_ANALOG_BASE + 0x0028)
+#define WSA881X_SPKR_STATUS2			(WSA881X_ANALOG_BASE + 0x0029)
+#define WSA881X_BOOST_EN_CTL			(WSA881X_ANALOG_BASE + 0x002A)
+#define WSA881X_BOOST_EN_MASK			BIT(7)
+#define WSA881X_BOOST_EN			BIT(7)
+#define WSA881X_BOOST_CURRENT_LIMIT		(WSA881X_ANALOG_BASE + 0x002B)
+#define WSA881X_BOOST_CURRENT_LIMIT_SET_MASK	GENMASK(3, 0)
+#define WSA881X_BOOST_CURRENT_LIMIT_SET_4A	BIT(3)
+#define WSA881X_BOOST_PS_CTL			(WSA881X_ANALOG_BASE + 0x002C)
+#define WSA881X_BOOST_PRESET_OUT1		(WSA881X_ANALOG_BASE + 0x002D)
+#define WSA881X_BOOST_PRESET_OUT1_1ST_LVL_MASK	GENMASK(7, 4)
+#define WSA881X_BOOST_PRESET_OUT1_5V5		(BIT(2) | BIT(1) | BIT(0))
+#define WSA881X_BOOST_PRESET_OUT2		(WSA881X_ANALOG_BASE + 0x002E)
+#define WSA881X_BOOST_PRESET_OUT2_3RD_LVL_MASK	GENMASK(7, 4)
+#define WSA881X_BOOST_PRESET_OUT2_9V		(BIT(1) | BIT(0))
+#define WSA881X_BOOST_FORCE_OUT			(WSA881X_ANALOG_BASE + 0x002F)
+#define WSA881X_BOOST_LDO_PROG			(WSA881X_ANALOG_BASE + 0x0030)
+#define WSA881X_BOOST_SLOPE_COMP_ISENSE_FB	(WSA881X_ANALOG_BASE + 0x0031)
+#define WSA881X_BOOST_SLOPE_ERR_CURR_MASK	GENMASK(3, 2)
+#define WSA881X_BOOST_SLOPE_ISENSE_FB_MASK	GENMASK(1, 0)
+#define WSA881X_BOOST_SLOPE_ERR_CURR_11UA	BIT(0)
+#define WSA881X_BOOST_SLOPE_ISENSE_FB_03	0
+#define WSA881X_BOOST_RON_CTL			(WSA881X_ANALOG_BASE + 0x0032)
+#define WSA881X_BOOST_LOOP_STABILITY		(WSA881X_ANALOG_BASE + 0x0033)
+#define WSA881X_BOOST_LOOP_STAB_COMP_RES_MASK	GENMASK(1, 0)
+#define WSA881X_BOOST_LOOP_STAB_COMP_RES_400K	(BIT(1) | BIT(0))
+#define WSA881X_BOOST_ZX_CTL			(WSA881X_ANALOG_BASE + 0x0034)
+#define WSA881X_BOOST_START_CTL			(WSA881X_ANALOG_BASE + 0x0035)
+#define WSA881X_BOOST_START_CTL_FAST_TRAN_MASK	BIT(7)
+#define WSA881X_BOOST_START_CTL_PULSE_SKIP_MASK	GENMASK(1, 0)
+#define WSA881X_BOOST_START_CTL_FAST_TRAN_EN	BIT(7)
+#define WSA881X_BOOST_START_CTL_PULSE_SKIP_50MA	0
+#define WSA881X_BOOST_MISC1_CTL			(WSA881X_ANALOG_BASE + 0x0036)
+#define WSA881X_BOOST_MISC2_CTL			(WSA881X_ANALOG_BASE + 0x0037)
+#define WSA881X_BOOST_MISC2_CTL_FULL_MASK	((u8)~0U)
+#define WSA881X_BOOST_MISC2_CTL_RST		(BIT(4) | BIT(2))
+#define WSA881X_BOOST_MISC3_CTL			(WSA881X_ANALOG_BASE + 0x0038)
+#define WSA881X_BOOST_ATEST_CTL			(WSA881X_ANALOG_BASE + 0x0039)
+#define WSA881X_SPKR_PROT_FE_GAIN		(WSA881X_ANALOG_BASE + 0x003A)
+#define WSA881X_SPKR_PROT_FE_CM_LDO_SET		(WSA881X_ANALOG_BASE + 0x003B)
+#define WSA881X_SPKR_PROT_FE_ISENSE_BIAS_SET1	(WSA881X_ANALOG_BASE + 0x003C)
+#define WSA881X_SPKR_PROT_FE_ISENSE_BIAS_SET2	(WSA881X_ANALOG_BASE + 0x003D)
+#define WSA881X_SPKR_PROT_ATEST1		(WSA881X_ANALOG_BASE + 0x003E)
+#define WSA881X_SPKR_PROT_ATEST2		(WSA881X_ANALOG_BASE + 0x003F)
+#define WSA881X_SPKR_PROT_FE_VSENSE_VCM		(WSA881X_ANALOG_BASE + 0x0040)
+#define WSA881X_SPKR_PROT_FE_VSENSE_BIAS_SET1	(WSA881X_ANALOG_BASE + 0x0041)
+#define WSA881X_BONGO_RESRV_REG1		(WSA881X_ANALOG_BASE + 0x0042)
+#define WSA881X_BONGO_RESRV_REG1_TEMP_CMP_MASK	BIT(7)
+#define WSA881X_BONGO_RESRV_REG1_ISENSE_MASK	GENMASK(6, 1)
+#define WSA881X_BONGO_RESRV_REG1_ATEST_MASK	BIT(0)
+#define WSA881X_BONGO_RESRV_REG1_TEMP_CMP_EN	BIT(7)
+#define WSA881X_BONGO_RESRV_REG1_ISENSE_RST_VAL	(BIT(4) | BIT(3) | BIT(0))
+#define WSA881X_BONGO_RESRV_REG1_ATEST_DIS	0
+#define WSA881X_BONGO_RESRV_REG2		(WSA881X_ANALOG_BASE + 0x0043)
+#define WSA881X_BONGO_RESRV_REG2_FULL_MASK	((u8)~0U)
+#define WSA881X_BONGO_RESRV_REG2_RST_VAL	(0x5)
+#define WSA881X_SPKR_PROT_SAR			(WSA881X_ANALOG_BASE + 0x0044)
+#define WSA881X_SPKR_STATUS3			(WSA881X_ANALOG_BASE + 0x0045)
+
+/*
+ * Private data Structure for wsa881x. All parameters related to
+ * WSA881X codec needs to be defined here.
+ */
+struct wsa881x_priv {
+	struct regmap *regmap;
+	struct device *dev;
+
+#if IS_ENABLED(CONFIG_SND_SOC_WSA881X)
+	/* Soundwire interface */
+	struct sdw_slave *slave;
+	struct sdw_stream_config sconfig;
+	struct sdw_stream_runtime *sruntime;
+	struct sdw_port_config port_config[WSA881X_MAX_SWR_PORTS];
+	int active_ports;
+	bool port_prepared[WSA881X_MAX_SWR_PORTS];
+	bool port_enable[WSA881X_MAX_SWR_PORTS];
+#endif
+
+	struct gpio_desc *sd_n;
+	/*
+	 * Logical state for SD_N GPIO: high for shutdown, low for enable.
+	 * For backwards compatibility.
+	 */
+	unsigned int sd_n_val;
+};
+
+void wsa881x_init_common(struct wsa881x_priv *wsa881x);
+int wsa881x_probe_common(struct wsa881x_priv **wsa881x, struct device *dev);
+int wsa881x_digital_mute(struct snd_soc_dai *dai, int mute, int stream);
+int wsa881x_set_stream(struct snd_soc_dai *dai, void *stream, int direction);
+
+static inline bool wsa881x_readable_register(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case WSA881X_CHIP_ID0:
+	case WSA881X_CHIP_ID1:
+	case WSA881X_CHIP_ID2:
+	case WSA881X_CHIP_ID3:
+	case WSA881X_BUS_ID:
+	case WSA881X_CDC_RST_CTL:
+	case WSA881X_CDC_TOP_CLK_CTL:
+	case WSA881X_CDC_ANA_CLK_CTL:
+	case WSA881X_CDC_DIG_CLK_CTL:
+	case WSA881X_CLOCK_CONFIG:
+	case WSA881X_ANA_CTL:
+	case WSA881X_SWR_RESET_EN:
+	case WSA881X_RESET_CTL:
+	case WSA881X_TADC_VALUE_CTL:
+	case WSA881X_TEMP_DETECT_CTL:
+	case WSA881X_TEMP_MSB:
+	case WSA881X_TEMP_LSB:
+	case WSA881X_TEMP_CONFIG0:
+	case WSA881X_TEMP_CONFIG1:
+	case WSA881X_CDC_CLIP_CTL:
+	case WSA881X_SDM_PDM9_LSB:
+	case WSA881X_SDM_PDM9_MSB:
+	case WSA881X_CDC_RX_CTL:
+	case WSA881X_DEM_BYPASS_DATA0:
+	case WSA881X_DEM_BYPASS_DATA1:
+	case WSA881X_DEM_BYPASS_DATA2:
+	case WSA881X_DEM_BYPASS_DATA3:
+	case WSA881X_OTP_CTRL0:
+	case WSA881X_OTP_CTRL1:
+	case WSA881X_HDRIVE_CTL_GROUP1:
+	case WSA881X_INTR_MODE:
+	case WSA881X_INTR_MASK:
+	case WSA881X_INTR_STATUS:
+	case WSA881X_INTR_CLEAR:
+	case WSA881X_INTR_LEVEL:
+	case WSA881X_INTR_SET:
+	case WSA881X_INTR_TEST:
+	case WSA881X_PDM_TEST_MODE:
+	case WSA881X_ATE_TEST_MODE:
+	case WSA881X_PIN_CTL_MODE:
+	case WSA881X_PIN_CTL_OE:
+	case WSA881X_PIN_WDATA_IOPAD:
+	case WSA881X_PIN_STATUS:
+	case WSA881X_DIG_DEBUG_MODE:
+	case WSA881X_DIG_DEBUG_SEL:
+	case WSA881X_DIG_DEBUG_EN:
+	case WSA881X_SWR_HM_TEST1:
+	case WSA881X_SWR_HM_TEST2:
+	case WSA881X_TEMP_DETECT_DBG_CTL:
+	case WSA881X_TEMP_DEBUG_MSB:
+	case WSA881X_TEMP_DEBUG_LSB:
+	case WSA881X_SAMPLE_EDGE_SEL:
+	case WSA881X_IOPAD_CTL:
+	case WSA881X_SPARE_0:
+	case WSA881X_SPARE_1:
+	case WSA881X_SPARE_2:
+	case WSA881X_OTP_REG_0:
+	case WSA881X_OTP_REG_1:
+	case WSA881X_OTP_REG_2:
+	case WSA881X_OTP_REG_3:
+	case WSA881X_OTP_REG_4:
+	case WSA881X_OTP_REG_5:
+	case WSA881X_OTP_REG_6:
+	case WSA881X_OTP_REG_7:
+	case WSA881X_OTP_REG_8:
+	case WSA881X_OTP_REG_9:
+	case WSA881X_OTP_REG_10:
+	case WSA881X_OTP_REG_11:
+	case WSA881X_OTP_REG_12:
+	case WSA881X_OTP_REG_13:
+	case WSA881X_OTP_REG_14:
+	case WSA881X_OTP_REG_15:
+	case WSA881X_OTP_REG_16:
+	case WSA881X_OTP_REG_17:
+	case WSA881X_OTP_REG_18:
+	case WSA881X_OTP_REG_19:
+	case WSA881X_OTP_REG_20:
+	case WSA881X_OTP_REG_21:
+	case WSA881X_OTP_REG_22:
+	case WSA881X_OTP_REG_23:
+	case WSA881X_OTP_REG_24:
+	case WSA881X_OTP_REG_25:
+	case WSA881X_OTP_REG_26:
+	case WSA881X_OTP_REG_27:
+	case WSA881X_OTP_REG_28:
+	case WSA881X_OTP_REG_29:
+	case WSA881X_OTP_REG_30:
+	case WSA881X_OTP_REG_31:
+	case WSA881X_OTP_REG_63:
+	case WSA881X_BIAS_REF_CTRL:
+	case WSA881X_BIAS_TEST:
+	case WSA881X_BIAS_BIAS:
+	case WSA881X_TEMP_OP:
+	case WSA881X_TEMP_IREF_CTRL:
+	case WSA881X_TEMP_ISENS_CTRL:
+	case WSA881X_TEMP_CLK_CTRL:
+	case WSA881X_TEMP_TEST:
+	case WSA881X_TEMP_BIAS:
+	case WSA881X_TEMP_ADC_CTRL:
+	case WSA881X_TEMP_DOUT_MSB:
+	case WSA881X_TEMP_DOUT_LSB:
+	case WSA881X_ADC_EN_MODU_V:
+	case WSA881X_ADC_EN_MODU_I:
+	case WSA881X_ADC_EN_DET_TEST_V:
+	case WSA881X_ADC_EN_DET_TEST_I:
+	case WSA881X_ADC_SEL_IBIAS:
+	case WSA881X_ADC_EN_SEL_IBIAS:
+	case WSA881X_SPKR_DRV_EN:
+	case WSA881X_SPKR_DRV_GAIN:
+	case WSA881X_SPKR_DAC_CTL:
+	case WSA881X_SPKR_DRV_DBG:
+	case WSA881X_SPKR_PWRSTG_DBG:
+	case WSA881X_SPKR_OCP_CTL:
+	case WSA881X_SPKR_CLIP_CTL:
+	case WSA881X_SPKR_BBM_CTL:
+	case WSA881X_SPKR_MISC_CTL1:
+	case WSA881X_SPKR_MISC_CTL2:
+	case WSA881X_SPKR_BIAS_INT:
+	case WSA881X_SPKR_PA_INT:
+	case WSA881X_SPKR_BIAS_CAL:
+	case WSA881X_SPKR_BIAS_PSRR:
+	case WSA881X_SPKR_STATUS1:
+	case WSA881X_SPKR_STATUS2:
+	case WSA881X_BOOST_EN_CTL:
+	case WSA881X_BOOST_CURRENT_LIMIT:
+	case WSA881X_BOOST_PS_CTL:
+	case WSA881X_BOOST_PRESET_OUT1:
+	case WSA881X_BOOST_PRESET_OUT2:
+	case WSA881X_BOOST_FORCE_OUT:
+	case WSA881X_BOOST_LDO_PROG:
+	case WSA881X_BOOST_SLOPE_COMP_ISENSE_FB:
+	case WSA881X_BOOST_RON_CTL:
+	case WSA881X_BOOST_LOOP_STABILITY:
+	case WSA881X_BOOST_ZX_CTL:
+	case WSA881X_BOOST_START_CTL:
+	case WSA881X_BOOST_MISC1_CTL:
+	case WSA881X_BOOST_MISC2_CTL:
+	case WSA881X_BOOST_MISC3_CTL:
+	case WSA881X_BOOST_ATEST_CTL:
+	case WSA881X_SPKR_PROT_FE_GAIN:
+	case WSA881X_SPKR_PROT_FE_CM_LDO_SET:
+	case WSA881X_SPKR_PROT_FE_ISENSE_BIAS_SET1:
+	case WSA881X_SPKR_PROT_FE_ISENSE_BIAS_SET2:
+	case WSA881X_SPKR_PROT_ATEST1:
+	case WSA881X_SPKR_PROT_ATEST2:
+	case WSA881X_SPKR_PROT_FE_VSENSE_VCM:
+	case WSA881X_SPKR_PROT_FE_VSENSE_BIAS_SET1:
+	case WSA881X_BONGO_RESRV_REG1:
+	case WSA881X_BONGO_RESRV_REG2:
+	case WSA881X_SPKR_PROT_SAR:
+	case WSA881X_SPKR_STATUS3:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static inline bool wsa881x_volatile_register(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case WSA881X_CHIP_ID0:
+	case WSA881X_CHIP_ID1:
+	case WSA881X_CHIP_ID2:
+	case WSA881X_CHIP_ID3:
+	case WSA881X_BUS_ID:
+	case WSA881X_TEMP_MSB:
+	case WSA881X_TEMP_LSB:
+	case WSA881X_SDM_PDM9_LSB:
+	case WSA881X_SDM_PDM9_MSB:
+	case WSA881X_OTP_CTRL1:
+	case WSA881X_INTR_STATUS:
+	case WSA881X_ATE_TEST_MODE:
+	case WSA881X_PIN_STATUS:
+	case WSA881X_SWR_HM_TEST2:
+	case WSA881X_SPKR_STATUS1:
+	case WSA881X_SPKR_STATUS2:
+	case WSA881X_SPKR_STATUS3:
+	case WSA881X_OTP_REG_0:
+	case WSA881X_OTP_REG_1:
+	case WSA881X_OTP_REG_2:
+	case WSA881X_OTP_REG_3:
+	case WSA881X_OTP_REG_4:
+	case WSA881X_OTP_REG_5:
+	case WSA881X_OTP_REG_31:
+	case WSA881X_TEMP_DOUT_MSB:
+	case WSA881X_TEMP_DOUT_LSB:
+	case WSA881X_TEMP_OP:
+	case WSA881X_SPKR_PROT_SAR:
+		return true;
+	default:
+		return false;
+	}
+}
+
+#endif /* __WSA881x_COMMON_H__ */
diff --git a/sound/soc/codecs/wsa881x.c b/sound/soc/codecs/wsa881x.c
index 6627d2da372206eff879f8f3bd5fae9ddc0757d7..3fecc16590a1b0415d944684924f3d41ba3dabd2 100644
--- a/sound/soc/codecs/wsa881x.c
+++ b/sound/soc/codecs/wsa881x.c
@@ -15,172 +15,7 @@
 #include <sound/soc.h>
 #include <sound/tlv.h>
 
-#define WSA881X_DIGITAL_BASE		0x3000
-#define WSA881X_ANALOG_BASE		0x3100
-
-/* Digital register address space */
-#define WSA881X_CHIP_ID0			(WSA881X_DIGITAL_BASE + 0x0000)
-#define WSA881X_CHIP_ID1			(WSA881X_DIGITAL_BASE + 0x0001)
-#define WSA881X_CHIP_ID2			(WSA881X_DIGITAL_BASE + 0x0002)
-#define WSA881X_CHIP_ID3			(WSA881X_DIGITAL_BASE + 0x0003)
-#define WSA881X_BUS_ID				(WSA881X_DIGITAL_BASE + 0x0004)
-#define WSA881X_CDC_RST_CTL			(WSA881X_DIGITAL_BASE + 0x0005)
-#define WSA881X_CDC_TOP_CLK_CTL			(WSA881X_DIGITAL_BASE + 0x0006)
-#define WSA881X_CDC_ANA_CLK_CTL			(WSA881X_DIGITAL_BASE + 0x0007)
-#define WSA881X_CDC_DIG_CLK_CTL			(WSA881X_DIGITAL_BASE + 0x0008)
-#define WSA881X_CLOCK_CONFIG			(WSA881X_DIGITAL_BASE + 0x0009)
-#define WSA881X_ANA_CTL				(WSA881X_DIGITAL_BASE + 0x000A)
-#define WSA881X_SWR_RESET_EN			(WSA881X_DIGITAL_BASE + 0x000B)
-#define WSA881X_RESET_CTL			(WSA881X_DIGITAL_BASE + 0x000C)
-#define WSA881X_TADC_VALUE_CTL			(WSA881X_DIGITAL_BASE + 0x000F)
-#define WSA881X_TEMP_DETECT_CTL			(WSA881X_DIGITAL_BASE + 0x0010)
-#define WSA881X_TEMP_MSB			(WSA881X_DIGITAL_BASE + 0x0011)
-#define WSA881X_TEMP_LSB			(WSA881X_DIGITAL_BASE + 0x0012)
-#define WSA881X_TEMP_CONFIG0			(WSA881X_DIGITAL_BASE + 0x0013)
-#define WSA881X_TEMP_CONFIG1			(WSA881X_DIGITAL_BASE + 0x0014)
-#define WSA881X_CDC_CLIP_CTL			(WSA881X_DIGITAL_BASE + 0x0015)
-#define WSA881X_SDM_PDM9_LSB			(WSA881X_DIGITAL_BASE + 0x0016)
-#define WSA881X_SDM_PDM9_MSB			(WSA881X_DIGITAL_BASE + 0x0017)
-#define WSA881X_CDC_RX_CTL			(WSA881X_DIGITAL_BASE + 0x0018)
-#define WSA881X_DEM_BYPASS_DATA0		(WSA881X_DIGITAL_BASE + 0x0019)
-#define WSA881X_DEM_BYPASS_DATA1		(WSA881X_DIGITAL_BASE + 0x001A)
-#define WSA881X_DEM_BYPASS_DATA2		(WSA881X_DIGITAL_BASE + 0x001B)
-#define WSA881X_DEM_BYPASS_DATA3		(WSA881X_DIGITAL_BASE + 0x001C)
-#define WSA881X_OTP_CTRL0			(WSA881X_DIGITAL_BASE + 0x001D)
-#define WSA881X_OTP_CTRL1			(WSA881X_DIGITAL_BASE + 0x001E)
-#define WSA881X_HDRIVE_CTL_GROUP1		(WSA881X_DIGITAL_BASE + 0x001F)
-#define WSA881X_INTR_MODE			(WSA881X_DIGITAL_BASE + 0x0020)
-#define WSA881X_INTR_MASK			(WSA881X_DIGITAL_BASE + 0x0021)
-#define WSA881X_INTR_STATUS			(WSA881X_DIGITAL_BASE + 0x0022)
-#define WSA881X_INTR_CLEAR			(WSA881X_DIGITAL_BASE + 0x0023)
-#define WSA881X_INTR_LEVEL			(WSA881X_DIGITAL_BASE + 0x0024)
-#define WSA881X_INTR_SET			(WSA881X_DIGITAL_BASE + 0x0025)
-#define WSA881X_INTR_TEST			(WSA881X_DIGITAL_BASE + 0x0026)
-#define WSA881X_PDM_TEST_MODE			(WSA881X_DIGITAL_BASE + 0x0030)
-#define WSA881X_ATE_TEST_MODE			(WSA881X_DIGITAL_BASE + 0x0031)
-#define WSA881X_PIN_CTL_MODE			(WSA881X_DIGITAL_BASE + 0x0032)
-#define WSA881X_PIN_CTL_OE			(WSA881X_DIGITAL_BASE + 0x0033)
-#define WSA881X_PIN_WDATA_IOPAD			(WSA881X_DIGITAL_BASE + 0x0034)
-#define WSA881X_PIN_STATUS			(WSA881X_DIGITAL_BASE + 0x0035)
-#define WSA881X_DIG_DEBUG_MODE			(WSA881X_DIGITAL_BASE + 0x0037)
-#define WSA881X_DIG_DEBUG_SEL			(WSA881X_DIGITAL_BASE + 0x0038)
-#define WSA881X_DIG_DEBUG_EN			(WSA881X_DIGITAL_BASE + 0x0039)
-#define WSA881X_SWR_HM_TEST1			(WSA881X_DIGITAL_BASE + 0x003B)
-#define WSA881X_SWR_HM_TEST2			(WSA881X_DIGITAL_BASE + 0x003C)
-#define WSA881X_TEMP_DETECT_DBG_CTL		(WSA881X_DIGITAL_BASE + 0x003D)
-#define WSA881X_TEMP_DEBUG_MSB			(WSA881X_DIGITAL_BASE + 0x003E)
-#define WSA881X_TEMP_DEBUG_LSB			(WSA881X_DIGITAL_BASE + 0x003F)
-#define WSA881X_SAMPLE_EDGE_SEL			(WSA881X_DIGITAL_BASE + 0x0044)
-#define WSA881X_IOPAD_CTL			(WSA881X_DIGITAL_BASE + 0x0045)
-#define WSA881X_SPARE_0				(WSA881X_DIGITAL_BASE + 0x0050)
-#define WSA881X_SPARE_1				(WSA881X_DIGITAL_BASE + 0x0051)
-#define WSA881X_SPARE_2				(WSA881X_DIGITAL_BASE + 0x0052)
-#define WSA881X_OTP_REG_0			(WSA881X_DIGITAL_BASE + 0x0080)
-#define WSA881X_OTP_REG_1			(WSA881X_DIGITAL_BASE + 0x0081)
-#define WSA881X_OTP_REG_2			(WSA881X_DIGITAL_BASE + 0x0082)
-#define WSA881X_OTP_REG_3			(WSA881X_DIGITAL_BASE + 0x0083)
-#define WSA881X_OTP_REG_4			(WSA881X_DIGITAL_BASE + 0x0084)
-#define WSA881X_OTP_REG_5			(WSA881X_DIGITAL_BASE + 0x0085)
-#define WSA881X_OTP_REG_6			(WSA881X_DIGITAL_BASE + 0x0086)
-#define WSA881X_OTP_REG_7			(WSA881X_DIGITAL_BASE + 0x0087)
-#define WSA881X_OTP_REG_8			(WSA881X_DIGITAL_BASE + 0x0088)
-#define WSA881X_OTP_REG_9			(WSA881X_DIGITAL_BASE + 0x0089)
-#define WSA881X_OTP_REG_10			(WSA881X_DIGITAL_BASE + 0x008A)
-#define WSA881X_OTP_REG_11			(WSA881X_DIGITAL_BASE + 0x008B)
-#define WSA881X_OTP_REG_12			(WSA881X_DIGITAL_BASE + 0x008C)
-#define WSA881X_OTP_REG_13			(WSA881X_DIGITAL_BASE + 0x008D)
-#define WSA881X_OTP_REG_14			(WSA881X_DIGITAL_BASE + 0x008E)
-#define WSA881X_OTP_REG_15			(WSA881X_DIGITAL_BASE + 0x008F)
-#define WSA881X_OTP_REG_16			(WSA881X_DIGITAL_BASE + 0x0090)
-#define WSA881X_OTP_REG_17			(WSA881X_DIGITAL_BASE + 0x0091)
-#define WSA881X_OTP_REG_18			(WSA881X_DIGITAL_BASE + 0x0092)
-#define WSA881X_OTP_REG_19			(WSA881X_DIGITAL_BASE + 0x0093)
-#define WSA881X_OTP_REG_20			(WSA881X_DIGITAL_BASE + 0x0094)
-#define WSA881X_OTP_REG_21			(WSA881X_DIGITAL_BASE + 0x0095)
-#define WSA881X_OTP_REG_22			(WSA881X_DIGITAL_BASE + 0x0096)
-#define WSA881X_OTP_REG_23			(WSA881X_DIGITAL_BASE + 0x0097)
-#define WSA881X_OTP_REG_24			(WSA881X_DIGITAL_BASE + 0x0098)
-#define WSA881X_OTP_REG_25			(WSA881X_DIGITAL_BASE + 0x0099)
-#define WSA881X_OTP_REG_26			(WSA881X_DIGITAL_BASE + 0x009A)
-#define WSA881X_OTP_REG_27			(WSA881X_DIGITAL_BASE + 0x009B)
-#define WSA881X_OTP_REG_28			(WSA881X_DIGITAL_BASE + 0x009C)
-#define WSA881X_OTP_REG_29			(WSA881X_DIGITAL_BASE + 0x009D)
-#define WSA881X_OTP_REG_30			(WSA881X_DIGITAL_BASE + 0x009E)
-#define WSA881X_OTP_REG_31			(WSA881X_DIGITAL_BASE + 0x009F)
-#define WSA881X_OTP_REG_63			(WSA881X_DIGITAL_BASE + 0x00BF)
-
-/* Analog Register address space */
-#define WSA881X_BIAS_REF_CTRL			(WSA881X_ANALOG_BASE + 0x0000)
-#define WSA881X_BIAS_TEST			(WSA881X_ANALOG_BASE + 0x0001)
-#define WSA881X_BIAS_BIAS			(WSA881X_ANALOG_BASE + 0x0002)
-#define WSA881X_TEMP_OP				(WSA881X_ANALOG_BASE + 0x0003)
-#define WSA881X_TEMP_IREF_CTRL			(WSA881X_ANALOG_BASE + 0x0004)
-#define WSA881X_TEMP_ISENS_CTRL			(WSA881X_ANALOG_BASE + 0x0005)
-#define WSA881X_TEMP_CLK_CTRL			(WSA881X_ANALOG_BASE + 0x0006)
-#define WSA881X_TEMP_TEST			(WSA881X_ANALOG_BASE + 0x0007)
-#define WSA881X_TEMP_BIAS			(WSA881X_ANALOG_BASE + 0x0008)
-#define WSA881X_TEMP_ADC_CTRL			(WSA881X_ANALOG_BASE + 0x0009)
-#define WSA881X_TEMP_DOUT_MSB			(WSA881X_ANALOG_BASE + 0x000A)
-#define WSA881X_TEMP_DOUT_LSB			(WSA881X_ANALOG_BASE + 0x000B)
-#define WSA881X_ADC_EN_MODU_V			(WSA881X_ANALOG_BASE + 0x0010)
-#define WSA881X_ADC_EN_MODU_I			(WSA881X_ANALOG_BASE + 0x0011)
-#define WSA881X_ADC_EN_DET_TEST_V		(WSA881X_ANALOG_BASE + 0x0012)
-#define WSA881X_ADC_EN_DET_TEST_I		(WSA881X_ANALOG_BASE + 0x0013)
-#define WSA881X_ADC_SEL_IBIAS			(WSA881X_ANALOG_BASE + 0x0014)
-#define WSA881X_ADC_EN_SEL_IBAIS		(WSA881X_ANALOG_BASE + 0x0015)
-#define WSA881X_SPKR_DRV_EN			(WSA881X_ANALOG_BASE + 0x001A)
-#define WSA881X_SPKR_DRV_GAIN			(WSA881X_ANALOG_BASE + 0x001B)
-#define WSA881X_PA_GAIN_SEL_MASK		BIT(3)
-#define WSA881X_PA_GAIN_SEL_REG			BIT(3)
-#define WSA881X_PA_GAIN_SEL_DRE			0
-#define WSA881X_SPKR_PAG_GAIN_MASK		GENMASK(7, 4)
-#define WSA881X_SPKR_DAC_CTL			(WSA881X_ANALOG_BASE + 0x001C)
-#define WSA881X_SPKR_DRV_DBG			(WSA881X_ANALOG_BASE + 0x001D)
-#define WSA881X_SPKR_PWRSTG_DBG			(WSA881X_ANALOG_BASE + 0x001E)
-#define WSA881X_SPKR_OCP_CTL			(WSA881X_ANALOG_BASE + 0x001F)
-#define WSA881X_SPKR_OCP_MASK			GENMASK(7, 6)
-#define WSA881X_SPKR_OCP_EN			BIT(7)
-#define WSA881X_SPKR_OCP_HOLD			BIT(6)
-#define WSA881X_SPKR_CLIP_CTL			(WSA881X_ANALOG_BASE + 0x0020)
-#define WSA881X_SPKR_BBM_CTL			(WSA881X_ANALOG_BASE + 0x0021)
-#define WSA881X_SPKR_MISC_CTL1			(WSA881X_ANALOG_BASE + 0x0022)
-#define WSA881X_SPKR_MISC_CTL2			(WSA881X_ANALOG_BASE + 0x0023)
-#define WSA881X_SPKR_BIAS_INT			(WSA881X_ANALOG_BASE + 0x0024)
-#define WSA881X_SPKR_PA_INT			(WSA881X_ANALOG_BASE + 0x0025)
-#define WSA881X_SPKR_BIAS_CAL			(WSA881X_ANALOG_BASE + 0x0026)
-#define WSA881X_SPKR_BIAS_PSRR			(WSA881X_ANALOG_BASE + 0x0027)
-#define WSA881X_SPKR_STATUS1			(WSA881X_ANALOG_BASE + 0x0028)
-#define WSA881X_SPKR_STATUS2			(WSA881X_ANALOG_BASE + 0x0029)
-#define WSA881X_BOOST_EN_CTL			(WSA881X_ANALOG_BASE + 0x002A)
-#define WSA881X_BOOST_EN_MASK			BIT(7)
-#define WSA881X_BOOST_EN			BIT(7)
-#define WSA881X_BOOST_CURRENT_LIMIT		(WSA881X_ANALOG_BASE + 0x002B)
-#define WSA881X_BOOST_PS_CTL			(WSA881X_ANALOG_BASE + 0x002C)
-#define WSA881X_BOOST_PRESET_OUT1		(WSA881X_ANALOG_BASE + 0x002D)
-#define WSA881X_BOOST_PRESET_OUT2		(WSA881X_ANALOG_BASE + 0x002E)
-#define WSA881X_BOOST_FORCE_OUT			(WSA881X_ANALOG_BASE + 0x002F)
-#define WSA881X_BOOST_LDO_PROG			(WSA881X_ANALOG_BASE + 0x0030)
-#define WSA881X_BOOST_SLOPE_COMP_ISENSE_FB	(WSA881X_ANALOG_BASE + 0x0031)
-#define WSA881X_BOOST_RON_CTL			(WSA881X_ANALOG_BASE + 0x0032)
-#define WSA881X_BOOST_LOOP_STABILITY		(WSA881X_ANALOG_BASE + 0x0033)
-#define WSA881X_BOOST_ZX_CTL			(WSA881X_ANALOG_BASE + 0x0034)
-#define WSA881X_BOOST_START_CTL			(WSA881X_ANALOG_BASE + 0x0035)
-#define WSA881X_BOOST_MISC1_CTL			(WSA881X_ANALOG_BASE + 0x0036)
-#define WSA881X_BOOST_MISC2_CTL			(WSA881X_ANALOG_BASE + 0x0037)
-#define WSA881X_BOOST_MISC3_CTL			(WSA881X_ANALOG_BASE + 0x0038)
-#define WSA881X_BOOST_ATEST_CTL			(WSA881X_ANALOG_BASE + 0x0039)
-#define WSA881X_SPKR_PROT_FE_GAIN		(WSA881X_ANALOG_BASE + 0x003A)
-#define WSA881X_SPKR_PROT_FE_CM_LDO_SET		(WSA881X_ANALOG_BASE + 0x003B)
-#define WSA881X_SPKR_PROT_FE_ISENSE_BIAS_SET1	(WSA881X_ANALOG_BASE + 0x003C)
-#define WSA881X_SPKR_PROT_FE_ISENSE_BIAS_SET2	(WSA881X_ANALOG_BASE + 0x003D)
-#define WSA881X_SPKR_PROT_ATEST1		(WSA881X_ANALOG_BASE + 0x003E)
-#define WSA881X_SPKR_PROT_ATEST2		(WSA881X_ANALOG_BASE + 0x003F)
-#define WSA881X_SPKR_PROT_FE_VSENSE_VCM		(WSA881X_ANALOG_BASE + 0x0040)
-#define WSA881X_SPKR_PROT_FE_VSENSE_BIAS_SET1	(WSA881X_ANALOG_BASE + 0x0041)
-#define WSA881X_BONGO_RESRV_REG1		(WSA881X_ANALOG_BASE + 0x0042)
-#define WSA881X_BONGO_RESRV_REG2		(WSA881X_ANALOG_BASE + 0x0043)
-#define WSA881X_SPKR_PROT_SAR			(WSA881X_ANALOG_BASE + 0x0044)
-#define WSA881X_SPKR_STATUS3			(WSA881X_ANALOG_BASE + 0x0045)
+#include "wsa881x-common.h"
 
 #define SWRS_SCP_FRAME_CTRL_BANK(m)		(0x60 + 0x10 * (m))
 #define SWRS_SCP_HOST_CLK_DIV2_CTL_BANK(m)	(0xE0 + 0x10 * (m))
@@ -191,7 +26,6 @@
 #define SWR_SLV_RD_BUF_LEN	8
 #define SWR_SLV_WR_BUF_LEN	32
 #define SWR_SLV_MAX_DEVICES	2
-#define WSA881X_MAX_SWR_PORTS   4
 #define WSA881X_VERSION_ENTRY_SIZE 27
 #define WSA881X_OCP_CTL_TIMER_SEC 2
 #define WSA881X_OCP_CTL_TEMP_CELSIUS 25
@@ -300,7 +134,7 @@ static struct reg_default wsa881x_defaults[] = {
 	{ WSA881X_ADC_EN_MODU_I, 0x00 },
 	{ WSA881X_ADC_EN_DET_TEST_V, 0x00 },
 	{ WSA881X_ADC_EN_DET_TEST_I, 0x00 },
-	{ WSA881X_ADC_EN_SEL_IBAIS, 0x10 },
+	{ WSA881X_ADC_EN_SEL_IBIAS, 0x10 },
 	{ WSA881X_SPKR_DRV_EN, 0x74 },
 	{ WSA881X_SPKR_DRV_DBG, 0x15 },
 	{ WSA881X_SPKR_PWRSTG_DBG, 0x00 },
@@ -434,204 +268,8 @@ static const struct sdw_port_config wsa881x_pconfig[WSA881X_MAX_SWR_PORTS] = {
 	},
 };
 
-static bool wsa881x_readable_register(struct device *dev, unsigned int reg)
-{
-	switch (reg) {
-	case WSA881X_CHIP_ID0:
-	case WSA881X_CHIP_ID1:
-	case WSA881X_CHIP_ID2:
-	case WSA881X_CHIP_ID3:
-	case WSA881X_BUS_ID:
-	case WSA881X_CDC_RST_CTL:
-	case WSA881X_CDC_TOP_CLK_CTL:
-	case WSA881X_CDC_ANA_CLK_CTL:
-	case WSA881X_CDC_DIG_CLK_CTL:
-	case WSA881X_CLOCK_CONFIG:
-	case WSA881X_ANA_CTL:
-	case WSA881X_SWR_RESET_EN:
-	case WSA881X_RESET_CTL:
-	case WSA881X_TADC_VALUE_CTL:
-	case WSA881X_TEMP_DETECT_CTL:
-	case WSA881X_TEMP_MSB:
-	case WSA881X_TEMP_LSB:
-	case WSA881X_TEMP_CONFIG0:
-	case WSA881X_TEMP_CONFIG1:
-	case WSA881X_CDC_CLIP_CTL:
-	case WSA881X_SDM_PDM9_LSB:
-	case WSA881X_SDM_PDM9_MSB:
-	case WSA881X_CDC_RX_CTL:
-	case WSA881X_DEM_BYPASS_DATA0:
-	case WSA881X_DEM_BYPASS_DATA1:
-	case WSA881X_DEM_BYPASS_DATA2:
-	case WSA881X_DEM_BYPASS_DATA3:
-	case WSA881X_OTP_CTRL0:
-	case WSA881X_OTP_CTRL1:
-	case WSA881X_HDRIVE_CTL_GROUP1:
-	case WSA881X_INTR_MODE:
-	case WSA881X_INTR_MASK:
-	case WSA881X_INTR_STATUS:
-	case WSA881X_INTR_CLEAR:
-	case WSA881X_INTR_LEVEL:
-	case WSA881X_INTR_SET:
-	case WSA881X_INTR_TEST:
-	case WSA881X_PDM_TEST_MODE:
-	case WSA881X_ATE_TEST_MODE:
-	case WSA881X_PIN_CTL_MODE:
-	case WSA881X_PIN_CTL_OE:
-	case WSA881X_PIN_WDATA_IOPAD:
-	case WSA881X_PIN_STATUS:
-	case WSA881X_DIG_DEBUG_MODE:
-	case WSA881X_DIG_DEBUG_SEL:
-	case WSA881X_DIG_DEBUG_EN:
-	case WSA881X_SWR_HM_TEST1:
-	case WSA881X_SWR_HM_TEST2:
-	case WSA881X_TEMP_DETECT_DBG_CTL:
-	case WSA881X_TEMP_DEBUG_MSB:
-	case WSA881X_TEMP_DEBUG_LSB:
-	case WSA881X_SAMPLE_EDGE_SEL:
-	case WSA881X_IOPAD_CTL:
-	case WSA881X_SPARE_0:
-	case WSA881X_SPARE_1:
-	case WSA881X_SPARE_2:
-	case WSA881X_OTP_REG_0:
-	case WSA881X_OTP_REG_1:
-	case WSA881X_OTP_REG_2:
-	case WSA881X_OTP_REG_3:
-	case WSA881X_OTP_REG_4:
-	case WSA881X_OTP_REG_5:
-	case WSA881X_OTP_REG_6:
-	case WSA881X_OTP_REG_7:
-	case WSA881X_OTP_REG_8:
-	case WSA881X_OTP_REG_9:
-	case WSA881X_OTP_REG_10:
-	case WSA881X_OTP_REG_11:
-	case WSA881X_OTP_REG_12:
-	case WSA881X_OTP_REG_13:
-	case WSA881X_OTP_REG_14:
-	case WSA881X_OTP_REG_15:
-	case WSA881X_OTP_REG_16:
-	case WSA881X_OTP_REG_17:
-	case WSA881X_OTP_REG_18:
-	case WSA881X_OTP_REG_19:
-	case WSA881X_OTP_REG_20:
-	case WSA881X_OTP_REG_21:
-	case WSA881X_OTP_REG_22:
-	case WSA881X_OTP_REG_23:
-	case WSA881X_OTP_REG_24:
-	case WSA881X_OTP_REG_25:
-	case WSA881X_OTP_REG_26:
-	case WSA881X_OTP_REG_27:
-	case WSA881X_OTP_REG_28:
-	case WSA881X_OTP_REG_29:
-	case WSA881X_OTP_REG_30:
-	case WSA881X_OTP_REG_31:
-	case WSA881X_OTP_REG_63:
-	case WSA881X_BIAS_REF_CTRL:
-	case WSA881X_BIAS_TEST:
-	case WSA881X_BIAS_BIAS:
-	case WSA881X_TEMP_OP:
-	case WSA881X_TEMP_IREF_CTRL:
-	case WSA881X_TEMP_ISENS_CTRL:
-	case WSA881X_TEMP_CLK_CTRL:
-	case WSA881X_TEMP_TEST:
-	case WSA881X_TEMP_BIAS:
-	case WSA881X_TEMP_ADC_CTRL:
-	case WSA881X_TEMP_DOUT_MSB:
-	case WSA881X_TEMP_DOUT_LSB:
-	case WSA881X_ADC_EN_MODU_V:
-	case WSA881X_ADC_EN_MODU_I:
-	case WSA881X_ADC_EN_DET_TEST_V:
-	case WSA881X_ADC_EN_DET_TEST_I:
-	case WSA881X_ADC_SEL_IBIAS:
-	case WSA881X_ADC_EN_SEL_IBAIS:
-	case WSA881X_SPKR_DRV_EN:
-	case WSA881X_SPKR_DRV_GAIN:
-	case WSA881X_SPKR_DAC_CTL:
-	case WSA881X_SPKR_DRV_DBG:
-	case WSA881X_SPKR_PWRSTG_DBG:
-	case WSA881X_SPKR_OCP_CTL:
-	case WSA881X_SPKR_CLIP_CTL:
-	case WSA881X_SPKR_BBM_CTL:
-	case WSA881X_SPKR_MISC_CTL1:
-	case WSA881X_SPKR_MISC_CTL2:
-	case WSA881X_SPKR_BIAS_INT:
-	case WSA881X_SPKR_PA_INT:
-	case WSA881X_SPKR_BIAS_CAL:
-	case WSA881X_SPKR_BIAS_PSRR:
-	case WSA881X_SPKR_STATUS1:
-	case WSA881X_SPKR_STATUS2:
-	case WSA881X_BOOST_EN_CTL:
-	case WSA881X_BOOST_CURRENT_LIMIT:
-	case WSA881X_BOOST_PS_CTL:
-	case WSA881X_BOOST_PRESET_OUT1:
-	case WSA881X_BOOST_PRESET_OUT2:
-	case WSA881X_BOOST_FORCE_OUT:
-	case WSA881X_BOOST_LDO_PROG:
-	case WSA881X_BOOST_SLOPE_COMP_ISENSE_FB:
-	case WSA881X_BOOST_RON_CTL:
-	case WSA881X_BOOST_LOOP_STABILITY:
-	case WSA881X_BOOST_ZX_CTL:
-	case WSA881X_BOOST_START_CTL:
-	case WSA881X_BOOST_MISC1_CTL:
-	case WSA881X_BOOST_MISC2_CTL:
-	case WSA881X_BOOST_MISC3_CTL:
-	case WSA881X_BOOST_ATEST_CTL:
-	case WSA881X_SPKR_PROT_FE_GAIN:
-	case WSA881X_SPKR_PROT_FE_CM_LDO_SET:
-	case WSA881X_SPKR_PROT_FE_ISENSE_BIAS_SET1:
-	case WSA881X_SPKR_PROT_FE_ISENSE_BIAS_SET2:
-	case WSA881X_SPKR_PROT_ATEST1:
-	case WSA881X_SPKR_PROT_ATEST2:
-	case WSA881X_SPKR_PROT_FE_VSENSE_VCM:
-	case WSA881X_SPKR_PROT_FE_VSENSE_BIAS_SET1:
-	case WSA881X_BONGO_RESRV_REG1:
-	case WSA881X_BONGO_RESRV_REG2:
-	case WSA881X_SPKR_PROT_SAR:
-	case WSA881X_SPKR_STATUS3:
-		return true;
-	default:
-		return false;
-	}
-}
-
-static bool wsa881x_volatile_register(struct device *dev, unsigned int reg)
-{
-	switch (reg) {
-	case WSA881X_CHIP_ID0:
-	case WSA881X_CHIP_ID1:
-	case WSA881X_CHIP_ID2:
-	case WSA881X_CHIP_ID3:
-	case WSA881X_BUS_ID:
-	case WSA881X_TEMP_MSB:
-	case WSA881X_TEMP_LSB:
-	case WSA881X_SDM_PDM9_LSB:
-	case WSA881X_SDM_PDM9_MSB:
-	case WSA881X_OTP_CTRL1:
-	case WSA881X_INTR_STATUS:
-	case WSA881X_ATE_TEST_MODE:
-	case WSA881X_PIN_STATUS:
-	case WSA881X_SWR_HM_TEST2:
-	case WSA881X_SPKR_STATUS1:
-	case WSA881X_SPKR_STATUS2:
-	case WSA881X_SPKR_STATUS3:
-	case WSA881X_OTP_REG_0:
-	case WSA881X_OTP_REG_1:
-	case WSA881X_OTP_REG_2:
-	case WSA881X_OTP_REG_3:
-	case WSA881X_OTP_REG_4:
-	case WSA881X_OTP_REG_5:
-	case WSA881X_OTP_REG_31:
-	case WSA881X_TEMP_DOUT_MSB:
-	case WSA881X_TEMP_DOUT_LSB:
-	case WSA881X_TEMP_OP:
-	case WSA881X_SPKR_PROT_SAR:
-		return true;
-	default:
-		return false;
-	}
-}
-
 static const struct regmap_config wsa881x_regmap_config = {
+	.reg_base = 0x3000,
 	.reg_bits = 32,
 	.val_bits = 8,
 	.cache_type = REGCACHE_MAPLE,
@@ -660,70 +298,15 @@ enum {
 	G_0DB,
 };
 
-/*
- * Private data Structure for wsa881x. All parameters related to
- * WSA881X codec needs to be defined here.
- */
-struct wsa881x_priv {
-	struct regmap *regmap;
-	struct device *dev;
-	struct sdw_slave *slave;
-	struct sdw_stream_config sconfig;
-	struct sdw_stream_runtime *sruntime;
-	struct sdw_port_config port_config[WSA881X_MAX_SWR_PORTS];
-	struct gpio_desc *sd_n;
-	/*
-	 * Logical state for SD_N GPIO: high for shutdown, low for enable.
-	 * For backwards compatibility.
-	 */
-	unsigned int sd_n_val;
-	int active_ports;
-	bool port_prepared[WSA881X_MAX_SWR_PORTS];
-	bool port_enable[WSA881X_MAX_SWR_PORTS];
-};
-
 static void wsa881x_init(struct wsa881x_priv *wsa881x)
 {
-	struct regmap *rm = wsa881x->regmap;
-	unsigned int val = 0;
-
 	regmap_register_patch(wsa881x->regmap, wsa881x_rev_2_0,
 			      ARRAY_SIZE(wsa881x_rev_2_0));
 
 	/* Enable software reset output from soundwire slave */
-	regmap_update_bits(rm, WSA881X_SWR_RESET_EN, 0x07, 0x07);
-
-	/* Bring out of analog reset */
-	regmap_update_bits(rm, WSA881X_CDC_RST_CTL, 0x02, 0x02);
-
-	/* Bring out of digital reset */
-	regmap_update_bits(rm, WSA881X_CDC_RST_CTL, 0x01, 0x01);
-	regmap_update_bits(rm, WSA881X_CLOCK_CONFIG, 0x10, 0x10);
-	regmap_update_bits(rm, WSA881X_SPKR_OCP_CTL, 0x02, 0x02);
-	regmap_update_bits(rm, WSA881X_SPKR_MISC_CTL1, 0xC0, 0x80);
-	regmap_update_bits(rm, WSA881X_SPKR_MISC_CTL1, 0x06, 0x06);
-	regmap_update_bits(rm, WSA881X_SPKR_BIAS_INT, 0xFF, 0x00);
-	regmap_update_bits(rm, WSA881X_SPKR_PA_INT, 0xF0, 0x40);
-	regmap_update_bits(rm, WSA881X_SPKR_PA_INT, 0x0E, 0x0E);
-	regmap_update_bits(rm, WSA881X_BOOST_LOOP_STABILITY, 0x03, 0x03);
-	regmap_update_bits(rm, WSA881X_BOOST_MISC2_CTL, 0xFF, 0x14);
-	regmap_update_bits(rm, WSA881X_BOOST_START_CTL, 0x80, 0x80);
-	regmap_update_bits(rm, WSA881X_BOOST_START_CTL, 0x03, 0x00);
-	regmap_update_bits(rm, WSA881X_BOOST_SLOPE_COMP_ISENSE_FB, 0x0C, 0x04);
-	regmap_update_bits(rm, WSA881X_BOOST_SLOPE_COMP_ISENSE_FB, 0x03, 0x00);
-
-	regmap_read(rm, WSA881X_OTP_REG_0, &val);
-	if (val)
-		regmap_update_bits(rm, WSA881X_BOOST_PRESET_OUT1, 0xF0, 0x70);
-
-	regmap_update_bits(rm, WSA881X_BOOST_PRESET_OUT2, 0xF0, 0x30);
-	regmap_update_bits(rm, WSA881X_SPKR_DRV_EN, 0x08, 0x08);
-	regmap_update_bits(rm, WSA881X_BOOST_CURRENT_LIMIT, 0x0F, 0x08);
-	regmap_update_bits(rm, WSA881X_SPKR_OCP_CTL, 0x30, 0x30);
-	regmap_update_bits(rm, WSA881X_SPKR_OCP_CTL, 0x0C, 0x00);
-	regmap_update_bits(rm, WSA881X_OTP_REG_28, 0x3F, 0x3A);
-	regmap_update_bits(rm, WSA881X_BONGO_RESRV_REG1, 0xFF, 0xB2);
-	regmap_update_bits(rm, WSA881X_BONGO_RESRV_REG2, 0xFF, 0x05);
+	regmap_update_bits(wsa881x->regmap, WSA881X_SWR_RESET_EN, 0x07, 0x07);
+
+	wsa881x_init_common(wsa881x);
 }
 
 static int wsa881x_component_probe(struct snd_soc_component *comp)
@@ -932,7 +515,7 @@ static int wsa881x_spkr_pa_event(struct snd_soc_dapm_widget *w,
 		if (wsa881x->port_prepared[WSA881X_PORT_VISENSE]) {
 			wsa881x_visense_txfe_ctrl(comp, true);
 			snd_soc_component_update_bits(comp,
-						      WSA881X_ADC_EN_SEL_IBAIS,
+						      WSA881X_ADC_EN_SEL_IBIAS,
 						      0x07, 0x01);
 			wsa881x_visense_adc_ctrl(comp, true);
 		}
@@ -1003,35 +586,11 @@ static int wsa881x_hw_free(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static int wsa881x_set_sdw_stream(struct snd_soc_dai *dai,
-				  void *stream, int direction)
-{
-	struct wsa881x_priv *wsa881x = dev_get_drvdata(dai->dev);
-
-	wsa881x->sruntime = stream;
-
-	return 0;
-}
-
-static int wsa881x_digital_mute(struct snd_soc_dai *dai, int mute, int stream)
-{
-	struct wsa881x_priv *wsa881x = dev_get_drvdata(dai->dev);
-
-	if (mute)
-		regmap_update_bits(wsa881x->regmap, WSA881X_SPKR_DRV_EN, 0x80,
-				   0x00);
-	else
-		regmap_update_bits(wsa881x->regmap, WSA881X_SPKR_DRV_EN, 0x80,
-				   0x80);
-
-	return 0;
-}
-
 static const struct snd_soc_dai_ops wsa881x_dai_ops = {
 	.hw_params = wsa881x_hw_params,
 	.hw_free = wsa881x_hw_free,
 	.mute_stream = wsa881x_digital_mute,
-	.set_stream = wsa881x_set_sdw_stream,
+	.set_stream = wsa881x_set_stream,
 };
 
 static struct snd_soc_dai_driver wsa881x_dais[] = {
@@ -1108,40 +667,13 @@ static int wsa881x_probe(struct sdw_slave *pdev,
 {
 	struct wsa881x_priv *wsa881x;
 	struct device *dev = &pdev->dev;
+	int ret;
 
-	wsa881x = devm_kzalloc(dev, sizeof(*wsa881x), GFP_KERNEL);
-	if (!wsa881x)
-		return -ENOMEM;
-
-	wsa881x->sd_n = devm_gpiod_get_optional(dev, "powerdown",
-						GPIOD_FLAGS_BIT_NONEXCLUSIVE);
-	if (IS_ERR(wsa881x->sd_n))
-		return dev_err_probe(dev, PTR_ERR(wsa881x->sd_n),
-				     "Shutdown Control GPIO not found\n");
-
-	/*
-	 * Backwards compatibility work-around.
-	 *
-	 * The SD_N GPIO is active low, however upstream DTS used always active
-	 * high.  Changing the flag in driver and DTS will break backwards
-	 * compatibility, so add a simple value inversion to work with both old
-	 * and new DTS.
-	 *
-	 * This won't work properly with DTS using the flags properly in cases:
-	 * 1. Old DTS with proper ACTIVE_LOW, however such case was broken
-	 *    before as the driver required the active high.
-	 * 2. New DTS with proper ACTIVE_HIGH (intended), which is rare case
-	 *    (not existing upstream) but possible. This is the price of
-	 *    backwards compatibility, therefore this hack should be removed at
-	 *    some point.
-	 */
-	wsa881x->sd_n_val = gpiod_is_active_low(wsa881x->sd_n);
-	if (!wsa881x->sd_n_val)
-		dev_warn(dev, "Using ACTIVE_HIGH for shutdown GPIO. Your DTB might be outdated or you use unsupported configuration for the GPIO.");
+	ret = wsa881x_probe_common(&wsa881x, dev);
+	if (ret)
+		return ret;
 
-	dev_set_drvdata(dev, wsa881x);
 	wsa881x->slave = pdev;
-	wsa881x->dev = dev;
 	wsa881x->sconfig.ch_count = 1;
 	wsa881x->sconfig.bps = 1;
 	wsa881x->sconfig.frame_rate = 48000;
@@ -1151,7 +683,6 @@ static int wsa881x_probe(struct sdw_slave *pdev,
 	pdev->prop.sink_dpn_prop = wsa_sink_dpn_prop;
 	pdev->prop.scp_int1_mask = SDW_SCP_INT1_BUS_CLASH | SDW_SCP_INT1_PARITY;
 	pdev->prop.clk_stop_mode1 = true;
-	gpiod_direction_output(wsa881x->sd_n, !wsa881x->sd_n_val);
 
 	wsa881x->regmap = devm_regmap_init_sdw(pdev, &wsa881x_regmap_config);
 	if (IS_ERR(wsa881x->regmap))

-- 
2.47.2


