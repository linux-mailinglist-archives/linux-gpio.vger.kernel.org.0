Return-Path: <linux-gpio+bounces-1238-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D6DE580D14D
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Dec 2023 17:24:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4ACE3B20E71
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Dec 2023 16:24:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9EBF4CE02;
	Mon, 11 Dec 2023 16:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m4vgSQGe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4514BF
	for <linux-gpio@vger.kernel.org>; Mon, 11 Dec 2023 08:24:23 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3332ad5b3e3so4296998f8f.2
        for <linux-gpio@vger.kernel.org>; Mon, 11 Dec 2023 08:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702311862; x=1702916662; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hQPIOyly9641OrdXHkOPcPcAmQwPRSSA0bPgx/zsgMI=;
        b=m4vgSQGe2tE0FLq9k1KMhxD2XCUZSYDDmNloyWZ6SqAJ0sVnnpmR2sv8xxiR9G58i0
         np/kV0Jb3rYOi8lrl3XbqsY8X/rEJCEWbNb6l+hn4MtuygEHltGzSwmb8V2AS+pJgVBP
         sgVsP26nn5bmv/hllVG0IZyPe4/D1scC8Nk+wTNRdb8o3JrUMYLXy76SPVVJ/N4trV05
         WNhEmELqQ7pSRZx/TOGIhgYTlKZttyZ5vIkcPiqpfdILxWILOJogGRQQPoJI7mKuyA8y
         NkR+H1OaCxVTjzvnKrCX+owTHRVMsTM0FIDb55SnrVjr2ea0sxoLg8DPmmp1DSbX6TIb
         VIOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702311862; x=1702916662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hQPIOyly9641OrdXHkOPcPcAmQwPRSSA0bPgx/zsgMI=;
        b=YC6ZXMXXx5TYFtAyAegwAH7kdMD02bkOmMnpl078WLzzcmXH/OXW/RG1bjAhjvdCU0
         ejfeKRPCF6NdLeEJbz5g1Eu7lGeRBMxzo3mzieT7CmyvjfIMQr2NyN85cj0GMvoplwve
         c61WdNl9HR4cQUqStW0SxVcTtO3IEUvKGWDivqyeZzndbWyojjereEGqnHcdKxC1H3Kw
         SMZ+EFp+qdzHLnN+iI2k69B26qW/L9J4kdrthcql2ABsWND8BHIM0vyFZa0IkWiQ6Ctf
         7RBAU+i3fYBtO1Ts5fAaFZgoKDS1+YN5RrEoY7HCLMT2Z3HHEbmSpJX9ggaj+BfzCDJJ
         iMlA==
X-Gm-Message-State: AOJu0YwsosbSIxBS1uWErSPz7nKur6SvyFFk3sA9ZJtuDpkUbN0V5XfI
	OxdNDffPJ9FdyXvMUn3enZa2FA==
X-Google-Smtp-Source: AGHT+IECYVHv5RZtSjoDiBRgYPkvjNYuR3gCGpIEdFoqqtA2X5yHYnW7XskUCYhupBxe45uFrhUoug==
X-Received: by 2002:a05:6000:136d:b0:333:3be1:84f7 with SMTP id q13-20020a056000136d00b003333be184f7mr3055096wrz.92.1702311862388;
        Mon, 11 Dec 2023 08:24:22 -0800 (PST)
Received: from gpeter-l.lan (host-92-29-28-58.as13285.net. [92.29.28.58])
        by smtp.gmail.com with ESMTPSA id o4-20020a5d58c4000000b0033333bee379sm8923103wrf.107.2023.12.11.08.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 08:24:21 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	mturquette@baylibre.com,
	conor+dt@kernel.org,
	sboyd@kernel.org,
	tomasz.figa@gmail.com,
	s.nawrocki@samsung.com,
	linus.walleij@linaro.org,
	wim@linux-watchdog.org,
	linux@roeck-us.net,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	olof@lixom.net,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	cw00.choi@samsung.com,
	alim.akhtar@samsung.com
Cc: peter.griffin@linaro.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	semen.protsenko@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	soc@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	kernel-team@android.com,
	linux-serial@vger.kernel.org
Subject: [PATCH v7 06/16] dt-bindings: clock: google,gs101: fix incorrect numbering and DGB suffix
Date: Mon, 11 Dec 2023 16:23:21 +0000
Message-ID: <20231211162331.435900-7-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231211162331.435900-1-peter.griffin@linaro.org>
References: <20231211162331.435900-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

