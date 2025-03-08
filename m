Return-Path: <linux-gpio+bounces-17300-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 40762A57CFC
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Mar 2025 19:37:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6DFA416E574
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Mar 2025 18:37:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 286BF2153D4;
	Sat,  8 Mar 2025 18:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hmy8/yF7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296042153D2;
	Sat,  8 Mar 2025 18:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741458909; cv=none; b=HyaqRyi91v4m+RybSfwReqGrC9MyyuXh4NAJvh+UQl20N2V3OBkt9O0+UEei2mOakgwK7du23FW5oquv7n2MG3tJGqxho81SkehQl2E2S8UY4hFjvjNNnRm9A/YD4GU1L0fank4BaMiJ85x1qhFnfNxF5pIOaMYATr1QxEtvhW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741458909; c=relaxed/simple;
	bh=EOp/22V/izo5AAhRS37CwT1hkJVaRpvHoWf6KSa5yZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FNboPlbuYFqhEd3tNy/k2rJp09jHAfQAOL5GA6+RI0el3zuItKU9sl8OsMRso7MQgGqo9uRwogddAic2QMXdgsX4COV8XIM0u2NqvEUmU9pSw8sQoB5sNfDphL3GA8YaivVhlGTIneSZYP7gwehC+5GPmILgVVZE7XsS8mzmOJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hmy8/yF7; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5e56b229d60so7332936a12.0;
        Sat, 08 Mar 2025 10:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741458906; x=1742063706; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lMGBxKdxUGyFUvUDQCN+Pu7Job2ef1gvSHKYwiDKEWE=;
        b=Hmy8/yF7qgjFQcDhoJ9kFN5hNQ0+5x1DdJv7XpTqTJCw6Hsh4zHFmEJxdrzSeIjhAQ
         vHuyMaE8u+0XnNgU8IUf/2G4Jlbim8bnk1UBf/bS9gksvTMNOBOuFvEAEiGBPZFDCN9F
         c8kC2O1w++pJnO1YcezeBW/zxtIuB2Re3Dxfep9d1VC654A+h+zhUw9+AwFh+bGFLcEB
         jMRe/kXea2QiVqQ3slaAeIFHqpCyHfn76yFEpaTgpZGR06HXSkGor/+UYHlH/IPza7hb
         0/Zff9sddRj/+oOAAUpKXe5oym2FFWDXpEPjbNm5NWxgmfIoY92m1sCU3hpLE3jYuW2Q
         14LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741458906; x=1742063706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lMGBxKdxUGyFUvUDQCN+Pu7Job2ef1gvSHKYwiDKEWE=;
        b=QZ79U/SzigBihlovFyoHw5qhEz4GHqML1omaLZaynQojTWe9u7eAYW+9YdbbOyZBVK
         PCbSw3HChzUs3mPSip2ktZus0RTFZY/KT94kNkGslwrCe7VRq+wdTM4ZWC8kPZIkwRY4
         pvJdJOJRlulPGogDt66PQHEj/IKFxo/NVie/CWqtEUf8fu1hAE7tKptDyZ1OIHxyCVhR
         fO8H9yObV0SS5i9RHFvrxo7K0TCxa3U0Rs6To8U+WvL7hY7LX76wA0DKps/z12aiDei4
         GKqjBbbp5F5VjXISpyKRyPYwUeWfSz1AQFGhwk/gEAnCIQ8zFi27AYTUUSU/T46zx3OL
         bpfw==
X-Forwarded-Encrypted: i=1; AJvYcCU+uO3nB7GLFKFrECFnMqPWERR5gO/kUdz1UoqfmFzWGF8RxlGsysfM2x2vpphR0DcJojBxvBnNRlHdwiw=@vger.kernel.org, AJvYcCW+hFDKDN76nHe2r8gLxkTrT3zqbDhTePAwmaxy5elqz7DsEJH1oQIa5PLKUcZCcql7pnlba/91ctQ0mx1B@vger.kernel.org, AJvYcCWL2yqE3rHXdnlBWXZMb+L4Z/3REUtqF3oH2Abi0p40lyCfipbhqiqmi4AkKEsBySAaOCSXl8zWqNtY@vger.kernel.org, AJvYcCXOI7WUpV9cIsTeOWFXOX52dmQ+iCPW03mEE4tasSCUWgbcGIFcJrBf8D4q0d5f2VfReGOaZdmmFTXN8g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFD8b7KtQz0vgIMo60638B4MWzJAajl5rgvxdoHj5lb4arFvF/
	qq9RmyAfwNSSNYSjLLpLhZksTRYBKQQByYIG9fPDgidohyj+aezN
