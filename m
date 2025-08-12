Return-Path: <linux-gpio+bounces-24241-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A29B220DE
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 10:29:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 272371B61AFE
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 08:29:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 748032E7633;
	Tue, 12 Aug 2025 08:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="rLiYTdys"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13BE72E6139
	for <linux-gpio@vger.kernel.org>; Tue, 12 Aug 2025 08:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754987249; cv=none; b=BSsHaR180mTAU3FXJl8zAUtzArAAKLhOVXSp/65S7P+CbygLD4YRYd/35pf7vj2qXf18UhsWX62zb04WtgN/s6VRttUMhP6fguA1pGST0hyzJRmRnpljpYRAyRLlV0OEzIrqM2hsUfdXsbzFg85dSjEUO3VDcufrJ09CGR4xRyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754987249; c=relaxed/simple;
	bh=oVtkZooniDAZ/zp3pp2Z7TEDxZG2RGAqbxcNXmmWQv4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=myRcXLK5W0f49DlXxRZ5PmAu5AvP5bSSKPzlImM8QlzqlV6qJu9P8NnBciiQoZNYuGCb3T3+C2E4gC98chlYzqN4Z01rRf0aLo1vVIpv37z08s2BcncKZJvGwKft+5iiUgKz7xU2M8hKBkuhTRqbcUHioWW6Z7svc2Kg0Da0GSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=rLiYTdys; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-459d62184c9so30571885e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 12 Aug 2025 01:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754987244; x=1755592044; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IDUOUuYpI76iOVUogWQ/IDvtAHASSKUzmCarU5crSms=;
        b=rLiYTdysYBEPkNcRH0sgkZVVUVOWdB1yBLmzlTBVZPn14V0OkDjb8jseD5xfqp0Gw7
         z2HVFedvxLkxiXouOdxdJsmb+kASqrCr8X7yPIx4eMSDakZZvWt6qrTqXqHGiXH0+p34
         oIKp/4r1pzOK2x8dZB89hcQLtUYr+bqOwiUdao7nYJIF9A/W53vF3dFSkYDz62FrojhE
         Tyk2WXtuySEp12IjcJcDjFwmmoxQyofPpWXSKt1cwy+a66+YcjVMaC+0A4vmnQRGcrAv
         fkHNBi7nkdSG01o9wWsKNlwOLRr375zy7IHISe3W/8Hac93dPsoKJTXu7WP+Qc3FihAT
         UeKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754987244; x=1755592044;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IDUOUuYpI76iOVUogWQ/IDvtAHASSKUzmCarU5crSms=;
        b=S6s6g+FbPtlcijhg2ik28VYfcnC5364HVWQQHIBguJ1pRmKAf+MR+UjchsyJ7oMGAX
         jPhdZnTrMykaB8M/yvzWXtVPu2XrAjbI4xmIiSqbwXC1ad3VnzkNYtRf9tElyXiglUBr
         jkvn4mKiVB3k3NcCNit/in0PTZfO2c5H0fCIULsQqGk7jrIO3MADe6fbX1T5B4XdBzGb
         A1v8vT1r8xKjdUIlhWyZfrqSOrUHW4jDY1SXQODVT+n6YJ39to8DTjfvBZUFQxr5J5bS
         E04xK6aehikdGvsBF4hASXQIdZo/IYCk+Cx0+rD+ouXByRxSv9LOtEc6g6zBJi+Co46b
         U2NA==
X-Gm-Message-State: AOJu0YxKDWR3cEK0lYgzPzeak+eWqfZx2outr8W83hTlhqkxN2Jmk1xt
	OJuHZ09Ul0wHFEI3B6MfkN3qf/aNdggQ2+RBVWDLQBXlCDdh2Bsc54cYUK74kWAVjO4=
X-Gm-Gg: ASbGncvaviUpkDTURmCLgNp1v8labtF07xfTxHu2uCjykh8ORpueczaDKPq6VVmK8wv
	XCPLTK+XgFM+P32ZXGcASp5j0cPnXX8VE7wjZyetm2Fr1G7O4D0bC3yBJKe+MyjEP0LQFq4p1Eu
	w5nFS47Pkjas4dV+VDN0LV3Y3M9oUq0DQcSrS7u0NbRhBWyCF5Fhek7O0gZSrPdMEZUMbfxg+qc
	dPK79yez/ci8O+l+md9qCMEmoOAqIKNmvOPXubCiQYBGB1e9dnCwIO/k4sz7JkHggSKHSz7YJYn
	SlKQFPmawoWKc39bTmSjA5vOwd5V46EZD/UMiQX4+Ot9C2miKANESs6tuMAx4gu82KZFE4jj//d
	TvPvmO5AFlgTUS90=
