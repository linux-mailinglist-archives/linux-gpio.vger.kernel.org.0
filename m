Return-Path: <linux-gpio+bounces-19338-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C2CA9DDBB
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Apr 2025 01:11:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B0F441B648E9
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Apr 2025 23:12:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DD3B201011;
	Sat, 26 Apr 2025 23:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=simulevski.at header.i=@simulevski.at header.b="ej3gwfBo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602081F19A
	for <linux-gpio@vger.kernel.org>; Sat, 26 Apr 2025 23:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745709111; cv=none; b=Ry/K1yDHn8M8bDz2g2xySmg5gEAA6IDyMQoGLjpUpWtdXKyFp6uIxW5n9wW614fIHMVI+XoOVnqMIT8LekFclK2KUjX7Cgod1FfhfErd51ztNVHRL9Icv+0x1eLXowXYcH3kVOjYfxVB3Afoq/2TaHYC28r4tUon0jaagEY3BCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745709111; c=relaxed/simple;
	bh=JSANf/ScvX3Uq8GbQH+CQs9vUfv+iD40hGemgQNE7O4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jEbae3q22bVH/Bt3pHENFo2SNgtE3i47dRXSZCPdJ07id3kdVIO2eh64CUGBzulw16aRhyqz3jxWuaNiFeg6MwCB+Rp4g2i4oVhZd+hzYqoKxzLzaSEXcJTNH/Q+knUJmxUH8ugE7hGKsPekEL2CtU5JQ0yykazTeDMJH42QmE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=simulevski.at; spf=pass smtp.mailfrom=simulevski.at; dkim=pass (2048-bit key) header.d=simulevski.at header.i=@simulevski.at header.b=ej3gwfBo; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=simulevski.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=simulevski.at
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5e5deb6482cso8078378a12.1
        for <linux-gpio@vger.kernel.org>; Sat, 26 Apr 2025 16:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=simulevski.at; s=google; t=1745709108; x=1746313908; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+0ils+A1DyFIjuTkRyJHSGr6AwB7PLZzZgPR+43TOG0=;
        b=ej3gwfBo5UrVAtQLiN2vLWHgLlgT+j3XXsyn0fcSFeXgFnYHOsXBtc8KA826z5LOYA
         /hN7+17+FSvampYl9T/13G5OxYIYpR2b+AlRl95oMWtUTlSJP1x7if3rUTNdVKKORG5q
         j7lAhD43a0ehPRKLv2ewCfBNITxfMG7mVvTfPJXcvcW3202BUOFoi8Z4RIbF5vHcXPLC
         bnefKlaWVVsrZj/PPDpQjbxbtssgZDgYFJ04ExDnzSOraJISFuMPR7X+0llyrCYBhPPp
         m+NwNSU0/P1lOfl8cvAJZUWmHabslRHMJzurDNvzuqv3PUF8Ol/1ITS6acJfHblfp52h
         PnDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745709108; x=1746313908;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+0ils+A1DyFIjuTkRyJHSGr6AwB7PLZzZgPR+43TOG0=;
        b=NNppbgjJhi1zJwMzIiHLkPFc+14b4szX2V4+aFE2ofv8T2f67eji9yMSndX4bhuB+W
         zyZecYvqVxJHk7Jiqs/wnrf0pRMbrtS7OPEs/RPqi0sXIwwVM48T8bAKjgsx8BOWbn3Z
         z/O+/d0lcr7nk5Ii9D+1bhqC1C/q5r6v5WNsYy0A1DNV3fDrL6sFLAZ5ZfAU9BxLPIKX
         iL257046xw296X4dCBaKKS2h4T2AKhXXW62KqEhj0DOUXeAW31u5pKMogVEOF8mAW9f6
         2rHtJQgYg89NQF6YUUT121PtS+gKK9ECJUIsPfUBIw9PE27NdXkuRz6Sj0E/aojvW+jo
         aCIw==
X-Gm-Message-State: AOJu0Yx6cRBJVzxKSe5gTKI/r97c8WnI4flNcYJkJUTL7nweryZirMWN
	IAmt+cW2o5yeKvwRzPrQzPXVPbyUv4wSYFN5IBDoCnWKD8EeDBbfgjah6whahl0=
X-Gm-Gg: ASbGncsrulidAinGBv2zJu31+SIcPvbKzuPfP/RksPA6aCm3zAjg5OVrgUOReNAOZWa
	WV7qty089DNxE+11w1CEFaqzlK5k2wK5zPtMwTjIRPzR0B2WL5aTkhqHNIxjU+IB14X2g04GB05
	KBOQja6gmpevna1LRJUCO8Gw/EDFxCVphRh6YIBlZOiTIln8L7YEejjcvXhSlLQZ4wTq5s1IUIB
	3Rpx9lfwbt0mdLbYBnAt80HzkCdbOwKTlgh7t+mi0VTMZu1OAGpmzQbjoFBCg6n0xpvebQDiZMj
	VBzhuq5YFjMNoxl/qxElZs5LPPSQon80ODzsyKjTzVjrZ105eTrOHudO
