Return-Path: <linux-gpio+bounces-30135-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B7FDDCF29F2
	for <lists+linux-gpio@lfdr.de>; Mon, 05 Jan 2026 10:08:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 202213032FFA
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Jan 2026 09:03:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC8A232ABF7;
	Mon,  5 Jan 2026 09:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dfpL1WuY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6DC232D45B
	for <linux-gpio@vger.kernel.org>; Mon,  5 Jan 2026 09:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767603721; cv=none; b=YTjWmZs9ZIkeQ/zsw7p6o51kUvRlc5jxHVYz3iaGlsNrvro/kE23fmkju+/CSiP74JOgf/RI8/hcHWwB5cBYWAqUBv4G1q/B04YYZrB2QAYHD/jOFgh0Le3NiNYU1VCfGg8Evnvhl9/Ie8xq8JC/CQNYukVou5mDQINvEPisrg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767603721; c=relaxed/simple;
	bh=gdA0sZvZ0YzUA5VbllhyP/LA1RBGbn5sCuJW2ofmkv8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AVgrisXBSnWEbxh0T5OqA5CLfC4ZYFircG9/j053203nYO8kxyp1Ggcbh7qCPM4npHoMZEyIsnRZMtX2JYjbrfcIbID1XntNaiKZrnBAXJ3S2BAJ8IEQUVBqUoWsmLIPZGjTy2Ez/geAhW6iue04IGi3QRe0hGLnX/jCXXDlU6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dfpL1WuY; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b83d6a06304so272804766b.2
        for <linux-gpio@vger.kernel.org>; Mon, 05 Jan 2026 01:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767603712; x=1768208512; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bdm4unydgK85s5YLaStWETQ4AILRmGjAlJ/lhyhIAds=;
        b=dfpL1WuY0jAcr/AfgQScMKsRnyEZvVotB4yzFf1kMJrEcoliiu6bpT4MYXcz9u1XHO
         VssTyQKnI3vJefNQI9P3KIaIyM7FfrCejcuNBfGmuOLYZ39Cb8r1Skml+55IrOlpTs/c
         0K93viX0pjYkp0JO+2eTdDc96NZ/cVLYf8RCKTML8YE19ag2mVH+IzvG+Mjre66YV7NT
         7F8f43ttC9ETjO9uhJx3c98/+n0UONOutbmuS0dwnogX7FiLBx4wbWdKmQfyAw9KdtMu
         RO/ktw2oTr8SZoJx6GCpSbjIp4kaPH6MelY8NRqwcFeSuVJIFElk5wXH4bSvbZbTubdl
         adGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767603712; x=1768208512;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bdm4unydgK85s5YLaStWETQ4AILRmGjAlJ/lhyhIAds=;
        b=JTlOQre5cP8GAlVZVyPQvo8wGVRDvugxTKnFxFAN+vwEBNp8zHLlr++Tkr2Pj/7eDW
         rQNWIPKG2xD7+HteQ2SZ1pM8hqrPoORE/QIl0e9Zz8EuSibaDJ893ljh1M5mHUO1Je6V
         ky8kj+tkLQblqGXDd+72M/YQiq0hmuE01rP/4YmW4zTXUGiMQDuNZ/Rcm+G1xsA8bxd9
         bZetxXKA4EopA9LA+cLZdiNkcy95r5hCCsc6rzueQaIdbD+CdoZnPpAmgE6sn9pUENSs
         Cjc2rVl+6OVKeo4xeFk9rF7GJ6Ws7gVzSgcjrF3RYiAcJPJNUck3pxOYn9Ov2+ksmz2j
         D+9w==
X-Forwarded-Encrypted: i=1; AJvYcCURUiARIZ3PaVv/1yoVYzcXKU8QQMCX9w0cElFS2Z6GrOI4xgE2bFXuVtP3r1ZITnZiNXuqy31NWfGm@vger.kernel.org
X-Gm-Message-State: AOJu0YwrOMieO0ekZ+VoqmNslMKmvRuaGdBIKGs9DwOOqvb1KeghxBiH
	vc7L1B7b/6/a3tyHo+LMVv86qLRvtEEwG22CV1/BUwatLFPudLixyqqh4A4QPczzO1Q=
X-Gm-Gg: AY/fxX6zJ3oCWgPX6qqf5O1UzW4jiFr6/+ys8S+rdvm2eQeOgX0ZP9tGVuhSWJOEAY6
	ExQuCMX0yIbqXNUFXNnYXHvrz+Hq//nP1Aot+UPCL7DlZLOkzteYA2sU4y6uub25IiCY5JsRfQ+
	NzbPFB4+XKVqZTxtatIICL8HGhwwZtJj8fgmlEQgLoToxh+Ui0U64PF+Y0SmL++OH1JTefFJ1Xi
	1vywmby7No/PK+IpaHVMtbo3+E0McoeTS0+PmBPTP0812Q0haKaC3MBlsXtKaNdJ/IGxEikoHfm
	9q6b5GuSBlJRDdeXJ3+egDMNsyXeAVYY3KW3n5pDHQy1odHOYFqgflvsRoU20eT6A4wiBmdmBAY
	jbFh8QWsihNc+jzVghEVM7goij0VviHNCEjtbvMmDpMUbhN48sFEOUaQI4oKDtIwEKnTy/2hDYq
	CDHW/0hZDhRVhc6fzxbt3GLFKmVG2TSkgjd4UDS0zsROAoiuxnXVW6/z6plwg2V8QaSEgi1x8P8
	IuXqQ==
X-Google-Smtp-Source: AGHT+IGpEAwTdgiIFqYVLwZr5Dshta5wUiaNkwk7GiDRbOtmpc5D7uh2c6qY0I7WpfIMYQ7/WqMhpQ==
X-Received: by 2002:a17:907:847:b0:b83:c81a:197e with SMTP id a640c23a62f3a-b83c81a199fmr1121260466b.24.1767603711921;
        Mon, 05 Jan 2026 01:01:51 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f0ecb9sm5384010466b.56.2026.01.05.01.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 01:01:51 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 05 Jan 2026 09:01:56 +0000
Subject: [PATCH v6 20/20] regulator: s2mps11: more descriptive gpio
 consumer name
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260105-s2mpg1x-regulators-v6-20-80f4b6d1bf9d@linaro.org>
References: <20260105-s2mpg1x-regulators-v6-0-80f4b6d1bf9d@linaro.org>
In-Reply-To: <20260105-s2mpg1x-regulators-v6-0-80f4b6d1bf9d@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Lee Jones <lee@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Juan Yescas <jyescas@google.com>, 
 kernel-team@android.com, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2

Currently, GPIOs claimed by this driver for external rail control
all show up with "s2mps11-regulator" as consumer, which is not
very informative.

Switch to using the regulator name via desc->name instead, using the
device name as fallback.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/regulator/s2mps11.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
index 4a9d70947f17cb7520e0e820d3d1b9eb370ff600..2d5510acd0780ab6f9296c48ddcde5efe15ff488 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -362,7 +362,8 @@ static int s2mps11_of_parse_gpiod(struct device_node *np,
 	ena_gpiod = fwnode_gpiod_get_index(of_fwnode_handle(np), con_id, 0,
 					   GPIOD_OUT_HIGH |
 					   GPIOD_FLAGS_BIT_NONEXCLUSIVE,
-					   "s2mps11-regulator");
+					   desc->name
+					   ? : dev_name(config->dev));
 	if (IS_ERR(ena_gpiod)) {
 		ret = PTR_ERR(ena_gpiod);
 

-- 
2.52.0.351.gbe84eed79e-goog


