Return-Path: <linux-gpio+bounces-24078-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B1557B1E94B
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Aug 2025 15:31:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 188F71C23FE0
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Aug 2025 13:31:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B32B27F198;
	Fri,  8 Aug 2025 13:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HEwdoA28"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DFD127A900;
	Fri,  8 Aug 2025 13:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754659835; cv=none; b=p0MCgOuV5LCZQlQxzyzWlFFD2YkRFGhqde3Lh2ye6HzxAjgZ0WmkarhOasIoKdkIoySN+56OutRvOTtHpLdnZ2gEIYDNuEp4uubB8LNQt6QiOP4terG4iTMZYBIjzD9g+Ram0BK7YGNaGSwhqGuRBWmQQXnRzi6V/STJe2ZRLRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754659835; c=relaxed/simple;
	bh=bX9dluzRqM5mdjRk9gTs35EbAisH5kH7pOZ7dqDvug8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JnAdYZh+L4bXWQsFePVkYx2ovP6IWaSsZSNTiAXyXO/BNGFRw3M+ClxPQdMUyLiP3EIcT9aRQ8MIEtGMDaeM8BqEM+dKsxV+Z4wRxCa98XMzO9uzFSnG9s+wTJwh49yG0Ana/EDhMlEp2nEAP7Met+nG5C8ynFopi4PYyUPUy8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HEwdoA28; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3b8d0f1fb49so1277866f8f.2;
        Fri, 08 Aug 2025 06:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754659831; x=1755264631; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a86Ufa8djkdGQgtM21PVIsOEG6bWVbg21mzTs1e7RXs=;
        b=HEwdoA28k33TcJJz+dx/6p3nBvscY7LSgLBTOs/U9M1/Q79fpFlBrdBIy7gVQ7S2E6
         m2nOF7jLPCP49+9V56Z/JqXUUi2kXCxmRx0xCHfpF8bGirDLYJz0NkshY7aH/DA3qra2
         GG1Oi4PiQoSQQmbC84YchS7fbNRNadSx+QrGrloJL5t1yIrX+0NchOfr/sixjF433Z3e
         vFJBIXU6gk4GN25ICLk2xNGmyQE1zJ5xXEYGywpOoQ6IKImdSv0PSP8YRNIfZW6I4eDA
         QmexYNMzGqBFqXz8LNCk3gfPPlTBJAoTv8VAQHkNXqYrcG9VZ9u8qHxAm82PBN/vMClA
         LUWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754659831; x=1755264631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a86Ufa8djkdGQgtM21PVIsOEG6bWVbg21mzTs1e7RXs=;
        b=Q9pQYF2Sw1lQC2p+rqxiZYPxVsw6bXLlJVdpRsvN0d9KR8SiQH4b1W+bSHfDO5cvT8
         ETKNIKIqT2V/7LX771RTR+opeN0+uajp8Kk5AIZBx4FVIog76YDKWGviSaA8KA3QqPVN
         LECVl7hzw3ONfJ+28fbjUH2PjrILis0/u1qATVPtJ00nuWRK1YYvH159TXh7F184EXu/
         BEc80f93DnTufz8QsUP2BMTHm/zmb7a8or7OCgbKLAx7HjAdtki+ypEEhp4BJHfHnxoB
         uBTVD5NZ8DeK3MjJ47zOoUxqbwXxvac9CORY6NyVsIuUpq4sUEFe9btwbyu/y73l8Y3H
         Cdaw==
X-Forwarded-Encrypted: i=1; AJvYcCV1Ub/IfvV7gEjl7TzT9PWBIY+7rwkrzThJFOTUacAyYmld+nbV6nklt+FJIiMAnaeEQCwMtpgQwO5btA==@vger.kernel.org, AJvYcCWJAg65IXnU0Lo0ORuvGQ2Ig4L8crTi2IDi6O0OhXCdxNeUu1eA5+EjTSpLlwlyD/c8/U3GptFC44pRp7N7@vger.kernel.org, AJvYcCXCxyrzUotNT0WGxIiui5G68R8PSwbCX7f6yd2aPt++kiue0gFkb3VkMt6NtK5BJmkPLRLjkvLgj/1q@vger.kernel.org
X-Gm-Message-State: AOJu0YzJG4ZIhKm3n317awn64CKx3OlL4jFLzX5kXxygo9qNnugCtvoW
	u2gJQaNTWGCvIKLamJsmwfb4OIm0ZJ9S+vjQ89vprDGzVsKrAOYiCWxr
X-Gm-Gg: ASbGncs19htWGvNhU93+NwZAKpjdLJ+qnZj6jf5oVBkJijxh7QnI8qRybnj9d728gHt
	lvm/Rcq8NVlRAOPe39z52pkmmIhooj5DuaH+wLHrmh/0LsBIvSvc5eCPzZX8LadyxEZq2Cm24YM
	2APUw+Jct0UMZbE5pnNBmuIffTMMQ1dQ9/voN4QylR5Or2ShApkpW93pwV/qhZDAg0XRAvBXIjL
	ERqSIefxcGTiBfdREZzqfy2tnkBb9JEKUT44ll52sWMCFYjxFDqTVaBMgETZ2N6M9ah+Nu5bIXy
	HoZkyXVo9mdzEkKXua75llOd5VrBxJyyqPcmHFkIZ71IVeuhZiJo5NzXJ63G/J5vqutPPyGhd8Q
	Og5Zj7ASGk6zhM8voV9ZD8kJU3Fthi8+WBJ46wAcKiSqn87Jg39/UhiBGGwRafh5C/iwyRIjgJ3
	NS/Bv8ho0=
