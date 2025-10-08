Return-Path: <linux-gpio+bounces-26888-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F5BBC39C8
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Oct 2025 09:33:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EAA1C1896A9B
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Oct 2025 07:33:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6F362F49FC;
	Wed,  8 Oct 2025 07:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RCDNthrh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633612F3619
	for <linux-gpio@vger.kernel.org>; Wed,  8 Oct 2025 07:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759908686; cv=none; b=Wp2ryd12J/yezYIPujrWANiZW0Ofp90ZgqCY2QRQYHI1sBqygQqdbBT/BSQ/bIizQJZut0/30DKoVPbd6kSxwHuwQj5k2XulE2Koy79lVmyaFP4UUyr9G2v/Ytn9WKJ+e/5z7jKrX7ZjnbInMfptCo1qSUPzsYMB0eMJDCtTQLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759908686; c=relaxed/simple;
	bh=FZOaPk/XiWFhkp3zMB+0dvCF3erehg3z6+zK/HzLAY4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ko7MCO0mU5aevVrfuFD6WjXhtUQ+OrewZIaMTrzkqoQYGVrgcabGrA6IRjpEZLGjSpl0FPhHap3Itqabr5A8ubSBXJGCJSzrW2UP6ddCqIlLGBEum7NyM4jy5NY1oGcVz29GGwCmO9ZteAvVWo+6HnBTQKkEUXQk5wULsu1Lu14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RCDNthrh; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-57bd482dfd2so7919961e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 08 Oct 2025 00:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759908680; x=1760513480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pg0HJx9UF6cc43KSohy1sFUTcyD1/BLQvc4mTLXMxcE=;
        b=RCDNthrhFlXsgMk3134FDx+iXKCyoN39hMjleI/5NaT/y5e6Q3+updLPXeIT4sTUl/
         R/Khj7zzgBcYVUCe1WMlu2jJATQC7KAyUhF7g7e4tR7T3kCuwaf70+Zd8bl3Hu38z0ih
         l+5xoL5IFenfk8m6w3I1KY6E7vF2I7DcV37xxdLFVz7SoJln68cWNma79tO01bVTqaNC
         rYx9Xvty8XIN/Rp2rdhfg7lhKErWeS+wZHpTmJpJqw2YlMUHwdVrysTQj1uhoWjh2PKg
         drXCowy9avKra/UyzvjHNy+EvCQgRe5TfMgY64Uilzz9TBGWVPIjJz1I2WlRJL41+frF
         Qwkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759908680; x=1760513480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pg0HJx9UF6cc43KSohy1sFUTcyD1/BLQvc4mTLXMxcE=;
        b=d3H01zodWQBdjK2S47skLYmasrKo1/f9ESBLIwK53jXE+RTtFKrPUEkfm1Fud1jxW5
         yPy8XaAFepEaudFP04Jgeu5sKTcrngISZ/O5guk5OnkVHlUpgJ19+8QR+j9aHdq++uEN
         OYs1OWTlR6Bobf0bqwb5GN61OywmsBxGdWyl7vNX6lXcJIj+yhJHOZS91nitiT4IdNxA
         L0b65dK70bPSe0nR3HjmmrrRZcYAEeAPwesuUvEDCh0vkYivA0j+F6xi9/xrPkKr42Vs
         x6Hg8IEP9klC/mKYXCQnGvolEroH7PazhVaBEuwsrvIzYnu6OooUIOLfT9hdOOWsFJSg
         UtUQ==
X-Forwarded-Encrypted: i=1; AJvYcCW51ESVWTDo/4H5VPg6Kumr+zmGD6sSC8vM5Rcqp8d5gH4k8vbEVXnu9GGAKk1xbgLX9spOJVp1ZNxW@vger.kernel.org
X-Gm-Message-State: AOJu0YzWR3b4qhUmmn8RIXBrA0XgMzapY/0c3YxGrS1xQNkKkUOHTnH+
	holwH5qAfIRmz7ps1TNIJ+H5GCYAcZdJPfYvdTZGdvRcxpxz7fBtZMSU
