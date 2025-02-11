Return-Path: <linux-gpio+bounces-15690-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23205A302C8
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 06:18:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 85DC63A5D41
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 05:18:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FC041E25FA;
	Tue, 11 Feb 2025 05:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IBdQpQA4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F7A1DF992;
	Tue, 11 Feb 2025 05:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739251110; cv=none; b=oBJ/aveSLhqiUpt3TFkXL5DB0voaW8aOaG93diGb+wGHcJzDSXir98e/YSRNi5rzNy9QwXXJt/Fa1duJHa27u37B2j+X/axo5GZdlO1eIMgK3DKgQ1B27i4OjXYdXfvjkCO+bkgEYFe1Tbdks8C14S3EptYXbzJTLGPVpbljWdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739251110; c=relaxed/simple;
	bh=ZN6Zdt5xvwByoYaWrsM8ke33qmaU+qJAX70F0yORPSk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mfvkP3/gsVjj8dXBOik4t8qu5SvIsWmAvW5KmDvFJh+y+ZKaB/2zYEJjseTx+Uinae/6UV1faZFERuXWgAuzLdJ3N+IDEVBqB/1FRWVdXwCOKQVq+rpG7lq1A7gopswklLDzj2tzKwjHA+cXLKhjN2KCO/Yn6joRZMvmT1DpSbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IBdQpQA4; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-471a01060f3so4221691cf.0;
        Mon, 10 Feb 2025 21:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739251106; x=1739855906; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HA9qdvai7+Vg6/Vo/ajS5TH3+CfsgBPf6Pn6TWcWHmg=;
        b=IBdQpQA4u5lBhYGOqQjp34GxFrj76BRRSciXZHIqQgn6LWuQs45lxFgvaske0sKmYb
         ZUAwgP15Ni5kT1fTiHJOYYZp5lfX4es1sBp+M0KWMS8G4QqVV1GZJtYOGPacMe6ENOgX
         t8jX41mYUB1N44IX4QazWix7EUmkNnZksoIK5MZBS2SoIfM8uQmAYG3r5LMO1aVwr1n9
         eipIDK+Q62V45zzHzLHvWOWPOWt+ftxllIjnCZpUzKzmzbmOhXbn2poezlclRzdeAeZK
         z+3yOzwyuWpkVJXf6AZTAdLgx3BWwL18vtA6UdYK3HxMsgDWcFbogM1E0hDHv+jVswTL
         3qlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739251106; x=1739855906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HA9qdvai7+Vg6/Vo/ajS5TH3+CfsgBPf6Pn6TWcWHmg=;
        b=cUKct89NDRtu9ZbcTsjZTvX1x1NCAuPO+aGVOzVy5HzlRf7kPII5eRKaGHpF3UBOBB
         ci5uSByImuBhk2orwmr26iBxpNTjQJN8CZctddvdubqb8759lQUE4y+p/83VQiGaevTV
         0NVThZa6XbIsY4azGLXiy2R0O2sKVcml4k+W+n+yWb5SWttLZK+V9iyQB/36zOcwdvtf
         +ilCgGL+f12g4XHKcD9XNHzwQJeE3BFsVWZ5yhnwuuH/W5DpDWQ83iWE1mldytdYKUJt
         58XbTSMbYpx/2AHa5WLwfyc8SHz7lEPCbrPor27WCDVtOwDePeCwjMTQXlc/UF07tfUO
         /riw==
X-Forwarded-Encrypted: i=1; AJvYcCUN6812sWJlycVyu8rfWTfVMOf8OkGInCD6xqdPaJkUugbeGktsxcscXTV9dUhu90n/nbInz51El5dT@vger.kernel.org, AJvYcCWAkRjrtiHducdd/xynmcTXBnI1xUesVuSkGpjYM54pNr8qAYvZHGjB4+29EEoB05GULs3eu7i1LNI6gQ==@vger.kernel.org, AJvYcCX0Kz85M+2et3boc/5uk3YW9KbZLD1/Ywj4mYuHhwWnE/XVSM+eY99JNNRjYd8u39lKsiDMzMJEfN5shwLO@vger.kernel.org
X-Gm-Message-State: AOJu0YxUd+9DiM7QpNcWDtXP2zFRo7TGjS7ij/o6CyceYiLkwT12Abao
	RCXAJztz8jkeXy7DFPou+Vx42UKkZ9dfYKL6NMHix2VqJ/44f5Yt
X-Gm-Gg: ASbGncuA15uMJK76SsxzF7GxkXtoQvDNeKtiaSyNq1F3ldhVfchMe/orpwy2ETaSj88
	1LGkMPoXlja9jsHmCuut3zvqAqUGLFPPxxCXYeI5FHRJ1kWbrirNg4xx8Bo8OFUD5OjBLCVeV91
	gpgqE74zBH/7b+JI2o1sZeM13VhzKuLnCUPeyjzkfVFZ9+QFoenzVRmUw7Ev4PorOwIUm2iGWKb
	psUQKbtnEVQplRmd+WJjDPPtydB5jBYV9X7iOe+fxq5SaQL+4OvV7EVylbaqTr5wgA=
X-Google-Smtp-Source: AGHT+IHwWxmEFc2fzH7Hccs5vYXHBp5wI8IXjZRw+GMt2dTbsgiglBWIgoJHFcYmL97RQfN84Q/TUA==
X-Received: by 2002:a05:622a:6207:b0:467:6901:7589 with SMTP id d75a77b69052e-47167a4973cmr233616721cf.29.1739251106127;
        Mon, 10 Feb 2025 21:18:26 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-471902ada7fsm23571201cf.77.2025.02.10.21.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 21:18:25 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 3/8] pinctrl: sophgo: generalize shareable code of cv18xx pinctrl driver
Date: Tue, 11 Feb 2025 13:17:51 +0800
Message-ID: <20250211051801.470800-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250211051801.470800-1-inochiama@gmail.com>
References: <20250211051801.470800-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With generic data structure, it is possible to generalize vddio
operators and DT parsing code of cv18xx pinctrl driver. Introduce
sophgo_cfg_ops callback to allow the driver to adjust the soc
logic and share common code.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/pinctrl/sophgo/Kconfig                |  19 +-
 drivers/pinctrl/sophgo/Makefile               |   5 +-
 drivers/pinctrl/sophgo/pinctrl-cv1800b.c      |   1 +
 drivers/pinctrl/sophgo/pinctrl-cv1812h.c      |   1 +
 drivers/pinctrl/sophgo/pinctrl-cv18xx.c       | 423 +++---------------
 drivers/pinctrl/sophgo/pinctrl-cv18xx.h       |   2 +
 drivers/pinctrl/sophgo/pinctrl-sg2000.c       |   1 +
 drivers/pinctrl/sophgo/pinctrl-sg2002.c       |   1 +
 .../pinctrl/sophgo/pinctrl-sophgo-common.c    | 404 +++++++++++++++++
 drivers/pinctrl/sophgo/pinctrl-sophgo.h       |  63 +++
 10 files changed, 545 insertions(+), 375 deletions(-)
 create mode 100644 drivers/pinctrl/sophgo/pinctrl-sophgo-common.c

