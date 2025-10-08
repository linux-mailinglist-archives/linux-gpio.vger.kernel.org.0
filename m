Return-Path: <linux-gpio+bounces-26898-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A9EBC3A1F
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Oct 2025 09:34:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 119E13B98C3
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Oct 2025 07:34:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 115632F7445;
	Wed,  8 Oct 2025 07:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ectvjZni"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51262F7AA6
	for <linux-gpio@vger.kernel.org>; Wed,  8 Oct 2025 07:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759908703; cv=none; b=m70T1pUDz9jXjKmQwQoTkLmsOLb39rLe/22EU+FpGY33AfDs8Uzp2FDEuJhl63TQE4eiL9/3hWB6tmxaYfhKRQMNJYPCDmuEPGSPDI1Go9M4gRwo97IqADclv4fRGcV3jGapWAXBrV+uXiqBwd5vmpuLPraLa+zUqLGBqwzxiis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759908703; c=relaxed/simple;
	bh=r7b9miz+zGlUHxIqeITYi2Gi+cySbUCD1AnY1/8Oj/g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T3dRhi4jCFst64JSjM7l57nUpWJHPzqYjiaPfDyE34FjFVgw1oDElwRziJ4zPP9nPNtUO1I/tVmyDAPFU3PE/7BojVkygOYImIMHMSNb6EVTddp+3amiodJqEbaHnddh5bpll7yRJloCo6WZIYhZ14NFElWPYjRc8PV3oEEqEFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ectvjZni; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-57933d3e498so9758046e87.3
        for <linux-gpio@vger.kernel.org>; Wed, 08 Oct 2025 00:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759908697; x=1760513497; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WXtaPkh3GXutadYrt9/amMN99qvUxpYxHtsBwRH0BwI=;
        b=ectvjZniNBnhT5DnLSpNzu2/yyZUGH4x1NJpun4RBY20zR01dI2K7u6ermdYckI/wk
         rYw5LaxAH6MXNgla5ggqueDGY13PVw3Q8j9JblrLiz3eDxmIws1G6f48rgmAjbgZJKBT
         RR21vzwQpmYU+8rewQCRyicae8/IcBdI96JmwOr+uAJnQ9Z37J4nH7jQjyqHPc7VpRo/
         Vo2VGDH4VjVegd4OeifsPcvEwKeg3n0BjdWNAPqAZYoqC3N1mMTgLbVCTvhcbxpxh6bY
         0LhVCZNCwsH/T9qDcdGcLZfqXZeiqG7YFaOIP6ylxTXnQ5DeKJT/nkFuuUuD9d3ELiO8
         +bCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759908697; x=1760513497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WXtaPkh3GXutadYrt9/amMN99qvUxpYxHtsBwRH0BwI=;
        b=NBnRrTAJjx4VlC6mQESUWnnF5wQt5C50Y1F+Cg8x+iJhF0woXSqRi3roTniQ/P5F1s
         IeG+EudmLrjbbpUoIJz439Z83COBLRo7Mry7HvO1I8xUT0fnH3nPYxBVetmRUxGUji7M
         xcZUcfMv7S/sN3IMoZrZ0RCUDpaRzispIsR6FaZxzs66m6+cNfdo8/hI0w2JofL4Jfn/
         CwPHO27RREXvBcux4bxwGRJf2WMgX23k0DL12Q3HqAlax94M2B3P/FURbFV6/1URUJKZ
         mGLnzxUKv033CIfAjHz7frti8E+fwUwqR/svg4T3xbReyzYjexIjHqyhhC8Nw1rt08RJ
         tdPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMyR8FMMiEt+Bdh2/BfRPBuu9ORdojHgMXwaGroY4f6WRqfLJv2CcTv2vs4ihDty83P6cAsrjBYHuL@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt97gDEXCwFRSFfN7Kx0SB6Wdy+AIA+28/QBmc06QaSQ60R4be
	vh29qeRBTcdKMIaa7XSbpjCmX+fBD9Gk1XdZUW38JE3bx6o2vbOZlVGP
X-Gm-Gg: ASbGnctA/krdUfL914xIrfyVlYS5WJv/Kf4ArYjcRFTE44Cs9R8rw/ikHWUQgntIZ4M
	lz7M0md4IxVerQR7C5ZrClJhXR/kXWi3/PjBtOk5BM+DB0/Ntvrd158p7btDiYouth0LQxHF4ua
	oi34MJm0Z14ufl6ptF8vgeOKO68uLRWCcnApymD2yTizA8QvZjx5T+4Guk+P/ZJtI7ABAoyXEfk
	s19SyCyFmC8xwhBQAn9uPaUsnURyHi0iAAgglQarTi+ATjRNiJJuWk7j9zR6gE0IJHf+DWFoURk
	KthdHW9ABOLkUdPC8pP+AREG7Ul/5GSx0bLK9kSGx9cs9BxsMo3qT4GtfbJFDqIVn/0ZvtJkEO0
	GkSCYOoudrUkRWafF/1G5IubygRBEHPhr1XM9xQ==
X-Google-Smtp-Source: AGHT+IEjBzSywNMkFOAbwPQ/jDGY7x/5cVSXXn3BDGuPeQ0omEve1y2ZqSoYQ22QYGSRP1UJUPETlA==
X-Received: by 2002:a05:6512:230c:b0:58b:5f:d97 with SMTP id 2adb3069b0e04-5906d896c1dmr693727e87.2.1759908697218;
        Wed, 08 Oct 2025 00:31:37 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0118d22bsm6911016e87.85.2025.10.08.00.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 00:31:36 -0700 (PDT)
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
Subject: [PATCH v4 14/24] arm64: tegra: move avdd-dsi-csi-supply into CSI node
Date: Wed,  8 Oct 2025 10:30:36 +0300
Message-ID: <20251008073046.23231-15-clamor95@gmail.com>
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

avdd-dsi-csi-supply belongs in CSI node, not VI.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi     | 4 ++--
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
index 584461f3a619..4a64fe510f03 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
@@ -20,10 +20,10 @@ dpaux@54040000 {
 		vi@54080000 {
 			status = "okay";
 
-			avdd-dsi-csi-supply = <&vdd_dsi_csi>;
-
 			csi@838 {
 				status = "okay";
+
+				avdd-dsi-csi-supply = <&vdd_dsi_csi>;
 			};
 		};
 
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
index ec0e84cb83ef..f1d2606d9808 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
@@ -64,10 +64,10 @@ dpaux@54040000 {
 		vi@54080000 {
 			status = "okay";
 
-			avdd-dsi-csi-supply = <&vdd_sys_1v2>;
-
 			csi@838 {
 				status = "okay";
+
+				avdd-dsi-csi-supply = <&vdd_sys_1v2>;
 			};
 		};
 
-- 
2.48.1


