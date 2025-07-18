Return-Path: <linux-gpio+bounces-23475-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9139AB0A725
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 17:26:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B6251C805A9
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 15:26:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E38FC2E03FC;
	Fri, 18 Jul 2025 15:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SOxazaH3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D7582DE1E0;
	Fri, 18 Jul 2025 15:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752852326; cv=none; b=OC7s7puTVcyCfcGycXYa4QQ7dmY4iEOSOXxkZmNKodF3ifijaLL9yfX6Ll6ahy7tGpuRzQ0GGv/sYCuQcG6e284FUzGVPJmG3uNQ1Khijf+F1Q6c5p/AKdQJe9Q4G9yMpGGcILZfQsMcLeIuuWUqs/DX4N3IXCKHG3XeQMEQwXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752852326; c=relaxed/simple;
	bh=Le3fKPFnTnPrgHTj8F78EVXFR3HaOupXcG+QIrk9gZg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FH3t1ob1YQ2w1s+ynfBCDHsD98Wb2O/81XTRrXxcEsoIN8eYKeS8OzLv0e6NNeHKCNtgbcD5ixogwtZ+nUkc2cCvmnXmv0+XX+MybZSg/KlPnsGzc2UN090yp6bQPfu2pSY7PYrRZIy6MyKh31m5VOizk0bD6BVEFl9skCPtKNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SOxazaH3; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a6d1369d4eso1383894f8f.2;
        Fri, 18 Jul 2025 08:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752852324; x=1753457124; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VdFIW0lYJtAbQLEa3GdGav6joQZ/CRQ0x8q7C38QxqU=;
        b=SOxazaH3+8kP9hITkiHCb5iwxNp9/zQdLdHkBeSA08Y2Os4G+eUZAKcEj8QJnZlKi4
         BudEyeDSDz9ZC01crEQ2sCwPJ0YUjJcytni60nSBLEZJWwGTCPteO+su8VheH87QNYxL
         ejIzec78FkfVAjc73Ae7BdlyoipnzgCyNWS2SmAYusDz/p5gRB1qLwj2pw2X5F1KcE0y
         QtIEI5Q5IsJ1KLxdTq30yqHgwWBF6WiEKZuthngVmRbDAL4+4zxmuMdvJdVXV3hKxeYG
         Zu7EbRDamHQlC/jI+Rf7OdrQdvc6npcvd5xd9a0yKgJX4UcknGWwehinhbtik3Vb0uQk
         1mLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752852324; x=1753457124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VdFIW0lYJtAbQLEa3GdGav6joQZ/CRQ0x8q7C38QxqU=;
        b=ZqqYfJz2CkyipjSBVG4OIPBTrUThK1F2kOFrdNskyRWunvq8ugoZz8MP1IcBhqezX2
         VD1wBjeDvCiaFxeSzZaZVmuRoxyMmM050m67EnmDDRZGCofxdTfbaasepndIm6+5isaf
         Gvr+le5YkV0vJTB1YSmV2+KJNy5Wnl1pA35QBhexvpxuHBlVGuxSCz1vBomalsnxDtqG
         c2PhvOWvqdGWvc4hQlNpeUR49ascqaHAWUQs25NLHZU5EY+f3LbWHftuqoLO+8M8WC3W
         ELK6ZZv1Q2ks5EyyiYY8Zok+867rQQBN9jeTlpNGKfvnv8eMYPEYABjIvytW23Etmdiy
         7MVA==
X-Forwarded-Encrypted: i=1; AJvYcCVuvk9kAYd8ncSHcZ8dRIoVNidVY6KRM0nmMcU+jzpEStKv1f171+czLyDqA8Mf7ADlH3tooXaalbaA7w==@vger.kernel.org, AJvYcCXMwy3k1+ha34OGipwHFaAb/CTnOFvmdHTQf1QGbOrllZbS8gqPNd+TiVtCIqvQirwECKG99gt3r8aWcsXM@vger.kernel.org, AJvYcCXh9QM7Vf6RKd83KwG7/JB6TBKEFoFf3JecYh4J3kh3nDr18o+Shw+qyfLhdmTnoKxDAWfYuBokNb9R@vger.kernel.org
X-Gm-Message-State: AOJu0YyFWGUFUpxa4/4aPwmVVC4S2VnNDDAdz8Tpv6xxZq6P5wXfhC9h
	vQcabtn+s5mKU7maklaJijuZRrADPeSQLd5JplkmTnaFgTXH74Jo+YOS
X-Gm-Gg: ASbGncsvn7ByArGCQK87Gnk7y7YM0+OvD6elORo2b6h2KOy0T+qdPmcROldL74PGUb/
	lGhlRWH80kOori2itsTRKcOEUOsyt4ojkO6z+ApwtdHLeYZgiV7Cx6hZVqVgvdG3K6Q7AeiBH6+
	OpOeeY4SxZS+7tVeTuXIS2AEizSrXEn0GfqDuKjkWpbQq9nlUyQia1QAjuLybUuwrbtnsSnBCJb
	it0X729VvC78DYw5PkpjU0d0zGXwomtzhpiSDf4rfXeOumfC4Pg3tBKuXqnThY5f+g1Naf8ChZI
	pZ/I2AZRceZqlOJe/ZBy/oTDKYCyws757dVAp3pv7qhuvsy56ulX7wL0mWmIEWQt0tJR3aU0iOV
	Ft8MESE1KQQA1di9HXVK6g59hmTQR1Ms6y3I=
X-Google-Smtp-Source: AGHT+IEnXhOLq8dbtFmyNRqfijqOMFTS9WGlEktcFzyG2EgAKBCwRInZoSo1yCEAsrfb5BJlPoX6/A==
X-Received: by 2002:a05:6000:18ab:b0:3a6:f2c1:5191 with SMTP id ffacd0b85a97d-3b60dd643fdmr8953385f8f.4.1752852323423;
        Fri, 18 Jul 2025 08:25:23 -0700 (PDT)
Received: from demon-pc.localdomain ([86.121.79.159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca4893fsm2195780f8f.52.2025.07.18.08.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 08:25:22 -0700 (PDT)
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
Subject: [PATCH v7 05/24] dt-bindings: media: i2c: max96717: add support for MAX9295A
Date: Fri, 18 Jul 2025 18:24:41 +0300
Message-ID: <20250718152500.2656391-6-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250718152500.2656391-1-demonsingur@gmail.com>
References: <20250718152500.2656391-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MAX9295A is an older variant of the MAX96717 which does not support
tunnel mode.

Document the compatibility.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/media/i2c/maxim,max96717.yaml      | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
index 9afaa8a7a3f52..78ecbab8205a5 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
@@ -25,12 +25,17 @@ description:
 
   The GMSL2 serial link operates at a fixed rate of 3Gbps or 6Gbps in the
   forward direction and 187.5Mbps in the reverse direction.
+
   MAX96717F only supports a fixed rate of 3Gbps in the forward direction.
 
+  MAX9295A only supports pixel mode.
+
 properties:
   compatible:
     oneOf:
-      - const: maxim,max96717f
+      - enum:
+          - maxim,max9295a
+          - maxim,max96717f
       - items:
           - enum:
               - maxim,max96717
-- 
2.50.1


