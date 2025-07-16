Return-Path: <linux-gpio+bounces-23374-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C09F4B07DC9
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Jul 2025 21:34:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9054658694E
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Jul 2025 19:34:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60CC82E0410;
	Wed, 16 Jul 2025 19:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z/WvZKgD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD922DECC2;
	Wed, 16 Jul 2025 19:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752694305; cv=none; b=ku6U7cMlMR9deNSaygEMb2cJ2f/Kw9nJZhm3MpdE/sMAGzfaO8UJnxxgkLoJzu+yboPSKJTpg6BM46LD8huqp8I3YHIMiAYCKOjptIsXETkaDlWMeOuYXOzyIsFFOJS11+pWCeGlIkf+a1CrVagluAYWpG0nubSZ2Os+61RSBKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752694305; c=relaxed/simple;
	bh=NSiAFSJxTXVeWHTLdSPMG/Gzwe3s9N0ySr8pok5YgEs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BwxLGiwngfIFTssGVMfeNLDXcbF/W+0oeoqrIbJsAu40HWMcdA+n9JA4ffXsWGE22nV25c1JAd/VaGHHs5BNXWvviL62N7FDSpMLRoEAovZGG/6wAEDPBQV/BbYv/vzE6WI5KC7+xS2rXift9UquwLC9r7oFM3OfP8VZSo/6sUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z/WvZKgD; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-acb5ec407b1so36329166b.1;
        Wed, 16 Jul 2025 12:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752694302; x=1753299102; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/9ZjlAULE2F6JwrtpvzjiapTBh1bKC7bsQfwLuPPxcE=;
        b=Z/WvZKgDxtuTRRuMX40UpIGH8B43ubIl4hukyaixsAqpH26Dna/hg4bq9/Kxpa3Cpm
         Ud4Y3EP8SGgtnZQyw4PJAGiU14nnQ2S1te0U3NPf735BY7EVIgU4CjVjPrqQ2f+pNeKd
         fWBZE84o1rTDWc4sU8Lozryqm+CorpMZwMgEPamm27w67PSiTmlsrm9UMvBlzgRzSaAJ
         AakrAJemxT3PeXNKPYq1Ye/Fg03O70hk9ocmZvTdP7CGOZNRiSDSKCowbUIc4UrZKsXJ
         BLSUk8mKXU84bTSI+0JD4rD8yBVdV5iIaYRR0k0VrjdwRR18Nwp1jj45sqt6xa87cY3X
         Wkog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752694302; x=1753299102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/9ZjlAULE2F6JwrtpvzjiapTBh1bKC7bsQfwLuPPxcE=;
        b=BnYBGgAzrlWiWredRup2kj5/iif3WhvVWWwTrNIe6ieEDKOkKbKE1Uzpj9aOy0wNwW
         vSG6Z3Cv7szOmeLl2T331SXR6x4TVxABMEOr9bMNR+1++WmxFNUWCDHHZJYoxSoGwlnG
         n9jbMp9Y4bJMDO30YMDW0h9grz8kt8h0KScyyaf8cJCbx5vxzNcENrsrF4TIkcRSXkiI
         BlBTP7waPmMFhJV46YsdLkr4dm5VdCE33yaqD92HmRSLacf3BbkAkQO41G3QhCurwb9v
         pmgh3lsd/9XzE26Yp42L2NzA41CrLD/YkOaNIvZF5fzJavyQw3mwbx+BE0Pt3Y1G2AJP
         pqqg==
X-Forwarded-Encrypted: i=1; AJvYcCW1J17qEaXpFkgZkeRYsyp42tGILNkUPCAJyj0jnAoWD5eTn/lFaN8MNCmAgdmL/IXHzeRw/PMD6WtP@vger.kernel.org, AJvYcCX5KQIeqYciaxQ/ySRVZf9/6CKfvl2b2V2uFlrB7Ta8FiH2DtqOQsvRXnmNMKjyjfl2iFuQyIxieD7Rj1G3@vger.kernel.org, AJvYcCX9/B9m1y8KWbsfXDolSh4XpJ6Bprert9b7exBOcC/YjRwhA8a/91KBfYWq6J0+GvMhNSBNZBRYTspQdA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHfuhMw1IFQ1xbIUqs10Ns9XE/A9AjLZrfoNY6oqM8iDwOW78u
	dEzzJl2xInJIJNzcDoIWSZUlj3kW4b2GE7XC+bqb1Udvp0Y7o/7d0Rsn
X-Gm-Gg: ASbGncvFbjBanAAs0pxdmnDVeUsY/38z+512SsdPCrDNUnjT3HRfw5ljLs0SV91HeV1
	n09HchHnvGWGY+av253rpwmb1rIiB8syTWb6GBW1srJzNxWhvtIrizfREc9zCWLYBBiOnacL7XY
	zjmUnvR92nlTQujhbXJUSIcnkzb0cYPAsj2DcXE2BDCYtdqKarmabcntvvh975UkGRLvWy3996E
	wKIyPcJEDZXFiCdaqWiSAM1VF3dY3tDmPdnAB+5K/7H4d5ZJfLydxkQ4f3i9/lqguToLeVQf2+G
	LN5IpnwyDXbQ2uKsein30vLTwYNO6bl7piZnQFR0M3erm77iZK0N0hSOlp8WgqFfQ9y8TKtbBTj
	T5LkX+Ske09UUeIaZws2CTiwX0TeSLz+NH/Q=
X-Google-Smtp-Source: AGHT+IGWB8JnqcECTM+zd1hdAZU/6u/ztEZSqRZvwwB+hZoniDZyCdEYMcR5tsg96ZGbyZYcc5gqSg==
X-Received: by 2002:a17:907:f1e9:b0:ae0:635c:a400 with SMTP id a640c23a62f3a-ae9ce196c5fmr363790166b.51.1752694301709;
        Wed, 16 Jul 2025 12:31:41 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82df54csm1226534666b.155.2025.07.16.12.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 12:31:41 -0700 (PDT)
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
Subject: [PATCH v6 09/24] dt-bindings: media: i2c: max96712: add support for I2C ATR
Date: Wed, 16 Jul 2025 22:30:54 +0300
Message-ID: <20250716193111.942217-10-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250716193111.942217-1-demonsingur@gmail.com>
References: <20250716193111.942217-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MAX96712 and MAX96724 have more than one GMSL2 link, and each link is
capable of connecting to a separate serializer. If these serializers
have the same CFG pins configuration, they will also have the same I2C
address, causing conflicts unless the deserializer changes the address
of the connected serializers.

The MAX96712 and MAX96724 support changing the I2C address of the
connected serializers.

Document this capability.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/media/i2c/maxim,max96712.yaml    | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index f712d7cfc35f5..758c0223977d4 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -37,6 +37,30 @@ properties:
 
   enable-gpios: true
 
+  i2c-alias-pool:
+    maxItems: 4
+
+  i2c-atr:
+    type: object
+    additionalProperties: false
+
+    properties:
+      '#address-cells':
+        const: 1
+
+      '#size-cells':
+        const: 0
+
+    patternProperties:
+      '^i2c@[0-3]$':
+        $ref: /schemas/i2c/i2c-controller.yaml#
+        unevaluatedProperties: false
+        properties:
+          reg:
+            items:
+              minimum: 0
+              maximum: 3
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
@@ -79,6 +103,13 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - $ref: /schemas/i2c/i2c-atr.yaml#
+
+dependentRequired:
+  i2c-atr: [i2c-alias-pool]
+  i2c-alias-pool: [i2c-atr]
+
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
-- 
2.50.1


