Return-Path: <linux-gpio+bounces-24774-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E25B309FD
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Aug 2025 01:33:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1DD2A1CE6ABA
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 23:34:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48AED2EA744;
	Thu, 21 Aug 2025 23:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=libre.computer header.i=@libre.computer header.b="f4LIXA2K"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9DE2E0B59
	for <linux-gpio@vger.kernel.org>; Thu, 21 Aug 2025 23:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755819227; cv=none; b=QUJQkNbdzihjzFPULN9a+Gsax2IxSUyY974odPwoZXnaL4C2D+Op9zcu5+K5Vqvdu6tWPt0xu0oPas8gfHW46tNAQsMY6iGFOSWOttbUusHR6de+4wlqAyUEwkdQ4e4zHyNTSz5n68VVALQxqQ4r1G9rMYnlfi4H5gV9Fn43QnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755819227; c=relaxed/simple;
	bh=DJeXCGYX6D/OlH0QEqQjuSy5fuYgqi7zZqhKILfluK0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WU7dHTY9p4brBPWTbceMS4Al59mylKU4BwGTYgk7GYxC0WHupZ9+VI8Cc8Yi1XYaqC7WKdlVQW2QFLdJ1Mn516SER36Pz7PHD5nEo9aWbHT2pvQZt7Hm4gEYxdwGRx/qe0DcXSvf0odjG3ycHZ7liQU+AltyalejbMISgt3rgMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=libre.computer; spf=none smtp.mailfrom=libretech.co; dkim=pass (2048-bit key) header.d=libre.computer header.i=@libre.computer header.b=f4LIXA2K; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=libre.computer
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=libretech.co
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7e8706764d2so208561685a.2
        for <linux-gpio@vger.kernel.org>; Thu, 21 Aug 2025 16:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=libre.computer; s=google; t=1755819223; x=1756424023; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Hvbh5Obgs9w+xkwaE6p3IluxarxC/+wS6HEpg73DttY=;
        b=f4LIXA2KqvYP3jSE2Tw5FeqTUubloMJxusbAyjpLek0wSXXnFI4AEzNkrOAKjrkcG7
         +1+oz0dUvA3XdGINt1eZdwv9Vg/w25GYjQo2J+nFHwd2ooLQdoljqNI0OZhyc5fimqbY
         l2JS6EYXYqeuVA5Gv60IfqkEJwtwepS7Lv34czKMszZGv5cpDX4795YWhirv63GCLWGk
         7Ccp3wnIN+DseDA6A5RLEMY8ZB/PvfpeGKdzuJHDkdkzMwQd3OaXeIvgeDJwgvo9UWS1
         LGgkPYFy7vQUyYe3u4GuBUtJOWtlTRBdiJR7Aj88mnu3lh11nGVMT/sJuas0yF1MLFhX
         LiLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755819223; x=1756424023;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hvbh5Obgs9w+xkwaE6p3IluxarxC/+wS6HEpg73DttY=;
        b=l58czEDRd+l1GHMOFSzOMTejndoSNtyie+EgBE9BfMyoBOebbOUurB6zmHsj8fFF0L
         M3vSv1cQCk07IELt2Fbx9x2m/TpgCIfjDibZ5Y+9gMXQ5akAwoaqZUAfI/4vXeONP9i0
         3xRM1XSGtvCH+519jHEBTuL85fY1keqQi0zwyshOYRX4bx6edz68dcE9w93o7vvew7vY
         meKR+SOceG0FBRuDP4/0m55T1tcpm90nWA5zR8kX6DLYKWq5X7gx3JF1yvh7IRCulHPq
         Rbah4nOVqmdNj4pOhZxmrRhRh0+R1Hji6huBELA5FzkpGsdrKX849lJRyJuWP5VP5ZBg
         tQNg==
X-Forwarded-Encrypted: i=1; AJvYcCVu4FoVfSEBYqTIwK0t5NCiWTYoNqluur7n/0+Y8S41nM8sPqiYOQmb61CkUqOTHqWnGkVqrISAF3HS@vger.kernel.org
X-Gm-Message-State: AOJu0YzcYthY20NaW2o7pZSh0pD0TDhEfTExDu3C1XCrs8gXhp7WhB7y
	kRpaHnZ6NoWSiZLE6nCo5dugPbliO3P9hTxhlN4Kn1JU5dzAgpg7PP5mNkBNX6mPxQ==
