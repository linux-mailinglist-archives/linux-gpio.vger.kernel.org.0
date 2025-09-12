Return-Path: <linux-gpio+bounces-26029-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADA2B5478B
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 11:30:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D59071887BF1
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 09:30:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5DEE2D73B8;
	Fri, 12 Sep 2025 09:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XhI3DojY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5881C2D593F
	for <linux-gpio@vger.kernel.org>; Fri, 12 Sep 2025 09:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757669047; cv=none; b=T0rXHYT7UueubxNiHgAVJFmUgTJunzNj7hvIR5clog9JJrNs39Wq4itZf1RcLqRM8EcCjAc3sQioE+qzP3C3nlwgc3FgomvRSAimhTZr21rxKkGvVTXgifGnnYl25qfhXAAxHGeNbu3zZeaEfSbIsXZDgjX9r43mg1+xeJD92I4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757669047; c=relaxed/simple;
	bh=+bVJ+4hy5vMtuVwCqUQtQcNPKerS7zzgW7OjoDwLJD0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bzz9UIgQhrS2VmKd2ZGsAHlkciB5WWy5pnuhXfM1XVhCn0LDmPR1l3llkH4axDJkdICWpKfc406Sq6FF7N3r/BIVk0b3ojuK4vo8AeICMDufA/W2kE+mbeImhbTuFFFxcsnhmBfcdAh+GqMVm41lTrLZUn1lEKT3bOUUWfFljMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XhI3DojY; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3e7516606c2so149806f8f.0
        for <linux-gpio@vger.kernel.org>; Fri, 12 Sep 2025 02:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757669042; x=1758273842; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BOMYwUSj3ToMRrs1GbfaZczlic4yEzoQ0wQhZEu+bgo=;
        b=XhI3DojYX1yHSioSnY/jgX0719BbhGvKyMU/pE1mcXdBZ813hxB6E/IUgN+KcLRsJp
         d0HGk7MQVM/HCxxJlK2FM2IZMpAb8tpUewhIp/8jkBe9VWEbh39R9q3f39dByIZh2R1m
         A1hrQ7dDN9y5Zmv/FSi3nfuoJdLnTDkO9Zdp+xd2eZNCvIof6htbqgp00GE4UEzN+eAi
         q024Eep7dEToGe5T/LPF3m0Rh4MaE6j+YR3Y5keR73hi0YppnF+6S1HuOgWjR9FD8qbh
         tPO3YaaIGFYn5azHzsHmCwbyopHZSG+QRq+A5GDJUIA6Hfa3R3lrlzlZ/v4lSLffkou8
         sXhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757669042; x=1758273842;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BOMYwUSj3ToMRrs1GbfaZczlic4yEzoQ0wQhZEu+bgo=;
        b=PwHTAAV4rpk05fedKalliiezhB2MveE/DOv1fZPq5JGi/NjNFpL7x7STPOOzFFVWUU
         ajO5Z/Z/BDN6tlIiicPlHN25jPwh4+B8ar9YDvCJXY5C1za1MAbKjcmdBETywwG9vY/V
         eoPdGxw24OIa7PnUUnS2m49JbntTgtmd88fFyuN3jkeE/ZgZHu04DtdJZ18Z4AMCG4vh
         xk2HwftffY9IDYjuLSVe9JoiJaVMc5Pd6NacsfAp3obOgUcuwEbI0DfqM9s4tNidHkjg
         2fzuDqPwF0RTGpLohEwJBMPXhCvQcht0inZvh5wDq8Nw5P5OjZwGIBq9yzM46ltI733o
         Uokw==
X-Forwarded-Encrypted: i=1; AJvYcCXXny+4eAD0A/r4OM1QMjz/oiWOhM5ttITGycuOv8YQ73FqCZSBbOywpmdGsPPvXEXq81LNN8UbFbpC@vger.kernel.org
X-Gm-Message-State: AOJu0YwR5PoLmPtu4jibpKTuOWPIJvDJutE+OLnjbHrRyrQGgnLzAo7T
	SAFoBhPB2MTkfLYiNd6iqZWUCXUnWXpEAx4Dn7TJ+QcXpMynrLKUFJpstDWKyTeFlLc=
X-Gm-Gg: ASbGncuxYGTl7JrK+lPI34iwu/GgCO6jDO2ejaLYGyemc2viAdV9mEK2qncO67fEryK
	M6I9BuyvQRIN6PTDyq4CvoaruiDoDw69+rF2AiZFI/iqgspok868YQX8wfW85Fz+ISGlxxG2bqS
	9RrGSY3o777n6Zb0ZJwIHvW4AhTLjuNQjFU9wrejEWiAvzClvQVGTmXPEt06rY7c5QpXrQjOnRe
	y0A8rOZksgoz0GMX431a5YFBYF6vQcAZEt+5IMp2khkC8LMRhCXxE1/La16I0OUCBxWYtbGM8mV
	xaRFD9wfulWlMPlZ0OuyC2j42hb0uoBRiAcZR3kjVC0WgCKvEnzPEyADWJvjdu+IH+dYpqmsF+F
	/r1S+yab9XMkHX5V99R5IVsE1rhgcB7KB4w==
