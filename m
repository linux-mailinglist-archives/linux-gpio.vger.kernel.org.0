Return-Path: <linux-gpio+bounces-3118-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 824C984E2A3
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Feb 2024 14:57:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 08F211F2962E
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Feb 2024 13:57:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDFED7AE79;
	Thu,  8 Feb 2024 13:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="OlGpaNXd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F9E78B4D
	for <linux-gpio@vger.kernel.org>; Thu,  8 Feb 2024 13:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707400609; cv=none; b=lqqIjKkMzXo7djAv/9ea6sMr1CX0gtY2w8lgzBPO4hbgH/bVsmYoTuy4Z89rZmi8RNbS6ZhtLxZ5WMtVg/lUkWTi4Z8FyUo8kuqHpjgaDZj/PC1mHlv88tnR5SJe35mKLvd16kIz4QLWmg6n+FhdYCpDmnXagHT4MYZjEilKJ+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707400609; c=relaxed/simple;
	bh=skYPuQdWO1AkU9+D3o2QVU63HV6l2bXIQp429kPeKd4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Djadnwu68IlTd5WunfqJ3T1C1HoaJu3tLNTzaAjxfjxH7s1ODEa/zz+YNdBQsjpVjsGrm76TMfYphbasQHrHQO3boNJV3L+jBfMDCvmjuMFdsfSZo2UdBrNLQnkngMsTQ7EhXMNfeAmpvpXAQLHG/yY3cY7nJGSEuwQwfWNS4+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=OlGpaNXd; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4100826df08so15969635e9.2
        for <linux-gpio@vger.kernel.org>; Thu, 08 Feb 2024 05:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1707400606; x=1708005406; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rf3iXA7Keo5roFQt9T7Mh68I9zCAVJX3CMHwvuW41nQ=;
        b=OlGpaNXdVnXcShr3ygBO8XdtaedFddpHg2wdL5N9a6ViwCwNoZaBL7Ci0XFMQ4cLfw
         iCwDSU3sqOT3aquBU6jA/ZoWLL1BJyqCG1ai1f7XuO+Tjpm2JyZOJlQAhYKdc2VhIK1M
         7EXdT3wdEQLC9ubPowquuIu80DgdnenQ2881a/UcAne0OncPqwDIe8sPBGfJHdnnBkty
         bKhAgmxsUBE4tuycsEJgS78C/RvOMqY21B52+VFlX7joJIsr1sPcCdAgC9utSVX8VuCm
         oKU86XNdAhdxxkk031J3lxQDJVEiLycKiNMT9D4c4TRN91ZupcOzvboFlfn06PUT74dF
         zMqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707400606; x=1708005406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rf3iXA7Keo5roFQt9T7Mh68I9zCAVJX3CMHwvuW41nQ=;
        b=TqkI2jsXMsamhug+N0gPrLLWmLvRtHrqnQ6FAJw9Vdr4usdycJqan+NWUPkG4mCW6V
         SoXzXvuj4Hl5Fvr3N80Hm0+R/tpRqhSbPrMh2t3JCjEr8rNMwGXdSxmZOnUWUyESWdSF
         d80FDCv8tfjtbdHPLc3nE4nDgBdjusgHtx9zGCKG/cnvKzbD7SncEgj9D+ZWQbhlw0jK
         ZFs3sHGmPQgAmlrY09+IVpTWmj2lQouDukqkESrlU5G3M7eYZdmI54y6Ip+ZrjbZZJZH
         /+j8XczJog45FmRZWj+zR5rKoCp8+z76l+XtIWDU/Mx/aVx3v06FLEXOWU3I6BxCAhUg
         phLQ==
X-Gm-Message-State: AOJu0Yw06B4YwTCQTw6IcqGcijTjvMDxL6R3VCiDJB/nkT8uXVXazRs2
	OkbdijIIYPlQHMok0i1UKrPf+wahLeWegqa//tozb3OVuwC7O8+LpLoKHhmO6pY=
X-Google-Smtp-Source: AGHT+IEcOnvELKJtX5OGb3t3vy/9XXEJM6nu2Rc21S/gEbrD5i68oGlfkWJQvZO3eeO3gcnw3ew4gw==
X-Received: by 2002:a05:600c:1c07:b0:410:273:c648 with SMTP id j7-20020a05600c1c0700b004100273c648mr4686357wms.0.1707400606091;
        Thu, 08 Feb 2024 05:56:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVP0VByxBmRXSwDRSjyNM/KONaFZfUmmVOz7EZHhT6QUZkySORR45gVDt/4Xh8qnxTS81pdQsKeVPWNx/+bTAopRQJCNOyk8B/T/Eq6DVR3Z1vdJ1VRqkqMkRuU2hzNRqy16PrszPwQzYQ6MF0+pqBfWluY9vMoTxDKkw+dFnyMBitXm/Wx5VpQKsS+97+b4r9rpxXozKVNBTR8We6fklJkdSRjAap1VbukmhcLLgiwOhGdKJLJWZCxC6C/O8anIf8OD2OlzaLN13Ew2c9WGkKYBs6omzEdJ1Hart/dTPS8hTvmV/8fimZ9pq+ZIYVShHpxVFspEP0dDYreLgJX8p2oVMv5RPEDlzjDpn4FhuSedi0S9+asPn4mDqAlHdf0tsXMrPqOLiDcSpgLPp933DHymXXn2FuWQ89fDw==
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.45])
        by smtp.gmail.com with ESMTPSA id iv6-20020a05600c548600b0040ef3ae26cdsm1703058wmb.37.2024.02.08.05.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 05:56:45 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	magnus.damm@gmail.com,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	linus.walleij@linaro.org
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 2/2] arm64: dts: renesas: r9a08g045: add PSCI support
Date: Thu,  8 Feb 2024 15:56:29 +0200
Message-Id: <20240208135629.2840932-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240208135629.2840932-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240208135629.2840932-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add PSCI support to enable the suspend/resume with the help of TF-A.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
index dfee878c0f49..19bbcae01d80 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
@@ -42,6 +42,11 @@ extal_clk: extal-clk {
 		clock-frequency = <0>;
 	};
 
+	psci {
+		compatible = "arm,psci-1.0", "arm,psci-0.2";
+		method = "smc";
+	};
+
 	soc: soc {
 		compatible = "simple-bus";
 		interrupt-parent = <&gic>;
-- 
2.39.2


