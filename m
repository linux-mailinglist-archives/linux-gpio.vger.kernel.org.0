Return-Path: <linux-gpio+bounces-24428-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4A6B27CAC
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Aug 2025 11:18:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2050E622FBE
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Aug 2025 09:13:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FD9C2E92D7;
	Fri, 15 Aug 2025 09:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="VI81Es2y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D48261585
	for <linux-gpio@vger.kernel.org>; Fri, 15 Aug 2025 09:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755248983; cv=none; b=u3vAKA+AcLNsKSu91SgWYemWMql8J5UVmHTMCL0CSYQ270eCMX35PBG8tC3c39r2uomL6qPTB3AE7x0KJlN/j5YDw2S9czKKy1eCv3Kti7WBno0PRJ2ly9qhgO0vZpjnp6B2p69Wq/HvZ6AgLb2FPGolAj28DTItlchGkRpPnZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755248983; c=relaxed/simple;
	bh=rk9E4FadWXaWSn3i2mupMAUwJWtQsYbvjLZhJrLTmRM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q7nnGC+oxuGzbUv/3k/3x9nH9dZLc1zA1rOogHmxTvublIwUFSkSpeGUft6BDxgzjX2EPqjLJIpBYbqOehtS43xE4xw1oXsAUb47MKCby/ZxrmRc7yyjfkuQGvjrHZVAqYL5BWH9kMC4bDbkligC28RpZ+oHmgY91+oRGfpKxtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=VI81Es2y; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3b9dc52c430so899544f8f.0
        for <linux-gpio@vger.kernel.org>; Fri, 15 Aug 2025 02:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755248973; x=1755853773; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wUmSb9m7Wb2TMLn6U2R44kzyxWVCmDVSA6WZ95LWBOs=;
        b=VI81Es2y+bmNFTQ5A0pa6V5EkXBrXZSkrA8JDogRQGJxL+vxULXGOMY7wCJCjE67A/
         fuJXdwvSgvh8g7ZdL3rI3rPkKcANBklR0FvPHWZq0/gqDHc6fJHNnFlb85w1ZW94M/Xk
         Z2Jn0n2xut9QZ+//t8AziudOsChpQHpf+C2r90I0S/Yak5SN6DWeaoO10h82W1iNFoOC
         olVJRdAcnTYfeI8xwZeUHb+SNFE90u1kdGGD9FP5nW16qCO1fiSIJnwfJMC320xTiwFP
         h7fUAgHMKyQHjyeIKdwLpwFS7ZUQntHsE2EuBxme8yKxPxTVtegKasR5TaPtzbMIlbwt
         zd0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755248973; x=1755853773;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wUmSb9m7Wb2TMLn6U2R44kzyxWVCmDVSA6WZ95LWBOs=;
        b=EiD24zwGIvTrHY9TtAbIB/l39Bvlvzk0nVbWAswzvXgR49TZRgJw0pMEqZwHlOvMWd
         KAMht7ZezfMZlEZVh6xrm7Cm4o8mw7+Ks9Vi0KauAL2+UlybVkvWWjt3JV6dK/IRglFk
         1YX03lGKfTYWOPY1guO00yu6rMFwHyOuGAaWKvFinL/pVgiK16vT/sU2OA8RJCNfpY2+
         z/IiwVrzhi3nR9vTIQd7HuGYh4365NfzCSSxETYIOrkPn8eVzrgpeFmovKt/ymxfYWAw
         0JtIpF8wPs5e5fqGUl9LEEOaQqcd/3X2U4kBMgKKk6X/AFlyCpGEVhk89JSOBRLRReBB
         KkDA==
X-Gm-Message-State: AOJu0YwY33bwuknrYUxnhgZD3cXjd0W7gAlhZOKxbD2ozunU7PzUDvIt
	gTxE2krvWXh4ZWiQuVas/4ZHr0jK2d3cdRtmUeXaey/g5Vu0i3iF0MGR55Kf0hQu+BM=
X-Gm-Gg: ASbGncse8llN/7piD/qUA1uQjmZWM1vyuXYoZIuqS2dpFJZCXwkwg0m3IFLuP4O2XRF
	/buh6ibNxeUqkoUcP5a1GB9WcBDNRIdHHosRky4A6UnuGa2DOPtmOuboOOkw2GgS0R3ldQxw4Cu
	8l4+sjnpixhlU+yWBMFIRa34txjJVmpow71IiJG7KwCURf3GK5H1ZC+U1EVLOiLiYpgUcJIDDp4
	44ad6gkkyZtEGRh+oIEZhl5RV/iNn3ehWNipVxnGmbi09+ugD2dEx4+r64MDpbtc+CxcLATK6ON
	ruPtFw4UbvAisJSDFPs7lUv5742zS7eny3XTqQRGmmvR2GA/vWr8vYLMwB+c3y+3Ooo23IWg3Jw
	LufziPbjY+/2apBGVgA==
