Return-Path: <linux-gpio+bounces-33214-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kDyiNjM+smk6KQAAu9opvQ
	(envelope-from <linux-gpio+bounces-33214-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 05:16:51 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF9626CFF5
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 05:16:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B1A0F303F47A
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 04:16:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFC7C395DAC;
	Thu, 12 Mar 2026 04:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fb49oqSm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615F2396580
	for <linux-gpio@vger.kernel.org>; Thu, 12 Mar 2026 04:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773288975; cv=none; b=NNpbRIssaZZVGXirH4XcSlRX5XG1w4z6GX+vfoUNnFDuiTskscT7SzF/zIm4hGwQeJ4vgLJB2J3GXHIRgM2hKjMh7tbznLD7l98E0jF2o7NiSt4vdYO6B2qwXva8VHx0b/WVkEkohCwxho4QWoqdCHvbFONXMApudRnJbryF1LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773288975; c=relaxed/simple;
	bh=FBOaVAluo/5aHc/lwvDS5glu5xPnHou8L60dlb5IY6o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lBQryiAMTmOFvIe7cGJ6BQS3lq9F175DDht3WSmZdrFqtmqjcLfTN1CL9DqD2bJFXTQ8rB91x0Cy1Zwo9u31lkHrrHBXdPRs2+mIdC+a8takmMV2NiVBck1WpU0TdMLFM9y8ltq7TbMFn3ThZKJutXbFCebycL10aKB+Jpw4yE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fb49oqSm; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-359fea895b5so319419a91.0
        for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 21:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773288973; x=1773893773; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J243xpU31bBbVlACRT5AgcKckiL1IQqdWNfb3EEgNIU=;
        b=fb49oqSmvYxNbabZO7J15k6Q3Z347awvpW9pThwAYLyiU1gC1KhttkJf8leY1j0BFn
         FoOD//qCvgKOoaRXiBoXMY+C0dObJCYqqzABHAJKkYxSeVt1Hc3UbCncNAYK057GOIRy
         UYIwAQNo22bO8i+PUGtUNCNiFCw0lhMdKRLLSobDnOG+jFbbzGxFsrrrrHR5A4SFuGIa
         h2IA34fx7+77uNrGDrToGmY/Op3T3Vmt33XG3Fj+gScu2bz5lOdg1J1lx7F+PCln3ZzP
         BO70UROSLmXgnqLrO1imWY3we9di4isMDlulbOXE1yjf6tLz0aeIYret1m3YvaZBvZJg
         zz2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773288973; x=1773893773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J243xpU31bBbVlACRT5AgcKckiL1IQqdWNfb3EEgNIU=;
        b=Elnkxj20O/MVttoGXVoXiYv49PpHaMgbG4+sT86WqlBfwG9Vgd3z/Z0TvQcjfzkfoN
         cnq6w8jauj3X8M/vXMyteFtKR6YDCHYaXxpDytRKa4Wb1RyN0JNpHDQi9ZjL0wjrzrLk
         8ynKnSxxkIcBrEmpVhcK8H0pGLlxkYeN2T9CYFj1e+XicceUbwI1UN3AgNxcSJZyQ44u
         xjqpelV9gJQs32JA3oBp2OZd3im2CY4otLmuNRCTsQHSEVrQ6/k2QvDGNseqyB+4rLvl
         VLN75KlIxZv1dNTIKIT9xasj/JzLG7B4FnShOotNrp7f/WwuO2u1W3o0qasR8g9/f96y
         aCBg==
X-Forwarded-Encrypted: i=1; AJvYcCVsjJ+PvyDOPC5892ChDcdWoYv6F41c2smOw85SvJjXxxQzt6UylGxYKZO5Ca6j3EJMt436r9J3jceW@vger.kernel.org
X-Gm-Message-State: AOJu0YweTJstkwH1zSci9cE8xqseLmRKAP0nz0SgGTHizww+z9avEjiO
	FIQy0fE8tk/fi3zOEBo2qLjyhHjVZIjTX0PM576mgFhzjWswEPgagtix
X-Gm-Gg: ATEYQzx5+rB2y9IB7J/aqGGREdrq8L5Bcc60vvkeq4tWX8oAXwaZz8mXkmPg9a4Hw4S
	l0nLCs0Rh0De2W0bntX6PZJpp5xA43RzTOfsKAMIvNboc2spwhQuw+NDr8eEjguUSAyHcNdY4Lm
	8RL3Wg+8nQDCKjn+7Kjv6u6uR+oiQLkXtkWmZdBBQIhbgKCp+SbFWjrtJh2K7kAliU3lXw1bQG1
	yPh3ctUJ/SF8p8j8G172JsgdH5e18Gp+6oq7LQQMjt6nPWouHYoACCBI7NcynvFP7PzM84MF2KX
	GZ7QBeqxMrp3s1PKwzSZoIlm0mMtVmYSsPfnj2tgvlykItuKAOOhRjqkRDZPelC+Z2XFmY0dJf0
	zJPV6/1Bkv/RBQ2iizoSPk6cg4DTWbGF8MuwX8OSn0Ska0irqEv5yYIMIwhSd7OjMv6lBQ3gS7L
	wjUW1lkkt8k4sfs8Nz7cqUKAkLjlhrXGonYn2ZBPOi30kl8qOtEgyE2UqtuTFZ7a1wY52I9usPv
	bzove4=
X-Received: by 2002:a17:90b:1e10:b0:359:f69a:f7b7 with SMTP id 98e67ed59e1d1-35a012b3820mr5127239a91.10.1773288972604;
        Wed, 11 Mar 2026 21:16:12 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a02fca40bsm5018229a91.10.2026.03.11.21.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 21:16:12 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	sean.wang@kernel.org,
	linusw@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	hui.liu@mediatek.com,
	nfraprado@collabora.com,
	linus.walleij@linaro.org,
	mars.cheng@mediatek.com,
	andy.teng@mediatek.com,
	hanks.chen@mediatek.com,
	sam.shih@mediatek.com,
	rafal@milecki.pl,
	ben.ho@mediatek.com,
	erin.lo@mediatek.com,
	zhiyong.tao@mediatek.com,
	Jason-ch.Chen@mediatek.com,
	amergnat@baylibre.com,
	seiya.wang@mediatek.com,
	tinghan.shen@mediatek.com,
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH 2/6] arm64: dts: mediatek: mt7981b: Fix gpio-ranges pin count
Date: Thu, 12 Mar 2026 13:15:29 +0900
Message-ID: <20260312041533.187553-3-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260312041533.187553-1-akkun11.open@gmail.com>
References: <20260312041533.187553-1-akkun11.open@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-33214-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,mediatek.com,collabora.com,linaro.org,milecki.pl,baylibre.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,collabora.com];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[akkun11open@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[11d00000:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6FF9626CFF5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The gpio-ranges in the MT7981B pinctrl node were incorrectly defined,
therefore, pin 56 cannot be used.
Correct the range count to match the driver.

Fixes: 62b24c7fdf0a ("arm64: dts: mediatek: mt7981: add pinctrl")
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt7981b.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
index 4084f4dfa3e5..1bbe219380f9 100644
--- a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
@@ -332,7 +332,7 @@ pio: pinctrl@11d00000 {
 			interrupt-controller;
 			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-parent = <&gic>;
-			gpio-ranges = <&pio 0 0 56>;
+			gpio-ranges = <&pio 0 0 57>;
 			gpio-controller;
 			#gpio-cells = <2>;
 			#interrupt-cells = <2>;
-- 
2.53.0


