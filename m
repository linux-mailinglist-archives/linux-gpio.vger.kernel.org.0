Return-Path: <linux-gpio+bounces-39908-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /IQELLqrUmqFSAMAu9opvQ
	(envelope-from <linux-gpio+bounces-39908-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Jul 2026 22:46:50 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0690A742D8B
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Jul 2026 22:46:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=iS96HQZy;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39908-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39908-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E0E4C3022637
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Jul 2026 20:43:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B27CB308F39;
	Sat, 11 Jul 2026 20:42:58 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6903112C1
	for <linux-gpio@vger.kernel.org>; Sat, 11 Jul 2026 20:42:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783802578; cv=none; b=r7T4TKj5PvJGQMoLiwTFo2IP99mgvictzvS5EaxTTEUvabCK86AZ/mpuJjejaMDqSceAOwUcPmb62gTgpmN1A9amXZPsx5IbnDJOonwL+n3mq+pTlREqYKAHsAFN6tzhgVDZMvZgFmnU2HfV1+ubg+TN22wQHXEwF8lAeImdtoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783802578; c=relaxed/simple;
	bh=8gu660Q0u7C0W8t7xo2+vLeynZsPh27OtCchUb5pAFU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=keCYkaLvrEVfi38IyYzx2jW6gWmNchxhRbYoDP1hpJkn7LO77voDZV5ZEU0Gvns4s4mlIzCavaEkB3v8pjWqq59w8haWwCkatnnOcqdC2iH1koUdNXLFh9Y8GyYcbwqhln2+aKjdRpQEc/ZX0nFtR3ceHXT5d+LR2j6lNNp+zsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iS96HQZy; arc=none smtp.client-ip=209.85.128.48
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493b1710405so9299575e9.2
        for <linux-gpio@vger.kernel.org>; Sat, 11 Jul 2026 13:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783802570; x=1784407370; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PhreuQjpg77ctdkAec2a78pglE74GvXVMC9BSorqz4I=;
        b=iS96HQZyK9MD0DIMczLE88UgFLmh8RFub/m6jV8+7uQ17og/euMZEFinDx9d4tHl2P
         BtB2XQ1TBcSxf1oNIEvHR80BIE2fS4/YkIx0G9jA5ExGqGkDnq50I20j+mspbnI5Zro5
         KlKdaNAxFtCC6fhtgLfK+VGlQaHeJBWvmSF65wKo0/+t7mQb03nP3YCaGd8qtfkvB18S
         F19W+bDYQa6FI+/TzuXKwR9bOIdBuv3CRfB5Ut2s5sWnzdtHJmUgpMVOqjT3GOrRKaoH
         qXBCfcbMcZkYj1OknkknyEreOaFPKM8iOksbeklfuqG659LNDedp46y59hP462LF5905
         7SLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783802570; x=1784407370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PhreuQjpg77ctdkAec2a78pglE74GvXVMC9BSorqz4I=;
        b=ZBpaLiO7OI7b4YXPyGmEmoizUPrIDY0HNsJpJUCF2t382MZWVXxcu2H/ixtqGrTEqr
         4UEQHTf+a66J/GjJwtOIgC6Lx/G+xFvwhPeHQDev3thDYcacH5dxe4k22yYOEx2qGg7j
         p9h4g+zJa0b5yxt+4fQBQiV0dVI+ndbEC2SNwZpFKjqp4QmUybQNa4SbOVjfd67E3iuX
         oZoaLkXzYe898v/rANoBNvTb0CDseS4VqpOitW9CsBESUUbkYIrHkyJXtoENsGcsu0+9
         4K8HuQ36xlEXD+TDbYPqYO78TgYql8NbfbWTx025M/Y4z2I7E2A9zjuTzXD+nkbuF0J7
         QSBQ==
X-Forwarded-Encrypted: i=1; AHgh+RqsmFgbVLMHJMfQSlUPVcpWdbw8XKwoeHLRSkgkw6hsvdLt2PiAjXFd1RTBtIvlkI41ZKun/Sc0qQVS@vger.kernel.org
X-Gm-Message-State: AOJu0YzZhCI3nSoOZ3fSJRZzYAd9el5IOgwRpIN3m9EGfDQcPyHiV8/Y
	vXjxlSlVVu9QTIuifDWXRbGnxGfMcIcJvfN9QJwvc3iIsVJT5+yNYtBl
X-Gm-Gg: AfdE7cmp8jP64OIX8vuPdMY5UEfnJ11dDrojrrTSy62xgJyVts8y/AfNWVsI5LGPVt3
	U4Fgm2INphQhkE9JSavZESjWZC/WP8SLIMbXFxhiWh2Kz6FOiA3TVHM/naF9q5CLAW1uUPeygyG
	IH2/60kZH/6+WUrMfrvMrJgDbHVYwgcMfDOCELVtemYA0im/KgC2/CUJEynE6avi/eZTaigdoRh
	QnJ+DQyMyXXj6JMhn3bv3bctMhBsU/A2SSZodLT69BKlhS81b6F0YhmKaiGTIpt9nAMSSwStvxH
	5ZgxiwVv1/HeSoxaGKP5mmPRamgvqfNmWLkAYYycpmhepcD/Gz9u4+fssgmF1CGORPNaH1f+3jf
	lHACE/PgRwKoKkZaogzgbWv+fD7Z6JkZRk2ki1QSCuaF8mVY1At4uMZzphLqj18YDnGmt14zj8J
	BxwRPAwM5ZoMtx3LEgDlWXH6Fw+jTRN83Mag==
X-Received: by 2002:a05:600c:8b05:b0:493:e4cd:def1 with SMTP id 5b1f17b1804b1-493f87e9ba7mr41987295e9.11.1783802569796;
        Sat, 11 Jul 2026 13:42:49 -0700 (PDT)
Received: from localhost.localdomain ([95.43.220.235])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493f2d97527sm172704725e9.2.2026.07.11.13.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 13:42:49 -0700 (PDT)
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
Subject: [PATCH v5 6/7] ARM: dts: ti: cpcap-mapphone: add charger detection interrupt for CPCAP USB PHY
Date: Sat, 11 Jul 2026 23:42:09 +0300
Message-Id: <20260711204210.197144-7-ivo.g.dimitrov.75@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260711204210.197144-1-ivo.g.dimitrov.75@gmail.com>
References: <20260711204210.197144-1-ivo.g.dimitrov.75@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-39908-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:aaro.koskinen@iki.fi,m:andreas@kemnade.info,m:khilman@baylibre.com,m:rogerq@kernel.org,m:tony@atomide.com,m:linusw@kernel.org,m:brgl@kernel.org,m:--cc=linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-omap@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:ivo.g.dimitrov.75@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:ivogdimitrov75@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[ivogdimitrov75@gmail.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0690A742D8B

Update the CPCAP USB PHY interrupt mapping to use the charger
detection interrupt and corresponding "chrg_det" interrupt name.

Signed-off-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
---
 arch/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi b/arch/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi
index 6b1195c2a768..51a858021541 100644
--- a/arch/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi
+++ b/arch/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi
@@ -125,11 +125,13 @@ cpcap_usb2_phy: phy {
 			interrupts-extended =
 				<&cpcap 15 0>, <&cpcap 14 0>, <&cpcap 28 0>,
 				<&cpcap 19 0>, <&cpcap 18 0>, <&cpcap 17 0>,
-				<&cpcap 16 0>, <&cpcap 49 0>, <&cpcap 48 0>;
+				<&cpcap 16 0>, <&cpcap 49 0>, <&cpcap 48 0>,
+				<&cpcap 13 0>;
 			interrupt-names =
 				"id_ground", "id_float", "se0conn",
 				"vbusvld", "sessvld", "sessend",
-				"se1", "dm", "dp";
+				"se1", "dm", "dp",
+				"chrg_det";
 			mode-gpios = <&gpio2 28 GPIO_ACTIVE_HIGH>,
 				     <&gpio1 0 GPIO_ACTIVE_HIGH>;
 			io-channels = <&cpcap_adc 2>, <&cpcap_adc 7>;
-- 
2.39.5


