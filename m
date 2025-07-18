Return-Path: <linux-gpio+bounces-23462-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D084B0A103
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 12:48:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A623A7BA6CB
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 10:46:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C16212C1581;
	Fri, 18 Jul 2025 10:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cCYYvp6R"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083D52BFC7B
	for <linux-gpio@vger.kernel.org>; Fri, 18 Jul 2025 10:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752835623; cv=none; b=AM3h2tO5PX3PiSH6+boqTR/0NEOm5URaX+232lx7PXh4Wm/LBgE1udLjFEf8o705y8MLfQJfo2fGMt0lbuhW/0Z4Lz87IwHzZAt10tmnDM+i9ecbbtcndfON7aTetLfIG1X3/aMzfOpfo1e2EUZ58pdKuCItef53wfjYzp/t7OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752835623; c=relaxed/simple;
	bh=07xKJikXxGu1w2IBiBwoPMNnpKvLi5WoDtQv5e+L78c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LN1YWmErSZqN5keKErnglM22w531QJlG0DCefsifW5JQcmf0+ptmG/AE9ZSEiPkt8hAYDnlgpItszylsI2a2mik58weOJYt4CWiQfMm5MF6+SDj2kTtCBKrZFY69kHVcA9XrqwAsH/7GSTzt2MCPi/3jQ4ZaaoU1UuZcVnAn87c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cCYYvp6R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56I7pGdY028066
	for <linux-gpio@vger.kernel.org>; Fri, 18 Jul 2025 10:47:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9mQquBEnOIM
	1hitS0Sq3r6vjyWp9aN4ghWgwERH+4ko=; b=cCYYvp6RajTA8TLsMx0HU96crzf
	YnFxfkM72TcuQJcFOTmBVzxe72WoldYHDS1O1q3PoBJ91dJz5JCtwPu2hjXq24wz
	NXP/kf7H4hOW4+BAF9P0vUOb/z0JjCoU7s2JWEqlq/8LsPdy6J3V489H8m5qc8KU
	rZUo1yIAHZbPrq0imyNXcVKWa+LM2YbYG+3lvRXS+A6UrYt9/59vnVwuWXXx4+g8
	CY2PIcR4FLp3BDil7WP3aH0vSQW05MeK9ZA9VcZrwBoSnSwD79uno5aMR0v3thIW
	5m8JmXK9LL5Mdo3dUsjwXJx82UOK9DjOdJSLW3EQxK+N/bLiIpcat2rLxtA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wnh63e3e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 18 Jul 2025 10:47:00 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-74927be2ec0so2494301b3a.0
        for <linux-gpio@vger.kernel.org>; Fri, 18 Jul 2025 03:47:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752835620; x=1753440420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9mQquBEnOIM1hitS0Sq3r6vjyWp9aN4ghWgwERH+4ko=;
        b=YDOM5bI3+IdJ3FG22DWQgbgFkgPE5BZ7UAeNkehmP5UyKwD2Hyo1DW/R2mXo42XlRP
         +LjUBmiLMwuywsAPaDZ2FNAfEFvT4gQiowtLNaxvImjsC6JllGG9Co0oLDtCFLIzfee5
         1yXRFUGluKtNqq9VYh9NXpYO3zN4vnhbA8OSTQd6y6eg5nIsZZaWSf/l2XqoOxOX4Nwe
         qoVBZQfp7t5Qo8fnuuJWciMIF0YbCJyUWw6HKofrs/BRn2A8fLtO21SBGp6StSPJdgSk
         tTAszsOnZ3NZVvL+9d04clz2FDbDqhv+UvQezSe+YhlnHw0V48Pqp+Bn7CjWJtYNHvaG
         p04w==
