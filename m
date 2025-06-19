Return-Path: <linux-gpio+bounces-21830-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 617E1ADFB2E
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jun 2025 04:24:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A0034A010E
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jun 2025 02:24:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC98B21ABD5;
	Thu, 19 Jun 2025 02:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=libre.computer header.i=@libre.computer header.b="Aicidizy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3571E1E379B
	for <linux-gpio@vger.kernel.org>; Thu, 19 Jun 2025 02:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750299846; cv=none; b=RSkHDKBwJnoMa05DkFxTr1Pl9pbC41jfue6F745yy+R9nO6yuvWq5SkKJm1/mNOdAZcXxs/wndRm11fio9uu0lgj3ILavlIbK4yT25bF9LAJ0/8/BjNIHUj9FenA0724J6TjjREgCFILcgF/MoNq60CclhBrY2N5X/5poKxQwwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750299846; c=relaxed/simple;
	bh=IkWAaY/Ws4S8HREs6ZmpZHuV1FTlxpFqg3Bmx+YH1EY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CuRreCpqhQilqjRCVkBo/dpR2ve+td4MOK10QKJSCBfwa01B3219PeQLeA1cpd2LwxxufAzjpgXmnL44RnKrSW75T5jppi43s/Rc5liLri5sRyCCVcdpJVMAUswv0dHrZ5w2UFUk9rcoPzmzrEameIckINDGo7Id3SVyDJcEJbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=libre.computer; spf=none smtp.mailfrom=libretech.co; dkim=pass (2048-bit key) header.d=libre.computer header.i=@libre.computer header.b=Aicidizy; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=libre.computer
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=libretech.co
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7d219896edeso37630185a.1
        for <linux-gpio@vger.kernel.org>; Wed, 18 Jun 2025 19:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=libre.computer; s=google; t=1750299842; x=1750904642; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xIc69jZZtauTnE08yUtmztNBMw9hE7gd1ymlUgClN+8=;
        b=AicidizyYmtk9zKgvgW+cb4IBkhaPXtngtcMbxWxN63PagCu14yqA+OleOsw1O+xBT
         eifOIEDiItIWJFfnTxPq8zMHDvQo6JJvBxQmxPd3khL9HzWlum0rXztKaJqT/LwzY6TZ
         tPo8PZ5Dp2uOo1w0Ib2ZgWqvzRvcCVSj5YAmbC69F9AtRl6pNxZcxSO4Y/W9mYRdCKV7
         akAqUMY1ArH9uRHPR/HISwMK6T+YXUpF/Qq83/Zkwf8Kpoqbqog8kPs2Fl9atf2aYOVY
         xXIq91woEeJO9Qhql9sDiVFR6VaQ6YvztQyccvWfzizZfDM5O4t7W2Oey5cTwDP0w6L0
         bWXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750299842; x=1750904642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xIc69jZZtauTnE08yUtmztNBMw9hE7gd1ymlUgClN+8=;
        b=IcoV8TBSEYhiqsNoaeDnxsfEnpn9A5tGy7OlOpTACGKEsVRIB7W4qDqdQpVGUhohKF
         8NB3oEbk7THnd/uXSRHUzssAYLkepLFxEL6zgGtW/AXM3RMmr0RU5m0tRmYYPvNYewyG
         zaODJhqcSyp51ZnoPIjZjzIRoJ1M1ZBLg2jIdld6ixwQqJhJW4t9q1BoZ+yJXPWxADOF
         nVDuy+axLZCpSLybguFYe3N+WKfBs2idWkafEP1Dp1ptkWsB7Pg/x62XnQRmrTdlwC1n
         Qe36BlEG7aMz9hlr3bA0W/Mih9FYEer3tQAtvATQNn2A7LLLzyxaSOSWLJ56uR7mPiho
         CC2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXJlQ/CFu4a6hUBk3XUOeT/skhnxUfc7y4N3Fey/m1x5vWYkR7xz8BQ2sOMKJ9LOQgwG/O44cDKGr9s@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5puyuS+fSb8T8CYUOQBHMgCisLLB8qgfoxrb7m5tHpt4qM5aK
	H5n49jObX0d7jPcz/23DP5tU7fvCQk/W0gRBtCIUOu6BS1c9sMJv8B0VXu9NF92+6g==
X-Gm-Gg: ASbGncsLi+MlVhBAu6E+736A4TVyWGfv/IS/yAHZAcuLIvzu8grzQnoijAvVariIgHv
	AfGxlgFJN9mGWj+1SU4YwFzS65tIHGaycd/5oYAWvrBjPVUzekWYfGEzOtuXvK1oxBX3+YuOsTk
	+LMdLEdGJDhoxhz6jlv3nVtvQ5Fk9ol9PTLWN0emuRxQ3JrRx17GgfjDdRAmIPOa0J1SxasoydN
	DBCVbINu514Cow6UjV3RhIqfc0XRWLhhowdMvXk/AvQjY6ChrXGiKGYAbrgnlfMQHplh0/tU0tT
	e7RovCODl7ipyZATjErHHaJDwrFcwSbZQ4j3mP/dc0Ibis4iOWA06ZaZHjA=