X-Google-Smtp-Source: AGHT+IEH0JxbXQ5+J2wfU2NJF1bGQPqex/0eJGKJqDW0LZU/RxFA+yyFi8vGdnIyOPGv/hEK3U8ySg==
X-Received: by 2002:a05:600c:1f8e:b0:459:e35e:a90d with SMTP id 5b1f17b1804b1-45a10c06786mr19912515e9.27.1754987243736;
        Tue, 12 Aug 2025 01:27:23 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:16c8:50:27fe:4d94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3b9386sm43549423f8f.18.2025.08.12.01.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 01:27:23 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Aug 2025 10:27:08 +0200
Subject: [PATCH v4 09/15] pinctrl: constify pinmux_generic_get_function()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-pinctrl-gpio-pinfuncs-v4-9-bb3906c55e64@linaro.org>
References: <20250812-pinctrl-gpio-pinfuncs-v4-0-bb3906c55e64@linaro.org>
In-Reply-To: <20250812-pinctrl-gpio-pinfuncs-v4-0-bb3906c55e64@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=9697;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=mUGhvFEd/o0H3Ei3zmVvmjlu+B7qT/I3GR1QZlTr8uw=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomvrYu4D+vFh+Czmvxoqz3WG+dyHkxejkwnS3s
 ny31IbhSO+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJr62AAKCRARpy6gFHHX
 cik4D/9DC2W3IihPzcJB6UwDGtK22p+KLEHaeV1gP1a7shVgvtPPZNr5KjwVyNWsmx/glUQ0utm
 zXMIb465kspzrKyJ/r1skyJpkZBrInf0bkmDHEWd48nL4HZ2x3BFO859rHn+zbs2wFEyXkc1yR2
 UYPOf3Dg3nu4uaQ5qu2a2EPt/NoHvCWsimCANj3Txt0Bk2OQl0io5nm804xGKdA6l9m/F8167fE
 WcntFBnMX5c0XQVdgUpy3FMvB/J1gXjRa8aiqtXu+l/MI1+mhAHUdugb5ZgjhxTU0mmUfWKOFEF
 79jGO14D1N8sLd5VekbKXjNS3cr1Y1u6eVCrlxJGl0znKDzclKzOE4KIybSDf85BRU6+3838wAi
 vRxQHhuDY870rax34tE8+Dcf9xosjuYOcMoQyC0G0jw8l/fifL16/nuT/YRbrInv7sb+I1HF8h2
 zeLDFFX1ztkYpBtf+r+e/Q2d/EZ+S9TrMeDNZEg1NadbJ4I4f+YIGPTfitFI+78STdloPF0uyLY
 kwmvjYKX47lE/LP2sW7VS06sKTWefUYgqztql9qfLwaS/IGVApiYCQKww3nNZoDM+xASn3hNpY4
 vG8KY41/eJalMJ+iFvKD66p8OHIsRfYK9Qaye9axkWQy84on8Pf0g0TjAdrjbSoi7chZlBYmIaI
 OtRUPHwaRPvvB4Q==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

With all users of struct function_desc limited to only accessing it using
the dedicated function and never modifying it, we can now constify the
return value of pinmux_generic_get_function() treewide.