X-Forwarded-Encrypted: i=1; AJvYcCVGuGMfvALtCiLSCi5vnhXcw7sfmouZBIaC66u0DC3be3nai9toWaEmMJqVA3WD6uVAlKbsvHQ6DtoP@vger.kernel.org
X-Gm-Message-State: AOJu0YyKZHbFcXKIzAzBSiVV+sfh111iDd3eJWAxwYFXW+MCwJQAwQI8
	FCfYerYd2bDNZyVq/hajQGk/UoDts/+PAgOe0gZrKFd/RTLUw1UdsbcrfSK6GsVTQje/h8UZhHn
	LWGEe6xD3umjUUIsXskb+VJelz0c5EiLEaZjaSnwy1pVhyMcaGEaMd/ElnZr4PpqR
X-Gm-Gg: ASbGncvYzQ37HAuDlPHAuWuIAScif7ObLK1M4JMIhthJFWTI4z7J58sr1kgJ6ur58gA
	7wGFn6M/+3tMPPhXfTDouwVR56g6ehOIcKv7QFX3myybCsBfOLLCJeP7bURIwvlR/MGT9T7wZjS
	C1IaPduBt7z75bRPTQngL7MszUd0w4KlD2fa8aJI3ujbwApNveVDu8eH3bm0CTexAhbfJaPq2Km
	gyyNNqlyK/EaY0K67yK1GCPp6n7p18Vx/RoO5pihQOH+StvsMLyoPBYCptE02/xrL1b3ceebX8t
	JlG0h2mVsCvmdzKeI/LdBDa9/Bq1opIziY8Wvw/msVb2L0e5lTvuMEPtvTAzKO4u2SSEIn70YuX
	9
X-Received: by 2002:a05:6a00:3c8e:b0:742:b3a6:db16 with SMTP id d2e1a72fcca58-7572568553fmr14265462b3a.20.1752835619920;
        Fri, 18 Jul 2025 03:46:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCP8U1oTauA1NU8UmQ02YT/Qr/1dew6KPieiLsIUCV2VzGU/buEHCG47Bit1Kl9IaTNIxOzw==
X-Received: by 2002:a05:6a00:3c8e:b0:742:b3a6:db16 with SMTP id d2e1a72fcca58-7572568553fmr14265410b3a.20.1752835619420;
        Fri, 18 Jul 2025 03:46:59 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759cb678cdbsm1028989b3a.108.2025.07.18.03.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 03:46:59 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, quic_pkumpatl@quicinc.com,
        kernel@oss.qualcomm.com
Subject: [PATCH v2 2/2] ASoC: codecs: wsa883x: Handle shared reset GPIO for WSA883x speakers
Date: Fri, 18 Jul 2025 16:16:28 +0530
Message-Id: <20250718104628.3732645-3-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250718104628.3732645-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20250718104628.3732645-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dKimmPZb c=1 sm=1 tr=0 ts=687a2624 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=JpXIU2bkfXmfP1Z-X1EA:9
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: hwcd4L7fA7JUj0dwuSq6kbunlYR14D8A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDA4NCBTYWx0ZWRfX/9mGYDPTJV2Z
 BzgqOMdxlec+cni2wXCjB0RWQDOhVBZvNeUDVS9esiApg3C/Cs0505RXmENK1tja0ZAN29SjYd1
 xVHeHphwYmVwKZ8Wyk9ySIIln/AcPcIlisTahH2ps44o7rMxWTln+htVutUPLla2QFWmE+5q49X
 eR+zbQr04jIW5Ig5rFtrQE+6eg9YjbQfgv+EzCMN8kG2nenpjgx+O6koealnJhL5kfEWytxi7CT
 75yASA5aYyVDajiPTOct9mrWWwHbwMpubc/JgO4yp8ZVQ5HYviqJ5N72bIw3CcSb9+n7IQ7UuRw
 MibMjWjgvxyfrlB9ZgJ+z1OD8RRg4Bvb5wa41NRtAMatZV3sv5j81k8VUpbCX+fAvTQq7rHcidY
 Gdo4P+dwez4eTMbauf04GQWjjTPJ/e3bL/PNw6jLQ5EYY8Ede+FNyo9BDOs0QDqGZp4FLerK
