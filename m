Return-Path: <linux-gpio+bounces-21703-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FAC1ADCCD9
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Jun 2025 15:19:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CEF67189F7A2
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Jun 2025 13:13:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 162A62E3B0F;
	Tue, 17 Jun 2025 13:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="bmwufvKW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878432E3B1A
	for <linux-gpio@vger.kernel.org>; Tue, 17 Jun 2025 13:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750165746; cv=none; b=moS2sTQcVMnxTGrm/p805iDU4IMnZLd2rHdU2EMAVB+vJgeLKnMdz7Ds06cnSUFY/dwV4i0jzzI1zNHUm0IlYEb1Dlv+/JdtoHIFtlmaMfZM8Gb5cdB+2pk0Q9V2nmUS7M3HJ/8TJ0PtE3WHqxcWDQh5PM0V7PyzmGj6hoJ5haY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750165746; c=relaxed/simple;
	bh=BJ/+drZbsiBdg0LJquUPeTY79gL8s8LHO2+lUMScuI8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZCnZqa1QaS5zgJQcCevUYqpfbBIAfyVOhiPyp5EGozhzYY6N1cfjojLt2LzEHQ87eDf3ycvhGMjEJXsJLlnWh/vXl4jEeE3BbcNz+FjIiiqRru/kNxw2tKZRoANhxbRvnHL9c2qGZ2Ekx+BHddyOqXpdq10pAw/bHxufyubjDzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=bmwufvKW; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ade30256175so1122770366b.1
        for <linux-gpio@vger.kernel.org>; Tue, 17 Jun 2025 06:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750165742; x=1750770542; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iLALiAvabF2d1X88t1C691rDUE0kG0ZI+XCoDd8HGys=;
        b=bmwufvKWWG1FlhEIRfM946tI5njbbQzSjzf3/KB6H7PxZ3lrCc+qlJNcO4PEyEYauG
         o6QHnZl4r2Vz9s8xcSY7WZ7NZAnTKEJP5Lf72x6MnmFrmNLQQR9d3jaCDXghrQXfgS+a
         0hTn3M9mFaFRyAEXBbZ2QpsSywmh4ptrnYL4FJZkOSCmXvO30/qhn5ixfAEBmaZDtpC7
         LxCyBXrHXtblTg7JIEOKsugbpkeSF/9ZhoXis4yBEHgdenn114e8cZvmRSnkF186ymqE
         XLEWSM0QLlr9cmF/Lje0NdZisdoW91DkPTq/jhnOAW/oOp7pb2NHt/zu0Fyh9rITGqtj
         XBYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750165742; x=1750770542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iLALiAvabF2d1X88t1C691rDUE0kG0ZI+XCoDd8HGys=;
        b=cFEyc1HdOX57UZYiLNZNSGxn22nme0ZFE4Krrk3WihSm6xZ4Wji4pqgvWLbGy/ea94
         HQ7Nuh8P9PSy0ylvpQrJbAzkxEaf601AEi4RL+06AiIO4unnZqKVpuT76iRti+cTr0Fg
         r3hwf00L5V0wyHD9Pw7lMFHgLjLTLrwnv5qb88+2gA3j8hE7n/TlRS6w/PukPnxTjr9K
         aMf/3HOUKBQ9Ksw3SnSFBV0oW/wNnAcSX7LOlBCXc5A6lKMliLF89ghPv4wrfKiIZ5D9
         IVWOJD+nZMZgMe7uy6Ohst43h2wdJPENAXsMulGgp1yLRR4YLFJlka+WFTWf/AzWXEwq
         wqjg==
X-Forwarded-Encrypted: i=1; AJvYcCUvDwB9hiPuq75mvp2MpO1LEiofBDnx5YL2xasFzlwi3m8eifdledS4HMevnCz5M/YgVnGYBiMwoKKI@vger.kernel.org
X-Gm-Message-State: AOJu0YzdMBsOU9/WCWk+Gtivm66a9itPGLPN12wLA+jq6bt5oHtms3go
	m/jCCSXK+9fpEZtCDzLiKfzx2+l2dlUtJa3yFKSuMjLMSNy9UG6k906RfMEuhK37sEk=
X-Gm-Gg: ASbGncuCoikpWXxxcZZj8nprfjMuqicz6nTA2afrakwJPDfnURxc/aIg9B69QdYDsab
	fZhX51/Y9B4oJQwHPHYhgOGYa8sBzlR/diFqRp45n0Qhwxxr9iUrM59uzbYi3Pd6o6DKpCMAP7p
	xEE20q0SdDkYNv/ws1Xsgy4klJBcP49PIHsqXQDaFsIaoDfxfJ3r5dUcpoQsnEh9uljeUpC7iyj
	e1XS39JKSpltVUQrFJQT5u1LnlmdRmHPy+tUS4foo0cV/DTbAi9BvpgCoViIzgEM7SDx54cfrNz
	iL7utQhnHuN8ATfcvZT7iTgyzJRrIw2UuzQ1ZOit/5YNNUB8wFTD7yLJw8Aj/4CHaqqJf6EcqZD
	tO9M7u6GrBg2GZidP6mJ9BoE/euWnzFGUjqBiOBzMYhI=
X-Google-Smtp-Source: AGHT+IHJFcQZJOub0cQy8VBBqBcaK9I/TVZ3kGTNYKjDHR8l/jyT8xrnyxcfJq5YSqNcJtvSy8tJdQ==
X-Received: by 2002:a17:907:3ccb:b0:ad8:9c97:c2eb with SMTP id a640c23a62f3a-adfad309e97mr1411379266b.19.1750165738422;
        Tue, 17 Jun 2025 06:08:58 -0700 (PDT)
Received: from localhost (host-79-23-237-223.retail.telecomitalia.it. [79.23.237.223])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec88fe514sm874313266b.79.2025.06.17.06.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 06:08:58 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com,
	Matthias Brugger <mbrugger@suse.com>
Subject: [PATCH stblinux/next 2/2] clk: rp1: Implement ramaining clock tree
Date: Tue, 17 Jun 2025 15:10:27 +0200
Message-ID: <b70b9f2d50e3155509c2672e6779c0840f38ad5e.1750165398.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <b8a54f41f6393e3b3cae6dee561fcd040e3e5fd0.1750165398.git.andrea.porta@suse.com>
References: <b8a54f41f6393e3b3cae6dee561fcd040e3e5fd0.1750165398.git.andrea.porta@suse.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RP1 clock generator driver currently defines only the fundamental
clocks such as the front PLLs for system, audio and video subsystems
and the ethernet clock.

Add the remaining clocks to the tree so as to be completed.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/clk/clk-rp1.c | 1192 +++++++++++++++++++++++++++++++++++++----
 1 file changed, 1076 insertions(+), 116 deletions(-)

diff --git a/drivers/clk/clk-rp1.c b/drivers/clk/clk-rp1.c
index afff90d48734..e8f264d7f34e 100644
--- a/drivers/clk/clk-rp1.c
+++ b/drivers/clk/clk-rp1.c
@@ -368,6 +368,11 @@ struct rp1_clk_desc {
 	struct clk_divider div;
 };
 
