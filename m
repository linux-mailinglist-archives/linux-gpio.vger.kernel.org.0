Return-Path: <linux-gpio+bounces-22626-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DAEDAF58BD
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 15:27:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B1F34E0964
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 13:27:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA81D28A702;
	Wed,  2 Jul 2025 13:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e09wJlZJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE29528A3ED;
	Wed,  2 Jul 2025 13:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751462492; cv=none; b=iok6x0sEQo5JBJOdpckI0b/IyWHEBkfP08liaTcj59YZ4dUwt95Bh7ooXG6xfoEOaD5sV7U0lDtXnXJ4oV6eo8N7XLOH3M7ZubRpgD/Y2ahexvqhWyQin9QUER7TT9G/tc8gdG85OL3u3SqUytBEwWZG12d/2YLnvvVCiCAXBiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751462492; c=relaxed/simple;
	bh=/f22tLl0QicT2JvxTw25y1ue8KTJHB9qGNyEU0QNbnY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bnlSugMMnTp29LlEfhumNZA6AQDLC57zikW7p/n3N7RcDDfUzthAEOFaqY4UfCq8vVAYrgO0YtVpobIQL2M+FkKYrLek2gPrYmqc27nO1WaMkWDh73HgeSMNmCtipXf+8epMfVdGAE2h6fFgBR+sntb14+u+cCt8nVLi48nieJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e09wJlZJ; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6088d856c6eso12635359a12.0;
        Wed, 02 Jul 2025 06:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751462489; x=1752067289; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KXo7RwJkGdY7uM9iH8W5HiYNzQJHvSV6wI6qYgD9ZKM=;
        b=e09wJlZJTjGpmsn/ppP2lRTe+svX03ygpHAj459NDl2jCkzyxjPpdRaIVB02rIu34O
         E8Np4KTxom7xFhCr4A8tnTJrPHA7IM2cmrHQGjkcK9127vhsGlaMOSrCmOUpIQhtibQO
         Btdz7EFDLSkaEHxHQG3Qfrs0/KpB336en5g9ScciZ09vuPIdWdpSGwGAdMZkTnO2B5H7
         /cKPDzxlW/bVHznhTXYdBhfD3BewpuwGpdMKiGArmnkYbSlpQ23Ut7541SJBLFHRWQIr
         TMsczj9RS5F37/ohMU+lUdnqbMsQX4AZ0wQBPeFf+OAZ+qtnhf6YkCEcJy8zbZbX+tj4
         yUQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751462489; x=1752067289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KXo7RwJkGdY7uM9iH8W5HiYNzQJHvSV6wI6qYgD9ZKM=;
        b=MsVU+7OlfF9EouFFIgxIyKmS10hp0CIQsZc5WR/ZToNcR/YJel529bxGqwNCRm4Dfx
         oosfr2f8Dj89ns5HgurvPGTX2/8JOMD55xP2JjHZAUaCWhhN4SMchNLVK+CtL5/5uMw0
         ZsD+0eACUjRgIF11G1DnUN/HAm7LrHdXm+KdY0OBGPwtpmtuaJyDLTOpFmwaCYd/7QAQ
         0+e17qcI77wWhrKWgRrBcX8VfLjZozMLMpJpOqgqIzLd/I5TyCoeWFe6T4JXwvbJEhC3
         ikv9ZerROrv2pwFfsGBebBgYwT5JAVLmQdRGr36tiEvV6OuLvIZQMT4f0veJtxXF5+Tk
         p73A==