X-Proofpoint-ORIG-GUID: hwcd4L7fA7JUj0dwuSq6kbunlYR14D8A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_02,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 mlxlogscore=999 mlxscore=0 spamscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507180084

On some Qualcomm platforms such as QCS6490-RB3Gen2, the multiple
WSA8830/WSA8835 speakers share a common reset (shutdown) GPIO.
To handle such cases, use the reset controller framework along
with the "reset-gpio" driver.

Register devm action to safely disable the regulator on device removal
to prevents a potential release warning from _regulator_put().

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/codecs/wsa883x.c | 93 +++++++++++++++++++++++++++++---------
 1 file changed, 71 insertions(+), 22 deletions(-)

diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
index 188363b03b93..eea160a08183 100644
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
@@ -1546,6 +1548,53 @@ static const struct hwmon_chip_info wsa883x_hwmon_chip_info = {
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
+static void wsa883x_regulator_disable(void *data)
+{
+	struct wsa883x_priv *wsa883x = data;
+
+	regulator_disable(wsa883x->vdd);
+}
+
+static int wsa883x_get_reset(struct device *dev, struct wsa883x_priv *wsa883x)
+{
+	wsa883x->sd_reset = devm_reset_control_get_optional_shared_deasserted(dev, NULL);
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
@@ -1566,13 +1615,18 @@ static int wsa883x_probe(struct sdw_slave *pdev,
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to enable vdd regulator\n");
 
-	wsa883x->sd_n = devm_gpiod_get_optional(dev, "powerdown",
-						GPIOD_FLAGS_BIT_NONEXCLUSIVE | GPIOD_OUT_HIGH);
-	if (IS_ERR(wsa883x->sd_n)) {
-		ret = dev_err_probe(dev, PTR_ERR(wsa883x->sd_n),
-				    "Shutdown Control GPIO not found\n");
-		goto err;
-	}
+	ret = wsa883x_get_reset(dev, wsa883x);
+	if (ret)
+		return ret;
+
+	/*
+	 * Register devm action to safely disable the regulator on device removal.
+	 * This prevents a potential release warning from _regulator_put().
+	 */
+	ret = devm_add_action_or_reset(dev, wsa883x_regulator_disable,
+				       wsa883x);
+	if (ret)
+		return ret;
 
 	dev_set_drvdata(dev, wsa883x);
 	wsa883x->slave = pdev;
@@ -1595,15 +1649,16 @@ static int wsa883x_probe(struct sdw_slave *pdev,
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
-	if (IS_ERR(wsa883x->regmap)) {
-		gpiod_direction_output(wsa883x->sd_n, 1);
-		ret = dev_err_probe(dev, PTR_ERR(wsa883x->regmap),
-				    "regmap_init failed\n");
-		goto err;
-	}
+	if (IS_ERR(wsa883x->regmap))
+		return dev_err_probe(dev, PTR_ERR(wsa883x->regmap),
+				     "regmap_init failed\n");
 
 	if (IS_REACHABLE(CONFIG_HWMON)) {
 		struct device *hwmon;
@@ -1623,16 +1678,10 @@ static int wsa883x_probe(struct sdw_slave *pdev,
 	pm_runtime_set_active(dev);
 	pm_runtime_enable(dev);
 
-	ret = devm_snd_soc_register_component(dev,
-					      &wsa883x_component_drv,
+	return devm_snd_soc_register_component(dev,
+					       &wsa883x_component_drv,
 					       wsa883x_dais,
 					       ARRAY_SIZE(wsa883x_dais));
-err:
-	if (ret)
-		regulator_disable(wsa883x->vdd);
-
-	return ret;
-
 }
 
 static int wsa883x_runtime_suspend(struct device *dev)
-- 
2.34.1