X-Google-Smtp-Source: AGHT+IE1rdDNmDG+3USJoAPdiCN3kxUYolutEerz4uopIsgF3VHmc6V3hXOEqTVlOlkynA8dHGaIbg==
X-Received: by 2002:a05:620a:24ca:b0:7d3:c501:63da with SMTP id af79cd13be357-7d3c6d081d2mr3217739885a.48.1750299841762;
        Wed, 18 Jun 2025 19:24:01 -0700 (PDT)
Received: from localhost ([2607:fb90:6159:6306:2d25:3966:6b37:2813])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b8eb80c7sm834149085a.61.2025.06.18.19.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 19:24:01 -0700 (PDT)
From: Da Xue <da@libre.computer>
To: Linus Walleij <linus.walleij@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Da Xue <da@libre.computer>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: meson-g12a: add g12b pwm groups
Date: Wed, 18 Jun 2025 22:23:37 -0400
Message-Id: <20250619022337.43900-1-da@libre.computer>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

g12b and sm1 have additional pwm pinmuxes for b, c, and d

Signed-off-by: Da Xue <da@libre.computer>
---
 drivers/pinctrl/meson/pinctrl-meson-g12a.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson-g12a.c b/drivers/pinctrl/meson/pinctrl-meson-g12a.c
index e2788bfc5874..8b9130c6e170 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-g12a.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-g12a.c
@@ -270,15 +270,21 @@ static const unsigned int pwm_a_pins[]			= { GPIOX_6 };
 /* pwm_b */
 static const unsigned int pwm_b_x7_pins[]		= { GPIOX_7 };
 static const unsigned int pwm_b_x19_pins[]		= { GPIOX_19 };
+static const unsigned int pwm_b_z0_pins[]		= { GPIOZ_0 };
+static const unsigned int pwm_b_z13_pins[]		= { GPIOZ_13 };
+static const unsigned int pwm_b_h_pins[]		= { GPIOH_7 };
 
 /* pwm_c */
 static const unsigned int pwm_c_c_pins[]		= { GPIOC_4 };
 static const unsigned int pwm_c_x5_pins[]		= { GPIOX_5 };
 static const unsigned int pwm_c_x8_pins[]		= { GPIOX_8 };
+static const unsigned int pwm_c_z_pins[]		= { GPIOZ_1 };
 
 /* pwm_d */
 static const unsigned int pwm_d_x3_pins[]		= { GPIOX_3 };
 static const unsigned int pwm_d_x6_pins[]		= { GPIOX_6 };
+static const unsigned int pwm_d_z_pins[]		= { GPIOZ_2 };
+static const unsigned int pwm_d_a_pins[]		= { GPIOA_4 };
 
 /* pwm_e */
 static const unsigned int pwm_e_pins[]			= { GPIOX_16 };
@@ -649,12 +655,22 @@ static const struct meson_pmx_group meson_g12a_periphs_groups[] = {
 	GROUP(pwm_a,			1),
 	GROUP(pwm_b_x7,			4),
 	GROUP(pwm_b_x19,		1),
+	GROUP(pwm_b_z0,			5),
+	GROUP(pwm_b_z13,		5),
+	GROUP(pwm_b_h,			5),
 	GROUP(pwm_c_x5,			4),
 	GROUP(pwm_c_x8,			5),
+	GROUP(pwm_c_c,			5),
+	GROUP(pwm_c_z,			5),
+	GROUP(pwm_d_z,			4),
+	GROUP(pwm_d_a,			3),
 	GROUP(pwm_d_x3,			4),
 	GROUP(pwm_d_x6,			4),
 	GROUP(pwm_e,			1),
+	GROUP(pwm_f_a,			3),
+	GROUP(pwm_f_h,			4),
 	GROUP(pwm_f_x,			1),
+	GROUP(pwm_f_z,			5),
 	GROUP(tsin_a_valid,		3),
 	GROUP(tsin_a_sop,		3),
 	GROUP(tsin_a_din0,		3),
@@ -1058,15 +1074,15 @@ static const char * const pwm_a_groups[] = {
 };
 
 static const char * const pwm_b_groups[] = {
-	"pwm_b_x7", "pwm_b_x19",
+	"pwm_b_h", "pwm_b_x7", "pwm_b_x19", "pwm_b_z0", "pwm_b_z13"
 };
 
 static const char * const pwm_c_groups[] = {
-	"pwm_c_c", "pwm_c_x5", "pwm_c_x8",
+	"pwm_c_c", "pwm_c_x5", "pwm_c_x8", "pwm_c_z",
 };
 
 static const char * const pwm_d_groups[] = {
-	"pwm_d_x3", "pwm_d_x6",
+	"pwm_d_a", "pwm_d_x3", "pwm_d_x6", "pwm_d_z",
 };
 
 static const char * const pwm_e_groups[] = {
-- 
2.39.5


