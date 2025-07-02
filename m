Return-Path: <linux-gpio+bounces-22620-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E92ADAF58A9
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 15:25:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B31C5189B9C1
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 13:25:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80A0B283FD9;
	Wed,  2 Jul 2025 13:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jAFRyXqa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FEAD27E045;
	Wed,  2 Jul 2025 13:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751462479; cv=none; b=WrU41pBlpTCMXTePjP5zqgygZyvH778t2osQjxlLfafcGRHDpZpUM4/Xt2eNS1i8W8hcJjiP6vm+i7ERmduoq9f8SiZXe/B7uoGBJhyMDsShoOdQIudVJJToAQ0fTIR/1JLD9Ca81nOd3gOLISLDE1xUUh7YyutaXDAH6A+Bi7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751462479; c=relaxed/simple;
	bh=yNhtigNBLH83jANEaSNQ3UDj0/gZqbTIvADDw0JdcRc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g6VUNlblK8NBaAtreSA0tae5ScMjmrp4ToMl3ZvTgbvETnicMc6o9YryZkGGrQYs+IHDRpzfcaw+gFcKcXSsrJCymyca1Har3vfECtXQ3k/diP5K38jESmQzHf9gOOG6rFSt/pw8/UAHNIxARtNVlSotA8d+8HsVpBSf1hrfgXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jAFRyXqa; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ade76b8356cso842817866b.2;
        Wed, 02 Jul 2025 06:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751462475; x=1752067275; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nPtAO/bCMb0ayQy1ZZ4Q4T0/klypPIiDPkWybUy1oW4=;
        b=jAFRyXqaO8nCLqP9R2DZ4RejQW6iKflaz/Hdj+MciSaGQVQnK81stP/YT4XV/w9BJB
         8DRovHs3z+tno3IyIb0brWfSkm+adQEX9Sx4mDXnMCVJ0o8GwKhvlZWtciLsk2EU/FVS
         qE94vhDvrwGlakiZKukwoRHg55v6Bl7Jc2TJB85MbKYLgsU7WsE8AWAOU8qMKEcAni3+
         VtkSJ1Y3g1dkTNpyeKBmXXJ+TD1x7Ct9wlGeNpnvx7IBclwoXU8Dc1DxpPqlTArLdRYN
         zqxbKhBg0fwNHxMgN4S5ykhic/tlNm1YwsIcxLyxiwpAqPgwNI38yTmpsb7+Q0Mb4mvb
         Cr+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751462476; x=1752067276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nPtAO/bCMb0ayQy1ZZ4Q4T0/klypPIiDPkWybUy1oW4=;
        b=ZtGBQbSpFgxz/r3r56fr4U+xSuj8gIziQ8R8o2TAtMwDnEVwp08aUVyzVuIogsWFRc
         OkuClQVzLvQ3n83TpK1GL9Fe+aQLUavcDv2fadh8xEpZI5Ift4nGVoaAKfIfGNuoX6cU
         2D1G/TMzUpntrEGRCgQDnLtKnqob4gp2ZfNETPM9kxkbE1Zhpzis4vNhTiin0uQdfa9M
         JTgzmU1MM1Yyx10wi5X93/GwYs0D070Iwb8Clq+VmzRizQbkvvc4a4Fd5VZswBWmMeqz
         vPgL5IUAl/d4wwwbo6ABYvZhVpRLDnu2G2GAQ4hAd2V4Su86mZaQmL4R6A/RZ4K1hMCW
         aesQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1iTDrNDebxXcogNeefgBE7RJI9r39rYvp4kzQBKnQyOIN8PSWJnc6Bw0DvajaMdZtg73hU9kgfeiqEg==@vger.kernel.org, AJvYcCWuDApk9841B2vnXHc8fGVfCuQ2/LwT2L8ljgnVibYTVmDzpGrwXI0xwvabcNDwZfAcZKK2a8ShsB1P@vger.kernel.org, AJvYcCXPMAeGGo/H2xyjcvFCT70QK0PNH1iplVfNd9IAFbb2v1pzDIs8fN4nfiz70Uh+GAMP0BQT4eEKYOecdjYV@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1p2+jN6H9BwQxzGwaP6H3QiWXDanqfH3yfyThZgCfm916iccQ
	b0oNISpBlBwqe0FaSA6a+Iixl2GnI3/5WCTSWqvSip8znyhUpCufyClM
X-Gm-Gg: ASbGncuon4+sna79c/vqN5HAWnOK/B3lJ0WdltER7TIcg+mCZgeydKN/eX5tvhozhjd
	M0KbaWCPoCmscf83/bRz/xzReAZWt/Hh3er37gQ44e8veRfJTNJbGIKXRWBRhcStq/HmdqB6okw
	Mh/4P2OAoAHrxCN4WeVmMST+f3W4DWrnYzPcXHEjeSuPkqchHg3SwtVs1lP81pXhIkP3czniwKv
	vmkS/G1lqFleduEDUnifI3OVP/ZRYR3SAgiE8Nxhz44zNi7KQ97yUMhNebjzH9Qz7OlpRHLjp8R
	cBSAKixOUwKS6dOqNuTrEGBpbi6O5Ymk78OaUErTlwcFoHAlWO77i/3Dh6dLVluRRU4IfskCpLo
	=
X-Google-Smtp-Source: AGHT+IEA3de2m4giSGKNLKSmBJkZ2z0wYHzUm6md3r9AFoIBaZoB/eT8gjgMNLZxZI3iFqQoSe+Zcg==
X-Received: by 2002:a17:907:1c13:b0:ae3:b22c:2ee8 with SMTP id a640c23a62f3a-ae3c2dc3540mr275616366b.37.1751462475207;
        Wed, 02 Jul 2025 06:21:15 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b094sm1063800966b.22.2025.07.02.06.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 06:21:14 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v5 02/24] dt-bindings: media: i2c: max96717: add myself as maintainer
Date: Wed,  2 Jul 2025 16:20:28 +0300
Message-ID: <20250702132104.1537926-3-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250702132104.1537926-1-demonsingur@gmail.com>
References: <20250702132104.1537926-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Analog Devices is taking responsability for the maintenance of the Maxim
GMSL2/3 devices.
Add myself to the maintainers list and to the device tree bindings.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml | 1 +
 MAINTAINERS                                                     | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
index d1e8ba6e368e..15ab37702a92 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
@@ -9,6 +9,7 @@ title: MAX96717 CSI-2 to GMSL2 Serializer
 
 maintainers:
   - Julien Massot <julien.massot@collabora.com>
+  - Cosmin Tanislav <cosmin.tanislav@analog.com>
 
 description:
   The MAX96717 serializer converts MIPI CSI-2 D-PHY formatted input
diff --git a/MAINTAINERS b/MAINTAINERS
index 276c5a0b2dc5..c4bf1503eae3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14742,6 +14742,7 @@ F:	drivers/media/i2c/max96714.c
 
 MAX96717 GMSL2 SERIALIZER DRIVER
 M:	Julien Massot <julien.massot@collabora.com>
+M:	Cosmin Tanislav <cosmin.tanislav@analog.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
-- 
2.50.0


