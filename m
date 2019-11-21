Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F8BE1057DB
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Nov 2019 18:06:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727263AbfKURGF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Nov 2019 12:06:05 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:46697 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727234AbfKURGE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Nov 2019 12:06:04 -0500
Received: by mail-wr1-f66.google.com with SMTP id z7so1927704wrl.13
        for <linux-gpio@vger.kernel.org>; Thu, 21 Nov 2019 09:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UpfkndITw/1h6ZYfXIWQrUX2mzHma7l6m7IK0V8q2nM=;
        b=vP8djP/yRLnnypdysOXWBqKLhERiga4p54DXB+glxL/S9HWL/r0wr7DSn1WnAHyn0L
         2+FDhV9km3Qt3a4pjevuPk23hF3U97hYKCPHGZmJQyxxPLv37NJB1F49TAbJNE3vGVoR
         QVSXZ66gVQB2Ee5K0jGB2kFfjAHKUP8zLMk+lp8RdF//H1ndvjHtZs4Pln4+q1WnJgFl
         o2eBPXsnSXjFiJ5xvCq4z1ANV78OornQw89DP/em2a1DkQRBF/dPZCul0lV0kL89Gx5Y
         XYI76xFMJus6bVtX4FYqrjewhQrV3o+sy71OA96yFF8b6ymCKZJsLABixQ+3FD70clyO
         U66w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UpfkndITw/1h6ZYfXIWQrUX2mzHma7l6m7IK0V8q2nM=;
        b=bkl8/q75MXw9IH4C1WAI32eeaJkbUjLg31sXBLHLdux/1532DnzIA6wU/nO0bQPWag
         cNTW08z7gkuxIW1T9DKiKVb5/vfTuxtbGSpcGZ9NSGItmxlpFVnJkPu8NuwM7aVAjpMW
         EAS8brFlE3z/W95+e1ODy+iDuuJS4OevVLV1H4Hlzulsp6i20dP/y1TPF34/pPLdgnKQ
         8FlmTR+yBpuCjGCgp8ohKFgQ+97ER0jlt3NFC/w28ILbX5TNTOSvwyBEnLJD/4qXn4AH
         YYUQKz7wRhYvIOni3+Kdg4oeQaQBD2d7+/FtMlrMNcMV10HwR8iqRgEs/RmOZWfDtf3g
         FyGQ==
X-Gm-Message-State: APjAAAXGrai9+FAves94BMSQgVd+2qmZkZAWH4DwdVuann5SMUy2UoRX
        idric5xCFbLSGqYKIl1sAl1EyQ==
X-Google-Smtp-Source: APXvYqzxvD7pe4C609uvXbtzp+FxkPLcZ8kNUmCHY3YxyCEHKRpQitJWVBU7Io1c0eq4F2ZJ9Nq3gA==
X-Received: by 2002:adf:ee92:: with SMTP id b18mr12651008wro.346.1574355961906;
        Thu, 21 Nov 2019 09:06:01 -0800 (PST)
Received: from srini-hackbox.lan (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.gmail.com with ESMTPSA id i71sm4423731wri.68.2019.11.21.09.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2019 09:06:00 -0800 (PST)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     robh@kernel.org, broonie@kernel.org, lee.jones@linaro.org,
        linus.walleij@linaro.org
Cc:     vinod.koul@linaro.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        spapothi@codeaurora.org, bgoswami@codeaurora.org,
        linux-gpio@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v4 12/12] ASoC: qcom: sdm845: add support to DB845c and Lenovo Yoga
Date:   Thu, 21 Nov 2019 17:05:09 +0000
Message-Id: <20191121170509.10579-13-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191121170509.10579-1-srinivas.kandagatla@linaro.org>
References: <20191121170509.10579-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch adds support to Lenovo Yoga c630 compatible strings
and related setup to the sound machine driver.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/sdm845.c | 86 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 85 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/sdm845.c b/sound/soc/qcom/sdm845.c
index 28f3cef696e6..3b5547a27aad 100644
--- a/sound/soc/qcom/sdm845.c
+++ b/sound/soc/qcom/sdm845.c
@@ -24,6 +24,9 @@
 #define RIGHT_SPK_TDM_TX_MASK   0xC0
 #define SPK_TDM_RX_MASK         0x03
 #define NUM_TDM_SLOTS           8
