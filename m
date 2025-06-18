Return-Path: <linux-gpio+bounces-21731-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E919FADE7B6
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 12:01:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 406F03B2131
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 10:00:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F5C4288525;
	Wed, 18 Jun 2025 09:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EQYhJMtq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A76286D62;
	Wed, 18 Jun 2025 09:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750240781; cv=none; b=oPfFUrTP6+JN0W2y24MkPF1WHt5qCdJpi91efzn601ChOMFWIhNAlmWAFgRLThyv4Xp7pF60L3Ev6AeR/9qgzbD1Mn1zAH4dyhcn10Ama71JmcOpUJlhdKg6nlKWIY5jvh0Wothx7qacCOz1Z1lxesvcaLZ/EaISZN2HHERwwWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750240781; c=relaxed/simple;
	bh=LS51SAOjeVQ+DKPYqQ59vFdlIMwnoNIzslebEFvdf/0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZyR0xBENGTVZCjubdvApTFZrdtKNSJMFJvVEuCpwMv8p7otNLVH67EzlGfeFdB7AZoryM7MBJ+hTfyi7xY9XhIq/ojM4Mt/7kc3WBtbzexDEDKffauYcurj71mdw0/jJEI9qA6peOtuGjOSfQsQPhS5I/IQLtqaoVp21Prn5vPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EQYhJMtq; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6071ac9dc3eso11691205a12.1;
        Wed, 18 Jun 2025 02:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750240778; x=1750845578; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QyMjYlp8tiGaFTfB5olHuf8CDtVtbOO4FPZ1k0DdjyQ=;
        b=EQYhJMtqeeEXMX0K+WT0jzJS6sqogaMjy+zNCEW4LZF03W6PQhTToIo0nY+TiW9DTj
         M3SM+odhAm0TE/vblir3dleggcMJdZpvogsVqgM7dzvW4jfHn+pel4ym94xiuAMrwL+P
         63Q8crJ2m1rzMmhvxASTdXQBcg+aN77e3pRb9dQzbYAHahNwRg3AFZPeS5V0287ZjHuo
         5Fh1cjsRg6fCigecqt2P1M/CI5c6jjqlgh1YHdmZi2eZrDVWFT9NvrPXWVBEChqWyz+k
         W0ppqlTd30ymK8X+1tK7Hm0uIATG2y7Ba/IFtgjWltHM3ZF6zSqtN1EUu1zGKmtMvfnt
         3HiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750240778; x=1750845578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QyMjYlp8tiGaFTfB5olHuf8CDtVtbOO4FPZ1k0DdjyQ=;
        b=hm9nPOowQO2OgNDRugoOgIg9tS6PPC1PQAZox0hUhBJbd9bVGQar6Kh6ktul9YVBmY
         nZv5rYH3mEQ4n4At8Nm6AHwGHqH1J+gb7nYEHiNfj94MwITaU4YiyNXdfy2NOumWVKQj
         6XXtcKgibiHY8QjwLYV2cce3vE4jlTWKFvkJQPATKki96TVa+lEhoiU1s+dvQhAkNnr9
         q5E31vqrNsfg0oEJiijMQrwMocqktQ7TUq7MN2SMO2baM82SmGu9hwBK0+kSaccoaFl+
         cT0n/mB60Xe0DyD9MMMrL+0WkD7YzUSzlgtQIeBvL3VJphIVfg11o0OhTh3JnDQEL9p8
         vS8g==
X-Forwarded-Encrypted: i=1; AJvYcCUuegjUSN+WnA05zEZ7LYuXiYrwG9I/YqqOxu0RJuCyrCCQth9JVocxdI3UCE9mOw4v8zBP0pXfhsGJHw==@vger.kernel.org, AJvYcCW20RLmyJh8RjFJAWDT2zzWjbgvndly9hjakhw4e/VDvdKtNsbvDxMrd2bd0ugHXvxLrZD7rfc2nF0+jwzB@vger.kernel.org, AJvYcCXu3crN/8ZjJdT4wEfc6+j2LLM3t4R111sdw7lTVcHmy9oUXszRCXP7pzIz9E7oCexGQ2wVGa7EoHIG@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5VWjgwvr1kBhG62na0U5Yo6yteIbaLLCmj6jQs5C6Vj5O0nyt
	s0SHwF0IcT4NlvitmuM3V51lieTKqAubyzX2f+GWLUDL/9Uu/i3WRrZBSreWgA==
X-Gm-Gg: ASbGncvru9FkLaA21TSOoV25C3okbH3R3RreJMa/oMCa/LU/q/GNnHrrPgQBWjEJoqP
	vEtGRisjI3pNeSfUW4iXw3t0ecdeghtIKTGs/t9dJwEWoxWhEJKnlwfgH09hIRoOy8HBtuQb6AU
	gF3tTxYj6Alh9o1jP0ZktroC0N5W3h4cKb9mdM0w3RPnZYUHtiuUKiJUGVxTLBvYBs8lFpll1S7
	/kJ5ets6rS8UD52VAFiZsGeppaqQG3ytxOE5Eg4A4DJWr7AoNlQ9LnFsLCXs8mrvr+igJvAlJQP
	6hlKPU7PnD4rHeSn5KedX1m6tTHDdpVrtFkjaKWvtJvBKI8M1lrf9L2iXzZV8VHMa80wmYXPcdk
	=
X-Google-Smtp-Source: AGHT+IG6ppb/J0j8YRmIIXmzNHSVWkRtjbVe5WTms0GTJ75Un87Lu/WGD7mS34FxQ1gJTRZ1plZKNw==
X-Received: by 2002:a05:6402:5cd:b0:607:2469:68bb with SMTP id 4fb4d7f45d1cf-608d09a0dcfmr14594421a12.33.1750240777738;
        Wed, 18 Jun 2025 02:59:37 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a93b03sm9384691a12.54.2025.06.18.02.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 02:59:37 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-media@vger.kernel.org (open list:MAXIM GMSL2 SERIALIZERS AND DESERIALIZERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-gpio@vger.kernel.org (open list:GPIO SUBSYSTEM:Keyword:(devm_)?gpio_(request|free|direction|get|set)),
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v4 05/19] dt-bindings: media: i2c: max96717: add support for MAX9295A
Date: Wed, 18 Jun 2025 12:58:41 +0300
Message-ID: <20250618095858.2145209-6-demonsingur@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618095858.2145209-1-demonsingur@gmail.com>
References: <20250618095858.2145209-1-demonsingur@gmail.com>
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
index 5998e2518be9..ab46a5f0bd7e 100644
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
2.49.0