X-Gm-Gg: ASbGnctjxLGJEJIOsg4TtOr1562rJiHQdOoEZnnYxdudsSYc8+bolqx6Ot3eBONdQzH
	gLrvXjLoyfP4fEa+sOJCts1vWq1umiqqyNHvhj80qN1dCYiWFG6h4dwon0GupuYuBCJyBkf54wF
	4ouw6pRrXg/SV1thUE1DEoYjx0hW9SOt3sYEwsALKDrYN/j3tjyIbgsr/k0Xk2+lJdqvYq4whXC
	XzRUv0U+Y4wm/MpFP6TCkmNqJ001/8PG403GX4YcW3BNFw86hrGUUA8+on0iUE5jzXU2WrKRbRE
	mC7bHzeNQrDsvP6/6HcnaMOmPF94ip707PrHhAmrlWYKVUkdRcwmCIFABeSTC1utP0s7GnVFNWT
	KBfdF5qrUxkaRrXNd6WKmM5P6JwEbQw==
X-Google-Smtp-Source: AGHT+IEE8fYgK55NmdoQhhgPInOhivLoo6o9lQD203iWvd3p+5PTTXRIeOG74yZ2ZatbGTKv9Gbgbw==
X-Received: by 2002:a05:620a:4590:b0:7e2:23c2:e55a with SMTP id af79cd13be357-7ea10f73cf5mr175527285a.27.1755819223112;
        Thu, 21 Aug 2025 16:33:43 -0700 (PDT)
Received: from localhost ([2607:fb91:3b82:29b4:add9:bee5:e413:378f])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7e87e0204ddsm1216833585a.10.2025.08.21.16.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 16:33:42 -0700 (PDT)
From: Da Xue <da@libre.computer>
To: Linus Walleij <linus.walleij@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh@kernel.org>
Cc: Da Xue <da@libre.computer>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: meson-gxl: add missing i2c_d pinmux
Date: Thu, 21 Aug 2025 19:33:34 -0400
Message-ID: <20250821233335.1707559-1-da@libre.computer>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Amlogic GXL has 4 I2C attached to gpio-periphs. I2C_D is on GPIOX_10/11.

Add the relevant func 3 pinmux per the datasheet for S805X/S905X/S905D.

Fixes: 0f15f500ff2c ("pinctrl: meson: Add GXL pinctrl definitions")
Signed-off-by: Da Xue <da@libre.computer>
---
 drivers/pinctrl/meson/pinctrl-meson-gxl.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/pinctrl/meson/pinctrl-meson-gxl.c b/drivers/pinctrl/meson/pinctrl-meson-gxl.c
index 9171de657f97..a75762e4d264 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-gxl.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-gxl.c
@@ -187,6 +187,9 @@ static const unsigned int i2c_sda_c_pins[]	= { GPIODV_28 };
 static const unsigned int i2c_sck_c_dv19_pins[] = { GPIODV_19 };
 static const unsigned int i2c_sda_c_dv18_pins[] = { GPIODV_18 };
 
+static const unsigned int i2c_sck_d_pins[]	= { GPIOX_11 };
+static const unsigned int i2c_sda_d_pins[]	= { GPIOX_10 };
+
 static const unsigned int eth_mdio_pins[]	= { GPIOZ_0 };
 static const unsigned int eth_mdc_pins[]	= { GPIOZ_1 };
 static const unsigned int eth_clk_rx_clk_pins[] = { GPIOZ_2 };
@@ -411,6 +414,8 @@ static const struct meson_pmx_group meson_gxl_periphs_groups[] = {
 	GPIO_GROUP(GPIO_TEST_N),
 
 	/* Bank X */
+	GROUP(i2c_sda_d,	5,	5),
+	GROUP(i2c_sck_d,	5,	4),
 	GROUP(sdio_d0,		5,	31),
 	GROUP(sdio_d1,		5,	30),
 	GROUP(sdio_d2,		5,	29),
@@ -651,6 +656,10 @@ static const char * const i2c_c_groups[] = {
 	"i2c_sck_c", "i2c_sda_c", "i2c_sda_c_dv18", "i2c_sck_c_dv19",
 };
 
+static const char * const i2c_d_groups[] = {
+	"i2c_sck_d", "i2c_sda_d",
+};
+
 static const char * const eth_groups[] = {
 	"eth_mdio", "eth_mdc", "eth_clk_rx_clk", "eth_rx_dv",
 	"eth_rxd0", "eth_rxd1", "eth_rxd2", "eth_rxd3",
@@ -777,6 +786,7 @@ static const struct meson_pmx_func meson_gxl_periphs_functions[] = {
 	FUNCTION(i2c_a),
 	FUNCTION(i2c_b),
 	FUNCTION(i2c_c),
+	FUNCTION(i2c_d),
 	FUNCTION(eth),
 	FUNCTION(pwm_a),
 	FUNCTION(pwm_b),
-- 
2.47.2


