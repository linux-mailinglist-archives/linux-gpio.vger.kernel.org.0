Return-Path: <linux-gpio+bounces-24443-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 66352B284EC
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Aug 2025 19:25:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A5ADAE3B51
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Aug 2025 17:25:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE97E30DEB4;
	Fri, 15 Aug 2025 17:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZM34pGx5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F216A30DEB5
	for <linux-gpio@vger.kernel.org>; Fri, 15 Aug 2025 17:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755278677; cv=none; b=X+5EJOY4E4au1KBoSapoTq/sOYpHJcCtTlBMkF729CQ/h3xXo2TKBh6e8PsfMSC38tBuduzv+fJacCw5wGvLV3GQqstI12WvYHzYEEWcVqRsTCP1mv8LqMexZ4wEiTPe2rhazcAHM5S6vKimh1FA41R/859hhOQ3beeUVDF1Nqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755278677; c=relaxed/simple;
	bh=X6mUCGLXCPXZ9t8C01RTNe140Dm018SiDsqQ7M1exFg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BNwSgiQEnjxgBYxKbGieZ5EG3bw5St0TjhTVrJOzkN+DyQmoFVZJDt7B60AChj9lzYggwVnErzB1I90MHWhqmxkZ+KJzoN7sRi/SSwkXv5nurLLoB1jYpd38jWipsiiTUYadYWuo1jSLpPxvOX5XRECDLcK6vR7W2+Vt4nZEJ3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZM34pGx5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57FEIpFv005450
	for <linux-gpio@vger.kernel.org>; Fri, 15 Aug 2025 17:24:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=917KwB9AZyy
	ub7R3lVyuzy+/KECDcgd+v/M3WrVKgC0=; b=ZM34pGx5xVASEg1Y2rfax/dwS4j
	gr99wDyp074RK7d5y5hexk5zwND9q7nDlbhWp9OM1uXgkEYm3GVc5vXtgjXmMqj3
	ObtOzoL6ANuWUsC5MDZSNU+EZZNYFsSjW91J9BYEEB9tUFRYhDCSXrhefgfGiDPT
	bXbSb+KSQ0oh+On/ucqvo2paGLwsQ8jFVsVFGyQIBdlEy0DAbRc4Mdm/A/AkG898
	4AIngwXHpHOw87j6mVs6q1bbmeIfIISljB7OwjhY/EvHFr7oB3oXDMkHrizwo1rC
	m4UbsbXfLLiTNePTpIV9ikhA4AU2j64a4yfDUP3KXUtgVEw2WFW2owdkjcg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fjxbpwww-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 15 Aug 2025 17:24:35 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-24458274406so45911645ad.3
        for <linux-gpio@vger.kernel.org>; Fri, 15 Aug 2025 10:24:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755278674; x=1755883474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=917KwB9AZyyub7R3lVyuzy+/KECDcgd+v/M3WrVKgC0=;
        b=bU4Tb598O0Ev2F/xxm2jhzAQAqSNYJKaa3sI2l32d1tnCA6A9VTqKPOKXu+o8gDBjV
         JGGstvl1nuZ9gznqlVOfkN0jzMHF5d8Ufp/8/lFx82jj4MhhSOZG/20vuHmPoeI994Fc
         xwLJUK34XdufrrSC74t66oyyjay1ALUPqssi0CqcFfxczTGvpXZ4RW9IFR2NgeQ6gHhR
         ayLm7c+xkZ0M2nLNxF8owp34G58hWU0e+6q8TUj9TFVzsROv7pqivBWgGVXh+LfuYS3k
         SWQ7cJC9qR4ywsI++Mvd1hQT0xPQOHhx+Rv0AHyS2hJRUu0p1hp6D0vdrINH2CoSo2fb
         CGdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXL7OqsD22eOtg87fG7AHGJiwwB15Aenmid2JVt7RQYuzxZqdoI3m+WQNkEl0naSlz0ozDHQhB/oO7O@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/qAZ2ILw0OrzENYjF41902eRxK+lJ1G4VzTPlCLr3g2qXMjy9
	O0SMwOXOsZQyKzlkUYnC7ijH1Q6wJBmtueT4/9YLEIRkPruYWgophoISjePQBek3NTj2gOaLO7s
	PtE+dIyzY5QL2IjpmBAYksGVC/OMwYYoWP9a7HlYh+OVRwlG2U8mv7KJym3uIIG3y
