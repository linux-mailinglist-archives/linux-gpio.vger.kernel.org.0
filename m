Return-Path: <linux-gpio+bounces-15689-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C16BAA302C4
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 06:18:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B7B2E167DB9
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 05:18:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59FD01E25F4;
	Tue, 11 Feb 2025 05:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ljSrSVry"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596711DB15C;
	Tue, 11 Feb 2025 05:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739251106; cv=none; b=qJTMOb0gMUayFGn9eNHEd9pzOWMGeBT/sEzK6G57W5MI2c2RXpFDUEWMkweHueC5tbo/X05q7AjUYew+RhJGaB7qMnca1MJD6xYbM2L0N/uPtwurUyGL7DvFI/cYloq+9Il4z9Y1RjFcrHh0M5A53ylEDUo/kuxabBz2o1GQveE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739251106; c=relaxed/simple;
	bh=wqEFzTl+OTkW75WGfP47kKe9m0zKe0aC2zrO8HUMgeA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p1VnqZUEeQcX94Irre1RSU1P0z47AY23TV0cQEff7nkZaF7JHtHmphZKhVxeFxV93ySljSofsJgxH8EiW3y4TSRukTS1rZXS+8Swqk3r+gEMkoYNMK7gcQ93nTvLxksptV9sm3SMTiq/1MFrlghXXFqewI91WmfTJDHXO7SAKCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ljSrSVry; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-46c8474d8f6so42590371cf.3;
        Mon, 10 Feb 2025 21:18:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739251102; x=1739855902; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dT7DCLsF/p7+/Buw5co/GRDvIZiARDJ/UFC6/JF4DNc=;
        b=ljSrSVry0XJf6mibPtsQv+toe4cEEkhk2Q1oOT3g/zPg19EY7TpjXlhw6BsSb6L8sd
         cIjce2bn21kl98T+gN9LUZaGkZal4yT61oJRBzPAFxP74vPGlJDBaCJsDAwPP998SH4a
         zZ34WI7dIdOhRrvmc7w5W+dceWfktH9HN+pJF7Mo+3C4+N+3vC3b16oLnveDlu80aQl5
         jhulVvkK7LlL0+C8HKEecRr9DrnQDFpHLCSyJoiF5oyUBH5m4ZU4wqjnAyAVbN7kQGYD
         fiFqR8PW6nTL2Ee5Ezj5/TNj+IYgF5sZhWbqOb93Hcdl9EAbdbU0CrkU+fw4IYN0Vwyc
         toZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739251102; x=1739855902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dT7DCLsF/p7+/Buw5co/GRDvIZiARDJ/UFC6/JF4DNc=;
        b=XDmAsCyqkUVtFV/fpZvrMp4LyiZM3YRIRhJlR8cZc6x0sy/dIVH6ntdRhKgouK8baS
         pRqlCwMU9HUk+sNAsOTLENs6O6OA9L7BaGPt/TYKFweDJAkT4qxwGeZfSo4O01ev141K
         a+Rol6FZIyLvVzswHkFJl6d9fjniZg2YVsrYsSNTgKb6wgQpxfDMM9/mc2dLeD/BIxNF
         F8g1UlcKDI7OrlDoT+OYNVN5y0v79aO3I73zgmfv8UPtIJ+tf1MMV3Z7kzk/qUJl1Wnw
         aOpyzwyse3JL8HxIWco8PKBW5h6G0KX+9x/YslCeM8lLkCoOBYkAEIL3Vzo2/jdcicCY
         oWCw==
X-Forwarded-Encrypted: i=1; AJvYcCVGZyt2aqwXk9IPwL9bbt+NN2Iy/RTcxBPv4vBGSyErE/aWsxUBZ8DzkVueA/wUR8SBpFvXIbDt17X+@vger.kernel.org, AJvYcCVqVZYiHpalGouN0XRk6cyTExLztTnalaKyBCL4XsibXStzqRa8/O0NV+nlXvoJfGcXaJDfp0laj5bNtw==@vger.kernel.org, AJvYcCXA8GIvfHYOV2O9mw6biAQY81L312s7eY7QMG4AqCoS26K8CT96l20BI/TUEE0sKoA/Xq42kSwtcsI6mjzp@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8P02HJ0MfLHUeadmwHla7RC844Th6+lmZNCgvc1pSoBguFF4V
	jepjxb2Bzgh1kRKOXieYPHRK6ekEnDGgtekOnbHR0VnrO3MnGfsv
X-Gm-Gg: ASbGncuqP0C9diwDcINEWNUsZuVGUaDsMUdDRFic/xI1Z145r4RRoF/HWqIOE12zXM/
	lhlGHDxhvJ0JJdBg9qFsDqm2wkE5qpoxATbqyhpvtRU0PF6/z1fQK6zsZFLktUR2P354KAkPB1y
	GYCQpXCgp66jn363FlQVFiOOAUZF+16DW90RnTq+bfHom9CzC50vEO9pUjzDr7nOtwSojanUNMs
	86EAzerj06CsY3ynj665T6vWitDnrZjmFiubXowL+F81aRY1BcEoRUnfSttHQGfQZs=
X-Google-Smtp-Source: AGHT+IE7kz/SpQzg4wdi9St2RsEfxZJ5FVHIUH7HW534eEOHeKIz8CJMVkyqd2cE1akYv/++6d/fEg==
X-Received: by 2002:a05:622a:1995:b0:471:8dc1:7d53 with SMTP id d75a77b69052e-471a065cbe6mr46248471cf.16.1739251102136;
        Mon, 10 Feb 2025 21:18:22 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-47153bc6c85sm55834441cf.53.2025.02.10.21.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 21:18:21 -0800 (PST)
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
Subject: [PATCH v2 2/8] pinctrl: sophgo: introduce generic data structure for cv18xx pinctrl driver
Date: Tue, 11 Feb 2025 13:17:50 +0800
Message-ID: <20250211051801.470800-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250211051801.470800-1-inochiama@gmail.com>
References: <20250211051801.470800-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

To share DT parsing and vddio code, it is necessary to introduce
some generic data structure to abstract the different cv18xx series
and the incoming sg2042 series.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/pinctrl/sophgo/pinctrl-cv1800b.c |  21 +-
 drivers/pinctrl/sophgo/pinctrl-cv1812h.c |  21 +-
 drivers/pinctrl/sophgo/pinctrl-cv18xx.c  | 243 ++++++++++++-----------
 drivers/pinctrl/sophgo/pinctrl-cv18xx.h  |  61 ++----
 drivers/pinctrl/sophgo/pinctrl-sg2000.c  |  21 +-
 drivers/pinctrl/sophgo/pinctrl-sg2002.c  |  21 +-
 drivers/pinctrl/sophgo/pinctrl-sophgo.h  |  66 ++++++
 7 files changed, 270 insertions(+), 184 deletions(-)
 create mode 100644 drivers/pinctrl/sophgo/pinctrl-sophgo.h

diff --git a/drivers/pinctrl/sophgo/pinctrl-cv1800b.c b/drivers/pinctrl/sophgo/pinctrl-cv1800b.c
index 3322906689e7..45529e2ed23a 100644
--- a/drivers/pinctrl/sophgo/pinctrl-cv1800b.c
+++ b/drivers/pinctrl/sophgo/pinctrl-cv1800b.c
@@ -34,8 +34,9 @@ static const char *const cv1800b_power_domain_desc[] = {
 	[VDDIO_SD0_SPI]			= "VDDIO_SD0_SPI",
 };
 
