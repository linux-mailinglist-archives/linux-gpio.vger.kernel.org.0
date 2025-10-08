Return-Path: <linux-gpio+bounces-26885-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E6009BC3968
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Oct 2025 09:31:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 502C918969B9
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Oct 2025 07:32:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B7832F3601;
	Wed,  8 Oct 2025 07:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mjEkU1lj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815FE2E7F39
	for <linux-gpio@vger.kernel.org>; Wed,  8 Oct 2025 07:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759908681; cv=none; b=duyuLuKLzYVme1b+T58O7bVAXujeyN3os+F1oUuhpN2ogMf+vFabnZapNw22Bkf0rwo9uo6qe7Z8N08JE9fJowd8ds9uExhu5+LYCKbXCiIE9jel7UuYdls26Ke7l2M0xkYqN2B0Zy4H3vi+WMx1jPOYPZsueFzv98vxRTWXSr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759908681; c=relaxed/simple;
	bh=Xtlv0T4/g1zHgGtcSEMBQYBsYKA6gFss+0qpYkk7s1I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wdi7EmwI6mpCpjdnkuhFmCIa2zUQuezNywFKrUuddKYT1W3Hi5Yh1Q2R4vvcY5XRNuosiuDex2j2AH5ECde2p9DWclzEhwgrVzN451xr0ogVDKCETJlR6xz7FTAKPqUpg0csZOf1JPjiW8WUllzLALVUjg6dxkzl7R5OnMx2qhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mjEkU1lj; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-586883eb9fbso2494569e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 08 Oct 2025 00:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759908675; x=1760513475; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nuOpi1X4QZYIfmoXv6VRwrkZ+36+Rr3x/0SmX/s0qO4=;
        b=mjEkU1ljzoPAd5xRdZag34mPgwvF8Q2NtMAG1qV19a5hFAf+YiZwvyXi7jRJoXLzxh
         bEzzsGAimhBESYTA7IITen3/4HTmceQKC06Xo29PgHlGGtrlhJBlg++DctAGKo+MyNHz
         EjJLyMOsJYMu1ZkbXHOCGGCfdUy2/4biGo/dQ8Dy9vQoYDr4ejQi2Qbc/QyCrj/ClpHF
         i2te2dx53EtOkHm/CvFDrM9UiphHML5SZ7Osxpyuzg2fUjhiKUcAufoT6ay3/vQ55CG3
         wp8XMry8EGMvtJbScit47AuRA2Rj1elgN6mp8AGk3rmKZR4MA4fNlLF3AA//1twyJ3bQ
         R4PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759908675; x=1760513475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nuOpi1X4QZYIfmoXv6VRwrkZ+36+Rr3x/0SmX/s0qO4=;
        b=TiAkDpAz38xfKJ1T2yFIFSIi99tf6W4FhHXQJC1WESw6JTiBFCyFJAUnypgmr3pKzn
         gowB7UdFC+FevCb8rCX9utM5yKUNuXso9NiWzRWMrlYbtPkqzMcOm+Nbf/xM/eGC5V2F
         kpdVkA3AZ3etpxrwZtG/jOBS/pNdxLPeKWnX+hw7HxJfW55pUnp459sA/zxgx5XZWZJ/
         U0Q8g4gW1LmE5kGDcnE2KCg7GvbHnoW8mNlDmLgSzS8YR/R7ZpCjlSQe71zGm3sE4o8m
         ss66LTFhntrk1TdfKMhZNV2GIRta59i0R+mply3Q4VWY2chO34Bo+lcLs1bnJciTi+yQ
         p+Cg==
X-Forwarded-Encrypted: i=1; AJvYcCVtVNIyJg3NHMcStS31GvJS9eQQyrSBVDiAslB8RBVR4Ll2cN3WMpwFL8sQaFT/icyoQ5K+ff0NSq0t@vger.kernel.org
X-Gm-Message-State: AOJu0YxVundzJ6XL8oO6CI79o7VngzUXDS5ozhptTpvewxt0YqpZpih9
	y148ImdnQQuiCauPgq0MHSFLyy1Lk2zNG+0PxON9PRDMuWcbBVGPSBUU
