Return-Path: <linux-gpio+bounces-17293-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B62A57CE0
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Mar 2025 19:35:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 644AC16C73C
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Mar 2025 18:35:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDD0720D503;
	Sat,  8 Mar 2025 18:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U+BovLYv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05D520C02A;
	Sat,  8 Mar 2025 18:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741458883; cv=none; b=tWiB9H2wJ5TzcuOBzdXHdjYzcsjR/NwFcA9QS2/ySWVWq8ztdzIteoThB8S2hqhr+YYNKhlGsLupvNh4Fck4tt26PKNR8qANFhYwqxyCtAFV7IM7fl1MPnRcN2HCgKFg5YchwTJGYtSX6LhbsOVrb1ggbmEwBQJpYoQaBx46ykk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741458883; c=relaxed/simple;
	bh=exadcfJVkTurDFUaeZb+RqB2u67LeqpkrFjvwrXOI70=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GxPyfdbSCNEKxEWdTvx4W80iaOq360I1zU0GbQTc1DpCLNZsxiHjcpVoxA5Ge5KVklqWbWeRSSyLjtcj07KsNLJkIkPdhFvLMFRHyzbGFy51L+TvK4f8NNcLIwFHJzooQNup9YOOBF7/0y0RAI3b2pDea3cqCwiMckh4gxUVkes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U+BovLYv; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ac1f5157c90so485719266b.0;
        Sat, 08 Mar 2025 10:34:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741458880; x=1742063680; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VQJEYnQvhExzx8TDjhGPNTh+RNL1iu0t7DvSRmmSgXI=;
        b=U+BovLYvGVUSnN94yoc1yz1cg4GtlHCiP+IaGvwr0Ubfgk4XKBmng+rb+g3yRkwvlM
         if9/IDL/SUus+ZRBdv3tzLksHfO6yMDUtHI24xRCoBJC8oxSJZogYS4DE6vAxjZ361cU
         NAJGTLKfWBuLhV3PjGs5Gei3ZGe62IvxR9R/OUDmdIoQ1fQpC9AetcJR91fZ2m5iveHz
         7dpnpnWYsXEep2r60iT7V1Ks5L4xigfbcJV+a8upf9p55N9adP4J9wkD6vtKp2BSZM8Y
         nSdDOsHFXNI4pBRcQIwLjzY80GoQ2COP0aEKS2RxBElXGS5pN3p57Opfa2B8LjZdSfG9
         tP4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741458880; x=1742063680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VQJEYnQvhExzx8TDjhGPNTh+RNL1iu0t7DvSRmmSgXI=;
        b=kXj7cPCoC1pXJ8RZeAQ/pIJGTOQSDKMiD62dvhyQVwmsQwhVZ134gx3IyUKKZN9Boq
         oVx+lU6bIyMoV4wwa88+38lNX5cnetrV7U+25NgEKAIjKP2MqqLBBmQv18sWnFk9HuMC
         4LUpfJAZXhnqbifDa2YtKm5O+gltiwpCO5n1RGhrl4YcArYIfMi/BT/2LKxVTxHeqchi
         UT5Hl8sUR5i5eUoMkeeBk4V2gXUfeSI0S+MSP+1RFVm8J+u7TGwgtww2mg9pbA/tJvYx
         f5y2YZ+q26hs0ygVjqjUiTfigiNOysClJol1WtZl0szOovypcAjlb0CsJbCgGUbRd50S
         +5dA==
X-Forwarded-Encrypted: i=1; AJvYcCU8jIHtQNmPnvN2ByNBw0xkg5lAoWTt1j5mFIghzy9WanxYDtY+eSRQhfEDggWTj4h5PKDwnO0a+14V2A==@vger.kernel.org, AJvYcCUdXTv+GI5UpsemjFDWMu9WzBMJxgC7JF3TvyPFGirZ23jGdHWC0H3LL4eas6jUqRClaznj5hWMFiYiBBuw@vger.kernel.org, AJvYcCXC9yd5xB1Wc+avgHlgyWJAYQdFv5ugUyrXLNocVF1ga5h5JwPe6u823iKWamBQ/J0iMkPS3Te+eJLi6sI=@vger.kernel.org, AJvYcCXnzzMdNt+yHKe2cxIQQbeoqOYV+fV0tRKnxUQI04zpV0t52DwjV74Jm345QTxkKK1LwHsT/l5uymrD@vger.kernel.org
X-Gm-Message-State: AOJu0YyjhgjBO6yJwS/sc1vl2hwYXJz8nXpemxanuvptFNVcgFuCEphh
	LVYB9L0bkmESJjCAhcQr/jKTjupPEToIZgDi95iM93kcAmXej2q7