X-Gm-Gg: ASbGncvGV0TBB4eI0C3kry3ru2Es11oH1tR7nrd35laj5aBPM/M/GhcK2W2MVRwR5FX
	QwS0+nC3gQ1Gnq2J8Nn6jtSr7TB0AIFWy1EUQDccT71NlWNfPQ5DEDeVI6NqRGDR+OWBx93p+Um
	mgwCD+aC4Kb4sckkQxKms0YeSnLsze2dY3h8D3dtN0LMLhCmxhL8gUfrxHMVYo5s+JCjEZ55F2N
	U0OtqDhCy4hmEZckuxRXllDkmKLzRa8Vvyt3+BxQ8rfu2P/tK/1enyR89SYSWe7DB0bURuCGWtl
	tHgTrz93A+apP1d83OFeRAYQab3SHWo241JzsvXRxKNrPPfpfjKx/O1OuWGHi5+RuW1Nl5VkbJd
	W
X-Received: by 2002:a17:902:db0e:b0:240:2281:bd0e with SMTP id d9443c01a7336-2446d6d3b3dmr45294625ad.2.1755278674116;
        Fri, 15 Aug 2025 10:24:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEu+dypPdoRPI5M25tQHiGVlFs/92TTwxXAZ+MG06yr4C2RER7lW0qJf7bffIDT8gC+8iWWsQ==
X-Received: by 2002:a17:902:db0e:b0:240:2281:bd0e with SMTP id d9443c01a7336-2446d6d3b3dmr45294195ad.2.1755278673487;
        Fri, 15 Aug 2025 10:24:33 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446cadff5asm18404025ad.42.2025.08.15.10.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 10:24:33 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, kernel@oss.qualcomm.com,
        Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Subject: [PATCH v5 2/2] ASoC: codecs: wsa883x: Handle shared reset GPIO for WSA883x speakers
Date: Fri, 15 Aug 2025 22:53:53 +0530
Message-Id: <20250815172353.2430981-3-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250815172353.2430981-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20250815172353.2430981-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=G6EcE8k5 c=1 sm=1 tr=0 ts=689f6d53 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=Ks4s8hASHHiSU9sHUrgA:9
 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA5NyBTYWx0ZWRfX37GuT5nF+4LL
 XbZybA8iqVivcG8YQiBWOlmJigOqwux9CHaeYSYDX4x3OqYxD8w9/zndd20K9EvxldFiGvex0JE
 Y9vjb71kONep2bwRN9OHueB7AJlTYz9q3r9Xn1KbEjn3VM/UsdhkrKByn9Sau+HwG76Rtz4wG1k
 +70JPp+FnPDJ7MKBxtE9BmAP1XzSS7492O8k4wOiTn4xHnEsCjDB9TJBLcyLt0HYYNHc0KUbMDL
 HX/spXTUxGeAwvq7Qlj1Y1KjwuD0ItuzMQx9jAF4mwuNsD3pFWgj5j62MzJ/QXfpHBfoRbCinTu
 kfpNYN4U+NILyENHwr43G6/kfT6dLmWUSDTKMh4Jd8tXDXxkrRHiH9/BUciaLgk8EkB8xHkDchd
 uBoZ9zGF
X-Proofpoint-ORIG-GUID: 3UeO8RvlmHY_a-KnYTSDAIr0Cr29wnak
X-Proofpoint-GUID: 3UeO8RvlmHY_a-KnYTSDAIr0Cr29wnak
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_06,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110097

From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>

On some Qualcomm platforms such as QCS6490-RB3Gen2, the multiple
WSA8830/WSA8835 speaker amplifiers share a common reset (shutdown) GPIO.

To handle such scenario, use the reset controller framework and its
"reset-gpio" driver to handle such case. This allows proper handling
of all WSA883x speaker amplifiers on QCS6490-RB3Gen2 board.

Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
---
 sound/soc/codecs/wsa883x.c | 57 ++++++++++++++++++++++++++++++++------
 1 file changed, 49 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
index 188363b03b93..ca4520ade79a 100644
--- a/sound/soc/codecs/wsa883x.c
+++ b/sound/soc/codecs/wsa883x.c
@@ -14,6 +14,7 @@
 #include <linux/printk.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