+#define SLIM_MAX_TX_PORTS 16
+#define SLIM_MAX_RX_PORTS 16
+#define WCD934X_DEFAULT_MCLK_RATE	9600000
 
 struct sdm845_snd_data {
 	struct snd_soc_jack jack;
@@ -36,6 +39,39 @@ struct sdm845_snd_data {
 
 static unsigned int tdm_slot_offset[8] = {0, 4, 8, 12, 16, 20, 24, 28};
 
+static int sdm845_slim_snd_hw_params(struct snd_pcm_substream *substream,
+				     struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_dai_link *dai_link = rtd->dai_link;
+	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	u32 rx_ch[SLIM_MAX_RX_PORTS], tx_ch[SLIM_MAX_TX_PORTS];
+	u32 rx_ch_cnt = 0, tx_ch_cnt = 0;
+	int ret = 0, i;
+
+	for (i = 0 ; i < dai_link->num_codecs; i++) {
+		ret = snd_soc_dai_get_channel_map(rtd->codec_dais[i],
+				&tx_ch_cnt, tx_ch, &rx_ch_cnt, rx_ch);
+
+		if (ret != 0 && ret != -ENOTSUPP) {
+			pr_err("failed to get codec chan map, err:%d\n", ret);
+			return ret;
+		} else if (ret == -ENOTSUPP) {
+			/* Ignore unsupported */
+			continue;
+		}
+
+		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+			ret = snd_soc_dai_set_channel_map(cpu_dai, 0, NULL,
+							  rx_ch_cnt, rx_ch);
+		else
+			ret = snd_soc_dai_set_channel_map(cpu_dai, tx_ch_cnt,
+							  tx_ch, 0, NULL);
+	}
+
+	return 0;
+}
+
 static int sdm845_tdm_snd_hw_params(struct snd_pcm_substream *substream,
 					struct snd_pcm_hw_params *params)
 {
@@ -151,6 +187,11 @@ static int sdm845_snd_hw_params(struct snd_pcm_substream *substream,
 	case QUATERNARY_TDM_TX_0:
 		ret = sdm845_tdm_snd_hw_params(substream, params);
 		break;
+	case SLIMBUS_0_RX...SLIMBUS_6_TX:
+		ret = sdm845_slim_snd_hw_params(substream, params);
+		break;
+	case QUATERNARY_MI2S_RX:
+		break;
 	default:
 		pr_err("%s: invalid dai id 0x%x\n", __func__, cpu_dai->id);
 		break;
@@ -173,7 +214,20 @@ static int sdm845_dai_init(struct snd_soc_pcm_runtime *rtd)
 	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
 	struct sdm845_snd_data *pdata = snd_soc_card_get_drvdata(card);
 	struct snd_jack *jack;
-	int rval;
+	struct snd_soc_dai_link *dai_link = rtd->dai_link;
+	/*
+	 * Codec SLIMBUS configuration
+	 * RX1, RX2, RX3, RX4, RX5, RX6, RX7, RX8, RX9, RX10, RX11, RX12, RX13
+	 * TX1, TX2, TX3, TX4, TX5, TX6, TX7, TX8, TX9, TX10, TX11, TX12, TX13
+	 * TX14, TX15, TX16
+	 */
+	unsigned int rx_ch[SLIM_MAX_RX_PORTS] = {144, 145, 146, 147, 148, 149,
+					150, 151, 152, 153, 154, 155, 156};
+	unsigned int tx_ch[SLIM_MAX_TX_PORTS] = {128, 129, 130, 131, 132, 133,
+					    134, 135, 136, 137, 138, 139,
+					    140, 141, 142, 143};
+	int rval, i;
+
 
 	if (!pdata->jack_setup) {
 		rval = snd_soc_card_jack_new(card, "Headset Jack",
@@ -211,6 +265,21 @@ static int sdm845_dai_init(struct snd_soc_pcm_runtime *rtd)
 			return rval;
 		}
 		break;
+	case SLIMBUS_0_RX...SLIMBUS_6_TX:
+		for (i = 0 ; i < dai_link->num_codecs; i++) {
+			rval = snd_soc_dai_set_channel_map(rtd->codec_dais[i],
+							  ARRAY_SIZE(tx_ch),
+							  tx_ch,
+							  ARRAY_SIZE(rx_ch),
+							  rx_ch);
+			if (rval != 0 && rval != -ENOTSUPP)
+				return rval;
+
+			snd_soc_dai_set_sysclk(rtd->codec_dais[i], 0,
+					       WCD934X_DEFAULT_MCLK_RATE,
+					       SNDRV_PCM_STREAM_PLAYBACK);
+		}
+		break;
 	default:
 		break;
 	}
@@ -256,6 +325,14 @@ static int sdm845_snd_startup(struct snd_pcm_substream *substream)
 		}
 		snd_soc_dai_set_fmt(cpu_dai, fmt);
 		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
+		break;
+	case QUATERNARY_MI2S_RX:
+		snd_soc_dai_set_sysclk(cpu_dai,
+			Q6AFE_LPASS_CLK_ID_QUAD_MI2S_IBIT,
+			MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
+		snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_CBS_CFS);
+
+
 		break;
 
 	case QUATERNARY_TDM_RX_0:
@@ -294,6 +371,8 @@ static int sdm845_snd_startup(struct snd_pcm_substream *substream)
 			}
 		}
 		break;
+	case SLIMBUS_0_RX...SLIMBUS_6_TX:
+		break;
 
 	default:
 		pr_err("%s: invalid dai id 0x%x\n", __func__, cpu_dai->id);
@@ -338,6 +417,9 @@ static void  sdm845_snd_shutdown(struct snd_pcm_substream *substream)
 				0, SNDRV_PCM_STREAM_PLAYBACK);
 		}
 		break;
+	case SLIMBUS_0_RX...SLIMBUS_6_TX:
+	case QUATERNARY_MI2S_RX:
+		break;
 
 	default:
 		pr_err("%s: invalid dai id 0x%x\n", __func__, cpu_dai->id);
@@ -451,6 +533,8 @@ static int sdm845_snd_platform_remove(struct platform_device *pdev)
 
 static const struct of_device_id sdm845_snd_device_id[]  = {
 	{ .compatible = "qcom,sdm845-sndcard" },
+	{ .compatible = "qcom,db845c-sndcard" },
+	{ .compatible = "lenovo,yoga-c630-sndcard" },
 	{},
 };
 MODULE_DEVICE_TABLE(of, sdm845_snd_device_id);
-- 
2.21.0