X-Google-Smtp-Source: AGHT+IGF7q6Y/O1AMqtv/2FTw0V6Nej7VHeWZTipaKNqnypUptBFQ62R9Y8XdpuSKQiMrtPIB8ucwg==
X-Received: by 2002:a17:907:3e05:b0:acb:3acd:2845 with SMTP id a640c23a62f3a-ace5a482bb3mr781313366b.25.1745709107533;
        Sat, 26 Apr 2025 16:11:47 -0700 (PDT)
Received: from fedora.home.simulevski.at ([91.65.134.65])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ecfa8f7sm358018366b.105.2025.04.26.16.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 16:11:47 -0700 (PDT)
From: Ariel Simulevski <ariel@simulevski.at>
To: mika.westerberg@linux.intel.com,
	andy@kernel.org,
	linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ariel Simulevski <ariel@simulevski.at>,
	Guido Trentalancia <guido2022@trentalancia.com>
Subject: [PATCH] pinctrl: alderlake: Add missing I2C2/I2C3/I2C4 pin definitions
Date: Sun, 27 Apr 2025 01:11:27 +0200
Message-ID: <20250426231127.190090-1-ariel@simulevski.at>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PixArt I2C touchpad (PIXA3848) found on several Alder Lake
laptops is not detected unless the Tiger Lake pinctrl driver is used.

This patch adds missing I2C2, I2C3, and I2C4 pin definitions
to the Alder Lake pinctrl driver, based on Tiger Lake mappings,
with corrected pin numbering and proper community assignment.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=220056
Co-developed-by: Guido Trentalancia <guido2022@trentalancia.com>
Signed-off-by: Ariel Simulevski <ariel@simulevski.at>
Signed-off-by: Guido Trentalancia <guido2022@trentalancia.com>
---
 drivers/pinctrl/intel/pinctrl-alderlake.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/intel/pinctrl-alderlake.c b/drivers/pinctrl/intel/pinctrl-alderlake.c
index 108eac205aa9..bf0d910a7c2a 100644
--- a/drivers/pinctrl/intel/pinctrl-alderlake.c
+++ b/drivers/pinctrl/intel/pinctrl-alderlake.c
@@ -677,6 +677,14 @@ static const struct pinctrl_pin_desc adls_pins[] = {
 	PINCTRL_PIN(301, "JTAG_TCK"),
 	PINCTRL_PIN(302, "DBG_PMODE"),
 	PINCTRL_PIN(303, "CPU_TRSTB"),
+
+	/* Missing I2C buses based on TigerLake: fixes #220056 */
+	PINCTRL_PIN(79, "I2C2_SDA"),
+	PINCTRL_PIN(80, "I2C2_SCL"),
+	PINCTRL_PIN(81, "I2C3_SDA"),
+	PINCTRL_PIN(82, "I2C3_SCL"),
+	PINCTRL_PIN(83, "I2C4_SDA"),
+	PINCTRL_PIN(84, "I2C4_SCL"),
 };
 
 static const struct intel_padgroup adls_community0_gpps[] = {
@@ -709,6 +717,7 @@ static const struct intel_padgroup adls_community4_gpps[] = {
 static const struct intel_padgroup adls_community5_gpps[] = {
 	ADL_GPP(0, 270, 294, 448),			/* GPP_D */
 	ADL_GPP(1, 295, 303, INTEL_GPIO_BASE_NOMAP),	/* JTAG */
+	ADL_GPP(2, 304, 309, INTEL_GPIO_BASE_NOMAP),	/* I2C fix #220056 */
 };
 
 static const struct intel_community adls_communities[] = {
@@ -716,7 +725,7 @@ static const struct intel_community adls_communities[] = {
 	ADL_S_COMMUNITY(1, 95, 150, adls_community1_gpps),
 	ADL_S_COMMUNITY(2, 151, 199, adls_community3_gpps),
 	ADL_S_COMMUNITY(3, 200, 269, adls_community4_gpps),
-	ADL_S_COMMUNITY(4, 270, 303, adls_community5_gpps),
+	ADL_S_COMMUNITY(4, 270, 309, adls_community5_gpps),
 };
 
 static const struct intel_pinctrl_soc_data adls_soc_data = {
-- 
2.49.0