166 was skipped by mistake and two clocks:
* CLK_MOUT_CMU_HSI0_USBDPDGB
* CLK_GOUT_HSI0_USBDPDGB

Have an incorrect DGB ending instead of DBG.

This is an ABI break, but as the patch was only applied yesterday this
header has never been in an actual release so it seems better to fix
this early than ignore it.

Fixes: 0a910f160638 ("dt-bindings: clock: Add Google gs101 clock management unit bindings")
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 include/dt-bindings/clock/google,gs101.h | 118 +++++++++++------------
 1 file changed, 59 insertions(+), 59 deletions(-)

diff --git a/include/dt-bindings/clock/google,gs101.h b/include/dt-bindings/clock/google,gs101.h
index 5d2c2d907a7b..9761c0b24e66 100644
--- a/include/dt-bindings/clock/google,gs101.h
+++ b/include/dt-bindings/clock/google,gs101.h
@@ -59,7 +59,7 @@
 #define CLK_MOUT_CMU_HSI0_BUS		45
 #define CLK_MOUT_CMU_HSI0_DPGTC		46
 #define CLK_MOUT_CMU_HSI0_USB31DRD	47
-#define CLK_MOUT_CMU_HSI0_USBDPDGB	48
+#define CLK_MOUT_CMU_HSI0_USBDPDBG	48
 #define CLK_MOUT_CMU_HSI1_BUS		49
 #define CLK_MOUT_CMU_HSI1_PCIE		50
 #define CLK_MOUT_CMU_HSI2_BUS		51
@@ -181,64 +181,64 @@
 #define CLK_GOUT_BUS2_BUS		163
 #define CLK_GOUT_CIS_CLK0		164
 #define CLK_GOUT_CIS_CLK1		165
