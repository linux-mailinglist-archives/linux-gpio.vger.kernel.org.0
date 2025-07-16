Return-Path: <linux-gpio+bounces-23378-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A437BB07DDA
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Jul 2025 21:35:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED09917E78E
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Jul 2025 19:35:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD0322E424D;
	Wed, 16 Jul 2025 19:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fbtDGh5G"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D952F2BDC0B;
	Wed, 16 Jul 2025 19:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752694314; cv=none; b=AFJF8MYhYEEmA9ecidfbU14+Vbl6JVWSgr8VDYpDvz0fV7fTcMcUu/z3UPf3fzGhCn/jdfcJDEfeMe3QWgRaIWv8oSYjlADTPwGfpgJtcKbjaUaDDQFyCyicudPLlh8BtGHKqQWDjIadbF6ZujUjK1pdud/p59oIkX2DySAb81g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752694314; c=relaxed/simple;
	bh=A8TElTk1Fj3is2z75X3heqyGoQRmHGTT2JdVWiyMUYI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ME4ga+bLJG2OV2iuFTA0zBG2jrKNDUypTVNARe/GywIEXCTrJj34HgNfAdCpsRP2UEB+G0Sff1hO1nd6NzWi9rsO0q9VyUKyYSt2lJtUwGyRGvFv5yf4AMQ5H7tylGIOVL8oNcU8vbwY5RLYCAfeZkp6wQQaDrQYsqq4ZgRQXOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fbtDGh5G; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-60c79bedc19so241047a12.3;
        Wed, 16 Jul 2025 12:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752694311; x=1753299111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lKwNNCz2eG9U29ALEDHAFId45pOA3pYtpGo8B4QYY6k=;
        b=fbtDGh5GfJh9vvib35j+TpSk0QNGo0HtS4gR8yCenfe1cWJVUCQIi1tbKdIcr7udVH
         sCBsfNotRmVHIfimQ4jZSPMU8D54y8I5j8bqI2b8PJi44L2WMo1Rfr7BLyWYJ+iK805t
         fxQNOdFs/QQnDAD4aofNBNvIKHFEg0n0eeWqMYlUFuM3fn8paeM0BjkJRt46qZWFQs/B
         UOBU42ImIb4tnBA+2pyWxQoNfxdbIvfgw43pM0ok+UBSRUEVUG5P/VqideOP9FNgdh+q
         tjdPLsgUqZN0Ng4WD4SIiYSI7txic02/S9A/N3bxyy+PanAEhAHKuPYHT/Is3gACpQPB
         9mJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752694311; x=1753299111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lKwNNCz2eG9U29ALEDHAFId45pOA3pYtpGo8B4QYY6k=;
        b=Zo/zKllFVt2pfLJPRVlimbXvnU62i9CNC/mu8LDMqeIsL2rtXlpcuMSqc+UnJeSdLM
         8VrYoS/1LDV6MiJbML8Xk1Suy8fwWCCIbO5iT1Jrt570WTdFDD3LXdyPGdq3lHV/KESj
         fpRcX1h5VOUVxo3uJXXW4wLfYLvQp0A3ESjzBQsSwa//olLQsFbPzS2SwxHu5heL9IYV
         77r3+1GWpjcbxafN4yMy3IbCycjSaRwzsNqIXZItm+BYFUcMCwCp/h3Ut6gzoAt6FmUh
         ctDh31Bx7rq/QczOdP18CgXjjt56tl8JhSxl2KV12sg1YYByZt+OjnhHOpfViYfVwNxy
         EDvw==
X-Forwarded-Encrypted: i=1; AJvYcCXQezbgxN+e6pjGsucrOZCBfzGHwzGenS/RsTMplvmgUEMDOUHlCk/P3Q7yYMVScPMoTjtKxpIfNosWXHZc@vger.kernel.org, AJvYcCXt4r3PNep5MFPrG1xz/sahP5bAQE8YTQTzx7pUWBANFrX/um3ukZRVsTtrk/PUM4+/pRjhz5QRHm8v@vger.kernel.org, AJvYcCXxyXHR3dGG+ooKU0F33fyYAaOp11k5K05qC3enzr9iEP+73FIaXu4pIjNkcHV/8Q7Xs3aq2P6sogaOyA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZdBEuiJHwjfJBw29T09SgPYsXpMATvb4rpI1GM0u0mGRunWWL
	d3ZQVkNkk8D6jgqaIhHExUlRBvgi+3Mob+tHilTgl4R2rRYwtKyHYmdu
X-Gm-Gg: ASbGncsYCgSck20TTnve2dwvUT4f1q1rjvHLUIxIrUENph1U9Qq13W5mfn3OBsOq6oX
	Vk/PaRUN1ibnO18n5rGwvw5jWnTZWQP1U0th78b3TPjJaruA7pHR5eOJtY2P8zs4/AL3tBRYLTr
	5pceLFmhNPEc+4tlvOPlHjndVK9sEnG8IqLTIVDBBL27XfFFk6mdWgpH0MB2yBrrRXpQo4UWdgW
	98nGCK40r3C+leDTawYVb0BXdNreuRBveAZhSMYneIGVzxB6nzHe+l9IwBENZBgSl4/dIT2agey
	qNpzMJW6qAQwcmpcQ+hI7ekogTfSrQdjCQ+VJxCQXf7mwuLYw6h6lvdgavB9bRbIB4v9JoZ1L2z
	NFZMl73eWC7YPCdsIzOL8tZC4MsOuYqVPhzE=
X-Google-Smtp-Source: AGHT+IHD/AwWxhtp/H4zB8WMrDAL/c1Jp0cZ6659LBasVTEyBTwEa2yNp3U+zRNJMI5sOrDoJGRF4A==
X-Received: by 2002:a17:907:d40e:b0:ade:c108:c5bf with SMTP id a640c23a62f3a-ae9ce10ca5amr316243266b.43.1752694310837;
        Wed, 16 Jul 2025 12:31:50 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82df54csm1226534666b.155.2025.07.16.12.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 12:31:50 -0700 (PDT)
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
Subject: [PATCH v6 13/24] dt-bindings: media: i2c: max96714: add support for MAX96714R
Date: Wed, 16 Jul 2025 22:30:58 +0300
Message-ID: <20250716193111.942217-14-demonsingur@gmail.com>
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

MAX96714R is a lower capability variant of the MAX96714 which only
supports a fixed rate of 3Gbps in the forward direction.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/media/i2c/maxim,max96714.yaml        | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
index f53c72e5c5727..1c97624833ebd 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
@@ -23,7 +23,9 @@ description:
 
   The GMSL2 serial link operates at a fixed rate of 3Gbps or 6Gbps in the
   forward direction and 187.5Mbps in the reverse direction.
-  MAX96714F only supports a fixed rate of 3Gbps in the forward direction.
+
+  MAX96714F and MAX96714R only support a fixed rate of 3Gbps in the forward
+  direction.
 
 properties:
   compatible:
@@ -32,6 +34,7 @@ properties:
       - items:
           - enum:
               - maxim,max96714
+              - maxim,max96714r
           - const: maxim,max96714f
 
   reg:
-- 
2.50.1


