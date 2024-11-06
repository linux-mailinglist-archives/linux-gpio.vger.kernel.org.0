Return-Path: <linux-gpio+bounces-12611-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4AE9BE0C5
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2024 09:26:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC3F61F201A1
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2024 08:25:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E0781DFD87;
	Wed,  6 Nov 2024 08:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Mi/RVTyo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA601DF991
	for <linux-gpio@vger.kernel.org>; Wed,  6 Nov 2024 08:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730881215; cv=none; b=WtEPBKCe20k0g2hmG5Svu29xtA9yp7i9b/3bFS/V14reyXZkdfsXwFUY66QXYwVbawm+lKKBg9lbWuK5Jpb7DePKHkkoJHVLQ9kBLqVtuZNQUGEZiMC/GzmoS2FUounkAEgDtyRM9LiSHhNxV8lgcFofC2n23R5hfYaYoY/LKBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730881215; c=relaxed/simple;
	bh=EW5QvHdzBq+RJllof00TNGgCEYMdaEbYmP7Eh277mvo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pHiF1MtduM49HSJs4vjwri8aoLL4CNZyN8SCcq07gPzmHjnTdtU6VbmGIbq75FKl7QDK3yYHMGLG3mms2GfKhQjsDKvmXQGozYCMHzcCNi1HsG480OpuiPOUPZXoL+CUqCoD3Cj6Dh2vrtpWfb3rDFJ4XkMXPwFyprqxPWl/kwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Mi/RVTyo; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a9a1b71d7ffso1091186366b.1
        for <linux-gpio@vger.kernel.org>; Wed, 06 Nov 2024 00:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730881212; x=1731486012; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0PrH1MFyoXl7Ri4q0AfVSrjUgxkxxuAGcs0c90GGV4A=;
        b=Mi/RVTyoho3WeSeeF79dMKak/2HZuy780wjD7GhEtvNLBC2gFH3uimgVsR3j834M7v
         ICCVspKsAJxuzDtiOHwmQDHBOXwns11hQId3alJw5w39kHNi0gzc1ryDTiy2IYd0IT2z
         mqQ6S9YjlUrIA6W1Wcs46ckbzvlyql05TNwZNwvIneEZKGAD0bGhb2sIjjO55MA54ulK
         n7fnMA3chityOVkI1j5Qi+XGKwGKv9Sf3ipfy6Bbo1w4ouMaiRfnV9GtpJD0hCTeTrI3
         lLX5IV9HBo9hmBgj4hZfFHwWKoL3yT2JsC0wjc7MQnvU46OEDyyh3AMTMeVJcTp3RVwh
         oMMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730881212; x=1731486012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0PrH1MFyoXl7Ri4q0AfVSrjUgxkxxuAGcs0c90GGV4A=;
        b=NMehRZwGM6v16U91Bz0a/caW/qRmwzrAtiUfdw/Wg+450PVUyAirhHznav0XxwA3w0
         NMcfG0LUnJx+6GKjHJYGJSGANysq8sY4CnGK2seix3pCVMNm4GVSrhtkUVmzVKS7ShZs
         MgqJj/xTn9OgqVvH7HtUSlvwwRvkhW3zFk+OwpToM7SOfyLxJr6RmrPMWWxm5ndnXMxO
         uS4K1MMwg0uhTKZHBYyLbXmKME7tL8vlFR2/K5rcxUeUhnKZQyidHm6CUzEL5sqWGRiz
         KMOzTt4fv6kzCclo8ufxFH6WAHBLByXREawtI3xlFr/czB86Wz8jhlVEG/WOvFnqJoDd
         QCjA==
X-Forwarded-Encrypted: i=1; AJvYcCUrW3FiHMe0s+RtIxGlabMlNhrK4f0RYDlMsrEnuai7gxXAZuUQmp5YmJe3VkYvKPCsB1U8+lWU2J53@vger.kernel.org
X-Gm-Message-State: AOJu0YxWd6CcRgmid6xs3HRZ7CLSQ8IuXIapIWrJoi3jcDhwAMWVDMm9
	DB5JrbRHmeHhEjSe9/jO94qeKinjFnr1LhdJtetjZXhzInK3x9f0ufVYRNtQpOg=
