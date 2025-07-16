Return-Path: <linux-gpio+bounces-23368-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B89B07DAE
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Jul 2025 21:32:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 245DD1C21700
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Jul 2025 19:32:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBF012C158E;
	Wed, 16 Jul 2025 19:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dNKVSu9y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6692BDC38;
	Wed, 16 Jul 2025 19:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752694290; cv=none; b=TbY7OFuxGnpsZ1n907FqUX3mI53jxJBONQsCty8y7mu8/yroRWtNcsBTV728ExkcfU0qEIYLsfUZAhY1aRvcqHv8bbamPwXMWeKNHgvUBlUBQ/OqQIrDyPe1WBjUyLFIzCAsR3oEkxpm8nUHJHiyyJAxLV0Ien08RQuP3AoAhm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752694290; c=relaxed/simple;
	bh=hb2tD74FkJ4Z/oLY/veC6PvS/+Yzd0YGgxrh+Xy6/FY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qYGCeFSJu8q8SCKX6mX8TeNEsjvd0TZcnaSQgAV5yM06Dm1OTxog1b5dYxdd0u19odj7BV+SrCftxo6fqS5uIzlgqUHbnM0bZ2IMtUyWxQWLtaU5B7qSfBgs5a+ykSveaKy8GZCyvlk9HslRfx0H6C3a5OAEw63cKBnsv/DvtLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dNKVSu9y; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-60cc11b34f6so2294908a12.0;
        Wed, 16 Jul 2025 12:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752694287; x=1753299087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OYu3gq0SvKezou7DSttLXa9MnM9KSDxmSDvAl9UefcY=;
        b=dNKVSu9yTqe/ImAirYA2AxnZUVp/RJjV4a6U/5CSZXT/2o9wiTsztI+dB0aiUAHSzQ
         Pv0BhhG8eG+hgx4CUY+7usFqUG066OXgayzMPsvsotwqpHo6nf0DP858px6vd3vvtDpB
         to8mMB6R/UkoqXK3xCuUFeTsrZDHhNQUrPscrcQc71uCcWTrT1kS5QPIVnPiQ0GX3txJ
         xQwMiUcvL8MAFHIiu0/yThVj5zMK07WA7nNjSnSUsJd98s9ESQoamaXlqHbRjBTVznxI
         Pp/8UcMuaFMJjDoJFVfpz/ib2qYKOgwAhUxNQQ1+rzRW/7TkezWu+4tvad0Zh4/Lq88v
         brmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752694287; x=1753299087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OYu3gq0SvKezou7DSttLXa9MnM9KSDxmSDvAl9UefcY=;
        b=qvtZZwYM8L1kjxPQhYScBMx5skM9LM6deOlJX6+wUQtvdSaf4VWyDInlICzF2gpha2
         lyoPWwnPxXLjpugi++O99KR32BBgsBDnCpHNuUtd15333h9KiubjX3a6mHlXh8eONli/
         ZZQY0STnjmZKc73J5/UM+sk5hk2aeCEoX/0gYC6vfT9f5ZqkIWVc57pnEajcYlhF+chq
         6hJk22jcwNkpbXC6VE3SeY68GNOvbb+ZHKwdkSw3gNVnuERleG/ZNU/SKB9JpHsJWIdq
         zMAlRkGCM1votD7xRLcjBigtw72Lz3aMdmi7nFlv+obkxDHz3kQLoMNyEkDqDuP24sWE
         sgHg==
X-Forwarded-Encrypted: i=1; AJvYcCUAOj3u345JJJgve03eD1Rok87AZF/D3OPUWMDKBzCS6gM4noc/s3DA8ndcr4DXgXX/YPE8i2mH2WqC@vger.kernel.org, AJvYcCVClEDTYzgVnvlfY5hm4G8n6leq34s3O5+2l/j6C+jm2+uc57D9+jVr8+GaY4pKbb0N15q4BZN8TyT5rg==@vger.kernel.org, AJvYcCWxQ8didqr/H2tA/WmIIl8Xkby826fZnVM4faxlLC4gkLk0e60d+6mQLTTfXhX84qGopkdXCxwYiIQwTT1B@vger.kernel.org
X-Gm-Message-State: AOJu0Yz91Dv5coAuHW44swCqb1+J1E0NcIieAFXSYm0mOLd6L+FLJsJ7
	ytJBGj075BqEDN2kyEQIJ9JtAkWUsjOlSdefDauauroYcpdMAMS2sa7A
X-Gm-Gg: ASbGncvTQQ8DgmwXmtn4ZInHygKzprWVaEhiUDmmAAmYRpn86BzjtpjWZxlzQRZigeK
	rziXFMV4joXnZEb3mzyzu5c9qpQ0OjVEXaXrzl296guYFenzXOZ1lB338zBIs+yjYnrL5LezUmr
	m/CVgIVyY9jWYi4kULRvxpNekAinPfdUM/917UypLJMuo8i7Truc4CBBm0bI53ZUK1ScSeeJZXP
	veWjwNCK8Y4d5HZpm1YVOKFK4HbuDxKy6wM0iEsMli9F+odXzFT88QHp/e2VyaR1VtCEmelmEYN
	NpTVmovIu+l7u4nVxZ+RclSZsc1+qRxXCPDnZhCbCtjQDcC/w4RnP7wb+u1gSVYt14lfYoXiFWw
	ovVMSPoIxWEz9ieYQFcTiCVMbD3ddmyUX+/A=
X-Google-Smtp-Source: AGHT+IE9hyqk0Ays7b48/c7q9YcZueCG0jpD65kEecgbSDJd29bPwrXMO3zJac64DIeLCtVIxzqB+Q==
X-Received: by 2002:a17:907:7b83:b0:add:f68c:5200 with SMTP id a640c23a62f3a-aec4ddb5f4amr47879466b.6.1752694287162;
        Wed, 16 Jul 2025 12:31:27 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82df54csm1226534666b.155.2025.07.16.12.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 12:31:26 -0700 (PDT)
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
Subject: [PATCH v6 03/24] dt-bindings: media: i2c: max96717: add support for I2C ATR
Date: Wed, 16 Jul 2025 22:30:48 +0300
Message-ID: <20250716193111.942217-4-demonsingur@gmail.com>
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

MAX96717 is capable of address translation for the connected I2C slaves.

Add support for I2C ATR while keeping I2C gate for compatibility to
support this usecase.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/media/i2c/maxim,max96717.yaml    | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
index 15ab37702a927..167c3dd50683c 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
@@ -92,6 +92,30 @@ properties:
       incoming GMSL2 link. Therefore, it supports an i2c-gate
       subnode to configure a sensor.
 
+  i2c-alias-pool:
+    maxItems: 2
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
+      '^i2c@[01]$':
+        $ref: /schemas/i2c/i2c-controller.yaml#
+        unevaluatedProperties: false
+        properties:
+          reg:
+            items:
+              minimum: 0
+              maximum: 1
+
 required:
   - compatible
   - reg
@@ -99,6 +123,21 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - $ref: /schemas/i2c/i2c-atr.yaml#
+
+  - anyOf:
+      - oneOf:
+          - required: [i2c-atr]
+          - required: [i2c-gate]
+
+      - not:
+          required: [i2c-atr, i2c-gate]
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


