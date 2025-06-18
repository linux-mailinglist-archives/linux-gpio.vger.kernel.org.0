Return-Path: <linux-gpio+bounces-21733-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 014A3ADE7C0
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 12:02:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9D56117B2A1
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 10:02:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9DCC28DB62;
	Wed, 18 Jun 2025 09:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="np65xG+T"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B747D28A3EA;
	Wed, 18 Jun 2025 09:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750240785; cv=none; b=EXV6Nl4+Thr5zOaTzAqGaKIJdlUFCTsJ+lL1IfyzOHP63d6TT8XpKZh421z5xWmL+zdrtgoU8GVvr5sq24aLDNkk9PgxRtxfpr6bMFT1PJ+f5UcqRVz4pIFE0FTsHEXTcXTYsvyJWnuOVwlKlxRRow+7+2KSEMD95g6nnVRR+ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750240785; c=relaxed/simple;
	bh=XDzI2iGQ3ZbL3atG8VBYjM1NLqB9r+TI86rhel2I8VQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=olUlMW9Tv94I/Gt8T1m5VOZ6BjiXKaPlQeUUPns/ri8Jq0b+V2zwvtLI90xEiw8WXV3OP28XZR0ku29TQiDUTkVcFTnMGYhrveiw2xFomCOCkPgE6w2rY7Lo+cd9gZVOdGitp+Y1PkSKhfMVw5CPwv9Pw5TnZwwyQ4oFBGCth74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=np65xG+T; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6077dea37easo12981977a12.3;
        Wed, 18 Jun 2025 02:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750240781; x=1750845581; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6baFX1dgbZUxvw76cQruvAgLUvKTOPaVCHPv3Fym7bg=;
        b=np65xG+TCmfBUIgo+fYrqmOoAF6YQNKIcJALeZZoBfRwNX3QCx+6V3FlomF+9EWQoO
         r8AxwWUGjYnRSr013cQIlzRlhNKDeNmkIWxlG/qncWeDIGdumMENtbwvy0ClEKZbI7Of
         SBpjd15epdui9wUUOHUu0EcZ+qwzDd3XiiWz2T9x03MEeRIsEEkyhn/6QkDz/HpBvVsM
         NScecXCZM3uqjUhLCfylhiHg0/k5SXzYthm+Sq3VpFLzhKHGF2jpj7uYZ3RYWoBDJ6HI
         OTwca0IRndDFx0HW/YLWE5krazqIZXH0Jqhh92W6QV7TZbZdb4BwRcW70Qv7/AS2Al7T
         hLOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750240781; x=1750845581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6baFX1dgbZUxvw76cQruvAgLUvKTOPaVCHPv3Fym7bg=;
        b=m8F6IoRG4l1ueJ2UyAa74+pCw+gCTrOAYCnf/lXegYwVGrsTMj66v/k71XNJ3yALU3
         AUGDbb/r1z/nEip130bQ/N70NPRP26Yzws8EJbuW58DQyvVYbtkSVFuFji/KfFHNVzaa
         pfz/H2mIQ7Qag9bhh46sjnuNgmxrL/cFvmQ9B00RyP7MxaM2szsg4xbcuichjg7nJjmC
         xmFlWbHXqpt/D7Ba1lUBJg6R2zbF8QFDxPoogeKciLPpPyzEZgCy9JXoFV9hMFsfY9hQ
         3DxHptoZ5+XIruwQg6GisWegPSuyeaufBlDAOE3mhpm/rDpJ2z7PnUIni+HKhRf10sOe
         PZmA==
X-Forwarded-Encrypted: i=1; AJvYcCUkg2sS204AP2TSY+07PM8lOGaU+iFUVgAIfeqvj5bNkHGvgrkAZ3oo6tk2JF+9qcsQRNOVkhMZhX9UyGq3@vger.kernel.org, AJvYcCWryHmfC2AFmwePqWG0IZiiawiPa6XhJtTJvbnI++lIn85sC3eXb3HGfjCS9N00GcLfjtu6Z1nktvC9jw==@vger.kernel.org, AJvYcCXFVa8gfEicMAw5y6MWQ6+eXhHjpPqMPSbtmVWJCTvROnJb7PTzsOkmb155AWthYBeTwDCBLo/Y+IlP@vger.kernel.org
X-Gm-Message-State: AOJu0Yyg2tp6vGqNdm8MzEvRl1mMMiTuRYk9AQl+T3slfAj8KzxnHMNI
	CInVK/Hjp2A2WTZjFOc9NJfQTvSNDXvhVPIDDZQImDc+iWLIFJkxb61Y
X-Gm-Gg: ASbGncv8Ybeo9Fsu1muIddjINe2bWeASHuVYReKXdaicLMKOM/i3lSa/HITQveuBtP1
	cWQW6IpzyAGjJwfgQIloW1wdyCtnK1+Yx+nLgZLZSkgsU3JZfzF3pppqpY/Vd1RvFqREpJ439aB
	IHuIJyPhE/T9Q7ZkCQ+mhnEfle3KVsFhmyFeZ5kz7dPE8+D/mpjpNkmvzTiAVfFdp8AmVMMJg/A
	L3Dk5BmjSYFcSSScPnmDU5uqu16mLR7bkR7GE5hVLw1zkOKeDVVySr8KBC563CIhgO37/fkaUII
	9ZhS3NuUusqfnSPga6fwC69kv9140ZzOHsQ/FtGr8AHMSbhoUdSBXCRS4v5zBEElgxcTjrhajaQ
	=
X-Google-Smtp-Source: AGHT+IEOqE2l3xi6qMOQbYwERKlj908Tdc4WnQFs627svU5I3y3cZFIHL0K+7zXzTUOHmPs+LVxQuA==
X-Received: by 2002:a50:d519:0:b0:609:a91:87e with SMTP id 4fb4d7f45d1cf-6090a91097amr8113971a12.1.1750240780979;
        Wed, 18 Jun 2025 02:59:40 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a93b03sm9384691a12.54.2025.06.18.02.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 02:59:40 -0700 (PDT)
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
Subject: [PATCH v4 07/19] dt-bindings: media: i2c: max96712: add myself as maintainer
Date: Wed, 18 Jun 2025 12:58:43 +0300
Message-ID: <20250618095858.2145209-8-demonsingur@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618095858.2145209-1-demonsingur@gmail.com>
References: <20250618095858.2145209-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Analog Devices is taking responsability for the maintenance of the Maxim
GMSL2/3 devices.
Add myself to the maintainers list and to the device tree bindings.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml | 1 +
 MAINTAINERS                                                     | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index 26f85151afbd..efdece2b33b9 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -9,6 +9,7 @@ title: Quad GMSL2 to CSI-2 Deserializer with GMSL1 Compatibility
 
 maintainers:
   - Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
+  - Cosmin Tanislav <cosmin.tanislav@analog.com>
 
 description: |
   The MAX96712 deserializer converts GMSL2 or GMSL1 serial inputs into MIPI
diff --git a/MAINTAINERS b/MAINTAINERS
index 01363fbcb9b3..77adb1f7ac9c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14728,6 +14728,7 @@ F:	drivers/media/i2c/max9286.c
 
 MAX96712 QUAD GMSL2 DESERIALIZER DRIVER
 M:	Niklas Söderlund <niklas.soderlund@ragnatech.se>
+M:	Cosmin Tanislav <cosmin.tanislav@analog.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
-- 
2.49.0