diff --git a/drivers/pinctrl/sophgo/Kconfig b/drivers/pinctrl/sophgo/Kconfig
index c05f909a8838..f473ece940ab 100644
--- a/drivers/pinctrl/sophgo/Kconfig
+++ b/drivers/pinctrl/sophgo/Kconfig
@@ -3,17 +3,21 @@
 # Sophgo SoC PINCTRL drivers
 #
 
-config PINCTRL_SOPHGO_CV18XX
-	bool
+config PINCTRL_SOPHGO_COMMON
+	tristate
 	select GENERIC_PINCTRL_GROUPS
 	select GENERIC_PINMUX_FUNCTIONS
 	select GENERIC_PINCONF
 
+config PINCTRL_SOPHGO_CV18XX_OPS
+	bool
+
 config PINCTRL_SOPHGO_CV1800B
 	tristate "Sophgo CV1800B SoC Pinctrl driver"
 	depends on ARCH_SOPHGO || COMPILE_TEST
 	depends on OF
-	select PINCTRL_SOPHGO_CV18XX
+	select PINCTRL_SOPHGO_COMMON
+	select PINCTRL_SOPHGO_CV18XX_OPS
 	help
 	  Say Y to select the pinctrl driver for CV1800B SoC.
 	  This pin controller allows selecting the mux function for
@@ -24,7 +28,8 @@ config PINCTRL_SOPHGO_CV1812H
 	tristate "Sophgo CV1812H SoC Pinctrl driver"
 	depends on ARCH_SOPHGO || COMPILE_TEST
 	depends on OF
-	select PINCTRL_SOPHGO_CV18XX
+	select PINCTRL_SOPHGO_COMMON
+	select PINCTRL_SOPHGO_CV18XX_OPS
 	help
 	  Say Y to select the pinctrl driver for CV1812H SoC.
 	  This pin controller allows selecting the mux function for
@@ -35,7 +40,8 @@ config PINCTRL_SOPHGO_SG2000
 	tristate "Sophgo SG2000 SoC Pinctrl driver"
 	depends on ARCH_SOPHGO || COMPILE_TEST
 	depends on OF
-	select PINCTRL_SOPHGO_CV18XX
+	select PINCTRL_SOPHGO_COMMON
+	select PINCTRL_SOPHGO_CV18XX_OPS
 	help
 	  Say Y to select the pinctrl driver for SG2000 SoC.
 	  This pin controller allows selecting the mux function for
@@ -46,7 +52,8 @@ config PINCTRL_SOPHGO_SG2002
 	tristate "Sophgo SG2002 SoC Pinctrl driver"
 	depends on ARCH_SOPHGO || COMPILE_TEST
 	depends on OF
-	select PINCTRL_SOPHGO_CV18XX
+	select PINCTRL_SOPHGO_COMMON
+	select PINCTRL_SOPHGO_CV18XX_OPS
 	help
 	  Say Y to select the pinctrl driver for SG2002 SoC.
 	  This pin controller allows selecting the mux function for
diff --git a/drivers/pinctrl/sophgo/Makefile b/drivers/pinctrl/sophgo/Makefile
index 4113a5c9191b..5f24550750d6 100644
--- a/drivers/pinctrl/sophgo/Makefile
+++ b/drivers/pinctrl/sophgo/Makefile
@@ -1,6 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0
 
-obj-$(CONFIG_PINCTRL_SOPHGO_CV18XX)	+= pinctrl-cv18xx.o
+obj-$(CONFIG_PINCTRL_SOPHGO_COMMON)	+= pinctrl-sophgo.o
+pinctrl-sophgo-objs			+= pinctrl-sophgo-common.o
+pinctrl-sophgo-$(CONFIG_PINCTRL_SOPHGO_CV18XX_OPS) += pinctrl-cv18xx.o
+
 obj-$(CONFIG_PINCTRL_SOPHGO_CV1800B)	+= pinctrl-cv1800b.o
 obj-$(CONFIG_PINCTRL_SOPHGO_CV1812H)	+= pinctrl-cv1812h.o
 obj-$(CONFIG_PINCTRL_SOPHGO_SG2000)	+= pinctrl-sg2000.o
