Return-Path: <linux-gpio+bounces-39896-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kjrYALV0UmouQAMAu9opvQ
	(envelope-from <linux-gpio+bounces-39896-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Jul 2026 18:52:05 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 469E174247F
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Jul 2026 18:52:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="qnb2V/4B";
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39896-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39896-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 18A53302DF77
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Jul 2026 16:48:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CE413C4B83;
	Sat, 11 Jul 2026 16:48:49 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9393CC314
	for <linux-gpio@vger.kernel.org>; Sat, 11 Jul 2026 16:48:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783788529; cv=none; b=qMgsFbipy9IFu+XdgzDXlftZYfqTCMa49qkiFO4f8VCBouuSLY6K6k4kg1ymyqz41A7i3VOnwbtxw6RcKWCJivjWfW5r3K6R5rE4BiQ3A27D5+6W1qqo7OnT2eHGX250oOdEvigKu3nG6hlbTLXnrpwhuOgh2nT9RSSzv2jLPgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783788529; c=relaxed/simple;
	bh=yVMP8UAtXlu981/AZfXfuu6ntdCZq3l09RETxP3vnIQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UB4ffSor47dlEIfXylWhDmvVkW9ghOsA2hXaTJkmKnwMS+psPSjjG+yuX8GBvXQ1GUyjkAWWfhfkYLtqC3NjHQd3w1tVjjPXqP2DXTTVtSgvSV3i2+ofiwu5UwqnW4BDN46u2vLbOxPOJ7moV99HeAEHM0IBgueJ0t620KzykBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qnb2V/4B; arc=none smtp.client-ip=209.85.128.42
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-493f431e317so17017435e9.0
        for <linux-gpio@vger.kernel.org>; Sat, 11 Jul 2026 09:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783788516; x=1784393316; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VDpn6H9slILEKuaZA30ay5+GU6mS2ER9t41k8f7Sm/c=;
        b=qnb2V/4BHecTg/Bstd2nMyetg96JxjdqwwEPGpBQV5kC4m6oim5hvw2ownjnEQoxYH
         EM13pqUiExGCOUWveiovV5Pg48IAbgut8sqqnJT1ALmvnN2KD87IcZCFd9ImEvkfXxmn
         Doi5wQsapjWOtcNS9F8g1TKg8Pyi1wllbLirUo2oHlNM/nli0n97PJydxOhtrLmE8wed
         hdCSoFHJBZWA2Zo0IDzpfwIi9CgJStbrG4wfrHeYTtW3TPyYJbZhXEhJ5SJgWmChmn03
         II5dudICvCtO3WqRhour/Sp9RQ/Apou673hl1XN0cR7SJPXMEnuGTo9+3d/XHS4k/ZAi
         +G8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783788516; x=1784393316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VDpn6H9slILEKuaZA30ay5+GU6mS2ER9t41k8f7Sm/c=;
        b=XVee8TLxG6ShzShnTh5gF7s9A5mx3yODFFi0N5+rfBm4JzMQIOQlJPrdhNDnl9cZRH
         Vmkua2StaGDvigQs6WDqikWcJ6EqhXYFWSR4i4Jnme03sAtmq04L/XWJNBBaJJDaJfL4
         vlImbt04JdrhLbpI4X1QVzt+NCLf2kJI2uWYoIu1CE4zJDLtCH8F+sFO3ydeLNPYIANz
         tfRVursRpOtSIWnUgPOYa5IIUnYMZM4Ug5PBg2+Bix5gOejrlWWO5XLY/Jrwv/XLbSLD
         3+Xg8Uw1smc8enIDioJO1xWh4GCbWixhvHr4x1LGbNtOgfE0FGnewbWovphHD3SQcdJv
         ivuA==
X-Forwarded-Encrypted: i=1; AHgh+Ro6oszveyzi36GMrPn83HN/d4crFPiKDYcNl62Ai4X7rkHcoMF9RJ1SfhtxZPL0gopqSx9YhELmjxyu@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2vMiRY7IyOXkAQB4vjgjNPEfcKj3mYpMeMpLxQWGOyw2o6DZw
	jGExC9YyBNtTvkn9IybGpWv2LW28DCj8q5VGUZVtINAsRhd9JyDqw5/a
X-Gm-Gg: AfdE7cnzuFnzxDuAktToy5KR5s15T7kB+c8axQbCJZmbXDgU3Z9N4AOnoPTbctMAjB5
	6galArUAyWy9fYQfybJaN4CAGnlHpX7wyiBYdLng7aTmGflf3CUhDTdODI6AEX9flsiRnzXKWMd
	dvzzW9ZrF6El1Kk7/PQ9HSboIEtgn1iQ3b+wYyThBnwAe6r74M9a6TZfyu9T1MGYzVs7iws4i6d
	/im4cf8nOmcqzTnBE25GTnV5pm4T4oSJGaW7XDFqvxBMhK2uYn68/LjiYKtjjJcT2lvA3wlhfJ8
	MjhYzhNuOB+/TrU47/+qrLD6Bpu7IAA0XHEAETNgZdpDIv90wEQtDVlZ9hqrE6Ov+OOaNLPGGSD
	/UrC5MMfCA3FMcZ5RaeLKiNbsyPnJTqW5YEPg/HN7wQi5x/JulJsKWd78nWBouD49LOixsEosPR
	pOTYx1hB45xjhnDQ1jgFClsH0pMqD4NVkwpA==
X-Received: by 2002:a5d:5c89:0:b0:476:cfa0:a976 with SMTP id ffacd0b85a97d-47f2dcb60fcmr3613474f8f.5.1783788515836;
        Sat, 11 Jul 2026 09:48:35 -0700 (PDT)
Received: from localhost.localdomain ([95.43.220.235])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d83bdsm69152875f8f.13.2026.07.11.09.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 09:48:35 -0700 (PDT)
From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	--cc=linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Subject: [PATCH v4 6/6] ARM: dts: ti: cpcap-mapphone: add USB safe pinctrl state
Date: Sat, 11 Jul 2026 19:47:54 +0300
Message-Id: <20260711164754.185565-7-ivo.g.dimitrov.75@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260711164754.185565-1-ivo.g.dimitrov.75@gmail.com>
References: <20260711164754.185565-1-ivo.g.dimitrov.75@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-39896-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:aaro.koskinen@iki.fi,m:andreas@kemnade.info,m:khilman@baylibre.com,m:rogerq@kernel.org,m:tony@atomide.com,m:linusw@kernel.org,m:brgl@kernel.org,m:--cc=linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-omap@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:ivo.g.dimitrov.75@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:ivogdimitrov75@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[ivogdimitrov75@gmail.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ivogdimitrov75@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 469E174247F

Add a pinctrl state that configures the USB interface pins into a safe
GPIO configuration. This allows the CPCAP USB PHY driver to place the
pins into a defined state whenever the USB interface is not active.

Signed-off-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
---
 .../dts/ti/omap/motorola-cpcap-mapphone.dtsi  |  3 ++-
 .../dts/ti/omap/motorola-mapphone-common.dtsi | 19 +++++++++++++++++++
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi b/arch/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi
index 51a858021541..368cb539997f 100644
--- a/arch/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi
+++ b/arch/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi
@@ -120,7 +120,8 @@ cpcap_usb2_phy: phy {
 			pinctrl-1 = <&usb_ulpi_pins>;
 			pinctrl-2 = <&usb_utmi_pins>;
 			pinctrl-3 = <&uart3_pins>;
-			pinctrl-names = "default", "ulpi", "utmi", "uart";
+			pinctrl-4 = <&usb_safe_pins>;
+			pinctrl-names = "default", "ulpi", "utmi", "uart", "safe";
 			#phy-cells = <0>;
 			interrupts-extended =
 				<&cpcap 15 0>, <&cpcap 14 0>, <&cpcap 28 0>,
diff --git a/arch/arm/boot/dts/ti/omap/motorola-mapphone-common.dtsi b/arch/arm/boot/dts/ti/omap/motorola-mapphone-common.dtsi
index acac3c243c7a..475ffe678e76 100644
--- a/arch/arm/boot/dts/ti/omap/motorola-mapphone-common.dtsi
+++ b/arch/arm/boot/dts/ti/omap/motorola-mapphone-common.dtsi
@@ -352,6 +352,25 @@ OMAP4_IOPAD(0x1c8, PIN_INPUT_PULLUP | MUX_MODE7)
 		>;
 	};
 
+	usb_safe_pins: usb-safe-pins {
+		pinctrl-single,pins = <
+		OMAP4_IOPAD(0x196, MUX_MODE7)
+		OMAP4_IOPAD(0x198, MUX_MODE7)
+		OMAP4_IOPAD(0x1b2, PIN_INPUT_PULLUP | MUX_MODE7)
+		OMAP4_IOPAD(0x1b4, PIN_INPUT_PULLUP | MUX_MODE7)
+		OMAP4_IOPAD(0x1b6, PIN_INPUT_PULLUP | MUX_MODE7)
+		OMAP4_IOPAD(0x1b8, PIN_INPUT_PULLUP | MUX_MODE7)
+		OMAP4_IOPAD(0x1ba, PIN_INPUT_PULLUP | MUX_MODE7)
+		OMAP4_IOPAD(0x1bc, PIN_INPUT_PULLUP | MUX_MODE7)
+		OMAP4_IOPAD(0x1be, PIN_INPUT_PULLUP | MUX_MODE7)
+		OMAP4_IOPAD(0x1c0, PIN_INPUT_PULLUP | MUX_MODE7)
+		OMAP4_IOPAD(0x1c2, PIN_INPUT_PULLUP | MUX_MODE7)
+		OMAP4_IOPAD(0x1c4, PIN_INPUT_PULLUP | MUX_MODE7)
+		OMAP4_IOPAD(0x1c6, PIN_INPUT_PULLUP | MUX_MODE7)
+		OMAP4_IOPAD(0x1c8, PIN_INPUT_PULLUP | MUX_MODE7)
+		>;
+	};
+
 	/*
 	 * Note that the v3.0.8 stock userspace dynamically remuxes uart1
 	 * rts pin probably for PM purposes to PIN_INPUT_PULLUP | MUX_MODE7
-- 
2.39.5


