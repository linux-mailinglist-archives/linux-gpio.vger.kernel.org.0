Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE725125F14
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2019 11:33:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726754AbfLSKdk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Dec 2019 05:33:40 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:35774 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726853AbfLSKdO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Dec 2019 05:33:14 -0500
Received: by mail-wm1-f65.google.com with SMTP id p17so5072821wmb.0
        for <linux-gpio@vger.kernel.org>; Thu, 19 Dec 2019 02:33:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cc/Wcghptv17eVo74c8YLg74slbbKTTES3sc9U0AuPU=;
        b=Knz8XZQxvrqCAziJ5Io5M47qu60/JIGafmV2LXe7XAK5Ysm80nt6pQgyyZL0TZfbOB
         m4YS9T3A6tv27CAPBMqG1iFqtUamry0y9Y7r1K0CelFa/6xpAkMFEj33DJZ/4SKCQpXx
         cU6pXhJEsRTHsIka9XDhd39LO19BFqM9QARfbM4FpzYhMCI8WpvX3/rQ4Z+SBtSBGdj3
         SB5c46cQS+25HGjNyCBHCbIoMMXPL1hkwoYVfvMuB7fSL70DsvlfrMmNU2Y4uS1Gs3jo
         mZ+4nyI1i8NGgUKwoDPZlASGmt6Q2u6RM7nXAvf4z3/a0Z2KYiDzP2oG/sVJR4YkYyng
         VUuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cc/Wcghptv17eVo74c8YLg74slbbKTTES3sc9U0AuPU=;
        b=PlkpR4C1hpDYdglyM0u4HFSWTJ+LV7cbHNXSMAY4zQ0wJ5UrWhVlcKPw7RZ0IoHE8P
         Gcou3rXjTd6y1SN641QSlQD1PW1V/tCyvcVsXFZ/rjoWpbyQWLs3szGSwvUOSUKWUA7V
         lyv0+9neXL6nmxUKVtfEwLBPmE+u63CTTcRIDkPulzWuqvRBSdw/giTj/JWkH9vv//Ec
         +CWv9w345KVLc0glGQclOMVYZf2sgHvWKpKWIAQ8xaf3l+deTlM+4Ts0ufbbuiEHCwMO
         Le9WJ9r+JngnLjxl/U8epP/CrTJqhyFe10dl83AuwnaBEKNkhRzTfd9AiSuBXHCXZuvg
         4SkA==
X-Gm-Message-State: APjAAAXb7QUE7YfHLdT0/rnl4xTQlzrVAfdioGQZVLdtzdxLcLyF4Ljg
        1p/XnmUxqOZpA5snyWKBUs3lUQ==
X-Google-Smtp-Source: APXvYqzBbjxALPKEqx0qx5tqcV0AEweYyIjKRxiRHg9Yap0x+zKqyEQHY1D40pg3fh4b6C7N+SrLgA==
X-Received: by 2002:a1c:7f94:: with SMTP id a142mr9035050wmd.33.1576751591109;
        Thu, 19 Dec 2019 02:33:11 -0800 (PST)
Received: from srini-hackbox.lan (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.gmail.com with ESMTPSA id i11sm5962942wrs.10.2019.12.19.02.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2019 02:33:10 -0800 (PST)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     broonie@kernel.org, lee.jones@linaro.org, linus.walleij@linaro.org
Cc:     robh@kernel.org, vinod.koul@linaro.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, spapothi@codeaurora.org,
        bgoswami@codeaurora.org, linux-gpio@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v6 07/11] ASoC: wcd934x: add audio routings
Date:   Thu, 19 Dec 2019 10:31:49 +0000
Message-Id: <20191219103153.14875-8-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191219103153.14875-1-srinivas.kandagatla@linaro.org>
References: <20191219103153.14875-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch adds audio routing for both playback and capture.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/wcd934x.c | 290 +++++++++++++++++++++++++++++++++++++
 1 file changed, 290 insertions(+)

diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
index 24f78a0b7f5a..158e878abd6c 100644
--- a/sound/soc/codecs/wcd934x.c
+++ b/sound/soc/codecs/wcd934x.c
@@ -135,6 +135,162 @@
 	} \
 }
 
+#define WCD934X_INTERPOLATOR_PATH(id)			\
+	{"RX INT" #id "_1 MIX1 INP0", "RX0", "SLIM RX0"},	\
+	{"RX INT" #id "_1 MIX1 INP0", "RX1", "SLIM RX1"},	\
+	{"RX INT" #id "_1 MIX1 INP0", "RX2", "SLIM RX2"},	\
+	{"RX INT" #id "_1 MIX1 INP0", "RX3", "SLIM RX3"},	\
+	{"RX INT" #id "_1 MIX1 INP0", "RX4", "SLIM RX4"},	\
+	{"RX INT" #id "_1 MIX1 INP0", "RX5", "SLIM RX5"},	\
+	{"RX INT" #id "_1 MIX1 INP0", "RX6", "SLIM RX6"},	\
+	{"RX INT" #id "_1 MIX1 INP0", "RX7", "SLIM RX7"},	\
+	{"RX INT" #id "_1 MIX1 INP0", "IIR0", "IIR0"},	\
+	{"RX INT" #id "_1 MIX1 INP0", "IIR1", "IIR1"},	\
+	{"RX INT" #id "_1 MIX1 INP1", "RX0", "SLIM RX0"},	\
+	{"RX INT" #id "_1 MIX1 INP1", "RX1", "SLIM RX1"},	\
+	{"RX INT" #id "_1 MIX1 INP1", "RX2", "SLIM RX2"},	\
+	{"RX INT" #id "_1 MIX1 INP1", "RX3", "SLIM RX3"},	\
+	{"RX INT" #id "_1 MIX1 INP1", "RX4", "SLIM RX4"},	\
+	{"RX INT" #id "_1 MIX1 INP1", "RX5", "SLIM RX5"},	\
+	{"RX INT" #id "_1 MIX1 INP1", "RX6", "SLIM RX6"},	\
+	{"RX INT" #id "_1 MIX1 INP1", "RX7", "SLIM RX7"},	\
+	{"RX INT" #id "_1 MIX1 INP1", "IIR0", "IIR0"},	\
+	{"RX INT" #id "_1 MIX1 INP1", "IIR1", "IIR1"},	\
+	{"RX INT" #id "_1 MIX1 INP2", "RX0", "SLIM RX0"},	\
+	{"RX INT" #id "_1 MIX1 INP2", "RX1", "SLIM RX1"},	\
+	{"RX INT" #id "_1 MIX1 INP2", "RX2", "SLIM RX2"},	\
+	{"RX INT" #id "_1 MIX1 INP2", "RX3", "SLIM RX3"},	\
+	{"RX INT" #id "_1 MIX1 INP2", "RX4", "SLIM RX4"},	\
+	{"RX INT" #id "_1 MIX1 INP2", "RX5", "SLIM RX5"},	\
+	{"RX INT" #id "_1 MIX1 INP2", "RX6", "SLIM RX6"},	\
+	{"RX INT" #id "_1 MIX1 INP2", "RX7", "SLIM RX7"},	\
+	{"RX INT" #id "_1 MIX1 INP2", "IIR0", "IIR0"},		\
+	{"RX INT" #id "_1 MIX1 INP2", "IIR1", "IIR1"},		\
+	{"RX INT" #id "_1 MIX1", NULL, "RX INT" #id "_1 MIX1 INP0"}, \
+	{"RX INT" #id "_1 MIX1", NULL, "RX INT" #id "_1 MIX1 INP1"}, \
+	{"RX INT" #id "_1 MIX1", NULL, "RX INT" #id "_1 MIX1 INP2"}, \
+	{"RX INT" #id "_2 MUX", "RX0", "SLIM RX0"},	\
+	{"RX INT" #id "_2 MUX", "RX1", "SLIM RX1"},	\
+	{"RX INT" #id "_2 MUX", "RX2", "SLIM RX2"},	\
+	{"RX INT" #id "_2 MUX", "RX3", "SLIM RX3"},	\
+	{"RX INT" #id "_2 MUX", "RX4", "SLIM RX4"},	\
+	{"RX INT" #id "_2 MUX", "RX5", "SLIM RX5"},	\
+	{"RX INT" #id "_2 MUX", "RX6", "SLIM RX6"},	\
+	{"RX INT" #id "_2 MUX", "RX7", "SLIM RX7"},	\
+	{"RX INT" #id "_2 MUX", NULL, "INT" #id "_CLK"}, \
+	{"RX INT" #id "_2 MUX", NULL, "DSMDEM" #id "_CLK"}, \
+	{"RX INT" #id "_2 INTERP", NULL, "RX INT" #id "_2 MUX"},	\
+	{"RX INT" #id " SEC MIX", NULL, "RX INT" #id "_2 INTERP"},	\
+	{"RX INT" #id "_1 INTERP", NULL, "RX INT" #id "_1 MIX1"},	\
+	{"RX INT" #id "_1 INTERP", NULL, "INT" #id "_CLK"},	\
+	{"RX INT" #id "_1 INTERP", NULL, "DSMDEM" #id "_CLK"},	\
+	{"RX INT" #id " SEC MIX", NULL, "RX INT" #id "_1 INTERP"}
+
+#define WCD934X_INTERPOLATOR_MIX2(id)			\
+	{"RX INT" #id " MIX2", NULL, "RX INT" #id " SEC MIX"}, \
+	{"RX INT" #id " MIX2", NULL, "RX INT" #id " MIX2 INP"}
+
+#define WCD934X_SLIM_RX_AIF_PATH(id)	\
+	{"SLIM RX"#id" MUX", "AIF1_PB", "AIF1 PB"},	\
+	{"SLIM RX"#id" MUX", "AIF2_PB", "AIF2 PB"},	\
+	{"SLIM RX"#id" MUX", "AIF3_PB", "AIF3 PB"},	\
+	{"SLIM RX"#id" MUX", "AIF4_PB", "AIF4 PB"},   \
+	{"SLIM RX"#id, NULL, "SLIM RX"#id" MUX"}
+
+#define WCD934X_ADC_MUX(id) \
+	{"ADC MUX" #id, "DMIC", "DMIC MUX" #id },	\
+	{"ADC MUX" #id, "AMIC", "AMIC MUX" #id },	\
+	{"DMIC MUX" #id, "DMIC0", "DMIC0"},		\
+	{"DMIC MUX" #id, "DMIC1", "DMIC1"},		\
+	{"DMIC MUX" #id, "DMIC2", "DMIC2"},		\
+	{"DMIC MUX" #id, "DMIC3", "DMIC3"},		\
+	{"DMIC MUX" #id, "DMIC4", "DMIC4"},		\
+	{"DMIC MUX" #id, "DMIC5", "DMIC5"},		\
+	{"AMIC MUX" #id, "ADC1", "ADC1"},		\
+	{"AMIC MUX" #id, "ADC2", "ADC2"},		\
+	{"AMIC MUX" #id, "ADC3", "ADC3"},		\
+	{"AMIC MUX" #id, "ADC4", "ADC4"}
+
+#define WCD934X_IIR_INP_MUX(id) \
+	{"IIR" #id, NULL, "IIR" #id " INP0 MUX"},	\
+	{"IIR" #id " INP0 MUX", "DEC0", "ADC MUX0"},	\
+	{"IIR" #id " INP0 MUX", "DEC1", "ADC MUX1"},	\
+	{"IIR" #id " INP0 MUX", "DEC2", "ADC MUX2"},	\
+	{"IIR" #id " INP0 MUX", "DEC3", "ADC MUX3"},	\
+	{"IIR" #id " INP0 MUX", "DEC4", "ADC MUX4"},	\
+	{"IIR" #id " INP0 MUX", "DEC5", "ADC MUX5"},	\
+	{"IIR" #id " INP0 MUX", "DEC6", "ADC MUX6"},	\
+	{"IIR" #id " INP0 MUX", "DEC7", "ADC MUX7"},	\
+	{"IIR" #id " INP0 MUX", "DEC8", "ADC MUX8"},	\
+	{"IIR" #id " INP0 MUX", "RX0", "SLIM RX0"},	\
+	{"IIR" #id " INP0 MUX", "RX1", "SLIM RX1"},	\
+	{"IIR" #id " INP0 MUX", "RX2", "SLIM RX2"},	\
+	{"IIR" #id " INP0 MUX", "RX3", "SLIM RX3"},	\
+	{"IIR" #id " INP0 MUX", "RX4", "SLIM RX4"},	\
+	{"IIR" #id " INP0 MUX", "RX5", "SLIM RX5"},	\
+	{"IIR" #id " INP0 MUX", "RX6", "SLIM RX6"},	\
+	{"IIR" #id " INP0 MUX", "RX7", "SLIM RX7"},	\
+	{"IIR" #id, NULL, "IIR" #id " INP1 MUX"},	\
+	{"IIR" #id " INP1 MUX", "DEC0", "ADC MUX0"},	\
+	{"IIR" #id " INP1 MUX", "DEC1", "ADC MUX1"},	\
+	{"IIR" #id " INP1 MUX", "DEC2", "ADC MUX2"},	\
+	{"IIR" #id " INP1 MUX", "DEC3", "ADC MUX3"},	\
+	{"IIR" #id " INP1 MUX", "DEC4", "ADC MUX4"},	\
+	{"IIR" #id " INP1 MUX", "DEC5", "ADC MUX5"},	\
+	{"IIR" #id " INP1 MUX", "DEC6", "ADC MUX6"},	\
+	{"IIR" #id " INP1 MUX", "DEC7", "ADC MUX7"},	\
+	{"IIR" #id " INP1 MUX", "DEC8", "ADC MUX8"},	\
+	{"IIR" #id " INP1 MUX", "RX0", "SLIM RX0"},	\
+	{"IIR" #id " INP1 MUX", "RX1", "SLIM RX1"},	\
+	{"IIR" #id " INP1 MUX", "RX2", "SLIM RX2"},	\
+	{"IIR" #id " INP1 MUX", "RX3", "SLIM RX3"},	\
+	{"IIR" #id " INP1 MUX", "RX4", "SLIM RX4"},	\
+	{"IIR" #id " INP1 MUX", "RX5", "SLIM RX5"},	\
+	{"IIR" #id " INP1 MUX", "RX6", "SLIM RX6"},	\
+	{"IIR" #id " INP1 MUX", "RX7", "SLIM RX7"},	\
+	{"IIR" #id, NULL, "IIR" #id " INP2 MUX"},	\
+	{"IIR" #id " INP2 MUX", "DEC0", "ADC MUX0"},	\
+	{"IIR" #id " INP2 MUX", "DEC1", "ADC MUX1"},	\
+	{"IIR" #id " INP2 MUX", "DEC2", "ADC MUX2"},	\
+	{"IIR" #id " INP2 MUX", "DEC3", "ADC MUX3"},	\
+	{"IIR" #id " INP2 MUX", "DEC4", "ADC MUX4"},	\
+	{"IIR" #id " INP2 MUX", "DEC5", "ADC MUX5"},	\
+	{"IIR" #id " INP2 MUX", "DEC6", "ADC MUX6"},	\
+	{"IIR" #id " INP2 MUX", "DEC7", "ADC MUX7"},	\
+	{"IIR" #id " INP2 MUX", "DEC8", "ADC MUX8"},	\
+	{"IIR" #id " INP2 MUX", "RX0", "SLIM RX0"},	\
+	{"IIR" #id " INP2 MUX", "RX1", "SLIM RX1"},	\
+	{"IIR" #id " INP2 MUX", "RX2", "SLIM RX2"},	\
+	{"IIR" #id " INP2 MUX", "RX3", "SLIM RX3"},	\
+	{"IIR" #id " INP2 MUX", "RX4", "SLIM RX4"},	\
+	{"IIR" #id " INP2 MUX", "RX5", "SLIM RX5"},	\
+	{"IIR" #id " INP2 MUX", "RX6", "SLIM RX6"},	\
+	{"IIR" #id " INP2 MUX", "RX7", "SLIM RX7"},	\
+	{"IIR" #id, NULL, "IIR" #id " INP3 MUX"},	\
+	{"IIR" #id " INP3 MUX", "DEC0", "ADC MUX0"},	\
+	{"IIR" #id " INP3 MUX", "DEC1", "ADC MUX1"},	\
+	{"IIR" #id " INP3 MUX", "DEC2", "ADC MUX2"},	\
+	{"IIR" #id " INP3 MUX", "DEC3", "ADC MUX3"},	\
+	{"IIR" #id " INP3 MUX", "DEC4", "ADC MUX4"},	\
+	{"IIR" #id " INP3 MUX", "DEC5", "ADC MUX5"},	\
+	{"IIR" #id " INP3 MUX", "DEC6", "ADC MUX6"},	\
+	{"IIR" #id " INP3 MUX", "DEC7", "ADC MUX7"},	\
+	{"IIR" #id " INP3 MUX", "DEC8", "ADC MUX8"},	\
+	{"IIR" #id " INP3 MUX", "RX0", "SLIM RX0"},	\
+	{"IIR" #id " INP3 MUX", "RX1", "SLIM RX1"},	\
+	{"IIR" #id " INP3 MUX", "RX2", "SLIM RX2"},	\
+	{"IIR" #id " INP3 MUX", "RX3", "SLIM RX3"},	\
+	{"IIR" #id " INP3 MUX", "RX4", "SLIM RX4"},	\
+	{"IIR" #id " INP3 MUX", "RX5", "SLIM RX5"},	\
+	{"IIR" #id " INP3 MUX", "RX6", "SLIM RX6"},	\
+	{"IIR" #id " INP3 MUX", "RX7", "SLIM RX7"}
+
+#define WCD934X_SLIM_TX_AIF_PATH(id)	\
+	{"AIF1_CAP Mixer", "SLIM TX" #id, "SLIM TX" #id },	\
+	{"AIF2_CAP Mixer", "SLIM TX" #id, "SLIM TX" #id },	\
+	{"AIF3_CAP Mixer", "SLIM TX" #id, "SLIM TX" #id },	\
+	{"SLIM TX" #id, NULL, "CDC_IF TX" #id " MUX"}
+
 enum {
 	MIC_BIAS_1 = 1,
 	MIC_BIAS_2,
@@ -4678,6 +4834,138 @@ static const struct snd_soc_dapm_widget wcd934x_dapm_widgets[] = {
 			   ARRAY_SIZE(aif3_slim_cap_mixer)),
 };
 
+static const struct snd_soc_dapm_route wcd934x_audio_map[] = {
+	/* RX0-RX7 */
+	WCD934X_SLIM_RX_AIF_PATH(0),
+	WCD934X_SLIM_RX_AIF_PATH(1),
+	WCD934X_SLIM_RX_AIF_PATH(2),
+	WCD934X_SLIM_RX_AIF_PATH(3),
+	WCD934X_SLIM_RX_AIF_PATH(4),
+	WCD934X_SLIM_RX_AIF_PATH(5),
+	WCD934X_SLIM_RX_AIF_PATH(6),
+	WCD934X_SLIM_RX_AIF_PATH(7),
+
+	/* RX0 Ear out */
+	WCD934X_INTERPOLATOR_PATH(0),
+	WCD934X_INTERPOLATOR_MIX2(0),
+	{"RX INT0 DEM MUX", "CLSH_DSM_OUT", "RX INT0 MIX2"},
+	{"RX INT0 DAC", NULL, "RX INT0 DEM MUX"},
+	{"RX INT0 DAC", NULL, "RX_BIAS"},
+	{"EAR PA", NULL, "RX INT0 DAC"},
+	{"EAR", NULL, "EAR PA"},
+
+	/* RX1 Headphone left */
+	WCD934X_INTERPOLATOR_PATH(1),
+	WCD934X_INTERPOLATOR_MIX2(1),
+	{"RX INT1 MIX3", NULL, "RX INT1 MIX2"},
+	{"RX INT1 DEM MUX", "CLSH_DSM_OUT", "RX INT1 MIX3"},
+	{"RX INT1 DAC", NULL, "RX INT1 DEM MUX"},
+	{"RX INT1 DAC", NULL, "RX_BIAS"},
+	{"HPHL PA", NULL, "RX INT1 DAC"},
+	{"HPHL", NULL, "HPHL PA"},
+
+	/* RX2 Headphone right */
+	WCD934X_INTERPOLATOR_PATH(2),
+	WCD934X_INTERPOLATOR_MIX2(2),
+	{"RX INT2 MIX3", NULL, "RX INT2 MIX2"},
+	{"RX INT2 DEM MUX", "CLSH_DSM_OUT", "RX INT2 MIX3"},
+	{"RX INT2 DAC", NULL, "RX INT2 DEM MUX"},
+	{"RX INT2 DAC", NULL, "RX_BIAS"},
+	{"HPHR PA", NULL, "RX INT2 DAC"},
+	{"HPHR", NULL, "HPHR PA"},
+
+	/* RX3 HIFi LineOut1 */
+	WCD934X_INTERPOLATOR_PATH(3),
+	WCD934X_INTERPOLATOR_MIX2(3),
+	{"RX INT3 MIX3", NULL, "RX INT3 MIX2"},
+	{"RX INT3 DAC", NULL, "RX INT3 MIX3"},
+	{"RX INT3 DAC", NULL, "RX_BIAS"},
+	{"LINEOUT1 PA", NULL, "RX INT3 DAC"},
+	{"LINEOUT1", NULL, "LINEOUT1 PA"},
+
+	/* RX4 HIFi LineOut2 */
+	WCD934X_INTERPOLATOR_PATH(4),
+	WCD934X_INTERPOLATOR_MIX2(4),
+	{"RX INT4 MIX3", NULL, "RX INT4 MIX2"},
+	{"RX INT4 DAC", NULL, "RX INT4 MIX3"},
+	{"RX INT4 DAC", NULL, "RX_BIAS"},
+	{"LINEOUT2 PA", NULL, "RX INT4 DAC"},
+	{"LINEOUT2", NULL, "LINEOUT2 PA"},
+
+	/* RX7 Speaker Left Out PA */
+	WCD934X_INTERPOLATOR_PATH(7),
+	WCD934X_INTERPOLATOR_MIX2(7),
+	{"RX INT7 CHAIN", NULL, "RX INT7 MIX2"},
+	{"RX INT7 CHAIN", NULL, "RX_BIAS"},
+	{"RX INT7 CHAIN", NULL, "SBOOST0"},
+	{"RX INT7 CHAIN", NULL, "SBOOST0_CLK"},
+	{"SPK1 OUT", NULL, "RX INT7 CHAIN"},
+
+	/* RX8 Speaker Right Out PA */
+	WCD934X_INTERPOLATOR_PATH(8),
+	{"RX INT8 CHAIN", NULL, "RX INT8 SEC MIX"},
+	{"RX INT8 CHAIN", NULL, "RX_BIAS"},
+	{"RX INT8 CHAIN", NULL, "SBOOST1"},
+	{"RX INT8 CHAIN", NULL, "SBOOST1_CLK"},
+	{"SPK2 OUT", NULL, "RX INT8 CHAIN"},
+
+	/* Tx */
+	{"AIF1 CAP", NULL, "AIF1_CAP Mixer"},
+	{"AIF2 CAP", NULL, "AIF2_CAP Mixer"},
+	{"AIF3 CAP", NULL, "AIF3_CAP Mixer"},
+
+	WCD934X_SLIM_TX_AIF_PATH(0),
+	WCD934X_SLIM_TX_AIF_PATH(1),
+	WCD934X_SLIM_TX_AIF_PATH(2),
+	WCD934X_SLIM_TX_AIF_PATH(3),
+	WCD934X_SLIM_TX_AIF_PATH(4),
+	WCD934X_SLIM_TX_AIF_PATH(5),
+	WCD934X_SLIM_TX_AIF_PATH(6),
+	WCD934X_SLIM_TX_AIF_PATH(7),
+	WCD934X_SLIM_TX_AIF_PATH(8),
+
+	WCD934X_ADC_MUX(0),
+	WCD934X_ADC_MUX(1),
+	WCD934X_ADC_MUX(2),
+	WCD934X_ADC_MUX(3),
+	WCD934X_ADC_MUX(4),
+	WCD934X_ADC_MUX(5),
+	WCD934X_ADC_MUX(6),
+	WCD934X_ADC_MUX(7),
+	WCD934X_ADC_MUX(8),
+
+	{"CDC_IF TX0 MUX", "DEC0", "ADC MUX0"},
+	{"CDC_IF TX1 MUX", "DEC1", "ADC MUX1"},
+	{"CDC_IF TX2 MUX", "DEC2", "ADC MUX2"},
+	{"CDC_IF TX3 MUX", "DEC3", "ADC MUX3"},
+	{"CDC_IF TX4 MUX", "DEC4", "ADC MUX4"},
+	{"CDC_IF TX5 MUX", "DEC5", "ADC MUX5"},
+	{"CDC_IF TX6 MUX", "DEC6", "ADC MUX6"},
+	{"CDC_IF TX7 MUX", "DEC7", "ADC MUX7"},
+	{"CDC_IF TX8 MUX", "DEC8", "ADC MUX8"},
+
+	{"AMIC4_5 SEL", "AMIC4", "AMIC4"},
+	{"AMIC4_5 SEL", "AMIC5", "AMIC5"},
+
+	{ "DMIC0", NULL, "DMIC0 Pin" },
+	{ "DMIC1", NULL, "DMIC1 Pin" },
+	{ "DMIC2", NULL, "DMIC2 Pin" },
+	{ "DMIC3", NULL, "DMIC3 Pin" },
+	{ "DMIC4", NULL, "DMIC4 Pin" },
+	{ "DMIC5", NULL, "DMIC5 Pin" },
+
+	{"ADC1", NULL, "AMIC1"},
+	{"ADC2", NULL, "AMIC2"},
+	{"ADC3", NULL, "AMIC3"},
+	{"ADC4", NULL, "AMIC4_5 SEL"},
+
+	WCD934X_IIR_INP_MUX(0),
+	WCD934X_IIR_INP_MUX(1),
+
+	{"SRC0", NULL, "IIR0"},
+	{"SRC1", NULL, "IIR1"},
+};
+
 static const struct snd_soc_component_driver wcd934x_component_drv = {
 	.probe = wcd934x_comp_probe,
 	.remove = wcd934x_comp_remove,
@@ -4686,6 +4974,8 @@ static const struct snd_soc_component_driver wcd934x_component_drv = {
 	.num_controls = ARRAY_SIZE(wcd934x_snd_controls),
 	.dapm_widgets = wcd934x_dapm_widgets,
 	.num_dapm_widgets = ARRAY_SIZE(wcd934x_dapm_widgets),
+	.dapm_routes = wcd934x_audio_map,
+	.num_dapm_routes = ARRAY_SIZE(wcd934x_audio_map),
 };
 
 static int wcd934x_codec_parse_data(struct wcd934x_codec *wcd)
-- 
2.21.0