X-Google-Smtp-Source: AGHT+IEsfSWYzEm27/6hYdWM/oDoGohRgnAYiUKPUf3nioDnbrFIrjHT15QbOHRBbroPOGJoJGn1cw==
X-Received: by 2002:a5d:5d07:0:b0:3b7:9c28:f846 with SMTP id ffacd0b85a97d-3bb68fdd74dmr1040326f8f.44.1755248972964;
        Fri, 15 Aug 2025 02:09:32 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:a125:bd3e:6904:c9f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb676c9a67sm1205210f8f.35.2025.08.15.02.09.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 02:09:32 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 15 Aug 2025 11:09:12 +0200
Subject: [PATCH v5 10/15] pinctrl: make struct pinfunction a pointer in
 struct function_desc
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250815-pinctrl-gpio-pinfuncs-v5-10-955de9fd91db@linaro.org>
References: <20250815-pinctrl-gpio-pinfuncs-v5-0-955de9fd91db@linaro.org>
In-Reply-To: <20250815-pinctrl-gpio-pinfuncs-v5-0-955de9fd91db@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>, 
 Andy Shevchenko <andy@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@redhat.com>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 NXP S32 Linux Team <s32@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Tony Lindgren <tony@atomide.com>, 
 Haojian Zhuang <haojian.zhuang@linaro.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
 linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5244;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Zm7l0P8J/4Yr+ba9yWziUENeNgwa5VJWf6fQSuqhMVo=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBonvk4VNy+wECbWRHhJLf/n6KmM7k5pMTn+IjYl
 fACs+Y2sDqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJ75OAAKCRARpy6gFHHX
 clftEACGI8JVw0+vCqaEtPg8fs5gEye52amqNQ+hqsElotQX4ILlanV/h5UlgtnQXD3SlgDRZXG
 R0ZOxm67YO3xopC0fuXZCActBpEsfw90Im9j7Qfs49iLYZBfhGOmDMQ98UhyTgFj8dn41/hJFTg
 l/GxFa2m2JMeO/w9b4WcGOIqSyrH7YnS2WKF/Jn59zQEL5KyK2ABHvJtGkXGA60p7hLWR9OypY7
 N1vuOde0ZUENG4v9pvrF8pOGJgPkFMPUIXVLldJzBNddhq/oeUIVxQ95Ai7XpFJI8hL72/lDhet
 Ukev4jy2tdjT8P0iokwmmmmqWc2DwdZVS3L0r0XiFmpuNkBzMw4kN/MX8r7h3SwzCQIqcwm+Wq9
 u9XZlYInmGVv8uutXQXAcpfeoAwGX/Z/0TSXXfv3PqBv1OrLhjh5A76+2LP9DDIXQ5f6GbOZSfT
 yBmkcQ55JR3el5kmh6ERA+hNavWreMdGMPlKJz22TveXpEYYNewYTdmEj3UgU9umx/oSNJTc0td
 QsK9hPDHN2Hsy7XOIE3itRPQmpSAsmvqqLtTkPddAw9hDZHGYOIlHrMKGwJ2tRxPXZfx5aW61gb
 K4FYxpa0tFpMifiwQ+/QjF1/DMevhoHp5QxpD6M1fdZCkdqz0ytRi2NPfUIydhyefTZ+vMGzVFf
 vtagIeUSAxzJviQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We currently duplicate the entire struct pinfunction object in