X-Google-Smtp-Source: AGHT+IHNzJYoMyHuxe07aYkCHl9dPgMv+Bm3g4ThxLARQaU1LFW3c9JXQqf0XMx8bTGv4A4aJ+XhnQ==
X-Received: by 2002:a17:907:2d26:b0:a9e:b610:409c with SMTP id a640c23a62f3a-a9eb61043f7mr517178366b.48.1730881212201;
        Wed, 06 Nov 2024 00:20:12 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb16a2dbcsm241369766b.40.2024.11.06.00.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 00:20:11 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	magnus.damm@gmail.com,
	linus.walleij@linaro.org,
	support.opensource@diasemi.com,
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de,
	Adam.Thomson.Opensource@diasemi.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Hao Bui <hao.bui.yg@renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 26/31] ASoC: da7213: Extend support for the MCK in range [2, 50] MHz
Date: Wed,  6 Nov 2024 10:18:21 +0200
Message-Id: <20241106081826.1211088-27-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241106081826.1211088-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241106081826.1211088-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hao Bui <hao.bui.yg@renesas.com>

According to DA7212 HW manual, the codec's PLL input divider can operate
with MCLK range from 2MHz to 50MHz but current driver only set the
minimum supported MCLK frequency to 5MHz. That cause 11.025kHz audio
which is corresponding to MCLK of 2.8224MHz (11.025kHz * 256) unable to
play in case audio-simple-card is used.

Signed-off-by: Hao Bui <hao.bui.yg@renesas.com>
Co-developed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 sound/soc/codecs/da7213.c | 18 +++++++++++++-----
 sound/soc/codecs/da7213.h |  1 +
 2 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/da7213.c b/sound/soc/codecs/da7213.c
index af38b2b5e174..ca4cc954efa8 100644
--- a/sound/soc/codecs/da7213.c
+++ b/sound/soc/codecs/da7213.c
@@ -20,6 +20,7 @@
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <linux/pm_runtime.h>
+#include <linux/units.h>
 #include <sound/soc.h>
 #include <sound/initval.h>
 #include <sound/tlv.h>
@@ -1559,7 +1560,7 @@ static int da7213_set_component_sysclk(struct snd_soc_component *component,
 	if (freq == 0)
 		return 0;
 
-	if (((freq < 5000000) && (freq != 32768)) || (freq > 54000000)) {
+	if (((freq < da7213->fin_min_rate) && (freq != 32768)) || (freq > 54000000)) {
 		dev_err(component->dev, "Unsupported MCLK value %d\n",
 			freq);
 		return -EINVAL;
@@ -1858,11 +1859,14 @@ static int da7213_set_bias_level(struct snd_soc_component *component,
 	return 0;
 }
 
+#define DA7213_FIN_MIN_RATE	(5 * MEGA)
+#define DA7212_FIN_MIN_RATE	(2 * MEGA)
+
 #if defined(CONFIG_OF)
 /* DT */
 static const struct of_device_id da7213_of_match[] = {
-	{ .compatible = "dlg,da7212", },
-	{ .compatible = "dlg,da7213", },
+	{ .compatible = "dlg,da7212", .data = (void *)DA7212_FIN_MIN_RATE },
+	{ .compatible = "dlg,da7213", .data = (void *)DA7213_FIN_MIN_RATE },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, da7213_of_match);
@@ -1870,8 +1874,8 @@ MODULE_DEVICE_TABLE(of, da7213_of_match);
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id da7213_acpi_match[] = {
-	{ "DLGS7212", 0},
-	{ "DLGS7213", 0},
+	{ "DLGS7212", DA7212_FIN_MIN_RATE },
+	{ "DLGS7213", DA7213_FIN_MIN_RATE },
 	{ },
 };
 MODULE_DEVICE_TABLE(acpi, da7213_acpi_match);
@@ -2167,6 +2171,10 @@ static int da7213_i2c_probe(struct i2c_client *i2c)
 	if (!da7213)
 		return -ENOMEM;
 
+	da7213->fin_min_rate = (uintptr_t)i2c_get_match_data(i2c);
+	if (!da7213->fin_min_rate)
+		return -EINVAL;
+
 	i2c_set_clientdata(i2c, da7213);
 
 	/* Get required supplies */
diff --git a/sound/soc/codecs/da7213.h b/sound/soc/codecs/da7213.h
index 505b731c0adb..b9ab791d6b88 100644
--- a/sound/soc/codecs/da7213.h
+++ b/sound/soc/codecs/da7213.h
@@ -600,6 +600,7 @@ struct da7213_priv {
 	struct clk *mclk;
 	unsigned int mclk_rate;
 	unsigned int out_rate;
+	unsigned int fin_min_rate;
 	int clk_src;
 	bool master;
 	bool alc_calib_auto;
-- 
2.39.2


