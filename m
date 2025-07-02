Return-Path: <linux-gpio+bounces-22629-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD0DAF5918
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 15:30:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AEED84A19A0
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 13:27:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BF0E28C2C4;
	Wed,  2 Jul 2025 13:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QwHeN37U"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3A628BAA5;
	Wed,  2 Jul 2025 13:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751462499; cv=none; b=VbF43YQjLKn7KCEezZll+kv+f9auV3O9KEw/m3RDl6ncXll0vAWmmodOyMVy8P8HsKU5sX6rWK95Gde0jhdPhjdp4K96JiG39i21hylwlNN45IDFUT0W26eO36Ri5E++Q+tkFYEl9qU6nW9Kykq6OID+twL5wrknP8ekBwJpLN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751462499; c=relaxed/simple;
	bh=+a1Q3SyZ+eedrs0uKf2yOD0UQ2+TD3ruCU+uflqFJX4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bE4JxtZMkiNrjT4SabroWWAuhU2GD5t5QdZmDbUpOq7FdL6XDT3BazrUIqrCZK8vQx5W9qab4Ss9eq5dSxEzlMolCvL850CjHEq1PJlF8texfnH2NuW7x5g8fBsBHyUh29qharDzQbnFZsn9O6ukItBTAS0C2nCqlysFJ+7lcAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QwHeN37U; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-60c3aafae23so16938451a12.1;
        Wed, 02 Jul 2025 06:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751462496; x=1752067296; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B4xkda96iU56AIjh88wfUhrjBY3xcgi3zA63ltJo3+U=;
        b=QwHeN37UasH3VpKMogqwgZpNHCzjYEO4nlR7GgDXFzynttmy1T4+Ea/WKp67TRuT6T
         B2on4IYJL/jfdOPhQr02ES+bzlOmwkYWr3namBiWTxJBC+iFJPljHrIl+1fJ2f/wykSD
         SnrOIWZYe+0QV3ByEYUkt8Y7wHG61RBvHoB5Dw+4vRcvtqwrTDyNPAbp/QQ1BAHE39pu
         H2RfmjfdRpncdhBXibwKXMa+2TcTsP55poC5PvP+kxxq8AQSpzTQmpWPj80bF0EnDHto
         OuN3mmS9lehNjO+ca8Qhw/mkLIVgalD/tz3UmE0a4D+XI97uBesTVpRG/7SBTIa9T7z6
         9ZUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751462496; x=1752067296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B4xkda96iU56AIjh88wfUhrjBY3xcgi3zA63ltJo3+U=;
        b=bHEYSlIWf5vw/I6W42/9BZsBpDZqthxj7qzxNT/bM3L0GclII8YXWVn7mlODArPaAB
         V6bWf4SjSEeOo/YwJV+LYPi6ZnBvmL1Qtyo+ZywrrazlCZs131bR1chYKCNVWMb3JbL5
         Qvqtm61XanCsoYpQERtZgOYublZm1UFy1k2TH6mdxUdw5HmhbxzVb85HFmQy3VdKIT2v
         KcQ0+UUJi2GLfF0V4/03z6SOHHoXFdNhuIf+HHwbQLbzjHG09RS1c/XT/o9+GFfD/f5Q
         zUMfjU0IM2nfHlHUPUHeP1+ocaQtGokFNChUElLGpdI2z3cAaQ/6nJOy/tywxONs+MeI
         fLug==
X-Forwarded-Encrypted: i=1; AJvYcCUWJNY222Qe58Asa/dxISlA0gsPiiV5AjmSmnVQ953/Vy8KomFNPqema8IcL7zT+5nG1Udr40/bd2PFWA==@vger.kernel.org, AJvYcCW1I3CROBZvPNcg8wDAhMH3VfLoCSnfZ3l735K8Or3cu6ZnoKvd9EPUdHpv45blTePG4y+XxC81WmIS@vger.kernel.org, AJvYcCWaK7oS8ZLS12QLwtiAQRNb6GQEeliJPh7C1I9lzLEG6Wv2Ka23YzndgEC2MJ/aieUZjW3mBZpkOGaswMb5@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8kibDntqzHMTbuFpNfdVe8q7B1E6Dd0ovFM5SvgcaQNdg9oYD
	pPrENdUShZfVjdkDDH90s56+NrInJxEWjZwohxsjxbOgJwUxw4gLBFuV
X-Gm-Gg: ASbGncuqqaFNcREpY0Jjf2UxkxYfNsph/lGI1fxZnNf82kt6eHQZEOms/mnzEbIdklW
	bewfdjEtkvOgEU3w2QCRGVF0fzpzkaQnr5NgiioTy9SezQlrnZ7fIMRDiaT9jWUxwoVjxChbr7r
	3RocAtFsSKWbpooZgfb+QfRsLmhpgWgV2u42Hqd8Bu33U89YNjx/iPQeoS0i8B1NyhXzT1fD1yr
	arObAsW5i2pbAvfQeWSzh6HdrUzAwLUJbf3J/txa74lNldByWGqUtTJx5a5qvq4ZbjQPb4NQbw7
	aZR6U74WfozKOtXedovbNvxIHArYT3IFYq3KqRfNI4rD5vV+F/Y2fx0giJzDtQ1kg0lCLAdzDes
	=
X-Google-Smtp-Source: AGHT+IETdXmWWO8BsapYdgRGQMH68L3eMnzhyeMCs3h5X0X+TL6jJaRfOlE9/LRKrYaPCn1JnQs1mA==
X-Received: by 2002:a17:907:d643:b0:ae0:bf99:6c5d with SMTP id a640c23a62f3a-ae3c3c55d50mr229980066b.26.1751462495739;
        Wed, 02 Jul 2025 06:21:35 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b094sm1063800966b.22.2025.07.02.06.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 06:21:35 -0700 (PDT)
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
Subject: [PATCH v5 11/24] dt-bindings: media: i2c: max96712: add support for MAX96724F/R
Date: Wed,  2 Jul 2025 16:20:37 +0300
Message-ID: <20250702132104.1537926-12-demonsingur@gmail.com>
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

MAX96724F/MAX96724R are a lower capability variant of the MAX96724 which
only support a fixed rate of 3Gbps in the forward direction.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../devicetree/bindings/media/i2c/maxim,max96712.yaml        | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index b345305acc4c..5dcafd46344c 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -24,12 +24,17 @@ description: |
   MAX96712 can be paired with first-generation 3.12Gbps or 1.5Gbps GMSL1
   serializers or operate up to 3.12Gbps with GMSL2 serializers in GMSL1 mode.
 
+  MAX96724F and MAX96724R only support a fixed rate of 3Gbps in the forward
+  direction.
+
 properties:
   compatible:
     items:
       - enum:
           - maxim,max96712
           - maxim,max96724
+          - maxim,max96724f
+          - maxim,max96724r
 
   reg:
     description: I2C device address
-- 
2.50.0