-#define CLK_GOUT_CIS_CLK2		167
-#define CLK_GOUT_CIS_CLK3		168
-#define CLK_GOUT_CIS_CLK4		169
-#define CLK_GOUT_CIS_CLK5		170
-#define CLK_GOUT_CIS_CLK6		171
-#define CLK_GOUT_CIS_CLK7		172
-#define CLK_GOUT_CMU_BOOST		173
-#define CLK_GOUT_CORE_BUS		174
-#define CLK_GOUT_CPUCL0_DBG		175
-#define CLK_GOUT_CPUCL0_SWITCH		176
-#define CLK_GOUT_CPUCL1_SWITCH		177
-#define CLK_GOUT_CPUCL2_SWITCH		178
-#define CLK_GOUT_CSIS_BUS		179
-#define CLK_GOUT_DISP_BUS		180
-#define CLK_GOUT_DNS_BUS		181
-#define CLK_GOUT_DPU_BUS		182
-#define CLK_GOUT_EH_BUS			183
-#define CLK_GOUT_G2D_G2D		184
-#define CLK_GOUT_G2D_MSCL		185
-#define CLK_GOUT_G3AA_G3AA		186
-#define CLK_GOUT_G3D_BUSD		187
-#define CLK_GOUT_G3D_GLB		188
-#define CLK_GOUT_G3D_SWITCH		189
-#define CLK_GOUT_GDC_GDC0		190
-#define CLK_GOUT_GDC_GDC1		191
-#define CLK_GOUT_GDC_SCSC		192
-#define CLK_GOUT_CMU_HPM		193
-#define CLK_GOUT_HSI0_BUS		194
-#define CLK_GOUT_HSI0_DPGTC		195
-#define CLK_GOUT_HSI0_USB31DRD		196
-#define CLK_GOUT_HSI0_USBDPDGB		197
-#define CLK_GOUT_HSI1_BUS		198
-#define CLK_GOUT_HSI1_PCIE		199
-#define CLK_GOUT_HSI2_BUS		200
-#define CLK_GOUT_HSI2_MMC_CARD		201
-#define CLK_GOUT_HSI2_PCIE		202
-#define CLK_GOUT_HSI2_UFS_EMBD		203
-#define CLK_GOUT_IPP_BUS		204
-#define CLK_GOUT_ITP_BUS		205
-#define CLK_GOUT_MCSC_ITSC		206
-#define CLK_GOUT_MCSC_MCSC		207
-#define CLK_GOUT_MFC_MFC		208
-#define CLK_GOUT_MIF_BUSP		209
-#define CLK_GOUT_MISC_BUS		210
-#define CLK_GOUT_MISC_SSS		211
-#define CLK_GOUT_PDP_BUS		212
-#define CLK_GOUT_PDP_VRA		213
-#define CLK_GOUT_G3AA			214
-#define CLK_GOUT_PERIC0_BUS		215
-#define CLK_GOUT_PERIC0_IP		216
-#define CLK_GOUT_PERIC1_BUS		217
-#define CLK_GOUT_PERIC1_IP		218
-#define CLK_GOUT_TNR_BUS		219
-#define CLK_GOUT_TOP_CMUREF		220
-#define CLK_GOUT_TPU_BUS		221
-#define CLK_GOUT_TPU_TPU		222
-#define CLK_GOUT_TPU_TPUCTL		223
-#define CLK_GOUT_TPU_UART		224
+#define CLK_GOUT_CIS_CLK2		166
+#define CLK_GOUT_CIS_CLK3		167
+#define CLK_GOUT_CIS_CLK4		168
+#define CLK_GOUT_CIS_CLK5		169
+#define CLK_GOUT_CIS_CLK6		170
+#define CLK_GOUT_CIS_CLK7		171
+#define CLK_GOUT_CMU_BOOST		172
+#define CLK_GOUT_CORE_BUS		173
+#define CLK_GOUT_CPUCL0_DBG		174
+#define CLK_GOUT_CPUCL0_SWITCH		175
+#define CLK_GOUT_CPUCL1_SWITCH		176
+#define CLK_GOUT_CPUCL2_SWITCH		177
+#define CLK_GOUT_CSIS_BUS		178
+#define CLK_GOUT_DISP_BUS		179
+#define CLK_GOUT_DNS_BUS		180
+#define CLK_GOUT_DPU_BUS		181
+#define CLK_GOUT_EH_BUS			182
+#define CLK_GOUT_G2D_G2D		183
+#define CLK_GOUT_G2D_MSCL		184
+#define CLK_GOUT_G3AA_G3AA		185
+#define CLK_GOUT_G3D_BUSD		186
+#define CLK_GOUT_G3D_GLB		187
+#define CLK_GOUT_G3D_SWITCH		188
+#define CLK_GOUT_GDC_GDC0		189
+#define CLK_GOUT_GDC_GDC1		190
+#define CLK_GOUT_GDC_SCSC		191
+#define CLK_GOUT_CMU_HPM		192
+#define CLK_GOUT_HSI0_BUS		193
+#define CLK_GOUT_HSI0_DPGTC		194
+#define CLK_GOUT_HSI0_USB31DRD		195
+#define CLK_GOUT_HSI0_USBDPDBG		196
+#define CLK_GOUT_HSI1_BUS		197
+#define CLK_GOUT_HSI1_PCIE		198
+#define CLK_GOUT_HSI2_BUS		199
+#define CLK_GOUT_HSI2_MMC_CARD		200
+#define CLK_GOUT_HSI2_PCIE		201
+#define CLK_GOUT_HSI2_UFS_EMBD		202
+#define CLK_GOUT_IPP_BUS		203
+#define CLK_GOUT_ITP_BUS		204
+#define CLK_GOUT_MCSC_ITSC		205
+#define CLK_GOUT_MCSC_MCSC		206
+#define CLK_GOUT_MFC_MFC		207
+#define CLK_GOUT_MIF_BUSP		208
+#define CLK_GOUT_MISC_BUS		209
+#define CLK_GOUT_MISC_SSS		210
+#define CLK_GOUT_PDP_BUS		211
+#define CLK_GOUT_PDP_VRA		212
+#define CLK_GOUT_G3AA			213
+#define CLK_GOUT_PERIC0_BUS		214
+#define CLK_GOUT_PERIC0_IP		215
+#define CLK_GOUT_PERIC1_BUS		216
+#define CLK_GOUT_PERIC1_IP		217
+#define CLK_GOUT_TNR_BUS		218
+#define CLK_GOUT_TOP_CMUREF		219
+#define CLK_GOUT_TPU_BUS		220
+#define CLK_GOUT_TPU_TPU		221
+#define CLK_GOUT_TPU_TPUCTL		222
+#define CLK_GOUT_TPU_UART		223
 
 /* CMU_APM */
 #define CLK_MOUT_APM_FUNC				1
-- 
2.43.0.472.g3155946c3a-goog


