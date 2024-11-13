Return-Path: <linux-gpio+bounces-12964-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CDC9C7147
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 14:48:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1082CB32AF5
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 13:44:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 937C1216454;
	Wed, 13 Nov 2024 13:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="dZ8sZwuF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7189215014
	for <linux-gpio@vger.kernel.org>; Wed, 13 Nov 2024 13:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731504998; cv=none; b=txMMo3B1bbojw6wI4rZRY2vaxk5JBU+5b+2c8g27cQOkzRqFP8UZHAXSXl9BA6SFWGjYfWYki1DauADimSOB5G/haMpSpaSeaFcGuyCSgJLJq/M1smQblHb7a79Uby0Rt7vzDi/egSzcaQEAsr0fC5haMZ1pdeOVswsDImyGF+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731504998; c=relaxed/simple;
	bh=DXqkEsEFafo5gzhgygX2LHxqn5B71xDGuEPoHC7uuxE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Olr/s6K3xIx1kMjtPSD4IFkYZL1Ep2ERfzPL+5+g32n43CkRgZXJ2O44NT1qKVcZKtpWTUr93SfrIi/XrPOrMq/yK7t0boFRsaL5ftmb8ADmK/xKdxYvkORqNTIrRTaL7OY5dKnmItbJSgTg6FMZkl8UTZM4dv6sT7xAvqhirmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=dZ8sZwuF; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-432d866f70fso2379395e9.2
        for <linux-gpio@vger.kernel.org>; Wed, 13 Nov 2024 05:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1731504995; x=1732109795; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ecd0Mof7jXO15WeLDSECeNnma82ax84EAenvyaM/htc=;
        b=dZ8sZwuFgzApku4oIqYpfi0yVtTtTK1qR7SPRRT5B7lt3AeqmEWfDq6iSuDO39lx/k
         cVaKmf4KD8KRCX2+8lUa7avT74ejbk17Ep9Pyp1ie4VREwWWO5FNjjmItusbF3CSjzEW
         qts2KBi4GFbNhXFdsEcCtlKt2ZDG3sdWklweqcEKR8mTwjAbFUC0YDWLSFIV5oQ31QzI
         bNpDAlZVbHT5J31hnVm8aUP9ru1DJ2yXTIEA+wyDow+av+3D+fqs5UgvRUj1QBw7T4jG
         Q5NtkpIb9zufqBVOtUmRu7SMRgDTARu/JQ32WH3eewyeFXrBmBuUBKx1jvK2owsyspuW
         Vpcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731504995; x=1732109795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ecd0Mof7jXO15WeLDSECeNnma82ax84EAenvyaM/htc=;
        b=vl8arVOFe3jFQRkKENeuEUruiSVUFPasO2Ge/edq4fTPoL16AKl33Zxtueqhs8N8uS
         1J4B8Q+xLXuCm/erYtKUGiKhgvI8yiuP/gbzdnxtCNiQto9M+oQln8vp0xYd1fO0jpkV
         PK++Ss1MIfKPq1S58uAQdF+vSJfG1wAw70Y1zBAv3H98S9+J4GCZK1N9BLh9SCo9mkgP
         6MiigG93ApKe3Qj+bNYydRxZTkD1rSojq75w/4JhnbzTqYdb69cP86NuZt3sUYF/u6vK
         UbGts929xkq8PFT7bNf6/WihyMvpf9fjM2vmuC5Aerj9O4l2y+RQh7IhGjUP2urxKjg5
         UDfg==
X-Forwarded-Encrypted: i=1; AJvYcCUd0mwCYsr4AT45KgmSeQSOJ+xLAQ5qweEyEPSlLgrMLRW7yhXYGJeUuh/MT8VFR/RS8jJV6ckWMI4Y@vger.kernel.org
X-Gm-Message-State: AOJu0YxRTVLB0YfpVJYkyoFgiZuoGtGQJwSb135gMb1ABMlxCh/t4DOe
	L3c7aOpR7JVXm0wu884Q6dgH7VnB3wYCQSjeBMnnZx98EkvPkCEYim1ezzZkdsg=
X-Google-Smtp-Source: AGHT+IELyaLhsE3PYbeF70nEZe+7NBLbFVxsVluLuBzChJqpUv6UsXqyPsBsDxXq4b7mT1iHHgmc9w==
X-Received: by 2002:a05:600c:4590:b0:42c:b4f2:7c30 with SMTP id 5b1f17b1804b1-432b7515c33mr162135415e9.23.1731504995111;
        Wed, 13 Nov 2024 05:36:35 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432d54e2f2esm25664165e9.1.2024.11.13.05.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 05:36:34 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	magnus.damm@gmail.com,
	linus.walleij@linaro.org,
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 25/25] arm64: dts: renesas: rzg3s-smarc: Add sound card
Date: Wed, 13 Nov 2024 15:35:40 +0200
Message-Id: <20241113133540.2005850-26-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241113133540.2005850-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241113133540.2005850-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add sound card with SSI3 as CPU DAI and DA7212 as codec DAI.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- none

Changes in v2:
- none

 arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
index 6dd439e68bd4..89673bbaee6d 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
@@ -44,6 +44,23 @@ key-3 {
 		};
 	};
 
+	snd_rzg3s: sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,format = "i2s";
+		simple-audio-card,bitclock-master = <&cpu_dai>;
+		simple-audio-card,frame-master = <&cpu_dai>;
+		simple-audio-card,mclk-fs = <256>;
+
+		cpu_dai: simple-audio-card,cpu {
+			sound-dai = <&ssi3>;
+		};
+
+		codec_dai: simple-audio-card,codec {
+			sound-dai = <&da7212>;
+			clocks = <&versa3 1>;
+		};
+	};
+
 	vcc_sdhi1: regulator-vcc-sdhi1 {
 		compatible = "regulator-fixed";
 		regulator-name = "SDHI1 Vcc";
-- 
2.39.2


