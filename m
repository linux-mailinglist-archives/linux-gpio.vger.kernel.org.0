Return-Path: <linux-gpio+bounces-23480-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD361B0A73C
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 17:28:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E9415A83D3
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 15:27:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB5372E1C55;
	Fri, 18 Jul 2025 15:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QOL+6E5N"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E92612E1745;
	Fri, 18 Jul 2025 15:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752852338; cv=none; b=EBVZP/grinsppnuVWatyeuhwCysx7K9brUMjAJtwYVbsSgDs6AGahuVzzqYbjUzu0VcQawOBaGUbn2rr31/vHBKtRuET/vHfbTq1URUmUON/oeyyot5wQdajM9YmBMMS+hpNkPeezt/Lq9IjuOKyiTx7q6qfrbBgaaHGXyGOaWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752852338; c=relaxed/simple;
	bh=Tya7H69uCHv1F64bK9DJxRVSTo9tF9vvkubVhW3RXZc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dG6im8GhE6vz9VGStITWY8KRTRTj+hWIEDLpnrS880q0KZikWdWeRoF36926+baqPilmPQz83KfUUc9SIFNU2N4qxpxxKN4MUconXnxgWfRV1VvmvovIMucW1Wt6TnMpm6umyoTswIJz/F8XUcKOgzckE8Luvc1KZJ7oCK62NKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QOL+6E5N; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a4e742dc97so1779727f8f.0;
        Fri, 18 Jul 2025 08:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752852335; x=1753457135; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1YhQAjQyJkWY6Jp3g1C7XqqcjfeJK/9/EyL1eyErKpI=;
        b=QOL+6E5Ncf/WIPsAk4te4vouq/Y0SXT9q+ulQbT+KKMnC2HjWhnK+yI9qJ+B5HgtUn
         bUoRM8xsQiCZUua39v9OP87LOaahq4I5m67wxtYGYQKdRZwK1/fbeT0vF1Jn6xmlkR6+
         jepYs6i9MKdD9RDtfkOlXgpy4BeaRdp9saH+l6wvHncbbDrif8M6OY4L1zO3rULPyKbX
         5YnBiUwW3E13nU5naoNPTjC5FxN3Afw4hj8SIfZSeXvCcltBlKFungrW+6XtwSEkY9r0
         J6qd+GbuyMgNSuS0PpnrKWSLa6E5CioZwsK8exD0mfTUHRtOh8pzV2opWJKMtBb4652p
         aTfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752852335; x=1753457135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1YhQAjQyJkWY6Jp3g1C7XqqcjfeJK/9/EyL1eyErKpI=;
        b=Ywc2w1S4hv0eTQVQ/r119EjVbcUW22dNiBa1JKkbzoKO8jML0Mi4PZU4ULP3v8M8Bu
         qtIx9/Ahb0tq+Q/gNQWuV6i5d5GjLahvhNHVU82y8LjuaFnQmwpnOP4touAyV5Blw4DU
         BFWWmn8DspuuvxH4Xega3wELs67DmH7+nGKgFSnbxkqycRI383M+tFyJ0Gcyqe/P0puh
         QOSi9HExZnC66rmONqUUkOKcS70/UDW4+uByZCeLmT3z8BO2j9bJYE2OwxWXt6bHpDDf
         rfrxWI+nNO6nmjeu8UwbyfMwJsjBDGCmskJIUf1u+6GmbuBQdp1OqjCtswGfS4V/hiUx
         ANkw==
X-Forwarded-Encrypted: i=1; AJvYcCVoMMtxgogo/jcxZMBSvNS1l6/gG+vFpqt8AZv/mEEqf1gGLtrG4h+3MRc8kwz+Xw9rndke+z2dEP3Vr9p7@vger.kernel.org, AJvYcCVuViCIOdj+wB52P1Fg/UZALDo+wNVOCHI8tNqkqOWX8YrSf1qNOrTRQGjPRDAbmInFKOxKovA7Ax/ulw==@vger.kernel.org, AJvYcCWPlmd3SyhPZC2Xz4/0NRLnOPGoz0ddS+5cXmWZsLVndZGtdLGNlpUSllFekJFV9+0+4/Cooi+3XZX3@vger.kernel.org
X-Gm-Message-State: AOJu0YzLKP12R2jhVjl+TZGOrliyLpmYdJQ7oJdarRyKBp1cStu62Zl/
	RlftnY2E4BMjh9JiTkISFMAA2lkU58Q15j+MIm2hTJdJPH8g2hQmRMo4
X-Gm-Gg: ASbGncu+bWhmhqhXpBMIgk+byVtHC9A7UxHZ5jj4vyjQ5mxNZUMb0KXgCoewRRP4mAK
	VP7VhoTUOnt9yEWd8Wxuf6IdIY3McEQWEUxjB/sYtMCj8hshDU+LmgFESaZySfUrj1ljbHpcN2t
	Ef2Vv4FFxn4pIPepzz3OHOFiFuOm0g578WqTac/XyKETuuVphx3SCNWwZ/14jYcsMSAoTT2dEFx
	W54Lt9c13dBeBsngo5TwyO6/8uWJe6JvfG6n/XXuN9TLNZjPiO5K/MGTD3ijk4raswE4BH801kH
	n5nVuSkcmPrhjaIaZlbgZpDOFsBKH611Rp5WVSXkDw4Nu2l4QQyOouvPQfeRKGYCRuLPozXkn01
	9ZJI1IqX0cs2Jivg/XxyjkrZvCs8PM6nMYOU=
X-Google-Smtp-Source: AGHT+IHM9QE6OZP4eSrOZOx7KZfil3FjClDdGdknIIjf7C8wzDU4qPEPgS8586sPDWWAfqGicyvjew==
X-Received: by 2002:a05:6000:4b04:b0:3a4:f7dd:6fad with SMTP id ffacd0b85a97d-3b613abf34emr7129638f8f.14.1752852334929;
        Fri, 18 Jul 2025 08:25:34 -0700 (PDT)
Received: from demon-pc.localdomain ([86.121.79.159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca4893fsm2195780f8f.52.2025.07.18.08.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 08:25:34 -0700 (PDT)
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
Subject: [PATCH v7 10/24] dt-bindings: media: i2c: max96712: add support for POC supplies
Date: Fri, 18 Jul 2025 18:24:46 +0300
Message-ID: <20250718152500.2656391-11-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250718152500.2656391-1-demonsingur@gmail.com>
References: <20250718152500.2656391-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The GMSL links can carry power to the serializer when using coaxial
cables.

Document this capability.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../devicetree/bindings/media/i2c/maxim,max96712.yaml         | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index 758c0223977d4..b345305acc4c3 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -96,6 +96,10 @@ properties:
       - required: [port@6]
       - required: [port@7]
 
+patternProperties:
+  '^port[0-3]-poc-supply$':
+    description: Regulator providing Power over Coax for GMSL ports
+
 required:
   - compatible
   - reg
-- 
2.50.1