+#include <linux/reset.h>
 #include <linux/slab.h>
 #include <linux/soundwire/sdw.h>
 #include <linux/soundwire/sdw_registers.h>
@@ -468,6 +469,7 @@ struct wsa883x_priv {
 	struct sdw_stream_runtime *sruntime;
 	struct sdw_port_config port_config[WSA883X_MAX_SWR_PORTS];
 	struct gpio_desc *sd_n;
+	struct reset_control *sd_reset;
 	bool port_prepared[WSA883X_MAX_SWR_PORTS];
 	bool port_enable[WSA883X_MAX_SWR_PORTS];
 	int active_ports;
@@ -1546,6 +1548,46 @@ static const struct hwmon_chip_info wsa883x_hwmon_chip_info = {
 	.info	= wsa883x_hwmon_info,
 };
 
+static void wsa883x_reset_assert(void *data)
+{
+	struct wsa883x_priv *wsa883x = data;
+
+	if (wsa883x->sd_reset)
+		reset_control_assert(wsa883x->sd_reset);
+	else
+		gpiod_direction_output(wsa883x->sd_n, 1);
+}
+
+static void wsa883x_reset_deassert(struct wsa883x_priv *wsa883x)
+{
+	if (wsa883x->sd_reset)
+		reset_control_deassert(wsa883x->sd_reset);
+	else
+		gpiod_direction_output(wsa883x->sd_n, 0);
+}
+
+static int wsa883x_get_reset(struct device *dev, struct wsa883x_priv *wsa883x)
+{
+	wsa883x->sd_reset = devm_reset_control_get_optional_shared(dev, NULL);
+	if (IS_ERR(wsa883x->sd_reset))
+		return dev_err_probe(dev, PTR_ERR(wsa883x->sd_reset),
+				     "Failed to get reset\n");
+	/*
+	 * if sd_reset: NULL, so use the backwards compatible way for powerdown-gpios,
+	 * which does not handle sharing GPIO properly.
+	 */
+	if (!wsa883x->sd_reset) {
+		wsa883x->sd_n = devm_gpiod_get_optional(dev, "powerdown",
+							GPIOD_FLAGS_BIT_NONEXCLUSIVE |
+							GPIOD_OUT_HIGH);
+		if (IS_ERR(wsa883x->sd_n))
+			return dev_err_probe(dev, PTR_ERR(wsa883x->sd_n),
+					     "Shutdown Control GPIO not found\n");
+	}
+
+	return 0;
+}
+
 static int wsa883x_probe(struct sdw_slave *pdev,
 			 const struct sdw_device_id *id)
 {
@@ -1566,13 +1608,9 @@ static int wsa883x_probe(struct sdw_slave *pdev,
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to enable vdd regulator\n");
 
-	wsa883x->sd_n = devm_gpiod_get_optional(dev, "powerdown",
-						GPIOD_FLAGS_BIT_NONEXCLUSIVE | GPIOD_OUT_HIGH);
-	if (IS_ERR(wsa883x->sd_n)) {
-		ret = dev_err_probe(dev, PTR_ERR(wsa883x->sd_n),
-				    "Shutdown Control GPIO not found\n");
+	ret = wsa883x_get_reset(dev, wsa883x);
+	if (ret)
 		goto err;
-	}
 
 	dev_set_drvdata(dev, wsa883x);
 	wsa883x->slave = pdev;
@@ -1595,11 +1633,14 @@ static int wsa883x_probe(struct sdw_slave *pdev,
 	pdev->prop.simple_clk_stop_capable = true;
 	pdev->prop.sink_dpn_prop = wsa_sink_dpn_prop;
 	pdev->prop.scp_int1_mask = SDW_SCP_INT1_BUS_CLASH | SDW_SCP_INT1_PARITY;
-	gpiod_direction_output(wsa883x->sd_n, 0);
+
+	wsa883x_reset_deassert(wsa883x);
+	ret = devm_add_action_or_reset(dev, wsa883x_reset_assert, wsa883x);
+	if (ret)
+		return ret;
 
 	wsa883x->regmap = devm_regmap_init_sdw(pdev, &wsa883x_regmap_config);
 	if (IS_ERR(wsa883x->regmap)) {
-		gpiod_direction_output(wsa883x->sd_n, 1);
 		ret = dev_err_probe(dev, PTR_ERR(wsa883x->regmap),
 				    "regmap_init failed\n");
 		goto err;
-- 
2.34.1