-static int cv1800b_get_pull_up(struct cv1800_pin *pin, const u32 *psmap)
+static int cv1800b_get_pull_up(const struct sophgo_pin *sp, const u32 *psmap)
 {
+	const struct cv1800_pin *pin = sophgo_to_cv1800_pin(sp);
 	u32 pstate = psmap[pin->power_domain];
 	enum cv1800_pin_io_type type = cv1800_pin_io_type(pin);
 
@@ -54,8 +55,9 @@ static int cv1800b_get_pull_up(struct cv1800_pin *pin, const u32 *psmap)
 	return -ENOTSUPP;
 }
 
-static int cv1800b_get_pull_down(struct cv1800_pin *pin, const u32 *psmap)
+static int cv1800b_get_pull_down(const struct sophgo_pin *sp, const u32 *psmap)
 {
+	const struct cv1800_pin *pin = sophgo_to_cv1800_pin(sp);
 	u32 pstate = psmap[pin->power_domain];
 	enum cv1800_pin_io_type type = cv1800_pin_io_type(pin);
 
@@ -108,9 +110,10 @@ static const u32 cv1800b_eth_oc_map[] = {
 	17800
 };
 
-static int cv1800b_get_oc_map(struct cv1800_pin *pin, const u32 *psmap,
+static int cv1800b_get_oc_map(const struct sophgo_pin *sp, const u32 *psmap,
 			      const u32 **map)
 {
+	const struct cv1800_pin *pin = sophgo_to_cv1800_pin(sp);
 	enum cv1800_pin_io_type type = cv1800_pin_io_type(pin);
 	u32 pstate = psmap[pin->power_domain];
 
@@ -153,9 +156,10 @@ static const u32 cv1800b_18od33_3v3_schmitt_map[] = {
 	1100000
 };
 
-static int cv1800b_get_schmitt_map(struct cv1800_pin *pin, const u32 *psmap,
+static int cv1800b_get_schmitt_map(const struct sophgo_pin *sp, const u32 *psmap,
 				   const u32 **map)
 {
+	const struct cv1800_pin *pin = sophgo_to_cv1800_pin(sp);
 	enum cv1800_pin_io_type type = cv1800_pin_io_type(pin);
 	u32 pstate = psmap[pin->power_domain];
 
@@ -177,11 +181,11 @@ static int cv1800b_get_schmitt_map(struct cv1800_pin *pin, const u32 *psmap,
 	return -ENOTSUPP;
 }
 
-static const struct cv1800_vddio_cfg_ops cv1800b_vddio_cfg_ops = {
+static const struct sophgo_vddio_cfg_ops cv1800b_vddio_cfg_ops = {
 	.get_pull_up		= cv1800b_get_pull_up,
 	.get_pull_down		= cv1800b_get_pull_down,
 	.get_oc_map		= cv1800b_get_oc_map,
-	.get_schmitt_map		= cv1800b_get_schmitt_map,
+	.get_schmitt_map	= cv1800b_get_schmitt_map,
 };
 
 static const struct pinctrl_pin_desc cv1800b_pins[] = {
@@ -433,13 +437,14 @@ static const struct cv1800_pin cv1800b_pin_data[ARRAY_SIZE(cv1800b_pins)] = {
 			CV1800_PINCONF_AREA_SYS, 0x120, 5),
 };
 
-static const struct cv1800_pinctrl_data cv1800b_pindata = {
+static const struct sophgo_pinctrl_data cv1800b_pindata = {
 	.pins		= cv1800b_pins,
 	.pindata	= cv1800b_pin_data,
 	.pdnames	= cv1800b_power_domain_desc,
 	.vddio_ops	= &cv1800b_vddio_cfg_ops,
 	.npins		= ARRAY_SIZE(cv1800b_pins),
-	.npd		= ARRAY_SIZE(cv1800b_power_domain_desc),
+	.npds		= ARRAY_SIZE(cv1800b_power_domain_desc),
+	.pinsize	= sizeof(struct cv1800_pin),
 };
 
 static const struct of_device_id cv1800b_pinctrl_ids[] = {
diff --git a/drivers/pinctrl/sophgo/pinctrl-cv1812h.c b/drivers/pinctrl/sophgo/pinctrl-cv1812h.c
index 5632290b46fa..4e30a1cc9d7d 100644
--- a/drivers/pinctrl/sophgo/pinctrl-cv1812h.c
+++ b/drivers/pinctrl/sophgo/pinctrl-cv1812h.c
@@ -40,8 +40,9 @@ static const char *const cv1812h_power_domain_desc[] = {
 	[VDDIO_VIVO]		= "VDDIO_VIVO",
 };
 
-static int cv1812h_get_pull_up(struct cv1800_pin *pin, const u32 *psmap)
+static int cv1812h_get_pull_up(const struct sophgo_pin *sp, const u32 *psmap)
 {
+	const struct cv1800_pin *pin = sophgo_to_cv1800_pin(sp);
 	u32 pstate = psmap[pin->power_domain];
 	enum cv1800_pin_io_type type = cv1800_pin_io_type(pin);
 
@@ -60,8 +61,9 @@ static int cv1812h_get_pull_up(struct cv1800_pin *pin, const u32 *psmap)
 	return -ENOTSUPP;
 }
 
-static int cv1812h_get_pull_down(struct cv1800_pin *pin, const u32 *psmap)
+static int cv1812h_get_pull_down(const struct sophgo_pin *sp, const u32 *psmap)
 {
+	const struct cv1800_pin *pin = sophgo_to_cv1800_pin(sp);
 	u32 pstate = psmap[pin->power_domain];
 	enum cv1800_pin_io_type type = cv1800_pin_io_type(pin);
 
@@ -114,9 +116,10 @@ static const u32 cv1812h_eth_oc_map[] = {
 	17800
 };
 
-static int cv1812h_get_oc_map(struct cv1800_pin *pin, const u32 *psmap,
+static int cv1812h_get_oc_map(const struct sophgo_pin *sp, const u32 *psmap,
 			      const u32 **map)
 {
+	const struct cv1800_pin *pin = sophgo_to_cv1800_pin(sp);
 	enum cv1800_pin_io_type type = cv1800_pin_io_type(pin);
 	u32 pstate = psmap[pin->power_domain];
 
@@ -159,9 +162,10 @@ static const u32 cv1812h_18od33_3v3_schmitt_map[] = {
 	1100000
 };
 
-static int cv1812h_get_schmitt_map(struct cv1800_pin *pin, const u32 *psmap,
+static int cv1812h_get_schmitt_map(const struct sophgo_pin *sp, const u32 *psmap,
 				   const u32 **map)
 {
+	const struct cv1800_pin *pin = sophgo_to_cv1800_pin(sp);
 	enum cv1800_pin_io_type type = cv1800_pin_io_type(pin);
 	u32 pstate = psmap[pin->power_domain];
 
@@ -183,11 +187,11 @@ static int cv1812h_get_schmitt_map(struct cv1800_pin *pin, const u32 *psmap,
 	return -ENOTSUPP;
 }
 
-static const struct cv1800_vddio_cfg_ops cv1812h_vddio_cfg_ops = {
+static const struct sophgo_vddio_cfg_ops cv1812h_vddio_cfg_ops = {
 	.get_pull_up		= cv1812h_get_pull_up,
 	.get_pull_down		= cv1812h_get_pull_down,
 	.get_oc_map		= cv1812h_get_oc_map,
-	.get_schmitt_map		= cv1812h_get_schmitt_map,
+	.get_schmitt_map	= cv1812h_get_schmitt_map,
 };
 
 static const struct pinctrl_pin_desc cv1812h_pins[] = {
@@ -742,13 +746,14 @@ static const struct cv1800_pin cv1812h_pin_data[ARRAY_SIZE(cv1812h_pins)] = {
 			   CV1800_PINCONF_AREA_RTC, 0x028),
 };
 
-static const struct cv1800_pinctrl_data cv1812h_pindata = {
+static const struct sophgo_pinctrl_data cv1812h_pindata = {
 	.pins		= cv1812h_pins,
 	.pindata	= cv1812h_pin_data,
 	.pdnames	= cv1812h_power_domain_desc,
 	.vddio_ops	= &cv1812h_vddio_cfg_ops,
 	.npins		= ARRAY_SIZE(cv1812h_pins),
-	.npd		= ARRAY_SIZE(cv1812h_power_domain_desc),
+	.npds		= ARRAY_SIZE(cv1812h_power_domain_desc),
+	.pinsize	= sizeof(struct cv1800_pin),
 };
 
 static const struct of_device_id cv1812h_pinctrl_ids[] = {
diff --git a/drivers/pinctrl/sophgo/pinctrl-cv18xx.c b/drivers/pinctrl/sophgo/pinctrl-cv18xx.c
index 84b4850771ce..573e00d2c752 100644
--- a/drivers/pinctrl/sophgo/pinctrl-cv18xx.c
+++ b/drivers/pinctrl/sophgo/pinctrl-cv18xx.c
@@ -24,30 +24,16 @@
 
 #include <dt-bindings/pinctrl/pinctrl-cv18xx.h>
 
-#include "../core.h"
 #include "../pinctrl-utils.h"
 #include "../pinconf.h"
 #include "../pinmux.h"
 #include "pinctrl-cv18xx.h"
 
-struct cv1800_pinctrl {
-	struct device				*dev;
-	struct pinctrl_dev			*pctl_dev;
-	const struct cv1800_pinctrl_data	*data;
-	struct pinctrl_desc			pdesc;
+struct cv1800_priv {
 	u32					*power_cfg;
-
-	struct mutex				mutex;
-	raw_spinlock_t				lock;
-
 	void __iomem				*regs[2];
 };
 
-struct cv1800_pin_mux_config {
-	struct cv1800_pin	*pin;
-	u32			config;
-};
-
 static unsigned int cv1800_dt_get_pin(u32 value)
 {
 	return value & GENMASK(15, 0);
@@ -68,38 +54,42 @@ static unsigned int cv1800_dt_get_pin_mux2(u32 value)
 
 static int cv1800_cmp_pin(const void *key, const void *pivot)
 {
-	const struct cv1800_pin *pin = pivot;
+	const struct sophgo_pin *pin = pivot;
 	int pin_id = (long)key;
-	int pivid = pin->pin;
+	int pivid = pin->id;
 
 	return pin_id - pivid;
 }
 
-static int cv1800_set_power_cfg(struct cv1800_pinctrl *pctrl,
+static int cv1800_set_power_cfg(struct sophgo_pinctrl *pctrl,
 				u8 domain, u32 cfg)
 {
-	if (domain >= pctrl->data->npd)
+	struct cv1800_priv *priv = pctrl->priv_ctrl;
+
+	if (domain >= pctrl->data->npds)
 		return -ENOTSUPP;
 
-	if (pctrl->power_cfg[domain] && pctrl->power_cfg[domain] != cfg)
+	if (priv->power_cfg[domain] && priv->power_cfg[domain] != cfg)
 		return -EINVAL;
 
-	pctrl->power_cfg[domain] = cfg;
+	priv->power_cfg[domain] = cfg;
 
 	return 0;
 }
 
-static int cv1800_get_power_cfg(struct cv1800_pinctrl *pctrl,
+static int cv1800_get_power_cfg(struct sophgo_pinctrl *pctrl,
 				u8 domain)
 {
-	return pctrl->power_cfg[domain];
+	struct cv1800_priv *priv = pctrl->priv_ctrl;
+
+	return priv->power_cfg[domain];
 }
 
-static struct cv1800_pin *cv1800_get_pin(struct cv1800_pinctrl *pctrl,
-					 unsigned long pin)
+static const struct sophgo_pin *cv1800_get_pin(struct sophgo_pinctrl *pctrl,
+					       unsigned long pin)
 {
 	return bsearch((void *)pin, pctrl->data->pindata, pctrl->data->npins,
-		       sizeof(struct cv1800_pin), cv1800_cmp_pin);
+		       pctrl->data->pinsize, cv1800_cmp_pin);
 }
 
 #define PIN_BGA_ID_OFFSET		8
@@ -112,7 +102,7 @@ static const char *const io_type_desc[] = {
 	"ETH"
 };
 
-static const char *cv1800_get_power_cfg_desc(struct cv1800_pinctrl *pctrl,
+static const char *cv1800_get_power_cfg_desc(struct sophgo_pinctrl *pctrl,
 					     u8 domain)
 {
 	return pctrl->data->pdnames[domain];
@@ -121,53 +111,57 @@ static const char *cv1800_get_power_cfg_desc(struct cv1800_pinctrl *pctrl,
 static void cv1800_pctrl_dbg_show(struct pinctrl_dev *pctldev,
 				  struct seq_file *seq, unsigned int pin_id)
 {
-	struct cv1800_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
-	struct cv1800_pin *pin = cv1800_get_pin(pctrl, pin_id);
+	struct sophgo_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+	struct cv1800_priv *priv = pctrl->priv_ctrl;
+	const struct sophgo_pin *sp = cv1800_get_pin(pctrl, pin_id);
+	const struct cv1800_pin *pin = sophgo_to_cv1800_pin(sp);
 	enum cv1800_pin_io_type type = cv1800_pin_io_type(pin);
+	u32 pin_hwid = pin->pin.id;
 	u32 value;
 	void __iomem *reg;
 
-	if (pin->pin >> PIN_BGA_ID_OFFSET)
+	if (pin_hwid >> PIN_BGA_ID_OFFSET)
 		seq_printf(seq, "pos: %c%u ",
-			   'A' + (pin->pin >> PIN_BGA_ID_OFFSET) - 1,
-			   pin->pin & PIN_BGA_ID_MASK);
+			   'A' + (pin_hwid >> PIN_BGA_ID_OFFSET) - 1,
+			   pin_hwid & PIN_BGA_ID_MASK);
 	else
-		seq_printf(seq, "pos: %u ", pin->pin);
+		seq_printf(seq, "pos: %u ", pin_hwid);
 
 	seq_printf(seq, "power-domain: %s ",
 		   cv1800_get_power_cfg_desc(pctrl, pin->power_domain));
 	seq_printf(seq, "type: %s ", io_type_desc[type]);
 
-	reg = cv1800_pinctrl_get_component_addr(pctrl, &pin->mux);
+	reg = cv1800_pinctrl_get_component_addr(priv, &pin->mux);
 	value = readl(reg);
 	seq_printf(seq, "mux: 0x%08x ", value);
 
-	if (pin->flags & CV1800_PIN_HAVE_MUX2) {
-		reg = cv1800_pinctrl_get_component_addr(pctrl, &pin->mux2);
+	if (pin->pin.flags & CV1800_PIN_HAVE_MUX2) {
+		reg = cv1800_pinctrl_get_component_addr(priv, &pin->mux2);
 		value = readl(reg);
 		seq_printf(seq, "mux2: 0x%08x ", value);
 	}
 
 	if (type == IO_TYPE_1V8_ONLY || type == IO_TYPE_1V8_OR_3V3) {
-		reg = cv1800_pinctrl_get_component_addr(pctrl, &pin->conf);
+		reg = cv1800_pinctrl_get_component_addr(priv, &pin->conf);
 		value = readl(reg);
 		seq_printf(seq, "conf: 0x%08x ", value);
 	}
 }
 
-static int cv1800_verify_pinmux_config(const struct cv1800_pin_mux_config *config)
+static int cv1800_verify_pinmux_config(const struct sophgo_pin_mux_config *config)
 {
+	struct cv1800_pin *pin = sophgo_to_cv1800_pin(config->pin);
 	unsigned int mux = cv1800_dt_get_pin_mux(config->config);
 	unsigned int mux2 = cv1800_dt_get_pin_mux2(config->config);
 
-	if (mux > config->pin->mux.max)
+	if (mux > pin->mux.max)
 		return -EINVAL;
 
-	if (config->pin->flags & CV1800_PIN_HAVE_MUX2) {
-		if (mux != config->pin->mux2.pfunc)
+	if (pin->pin.flags & CV1800_PIN_HAVE_MUX2) {
+		if (mux != pin->mux2.pfunc)
 			return -EINVAL;
 
-		if (mux2 > config->pin->mux2.max)
+		if (mux2 > pin->mux2.max)
 			return -EINVAL;
 	} else {
 		if (mux2 != PIN_MUX_INVALD)
@@ -177,9 +171,10 @@ static int cv1800_verify_pinmux_config(const struct cv1800_pin_mux_config *confi
 	return 0;
 }
 
-static int cv1800_verify_pin_group(const struct cv1800_pin_mux_config *mux,
+static int cv1800_verify_pin_group(const struct sophgo_pin_mux_config *mux,
 				   unsigned long npins)
 {
+	struct cv1800_pin *pin;
 	enum cv1800_pin_io_type type;
 	u8 power_domain;
 	int i;
@@ -187,12 +182,15 @@ static int cv1800_verify_pin_group(const struct cv1800_pin_mux_config *mux,
 	if (npins == 1)
 		return 0;
 
-	type = cv1800_pin_io_type(mux[0].pin);
-	power_domain = mux[0].pin->power_domain;
+	pin = sophgo_to_cv1800_pin(mux[0].pin);
+	type = cv1800_pin_io_type(pin);
+	power_domain = pin->power_domain;
 
 	for (i = 0; i < npins; i++) {
-		if (type != cv1800_pin_io_type(mux[i].pin) ||
-		    power_domain != mux[i].pin->power_domain)
+		pin = sophgo_to_cv1800_pin(mux[i].pin);
+
+		if (type != cv1800_pin_io_type(pin) ||
+		    power_domain != pin->power_domain)
 			return -ENOTSUPP;
 	}
 
@@ -204,7 +202,7 @@ static int cv1800_pctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 				       struct pinctrl_map **maps,
 				       unsigned int *num_maps)
 {
-	struct cv1800_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+	struct sophgo_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
 	struct device *dev = pctrl->dev;
 	struct device_node *child;
 	struct pinctrl_map *map;
@@ -230,7 +228,8 @@ static int cv1800_pctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 	for_each_available_child_of_node(np, child) {
 		int npins = of_property_count_u32_elems(child, "pinmux");
 		unsigned int *pins;
-		struct cv1800_pin_mux_config *pinmuxs;
+		struct sophgo_pin_mux_config *pinmuxs;
+		struct cv1800_pin *pin;
 		u32 config, power;
 		int i;
 
@@ -303,8 +302,8 @@ static int cv1800_pctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 			goto dt_failed;
 		}
 
-		ret = cv1800_set_power_cfg(pctrl, pinmuxs[0].pin->power_domain,
-					   power);
+		pin = sophgo_to_cv1800_pin(pinmuxs[0].pin);
+		ret = cv1800_set_power_cfg(pctrl, pin->power_domain, power);
 		if (ret)
 			goto dt_failed;
 
@@ -371,9 +370,10 @@ static const struct pinctrl_ops cv1800_pctrl_ops = {
 static int cv1800_pmx_set_mux(struct pinctrl_dev *pctldev,
 			      unsigned int fsel, unsigned int gsel)
 {
-	struct cv1800_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+	struct sophgo_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+	struct cv1800_priv *priv = pctrl->priv_ctrl;
 	const struct group_desc *group;
-	const struct cv1800_pin_mux_config *configs;
+	const struct sophgo_pin_mux_config *configs;
 	unsigned int i;
 
 	group = pinctrl_generic_get_group(pctldev, gsel);
@@ -383,7 +383,7 @@ static int cv1800_pmx_set_mux(struct pinctrl_dev *pctldev,
 	configs = group->data;
 
 	for (i = 0; i < group->grp.npins; i++) {
-		const struct cv1800_pin *pin = configs[i].pin;
+		const struct cv1800_pin *pin = sophgo_to_cv1800_pin(configs[i].pin);
 		u32 value = configs[i].config;
 		void __iomem *reg_mux;
 		void __iomem *reg_mux2;
@@ -391,8 +391,8 @@ static int cv1800_pmx_set_mux(struct pinctrl_dev *pctldev,
 		u32 mux;
 		u32 mux2;
 
-		reg_mux = cv1800_pinctrl_get_component_addr(pctrl, &pin->mux);
-		reg_mux2 = cv1800_pinctrl_get_component_addr(pctrl, &pin->mux2);
+		reg_mux = cv1800_pinctrl_get_component_addr(priv, &pin->mux);
+		reg_mux2 = cv1800_pinctrl_get_component_addr(priv, &pin->mux2);
 		mux = cv1800_dt_get_pin_mux(value);
 		mux2 = cv1800_dt_get_pin_mux2(value);
 
@@ -421,25 +421,28 @@ static const struct pinmux_ops cv1800_pmx_ops = {
 #define PIN_IO_BUS_HOLD		BIT(10)
 #define PIN_IO_OUT_FAST_SLEW	BIT(11)
 
-static u32 cv1800_pull_down_typical_resistor(struct cv1800_pinctrl *pctrl,
-					     struct cv1800_pin *pin)
+static u32 cv1800_pull_down_typical_resistor(struct sophgo_pinctrl *pctrl,
+					     const struct sophgo_pin *pin,
+					     const u32 *power_cfg)
 {
-	return pctrl->data->vddio_ops->get_pull_down(pin, pctrl->power_cfg);
+	return pctrl->data->vddio_ops->get_pull_down(pin, power_cfg);
 }
 
-static u32 cv1800_pull_up_typical_resistor(struct cv1800_pinctrl *pctrl,
-					   struct cv1800_pin *pin)
+static u32 cv1800_pull_up_typical_resistor(struct sophgo_pinctrl *pctrl,
+					   const struct sophgo_pin *pin,
+					   const u32 *power_cfg)
 {
-	return pctrl->data->vddio_ops->get_pull_up(pin, pctrl->power_cfg);
+	return pctrl->data->vddio_ops->get_pull_up(pin, power_cfg);
 }
 
-static int cv1800_pinctrl_oc2reg(struct cv1800_pinctrl *pctrl,
-				 struct cv1800_pin *pin, u32 target)
+static int cv1800_pinctrl_oc2reg(struct sophgo_pinctrl *pctrl,
+				 const struct sophgo_pin *pin,
+				 const u32 *power_cfg, u32 target)
 {
 	const u32 *map;
 	int i, len;
 
-	len = pctrl->data->vddio_ops->get_oc_map(pin, pctrl->power_cfg, &map);
+	len = pctrl->data->vddio_ops->get_oc_map(pin, power_cfg, &map);
 	if (len < 0)
 		return len;
 
@@ -451,13 +454,14 @@ static int cv1800_pinctrl_oc2reg(struct cv1800_pinctrl *pctrl,
 	return -EINVAL;
 }
 
-static int cv1800_pinctrl_reg2oc(struct cv1800_pinctrl *pctrl,
-				 struct cv1800_pin *pin, u32 reg)
+static int cv1800_pinctrl_reg2oc(struct sophgo_pinctrl *pctrl,
+				 const struct sophgo_pin *pin,
+				 const u32 *power_cfg, u32 reg)
 {
 	const u32 *map;
 	int len;
 
-	len = pctrl->data->vddio_ops->get_oc_map(pin, pctrl->power_cfg, &map);
+	len = pctrl->data->vddio_ops->get_oc_map(pin, power_cfg, &map);
 	if (len < 0)
 		return len;
 
@@ -467,14 +471,14 @@ static int cv1800_pinctrl_reg2oc(struct cv1800_pinctrl *pctrl,
 	return map[reg];
 }
 
-static int cv1800_pinctrl_schmitt2reg(struct cv1800_pinctrl *pctrl,
-				      struct cv1800_pin *pin, u32 target)
+static int cv1800_pinctrl_schmitt2reg(struct sophgo_pinctrl *pctrl,
+				      const struct sophgo_pin *pin,
+				      const u32 *power_cfg, u32 target)
 {
 	const u32 *map;
 	int i, len;
 
-	len = pctrl->data->vddio_ops->get_schmitt_map(pin, pctrl->power_cfg,
-						      &map);
+	len = pctrl->data->vddio_ops->get_schmitt_map(pin, power_cfg, &map);
 	if (len < 0)
 		return len;
 
@@ -486,14 +490,14 @@ static int cv1800_pinctrl_schmitt2reg(struct cv1800_pinctrl *pctrl,
 	return -EINVAL;
 }
 
-static int cv1800_pinctrl_reg2schmitt(struct cv1800_pinctrl *pctrl,
-				      struct cv1800_pin *pin, u32 reg)
+static int cv1800_pinctrl_reg2schmitt(struct sophgo_pinctrl *pctrl,
+				      const struct sophgo_pin *pin,
+				      const u32 *power_cfg, u32 reg)
 {
 	const u32 *map;
 	int len;
 
-	len = pctrl->data->vddio_ops->get_schmitt_map(pin, pctrl->power_cfg,
-						      &map);
+	len = pctrl->data->vddio_ops->get_schmitt_map(pin, power_cfg, &map);
 	if (len < 0)
 		return len;
 
@@ -506,9 +510,11 @@ static int cv1800_pinctrl_reg2schmitt(struct cv1800_pinctrl *pctrl,
 static int cv1800_pconf_get(struct pinctrl_dev *pctldev,
 			    unsigned int pin_id, unsigned long *config)
 {
-	struct cv1800_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+	struct sophgo_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+	struct cv1800_priv *priv = pctrl->priv_ctrl;
 	int param = pinconf_to_config_param(*config);
-	struct cv1800_pin *pin = cv1800_get_pin(pctrl, pin_id);
+	const struct sophgo_pin *sp = cv1800_get_pin(pctrl, pin_id);
+	const struct cv1800_pin *pin = sophgo_to_cv1800_pin(sp);
 	enum cv1800_pin_io_type type;
 	u32 value;
 	u32 arg;
@@ -522,28 +528,28 @@ static int cv1800_pconf_get(struct pinctrl_dev *pctldev,
 	if (type == IO_TYPE_ETH || type == IO_TYPE_AUDIO)
 		return -ENOTSUPP;
 
-	value = readl(cv1800_pinctrl_get_component_addr(pctrl, &pin->conf));
+	value = readl(cv1800_pinctrl_get_component_addr(priv, &pin->conf));
 
 	switch (param) {
 	case PIN_CONFIG_BIAS_PULL_DOWN:
 		enabled = FIELD_GET(PIN_IO_PULLDOWN, value);
-		arg = cv1800_pull_down_typical_resistor(pctrl, pin);
+		arg = cv1800_pull_down_typical_resistor(pctrl, sp, priv->power_cfg);
 		break;
 	case PIN_CONFIG_BIAS_PULL_UP:
 		enabled = FIELD_GET(PIN_IO_PULLUP, value);
-		arg = cv1800_pull_up_typical_resistor(pctrl, pin);
+		arg = cv1800_pull_up_typical_resistor(pctrl, sp, priv->power_cfg);
 		break;
 	case PIN_CONFIG_DRIVE_STRENGTH_UA:
 		enabled = true;
 		arg = FIELD_GET(PIN_IO_DRIVE, value);
-		ret = cv1800_pinctrl_reg2oc(pctrl, pin, arg);
+		ret = cv1800_pinctrl_reg2oc(pctrl, sp, priv->power_cfg, arg);
 		if (ret < 0)
 			return ret;
 		arg = ret;
 		break;
 	case PIN_CONFIG_INPUT_SCHMITT_UV:
 		arg = FIELD_GET(PIN_IO_SCHMITT, value);
-		ret = cv1800_pinctrl_reg2schmitt(pctrl, pin, arg);
+		ret = cv1800_pinctrl_reg2schmitt(pctrl, sp, priv->power_cfg, arg);
 		if (ret < 0)
 			return ret;
 		arg = ret;
@@ -570,12 +576,14 @@ static int cv1800_pconf_get(struct pinctrl_dev *pctldev,
 	return enabled ? 0 : -EINVAL;
 }
 
-static int cv1800_pinconf_compute_config(struct cv1800_pinctrl *pctrl,
-					 struct cv1800_pin *pin,
+static int cv1800_pinconf_compute_config(struct sophgo_pinctrl *pctrl,
+					 const struct sophgo_pin *sp,
 					 unsigned long *configs,
 					 unsigned int num_configs,
 					 u32 *value, u32 *mask)
 {
+	struct cv1800_priv *priv = pctrl->priv_ctrl;
+	const struct cv1800_pin *pin = sophgo_to_cv1800_pin(sp);
 	int i;
 	u32 v = 0, m = 0;
 	enum cv1800_pin_io_type type;
@@ -604,7 +612,8 @@ static int cv1800_pinconf_compute_config(struct cv1800_pinctrl *pctrl,
 			m |= PIN_IO_PULLUP;
 			break;
 		case PIN_CONFIG_DRIVE_STRENGTH_UA:
-			ret = cv1800_pinctrl_oc2reg(pctrl, pin, arg);
+			ret = cv1800_pinctrl_oc2reg(pctrl, sp,
+						    priv->power_cfg, arg);
 			if (ret < 0)
 				return ret;
 			v &= ~PIN_IO_DRIVE;
@@ -612,7 +621,8 @@ static int cv1800_pinconf_compute_config(struct cv1800_pinctrl *pctrl,
 			m |= PIN_IO_DRIVE;
 			break;
 		case PIN_CONFIG_INPUT_SCHMITT_UV:
-			ret = cv1800_pinctrl_schmitt2reg(pctrl, pin, arg);
+			ret = cv1800_pinctrl_schmitt2reg(pctrl, sp,
+							 priv->power_cfg, arg);
 			if (ret < 0)
 				return ret;
 			v &= ~PIN_IO_SCHMITT;
@@ -643,19 +653,22 @@ static int cv1800_pinconf_compute_config(struct cv1800_pinctrl *pctrl,
 	return 0;
 }
 
-static int cv1800_pin_set_config(struct cv1800_pinctrl *pctrl,
+static int cv1800_pin_set_config(struct sophgo_pinctrl *pctrl,
 				 unsigned int pin_id,
 				 u32 value, u32 mask)
 {
-	struct cv1800_pin *pin = cv1800_get_pin(pctrl, pin_id);
+	struct cv1800_priv *priv = pctrl->priv_ctrl;
+	const struct sophgo_pin *sp = cv1800_get_pin(pctrl, pin_id);
+	struct cv1800_pin *pin;
 	unsigned long flags;
 	void __iomem *addr;
 	u32 reg;
 
-	if (!pin)
+	if (!sp)
 		return -EINVAL;
+	pin = sophgo_to_cv1800_pin(sp);
 
-	addr = cv1800_pinctrl_get_component_addr(pctrl, &pin->conf);
+	addr = cv1800_pinctrl_get_component_addr(priv, &pin->conf);
 
 	raw_spin_lock_irqsave(&pctrl->lock, flags);
 	reg = readl(addr);
@@ -671,14 +684,14 @@ static int cv1800_pconf_set(struct pinctrl_dev *pctldev,
 			    unsigned int pin_id, unsigned long *configs,
 			    unsigned int num_configs)
 {
-	struct cv1800_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
-	struct cv1800_pin *pin = cv1800_get_pin(pctrl, pin_id);
+	struct sophgo_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+	const struct sophgo_pin *sp = cv1800_get_pin(pctrl, pin_id);
 	u32 value, mask;
 
-	if (!pin)
-		return -ENODEV;
+	if (!sp)
+		return -EINVAL;
 
-	if (cv1800_pinconf_compute_config(pctrl, pin,
+	if (cv1800_pinconf_compute_config(pctrl, sp,
 					  configs, num_configs,
 					  &value, &mask))
 		return -ENOTSUPP;
@@ -691,9 +704,9 @@ static int cv1800_pconf_group_set(struct pinctrl_dev *pctldev,
 				  unsigned long *configs,
 				  unsigned int num_configs)
 {
-	struct cv1800_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+	struct sophgo_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
 	const struct group_desc *group;
-	const struct cv1800_pin_mux_config *pinmuxs;
+	const struct sophgo_pin_mux_config *pinmuxs;
 	u32 value, mask;
 	int i;
 
@@ -724,33 +737,38 @@ static const struct pinconf_ops cv1800_pconf_ops = {
 int cv1800_pinctrl_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct cv1800_pinctrl *pctrl;
-	const struct cv1800_pinctrl_data *pctrl_data;
+	struct sophgo_pinctrl *pctrl;
+	struct cv1800_priv *priv;
+	const struct sophgo_pinctrl_data *pctrl_data;
 	int ret;
 
 	pctrl_data = device_get_match_data(dev);
 	if (!pctrl_data)
 		return -ENODEV;
 
-	if (pctrl_data->npins == 0 || pctrl_data->npd == 0)
+	if (pctrl_data->npins == 0 || pctrl_data->npds == 0)
 		return dev_err_probe(dev, -EINVAL, "invalid pin data\n");
 
 	pctrl = devm_kzalloc(dev, sizeof(*pctrl), GFP_KERNEL);
 	if (!pctrl)
 		return -ENOMEM;
 
-	pctrl->power_cfg = devm_kcalloc(dev, pctrl_data->npd,
-					sizeof(u32), GFP_KERNEL);
-	if (!pctrl->power_cfg)
+	priv = devm_kzalloc(dev, sizeof(struct cv1800_priv), GFP_KERNEL);
+	if (!priv)
 		return -ENOMEM;
 
-	pctrl->regs[0] = devm_platform_ioremap_resource_byname(pdev, "sys");
-	if (IS_ERR(pctrl->regs[0]))
-		return PTR_ERR(pctrl->regs[0]);
+	priv->power_cfg = devm_kcalloc(dev, pctrl_data->npds,
+				       sizeof(u32), GFP_KERNEL);
+	if (!priv->power_cfg)
+		return -ENOMEM;
+
+	priv->regs[0] = devm_platform_ioremap_resource_byname(pdev, "sys");
+	if (IS_ERR(priv->regs[0]))
+		return PTR_ERR(priv->regs[0]);
 
-	pctrl->regs[1] = devm_platform_ioremap_resource_byname(pdev, "rtc");
-	if (IS_ERR(pctrl->regs[1]))
-		return PTR_ERR(pctrl->regs[1]);
+	priv->regs[1] = devm_platform_ioremap_resource_byname(pdev, "rtc");
+	if (IS_ERR(priv->regs[1]))
+		return PTR_ERR(priv->regs[1]);
 
 	pctrl->pdesc.name = dev_name(dev);
 	pctrl->pdesc.pins = pctrl_data->pins;
@@ -761,6 +779,7 @@ int cv1800_pinctrl_probe(struct platform_device *pdev)
 	pctrl->pdesc.owner = THIS_MODULE;
 
 	pctrl->data = pctrl_data;
+	pctrl->priv_ctrl = priv;
 	pctrl->dev = dev;
 	raw_spin_lock_init(&pctrl->lock);
 	mutex_init(&pctrl->mutex);
@@ -768,11 +787,11 @@ int cv1800_pinctrl_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, pctrl);
 
 	ret = devm_pinctrl_register_and_init(dev, &pctrl->pdesc,
-					     pctrl, &pctrl->pctl_dev);
+					     pctrl, &pctrl->pctrl_dev);
 	if (ret)
 		return dev_err_probe(dev, ret,
 				     "fail to register pinctrl driver\n");
 
-	return pinctrl_enable(pctrl->pctl_dev);
+	return pinctrl_enable(pctrl->pctrl_dev);
 }
 EXPORT_SYMBOL_GPL(cv1800_pinctrl_probe);
diff --git a/drivers/pinctrl/sophgo/pinctrl-cv18xx.h b/drivers/pinctrl/sophgo/pinctrl-cv18xx.h
index 1a9998abb3b7..f095a6e85e52 100644
--- a/drivers/pinctrl/sophgo/pinctrl-cv18xx.h
+++ b/drivers/pinctrl/sophgo/pinctrl-cv18xx.h
@@ -8,13 +8,14 @@
 
 #include <linux/bits.h>
 #include <linux/bitfield.h>
-#include <linux/device.h>
 #include <linux/mutex.h>
 #include <linux/spinlock.h>
 #include <linux/platform_device.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinconf.h>
 
+#include "pinctrl-sophgo.h"
+
 enum cv1800_pin_io_type {
 	IO_TYPE_1V8_ONLY = 0,
 	IO_TYPE_1V8_OR_3V3 = 1,
@@ -49,48 +50,22 @@ struct cv1800_pinconf {
 #define CV1800_PIN_FLAG_IO_TYPE(type)		\
 	FIELD_PREP_CONST(CV1800_PIN_IO_TYPE, type)
 struct cv1800_pin {
-	u16				pin;
-	u16				flags;
+	struct sophgo_pin		pin;
 	u8				power_domain;
 	struct cv1800_pinmux		mux;
 	struct cv1800_pinmux2		mux2;
 	struct cv1800_pinconf		conf;
 };
 
+#define sophgo_to_cv1800_pin(_pin)		\
+	container_of((_pin), struct cv1800_pin, pin)
+
 #define PIN_POWER_STATE_1V8		1800
 #define PIN_POWER_STATE_3V3		3300
 
-/**
- * struct cv1800_vddio_cfg_ops - pin vddio operations
- *
- * @get_pull_up: get resistor for pull up;
- * @get_pull_down: get resistor for pull down.
- * @get_oc_map: get mapping for typical low level output current value to
- *	register value map.
- * @get_schmitt_map: get mapping for register value to typical schmitt
- *	threshold.
- */
-struct cv1800_vddio_cfg_ops {
-	int (*get_pull_up)(struct cv1800_pin *pin, const u32 *psmap);
-	int (*get_pull_down)(struct cv1800_pin *pin, const u32 *psmap);
-	int (*get_oc_map)(struct cv1800_pin *pin, const u32 *psmap,
-			  const u32 **map);
-	int (*get_schmitt_map)(struct cv1800_pin *pin, const u32 *psmap,
-			       const u32 **map);
-};
-
-struct cv1800_pinctrl_data {
-	const struct pinctrl_pin_desc		*pins;
-	const struct cv1800_pin			*pindata;
-	const char				* const *pdnames;
-	const struct cv1800_vddio_cfg_ops	*vddio_ops;
-	u16					npins;
-	u16					npd;
-};
-
-static inline enum cv1800_pin_io_type cv1800_pin_io_type(struct cv1800_pin *pin)
+static inline enum cv1800_pin_io_type cv1800_pin_io_type(const struct cv1800_pin *pin)
 {
-	return FIELD_GET(CV1800_PIN_IO_TYPE, pin->flags);
+	return FIELD_GET(CV1800_PIN_IO_TYPE, pin->pin.flags);
 };
 
 int cv1800_pinctrl_probe(struct platform_device *pdev);
@@ -98,9 +73,11 @@ int cv1800_pinctrl_probe(struct platform_device *pdev);
 #define CV1800_FUNC_PIN(_id, _power_domain, _type,			\
 			_mux_area, _mux_offset, _mux_func_max)		\
 	{								\
-		.pin = (_id),						\
+		.pin = {						\
+			.id = (_id),					\
+			.flags = CV1800_PIN_FLAG_IO_TYPE(_type),	\
+		},							\
 		.power_domain = (_power_domain),			\
-		.flags = CV1800_PIN_FLAG_IO_TYPE(_type),		\
 		.mux = {						\
 			.area = (_mux_area),				\
 			.offset = (_mux_offset),			\
@@ -112,9 +89,11 @@ int cv1800_pinctrl_probe(struct platform_device *pdev);
 			   _mux_area, _mux_offset, _mux_func_max,	\
 			   _conf_area, _conf_offset)			\
 	{								\
-		.pin = (_id),						\
+		.pin = {						\
+			.id = (_id),					\
+			.flags = CV1800_PIN_FLAG_IO_TYPE(_type),	\
+		},							\
 		.power_domain = (_power_domain),			\
-		.flags = CV1800_PIN_FLAG_IO_TYPE(_type),		\
 		.mux = {						\
 			.area = (_mux_area),				\
 			.offset = (_mux_offset),			\
@@ -132,10 +111,12 @@ int cv1800_pinctrl_probe(struct platform_device *pdev);
 				 _mux2_func_max,			\
 				 _conf_area, _conf_offset)		\
 	{								\
-		.pin = (_id),						\
+		.pin = {						\
+			.id = (_id),					\
+			.flags = CV1800_PIN_FLAG_IO_TYPE(_type) |	\
+				 CV1800_PIN_HAVE_MUX2,			\
+		},							\
 		.power_domain = (_power_domain),			\
-		.flags = CV1800_PIN_FLAG_IO_TYPE(_type) |		\
-				CV1800_PIN_HAVE_MUX2,			\
 		.mux = {						\
 			.area = (_mux_area),				\
 			.offset = (_mux_offset),			\
diff --git a/drivers/pinctrl/sophgo/pinctrl-sg2000.c b/drivers/pinctrl/sophgo/pinctrl-sg2000.c
index 63c05b4dd68f..a83dae233cdf 100644
--- a/drivers/pinctrl/sophgo/pinctrl-sg2000.c
+++ b/drivers/pinctrl/sophgo/pinctrl-sg2000.c
@@ -40,8 +40,9 @@ static const char *const sg2000_power_domain_desc[] = {
 	[VDDIO_VIVO]		= "VDDIO_VIVO",
 };
 
-static int sg2000_get_pull_up(struct cv1800_pin *pin, const u32 *psmap)
+static int sg2000_get_pull_up(const struct sophgo_pin *sp, const u32 *psmap)
 {
+	const struct cv1800_pin *pin = sophgo_to_cv1800_pin(sp);
 	u32 pstate = psmap[pin->power_domain];
 	enum cv1800_pin_io_type type = cv1800_pin_io_type(pin);
 
@@ -60,8 +61,9 @@ static int sg2000_get_pull_up(struct cv1800_pin *pin, const u32 *psmap)
 	return -ENOTSUPP;
 }
 
-static int sg2000_get_pull_down(struct cv1800_pin *pin, const u32 *psmap)
+static int sg2000_get_pull_down(const struct sophgo_pin *sp, const u32 *psmap)
 {
+	const struct cv1800_pin *pin = sophgo_to_cv1800_pin(sp);
 	u32 pstate = psmap[pin->power_domain];
 	enum cv1800_pin_io_type type = cv1800_pin_io_type(pin);
 
@@ -114,9 +116,10 @@ static const u32 sg2000_eth_oc_map[] = {
 	17800
 };
 
-static int sg2000_get_oc_map(struct cv1800_pin *pin, const u32 *psmap,
+static int sg2000_get_oc_map(const struct sophgo_pin *sp, const u32 *psmap,
 			     const u32 **map)
 {
+	const struct cv1800_pin *pin = sophgo_to_cv1800_pin(sp);
 	enum cv1800_pin_io_type type = cv1800_pin_io_type(pin);
 	u32 pstate = psmap[pin->power_domain];
 
@@ -159,9 +162,10 @@ static const u32 sg2000_18od33_3v3_schmitt_map[] = {
 	1100000
 };
 
-static int sg2000_get_schmitt_map(struct cv1800_pin *pin, const u32 *psmap,
+static int sg2000_get_schmitt_map(const struct sophgo_pin *sp, const u32 *psmap,
 				  const u32 **map)
 {
+	const struct cv1800_pin *pin = sophgo_to_cv1800_pin(sp);
 	enum cv1800_pin_io_type type = cv1800_pin_io_type(pin);
 	u32 pstate = psmap[pin->power_domain];
 
@@ -183,11 +187,11 @@ static int sg2000_get_schmitt_map(struct cv1800_pin *pin, const u32 *psmap,
 	return -ENOTSUPP;
 }
 
-static const struct cv1800_vddio_cfg_ops sg2000_vddio_cfg_ops = {
+static const struct sophgo_vddio_cfg_ops sg2000_vddio_cfg_ops = {
 	.get_pull_up		= sg2000_get_pull_up,
 	.get_pull_down		= sg2000_get_pull_down,
 	.get_oc_map		= sg2000_get_oc_map,
-	.get_schmitt_map		= sg2000_get_schmitt_map,
+	.get_schmitt_map	= sg2000_get_schmitt_map,
 };
 
 static const struct pinctrl_pin_desc sg2000_pins[] = {
@@ -742,13 +746,14 @@ static const struct cv1800_pin sg2000_pin_data[ARRAY_SIZE(sg2000_pins)] = {
 			   CV1800_PINCONF_AREA_RTC, 0x028),
 };
 
-static const struct cv1800_pinctrl_data sg2000_pindata = {
+static const struct sophgo_pinctrl_data sg2000_pindata = {
 	.pins		= sg2000_pins,
 	.pindata	= sg2000_pin_data,
 	.pdnames	= sg2000_power_domain_desc,
 	.vddio_ops	= &sg2000_vddio_cfg_ops,
 	.npins		= ARRAY_SIZE(sg2000_pins),
-	.npd		= ARRAY_SIZE(sg2000_power_domain_desc),
+	.npds		= ARRAY_SIZE(sg2000_power_domain_desc),
+	.pinsize	= sizeof(struct cv1800_pin),
 };
 
 static const struct of_device_id sg2000_pinctrl_ids[] = {
diff --git a/drivers/pinctrl/sophgo/pinctrl-sg2002.c b/drivers/pinctrl/sophgo/pinctrl-sg2002.c
index 5c49208dcb59..4366486d8b7f 100644
--- a/drivers/pinctrl/sophgo/pinctrl-sg2002.c
+++ b/drivers/pinctrl/sophgo/pinctrl-sg2002.c
@@ -34,8 +34,9 @@ static const char *const sg2002_power_domain_desc[] = {
 	[VDDIO_SD1]		= "VDDIO_SD1",
 };
 
-static int sg2002_get_pull_up(struct cv1800_pin *pin, const u32 *psmap)
+static int sg2002_get_pull_up(const struct sophgo_pin *sp, const u32 *psmap)
 {
+	const struct cv1800_pin *pin = sophgo_to_cv1800_pin(sp);
 	u32 pstate = psmap[pin->power_domain];
 	enum cv1800_pin_io_type type = cv1800_pin_io_type(pin);
 
@@ -54,8 +55,9 @@ static int sg2002_get_pull_up(struct cv1800_pin *pin, const u32 *psmap)
 	return -ENOTSUPP;
 }
 
-static int sg2002_get_pull_down(struct cv1800_pin *pin, const u32 *psmap)
+static int sg2002_get_pull_down(const struct sophgo_pin *sp, const u32 *psmap)
 {
+	const struct cv1800_pin *pin = sophgo_to_cv1800_pin(sp);
 	u32 pstate = psmap[pin->power_domain];
 	enum cv1800_pin_io_type type = cv1800_pin_io_type(pin);
 
@@ -108,9 +110,10 @@ static const u32 sg2002_eth_oc_map[] = {
 	17800
 };
 
-static int sg2002_get_oc_map(struct cv1800_pin *pin, const u32 *psmap,
+static int sg2002_get_oc_map(const struct sophgo_pin *sp, const u32 *psmap,
 			     const u32 **map)
 {
+	const struct cv1800_pin *pin = sophgo_to_cv1800_pin(sp);
 	enum cv1800_pin_io_type type = cv1800_pin_io_type(pin);
 	u32 pstate = psmap[pin->power_domain];
 
@@ -153,9 +156,10 @@ static const u32 sg2002_18od33_3v3_schmitt_map[] = {
 	1100000
 };
 
-static int sg2002_get_schmitt_map(struct cv1800_pin *pin, const u32 *psmap,
+static int sg2002_get_schmitt_map(const struct sophgo_pin *sp, const u32 *psmap,
 				  const u32 **map)
 {
+	const struct cv1800_pin *pin = sophgo_to_cv1800_pin(sp);
 	enum cv1800_pin_io_type type = cv1800_pin_io_type(pin);
 	u32 pstate = psmap[pin->power_domain];
 
@@ -177,11 +181,11 @@ static int sg2002_get_schmitt_map(struct cv1800_pin *pin, const u32 *psmap,
 	return -ENOTSUPP;
 }
 
-static const struct cv1800_vddio_cfg_ops sg2002_vddio_cfg_ops = {
+static const struct sophgo_vddio_cfg_ops sg2002_vddio_cfg_ops = {
 	.get_pull_up		= sg2002_get_pull_up,
 	.get_pull_down		= sg2002_get_pull_down,
 	.get_oc_map		= sg2002_get_oc_map,
-	.get_schmitt_map		= sg2002_get_schmitt_map,
+	.get_schmitt_map	= sg2002_get_schmitt_map,
 };
 
 static const struct pinctrl_pin_desc sg2002_pins[] = {
@@ -513,13 +517,14 @@ static const struct cv1800_pin sg2002_pin_data[ARRAY_SIZE(sg2002_pins)] = {
 			   CV1800_PINCONF_AREA_SYS, 0xc84),
 };
 
-static const struct cv1800_pinctrl_data sg2002_pindata = {
+static const struct sophgo_pinctrl_data sg2002_pindata = {
 	.pins		= sg2002_pins,
 	.pindata	= sg2002_pin_data,
 	.pdnames	= sg2002_power_domain_desc,
 	.vddio_ops	= &sg2002_vddio_cfg_ops,
 	.npins		= ARRAY_SIZE(sg2002_pins),
-	.npd		= ARRAY_SIZE(sg2002_power_domain_desc),
+	.npds		= ARRAY_SIZE(sg2002_power_domain_desc),
+	.pinsize	= sizeof(struct cv1800_pin),
 };
 
 static const struct of_device_id sg2002_pinctrl_ids[] = {
diff --git a/drivers/pinctrl/sophgo/pinctrl-sophgo.h b/drivers/pinctrl/sophgo/pinctrl-sophgo.h
new file mode 100644
index 000000000000..e43b4f30f18a
--- /dev/null
+++ b/drivers/pinctrl/sophgo/pinctrl-sophgo.h
@@ -0,0 +1,66 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2024 Inochi Amaoto <inochiama@outlook.com>
+ */
+
+#ifndef _PINCTRL_SOPHGO_H
+#define _PINCTRL_SOPHGO_H
+
+#include <linux/device.h>
+#include <linux/mutex.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/spinlock.h>
+
+#include "../core.h"
+
+struct sophgo_pin {
+	u16				id;
+	u16				flags;
+};
+
+struct sophgo_pin_mux_config {
+	const struct sophgo_pin	*pin;
+	u32			config;
+};
+
+/**
+ * struct sophgo_vddio_cfg_ops - pin vddio operations
+ *
+ * @get_pull_up: get resistor for pull up;
+ * @get_pull_down: get resistor for pull down.
+ * @get_oc_map: get mapping for typical low level output current value to
+ *	register value map.
+ * @get_schmitt_map: get mapping for register value to typical schmitt
+ *	threshold.
+ */
+struct sophgo_vddio_cfg_ops {
+	int (*get_pull_up)(const struct sophgo_pin *pin, const u32 *psmap);
+	int (*get_pull_down)(const struct sophgo_pin *pin, const u32 *psmap);
+	int (*get_oc_map)(const struct sophgo_pin *pin, const u32 *psmap,
+			  const u32 **map);
+	int (*get_schmitt_map)(const struct sophgo_pin *pin, const u32 *psmap,
+			       const u32 **map);
+};
+
+struct sophgo_pinctrl_data {
+	const struct pinctrl_pin_desc		*pins;
+	const void				*pindata;
+	const char				* const *pdnames;
+	const struct sophgo_vddio_cfg_ops	*vddio_ops;
+	u16					npins;
+	u16					npds;
+	u16					pinsize;
+};
+
+struct sophgo_pinctrl {
+	struct device				*dev;
+	struct pinctrl_dev			*pctrl_dev;
+	const struct sophgo_pinctrl_data	*data;
+	struct pinctrl_desc			pdesc;
+
+	struct mutex				mutex;
+	raw_spinlock_t				lock;
+	void					*priv_ctrl;
+};
+
+#endif /* _PINCTRL_SOPHGO_H */
-- 
2.48.1