X-Google-Smtp-Source: AGHT+IEVaoaAXQsBUbC4BN2Dt5wVXjiSSZNAY5YJeQV1g3cRQHQ53oLEuhshJZkTAmEgAjdOWP47Ig==
X-Received: by 2002:a05:6000:25c4:b0:3b7:76ac:8b72 with SMTP id ffacd0b85a97d-3b9009294e5mr2415131f8f.12.1754659830492;
        Fri, 08 Aug 2025 06:30:30 -0700 (PDT)
Received: from iku.example.org (97e54365.skybroadband.com. [151.229.67.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c4a2187sm31527769f8f.70.2025.08.08.06.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 06:30:29 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 3/3] pinctrl: renesas: rzt2h: Add support for RZ/N2H SoC
Date: Fri,  8 Aug 2025 14:30:17 +0100
Message-ID: <20250808133017.2053637-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250808133017.2053637-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250808133017.2053637-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The RZ/N2H (R9A09G087) SoC from Renesas shares a similar pin controller
architecture with the RZ/T2H (R9A09G077) SoC, differing primarily in the
number of supported pins-576 on RZ/N2H versus 729 on RZ/T2H.

Add the necessary pin configuration data and compatible string to enable
support for the RZ/N2H SoC in the RZ/T2H pinctrl driver.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v4->v5:
- Dropped updating Kconfig help string as that was done in patch 2/3
- Used 0xXX for consistent formatting in r9a09g087_gpio_configs
- Added reviewed-by tag from Geert

v3->v4:
- No changes.

v2->v3:
- No changes.

v1->v2:
- New patch.
---
 drivers/pinctrl/renesas/Kconfig         |  1 +
 drivers/pinctrl/renesas/pinctrl-rzt2h.c | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/drivers/pinctrl/renesas/Kconfig b/drivers/pinctrl/renesas/Kconfig
index c8b84c158e86..8cbd79a13414 100644
--- a/drivers/pinctrl/renesas/Kconfig
+++ b/drivers/pinctrl/renesas/Kconfig
@@ -45,6 +45,7 @@ config PINCTRL_RENESAS
 	select PINCTRL_RZG2L if ARCH_R9A09G056
 	select PINCTRL_RZG2L if ARCH_R9A09G057
 	select PINCTRL_RZT2H if ARCH_R9A09G077
+	select PINCTRL_RZT2H if ARCH_R9A09G087
 	select PINCTRL_PFC_SH7203 if CPU_SUBTYPE_SH7203
 	select PINCTRL_PFC_SH7264 if CPU_SUBTYPE_SH7264
 	select PINCTRL_PFC_SH7269 if CPU_SUBTYPE_SH7269
diff --git a/drivers/pinctrl/renesas/pinctrl-rzt2h.c b/drivers/pinctrl/renesas/pinctrl-rzt2h.c
index 366071e9164c..a070fc447d96 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzt2h.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzt2h.c
@@ -762,17 +762,33 @@ static const u8 r9a09g077_gpio_configs[] = {
 	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x7f,
 };
 
+static const u8 r9a09g087_gpio_configs[] = {
+	0x1f, 0xff, 0xff, 0x1f, 0x00, 0xfe, 0xff, 0x00, 0x7e, 0xf0, 0xff, 0x01,
+	0xff, 0xff, 0xff, 0x00, 0xe0, 0xff, 0xff, 0x00, 0xff, 0xff, 0xff, 0x01,
+	0xe0, 0xff, 0xff, 0x7f, 0x00, 0xfe, 0xff, 0x7f, 0x00, 0xfc, 0x7f,
+};
+
 static struct rzt2h_pinctrl_data r9a09g077_data = {
 	.n_port_pins = ARRAY_SIZE(r9a09g077_gpio_configs) * RZT2H_PINS_PER_PORT,
 	.port_pin_configs = r9a09g077_gpio_configs,
 	.n_ports = ARRAY_SIZE(r9a09g077_gpio_configs),
 };
 
+static struct rzt2h_pinctrl_data r9a09g087_data = {
+	.n_port_pins = ARRAY_SIZE(r9a09g087_gpio_configs) * RZT2H_PINS_PER_PORT,
+	.port_pin_configs = r9a09g087_gpio_configs,
+	.n_ports = ARRAY_SIZE(r9a09g087_gpio_configs),
+};
+
 static const struct of_device_id rzt2h_pinctrl_of_table[] = {
 	{
 		.compatible = "renesas,r9a09g077-pinctrl",
 		.data = &r9a09g077_data,
 	},
+	{
+		.compatible = "renesas,r9a09g087-pinctrl",
+		.data = &r9a09g087_data,
+	},
 	{ /* sentinel */ }
 };
 
-- 
2.50.1