+static struct rp1_clk_desc *clk_audio_core;
+static struct rp1_clk_desc *clk_audio;
+static struct rp1_clk_desc *clk_i2s;
+static struct clk_hw *clk_xosc;
+
 static inline
 void clockman_write(struct rp1_clockman *clockman, u32 reg, u32 val)
 {
@@ -475,7 +480,6 @@ static int rp1_pll_core_set_rate(struct clk_hw *hw,
 	struct rp1_clk_desc *pll_core = container_of(hw, struct rp1_clk_desc, hw);
 	struct rp1_clockman *clockman = pll_core->clockman;
 	const struct rp1_pll_core_data *data = pll_core->data;
-	unsigned long calc_rate;
 	u32 fbdiv_int, fbdiv_frac;
 
 	/* Disable dividers to start with. */
@@ -484,8 +488,8 @@ static int rp1_pll_core_set_rate(struct clk_hw *hw,
 	clockman_write(clockman, data->fbdiv_frac_reg, 0);
 	spin_unlock(&clockman->regs_lock);
 
-	calc_rate = get_pll_core_divider(hw, rate, parent_rate,
-					 &fbdiv_int, &fbdiv_frac);
+	get_pll_core_divider(hw, rate, parent_rate,
+			     &fbdiv_int, &fbdiv_frac);
 
 	spin_lock(&clockman->regs_lock);
 	clockman_write(clockman, data->pwr_reg, fbdiv_frac ? 0 : PLL_PWR_DSMPD);
@@ -497,8 +501,6 @@ static int rp1_pll_core_set_rate(struct clk_hw *hw,
 	if (WARN_ON_ONCE(parent_rate > (rate / 16)))
 		return -ERANGE;
 
-	pll_core->cached_rate = calc_rate;
-
 	spin_lock(&clockman->regs_lock);
 	/* Don't need to divide ref unless parent_rate > (output freq / 16) */
 	clockman_write(clockman, data->cs_reg,
@@ -617,8 +619,12 @@ static unsigned long rp1_pll_recalc_rate(struct clk_hw *hw,
 static long rp1_pll_round_rate(struct clk_hw *hw, unsigned long rate,
 			       unsigned long *parent_rate)
 {
+	struct clk_hw *clk_audio_hw = &clk_audio->hw;
 	u32 div1, div2;
 
+	if (hw == clk_audio_hw && clk_audio->cached_rate == rate)
+		*parent_rate = clk_audio_core->cached_rate;
+
 	get_pll_prim_dividers(rate, *parent_rate, &div1, &div2);
 
 	return DIV_ROUND_CLOSEST(*parent_rate, div1 * div2);
@@ -964,6 +970,59 @@ static int rp1_clock_set_rate(struct clk_hw *hw, unsigned long rate,
 	return rp1_clock_set_rate_and_parent(hw, rate, parent_rate, 0xff);
 }
 
+static unsigned long calc_core_pll_rate(struct clk_hw *pll_hw,
+					unsigned long target_rate,
+					int *pdiv_prim, int *pdiv_clk)
+{
+	static const int prim_divs[] = {
+		2, 3, 4, 5, 6, 7, 8, 9, 10, 12, 14, 15, 16,
+		18, 20, 21, 24, 25, 28, 30, 35, 36, 42, 49,
+	};
+	const unsigned long xosc_rate = clk_hw_get_rate(clk_xosc);
+	const unsigned long core_min = xosc_rate * 16;
+	const unsigned long core_max = 2400000000;
+	int best_div_prim = 1, best_div_clk = 1;
+	unsigned long best_rate = core_max + 1;
+	unsigned long core_rate = 0;
+	int div_int, div_frac;
+	u64 div;
+	int i;
+
+	/* Given the target rate, choose a set of divisors/multipliers */
+	for (i = 0; i < ARRAY_SIZE(prim_divs); i++) {
+		int div_prim = prim_divs[i];
+		int div_clk;
+
+		for (div_clk = 1; div_clk <= 256; div_clk++) {
+			core_rate = target_rate * div_clk * div_prim;
+			if (core_rate >= core_min) {
+				if (core_rate < best_rate) {
+					best_rate = core_rate;
+					best_div_prim = div_prim;
+					best_div_clk = div_clk;
+				}
+				break;
+			}
+		}
+	}
+
+	if (best_rate < core_max) {
+		div = ((best_rate << 24) + xosc_rate / 2) / xosc_rate;
+		div_int = div >> 24;
+		div_frac = div % (1 << 24);
+		core_rate = (xosc_rate * ((div_int << 24) + div_frac) + (1 << 23)) >> 24;
+	} else {
+		core_rate = 0;
+	}
+
+	if (pdiv_prim)
+		*pdiv_prim = best_div_prim;
+	if (pdiv_clk)
+		*pdiv_clk = best_div_clk;
+
+	return core_rate;
+}
+
 static void rp1_clock_choose_div_and_prate(struct clk_hw *hw,
 					   int parent_idx,
 					   unsigned long rate,
@@ -972,12 +1031,35 @@ static void rp1_clock_choose_div_and_prate(struct clk_hw *hw,
 {
 	struct rp1_clk_desc *clock = container_of(hw, struct rp1_clk_desc, hw);
 	const struct rp1_clock_data *data = clock->data;
+	struct clk_hw *clk_audio_hw = &clk_audio->hw;
+	struct clk_hw *clk_i2s_hw = &clk_i2s->hw;
 	struct clk_hw *parent;
 	u32 div;
 	u64 tmp;
 
 	parent = clk_hw_get_parent_by_index(hw, parent_idx);
 
+	if (hw == clk_i2s_hw && clk_i2s->cached_rate == rate && parent == clk_audio_hw) {
+		*prate = clk_audio->cached_rate;
+		*calc_rate = rate;
+		return;
+	}
+
+	if (hw == clk_i2s_hw && parent == clk_audio_hw) {
+		unsigned long core_rate, audio_rate, i2s_rate;
+		int div_prim, div_clk;
+
+		core_rate = calc_core_pll_rate(parent, rate, &div_prim, &div_clk);
+		audio_rate = DIV_ROUND_CLOSEST(core_rate, div_prim);
+		i2s_rate = DIV_ROUND_CLOSEST(audio_rate, div_clk);
+		clk_audio_core->cached_rate = core_rate;
+		clk_audio->cached_rate = audio_rate;
+		clk_i2s->cached_rate = i2s_rate;
+		*prate = audio_rate;
+		*calc_rate = i2s_rate;
+		return;
+	}
+
 	*prate = clk_hw_get_rate(parent);
 	div = rp1_clock_choose_div(rate, *prate, data);
 
@@ -1062,6 +1144,34 @@ static int rp1_clock_determine_rate(struct clk_hw *hw,
 	return 0;
 }
 
+static int rp1_varsrc_set_rate(struct clk_hw *hw,
+			       unsigned long rate, unsigned long parent_rate)
+{
+	struct rp1_clk_desc *clock = container_of(hw, struct rp1_clk_desc, hw);
+
+	/*
+	 * "varsrc" exists purely to let clock dividers know the frequency
+	 * of an externally-managed clock source (such as MIPI DSI byte-clock)
+	 * which may change at run-time as a side-effect of some other driver.
+	 */
+	clock->cached_rate = rate;
+	return 0;
+}
+
+static unsigned long rp1_varsrc_recalc_rate(struct clk_hw *hw,
+					    unsigned long parent_rate)
+{
+	struct rp1_clk_desc *clock = container_of(hw, struct rp1_clk_desc, hw);
+
+	return clock->cached_rate;
+}
+
+static long rp1_varsrc_round_rate(struct clk_hw *hw, unsigned long rate,
+				  unsigned long *parent_rate)
+{
+	return rate;
+}
+
 static const struct clk_ops rp1_pll_core_ops = {
 	.is_prepared = rp1_pll_core_is_on,
 	.prepare = rp1_pll_core_on,
@@ -1106,6 +1216,12 @@ static const struct clk_ops rp1_clk_ops = {
 	.determine_rate = rp1_clock_determine_rate,
 };
 
+static const struct clk_ops rp1_varsrc_ops = {
+	.set_rate = rp1_varsrc_set_rate,
+	.recalc_rate = rp1_varsrc_recalc_rate,
+	.round_rate = rp1_varsrc_round_rate,
+};
+
 static struct clk_hw *rp1_register_pll(struct rp1_clockman *clockman,
 				       struct rp1_clk_desc *desc)
 {
@@ -1241,6 +1357,36 @@ static struct rp1_clk_desc pll_sys_desc = REGISTER_PLL(
 	)
 );
 
+static struct rp1_clk_desc pll_audio_desc = REGISTER_PLL(
+	.hw.init = CLK_HW_INIT_PARENTS_DATA(
+		"pll_audio",
+		(const struct clk_parent_data[]) {
+			{ .hw = &pll_audio_core_desc.hw }
+		},
+		&rp1_pll_ops,
+		CLK_SET_RATE_PARENT
+	),
+	CLK_DATA(rp1_pll_data,
+		 .ctrl_reg = PLL_AUDIO_PRIM,
+		 .fc0_src = FC_NUM(4, 2),
+	)
+);
+
+static struct rp1_clk_desc pll_video_desc = REGISTER_PLL(
+	.hw.init = CLK_HW_INIT_PARENTS_DATA(
+		"pll_video",
+		(const struct clk_parent_data[]) {
+			{ .hw = &pll_video_core_desc.hw }
+		},
+		&rp1_pll_ops,
+		0
+	),
+	CLK_DATA(rp1_pll_data,
+		 .ctrl_reg = PLL_VIDEO_PRIM,
+		 .fc0_src = FC_NUM(3, 2),
+	)
+);
+
 static struct rp1_clk_desc pll_sys_sec_desc = REGISTER_PLL_DIV(
 	.hw.init = CLK_HW_INIT_PARENTS_DATA(
 		"pll_sys_sec",
@@ -1256,16 +1402,42 @@ static struct rp1_clk_desc pll_sys_sec_desc = REGISTER_PLL_DIV(
 	)
 );
 
+static struct rp1_clk_desc pll_video_sec_desc = REGISTER_PLL_DIV(
+	.hw.init = CLK_HW_INIT_PARENTS_DATA(
+		"pll_video_sec",
+		(const struct clk_parent_data[]) {
+			{ .hw = &pll_video_core_desc.hw }
+		},
+		&rp1_pll_divider_ops,
+		0
+	),
+	CLK_DATA(rp1_pll_data,
+		 .ctrl_reg = PLL_VIDEO_SEC,
+		 .fc0_src = FC_NUM(5, 3),
+	)
+);
+
+static const struct clk_parent_data clk_eth_tsu_parents[] = {
+	{ .index = 0 },
+	{ .hw = &pll_video_sec_desc.hw },
+	{ .index = -1 },
+	{ .index = -1 },
+	{ .index = -1 },
+	{ .index = -1 },
+	{ .index = -1 },
+	{ .index = -1 },
+};
+
 static struct rp1_clk_desc clk_eth_tsu_desc = REGISTER_CLK(
 	.hw.init = CLK_HW_INIT_PARENTS_DATA(
 		"clk_eth_tsu",
-		(const struct clk_parent_data[]) { { .index = 0 } },
+		clk_eth_tsu_parents,
 		&rp1_clk_ops,
 		0
 	),
 	CLK_DATA(rp1_clock_data,
 		 .num_std_parents = 0,
-		 .num_aux_parents = 1,
+		 .num_aux_parents = 8,
 		 .ctrl_reg = CLK_ETH_TSU_CTRL,
 		 .div_int_reg = CLK_ETH_TSU_DIV_INT,
 		 .sel_reg = CLK_ETH_TSU_SEL,
@@ -1278,6 +1450,7 @@ static struct rp1_clk_desc clk_eth_tsu_desc = REGISTER_CLK(
 static const struct clk_parent_data clk_eth_parents[] = {
 	{ .hw = &pll_sys_sec_desc.div.hw },
 	{ .hw = &pll_sys_desc.hw },
+	{ .hw = &pll_video_sec_desc.hw },
 };
 
 static struct rp1_clk_desc clk_eth_desc = REGISTER_CLK(
@@ -1289,7 +1462,7 @@ static struct rp1_clk_desc clk_eth_desc = REGISTER_CLK(
 	),
 	CLK_DATA(rp1_clock_data,
 		 .num_std_parents = 0,
-		 .num_aux_parents = 2,
+		 .num_aux_parents = 3,
 		 .ctrl_reg = CLK_ETH_CTRL,
 		 .div_int_reg = CLK_ETH_DIV_INT,
 		 .sel_reg = CLK_ETH_SEL,
@@ -1342,122 +1515,904 @@ static struct rp1_clk_desc pll_sys_pri_ph_desc = REGISTER_PLL(
 	)
 );
 
-static struct rp1_clk_desc *const clk_desc_array[] = {
-	[RP1_PLL_SYS_CORE] = &pll_sys_core_desc,
-	[RP1_PLL_AUDIO_CORE] = &pll_audio_core_desc,
-	[RP1_PLL_VIDEO_CORE] = &pll_video_core_desc,
-	[RP1_PLL_SYS] = &pll_sys_desc,
-	[RP1_CLK_ETH_TSU] = &clk_eth_tsu_desc,
-	[RP1_CLK_ETH] = &clk_eth_desc,
-	[RP1_CLK_SYS] = &clk_sys_desc,
-	[RP1_PLL_SYS_PRI_PH] = &pll_sys_pri_ph_desc,
-	[RP1_PLL_SYS_SEC] = &pll_sys_sec_desc,
-};
-
-static const struct regmap_range rp1_reg_ranges[] = {
-	regmap_reg_range(PLL_SYS_CS, PLL_SYS_SEC),
-	regmap_reg_range(PLL_AUDIO_CS, PLL_AUDIO_TERN),
-	regmap_reg_range(PLL_VIDEO_CS, PLL_VIDEO_SEC),
-	regmap_reg_range(GPCLK_OE_CTRL, GPCLK_OE_CTRL),
-	regmap_reg_range(CLK_SYS_CTRL, CLK_SYS_DIV_INT),
-	regmap_reg_range(CLK_SYS_SEL, CLK_SYS_SEL),
-	regmap_reg_range(CLK_SLOW_SYS_CTRL, CLK_SLOW_SYS_DIV_INT),
-	regmap_reg_range(CLK_SLOW_SYS_SEL, CLK_SLOW_SYS_SEL),
-	regmap_reg_range(CLK_DMA_CTRL, CLK_DMA_DIV_INT),
-	regmap_reg_range(CLK_DMA_SEL, CLK_DMA_SEL),
-	regmap_reg_range(CLK_UART_CTRL, CLK_UART_DIV_INT),
-	regmap_reg_range(CLK_UART_SEL, CLK_UART_SEL),
-	regmap_reg_range(CLK_ETH_CTRL, CLK_ETH_DIV_INT),
-	regmap_reg_range(CLK_ETH_SEL, CLK_ETH_SEL),
-	regmap_reg_range(CLK_PWM0_CTRL, CLK_PWM0_SEL),
-	regmap_reg_range(CLK_PWM1_CTRL, CLK_PWM1_SEL),
-	regmap_reg_range(CLK_AUDIO_IN_CTRL, CLK_AUDIO_IN_DIV_INT),
-	regmap_reg_range(CLK_AUDIO_IN_SEL, CLK_AUDIO_IN_SEL),
-	regmap_reg_range(CLK_AUDIO_OUT_CTRL, CLK_AUDIO_OUT_DIV_INT),
-	regmap_reg_range(CLK_AUDIO_OUT_SEL, CLK_AUDIO_OUT_SEL),
-	regmap_reg_range(CLK_I2S_CTRL, CLK_I2S_DIV_INT),
-	regmap_reg_range(CLK_I2S_SEL, CLK_I2S_SEL),
-	regmap_reg_range(CLK_MIPI0_CFG_CTRL, CLK_MIPI0_CFG_DIV_INT),
-	regmap_reg_range(CLK_MIPI0_CFG_SEL, CLK_MIPI0_CFG_SEL),
-	regmap_reg_range(CLK_MIPI1_CFG_CTRL, CLK_MIPI1_CFG_DIV_INT),
-	regmap_reg_range(CLK_MIPI1_CFG_SEL, CLK_MIPI1_CFG_SEL),
-	regmap_reg_range(CLK_PCIE_AUX_CTRL, CLK_PCIE_AUX_DIV_INT),
-	regmap_reg_range(CLK_PCIE_AUX_SEL, CLK_PCIE_AUX_SEL),
-	regmap_reg_range(CLK_USBH0_MICROFRAME_CTRL, CLK_USBH0_MICROFRAME_DIV_INT),
-	regmap_reg_range(CLK_USBH0_MICROFRAME_SEL, CLK_USBH0_MICROFRAME_SEL),
-	regmap_reg_range(CLK_USBH1_MICROFRAME_CTRL, CLK_USBH1_MICROFRAME_DIV_INT),
-	regmap_reg_range(CLK_USBH1_MICROFRAME_SEL, CLK_USBH1_MICROFRAME_SEL),
-	regmap_reg_range(CLK_USBH0_SUSPEND_CTRL, CLK_USBH0_SUSPEND_DIV_INT),
-	regmap_reg_range(CLK_USBH0_SUSPEND_SEL, CLK_USBH0_SUSPEND_SEL),
-	regmap_reg_range(CLK_USBH1_SUSPEND_CTRL, CLK_USBH1_SUSPEND_DIV_INT),
-	regmap_reg_range(CLK_USBH1_SUSPEND_SEL, CLK_USBH1_SUSPEND_SEL),
-	regmap_reg_range(CLK_ETH_TSU_CTRL, CLK_ETH_TSU_DIV_INT),
-	regmap_reg_range(CLK_ETH_TSU_SEL, CLK_ETH_TSU_SEL),
-	regmap_reg_range(CLK_ADC_CTRL, CLK_ADC_DIV_INT),
-	regmap_reg_range(CLK_ADC_SEL, CLK_ADC_SEL),
-	regmap_reg_range(CLK_SDIO_TIMER_CTRL, CLK_SDIO_TIMER_DIV_INT),
-	regmap_reg_range(CLK_SDIO_TIMER_SEL, CLK_SDIO_TIMER_SEL),
-	regmap_reg_range(CLK_SDIO_ALT_SRC_CTRL, CLK_SDIO_ALT_SRC_DIV_INT),
-	regmap_reg_range(CLK_SDIO_ALT_SRC_SEL, CLK_SDIO_ALT_SRC_SEL),
-	regmap_reg_range(CLK_GP0_CTRL, CLK_GP0_SEL),
-	regmap_reg_range(CLK_GP1_CTRL, CLK_GP1_SEL),
-	regmap_reg_range(CLK_GP2_CTRL, CLK_GP2_SEL),
-	regmap_reg_range(CLK_GP3_CTRL, CLK_GP3_SEL),
-	regmap_reg_range(CLK_GP4_CTRL, CLK_GP4_SEL),
-	regmap_reg_range(CLK_GP5_CTRL, CLK_GP5_SEL),
-	regmap_reg_range(CLK_SYS_RESUS_CTRL, CLK_SYS_RESUS_CTRL),
-	regmap_reg_range(CLK_SLOW_SYS_RESUS_CTRL, CLK_SLOW_SYS_RESUS_CTRL),
-	regmap_reg_range(FC0_REF_KHZ, FC0_RESULT),
-	regmap_reg_range(VIDEO_CLK_VEC_CTRL, VIDEO_CLK_VEC_DIV_INT),
-	regmap_reg_range(VIDEO_CLK_VEC_SEL, VIDEO_CLK_DPI_DIV_INT),
-	regmap_reg_range(VIDEO_CLK_DPI_SEL, VIDEO_CLK_MIPI1_DPI_SEL),
-};
+static struct rp1_clk_desc pll_audio_pri_ph_desc = REGISTER_PLL(
+	.hw.init = CLK_HW_INIT_PARENTS_DATA(
+		"pll_audio_pri_ph",
+		(const struct clk_parent_data[]) {
+			{ .hw = &pll_audio_desc.hw }
+		},
+		&rp1_pll_ph_ops,
+		0
+	),
+	CLK_DATA(rp1_pll_ph_data,
+		 .ph_reg = PLL_AUDIO_PRIM,
+		 .fixed_divider = 2,
+		 .phase = RP1_PLL_PHASE_0,
+		 .fc0_src = FC_NUM(5, 1),
+	)
+);
 
-static const struct regmap_access_table rp1_reg_table = {
-	.yes_ranges = rp1_reg_ranges,
-	.n_yes_ranges = ARRAY_SIZE(rp1_reg_ranges),
-};
+static struct rp1_clk_desc pll_video_pri_ph_desc = REGISTER_PLL(
+	.hw.init = CLK_HW_INIT_PARENTS_DATA(
+		"pll_video_pri_ph",
+		(const struct clk_parent_data[]) {
+			{ .hw = &pll_video_desc.hw }
+		},
+		&rp1_pll_ph_ops,
+		0
+	),
+	CLK_DATA(rp1_pll_ph_data,
+		 .ph_reg = PLL_VIDEO_PRIM,
+		 .fixed_divider = 2,
+		 .phase = RP1_PLL_PHASE_0,
+		 .fc0_src = FC_NUM(4, 3),
+	)
+);
 
-static const struct regmap_config rp1_clk_regmap_cfg = {
-	.reg_bits = 32,
-	.val_bits = 32,
-	.reg_stride = 4,
-	.max_register = PLL_VIDEO_SEC,
-	.name = "rp1-clk",
-	.rd_table = &rp1_reg_table,
-	.disable_locking = true,
-};
+static struct rp1_clk_desc pll_audio_sec_desc = REGISTER_PLL_DIV(
+	.hw.init = CLK_HW_INIT_PARENTS_DATA(
+		"pll_audio_sec",
+		(const struct clk_parent_data[]) {
+			{ .hw = &pll_audio_core_desc.hw }
+		},
+		&rp1_pll_divider_ops,
+		0
+	),
+	CLK_DATA(rp1_pll_data,
+		 .ctrl_reg = PLL_AUDIO_SEC,
+		 .fc0_src = FC_NUM(6, 2),
+	)
+);
 
-static int rp1_clk_probe(struct platform_device *pdev)
-{
-	const size_t asize = ARRAY_SIZE(clk_desc_array);
-	struct rp1_clk_desc *desc;
-	struct device *dev = &pdev->dev;
-	struct rp1_clockman *clockman;
-	struct clk_hw **hws;
-	unsigned int i;
+static struct rp1_clk_desc pll_audio_tern_desc = REGISTER_PLL_DIV(
+	.hw.init = CLK_HW_INIT_PARENTS_DATA(
+		"pll_audio_tern",
+		(const struct clk_parent_data[]) {
+			{ .hw = &pll_audio_core_desc.hw }
+		},
+		&rp1_pll_divider_ops,
+		0
+	),
+	CLK_DATA(rp1_pll_data,
+		 .ctrl_reg = PLL_AUDIO_TERN,
+		 .fc0_src = FC_NUM(6, 2),
+	)
+);
 
-	clockman = devm_kzalloc(dev, struct_size(clockman, onecell.hws, asize),
-				GFP_KERNEL);
-	if (!clockman)
-		return -ENOMEM;
+static struct rp1_clk_desc clk_slow_sys_desc = REGISTER_CLK(
+	.hw.init = CLK_HW_INIT_PARENTS_DATA(
+		"clk_slow_sys",
+		(const struct clk_parent_data[]) { { .index = 0 } },
+		&rp1_clk_ops,
+		CLK_IS_CRITICAL
+	),
+	CLK_DATA(rp1_clock_data,
+		 .num_std_parents = 1,
+		 .num_aux_parents = 0,
+		 .ctrl_reg = CLK_SLOW_SYS_CTRL,
+		 .div_int_reg = CLK_SLOW_SYS_DIV_INT,
+		 .sel_reg = CLK_SLOW_SYS_SEL,
+		 .div_int_max = DIV_INT_8BIT_MAX,
+		 .max_freq = 50 * HZ_PER_MHZ,
+		 .fc0_src = FC_NUM(1, 4),
+		 .clk_src_mask = 0x1,
+	)
+);
 
-	spin_lock_init(&clockman->regs_lock);
-	clockman->dev = dev;
+static const struct clk_parent_data clk_dma_parents[] = {
+	{ .hw = &pll_sys_pri_ph_desc.hw },
+	{ .hw = &pll_video_desc.hw },
+	{ .index = 0 },
+};
 
-	clockman->regs = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(clockman->regs))
-		return PTR_ERR(clockman->regs);
+static struct rp1_clk_desc clk_dma_desc = REGISTER_CLK(
+	.hw.init = CLK_HW_INIT_PARENTS_DATA(
+		"clk_dma",
+		clk_dma_parents,
+		&rp1_clk_ops,
+		0
+	),
+	CLK_DATA(rp1_clock_data,
+		 .num_std_parents = 0,
+		 .num_aux_parents = 3,
+		 .ctrl_reg = CLK_DMA_CTRL,
+		 .div_int_reg = CLK_DMA_DIV_INT,
+		 .sel_reg = CLK_DMA_SEL,
+		 .div_int_max = DIV_INT_8BIT_MAX,
+		 .max_freq = 100 * HZ_PER_MHZ,
+		 .fc0_src = FC_NUM(2, 2),
+	)
+);
 
-	clockman->regmap = devm_regmap_init_mmio(dev, clockman->regs,
-						 &rp1_clk_regmap_cfg);
-	if (IS_ERR(clockman->regmap)) {
-		dev_err_probe(dev, PTR_ERR(clockman->regmap),
-			      "could not init clock regmap\n");
-		return PTR_ERR(clockman->regmap);
-	}
+static const struct clk_parent_data clk_uart_parents[] = {
+	{ .hw = &pll_sys_pri_ph_desc.hw },
+	{ .hw = &pll_video_desc.hw },
+	{ .index = 0 },
+};
 
-	clockman->onecell.num = asize;
+static struct rp1_clk_desc clk_uart_desc = REGISTER_CLK(
+	.hw.init = CLK_HW_INIT_PARENTS_DATA(
+		"clk_uart",
+		clk_uart_parents,
+		&rp1_clk_ops,
+		0
+	),
+	CLK_DATA(rp1_clock_data,
+		 .num_std_parents = 0,
+		 .num_aux_parents = 3,
+		 .ctrl_reg = CLK_UART_CTRL,
+		 .div_int_reg = CLK_UART_DIV_INT,
+		 .sel_reg = CLK_UART_SEL,
+		 .div_int_max = DIV_INT_8BIT_MAX,
+		 .max_freq = 100 * HZ_PER_MHZ,
+		 .fc0_src = FC_NUM(6, 7),
+	)
+);
+
+static const struct clk_parent_data clk_pwm0_parents[] = {
+	{ .index = -1 },
+	{ .hw = &pll_video_sec_desc.hw },
+	{ .index = 0 },
+};
+
+static struct rp1_clk_desc clk_pwm0_desc = REGISTER_CLK(
+	.hw.init = CLK_HW_INIT_PARENTS_DATA(
+		"clk_pwm0",
+		clk_pwm0_parents,
+		&rp1_clk_ops,
+		0
+	),
+	CLK_DATA(rp1_clock_data,
+		 .num_std_parents = 0,
+		 .num_aux_parents = 3,
+		 .ctrl_reg = CLK_PWM0_CTRL,
+		 .div_int_reg = CLK_PWM0_DIV_INT,
+		 .div_frac_reg = CLK_PWM0_DIV_FRAC,
+		 .sel_reg = CLK_PWM0_SEL,
+		 .div_int_max = DIV_INT_16BIT_MAX,
+		 .max_freq = 76800 * HZ_PER_KHZ,
+		 .fc0_src = FC_NUM(0, 5),
+	)
+);
+
+static const struct clk_parent_data clk_pwm1_parents[] = {
+	{ .index = -1 },
+	{ .hw = &pll_video_sec_desc.hw },
+	{ .index = 0 },
+};
+
+static struct rp1_clk_desc clk_pwm1_desc = REGISTER_CLK(
+	.hw.init = CLK_HW_INIT_PARENTS_DATA(
+		"clk_pwm1",
+		clk_pwm1_parents,
+		&rp1_clk_ops,
+		0
+	),
+	CLK_DATA(rp1_clock_data,
+		 .num_std_parents = 0,
+		 .num_aux_parents = 3,
+		 .ctrl_reg = CLK_PWM1_CTRL,
+		 .div_int_reg = CLK_PWM1_DIV_INT,
+		 .div_frac_reg = CLK_PWM1_DIV_FRAC,
+		 .sel_reg = CLK_PWM1_SEL,
+		 .div_int_max = DIV_INT_16BIT_MAX,
+		 .max_freq = 76800 * HZ_PER_KHZ,
+		 .fc0_src = FC_NUM(1, 5),
+	)
+);
+
+static const struct clk_parent_data clk_audio_in_parents[] = {
+	{ .index = -1 },
+	{ .index = -1 },
+	{ .index = -1 },
+	{ .hw = &pll_video_sec_desc.hw },
+	{ .index = 0 },
+};
+
+static struct rp1_clk_desc clk_audio_in_desc = REGISTER_CLK(
+	.hw.init = CLK_HW_INIT_PARENTS_DATA(
+		"clk_audio_in",
+		clk_audio_in_parents,
+		&rp1_clk_ops,
+		0
+	),
+	CLK_DATA(rp1_clock_data,
+		 .num_std_parents = 0,
+		 .num_aux_parents = 5,
+		 .ctrl_reg = CLK_AUDIO_IN_CTRL,
+		 .div_int_reg = CLK_AUDIO_IN_DIV_INT,
+		 .sel_reg = CLK_AUDIO_IN_SEL,
+		 .div_int_max = DIV_INT_8BIT_MAX,
+		 .max_freq = 76800 * HZ_PER_KHZ,
+		 .fc0_src = FC_NUM(2, 5),
+	)
+);
+
+static const struct clk_parent_data clk_audio_out_parents[] = {
+	{ .index = -1 },
+	{ .index = -1 },
+	{ .hw = &pll_video_sec_desc.hw },
+	{ .index = 0 },
+};
+
+static struct rp1_clk_desc clk_audio_out_desc = REGISTER_CLK(
+	.hw.init = CLK_HW_INIT_PARENTS_DATA(
+		"clk_audio_out",
+		clk_audio_out_parents,
+		&rp1_clk_ops,
+		0
+	),
+	CLK_DATA(rp1_clock_data,
+		 .num_std_parents = 0,
+		 .num_aux_parents = 4,
+		 .ctrl_reg = CLK_AUDIO_OUT_CTRL,
+		 .div_int_reg = CLK_AUDIO_OUT_DIV_INT,
+		 .sel_reg = CLK_AUDIO_OUT_SEL,
+		 .div_int_max = DIV_INT_8BIT_MAX,
+		 .max_freq = 153600 * HZ_PER_KHZ,
+		 .fc0_src = FC_NUM(3, 5),
+	)
+);
+
+static const struct clk_parent_data clk_i2s_parents[] = {
+	{ .index = 0 },
+	{ .hw = &pll_audio_desc.hw },
+	{ .hw = &pll_audio_sec_desc.hw },
+};
+
+static struct rp1_clk_desc clk_i2s_desc = REGISTER_CLK(
+	.hw.init = CLK_HW_INIT_PARENTS_DATA(
+		"clk_i2s",
+		clk_i2s_parents,
+		&rp1_clk_ops,
+		CLK_SET_RATE_PARENT
+	),
+	CLK_DATA(rp1_clock_data,
+		 .num_std_parents = 0,
+		 .num_aux_parents = 3,
+		 .ctrl_reg = CLK_I2S_CTRL,
+		 .div_int_reg = CLK_I2S_DIV_INT,
+		 .sel_reg = CLK_I2S_SEL,
+		 .div_int_max = DIV_INT_8BIT_MAX,
+		 .max_freq = 50 * HZ_PER_MHZ,
+		 .fc0_src = FC_NUM(4, 4),
+	)
+);
+
+static struct rp1_clk_desc clk_mipi0_cfg_desc = REGISTER_CLK(
+	.hw.init = CLK_HW_INIT_PARENTS_DATA(
+		"clk_mipi0_cfg",
+		(const struct clk_parent_data[]) { { .index = 0 } },
+		&rp1_clk_ops,
+		0
+	),
+	CLK_DATA(rp1_clock_data,
+		 .num_std_parents = 0,
+		 .num_aux_parents = 1,
+		 .ctrl_reg = CLK_MIPI0_CFG_CTRL,
+		 .div_int_reg = CLK_MIPI0_CFG_DIV_INT,
+		 .sel_reg = CLK_MIPI0_CFG_SEL,
+		 .div_int_max = DIV_INT_8BIT_MAX,
+		 .max_freq = 50 * HZ_PER_MHZ,
+		 .fc0_src = FC_NUM(4, 5),
+	)
+);
+
+static struct rp1_clk_desc clk_mipi1_cfg_desc = REGISTER_CLK(
+	.hw.init = CLK_HW_INIT_PARENTS_DATA(
+		"clk_mipi1_cfg",
+		(const struct clk_parent_data[]) { { .index = 0 } },
+		&rp1_clk_ops,
+		0
+	),
+	CLK_DATA(rp1_clock_data,
+		 .num_std_parents = 0,
+		 .num_aux_parents = 1,
+		 .ctrl_reg = CLK_MIPI1_CFG_CTRL,
+		 .div_int_reg = CLK_MIPI1_CFG_DIV_INT,
+		 .sel_reg = CLK_MIPI1_CFG_SEL,
+		 .div_int_max = DIV_INT_8BIT_MAX,
+		 .max_freq = 50 * HZ_PER_MHZ,
+		 .fc0_src = FC_NUM(5, 6),
+		 .clk_src_mask = 0x1,
+	)
+);
+
+static struct rp1_clk_desc clk_adc_desc = REGISTER_CLK(
+	.hw.init = CLK_HW_INIT_PARENTS_DATA(
+		"clk_adc",
+		(const struct clk_parent_data[]) { { .index = 0 } },
+		&rp1_clk_ops,
+		0
+	),
+	CLK_DATA(rp1_clock_data,
+		 .num_std_parents = 0,
+		 .num_aux_parents = 1,
+		 .ctrl_reg = CLK_ADC_CTRL,
+		 .div_int_reg = CLK_ADC_DIV_INT,
+		 .sel_reg = CLK_ADC_SEL,
+		 .div_int_max = DIV_INT_8BIT_MAX,
+		 .max_freq = 50 * HZ_PER_MHZ,
+		 .fc0_src = FC_NUM(5, 5),
+	)
+);
+
+static struct rp1_clk_desc clk_sdio_timer_desc = REGISTER_CLK(
+	.hw.init = CLK_HW_INIT_PARENTS_DATA(
+		"clk_sdio_timer",
+		(const struct clk_parent_data[]) { { .index = 0 } },
+		&rp1_clk_ops,
+		0
+	),
+	CLK_DATA(rp1_clock_data,
+		 .num_std_parents = 0,
+		 .num_aux_parents = 1,
+		 .ctrl_reg = CLK_SDIO_TIMER_CTRL,
+		 .div_int_reg = CLK_SDIO_TIMER_DIV_INT,
+		 .sel_reg = CLK_SDIO_TIMER_SEL,
+		 .div_int_max = DIV_INT_8BIT_MAX,
+		 .max_freq = 50 * HZ_PER_MHZ,
+		 .fc0_src = FC_NUM(3, 4),
+	)
+);
+
+static struct rp1_clk_desc clk_sdio_alt_src_desc = REGISTER_CLK(
+	.hw.init = CLK_HW_INIT_PARENTS_DATA(
+		"clk_sdio_alt_src",
+		(const struct clk_parent_data[]) {
+			{ .hw = &pll_sys_desc.hw }
+		},
+		&rp1_clk_ops,
+		0
+	),
+	CLK_DATA(rp1_clock_data,
+		 .num_std_parents = 0,
+		 .num_aux_parents = 1,
+		 .ctrl_reg = CLK_SDIO_ALT_SRC_CTRL,
+		 .div_int_reg = CLK_SDIO_ALT_SRC_DIV_INT,
+		 .sel_reg = CLK_SDIO_ALT_SRC_SEL,
+		 .div_int_max = DIV_INT_8BIT_MAX,
+		 .max_freq = 200 * HZ_PER_MHZ,
+		 .fc0_src = FC_NUM(5, 4),
+	)
+);
+
+static const struct clk_parent_data clk_dpi_parents[] = {
+	{ .hw = &pll_sys_desc.hw },
+	{ .hw = &pll_video_sec_desc.hw },
+	{ .hw = &pll_video_desc.hw },
+	{ .index = -1 },
+	{ .index = -1 },
+	{ .index = -1 },
+	{ .index = -1 },
+	{ .index = -1 },
+};
+
+static struct rp1_clk_desc clk_dpi_desc = REGISTER_CLK(
+	.hw.init = CLK_HW_INIT_PARENTS_DATA(
+		"clk_dpi",
+		clk_dpi_parents,
+		&rp1_clk_ops,
+		CLK_SET_RATE_NO_REPARENT /* Let DPI driver set parent */
+	),
+	CLK_DATA(rp1_clock_data,
+		 .num_std_parents = 0,
+		 .num_aux_parents = 8,
+		 .ctrl_reg = VIDEO_CLK_DPI_CTRL,
+		 .div_int_reg = VIDEO_CLK_DPI_DIV_INT,
+		 .sel_reg = VIDEO_CLK_DPI_SEL,
+		 .div_int_max = DIV_INT_8BIT_MAX,
+		 .max_freq = 200 * HZ_PER_MHZ,
+		 .fc0_src = FC_NUM(1, 6),
+	)
+);
+
+static const struct clk_parent_data clk_gp0_parents[] = {
+	{ .index = 0 },
+	{ .index = -1 },
+	{ .index = -1 },
+	{ .index = -1 },
+	{ .index = -1 },
+	{ .index = -1 },
+	{ .hw = &pll_sys_desc.hw },
+	{ .index = -1 },
+	{ .index = -1 },
+	{ .index = -1 },
+	{ .hw = &clk_i2s_desc.hw },
+	{ .hw = &clk_adc_desc.hw },
+	{ .index = -1 },
+	{ .index = -1 },
+	{ .index = -1 },
+	{ .hw = &clk_sys_desc.hw },
+};
+
+static struct rp1_clk_desc clk_gp0_desc = REGISTER_CLK(
+	.hw.init = CLK_HW_INIT_PARENTS_DATA(
+		"clk_gp0",
+		clk_gp0_parents,
+		&rp1_clk_ops,
+		0
+	),
+	CLK_DATA(rp1_clock_data,
+		 .num_std_parents = 0,
+		 .num_aux_parents = 16,
+		 .oe_mask = BIT(0),
+		 .ctrl_reg = CLK_GP0_CTRL,
+		 .div_int_reg = CLK_GP0_DIV_INT,
+		 .div_frac_reg = CLK_GP0_DIV_FRAC,
+		 .sel_reg = CLK_GP0_SEL,
+		 .div_int_max = DIV_INT_16BIT_MAX,
+		 .max_freq = 100 * HZ_PER_MHZ,
+		 .fc0_src = FC_NUM(0, 1),
+	)
+);
+
+static const struct clk_parent_data clk_gp1_parents[] = {
+	{ .hw = &clk_sdio_timer_desc.hw },
+	{ .index = -1 },
+	{ .index = -1 },
+	{ .index = -1 },
+	{ .index = -1 },
+	{ .index = -1 },
+	{ .hw = &pll_sys_pri_ph_desc.hw },
+	{ .index = -1 },
+	{ .index = -1 },
+	{ .index = -1 },
+	{ .hw = &clk_adc_desc.hw },
+	{ .hw = &clk_dpi_desc.hw },
+	{ .hw = &clk_pwm0_desc.hw },
+	{ .index = -1 },
+	{ .index = -1 },
+	{ .index = -1 },
+};
+
+static struct rp1_clk_desc clk_gp1_desc = REGISTER_CLK(
+	.hw.init = CLK_HW_INIT_PARENTS_DATA(
+		"clk_gp1",
+		clk_gp1_parents,
+		&rp1_clk_ops,
+		0
+	),
+	CLK_DATA(rp1_clock_data,
+		 .num_std_parents = 0,
+		 .num_aux_parents = 16,
+		 .oe_mask = BIT(1),
+		 .ctrl_reg = CLK_GP1_CTRL,
+		 .div_int_reg = CLK_GP1_DIV_INT,
+		 .div_frac_reg = CLK_GP1_DIV_FRAC,
+		 .sel_reg = CLK_GP1_SEL,
+		 .div_int_max = DIV_INT_16BIT_MAX,
+		 .max_freq = 100 * HZ_PER_MHZ,
+		 .fc0_src = FC_NUM(1, 1),
+	)
+);
+
+static struct rp1_clk_desc clksrc_mipi0_dsi_byteclk_desc = REGISTER_CLK(
+	.hw.init = CLK_HW_INIT_PARENTS_DATA(
+		"clksrc_mipi0_dsi_byteclk",
+		(const struct clk_parent_data[]) { { .index = 0 } },
+		&rp1_varsrc_ops,
+		0
+	),
+	CLK_DATA(rp1_clock_data,
+		 .num_std_parents = 1,
+		 .num_aux_parents = 0,
+	)
+);
+
+static struct rp1_clk_desc clksrc_mipi1_dsi_byteclk_desc = REGISTER_CLK(
+	.hw.init = CLK_HW_INIT_PARENTS_DATA(
+		"clksrc_mipi1_dsi_byteclk",
+		(const struct clk_parent_data[]) { { .index = 0 } },
+		&rp1_varsrc_ops,
+		0
+	),
+	CLK_DATA(rp1_clock_data,
+		 .num_std_parents = 1,
+		 .num_aux_parents = 0,
+	)
+);
+
+static const struct clk_parent_data clk_mipi0_dpi_parents[] = {
+	{ .hw = &pll_sys_desc.hw },
+	{ .hw = &pll_video_sec_desc.hw },
+	{ .hw = &pll_video_desc.hw },
+	{ .hw = &clksrc_mipi0_dsi_byteclk_desc.hw },
+	{ .index = -1 },
+	{ .index = -1 },
+	{ .index = -1 },
+	{ .index = -1 },
+};
+
+static struct rp1_clk_desc clk_mipi0_dpi_desc = REGISTER_CLK(
+	.hw.init = CLK_HW_INIT_PARENTS_DATA(
+		"clk_mipi0_dpi",
+		clk_mipi0_dpi_parents,
+		&rp1_clk_ops,
+		CLK_SET_RATE_NO_REPARENT /* Let DSI driver set parent */
+	),
+	CLK_DATA(rp1_clock_data,
+		 .num_std_parents = 0,
+		 .num_aux_parents = 8,
+		 .ctrl_reg = VIDEO_CLK_MIPI0_DPI_CTRL,
+		 .div_int_reg = VIDEO_CLK_MIPI0_DPI_DIV_INT,
+		 .div_frac_reg = VIDEO_CLK_MIPI0_DPI_DIV_FRAC,
+		 .sel_reg = VIDEO_CLK_MIPI0_DPI_SEL,
+		 .div_int_max = DIV_INT_8BIT_MAX,
+		 .max_freq = 200 * HZ_PER_MHZ,
+		 .fc0_src = FC_NUM(2, 6),
+	)
+);
+
+static const struct clk_parent_data clk_mipi1_dpi_parents[] = {
+	{ .hw = &pll_sys_desc.hw },
+	{ .hw = &pll_video_sec_desc.hw },
+	{ .hw = &pll_video_desc.hw },
+	{ .hw = &clksrc_mipi1_dsi_byteclk_desc.hw },
+	{ .index = -1 },
+	{ .index = -1 },
+	{ .index = -1 },
+	{ .index = -1 },
+};
+
+static struct rp1_clk_desc clk_mipi1_dpi_desc = REGISTER_CLK(
+	.hw.init = CLK_HW_INIT_PARENTS_DATA(
+		"clk_mipi1_dpi",
+		clk_mipi1_dpi_parents,
+		&rp1_clk_ops,
+		CLK_SET_RATE_NO_REPARENT /* Let DSI driver set parent */
+	),
+	CLK_DATA(rp1_clock_data,
+		 .num_std_parents = 0,
+		 .num_aux_parents = 8,
+		 .ctrl_reg = VIDEO_CLK_MIPI1_DPI_CTRL,
+		 .div_int_reg = VIDEO_CLK_MIPI1_DPI_DIV_INT,
+		 .div_frac_reg = VIDEO_CLK_MIPI1_DPI_DIV_FRAC,
+		 .sel_reg = VIDEO_CLK_MIPI1_DPI_SEL,
+		 .div_int_max = DIV_INT_8BIT_MAX,
+		 .max_freq = 200 * HZ_PER_MHZ,
+		 .fc0_src = FC_NUM(3, 6),
+	)
+);
+
+static const struct clk_parent_data clk_gp2_parents[] = {
+	{ .hw = &clk_sdio_alt_src_desc.hw },
+	{ .index = -1 },
+	{ .index = -1 },
+	{ .index = -1 },
+	{ .index = -1 },
+	{ .index = -1 },
+	{ .hw = &pll_sys_sec_desc.hw },
+	{ .index = -1 },
+	{ .hw = &pll_video_desc.hw },
+	{ .hw = &clk_audio_in_desc.hw },
+	{ .hw = &clk_dpi_desc.hw },
+	{ .hw = &clk_pwm0_desc.hw },
+	{ .hw = &clk_pwm1_desc.hw },
+	{ .hw = &clk_mipi0_dpi_desc.hw },
+	{ .hw = &clk_mipi1_cfg_desc.hw },
+	{ .hw = &clk_sys_desc.hw },
+};
+
+static struct rp1_clk_desc clk_gp2_desc = REGISTER_CLK(
+	.hw.init = CLK_HW_INIT_PARENTS_DATA(
+		"clk_gp2",
+		clk_gp2_parents,
+		&rp1_clk_ops,
+		0
+	),
+	CLK_DATA(rp1_clock_data,
+		 .num_std_parents = 0,
+		 .num_aux_parents = 16,
+		 .oe_mask = BIT(2),
+		 .ctrl_reg = CLK_GP2_CTRL,
+		 .div_int_reg = CLK_GP2_DIV_INT,
+		 .div_frac_reg = CLK_GP2_DIV_FRAC,
+		 .sel_reg = CLK_GP2_SEL,
+		 .div_int_max = DIV_INT_16BIT_MAX,
+		 .max_freq = 100 * HZ_PER_MHZ,
+		 .fc0_src = FC_NUM(2, 1),
+	)
+);
+
+static const struct clk_parent_data clk_gp3_parents[] = {
+	{ .index = 0 },
+	{ .index = -1 },
+	{ .index = -1 },
+	{ .index = -1 },
+	{ .index = -1 },
+	{ .index = -1 },
+	{ .index = -1 },
+	{ .index = -1 },
+	{ .hw = &pll_video_pri_ph_desc.hw },
+	{ .hw = &clk_audio_out_desc.hw },
+	{ .index = -1 },
+	{ .index = -1 },
+	{ .hw = &clk_mipi1_dpi_desc.hw },
+	{ .index = -1 },
+	{ .index = -1 },
+	{ .index = -1 },
+};
+
+static struct rp1_clk_desc clk_gp3_desc = REGISTER_CLK(
+	.hw.init = CLK_HW_INIT_PARENTS_DATA(
+		"clk_gp3",
+		clk_gp3_parents,
+		&rp1_clk_ops,
+		0
+	),
+	CLK_DATA(rp1_clock_data,
+		 .num_std_parents = 0,
+		 .num_aux_parents = 16,
+		 .oe_mask = BIT(3),
+		 .ctrl_reg = CLK_GP3_CTRL,
+		 .div_int_reg = CLK_GP3_DIV_INT,
+		 .div_frac_reg = CLK_GP3_DIV_FRAC,
+		 .sel_reg = CLK_GP3_SEL,
+		 .div_int_max = DIV_INT_16BIT_MAX,
+		 .max_freq = 100 * HZ_PER_MHZ,
+		 .fc0_src = FC_NUM(3, 1),
+	)
+);
+
+static const struct clk_parent_data clk_gp4_parents[] = {
+	{ .index = 0 },
+	{ .index = -1 },
+	{ .index = -1 },
+	{ .index = -1 },
+	{ .index = -1 },
+	{ .index = -1 },
+	{ .index = -1 },
+	{ .hw = &pll_video_sec_desc.hw },
+	{ .index = -1 },
+	{ .index = -1 },
+	{ .index = -1 },
+	{ .hw = &clk_mipi0_cfg_desc.hw },
+	{ .hw = &clk_uart_desc.hw },
+	{ .index = -1 },
+	{ .index = -1 },
+	{ .hw = &clk_sys_desc.hw },
+};
+
+static struct rp1_clk_desc clk_gp4_desc = REGISTER_CLK(
+	.hw.init = CLK_HW_INIT_PARENTS_DATA(
+		"clk_gp4",
+		clk_gp4_parents,
+		&rp1_clk_ops,
+		0
+	),
+	CLK_DATA(rp1_clock_data,
+		 .num_std_parents = 0,
+		 .num_aux_parents = 16,
+		 .oe_mask = BIT(4),
+		 .ctrl_reg = CLK_GP4_CTRL,
+		 .div_int_reg = CLK_GP4_DIV_INT,
+		 .div_frac_reg = CLK_GP4_DIV_FRAC,
+		 .sel_reg = CLK_GP4_SEL,
+		 .div_int_max = DIV_INT_16BIT_MAX,
+		 .max_freq = 100 * HZ_PER_MHZ,
+		 .fc0_src = FC_NUM(4, 1),
+	)
+);
+
+static const struct clk_parent_data clk_vec_parents[] = {
+	{ .hw = &pll_sys_pri_ph_desc.hw },
+	{ .hw = &pll_video_sec_desc.hw },
+	{ .hw = &pll_video_desc.hw },
+	{ .index = -1 },
+	{ .index = -1 },
+	{ .index = -1 },
+	{ .index = -1 },
+	{ .index = -1 },
+};
+
+static struct rp1_clk_desc clk_vec_desc = REGISTER_CLK(
+	.hw.init = CLK_HW_INIT_PARENTS_DATA(
+		"clk_vec",
+		clk_vec_parents,
+		&rp1_clk_ops,
+		CLK_SET_RATE_NO_REPARENT /* Let VEC driver set parent */
+	),
+	CLK_DATA(rp1_clock_data,
+		 .num_std_parents = 0,
+		 .num_aux_parents = 8,
+		 .ctrl_reg = VIDEO_CLK_VEC_CTRL,
+		 .div_int_reg = VIDEO_CLK_VEC_DIV_INT,
+		 .sel_reg = VIDEO_CLK_VEC_SEL,
+		 .div_int_max = DIV_INT_8BIT_MAX,
+		 .max_freq = 108 * HZ_PER_MHZ,
+		 .fc0_src = FC_NUM(0, 6),
+	)
+);
+
+static const struct clk_parent_data clk_gp5_parents[] = {
+	{ .index = 0 },
+	{ .index = -1 },
+	{ .index = -1 },
+	{ .index = -1 },
+	{ .index = -1 },
+	{ .index = -1 },
+	{ .index = -1 },
+	{ .hw = &pll_video_sec_desc.hw },
+	{ .hw = &clk_eth_tsu_desc.hw },
+	{ .index = -1 },
+	{ .hw = &clk_vec_desc.hw },
+	{ .index = -1 },
+	{ .index = -1 },
+	{ .index = -1 },
+	{ .index = -1 },
+	{ .index = -1 },
+};
+
+static struct rp1_clk_desc clk_gp5_desc = REGISTER_CLK(
+	.hw.init = CLK_HW_INIT_PARENTS_DATA(
+		"clk_gp5",
+		clk_gp5_parents,
+		&rp1_clk_ops,
+		0
+	),
+	CLK_DATA(rp1_clock_data,
+		 .num_std_parents = 0,
+		 .num_aux_parents = 16,
+		 .oe_mask = BIT(5),
+		 .ctrl_reg = CLK_GP5_CTRL,
+		 .div_int_reg = CLK_GP5_DIV_INT,
+		 .div_frac_reg = CLK_GP5_DIV_FRAC,
+		 .sel_reg = CLK_GP5_SEL,
+		 .div_int_max = DIV_INT_16BIT_MAX,
+		 .max_freq = 100 * HZ_PER_MHZ,
+		 .fc0_src = FC_NUM(5, 1),
+	)
+);
+
+static struct rp1_clk_desc *const clk_desc_array[] = {
+	[RP1_PLL_SYS_CORE] = &pll_sys_core_desc,
+	[RP1_PLL_AUDIO_CORE] = &pll_audio_core_desc,
+	[RP1_PLL_VIDEO_CORE] = &pll_video_core_desc,
+	[RP1_PLL_SYS] = &pll_sys_desc,
+	[RP1_CLK_ETH_TSU] = &clk_eth_tsu_desc,
+	[RP1_CLK_ETH] = &clk_eth_desc,
+	[RP1_CLK_SYS] = &clk_sys_desc,
+	[RP1_PLL_SYS_PRI_PH] = &pll_sys_pri_ph_desc,
+	[RP1_PLL_SYS_SEC] = &pll_sys_sec_desc,
+	[RP1_PLL_AUDIO] = &pll_audio_desc,
+	[RP1_PLL_VIDEO] = &pll_video_desc,
+	[RP1_PLL_AUDIO_PRI_PH] = &pll_audio_pri_ph_desc,
+	[RP1_PLL_VIDEO_PRI_PH] = &pll_video_pri_ph_desc,
+	[RP1_PLL_AUDIO_SEC] = &pll_audio_sec_desc,
+	[RP1_PLL_VIDEO_SEC] = &pll_video_sec_desc,
+	[RP1_PLL_AUDIO_TERN] = &pll_audio_tern_desc,
+	[RP1_CLK_SLOW_SYS] = &clk_slow_sys_desc,
+	[RP1_CLK_DMA] = &clk_dma_desc,
+	[RP1_CLK_UART] = &clk_uart_desc,
+	[RP1_CLK_PWM0] = &clk_pwm0_desc,
+	[RP1_CLK_PWM1] = &clk_pwm1_desc,
+	[RP1_CLK_AUDIO_IN] = &clk_audio_in_desc,
+	[RP1_CLK_AUDIO_OUT] = &clk_audio_out_desc,
+	[RP1_CLK_I2S] = &clk_i2s_desc,
+	[RP1_CLK_MIPI0_CFG] = &clk_mipi0_cfg_desc,
+	[RP1_CLK_MIPI1_CFG] = &clk_mipi1_cfg_desc,
+	[RP1_CLK_ADC] = &clk_adc_desc,
+	[RP1_CLK_SDIO_TIMER] = &clk_sdio_timer_desc,
+	[RP1_CLK_SDIO_ALT_SRC] = &clk_sdio_alt_src_desc,
+	[RP1_CLK_GP0] = &clk_gp0_desc,
+	[RP1_CLK_GP1] = &clk_gp1_desc,
+	[RP1_CLK_GP2] = &clk_gp2_desc,
+	[RP1_CLK_GP3] = &clk_gp3_desc,
+	[RP1_CLK_GP4] = &clk_gp4_desc,
+	[RP1_CLK_GP5] = &clk_gp5_desc,
+	[RP1_CLK_VEC] = &clk_vec_desc,
+	[RP1_CLK_DPI] = &clk_dpi_desc,
+	[RP1_CLK_MIPI0_DPI] = &clk_mipi0_dpi_desc,
+	[RP1_CLK_MIPI1_DPI] = &clk_mipi1_dpi_desc,
+	[RP1_CLK_MIPI0_DSI_BYTECLOCK] = &clksrc_mipi0_dsi_byteclk_desc,
+	[RP1_CLK_MIPI1_DSI_BYTECLOCK] = &clksrc_mipi1_dsi_byteclk_desc,
+};
+
+static const struct regmap_range rp1_reg_ranges[] = {
+	regmap_reg_range(PLL_SYS_CS, PLL_SYS_SEC),
+	regmap_reg_range(PLL_AUDIO_CS, PLL_AUDIO_TERN),
+	regmap_reg_range(PLL_VIDEO_CS, PLL_VIDEO_SEC),
+	regmap_reg_range(GPCLK_OE_CTRL, GPCLK_OE_CTRL),
+	regmap_reg_range(CLK_SYS_CTRL, CLK_SYS_DIV_INT),
+	regmap_reg_range(CLK_SYS_SEL, CLK_SYS_SEL),
+	regmap_reg_range(CLK_SLOW_SYS_CTRL, CLK_SLOW_SYS_DIV_INT),
+	regmap_reg_range(CLK_SLOW_SYS_SEL, CLK_SLOW_SYS_SEL),
+	regmap_reg_range(CLK_DMA_CTRL, CLK_DMA_DIV_INT),
+	regmap_reg_range(CLK_DMA_SEL, CLK_DMA_SEL),
+	regmap_reg_range(CLK_UART_CTRL, CLK_UART_DIV_INT),
+	regmap_reg_range(CLK_UART_SEL, CLK_UART_SEL),
+	regmap_reg_range(CLK_ETH_CTRL, CLK_ETH_DIV_INT),
+	regmap_reg_range(CLK_ETH_SEL, CLK_ETH_SEL),
+	regmap_reg_range(CLK_PWM0_CTRL, CLK_PWM0_SEL),
+	regmap_reg_range(CLK_PWM1_CTRL, CLK_PWM1_SEL),
+	regmap_reg_range(CLK_AUDIO_IN_CTRL, CLK_AUDIO_IN_DIV_INT),
+	regmap_reg_range(CLK_AUDIO_IN_SEL, CLK_AUDIO_IN_SEL),
+	regmap_reg_range(CLK_AUDIO_OUT_CTRL, CLK_AUDIO_OUT_DIV_INT),
+	regmap_reg_range(CLK_AUDIO_OUT_SEL, CLK_AUDIO_OUT_SEL),
+	regmap_reg_range(CLK_I2S_CTRL, CLK_I2S_DIV_INT),
+	regmap_reg_range(CLK_I2S_SEL, CLK_I2S_SEL),
+	regmap_reg_range(CLK_MIPI0_CFG_CTRL, CLK_MIPI0_CFG_DIV_INT),
+	regmap_reg_range(CLK_MIPI0_CFG_SEL, CLK_MIPI0_CFG_SEL),
+	regmap_reg_range(CLK_MIPI1_CFG_CTRL, CLK_MIPI1_CFG_DIV_INT),
+	regmap_reg_range(CLK_MIPI1_CFG_SEL, CLK_MIPI1_CFG_SEL),
+	regmap_reg_range(CLK_PCIE_AUX_CTRL, CLK_PCIE_AUX_DIV_INT),
+	regmap_reg_range(CLK_PCIE_AUX_SEL, CLK_PCIE_AUX_SEL),
+	regmap_reg_range(CLK_USBH0_MICROFRAME_CTRL, CLK_USBH0_MICROFRAME_DIV_INT),
+	regmap_reg_range(CLK_USBH0_MICROFRAME_SEL, CLK_USBH0_MICROFRAME_SEL),
+	regmap_reg_range(CLK_USBH1_MICROFRAME_CTRL, CLK_USBH1_MICROFRAME_DIV_INT),
+	regmap_reg_range(CLK_USBH1_MICROFRAME_SEL, CLK_USBH1_MICROFRAME_SEL),
+	regmap_reg_range(CLK_USBH0_SUSPEND_CTRL, CLK_USBH0_SUSPEND_DIV_INT),
+	regmap_reg_range(CLK_USBH0_SUSPEND_SEL, CLK_USBH0_SUSPEND_SEL),
+	regmap_reg_range(CLK_USBH1_SUSPEND_CTRL, CLK_USBH1_SUSPEND_DIV_INT),
+	regmap_reg_range(CLK_USBH1_SUSPEND_SEL, CLK_USBH1_SUSPEND_SEL),
+	regmap_reg_range(CLK_ETH_TSU_CTRL, CLK_ETH_TSU_DIV_INT),
+	regmap_reg_range(CLK_ETH_TSU_SEL, CLK_ETH_TSU_SEL),
+	regmap_reg_range(CLK_ADC_CTRL, CLK_ADC_DIV_INT),
+	regmap_reg_range(CLK_ADC_SEL, CLK_ADC_SEL),
+	regmap_reg_range(CLK_SDIO_TIMER_CTRL, CLK_SDIO_TIMER_DIV_INT),
+	regmap_reg_range(CLK_SDIO_TIMER_SEL, CLK_SDIO_TIMER_SEL),
+	regmap_reg_range(CLK_SDIO_ALT_SRC_CTRL, CLK_SDIO_ALT_SRC_DIV_INT),
+	regmap_reg_range(CLK_SDIO_ALT_SRC_SEL, CLK_SDIO_ALT_SRC_SEL),
+	regmap_reg_range(CLK_GP0_CTRL, CLK_GP0_SEL),
+	regmap_reg_range(CLK_GP1_CTRL, CLK_GP1_SEL),
+	regmap_reg_range(CLK_GP2_CTRL, CLK_GP2_SEL),
+	regmap_reg_range(CLK_GP3_CTRL, CLK_GP3_SEL),
+	regmap_reg_range(CLK_GP4_CTRL, CLK_GP4_SEL),
+	regmap_reg_range(CLK_GP5_CTRL, CLK_GP5_SEL),
+	regmap_reg_range(CLK_SYS_RESUS_CTRL, CLK_SYS_RESUS_CTRL),
+	regmap_reg_range(CLK_SLOW_SYS_RESUS_CTRL, CLK_SLOW_SYS_RESUS_CTRL),
+	regmap_reg_range(FC0_REF_KHZ, FC0_RESULT),
+	regmap_reg_range(VIDEO_CLK_VEC_CTRL, VIDEO_CLK_VEC_DIV_INT),
+	regmap_reg_range(VIDEO_CLK_VEC_SEL, VIDEO_CLK_DPI_DIV_INT),
+	regmap_reg_range(VIDEO_CLK_DPI_SEL, VIDEO_CLK_MIPI1_DPI_SEL),
+};
+
+static const struct regmap_access_table rp1_reg_table = {
+	.yes_ranges = rp1_reg_ranges,
+	.n_yes_ranges = ARRAY_SIZE(rp1_reg_ranges),
+};
+
+static const struct regmap_config rp1_clk_regmap_cfg = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.max_register = PLL_VIDEO_SEC,
+	.name = "rp1-clk",
+	.rd_table = &rp1_reg_table,
+	.disable_locking = true,
+};
+
+static int rp1_clk_probe(struct platform_device *pdev)
+{
+	const size_t asize = ARRAY_SIZE(clk_desc_array);
+	struct rp1_clk_desc *desc;
+	struct device *dev = &pdev->dev;
+	struct rp1_clockman *clockman;
+	struct clk_hw **hws;
+	unsigned int i;
+
+	clockman = devm_kzalloc(dev, struct_size(clockman, onecell.hws, asize),
+				GFP_KERNEL);
+	if (!clockman)
+		return -ENOMEM;
+
+	spin_lock_init(&clockman->regs_lock);
+	clockman->dev = dev;
+
+	clockman->regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(clockman->regs))
+		return PTR_ERR(clockman->regs);
+
+	clockman->regmap = devm_regmap_init_mmio(dev, clockman->regs,
+						 &rp1_clk_regmap_cfg);
+	if (IS_ERR(clockman->regmap)) {
+		dev_err_probe(dev, PTR_ERR(clockman->regmap),
+			      "could not init clock regmap\n");
+		return PTR_ERR(clockman->regmap);
+	}
+
+	clockman->onecell.num = asize;
 	hws = clockman->onecell.hws;
 
 	for (i = 0; i < asize; i++) {
@@ -1466,6 +2421,11 @@ static int rp1_clk_probe(struct platform_device *pdev)
 			hws[i] = desc->clk_register(clockman, desc);
 	}
 
+	clk_audio_core = &pll_audio_core_desc;
+	clk_audio = &pll_audio_desc;
+	clk_i2s = &clk_i2s_desc;
+	clk_xosc = clk_hw_get_parent_by_index(&clk_i2s->hw, 0);
+
 	platform_set_drvdata(pdev, clockman);
 
 	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
-- 
2.35.3


