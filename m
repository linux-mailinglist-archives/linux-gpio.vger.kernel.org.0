Return-Path: <linux-gpio+bounces-21728-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D53BCADE7A2
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 12:00:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 160B01795B4
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 10:00:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD4D1285C8B;
	Wed, 18 Jun 2025 09:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XgpmoAbF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA94F285076;
	Wed, 18 Jun 2025 09:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750240776; cv=none; b=Dq3DZAI+lCreR9ayTgFojtJge5VsPbbggvtD8/8/Afe9hlLrT9mnhgf1975Cf98P39MeTapUbbj7dGlG10iWzRBGwQmHbPj4H5zhq0MJwwldhuz9/7SZX3/HLuoSWELUoA7amobAqFUmkr6CgDDRZwQvLecSLtvEp1qhT7IMElI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750240776; c=relaxed/simple;
	bh=OOn+Wgmm12j8z65b2aVXjeWeYVRaBZ4GDMPMP9p092Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kC7EsItj8nVcFp4+97BunlEYR6vPzK80L8slZDIcOfWQ5kOoFGKdz8/5PO6F2SyiHMveR4ZvWBl95qlkWWydoJvXkgVO3iiWSfTYGXQaFMj2rSfRSgSq/UnrzSH1E5Aekh79iAce6NkD2BF1hnhXxynBY2MyerlwCzuygUi51Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XgpmoAbF; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-acbb85ce788so1154648366b.3;
        Wed, 18 Jun 2025 02:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750240773; x=1750845573; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZM7v4p+xV5gPJJpmqTWsdUNvs9q2qx35L0HvHBeAlV4=;
        b=XgpmoAbFLKIwlgLM5XfPZoig6G+9C00AivNEEHvmQEaAHvpfSWXUHP4DjyJtkaV89j
         vdde6QcrWocwNnQ5w8Y8Y8MVjQ+RcBh3sAtlQQr6erEV5A++b75BhfH/7qsbVgQPfzt7
         DogbgX/nsXWhVVBsOvXucDSQ7WguGEXA0ukKke7c8huC0mBU5b0ll2VGKlRGMB5PwJcV
         uSZNfQmTGVaNvjccS49nz9jT+IwN4fzcnKa7RUAoU2CtD2dJ07J0fnHH82lsqgQyPhw2
         F841e5tTpH0174xDDniWVEEV0mPTbBtaaGnnq3oRwSe6GR3WkVTxPte00iz+81WryCbC
         OVkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750240773; x=1750845573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZM7v4p+xV5gPJJpmqTWsdUNvs9q2qx35L0HvHBeAlV4=;
        b=rDWgDgXvioZ8WM8QYGZrFILjdpVOlzyciZwMxwF0CGRZiLQwhVDSdjqRH+6E5IKZns
         7jMnyYGt/YiFbwg2skabWb2+pjvmtB1ZbnTgjpYSq5ni/PSmR3JvauEB5Yl5dDVihny7
         Gh6DoRSV4a4z5LlWXFbYr9n4glaAJIiIKOtDtYhmm3OioLRHsUfjkQ+XX08mUB+65Rw0
         PVAPbYRkIQiPtOMEmYupQNWbgilT2ucmmeenj31pygmm0Y1SRnDSQ5jmpkP7O8XSFBAB
         qsiIzJcy1lERIcqeFJQdSFF79JqyJRgmEuQE+ZllnegDgIYp6pOw3kk2PilTQUXBNapj
         r1jw==
X-Forwarded-Encrypted: i=1; AJvYcCUErROJZFpN5rbmWVyW8X/OwCWvxHveq0aRaVXxCspIkJ3sz3dsgGbNHIqOEElSnx8LznqA+L2rwIty@vger.kernel.org, AJvYcCXjBk/J7WuoC9mqQwd6Dt+xf6EknXFjtLICK/U9yXBlcPgjZzNgX9XTIZ7OyTpula724J+ukvO1XSOzsQ==@vger.kernel.org, AJvYcCXlt7Ha5k/MhIUWFPQQ/UYgCa3s0ubgLlqZy4Puqjoznx59DxmInXwbRNWwxsaZ4QPtC1f8x0U+M9ezsUyw@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa5aHXb7tnI2QwYbZIArjUOc4mxKyrw/8PmHholyCHGQBtxl9S
	FrQgN/fPPKbXkuQr3hf9vvyZwywc2TxckzURx4mJC7SV5398AlnPHhpv
X-Gm-Gg: ASbGnculQYu/GmPJ63xpV2JWIu6D8+/1G/FtD8duTDoNhDn0Sy9cAe+XU5zxLE4bkOf
	pOcSQnXWyLHqLyOqyQrIrczfux4exjRLVeZk4Lz6dDy/xsp9QhfrCbscGT4Z0dCLnOueA2W86AY
	y+0dnZ78xgZjrGq1wjZ8OmbyCZFeHuHpv8YnE7QDqHeau+SbIcw7cteHsLqamjgg8L1xI5/O2T8
	GqeB55LEXo2tzzmFffn4cjVJm8I63g9HGSJrAKL1NPquinjGx+3LyM+8vnsfUWbYeGDHc+a6CcG
	ndQCOmyDJXx3Iy53LoeE/T9RxytocCT1OQffhxaIGW/+FysMi5noIn85wGoc4iru3iSU315/D4A
	=
X-Google-Smtp-Source: AGHT+IF1vGugdRmxmc+EGSuEOAkqel6fu0udIatnhRPXHDXTkY8odVb+a9IZeK6Zi6Cg/i8OjJgchg==
X-Received: by 2002:a17:906:ee87:b0:ade:9fb:b07d with SMTP id a640c23a62f3a-adfad367b40mr1540072866b.4.1750240772740;
        Wed, 18 Jun 2025 02:59:32 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a93b03sm9384691a12.54.2025.06.18.02.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 02:59:32 -0700 (PDT)
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
Subject: [PATCH v4 02/19] dt-bindings: media: i2c: max96717: add myself as maintainer
Date: Wed, 18 Jun 2025 12:58:38 +0300
Message-ID: <20250618095858.2145209-3-demonsingur@gmail.com>
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

Analog Devices is taking responsability for the maintenance of the Maxim
GMSL2/3 devices.
Add myself to the maintainers list and to the device tree bindings.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml | 1 +
 MAINTAINERS                                                     | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
index d1e8ba6e368e..15ab37702a92 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
@@ -9,6 +9,7 @@ title: MAX96717 CSI-2 to GMSL2 Serializer
 
 maintainers:
   - Julien Massot <julien.massot@collabora.com>
+  - Cosmin Tanislav <cosmin.tanislav@analog.com>
 
 description:
   The MAX96717 serializer converts MIPI CSI-2 D-PHY formatted input
diff --git a/MAINTAINERS b/MAINTAINERS
index e8f3dc93a569..01363fbcb9b3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14742,6 +14742,7 @@ F:	drivers/media/i2c/max96714.c
 
 MAX96717 GMSL2 SERIALIZER DRIVER
 M:	Julien Massot <julien.massot@collabora.com>
+M:	Cosmin Tanislav <cosmin.tanislav@analog.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
-- 
2.49.0