diff --git a/drivers/pinctrl/sophgo/pinctrl-cv1800b.c b/drivers/pinctrl/sophgo/pinctrl-cv1800b.c
index 45529e2ed23a..ca6fb374ee15 100644
--- a/drivers/pinctrl/sophgo/pinctrl-cv1800b.c
+++ b/drivers/pinctrl/sophgo/pinctrl-cv1800b.c
@@ -442,6 +442,7 @@ static const struct sophgo_pinctrl_data cv1800b_pindata = {
 	.pindata	= cv1800b_pin_data,
 	.pdnames	= cv1800b_power_domain_desc,
 	.vddio_ops	= &cv1800b_vddio_cfg_ops,
+	.cfg_ops	= &cv1800_cfg_ops,
 	.npins		= ARRAY_SIZE(cv1800b_pins),
 	.npds		= ARRAY_SIZE(cv1800b_power_domain_desc),
 	.pinsize	= sizeof(struct cv1800_pin),
diff --git a/drivers/pinctrl/sophgo/pinctrl-cv1812h.c b/drivers/pinctrl/sophgo/pinctrl-cv1812h.c
index 4e30a1cc9d7d..df2c2697a1fd 100644
--- a/drivers/pinctrl/sophgo/pinctrl-cv1812h.c
+++ b/drivers/pinctrl/sophgo/pinctrl-cv1812h.c
@@ -751,6 +751,7 @@ static const struct sophgo_pinctrl_data cv1812h_pindata = {
 	.pindata	= cv1812h_pin_data,
 	.pdnames	= cv1812h_power_domain_desc,
 	.vddio_ops	= &cv1812h_vddio_cfg_ops,
+	.cfg_ops	= &cv1800_cfg_ops,
 	.npins		= ARRAY_SIZE(cv1812h_pins),
 	.npds		= ARRAY_SIZE(cv1812h_power_domain_desc),
 	.pinsize	= sizeof(struct cv1800_pin),
diff --git a/drivers/pinctrl/sophgo/pinctrl-cv18xx.c b/drivers/pinctrl/sophgo/pinctrl-cv18xx.c
index 573e00d2c752..66111110c4b3 100644
--- a/drivers/pinctrl/sophgo/pinctrl-cv18xx.c
+++ b/drivers/pinctrl/sophgo/pinctrl-cv18xx.c
@@ -34,11 +34,6 @@ struct cv1800_priv {
 	void __iomem				*regs[2];
 };
 
-static unsigned int cv1800_dt_get_pin(u32 value)
-{
-	return value & GENMASK(15, 0);
-}
-
 static unsigned int cv1800_dt_get_pin_mux(u32 value)
 {
 	return (value >> 16) & GENMASK(7, 0);
@@ -52,15 +47,6 @@ static unsigned int cv1800_dt_get_pin_mux2(u32 value)
 #define cv1800_pinctrl_get_component_addr(pctrl, _comp)		\
 	((pctrl)->regs[(_comp)->area] + (_comp)->offset)
 
-static int cv1800_cmp_pin(const void *key, const void *pivot)
-{
-	const struct sophgo_pin *pin = pivot;
-	int pin_id = (long)key;
-	int pivid = pin->id;
-
-	return pin_id - pivid;
-}
-
 static int cv1800_set_power_cfg(struct sophgo_pinctrl *pctrl,
 				u8 domain, u32 cfg)
 {
@@ -85,13 +71,6 @@ static int cv1800_get_power_cfg(struct sophgo_pinctrl *pctrl,
 	return priv->power_cfg[domain];
 }
 
-static const struct sophgo_pin *cv1800_get_pin(struct sophgo_pinctrl *pctrl,
-					       unsigned long pin)
-{
-	return bsearch((void *)pin, pctrl->data->pindata, pctrl->data->npins,
-		       pctrl->data->pinsize, cv1800_cmp_pin);
-}
-
 #define PIN_BGA_ID_OFFSET		8
 #define PIN_BGA_ID_MASK			0xff
 
@@ -113,7 +92,7 @@ static void cv1800_pctrl_dbg_show(struct pinctrl_dev *pctldev,
 {
 	struct sophgo_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
 	struct cv1800_priv *priv = pctrl->priv_ctrl;
-	const struct sophgo_pin *sp = cv1800_get_pin(pctrl, pin_id);
+	const struct sophgo_pin *sp = sophgo_get_pin(pctrl, pin_id);
 	const struct cv1800_pin *pin = sophgo_to_cv1800_pin(sp);
 	enum cv1800_pin_io_type type = cv1800_pin_io_type(pin);
 	u32 pin_hwid = pin->pin.id;
@@ -172,7 +151,7 @@ static int cv1800_verify_pinmux_config(const struct sophgo_pin_mux_config *confi
 }
 
 static int cv1800_verify_pin_group(const struct sophgo_pin_mux_config *mux,
-				   unsigned long npins)
+				   unsigned int npins)
 {
 	struct cv1800_pin *pin;
 	enum cv1800_pin_io_type type;
@@ -197,165 +176,23 @@ static int cv1800_verify_pin_group(const struct sophgo_pin_mux_config *mux,
 	return 0;
 }
 
-static int cv1800_pctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
-				       struct device_node *np,
-				       struct pinctrl_map **maps,
-				       unsigned int *num_maps)
+static int cv1800_dt_node_to_map_post(struct device_node *cur,
+				      struct sophgo_pinctrl *pctrl,
+				      struct sophgo_pin_mux_config *pinmuxs,
+				      unsigned int npins)
 {
-	struct sophgo_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
-	struct device *dev = pctrl->dev;
-	struct device_node *child;
-	struct pinctrl_map *map;
-	const char **grpnames;
-	const char *grpname;
-	int ngroups = 0;
-	int nmaps = 0;
+	const struct cv1800_pin *pin = sophgo_to_cv1800_pin(pinmuxs[0].pin);
+	u32 power;
 	int ret;
 
-	for_each_available_child_of_node(np, child)
-		ngroups += 1;
+	ret = of_property_read_u32(cur, "power-source", &power);
+	if (ret)
+		return ret;
 
-	grpnames = devm_kcalloc(dev, ngroups, sizeof(*grpnames), GFP_KERNEL);
-	if (!grpnames)
-		return -ENOMEM;
+	if (!(power == PIN_POWER_STATE_3V3 || power == PIN_POWER_STATE_1V8))
+		return -ENOTSUPP;
 
-	map = kcalloc(ngroups * 2, sizeof(*map), GFP_KERNEL);
-	if (!map)
-		return -ENOMEM;
-
-	ngroups = 0;
-	mutex_lock(&pctrl->mutex);
-	for_each_available_child_of_node(np, child) {
-		int npins = of_property_count_u32_elems(child, "pinmux");
-		unsigned int *pins;
-		struct sophgo_pin_mux_config *pinmuxs;
-		struct cv1800_pin *pin;
-		u32 config, power;
-		int i;
-
-		if (npins < 1) {
-			dev_err(dev, "invalid pinctrl group %pOFn.%pOFn\n",
-				np, child);
-			ret = -EINVAL;
-			goto dt_failed;
-		}
-
-		grpname = devm_kasprintf(dev, GFP_KERNEL, "%pOFn.%pOFn",
-					 np, child);
-		if (!grpname) {
-			ret = -ENOMEM;
-			goto dt_failed;
-		}
-
-		grpnames[ngroups++] = grpname;
-
-		pins = devm_kcalloc(dev, npins, sizeof(*pins), GFP_KERNEL);
-		if (!pins) {
-			ret = -ENOMEM;
-			goto dt_failed;
-		}
-
-		pinmuxs = devm_kcalloc(dev, npins, sizeof(*pinmuxs), GFP_KERNEL);
-		if (!pinmuxs) {
-			ret = -ENOMEM;
-			goto dt_failed;
-		}
-
-		for (i = 0; i < npins; i++) {
-			ret = of_property_read_u32_index(child, "pinmux",
-							 i, &config);
-			if (ret)
-				goto dt_failed;
-
-			pins[i] = cv1800_dt_get_pin(config);
-			pinmuxs[i].config = config;
-			pinmuxs[i].pin = cv1800_get_pin(pctrl, pins[i]);
-
-			if (!pinmuxs[i].pin) {
-				dev_err(dev, "failed to get pin %d\n", pins[i]);
-				ret = -ENODEV;
-				goto dt_failed;
-			}
-
-			ret = cv1800_verify_pinmux_config(&pinmuxs[i]);
-			if (ret) {
-				dev_err(dev, "group %s pin %d is invalid\n",
-					grpname, i);
-				goto dt_failed;
-			}
-		}
-
-		ret = cv1800_verify_pin_group(pinmuxs, npins);
-		if (ret) {
-			dev_err(dev, "group %s is invalid\n", grpname);
-			goto dt_failed;
-		}
-
-		ret = of_property_read_u32(child, "power-source", &power);
-		if (ret)
-			goto dt_failed;
-
-		if (!(power == PIN_POWER_STATE_3V3 || power == PIN_POWER_STATE_1V8)) {
-			dev_err(dev, "group %s have unsupported power: %u\n",
-				grpname, power);
-			ret = -ENOTSUPP;
-			goto dt_failed;
-		}
-
-		pin = sophgo_to_cv1800_pin(pinmuxs[0].pin);
-		ret = cv1800_set_power_cfg(pctrl, pin->power_domain, power);
-		if (ret)
-			goto dt_failed;
-
-		map[nmaps].type = PIN_MAP_TYPE_MUX_GROUP;
-		map[nmaps].data.mux.function = np->name;
-		map[nmaps].data.mux.group = grpname;
-		nmaps += 1;
-
-		ret = pinconf_generic_parse_dt_config(child, pctldev,
-						      &map[nmaps].data.configs.configs,
-						      &map[nmaps].data.configs.num_configs);
-		if (ret) {
-			dev_err(dev, "failed to parse pin config of group %s: %d\n",
-				grpname, ret);
-			goto dt_failed;
-		}
-
-		ret = pinctrl_generic_add_group(pctldev, grpname,
-						pins, npins, pinmuxs);
-		if (ret < 0) {
-			dev_err(dev, "failed to add group %s: %d\n", grpname, ret);
-			goto dt_failed;
-		}
-
-		/* don't create a map if there are no pinconf settings */
-		if (map[nmaps].data.configs.num_configs == 0)
-			continue;
-
-		map[nmaps].type = PIN_MAP_TYPE_CONFIGS_GROUP;
-		map[nmaps].data.configs.group_or_pin = grpname;
-		nmaps += 1;
-	}
-
-	ret = pinmux_generic_add_function(pctldev, np->name,
-					  grpnames, ngroups, NULL);
-	if (ret < 0) {
-		dev_err(dev, "error adding function %s: %d\n", np->name, ret);
-		goto function_failed;
-	}
-
-	*maps = map;
-	*num_maps = nmaps;
-	mutex_unlock(&pctrl->mutex);
-
-	return 0;
-
-dt_failed:
-	of_node_put(child);
-function_failed:
-	pinctrl_utils_free_map(pctldev, map, nmaps);
-	mutex_unlock(&pctrl->mutex);
-	return ret;
+	return cv1800_set_power_cfg(pctrl, pin->power_domain, power);
 }
 
 static const struct pinctrl_ops cv1800_pctrl_ops = {
@@ -363,54 +200,35 @@ static const struct pinctrl_ops cv1800_pctrl_ops = {
 	.get_group_name		= pinctrl_generic_get_group_name,
 	.get_group_pins		= pinctrl_generic_get_group_pins,
 	.pin_dbg_show		= cv1800_pctrl_dbg_show,
-	.dt_node_to_map		= cv1800_pctrl_dt_node_to_map,
+	.dt_node_to_map		= sophgo_pctrl_dt_node_to_map,
 	.dt_free_map		= pinctrl_utils_free_map,
 };
 
-static int cv1800_pmx_set_mux(struct pinctrl_dev *pctldev,
-			      unsigned int fsel, unsigned int gsel)
+static void cv1800_set_pinmux_config(struct sophgo_pinctrl *pctrl,
+				     const struct sophgo_pin *sp, u32 config)
 {
-	struct sophgo_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+	const struct cv1800_pin *pin = sophgo_to_cv1800_pin(sp);
 	struct cv1800_priv *priv = pctrl->priv_ctrl;
-	const struct group_desc *group;
-	const struct sophgo_pin_mux_config *configs;
-	unsigned int i;
-
-	group = pinctrl_generic_get_group(pctldev, gsel);
-	if (!group)
-		return -EINVAL;
-
-	configs = group->data;
-
-	for (i = 0; i < group->grp.npins; i++) {
-		const struct cv1800_pin *pin = sophgo_to_cv1800_pin(configs[i].pin);
-		u32 value = configs[i].config;
-		void __iomem *reg_mux;
-		void __iomem *reg_mux2;
-		unsigned long flags;
-		u32 mux;
-		u32 mux2;
-
-		reg_mux = cv1800_pinctrl_get_component_addr(priv, &pin->mux);
-		reg_mux2 = cv1800_pinctrl_get_component_addr(priv, &pin->mux2);
-		mux = cv1800_dt_get_pin_mux(value);
-		mux2 = cv1800_dt_get_pin_mux2(value);
-
-		raw_spin_lock_irqsave(&pctrl->lock, flags);
-		writel_relaxed(mux, reg_mux);
-		if (mux2 != PIN_MUX_INVALD)
-			writel_relaxed(mux2, reg_mux2);
-		raw_spin_unlock_irqrestore(&pctrl->lock, flags);
-	}
-
-	return 0;
+	void __iomem *reg_mux;
+	void __iomem *reg_mux2;
+	u32 mux;
+	u32 mux2;
+
+	reg_mux = cv1800_pinctrl_get_component_addr(priv, &pin->mux);
+	reg_mux2 = cv1800_pinctrl_get_component_addr(priv, &pin->mux2);
+	mux = cv1800_dt_get_pin_mux(config);
+	mux2 = cv1800_dt_get_pin_mux2(config);
+
+	writel_relaxed(mux, reg_mux);
+	if (mux2 != PIN_MUX_INVALD)
+		writel_relaxed(mux2, reg_mux2);
 }
 
 static const struct pinmux_ops cv1800_pmx_ops = {
 	.get_functions_count	= pinmux_generic_get_function_count,
 	.get_function_name	= pinmux_generic_get_function_name,
 	.get_function_groups	= pinmux_generic_get_function_groups,
-	.set_mux		= cv1800_pmx_set_mux,
+	.set_mux		= sophgo_pmx_set_mux,
 	.strict			= true,
 };
 
@@ -421,99 +239,13 @@ static const struct pinmux_ops cv1800_pmx_ops = {
 #define PIN_IO_BUS_HOLD		BIT(10)
 #define PIN_IO_OUT_FAST_SLEW	BIT(11)
 
-static u32 cv1800_pull_down_typical_resistor(struct sophgo_pinctrl *pctrl,
-					     const struct sophgo_pin *pin,
-					     const u32 *power_cfg)
-{
-	return pctrl->data->vddio_ops->get_pull_down(pin, power_cfg);
-}
-
-static u32 cv1800_pull_up_typical_resistor(struct sophgo_pinctrl *pctrl,
-					   const struct sophgo_pin *pin,
-					   const u32 *power_cfg)
-{
-	return pctrl->data->vddio_ops->get_pull_up(pin, power_cfg);
-}
-
-static int cv1800_pinctrl_oc2reg(struct sophgo_pinctrl *pctrl,
-				 const struct sophgo_pin *pin,
-				 const u32 *power_cfg, u32 target)
-{
-	const u32 *map;
-	int i, len;
-
-	len = pctrl->data->vddio_ops->get_oc_map(pin, power_cfg, &map);
-	if (len < 0)
-		return len;
-
-	for (i = 0; i < len; i++) {
-		if (map[i] >= target)
-			return i;
-	}
-
-	return -EINVAL;
-}
-
-static int cv1800_pinctrl_reg2oc(struct sophgo_pinctrl *pctrl,
-				 const struct sophgo_pin *pin,
-				 const u32 *power_cfg, u32 reg)
-{
-	const u32 *map;
-	int len;
-
-	len = pctrl->data->vddio_ops->get_oc_map(pin, power_cfg, &map);
-	if (len < 0)
-		return len;
-
-	if (reg >= len)
-		return -EINVAL;
-
-	return map[reg];
-}
-
-static int cv1800_pinctrl_schmitt2reg(struct sophgo_pinctrl *pctrl,
-				      const struct sophgo_pin *pin,
-				      const u32 *power_cfg, u32 target)
-{
-	const u32 *map;
-	int i, len;
-
-	len = pctrl->data->vddio_ops->get_schmitt_map(pin, power_cfg, &map);
-	if (len < 0)
-		return len;
-
-	for (i = 0; i < len; i++) {
-		if (map[i] == target)
-			return i;
-	}
-
-	return -EINVAL;
-}
-
-static int cv1800_pinctrl_reg2schmitt(struct sophgo_pinctrl *pctrl,
-				      const struct sophgo_pin *pin,
-				      const u32 *power_cfg, u32 reg)
-{
-	const u32 *map;
-	int len;
-
-	len = pctrl->data->vddio_ops->get_schmitt_map(pin, power_cfg, &map);
-	if (len < 0)
-		return len;
-
-	if (reg >= len)
-		return -EINVAL;
-
-	return map[reg];
-}
-
 static int cv1800_pconf_get(struct pinctrl_dev *pctldev,
 			    unsigned int pin_id, unsigned long *config)
 {
 	struct sophgo_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
 	struct cv1800_priv *priv = pctrl->priv_ctrl;
 	int param = pinconf_to_config_param(*config);
-	const struct sophgo_pin *sp = cv1800_get_pin(pctrl, pin_id);
+	const struct sophgo_pin *sp = sophgo_get_pin(pctrl, pin_id);
 	const struct cv1800_pin *pin = sophgo_to_cv1800_pin(sp);
 	enum cv1800_pin_io_type type;
 	u32 value;
@@ -533,23 +265,23 @@ static int cv1800_pconf_get(struct pinctrl_dev *pctldev,
 	switch (param) {
 	case PIN_CONFIG_BIAS_PULL_DOWN:
 		enabled = FIELD_GET(PIN_IO_PULLDOWN, value);
-		arg = cv1800_pull_down_typical_resistor(pctrl, sp, priv->power_cfg);
+		arg = sophgo_pinctrl_typical_pull_down(pctrl, sp, priv->power_cfg);
 		break;
 	case PIN_CONFIG_BIAS_PULL_UP:
 		enabled = FIELD_GET(PIN_IO_PULLUP, value);
-		arg = cv1800_pull_up_typical_resistor(pctrl, sp, priv->power_cfg);
+		arg = sophgo_pinctrl_typical_pull_up(pctrl, sp, priv->power_cfg);
 		break;
 	case PIN_CONFIG_DRIVE_STRENGTH_UA:
 		enabled = true;
 		arg = FIELD_GET(PIN_IO_DRIVE, value);
-		ret = cv1800_pinctrl_reg2oc(pctrl, sp, priv->power_cfg, arg);
+		ret = sophgo_pinctrl_reg2oc(pctrl, sp, priv->power_cfg, arg);
 		if (ret < 0)
 			return ret;
 		arg = ret;
 		break;
 	case PIN_CONFIG_INPUT_SCHMITT_UV:
 		arg = FIELD_GET(PIN_IO_SCHMITT, value);
-		ret = cv1800_pinctrl_reg2schmitt(pctrl, sp, priv->power_cfg, arg);
+		ret = sophgo_pinctrl_reg2schmitt(pctrl, sp, priv->power_cfg, arg);
 		if (ret < 0)
 			return ret;
 		arg = ret;
@@ -612,7 +344,7 @@ static int cv1800_pinconf_compute_config(struct sophgo_pinctrl *pctrl,
 			m |= PIN_IO_PULLUP;
 			break;
 		case PIN_CONFIG_DRIVE_STRENGTH_UA:
-			ret = cv1800_pinctrl_oc2reg(pctrl, sp,
+			ret = sophgo_pinctrl_oc2reg(pctrl, sp,
 						    priv->power_cfg, arg);
 			if (ret < 0)
 				return ret;
@@ -621,7 +353,7 @@ static int cv1800_pinconf_compute_config(struct sophgo_pinctrl *pctrl,
 			m |= PIN_IO_DRIVE;
 			break;
 		case PIN_CONFIG_INPUT_SCHMITT_UV:
-			ret = cv1800_pinctrl_schmitt2reg(pctrl, sp,
+			ret = sophgo_pinctrl_schmitt2reg(pctrl, sp,
 							 priv->power_cfg, arg);
 			if (ret < 0)
 				return ret;
@@ -653,84 +385,29 @@ static int cv1800_pinconf_compute_config(struct sophgo_pinctrl *pctrl,
 	return 0;
 }
 
-static int cv1800_pin_set_config(struct sophgo_pinctrl *pctrl,
-				 unsigned int pin_id,
-				 u32 value, u32 mask)
+static int cv1800_set_pinconf_config(struct sophgo_pinctrl *pctrl,
+				     const struct sophgo_pin *sp,
+				     u32 value, u32 mask)
 {
 	struct cv1800_priv *priv = pctrl->priv_ctrl;
-	const struct sophgo_pin *sp = cv1800_get_pin(pctrl, pin_id);
-	struct cv1800_pin *pin;
-	unsigned long flags;
+	struct cv1800_pin *pin = sophgo_to_cv1800_pin(sp);
 	void __iomem *addr;
 	u32 reg;
 
-	if (!sp)
-		return -EINVAL;
-	pin = sophgo_to_cv1800_pin(sp);
-
 	addr = cv1800_pinctrl_get_component_addr(priv, &pin->conf);
 
-	raw_spin_lock_irqsave(&pctrl->lock, flags);
 	reg = readl(addr);
 	reg &= ~mask;
 	reg |= value;
 	writel(reg, addr);
-	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
-
-	return 0;
-}
-
-static int cv1800_pconf_set(struct pinctrl_dev *pctldev,
-			    unsigned int pin_id, unsigned long *configs,
-			    unsigned int num_configs)
-{
-	struct sophgo_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
-	const struct sophgo_pin *sp = cv1800_get_pin(pctrl, pin_id);
-	u32 value, mask;
-
-	if (!sp)
-		return -EINVAL;
-
-	if (cv1800_pinconf_compute_config(pctrl, sp,
-					  configs, num_configs,
-					  &value, &mask))
-		return -ENOTSUPP;
-
-	return cv1800_pin_set_config(pctrl, pin_id, value, mask);
-}
-
-static int cv1800_pconf_group_set(struct pinctrl_dev *pctldev,
-				  unsigned int gsel,
-				  unsigned long *configs,
-				  unsigned int num_configs)
-{
-	struct sophgo_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
-	const struct group_desc *group;
-	const struct sophgo_pin_mux_config *pinmuxs;
-	u32 value, mask;
-	int i;
-
-	group = pinctrl_generic_get_group(pctldev, gsel);
-	if (!group)
-		return -EINVAL;
-
-	pinmuxs = group->data;
-
-	if (cv1800_pinconf_compute_config(pctrl, pinmuxs[0].pin,
-					  configs, num_configs,
-					  &value, &mask))
-		return -ENOTSUPP;
-
-	for (i = 0; i < group->grp.npins; i++)
-		cv1800_pin_set_config(pctrl, group->grp.pins[i], value, mask);
 
 	return 0;
 }
 
 static const struct pinconf_ops cv1800_pconf_ops = {
 	.pin_config_get			= cv1800_pconf_get,
-	.pin_config_set			= cv1800_pconf_set,
-	.pin_config_group_set		= cv1800_pconf_group_set,
+	.pin_config_set			= sophgo_pconf_set,
+	.pin_config_group_set		= sophgo_pconf_group_set,
 	.is_generic			= true,
 };
 
@@ -795,3 +472,13 @@ int cv1800_pinctrl_probe(struct platform_device *pdev)
 	return pinctrl_enable(pctrl->pctrl_dev);
 }
 EXPORT_SYMBOL_GPL(cv1800_pinctrl_probe);
+
+const struct sophgo_cfg_ops cv1800_cfg_ops = {
+	.verify_pinmux_config = cv1800_verify_pinmux_config,
+	.verify_pin_group = cv1800_verify_pin_group,
+	.dt_node_to_map_post = cv1800_dt_node_to_map_post,
+	.compute_pinconf_config = cv1800_pinconf_compute_config,
+	.set_pinconf_config = cv1800_set_pinconf_config,
+	.set_pinmux_config = cv1800_set_pinmux_config,
+};
+EXPORT_SYMBOL_GPL(cv1800_cfg_ops);
diff --git a/drivers/pinctrl/sophgo/pinctrl-cv18xx.h b/drivers/pinctrl/sophgo/pinctrl-cv18xx.h
index f095a6e85e52..821e554e550b 100644
--- a/drivers/pinctrl/sophgo/pinctrl-cv18xx.h
+++ b/drivers/pinctrl/sophgo/pinctrl-cv18xx.h
@@ -68,6 +68,8 @@ static inline enum cv1800_pin_io_type cv1800_pin_io_type(const struct cv1800_pin
 	return FIELD_GET(CV1800_PIN_IO_TYPE, pin->pin.flags);
 };
 
+extern const struct sophgo_cfg_ops cv1800_cfg_ops;
+
 int cv1800_pinctrl_probe(struct platform_device *pdev);
 
 #define CV1800_FUNC_PIN(_id, _power_domain, _type,			\
diff --git a/drivers/pinctrl/sophgo/pinctrl-sg2000.c b/drivers/pinctrl/sophgo/pinctrl-sg2000.c
index a83dae233cdf..9580bd285699 100644
--- a/drivers/pinctrl/sophgo/pinctrl-sg2000.c
+++ b/drivers/pinctrl/sophgo/pinctrl-sg2000.c
@@ -751,6 +751,7 @@ static const struct sophgo_pinctrl_data sg2000_pindata = {
 	.pindata	= sg2000_pin_data,
 	.pdnames	= sg2000_power_domain_desc,
 	.vddio_ops	= &sg2000_vddio_cfg_ops,
+	.cfg_ops	= &cv1800_cfg_ops,
 	.npins		= ARRAY_SIZE(sg2000_pins),
 	.npds		= ARRAY_SIZE(sg2000_power_domain_desc),
 	.pinsize	= sizeof(struct cv1800_pin),
diff --git a/drivers/pinctrl/sophgo/pinctrl-sg2002.c b/drivers/pinctrl/sophgo/pinctrl-sg2002.c
index 4366486d8b7f..e3041a8b8ba6 100644
--- a/drivers/pinctrl/sophgo/pinctrl-sg2002.c
+++ b/drivers/pinctrl/sophgo/pinctrl-sg2002.c
@@ -522,6 +522,7 @@ static const struct sophgo_pinctrl_data sg2002_pindata = {
 	.pindata	= sg2002_pin_data,
 	.pdnames	= sg2002_power_domain_desc,
 	.vddio_ops	= &sg2002_vddio_cfg_ops,
+	.cfg_ops	= &cv1800_cfg_ops,
 	.npins		= ARRAY_SIZE(sg2002_pins),
 	.npds		= ARRAY_SIZE(sg2002_power_domain_desc),
 	.pinsize	= sizeof(struct cv1800_pin),
diff --git a/drivers/pinctrl/sophgo/pinctrl-sophgo-common.c b/drivers/pinctrl/sophgo/pinctrl-sophgo-common.c
new file mode 100644
index 000000000000..957d84e75643
--- /dev/null
+++ b/drivers/pinctrl/sophgo/pinctrl-sophgo-common.c
@@ -0,0 +1,404 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Sophgo SoCs pinctrl common ops.
+ *
+ * Copyright (C) 2024 Inochi Amaoto <inochiama@outlook.com>
+ *
+ */
+
+#include <linux/bsearch.h>
+#include <linux/cleanup.h>
+#include <linux/export.h>
+#include <linux/io.h>
+#include <linux/of.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/seq_file.h>
+#include <linux/spinlock.h>
+
+#include <linux/pinctrl/pinconf-generic.h>
+#include <linux/pinctrl/pinctrl.h>
+
+#include "../pinctrl-utils.h"
+#include "../pinconf.h"
+#include "../pinmux.h"
+
+#include "pinctrl-sophgo.h"
+
+static u16 sophgo_dt_get_pin(u32 value)
+{
+	return value;
+}
+
+static int sophgo_cmp_pin(const void *key, const void *pivot)
+{
+	const struct sophgo_pin *pin = pivot;
+	int pin_id = (long)key;
+	int pivid = pin->id;
+
+	return pin_id - pivid;
+}
+
+const struct sophgo_pin *sophgo_get_pin(struct sophgo_pinctrl *pctrl,
+					unsigned long pin_id)
+{
+	return bsearch((void *)pin_id, pctrl->data->pindata, pctrl->data->npins,
+		       pctrl->data->pinsize, sophgo_cmp_pin);
+}
+
+static int sophgo_verify_pinmux_config(struct sophgo_pinctrl *pctrl,
+				       const struct sophgo_pin_mux_config *config)
+{
+	if (pctrl->data->cfg_ops->verify_pinmux_config)
+		return pctrl->data->cfg_ops->verify_pinmux_config(config);
+	return 0;
+}
+
+static int sophgo_verify_pin_group(struct sophgo_pinctrl *pctrl,
+				   const struct sophgo_pin_mux_config *config,
+				   unsigned int npins)
+{
+	if (pctrl->data->cfg_ops->verify_pin_group)
+		return pctrl->data->cfg_ops->verify_pin_group(config, npins);
+	return 0;
+}
+
+static int sophgo_dt_node_to_map_post(struct device_node *cur,
+				      struct sophgo_pinctrl *pctrl,
+				      struct sophgo_pin_mux_config *config,
+				      unsigned int npins)
+{
+	if (pctrl->data->cfg_ops->dt_node_to_map_post)
+		return pctrl->data->cfg_ops->dt_node_to_map_post(cur, pctrl,
+								 config, npins);
+	return 0;
+}
+
+int sophgo_pctrl_dt_node_to_map(struct pinctrl_dev *pctldev, struct device_node *np,
+				struct pinctrl_map **maps, unsigned int *num_maps)
+{
+	struct sophgo_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+	struct device *dev = pctrl->dev;
+	struct device_node *child;
+	struct pinctrl_map *map;
+	const char **grpnames;
+	const char *grpname;
+	int ngroups = 0;
+	int nmaps = 0;
+	int ret;
+
+	for_each_available_child_of_node(np, child)
+		ngroups += 1;
+
+	grpnames = devm_kcalloc(dev, ngroups, sizeof(*grpnames), GFP_KERNEL);
+	if (!grpnames)
+		return -ENOMEM;
+
+	map = kcalloc(ngroups * 2, sizeof(*map), GFP_KERNEL);
+	if (!map)
+		return -ENOMEM;
+
+	ngroups = 0;
+	guard(mutex)(&pctrl->mutex);
+	for_each_available_child_of_node(np, child) {
+		int npins = of_property_count_u32_elems(child, "pinmux");
+		unsigned int *pins;
+		struct sophgo_pin_mux_config *pinmuxs;
+		u32 config;
+		int i;
+
+		if (npins < 1) {
+			dev_err(dev, "invalid pinctrl group %pOFn.%pOFn\n",
+				np, child);
+			ret = -EINVAL;
+			goto dt_failed;
+		}
+
+		grpname = devm_kasprintf(dev, GFP_KERNEL, "%pOFn.%pOFn",
+					 np, child);
+		if (!grpname) {
+			ret = -ENOMEM;
+			goto dt_failed;
+		}
+
+		grpnames[ngroups++] = grpname;
+
+		pins = devm_kcalloc(dev, npins, sizeof(*pins), GFP_KERNEL);
+		if (!pins) {
+			ret = -ENOMEM;
+			goto dt_failed;
+		}
+
+		pinmuxs = devm_kcalloc(dev, npins, sizeof(*pinmuxs), GFP_KERNEL);
+		if (!pinmuxs) {
+			ret = -ENOMEM;
+			goto dt_failed;
+		}
+
+		for (i = 0; i < npins; i++) {
+			ret = of_property_read_u32_index(child, "pinmux",
+							 i, &config);
+			if (ret)
+				goto dt_failed;
+
+			pins[i] = sophgo_dt_get_pin(config);
+			pinmuxs[i].config = config;
+			pinmuxs[i].pin = sophgo_get_pin(pctrl, pins[i]);
+
+			if (!pinmuxs[i].pin) {
+				dev_err(dev, "failed to get pin %d\n", pins[i]);
+				ret = -ENODEV;
+				goto dt_failed;
+			}
+
+			ret = sophgo_verify_pinmux_config(pctrl, &pinmuxs[i]);
+			if (ret) {
+				dev_err(dev, "group %s pin %d is invalid\n",
+					grpname, i);
+				goto dt_failed;
+			}
+		}
+
+		ret = sophgo_verify_pin_group(pctrl, pinmuxs, npins);
+		if (ret) {
+			dev_err(dev, "group %s is invalid\n", grpname);
+			goto dt_failed;
+		}
+
+		ret = sophgo_dt_node_to_map_post(child, pctrl, pinmuxs, npins);
+		if (ret)
+			goto dt_failed;
+
+		map[nmaps].type = PIN_MAP_TYPE_MUX_GROUP;
+		map[nmaps].data.mux.function = np->name;
+		map[nmaps].data.mux.group = grpname;
+		nmaps += 1;
+
+		ret = pinconf_generic_parse_dt_config(child, pctldev,
+						      &map[nmaps].data.configs.configs,
+						      &map[nmaps].data.configs.num_configs);
+		if (ret) {
+			dev_err(dev, "failed to parse pin config of group %s: %d\n",
+				grpname, ret);
+			goto dt_failed;
+		}
+
+		ret = pinctrl_generic_add_group(pctldev, grpname,
+						pins, npins, pinmuxs);
+		if (ret < 0) {
+			dev_err(dev, "failed to add group %s: %d\n", grpname, ret);
+			goto dt_failed;
+		}
+
+		/* don't create a map if there are no pinconf settings */
+		if (map[nmaps].data.configs.num_configs == 0)
+			continue;
+
+		map[nmaps].type = PIN_MAP_TYPE_CONFIGS_GROUP;
+		map[nmaps].data.configs.group_or_pin = grpname;
+		nmaps += 1;
+	}
+
+	ret = pinmux_generic_add_function(pctldev, np->name,
+					  grpnames, ngroups, NULL);
+	if (ret < 0) {
+		dev_err(dev, "error adding function %s: %d\n", np->name, ret);
+		goto function_failed;
+	}
+
+	*maps = map;
+	*num_maps = nmaps;
+
+	return 0;
+
+dt_failed:
+	of_node_put(child);
+function_failed:
+	pinctrl_utils_free_map(pctldev, map, nmaps);
+	return ret;
+}
+
+int sophgo_pmx_set_mux(struct pinctrl_dev *pctldev,
+		       unsigned int fsel, unsigned int gsel)
+{
+	struct sophgo_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+	const struct group_desc *group;
+	const struct sophgo_pin_mux_config *configs;
+	unsigned int i;
+
+	group = pinctrl_generic_get_group(pctldev, gsel);
+	if (!group)
+		return -EINVAL;
+
+	configs = group->data;
+
+	for (i = 0; i < group->grp.npins; i++) {
+		const struct sophgo_pin *pin = configs[i].pin;
+		u32 value = configs[i].config;
+
+		guard(raw_spinlock_irqsave)(&pctrl->lock);
+
+		pctrl->data->cfg_ops->set_pinmux_config(pctrl, pin, value);
+	}
+
+	return 0;
+}
+
+static int sophgo_pin_set_config(struct sophgo_pinctrl *pctrl,
+				 unsigned int pin_id,
+				 u32 value, u32 mask)
+{
+	const struct sophgo_pin *pin = sophgo_get_pin(pctrl, pin_id);
+
+	if (!pin)
+		return -EINVAL;
+
+	guard(raw_spinlock_irqsave)(&pctrl->lock);
+
+	return pctrl->data->cfg_ops->set_pinconf_config(pctrl, pin, value, mask);
+}
+
+int sophgo_pconf_set(struct pinctrl_dev *pctldev, unsigned int pin_id,
+		     unsigned long *configs, unsigned int num_configs)
+{
+	struct sophgo_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+	const struct sophgo_pin *pin = sophgo_get_pin(pctrl, pin_id);
+	u32 value, mask;
+
+	if (!pin)
+		return -ENODEV;
+
+	if (pctrl->data->cfg_ops->compute_pinconf_config(pctrl, pin,
+							 configs, num_configs,
+							 &value, &mask))
+		return -ENOTSUPP;
+
+	return sophgo_pin_set_config(pctrl, pin_id, value, mask);
+}
+
+int sophgo_pconf_group_set(struct pinctrl_dev *pctldev, unsigned int gsel,
+			   unsigned long *configs, unsigned int num_configs)
+{
+	struct sophgo_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+	const struct group_desc *group;
+	const struct sophgo_pin_mux_config *pinmuxs;
+	u32 value, mask;
+	int i;
+
+	group = pinctrl_generic_get_group(pctldev, gsel);
+	if (!group)
+		return -EINVAL;
+
+	pinmuxs = group->data;
+
+	if (pctrl->data->cfg_ops->compute_pinconf_config(pctrl, pinmuxs[0].pin,
+							 configs, num_configs,
+							 &value, &mask))
+		return -ENOTSUPP;
+
+	for (i = 0; i < group->grp.npins; i++)
+		sophgo_pin_set_config(pctrl,  group->grp.pins[i], value, mask);
+
+	return 0;
+}
+
+u32 sophgo_pinctrl_typical_pull_down(struct sophgo_pinctrl *pctrl,
+				     const struct sophgo_pin *pin,
+				     const u32 *power_cfg)
+{
+	return pctrl->data->vddio_ops->get_pull_down(pin, power_cfg);
+}
+
+u32 sophgo_pinctrl_typical_pull_up(struct sophgo_pinctrl *pctrl,
+				   const struct sophgo_pin *pin,
+				   const u32 *power_cfg)
+{
+	return pctrl->data->vddio_ops->get_pull_up(pin, power_cfg);
+}
+
+int sophgo_pinctrl_oc2reg(struct sophgo_pinctrl *pctrl,
+			  const struct sophgo_pin *pin,
+			  const u32 *power_cfg, u32 target)
+{
+	const u32 *map;
+	int i, len;
+
+	if (!pctrl->data->vddio_ops->get_oc_map)
+		return -ENOTSUPP;
+
+	len = pctrl->data->vddio_ops->get_oc_map(pin, power_cfg, &map);
+	if (len < 0)
+		return len;
+
+	for (i = 0; i < len; i++) {
+		if (map[i] >= target)
+			return i;
+	}
+
+	return -EINVAL;
+}
+
+int sophgo_pinctrl_reg2oc(struct sophgo_pinctrl *pctrl,
+			  const struct sophgo_pin *pin,
+			  const u32 *power_cfg, u32 reg)
+{
+	const u32 *map;
+	int len;
+
+	if (!pctrl->data->vddio_ops->get_oc_map)
+		return -ENOTSUPP;
+
+	len = pctrl->data->vddio_ops->get_oc_map(pin, power_cfg, &map);
+	if (len < 0)
+		return len;
+
+	if (reg >= len)
+		return -EINVAL;
+
+	return map[reg];
+}
+
+int sophgo_pinctrl_schmitt2reg(struct sophgo_pinctrl *pctrl,
+			       const struct sophgo_pin *pin,
+			       const u32 *power_cfg, u32 target)
+{
+	const u32 *map;
+	int i, len;
+
+	if (!pctrl->data->vddio_ops->get_schmitt_map)
+		return -ENOTSUPP;
+
+	len = pctrl->data->vddio_ops->get_schmitt_map(pin, power_cfg, &map);
+	if (len < 0)
+		return len;
+
+	for (i = 0; i < len; i++) {
+		if (map[i] == target)
+			return i;
+	}
+
+	return -EINVAL;
+}
+
+int sophgo_pinctrl_reg2schmitt(struct sophgo_pinctrl *pctrl,
+			       const struct sophgo_pin *pin,
+			       const u32 *power_cfg, u32 reg)
+{
+	const u32 *map;
+	int len;
+
+	if (!pctrl->data->vddio_ops->get_schmitt_map)
+		return -ENOTSUPP;
+
+	len = pctrl->data->vddio_ops->get_schmitt_map(pin, power_cfg, &map);
+	if (len < 0)
+		return len;
+
+	if (reg >= len)
+		return -EINVAL;
+
+	return map[reg];
+}
+
+MODULE_DESCRIPTION("Common pinctrl helper function for the Sophgo SoC");
+MODULE_LICENSE("GPL");
diff --git a/drivers/pinctrl/sophgo/pinctrl-sophgo.h b/drivers/pinctrl/sophgo/pinctrl-sophgo.h
index e43b4f30f18a..f8b094a09f7c 100644
--- a/drivers/pinctrl/sophgo/pinctrl-sophgo.h
+++ b/drivers/pinctrl/sophgo/pinctrl-sophgo.h
@@ -9,10 +9,13 @@
 #include <linux/device.h>
 #include <linux/mutex.h>
 #include <linux/pinctrl/pinctrl.h>
+#include <linux/platform_device.h>
 #include <linux/spinlock.h>
 
 #include "../core.h"
 
+struct sophgo_pinctrl;
+
 struct sophgo_pin {
 	u16				id;
 	u16				flags;
@@ -23,6 +26,36 @@ struct sophgo_pin_mux_config {
 	u32			config;
 };
 
+/**
+ * struct sophgo_cfg_ops - pin configuration operations
+ *
+ * @verify_pinmux_config: verify the pinmux config for a pin
+ * @verify_pin_group: verify the whole pinmux group
+ * @dt_node_to_map_post: post init for the pinmux config map
+ * @compute_pinconf_config: compute pinconf config
+ * @set_pinconf_config: set pinconf config (the caller holds lock)
+ * @set_pinmux_config: set mux config (the caller holds lock)
+ */
+struct sophgo_cfg_ops {
+	int (*verify_pinmux_config)(const struct sophgo_pin_mux_config *config);
+	int (*verify_pin_group)(const struct sophgo_pin_mux_config *pinmuxs,
+				unsigned int npins);
+	int (*dt_node_to_map_post)(struct device_node *cur,
+				   struct sophgo_pinctrl *pctrl,
+				   struct sophgo_pin_mux_config *pinmuxs,
+				   unsigned int npins);
+	int (*compute_pinconf_config)(struct sophgo_pinctrl *pctrl,
+				      const struct sophgo_pin *sp,
+				      unsigned long *configs,
+				      unsigned int num_configs,
+				      u32 *value, u32 *mask);
+	int (*set_pinconf_config)(struct sophgo_pinctrl *pctrl,
+				  const struct sophgo_pin *sp,
+				  u32 value, u32 mask);
+	void (*set_pinmux_config)(struct sophgo_pinctrl *pctrl,
+				  const struct sophgo_pin *sp, u32 config);
+};
+
 /**
  * struct sophgo_vddio_cfg_ops - pin vddio operations
  *
@@ -47,6 +80,7 @@ struct sophgo_pinctrl_data {
 	const void				*pindata;
 	const char				* const *pdnames;
 	const struct sophgo_vddio_cfg_ops	*vddio_ops;
+	const struct sophgo_cfg_ops		*cfg_ops;
 	u16					npins;
 	u16					npds;
 	u16					pinsize;
@@ -63,4 +97,33 @@ struct sophgo_pinctrl {
 	void					*priv_ctrl;
 };
 
+const struct sophgo_pin *sophgo_get_pin(struct sophgo_pinctrl *pctrl,
+					unsigned long pin_id);
+int sophgo_pctrl_dt_node_to_map(struct pinctrl_dev *pctldev, struct device_node *np,
+				struct pinctrl_map **maps, unsigned int *num_maps);
+int sophgo_pmx_set_mux(struct pinctrl_dev *pctldev,
+		       unsigned int fsel, unsigned int gsel);
+int sophgo_pconf_set(struct pinctrl_dev *pctldev, unsigned int pin_id,
+		     unsigned long *configs, unsigned int num_configs);
+int sophgo_pconf_group_set(struct pinctrl_dev *pctldev, unsigned int gsel,
+			   unsigned long *configs, unsigned int num_configs);
+u32 sophgo_pinctrl_typical_pull_down(struct sophgo_pinctrl *pctrl,
+				     const struct sophgo_pin *pin,
+				     const u32 *power_cfg);
+u32 sophgo_pinctrl_typical_pull_up(struct sophgo_pinctrl *pctrl,
+				   const struct sophgo_pin *pin,
+				   const u32 *power_cfg);
+int sophgo_pinctrl_oc2reg(struct sophgo_pinctrl *pctrl,
+			  const struct sophgo_pin *pin,
+			  const u32 *power_cfg, u32 target);
+int sophgo_pinctrl_reg2oc(struct sophgo_pinctrl *pctrl,
+			  const struct sophgo_pin *pin,
+			  const u32 *power_cfg, u32 reg);
+int sophgo_pinctrl_schmitt2reg(struct sophgo_pinctrl *pctrl,
+			       const struct sophgo_pin *pin,
+			       const u32 *power_cfg, u32 target);
+int sophgo_pinctrl_reg2schmitt(struct sophgo_pinctrl *pctrl,
+			       const struct sophgo_pin *pin,
+			       const u32 *power_cfg, u32 reg);
+
 #endif /* _PINCTRL_SOPHGO_H */
-- 
2.48.1


