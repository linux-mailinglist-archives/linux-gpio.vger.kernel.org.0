Return-Path: <linux-gpio+bounces-17299-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4A4A57CFA
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Mar 2025 19:37:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7AA943A5B2A
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Mar 2025 18:36:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CE19215184;
	Sat,  8 Mar 2025 18:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HCNgpVxq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C42202F9A;
	Sat,  8 Mar 2025 18:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741458906; cv=none; b=HIpYH5YW9+Lri+wEstuijoM8286uZUIusgxZbIWxud46OMyW00ID4xyJdKG63LslO2Y+otXOcH6m/0dAueXFfRyaDEy76+Gc5xTORO88d+QGXwiwQX0bxJMu+G+K9omnzI1O1wGzjRdfU9emJsWnCI3yg4nf+8Coqtwcc6lMGnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741458906; c=relaxed/simple;
	bh=r1mQgC4DmlmHWnSr+8d+ANzXlBEejCjCRSN8QOb6qhU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f0Pc8nMEbpVBMSPSyEcy931d/CtzpxfvSLAL1KPreqildrD2IcIzkKmX+75c/I2c6Y8GfRE/s0+z0Q9wFQr+AYHtd5pzHXXABntfP8jh58KNJI5MBqj+dZmRZRe4rvBtRApelyeu9w96Jlj9RlaQJgi+5dnxVfnZ32PH6FRK2iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HCNgpVxq; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ac21c5d0ea0so353161766b.2;
        Sat, 08 Mar 2025 10:35:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741458903; x=1742063703; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pjrbihTdUtYGfD1XjXxp/0dpy7KX01NaPnhDGGHP5+A=;
        b=HCNgpVxqdWSy3BSZ5YiE8fw2NrAxXeGehqzfSTC3zM6hmrCBjv4T/ShrxvrPTKT0BN
         XYyhNJw4UulIDtdhxwqQekRLU3drXboq9no3wSBchejc47iMCiJBpIGumBH1MQMKzVMa
         +oKMAIMI24OsQSHBJyNeQKdWwwzqtrzu/GYx8b9MK0ZbmiAektFOymGDs5sqR+yDS4Ek
         QOiKkVqjKRBAkqLyRR7ILKmHgKo7VHtFxqiOn6gTm86w35F6CXK25j58k17GIHzdkFQR
         8HLhwzCgboJ/08jdSRkUDCTI4RzEXxseBuqrCEnLWKYpq/bafPL26xAMC22VnNlm9JbV
         dhlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741458903; x=1742063703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pjrbihTdUtYGfD1XjXxp/0dpy7KX01NaPnhDGGHP5+A=;
        b=physdrqBonS4nT3SGaI6UwdqbYjikK/Xva6Z4ShK0tVRbELJD/54lODvfROVWBWO8/
         0ULuKSExV1Q1KOdrCm+OHeWDIu3oLBR6LD8SI5gVLwH45jMit4wCqlRvdtLp60DFFGmG
         0e//spF3N1aEcbZLgprsfzq/svjV0Uk4igbGklJY5B5EjGmSRYYSXO91ayDWZOM7VIZY
         V//zoa/WOyOoBdZcBkzQkYZTgecAkeZajinBYaMQ0ObA0fZr0YnmjRoGEE6S0S+9I+uM
         Cf5R7uuz2QDvKQ6D3kFMLKs3IVy/lcbgHZbsPPnhlwekVJHLqSweQVqltIfxqbDfcUpZ
         sF7A==
X-Forwarded-Encrypted: i=1; AJvYcCVVCYb4xNPrQssgc4BwkhsYJ0syqD3CRaHD3wOiD2F7QzfzqZ4TyhDIYxj/TEU6/dsuEIAGJR5EePjQDA==@vger.kernel.org, AJvYcCWG/apZalVpuXQ139WjaHYqccjIY8HwOfzV951QYv3DvV1xI1d9ooBQiQPrzYYB3BwCNRlrTZAce1HYJWM=@vger.kernel.org, AJvYcCWj/EB/DUrnNPgz32qXP3R5+8UipTYsNttoNdEtOMF5hUKcTrNX1aDGJt/7OC1Ra5HSJsF9k9NsGKJu@vger.kernel.org, AJvYcCWsG/iBai1t0tGcC1DkMfD4ZW+Aqb0XFYk8rODFp2D/jDl+9XmXBhtYRblKbpgCflYNR7gy447KtyhL3PM4@vger.kernel.org
X-Gm-Message-State: AOJu0YxksBKuyQ3QtzohPJydd6rferCpSqPQqTSoKZhFmMvG7V+EzH+/
	ttvv7ibu6hHf63etjifAlEA5aQMiXe/UV/HL8YW9myZ7tdwFNfFn
X-Gm-Gg: ASbGnctQ3f5KT8E66++UEQlAP4FTsol30xefgy/A101CvhkrkA62rRECB1me/ApyZIx
	9MFV11mjN3/p83PNIvFwuLKT93L41M/lgve/4XfwAGh+W7pexhWaanosRnBmViSKmAx26hMXnPf
	9WC93laiOfiTvzbFVxEltQRVFzYSJg/5jyG2mc1yAbixbekgx85mXbzspLcQZMrdwhVWrpAEi56
	NVCbPy8ThjzUvFRrivf6C1lDtY6XJKcZ0Adm2153RiZCOOEEx82wV/2gxNQ+brQQfCrxwdsibrN
	7eQiU8Asu5PHT/cruQUbFlV1Wgu+jDv4I7VSkULXDmPwlor34tYVdLu7gn9kYJQstgxq
X-Google-Smtp-Source: AGHT+IGwUeddAVefNrp/Ox4/s1rrU1bRHiJ+ldxf/aGAE6vsUOrAaQ/XHMxMfTJtL/YGjYojnUCfRw==
X-Received: by 2002:a05:6402:280d:b0:5d0:bf5e:eb8 with SMTP id 4fb4d7f45d1cf-5e5e2468800mr19735826a12.23.1741458902826;
        Sat, 08 Mar 2025 10:35:02 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac24a84397fsm379693666b.96.2025.03.08.10.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 10:35:02 -0800 (PST)
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
Subject: [RFC PATCH 09/24] dt-bindings: media: i2c: max96714: make i2c-gate conditional on compatible
Date: Sat,  8 Mar 2025 20:33:38 +0200
Message-ID: <20250308183410.3013996-10-demonsingur@gmail.com>
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

Devices to be added in following patches don't use I2C gate.

Make this property conditional on the compatible strings.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 .../bindings/media/i2c/maxim,max96714.yaml    | 21 ++++++++++++-------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
index 2f453189338f..d0a2aaf7df9c 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
@@ -84,14 +84,6 @@ properties:
     required:
       - port@1
 
-  i2c-gate:
-    $ref: /schemas/i2c/i2c-gate.yaml
-    unevaluatedProperties: false
-    description:
-      The MAX96714 will pass through and forward the I2C requests from the
-      incoming I2C bus over the GMSL2 link. Therefore it supports an i2c-gate
-      subnode to configure a serializer.
-
   port0-poc-supply:
     description: Regulator providing Power over Coax for the GMSL port
 
@@ -101,6 +93,19 @@ required:
   - ports
 
 additionalProperties: false
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - maxim,max96714
+              - maxim,max96714f
+    then:
+      properties:
+        i2c-gate:
+          $ref: /schemas/i2c/i2c-gate.yaml
+          unevaluatedProperties: false
 
 examples:
   - |
-- 
2.48.1


