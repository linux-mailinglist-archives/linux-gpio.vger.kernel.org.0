Return-Path: <linux-gpio+bounces-17302-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0F1A57D04
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Mar 2025 19:37:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 901CE1893472
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Mar 2025 18:38:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A436F21638F;
	Sat,  8 Mar 2025 18:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S657sRJh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D446215F6A;
	Sat,  8 Mar 2025 18:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741458917; cv=none; b=D/JEpdJ0ue+2cQptgfbbuiOL+CpYhnTeAj2l+LPlB+CReMAZEysrNuW4HtLp0XUJvsB2UdbC/qeRWB9gs5BJRDNaxAkIN28+R/HnGQyDlUBzsftRQxZGRwsvMgJY8/kcaUIOZU2FBMq1Dba/PWDM8THV5I9w7/uiFu0y7WlSfd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741458917; c=relaxed/simple;
	bh=BJzpD4gfPGejKywhP8UPgiRX4+wHEm1Y8kRS4kT9oec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KRKnBN+j4GneeI3pSkLjTVyC9ILSuI7tKPDZ9kWJR8g3892pdaHj9ATBioUL4QzwqwzpEqshmGWymzYxMAWRnPK/+4CHvy/S3MVjno/Jr2mQVennksJZx46a498RWBQqXOcIccdBYnEE8niNfmIsNwtZw6WhuhlSBLLgLfUOjcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S657sRJh; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac25520a289so299913566b.3;
        Sat, 08 Mar 2025 10:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741458914; x=1742063714; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J6+z5mwvOpLxFkXjmRmdjGwPnNX9qEV+1prpbhSFJtE=;
        b=S657sRJhQjHyCN3jHwVBrxYflLgIhYCizROulfRCLp7g/pADBJ4msIDchnrbb3n1Ao
         GTwmlAivF7oEb54tqkvQ1w3H/chXOFAHcBJsQc9gWHd/TNTErBwQBFUgEo6kewLk/ufJ
         Oa0gRyU3gZPgzk+HuQUci1MVMEA9oyYjPdzadIMn1CKZAs7uKzOQxkuvpEvz5nN10b1S
         ltffdnjqWj8lmu4IJfrRsWp6yIX18tu0xXTHYI5d1ip+RWFnmAJd2AesT90lQNRUXarD
         13IzJXfGPfbeApmefid6IbMHF0A+FvsbYrc9f/In3CdyaPm+jLyxotiCLmgSdoZJHnFR
         AMYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741458914; x=1742063714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J6+z5mwvOpLxFkXjmRmdjGwPnNX9qEV+1prpbhSFJtE=;
        b=ISo8cx26gzKvYV4mrw9gPt0kmkaWsmt2sJxQBhBQSLWyOUU+8SAAfhVoG94BFpiO/N
         ztumRv22mzPn632stU9tZ1elJBn8NYhXie78uBQnpdnElJzK8XFS0V72cHW8BKFhWfrB
         uwXXckIZAuSThxhPWDqwdSnOjqjKYXdNxBfVkqC9G79McU7udEtgaR1AqR+ADyEJ/uZy
         Za7UP9Y/AsZRxj+nVhpGX8lwC3vMSqtFykW98L0szKfFKfi6QI+T8WBOGZ8r6H9jW1yL
         5tvt79xOEe3fLBFCgjVZ6wM9nXM1Z+KMRtjfQg0mGaxQ5sIdSc4dANJ5oSfqLg7AJIKC
         NlEA==
X-Forwarded-Encrypted: i=1; AJvYcCUsAAUzrlHcTQ1/e202RS2kWgLE/G9lydapQz2TkOOmuAVMFacVW/racSenZFZC44bQkHnu7e5QLzPP@vger.kernel.org, AJvYcCV+LThbZqHv4dZEJjODZZyMnoQ/oKcxBtc0dqYNdpfjbzzROqKlxOEhJPYBbrxnE9q8ck0L2WM1CdpaNQ==@vger.kernel.org, AJvYcCVeQNuWUOHLIkjTuhu52bX1aH4Fex2753Ik0Oq4eDrdxtMcR306ALpOGKYgH3KDOwNfrsn12ZatHdLU2K3g@vger.kernel.org, AJvYcCWaXle//hx/ByEB0KJhsVnbjHp5gJzO2Uo4ZtCh9NMwjuwIQhIswhOZBIJGACuAphpK2A8cUXRoiHsiB4Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrsjfWYZaSsompQfP7onil6uQcFUALHyoYam7/3bXMeKS9x+Tj
	68vhEno4VZ2JAci6oQZb36OVNqR6s+XXEeK05eTBlyV1/sQFVU4T