X-Gm-Gg: ASbGncvk4H4jH6GluxoM4B87ra/lvNczPvsEqE+AGsROUrIA0ldkeiTcT+8jqnZidv1
	RG1z1wv9K1mobCx6PtP04PFgOPtXm9Z3FmJ1B1GOGtc+QuLq+9MDqVf5TsteDltzJHgp4eDghqz
	OwpGA0p5iD/lAVRcCr2FVAnKZ6+Ab5LXolI/vLLL7Cf8Q97CjGxF0e5ymY1UOU4PldAK6n3AAxJ
	Wis/WpGtQfEdukdjGmfro/P+XsIhFatX1edIOPezTL0Sw2yl7zZa4aXGEMlGd3dBiS7xRdx8D5A
	yzKwirq7TJDhzjD9/z8C7uPW6L8nOhAk4JnaLW3gx5k2+M41d/U+8DeVCQ==
X-Google-Smtp-Source: AGHT+IHutThyGnIQqvbIW7Z/8kxkfEm3URL5upQB6kksolklRRYFKs6NUWaDZnidc7rD2PSGBBS0mw==
X-Received: by 2002:a17:907:5c1:b0:abf:4bde:51b1 with SMTP id a640c23a62f3a-ac252aadb09mr788726766b.21.1741458880189;
        Sat, 08 Mar 2025 10:34:40 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac24a84397fsm379693666b.96.2025.03.08.10.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 10:34:39 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Eric Biggers <ebiggers@google.com>,
	Javier Carrasco <javier.carrasco@wolfvision.net>,
	Ross Burton <ross.burton@arm.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Ihor Matushchak <ihor.matushchak@foobox.net>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [RFC PATCH 03/24] dt-bindings: media: i2c: max96717: add support for I2C ATR
Date: Sat,  8 Mar 2025 20:33:32 +0200
Message-ID: <20250308183410.3013996-4-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250308183410.3013996-1-demonsingur@gmail.com>
References: <20250308183410.3013996-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MAX96717 is capable of address translation for the connected I2C slaves.

Add support for I2C ATR while keeping I2C gate for compatibility to
support this usecase.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 .../bindings/media/i2c/maxim,max96717.yaml    | 34 ++++++++++++++-----
 1 file changed, 26 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
index 1026678a17a7..7d77cc9dcd96 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
@@ -83,14 +83,6 @@ properties:
     required:
       - port@1
 
-  i2c-gate:
-    $ref: /schemas/i2c/i2c-gate.yaml
-    unevaluatedProperties: false
-    description:
-      The MAX96717 will forward the I2C requests from the
-      incoming GMSL2 link. Therefore, it supports an i2c-gate
-      subnode to configure a sensor.
-
 required:
   - compatible
   - reg
@@ -98,6 +90,32 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - $ref: /schemas/i2c/i2c-atr.yaml#
+
+  - oneOf:
+      - properties:
+          i2c-gate:
+            $ref: /schemas/i2c/i2c-gate.yaml
+            unevaluatedProperties: false
+            description:
+              The MAX96717 will forward the I2C requests from the
+              incoming GMSL2 link. Therefore, it supports an i2c-gate
+              subnode to configure a sensor.
+
+      - properties:
+          i2c-alias-pool:
+            maxItems: 2
+
+          i2c-atr:
+            patternProperties:
+              '^i2c@0':
+                $ref: /schemas/i2c/i2c-controller.yaml#
+                properties:
+                  reg:
+                    items:
+                      max: 0
+
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
-- 
2.48.1