pinmux_generic_add_pinfunction(). While this is inevitable when the
arguments come in split through pinmux_generic_add_function(), users of
pinmux_generic_add_pinfunction() will typically pass addresses of
structures in .rodata, meaning we can try to avoid the duplication with
the help from kmemdup_const(). To that end: don't wrap the entire struct
pinfunction in struct function_desc but rather just store the address.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/freescale/pinctrl-imx.c   |  2 +-
 drivers/pinctrl/mediatek/pinctrl-airoha.c |  2 +-
 drivers/pinctrl/mediatek/pinctrl-moore.c  |  2 +-
 drivers/pinctrl/pinctrl-ingenic.c         |  2 +-
 drivers/pinctrl/pinmux.c                  | 18 ++++++++++++++----
 drivers/pinctrl/pinmux.h                  |  2 +-
 6 files changed, 19 insertions(+), 9 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index 9ed84479a5b43871861f46fe1326f1dfadc7f63c..0df7eba8ccd3209fbc4b2e67ffdea12b77b90858 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -266,7 +266,7 @@ static int imx_pmx_set(struct pinctrl_dev *pctldev, unsigned selector,
 	npins = grp->grp.npins;
 
 	dev_dbg(ipctl->dev, "enable function %s group %s\n",
-		func->func.name, grp->grp.name);
+		func->func->name, grp->grp.name);
 
 	for (i = 0; i < npins; i++) {
 		/*
diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
index 2eed83f9f209cad79580082c274d4056231bd421..8fb3b65a1b775cf078d3c926af59480e9e09ab30 100644
--- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
+++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
@@ -2456,7 +2456,7 @@ static int airoha_pinmux_set_mux(struct pinctrl_dev *pctrl_dev,
 		return -EINVAL;
 
 	dev_dbg(pctrl_dev->dev, "enable function %s group %s\n",
-		desc->func.name, grp->grp.name);
+		desc->func->name, grp->grp.name);
 
 	func = desc->data;
 	for (i = 0; i < func->group_size; i++) {
diff --git a/drivers/pinctrl/mediatek/pinctrl-moore.c b/drivers/pinctrl/mediatek/pinctrl-moore.c
index 17a08c73423fd089066e4894d2307c852bbbb661..11dc525eb3a2dc8ceabf2278ee1a2abaa425eec1 100644
--- a/drivers/pinctrl/mediatek/pinctrl-moore.c
+++ b/drivers/pinctrl/mediatek/pinctrl-moore.c
@@ -56,7 +56,7 @@ static int mtk_pinmux_set_mux(struct pinctrl_dev *pctldev,
 		return -EINVAL;
 
 	dev_dbg(pctldev->dev, "enable function %s group %s\n",
-		func->func.name, grp->grp.name);
+		func->func->name, grp->grp.name);
 
 	for (i = 0; i < grp->grp.npins; i++) {
 		const struct mtk_pin_desc *desc;
diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index e13ef07850386e70cffc83011589ceaf70a70a41..e5b24fab12e11e443df25ffeb7b70d7c1a03c6bc 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -4015,7 +4015,7 @@ static int ingenic_pinmux_set_mux(struct pinctrl_dev *pctldev,
 		return -EINVAL;
 
 	dev_dbg(pctldev->dev, "enable function %s group %s\n",
-		func->func.name, grp->grp.name);
+		func->func->name, grp->grp.name);
 
 	mode = (uintptr_t)grp->data;
 	if (mode <= 3) {
diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index 62bd4aa53b2b22cb09eacfb05398205f2fe391b9..6f5e3ede972bbfa78e279790df359632e2d63485 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -810,7 +810,7 @@ pinmux_generic_get_function_name(struct pinctrl_dev *pctldev,
 	if (!function)
 		return NULL;
 
-	return function->func.name;
+	return function->func->name;
 }
 EXPORT_SYMBOL_GPL(pinmux_generic_get_function_name);
 
@@ -835,8 +835,8 @@ int pinmux_generic_get_function_groups(struct pinctrl_dev *pctldev,
 			__func__, selector);
 		return -EINVAL;
 	}
-	*groups = function->func.groups;
-	*ngroups = function->func.ngroups;
+	*groups = function->func->groups;
+	*ngroups = function->func->ngroups;
 
 	return 0;
 }
@@ -903,7 +903,17 @@ int pinmux_generic_add_pinfunction(struct pinctrl_dev *pctldev,
 	if (!function)
 		return -ENOMEM;
 
-	function->func = *func;
+	/*
+	 * FIXME: It's generally a bad idea to use devres in subsystem core
+	 * code - managed interfaces are aimed at drivers - but pinctrl already
+	 * uses it all over the place so it's a larger piece of technical debt
+	 * to fix.
+	 */
+	function->func = devm_kmemdup_const(pctldev->dev, func,
+					    sizeof(*func), GFP_KERNEL);
+	if (!function->func)
+		return -ENOMEM;
+
 	function->data = data;
 
 	error = radix_tree_insert(&pctldev->pin_function_tree, selector, function);
diff --git a/drivers/pinctrl/pinmux.h b/drivers/pinctrl/pinmux.h
index 549ab10f7afbda32fadf4ad151401180bed2064f..653684290666d78fd725febb5f8bc987b66a1afb 100644
--- a/drivers/pinctrl/pinmux.h
+++ b/drivers/pinctrl/pinmux.h
@@ -137,7 +137,7 @@ static inline void pinmux_init_device_debugfs(struct dentry *devroot,
  * @data: pin controller driver specific data
  */
 struct function_desc {
-	struct pinfunction func;
+	const struct pinfunction *func;
 	void *data;
 };
 

-- 
2.48.1