Reviewed-by: Andy Shevchenko <andy@kernel.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> # renesas
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be> # renesas
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/freescale/pinctrl-imx.c   | 2 +-
 drivers/pinctrl/mediatek/pinctrl-airoha.c | 2 +-
 drivers/pinctrl/mediatek/pinctrl-moore.c  | 2 +-
 drivers/pinctrl/pinctrl-equilibrium.c     | 2 +-
 drivers/pinctrl/pinctrl-ingenic.c         | 2 +-
 drivers/pinctrl/pinctrl-keembay.c         | 2 +-
 drivers/pinctrl/pinctrl-single.c          | 4 ++--
 drivers/pinctrl/pinmux.c                  | 4 ++--
 drivers/pinctrl/pinmux.h                  | 4 ++--
 drivers/pinctrl/renesas/pinctrl-rza1.c    | 2 +-
 drivers/pinctrl/renesas/pinctrl-rza2.c    | 2 +-
 drivers/pinctrl/renesas/pinctrl-rzg2l.c   | 2 +-
 drivers/pinctrl/renesas/pinctrl-rzv2m.c   | 2 +-
 13 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index d5d42c9ad5fe9dcf7c25ad393688e714b02db678..9ed84479a5b43871861f46fe1326f1dfadc7f63c 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -245,7 +245,7 @@ static int imx_pmx_set(struct pinctrl_dev *pctldev, unsigned selector,
 {
 	struct imx_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
 	const struct imx_pinctrl_soc_info *info = ipctl->info;
-	struct function_desc *func;
+	const struct function_desc *func;
 	struct group_desc *grp;
 	struct imx_pin *pin;
 	unsigned int npins;
diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
index 51cd0cdc2f5170d024fe984ce8882ed9b3ce6563..61aecc3555837ddada3bab9d7f28a6af7afdd3b3 100644
--- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
+++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
@@ -2446,7 +2446,7 @@ static int airoha_pinmux_set_mux(struct pinctrl_dev *pctrl_dev,
 {
 	struct airoha_pinctrl *pinctrl = pinctrl_dev_get_drvdata(pctrl_dev);
 	const struct airoha_pinctrl_func *func;
-	struct function_desc *desc;
+	const struct function_desc *desc;
 	struct group_desc *grp;
 	int i;
 
diff --git a/drivers/pinctrl/mediatek/pinctrl-moore.c b/drivers/pinctrl/mediatek/pinctrl-moore.c
index 982b9887521d036538f67e9919de444693c458c0..17a08c73423fd089066e4894d2307c852bbbb661 100644
--- a/drivers/pinctrl/mediatek/pinctrl-moore.c
+++ b/drivers/pinctrl/mediatek/pinctrl-moore.c
@@ -43,7 +43,7 @@ static int mtk_pinmux_set_mux(struct pinctrl_dev *pctldev,
 			      unsigned int selector, unsigned int group)
 {
 	struct mtk_pinctrl *hw = pinctrl_dev_get_drvdata(pctldev);
-	struct function_desc *func;
+	const struct function_desc *func;
 	struct group_desc *grp;
 	int i, err;
 
diff --git a/drivers/pinctrl/pinctrl-equilibrium.c b/drivers/pinctrl/pinctrl-equilibrium.c
index fce804d42e7d7f9233b2da0fb26e482170629424..18f0da58c96d4f0fad6535fd88e69fc8acf96a94 100644
--- a/drivers/pinctrl/pinctrl-equilibrium.c
+++ b/drivers/pinctrl/pinctrl-equilibrium.c
@@ -319,7 +319,7 @@ static int eqbr_pinmux_set_mux(struct pinctrl_dev *pctldev,
 			       unsigned int selector, unsigned int group)
 {
 	struct eqbr_pinctrl_drv_data *pctl = pinctrl_dev_get_drvdata(pctldev);
-	struct function_desc *func;
+	const struct function_desc *func;
 	struct group_desc *grp;
 	unsigned int *pinmux;
 	int i;
diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index af9d2f3081859bc4b22f6820f3b3753eba36f959..e13ef07850386e70cffc83011589ceaf70a70a41 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -4000,7 +4000,7 @@ static int ingenic_pinmux_set_mux(struct pinctrl_dev *pctldev,
 		unsigned int selector, unsigned int group)
 {
 	struct ingenic_pinctrl *jzpc = pinctrl_dev_get_drvdata(pctldev);
-	struct function_desc *func;
+	const struct function_desc *func;
 	struct group_desc *grp;
 	unsigned int i;
 	uintptr_t mode;
diff --git a/drivers/pinctrl/pinctrl-keembay.c b/drivers/pinctrl/pinctrl-keembay.c
index e78c8b3ec245aad56e3e74a26d27c41ba4a98281..30122ca90cbef141ec456ca39ab4eb6f8bc334c5 100644
--- a/drivers/pinctrl/pinctrl-keembay.c
+++ b/drivers/pinctrl/pinctrl-keembay.c
@@ -935,7 +935,7 @@ static int keembay_set_mux(struct pinctrl_dev *pctldev, unsigned int fun_sel,
 			   unsigned int grp_sel)
 {
 	struct keembay_pinctrl *kpc = pinctrl_dev_get_drvdata(pctldev);
-	struct function_desc *func;
+	const struct function_desc *func;
 	struct group_desc *grp;
 	unsigned int val;
 	u8 pin_mode;
diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index 5cda6201b60f53e62f3f50b8641ec894106111e0..c9adf5fcb1c76445d4812de449edf09878771a46 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -336,7 +336,7 @@ static int pcs_get_function(struct pinctrl_dev *pctldev, unsigned pin,
 	struct pcs_device *pcs = pinctrl_dev_get_drvdata(pctldev);
 	struct pin_desc *pdesc = pin_desc_get(pctldev, pin);
 	const struct pinctrl_setting_mux *setting;
-	struct function_desc *function;
+	const struct function_desc *function;
 	unsigned fselector;
 
 	/* If pin is not described in DTS & enabled, mux_setting is NULL. */
@@ -360,7 +360,7 @@ static int pcs_set_mux(struct pinctrl_dev *pctldev, unsigned fselector,
 	unsigned group)
 {
 	struct pcs_device *pcs;
-	struct function_desc *function;
+	const struct function_desc *function;
 	struct pcs_function *func;
 	int i;
 
diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index 79814758a084570adea0ea1a3151d186f65d1d1f..62bd4aa53b2b22cb09eacfb05398205f2fe391b9 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -847,8 +847,8 @@ EXPORT_SYMBOL_GPL(pinmux_generic_get_function_groups);
  * @pctldev: pin controller device
  * @selector: function number
  */
-struct function_desc *pinmux_generic_get_function(struct pinctrl_dev *pctldev,
-						  unsigned int selector)
+const struct function_desc *
+pinmux_generic_get_function(struct pinctrl_dev *pctldev, unsigned int selector)
 {
 	struct function_desc *function;
 
diff --git a/drivers/pinctrl/pinmux.h b/drivers/pinctrl/pinmux.h
index bdb5be1a636ead9695410824b5557937c5baa89a..549ab10f7afbda32fadf4ad151401180bed2064f 100644
--- a/drivers/pinctrl/pinmux.h
+++ b/drivers/pinctrl/pinmux.h
@@ -152,8 +152,8 @@ int pinmux_generic_get_function_groups(struct pinctrl_dev *pctldev,
 				       const char * const **groups,
 				       unsigned int * const ngroups);
 
-struct function_desc *pinmux_generic_get_function(struct pinctrl_dev *pctldev,
-						  unsigned int selector);
+const struct function_desc *
+pinmux_generic_get_function(struct pinctrl_dev *pctldev, unsigned int selector);
 
 int pinmux_generic_add_function(struct pinctrl_dev *pctldev,
 				const char *name,
diff --git a/drivers/pinctrl/renesas/pinctrl-rza1.c b/drivers/pinctrl/renesas/pinctrl-rza1.c
index 23812116ef42682d8ef667525d4f4486c286b46a..70f22e0ef307a02d5b11d6626d297a619f5b82e9 100644
--- a/drivers/pinctrl/renesas/pinctrl-rza1.c
+++ b/drivers/pinctrl/renesas/pinctrl-rza1.c
@@ -1120,7 +1120,7 @@ static int rza1_set_mux(struct pinctrl_dev *pctldev, unsigned int selector,
 {
 	struct rza1_pinctrl *rza1_pctl = pinctrl_dev_get_drvdata(pctldev);
 	struct rza1_mux_conf *mux_confs;
-	struct function_desc *func;
+	const struct function_desc *func;
 	struct group_desc *grp;
 	int i;
 
diff --git a/drivers/pinctrl/renesas/pinctrl-rza2.c b/drivers/pinctrl/renesas/pinctrl-rza2.c
index b78b5b4ec5afd9879373b406e0b8c391912a200d..29a9db19759906598ac55694439cff8a5ec2c8aa 100644
--- a/drivers/pinctrl/renesas/pinctrl-rza2.c
+++ b/drivers/pinctrl/renesas/pinctrl-rza2.c
@@ -442,7 +442,7 @@ static int rza2_set_mux(struct pinctrl_dev *pctldev, unsigned int selector,
 			unsigned int group)
 {
 	struct rza2_pinctrl_priv *priv = pinctrl_dev_get_drvdata(pctldev);
-	struct function_desc *func;
+	const struct function_desc *func;
 	unsigned int i, *psel_val;
 	struct group_desc *grp;
 
diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index c52263c2a7b093fccdb38e44ff3fbba0a86d4def..a9bcb3d7c45c269046df0a7d0088a1f48d089fd0 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -549,7 +549,7 @@ static int rzg2l_pinctrl_set_mux(struct pinctrl_dev *pctldev,
 {
 	struct rzg2l_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
 	const struct rzg2l_hwcfg *hwcfg = pctrl->data->hwcfg;
-	struct function_desc *func;
+	const struct function_desc *func;
 	unsigned int i, *psel_val;
 	struct group_desc *group;
 	const unsigned int *pins;
diff --git a/drivers/pinctrl/renesas/pinctrl-rzv2m.c b/drivers/pinctrl/renesas/pinctrl-rzv2m.c
index daaa986d994dac15860d328c81e28e2c9e678120..dce68f93d2d57f6a6c9b1bf9e1db27393ece8e44 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzv2m.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzv2m.c
@@ -162,7 +162,7 @@ static int rzv2m_pinctrl_set_mux(struct pinctrl_dev *pctldev,
 				 unsigned int group_selector)
 {
 	struct rzv2m_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
-	struct function_desc *func;
+	const struct function_desc *func;
 	unsigned int i, *psel_val;
 	struct group_desc *group;
 	const unsigned int *pins;

-- 
2.48.1