X-Gm-Gg: ASbGncsfrWwgzL3tELeShRgHf641ssHN6sx67L0JKseCY87gmweHLSZH6nlR6ZG/mJf
	SGpzwRvGA+cqfNFU3LJrMCyC5S1yz/yAAPM7bnWnTHRjrDC8NDVAFtq/3DUulR/wZ4qm1C6VxR9
	19ohj/aph31sT95F4v4jxW8hYwrsR5ORNs+TucMYYuHQQ/cczgLR6jhxtTY82BcsmrMfs464WTR
	FSyX0PclySXX2dmM7rpyfa/1C1B2jjMQXC/1eSzQFAq/odKVQIC/BbbybaHnsPTzLIxR5TTDrRv
	qkiA0XHtJTWjBuMMpPYN0HokORlAz0+oyvrZGc5TQTz5MFinaDH5xSlmgA==
X-Google-Smtp-Source: AGHT+IG1X/LQ5evGM3eWPzIxwvwVI1mcEKQY/cg9Y9a4wUk6EK21LKlTc+rG43P9ZfCGFMaDANzX1g==
X-Received: by 2002:a17:906:99cd:b0:abf:4a62:6e5b with SMTP id a640c23a62f3a-ac26c9d4953mr449641866b.5.1741458906347;
        Sat, 08 Mar 2025 10:35:06 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac24a84397fsm379693666b.96.2025.03.08.10.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 10:35:05 -0800 (PST)
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
Subject: [RFC PATCH 10/24] dt-bindings: media: i2c: max96714: make ports conditional on compatible
Date: Sat,  8 Mar 2025 20:33:39 +0200
Message-ID: <20250308183410.3013996-11-demonsingur@gmail.com>
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

Devices to be added in following patches have more input/output ports.

Make this property conditional on the compatible strings.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 .../bindings/media/i2c/maxim,max96714.yaml    | 90 ++++++++++---------
 1 file changed, 46 insertions(+), 44 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
index d0a2aaf7df9c..f0ae069c93b5 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
@@ -41,56 +41,12 @@ properties:
     description:
       Specifier for the GPIO connected to the PWDNB pin.
 
-  ports:
-    $ref: /schemas/graph.yaml#/properties/ports
-
-    properties:
-      port@0:
-        $ref: /schemas/graph.yaml#/properties/port
-        unevaluatedProperties: false
-        description: GMSL Input
-        properties:
-          endpoint:
-            $ref: /schemas/media/video-interfaces.yaml#
-            unevaluatedProperties: false
-            description:
-              Endpoint for GMSL2-Link port.
-
-      port@1:
-        $ref: /schemas/graph.yaml#/$defs/port-base
-        unevaluatedProperties: false
-        description: CSI-2 Output port
-
-        properties:
-          endpoint:
-            $ref: /schemas/media/video-interfaces.yaml#
-            unevaluatedProperties: false
-
-            properties:
-              data-lanes:
-                minItems: 1
-                maxItems: 4
-
-              lane-polarities:
-                minItems: 1
-                maxItems: 5
-
-              link-frequencies:
-                maxItems: 1
-
-            required:
-              - data-lanes
-
-    required:
-      - port@1
-
   port0-poc-supply:
     description: Regulator providing Power over Coax for the GMSL port
 
 required:
   - compatible
   - reg
-  - ports
 
 additionalProperties: false
 allOf:
@@ -102,11 +58,57 @@ allOf:
               - maxim,max96714
               - maxim,max96714f
     then:
+      required:
+        - ports
+
       properties:
         i2c-gate:
           $ref: /schemas/i2c/i2c-gate.yaml
           unevaluatedProperties: false
 
+        ports:
+          $ref: /schemas/graph.yaml#/properties/ports
+
+          properties:
+            port@0:
+              $ref: /schemas/graph.yaml#/properties/port
+              unevaluatedProperties: false
+              description: GMSL Input
+              properties:
+                endpoint:
+                  $ref: /schemas/media/video-interfaces.yaml#
+                  unevaluatedProperties: false
+                  description:
+                    Endpoint for GMSL2-Link port.
+
+            port@1:
+              $ref: /schemas/graph.yaml#/$defs/port-base
+              unevaluatedProperties: false
+              description: CSI-2 Output port
+
+              properties:
+                endpoint:
+                  $ref: /schemas/media/video-interfaces.yaml#
+                  unevaluatedProperties: false
+
+                  properties:
+                    data-lanes:
+                      minItems: 1
+                      maxItems: 4
+
+                    lane-polarities:
+                      minItems: 1
+                      maxItems: 5
+
+                    link-frequencies:
+                      maxItems: 1
+
+                  required:
+                    - data-lanes
+
+          required:
+            - port@1
+
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
-- 
2.48.1