X-Gm-Gg: ASbGncuogULmsEzYNoKPMOXoR3z5Q2Roqp+cSOleyp1lirptCGhCBBGmxjSel7lkE03
	q2w6Xo5Klag5oHsmonG9ANltax8TB1ekB95YmvW3FAfm0uoznliTPvIligcjhlbCbJjLUypwhjv
	lbGi4fuigmgWZnwLBwLysCdjXo80v08uEi1DA9thG44+YupmycqUZD3eRCD7jQ0fFIRt52IL+cU
	+RTu5yxJc3R5dCtdAnJfRHGNrAnVtciUtnQeAB6Q32pgSTIShP+XIkPCGhyHWUvQkZAQbByNReA
	clZgtrlDZMUS7t7xh1C6PsXqY1m0MVdjeaZ5Z6s7Gx9zRwLuyf/CN3yI8A==
X-Google-Smtp-Source: AGHT+IFh4qSdAc0ziZwtQFqR3gB3PLHeMZTKtpDvQwy/JOvsAtBLR6l0SztItz/m5ITqfugVt1AvgQ==
X-Received: by 2002:a17:907:3f9b:b0:abf:c20d:501a with SMTP id a640c23a62f3a-ac25264ca27mr967872266b.16.1741458913731;
        Sat, 08 Mar 2025 10:35:13 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac24a84397fsm379693666b.96.2025.03.08.10.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 10:35:13 -0800 (PST)
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
Subject: [RFC PATCH 12/24] dt-bindings: media: i2c: max96714: add support for MAX9296A
Date: Sat,  8 Mar 2025 20:33:41 +0200
Message-ID: <20250308183410.3013996-13-demonsingur@gmail.com>
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

MAX9296A is an older variant of the MAX96714 which doesn't support
tunnel mode, but has two GMSL2 links.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 .../bindings/media/i2c/maxim,max96714.yaml    | 87 +++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
index 5bbd36c55ab4..9c6c79a770ed 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
@@ -22,11 +22,14 @@ description:
 
   The GMSL2 serial link operates at a fixed rate of 3Gbps or 6Gbps in the
   forward direction and 187.5Mbps in the reverse direction.
+
   MAX96714F only supports a fixed rate of 3Gbps in the forward direction.
+  MAX9296A only supports pixel mode, and has two GMSL2 links.
 
 properties:
   compatible:
     oneOf:
+      - const: maxim,max9296a
       - const: maxim,max96714f
       - items:
           - enum:
@@ -109,6 +112,90 @@ allOf:
           required:
             - port@1
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - maxim,max9296a
+    then:
+      allOf:
+        - $ref: /schemas/i2c/i2c-atr.yaml#
+
+      properties:
+        i2c-alias-pool:
+          maxItems: 2
+
+        i2c-atr:
+          patternProperties:
+            '^i2c@[0-1]$':
+              $ref: /schemas/i2c/i2c-controller.yaml#
+              properties:
+                reg:
+                  items:
+                    min: 0
+                    max: 1
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - maxim,max9296a
+    then:
+      properties:
+        port0-poc-supply:
+          description: Regulator providing Power over Coax for GMSL port 0
+
+        port1-poc-supply:
+          description: Regulator providing Power over Coax for GMSL port 1
+
+        ports:
+          $ref: /schemas/graph.yaml#/properties/ports
+
+          patternProperties:
+            port@[0-1]:
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
+            port@[2-3]:
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
+          anyOf:
+            - required:
+                - port@2
+            - required:
+                - port@3
+
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
-- 
2.48.1


