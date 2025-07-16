Return-Path: <linux-gpio+bounces-23367-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF9CB07DA9
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Jul 2025 21:31:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4CF8E171864
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Jul 2025 19:31:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA78B2BDC16;
	Wed, 16 Jul 2025 19:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MV01fgFs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096A928ECF9;
	Wed, 16 Jul 2025 19:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752694288; cv=none; b=u7xi+queLpe0FOMalEj2nI5OjHifmVUZaFfQAtC4wKIiT3jKUjS3n09hOKPr/YQkzpZgfsV7RHocGxN6xy0uhc87dQ6N2CEOymXNm4iUs02vRXa9+0X2mQ1yXG9niMpQlzs85VBBC3YPtCYKgB3vzujI64qipuAjtnMtNFzZft8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752694288; c=relaxed/simple;
	bh=zcLk3E8m6QKZ807ZGbq64IqbDDccDL60ZUVrGYH/xx0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TNg0FZxYYA2HydTVG2u85n5Qr4DYdyNsv1SmDdsRtTrUdl0jl1CpY5DEDYUUPej7WIeCFSM/C9a/NDof2nISewNvHAVbA6PXtOpbIkhrFIV57yWcRrhZg0RMRIrPV0kljlOO64TdXE+MYw6Irn1W80hDP9Xy/2X96kq7/85RJ8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MV01fgFs; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ae0e0271d82so37150066b.3;
        Wed, 16 Jul 2025 12:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752694285; x=1753299085; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wVxh55aabjNpQwgd6JsidGTK+fKXf2/FtFM7EHjRQPc=;
        b=MV01fgFsmNwBMKjvShmua8TYkCQYZxwSkj9fIhuj53/W9wUFAfIZcDlSv/Mwc58Xh6
         ce9w0JkFVLL0Dbyopyzw+XGU2gBCwP1fN3VtOr4NHpbG5xaSanFhPB2gockohrh3HFZw
         tEej7o0MYLpxuVtEj8hCIfNAzVzu/EO8Vq7a5qHGAZhlCaotXHeN8yauJhbXtVBZXkQs
         NTso1oT3ydqpJmjVqgst6K8aA9z9sYaIIAEUDkWMFqcwW8xazMDwe+ZMy9xaWTJdPgnc
         FH9AiTk72RYkv24iXWa5A6FMAXQ4rCEVG70FMnmu5Eh0DjGNEcBThhfbT7Gu5PKADLMx
         1AqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752694285; x=1753299085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wVxh55aabjNpQwgd6JsidGTK+fKXf2/FtFM7EHjRQPc=;
        b=idI7uoEzN7s876XuXqNgTXxuOSv9gAS9FoS/35Mx96rHhPY3bvGpIgAQRSXBole1AT
         NFDg+vYonmzBc5zxxG+pb5RkHP+uBBkHzf5jr35ndLA/msiXvnfDAI5+7DHjBtr1Ygiu
         I5p0Lf54NSQP2mVm0dFYnPFVEKgeCy0EJJK0ZipW37PYm3BN8eN+NsOVVn7HGouzm9Gk
         fQJ08rjvML0KanfEhwEg/vI6kbsZ7aQTLTdzt1xZScR69Mmd1tAp5TrJM2dwIpM+qOO2
         kVgCZwso1dGupJ/76hfffDAkzqhD9QO4lP/zRvcZPAeCdLbFazSlV3NFkBQ+Sv6nCAn5
         GVdw==
X-Forwarded-Encrypted: i=1; AJvYcCVxNjksvzwGi/VxNVyNu4nR8/IjG5vOCxYgTi0U8+uF7P6/5Vi8h9hdgh6xmRGSFxaQhTl0ep7rVpsqtw==@vger.kernel.org, AJvYcCXAc8irDN7PaIEFwuzNqwJyOj4uqnFAfTyTn4Pg/UxzRAGK60BSwCilFv339fEMAhgyAvWtwjDSSgq6@vger.kernel.org, AJvYcCXUzC6xXZPUQP0ckZ6c0/qDjfhYohwBYO35CZXHVbUcOb4sdFPXT6iX6MSPt754QiaKBSECBLIQkN/i2jVR@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ2+0dr0zxlWbZg1JFugnkdWqzx6DfziWoKIquD2jI9qDZ6mdb
	M4TkF/oj0BgLOcqKHDOHqfqbS1mMzoDebcERHYA/uN59mKfEz8hSQn6h
X-Gm-Gg: ASbGncsBr1m0GFqUk4vsCs0ynrKVj7R+MqpeFgoKLNHmdom5vfU0y7E6YZ+thPZeAhm
	/RVIwpTWkXTA36Xr25nDv/ngeoIfOPDbK/vigfrecekKleDkjxZlthnVfZIc11XIXhp+3Z6DTBt
	u1s1caj+3jXEM0ICLxFI+xyX9PeRTAWEGN7G6S+nslZFSet81uwsvSxGhQMWKjPLCwgIvAwFS7Y
	WWwXIarpgXbZsAoZKNLBd/MZu608shefSphkB3HHi/BCnoP728i+eR8SwBUN710Fa04mG6kWye+
	NmXwYmJYzGVx6XdpKck+b9MJ7P2qYZbl8Tnm2ExuXZ2GKqadpVoudKgtYFFHOPrLU1bWFqxz/hL
	kwBYMgVGYGJhU5h2O89aOWWGvzzKLSJybCtI=
X-Google-Smtp-Source: AGHT+IFSA4AiC68Qy08vTumwlbKm1tuQWQ2gsGG9cujoxGVmA40XsWkJjJbkAdrdu2z+pb2qG6iypQ==
X-Received: by 2002:a17:906:9f8b:b0:add:f2c8:7d3f with SMTP id a640c23a62f3a-aec4fbea90bmr19353366b.33.1752694285308;
        Wed, 16 Jul 2025 12:31:25 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82df54csm1226534666b.155.2025.07.16.12.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 12:31:24 -0700 (PDT)
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
Subject: [PATCH v6 02/24] dt-bindings: media: i2c: max96717: add myself as maintainer
Date: Wed, 16 Jul 2025 22:30:47 +0300
Message-ID: <20250716193111.942217-3-demonsingur@gmail.com>
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
index d1e8ba6e368ec..15ab37702a927 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
@@ -9,6 +9,7 @@ title: MAX96717 CSI-2 to GMSL2 Serializer
 
 maintainers:
   - Julien Massot <julien.massot@collabora.com>
+  - Cosmin Tanislav <cosmin.tanislav@analog.com>
 
 description:
   The MAX96717 serializer converts MIPI CSI-2 D-PHY formatted input
diff --git a/MAINTAINERS b/MAINTAINERS
index 24c557ee091d7..e973b0a985815 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14761,6 +14761,7 @@ F:	drivers/media/i2c/max96714.c
 
 MAX96717 GMSL2 SERIALIZER DRIVER
 M:	Julien Massot <julien.massot@collabora.com>
+M:	Cosmin Tanislav <cosmin.tanislav@analog.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
-- 
2.50.1