X-Gm-Gg: ASbGncv8Q0og7cZsHI9fQW3c/kaX/hCQuipBMQdEvYlelXD7MMiNJ6DsbdRtAh+H/l+
	Hu7A1sVY+bDDxifQ9jr9haBHR+Sq4vFFYSVSAeHMhggCVOpmeDy75Uvl9mK9s6y13An0V7JKnBE
	1nm7pX2d4YSqZb8cG1CwSZAv7S5mEtVI2wp/81xr+litHeTRRGzzgGCxubr9kXbH5KANu710o2h
	cl5olvpUvwHLb6weBDp4nUPq0f7m83/mf6QzqE1q9PiLgZg7y0xplUOKgr0vjBd/l9GOAa5TInZ
	UCrM1ftfFX315Q/iWLgDh+t+WH52LqB8ZhrNmfbvV0Xfi4m/IvZsEpky+MBRqMna1OlXAIqehXq
	NOiPBUL+FFaXQpAIy+CxmqzOsFpd+aZKvuu4wiQ==
X-Google-Smtp-Source: AGHT+IH4w5wUowLiJI7hgdEtUtkCn/YDDLljjRvew5jTKIWe64MrO+dc17yhYkOKlcC57NaNakIcLQ==
X-Received: by 2002:a05:6512:4028:b0:57d:b8a1:832b with SMTP id 2adb3069b0e04-5906d89edbdmr712455e87.24.1759908675110;
        Wed, 08 Oct 2025 00:31:15 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0118d22bsm6911016e87.85.2025.10.08.00.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 00:31:14 -0700 (PDT)
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
Subject: [PATCH v4 01/24] pinctrl: tegra20: register csus_mux clock
Date: Wed,  8 Oct 2025 10:30:23 +0300
Message-ID: <20251008073046.23231-2-clamor95@gmail.com>
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

Add csus_mux for further use as the csus clock parent, similar to how the
cdev1 and cdev2 muxes are utilized. Additionally, constify the cdev parent
name lists to resolve checkpatch warnings.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/pinctrl/tegra/pinctrl-tegra20.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/tegra/pinctrl-tegra20.c b/drivers/pinctrl/tegra/pinctrl-tegra20.c
index 737fc2000f66..1a1758fd7def 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra20.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra20.c
@@ -2222,14 +2222,18 @@ static const struct tegra_pinctrl_soc_data tegra20_pinctrl = {
 	.drvtype_in_mux = false,
 };
 
-static const char *cdev1_parents[] = {
+static const char * const cdev1_parents[] = {
 	"dev1_osc_div", "pll_a_out0", "pll_m_out1", "audio",
 };
 
-static const char *cdev2_parents[] = {
+static const char * const cdev2_parents[] = {
 	"dev2_osc_div", "hclk", "pclk", "pll_p_out4",
 };
 
+static const char * const csus_parents[] = {
+	"pll_c_out1", "pll_p_out2", "pll_p_out3", "vi_sensor",
+};
+
 static void tegra20_pinctrl_register_clock_muxes(struct platform_device *pdev)
 {
 	struct tegra_pmx *pmx = platform_get_drvdata(pdev);
@@ -2239,6 +2243,9 @@ static void tegra20_pinctrl_register_clock_muxes(struct platform_device *pdev)
 
 	clk_register_mux(NULL, "cdev2_mux", cdev2_parents, 4, 0,
 			 pmx->regs[1] + 0x8, 4, 2, CLK_MUX_READ_ONLY, NULL);
+
+	clk_register_mux(NULL, "csus_mux", csus_parents, 4, 0,
+			 pmx->regs[1] + 0x8, 6, 2, CLK_MUX_READ_ONLY, NULL);
 }
 
 static int tegra20_pinctrl_probe(struct platform_device *pdev)
-- 
2.48.1