X-Google-Smtp-Source: AGHT+IFZ4LkljsZAZV2KGxX2vnp7A1Ij/erNB1dV87KomdD4NYdDAGsePpI/vQBLekU2xgSQDZkE4w==
X-Received: by 2002:a05:6000:2503:b0:3d4:c46b:e57e with SMTP id ffacd0b85a97d-3e765536c58mr1041490f8f.0.1757669042563;
        Fri, 12 Sep 2025 02:24:02 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7607d7b3esm5727337f8f.46.2025.09.12.02.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 02:24:01 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] pinctrl: Simplify printks with pOF format
Date: Fri, 12 Sep 2025 11:23:52 +0200
Message-ID: <20250912092351.162307-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2536; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=+bVJ+4hy5vMtuVwCqUQtQcNPKerS7zzgW7OjoDwLJD0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBow+anDJAMN9wRUbRQ5JlQl3eiWjS4RDs50mngh
 v0da2zDAfqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaMPmpwAKCRDBN2bmhouD
 18n5D/4hSZl8udzkB2YzvH4Z9aKuFcLBa9CFrbK1nRLSDu5FSjWXEXWKEbFj1MHjLOqSErjfA6f
 fc2Ubu88L88RmHPoMzOYbLoElN/YbJz/dIcfvMLod8fnzL+nyanIDfXmVZtUmmDYQSgiudqq55N
 OgcP1rd3Njv+m6SEpSi9mucEgKnmUW/IXbyBYlD+Kf9WQMw6AGL4ICHWW/kdhFOk5ZcOjb1HnW4
 OAHTA2vvtVF74+R8APPWN46YH+EFMlIbmGxIAT4HXnpqw9hdoUbIXp5OqY+f027EOcWS+tUlw/L
 U+PodlsU4UHYaoRtvkk8VhihoB1YgDyYkotQtLGqHYP970ckzBwoScgk7ZWMrRY67jWusybohk/
 s0Sp6GbG2Iio6vqkiMMxTYn9Yvj1+Gifxh39F+gN7GBgU9oAjMTiPuB3aEF7oV1Pm9sO+X13wCk
 JZrp9Lr7mtvLvnSqC8NcPGe6K4RBMSK16uLP8KVuigMVo22/6w4qqL3uOChq/sXCS5+s5ImXBOQ
 XMGDwuPVLAxgzYT7HmVuCKaR23ULDBoq29eCZLj3YUNm5MuzgKkthjnb9mQWiHhNWP25F0eJDuD
 ujygi2OswjTMsQQ+Ad8fb301JcyprI6J6eqSPB4ZFgCmc1C+y4Btbks/pdsehgKkZWjRTK3XoZC PTV13F72brgao+g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Print full device node name with %pOF format, so the code will be a bit
simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/sprd/pinctrl-sprd.c      | 9 +++------
 drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c | 7 +++----
 2 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/sprd/pinctrl-sprd.c b/drivers/pinctrl/sprd/pinctrl-sprd.c
index c4a1d99dfed0..16cf9d15f247 100644
--- a/drivers/pinctrl/sprd/pinctrl-sprd.c
+++ b/drivers/pinctrl/sprd/pinctrl-sprd.c
@@ -258,8 +258,7 @@ static int sprd_dt_node_to_map(struct pinctrl_dev *pctldev,
 
 	grp = sprd_pinctrl_find_group_by_name(pctl, np->name);
 	if (!grp) {
-		dev_err(pctl->dev, "unable to find group for node %s\n",
-			of_node_full_name(np));
+		dev_err(pctl->dev, "unable to find group for node %pOF\n", np);
 		return -EINVAL;
 	}
 
@@ -276,16 +275,14 @@ static int sprd_dt_node_to_map(struct pinctrl_dev *pctldev,
 	if (ret < 0) {
 		if (ret != -EINVAL)
 			dev_err(pctl->dev,
-				"%s: could not parse property function\n",
-				of_node_full_name(np));
+				"%pOF: could not parse property function\n", np);
 		function = NULL;
 	}
 
 	ret = pinconf_generic_parse_dt_config(np, pctldev, &configs,
 					      &num_configs);
 	if (ret < 0) {
-		dev_err(pctl->dev, "%s: could not parse node property\n",
-			of_node_full_name(np));
+		dev_err(pctl->dev, "%pOF: could not parse node property\n", np);
 		return ret;
 	}
 
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c b/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
index 5f13315ebff3..50a16f3bd131 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
@@ -274,8 +274,7 @@ static void fill_pin_function(struct device *dev, struct device_node *node,
 			if (!strcmp(pins[pin].pin.name, name))
 				break;
 		if (pin == npins) {
-			dev_warn(dev, "%s: cannot find pin %s\n",
-				 of_node_full_name(node), name);
+			dev_warn(dev, "%pOF: cannot find pin %s\n", node, name);
 			index++;
 			continue;
 		}
@@ -283,8 +282,8 @@ static void fill_pin_function(struct device *dev, struct device_node *node,
 		/* Read the associated mux value. */
 		muxval = sunxi_pinctrl_dt_read_pinmux(node, index);
 		if (muxval == INVALID_MUX) {
-			dev_warn(dev, "%s: invalid mux value for pin %s\n",
-				 of_node_full_name(node), name);
+			dev_warn(dev, "%pOF: invalid mux value for pin %s\n",
+				 node, name);
 			index++;
 			continue;
 		}
-- 
2.48.1