X-Forwarded-Encrypted: i=1; AJvYcCUR9LGBTZbGCIzjz+H4z/E5NiT4Jf6tpyTFOm9G32lq7O0rr9UH33dFSlZX8R+f4kwjdfkLIiH8qzJz@vger.kernel.org, AJvYcCW+8TUxDW7ukIoywaEIAbZT5o6RZtxjfDJJAbbagXt2vNJ2og87e0ou2hn/r9dKXuamj3iLjpSbdAseFQ==@vger.kernel.org, AJvYcCXGc8/HiTccEZCVdj33zVaf2ajWbFht0/CU1cSKYFZizp7Qnileh7CZ41fKmxK9AJ5g0D06sjMpouSZi1rN@vger.kernel.org
X-Gm-Message-State: AOJu0YxOmcEpp77zge/h7YP7gTjlxKrPLgkqCkQ0m1Zpi1Zd0w9WXuRM
	mBRhlrmXRYLgdYrsDXMUS3qY4PeCmjhrzvYxYvXA+cbpt8isaM8y+MnUTxcb/g==
X-Gm-Gg: ASbGncsFMPTzpXQj5v+ecYV2KXLABaJ/iGSp26kj6HtCDUQ+JOTKq9CBJ3G1lgSSFC5
	7c03sBLLa4Y107n8pzYmmlasCy4eME0OUbPnabrJoJi4ppeAEuDb1jJVGDaaQ42DCIlCRRUj2by
	BJlVdQWPMaLc4oeDMikmW3suFHZq5vs3iugfRY/IYIF5Br7SZmaXN34Jw+JQPZNscXed+FHeeAx
	6qUWV1zZ49nUPd/v9oPQfFRNqrvUEfG/DDg4IkY+wi0VxyjX0VZA52miP8z9EE1dcdErwhQav7N
	zZ8SrAZLMuULk17lOyzEy63GIJ30r2nuG+ppBrqxLImIjcdRvFXifAszHZN9fHUHe8mPV8eGbw4
	=
X-Google-Smtp-Source: AGHT+IHTtF+lt1S4NFZQvii0Blm1rrAjgb5g9dP5Vwg0W84+je/og3eED034lCfhI7vq9B1qdE1n8w==
X-Received: by 2002:a17:907:9816:b0:adb:469d:2246 with SMTP id a640c23a62f3a-ae3c2b01b35mr292245266b.17.1751462488815;
        Wed, 02 Jul 2025 06:21:28 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b094sm1063800966b.22.2025.07.02.06.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 06:21:28 -0700 (PDT)
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
	Cosmin Tanislav <demonsingur@gmail.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v5 08/24] dt-bindings: media: i2c: max96712: use pattern properties for ports
Date: Wed,  2 Jul 2025 16:20:34 +0300
Message-ID: <20250702132104.1537926-9-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250702132104.1537926-1-demonsingur@gmail.com>
References: <20250702132104.1537926-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The MAX96712 and MAX96724 support up to 4 separate PHYs, depending on
the selected PHY configuration. Use patternProperties to document this.

The input ports are all the same, use patternProperties for them.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../bindings/media/i2c/maxim,max96712.yaml    | 29 +++++++------------
 1 file changed, 10 insertions(+), 19 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index efdece2b33b9..f712d7cfc35f 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -40,27 +40,15 @@ properties:
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
-    properties:
-      port@0:
+    patternProperties:
+      '^port@[0-3]$':
         $ref: /schemas/graph.yaml#/properties/port
-        description: GMSL Input 0
+        description: GMSL Input ports 0-3
 
-      port@1:
-        $ref: /schemas/graph.yaml#/properties/port
-        description: GMSL Input 1
-
-      port@2:
-        $ref: /schemas/graph.yaml#/properties/port
-        description: GMSL Input 2
-
-      port@3:
-        $ref: /schemas/graph.yaml#/properties/port
-        description: GMSL Input 3
-
-      port@4:
+      '^port@[4-7]$':
         $ref: /schemas/graph.yaml#/$defs/port-base
         unevaluatedProperties: false
-        description: CSI-2 Output
+        description: CSI-2 Output port 0-3
 
         properties:
           endpoint:
@@ -78,8 +66,11 @@ properties:
               - data-lanes
               - bus-type
 
-    required:
-      - port@4
+    anyOf:
+      - required: [port@4]
+      - required: [port@5]
+      - required: [port@6]
+      - required: [port@7]
 
 required:
   - compatible
-- 
2.50.0