X-Gm-Gg: ASbGncttkjvO9EkK+SlZMu3VZgUlFBhIe/4ZY/nBgg75U/3l4PLjq7GNr94tTIjrKbU
	Odg2os+0LRedkU/UqtbZkYV+WVgi0eKGNTEnAD6zQ1sQhUqCz1to99nwsMQqS7Os+BzCwpOncnR
	vRKz3T0qn/NwSWWuS2mhi+zvNrNJsbWUIsGPU49VY+VAhJW9g3H96mmzAvmjAPQbjrBNDbSqFLA
	Xs9KJ4LFsJmRgwzMVSinpEjnIvIkS0TT3r0k7KuyU/LP74XssHy3DBekVYD5V9WPwLLlDkKphO+
	JenVROlTS5/QymE5CCB+OJewkXxYijP5HlphG060yA3TzD0GIxpkMrDx9GB5FjEbFrcptu/bUga
	vYX94QVuCxWv3RcxhoyMNScwAKGsZoknPhGs7MfKRKDm0mGJ8
X-Google-Smtp-Source: AGHT+IEZP4fCBr+12IlYOXrH9a+CoFe5hewGhtwyyj6VYBFCCNVd4VpYfDkKVBWv8lYOk7dl7gjLUg==
X-Received: by 2002:a05:6512:2312:b0:590:6598:4edf with SMTP id 2adb3069b0e04-5906d9e92camr655190e87.47.1759908680085;
        Wed, 08 Oct 2025 00:31:20 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0118d22bsm6911016e87.85.2025.10.08.00.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 00:31:19 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Aaron Kling <webgeek1234@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v4 04/24] clk: tegra30: add CSI pad clock gates
Date: Wed,  8 Oct 2025 10:30:26 +0300
Message-ID: <20251008073046.23231-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251008073046.23231-1-clamor95@gmail.com>
References: <20251008073046.23231-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tegra30 has CSI pad bits in both PLLD and PLLD2 clocks that are required
for the correct work of the CSI block. Add CSI pad A and pad B clock gates
with PLLD/PLLD2 parents, respectively. Add a plld2 spinlock, like one plld
uses, to prevent simultaneous access since both the PLLDx and CSIx_PAD
clocks use the same registers

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/clk/tegra/clk-tegra30.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
index ca738bc64615..61fe527ee6c1 100644
--- a/drivers/clk/tegra/clk-tegra30.c
+++ b/drivers/clk/tegra/clk-tegra30.c
@@ -154,6 +154,7 @@ static unsigned long input_freq;
 
 static DEFINE_SPINLOCK(cml_lock);
 static DEFINE_SPINLOCK(pll_d_lock);
+static DEFINE_SPINLOCK(pll_d2_lock);
 
 #define TEGRA_INIT_DATA_MUX(_name, _parents, _offset,	\
 			    _clk_num, _gate_flags, _clk_id)	\
@@ -859,7 +860,7 @@ static void __init tegra30_pll_init(void)
 
 	/* PLLD2 */
 	clk = tegra_clk_register_pll("pll_d2", "pll_ref", clk_base, pmc_base, 0,
-			    &pll_d2_params, NULL);
+			    &pll_d2_params, &pll_d2_lock);
 	clks[TEGRA30_CLK_PLL_D2] = clk;
 
 	/* PLLD2_OUT0 */
@@ -1008,6 +1009,16 @@ static void __init tegra30_periph_clk_init(void)
 				    0, 48, periph_clk_enb_refcnt);
 	clks[TEGRA30_CLK_DSIA] = clk;
 
+	/* csia_pad */
+	clk = clk_register_gate(NULL, "csia_pad", "pll_d", CLK_SET_RATE_PARENT,
+				clk_base + PLLD_BASE, 26, 0, &pll_d_lock);
+	clks[TEGRA30_CLK_CSIA_PAD] = clk;
+
+	/* csib_pad */
+	clk = clk_register_gate(NULL, "csib_pad", "pll_d2", CLK_SET_RATE_PARENT,
+				clk_base + PLLD2_BASE, 26, 0, &pll_d2_lock);
+	clks[TEGRA30_CLK_CSIB_PAD] = clk;
+
 	/* csus */
 	clk = tegra_clk_register_periph_gate("csus", "vi_sensor", 0,
 					     clk_base, 0, TEGRA30_CLK_CSUS,
-- 
2.48.1


