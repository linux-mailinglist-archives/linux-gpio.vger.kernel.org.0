Return-Path: <linux-gpio+bounces-19989-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2C9AB4648
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 23:32:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 970507AB006
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 21:31:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 745A029C322;
	Mon, 12 May 2025 21:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nGoErnGH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67BE5299955;
	Mon, 12 May 2025 21:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747085362; cv=none; b=DkzvOZ1iOap/yNsE0W2bh/3i/6YEv15cJK5FQLFOOcGGbZtuCd8SbHK0ghpnwB1leAzq+YJ1/tvlSrD6PIfKq5nJwEjDPrpXghy0KE2nDz7Z+VKZXLbRsJJn/d4ZBOAzU+EMQztwra38yjIil+vVq+khP11tFy0t6koPjBIV0II=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747085362; c=relaxed/simple;
	bh=CGt+urdvC7bWYv8M2PFC+P/n5LD82zm7rxySf4RlgYY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B6ePQt6FCmwjH3DBl0NEnuZfNRUs8hGYbp83NWwhQ11pfAf9vL6Yt98D2zdP95gOOcblvfMC6ifIEypy1sHIWs4VnPrPe5rMQq/9nhcM2TgVpuTpC2nj9nUMl7RyjwGD12cr4NGQ6oJWKFY5C76qliN1D1SiEWxjRxwxy4Wv1hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nGoErnGH; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ac34257295dso836122666b.2;
        Mon, 12 May 2025 14:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747085359; x=1747690159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aCEGd5QmXaIoIGtIYkIMv7CgoQZabDj2tjwmcFG2bWw=;
        b=nGoErnGH1tl35B/NQX4AfABNFpJGdZ1uhehfhHWBt0R0In4pMWYWgV5N8lQXe3Sqxf
         ehGCZWV7CxErCYpvg3RxGT5r2gZKv7WVHYuVhUwOvRaSGu5Y7bl6GBfSHq4Mq5a6n+D5
         WWYu9sTi83rxeyhRn1tkekbU3avseHEGLOdp0DHqHxM5R2qjAWhERQKxvhimEnG+4wyp
         Qugs6D3hZd+ZJsYt+i+Pb5UcstU9PY0yNMumqfyTrOVhpH+IBZnAElf9sLVyPqchyjU2
         +TfjBLPhZtYfRbMgQUvAmsv/Equ14D1BLXiLoGBZQ1opsdsq+r+rooVsVjhWpEXH5z68
         oDTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747085359; x=1747690159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aCEGd5QmXaIoIGtIYkIMv7CgoQZabDj2tjwmcFG2bWw=;
        b=h0Cebf/d8WpNeCmPiB1lcSWl+H7a95oNAUb0hJeVkm/IEjWQrgYC77Q4xbnGcVvFQk
         FXqDdbuLukhCOcB8pcPldRkId4RzpWBF1SkKWKVVJ+C58rkyhZ5mM/ozhNpPOI2LIwTY
         AH0BMRSriPZYhmObQtpCd5Dufb9HlSRqBhj+l14lBuI0q/Z0npA1gEK1A3TQr+H/whhy
         Z2rjDlnAjZhElSJbD/V8ZHBOP4X8itNpET2f1j59vM/MNf7pXnHD6jUmJEV0MhEv8y5+
         6a9Xrh9hHZjNblJ4K7SpfiXM78QhqHNU8sWbsvSyRw2Van6wMckeMxJu8BFU4wmLj5rt
         hCWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnPaYaIFUhyiSHey3J2h5a+LAHsXaFY9pijIco7oJwfKIehXyofRD6WxWko6I6g+t0i2cQ2v1jyw1T@vger.kernel.org, AJvYcCV6uLIbriwFFrY5WxZIChuhZDJxpjsSGfRpYG7cdmhRn52LAW+7sYx16UlD4VM4A8mQH49qsuHNTbQCuA==@vger.kernel.org, AJvYcCVCXVMop/wlHyEl65y29J4egKC3hEiaOxr/AYf1h0lgNIrbu+zqiKVFU2ah36wAjR+wkGXPxeTO3NFVWGA=@vger.kernel.org, AJvYcCVl2A/VOl/poQQHPWqWVEvNn5a/gZR4F5ytkvPZ9CMpArY0ckv+l8r+OOmWm5a6pkMo5j9Ae2Wl/8aHV5i6@vger.kernel.org
X-Gm-Message-State: AOJu0YzF02hxh7MkyPzJ2W5utvzwbCbVnV7DIa4bAAGc5dDf27xEyQdU
	2vUVn9DSXi9XB/Y50WiGSvy6J9+XN71W7IHyZQrrveAldwzpuM6m
X-Gm-Gg: ASbGnctvqAjoDrtRJh/DXOzI9l5bIz3gj3vy008ADbp2kMJo6KjXBKGg690z2UB7FIr
	g8HCDcXnD++XhazKMprm+Ou1d9d0XUYFUmUqpZcdbMq2AUV2I/3seY2FCRRVDTdqVu1nNjPOEOL
	s8CjhklMk430iwS1+KS0pCNhAawtpl91c8INANl0VxfPFq9Dn5vEq7wAmw2u8/kTtRnhyCYGrGd
	QuA613iDynGigWYpP94A33AJaLuJpnph57mV9E/r9EVIUJQCMfytfJL2kWqNf5VcZvPOy6LbPU1
	0dNgWVVb91KUeQuQ/fVxvTX0Sw041AQnfZ5qP+VlhPFO3u+hjsTgGvCThkDf4LM=
X-Google-Smtp-Source: AGHT+IFOVZsqKkUnHrG+Z2T30gLqj4jyTC304lPRcXNoZpYwifO2FrYbU1VK0myyirrCmWtQYAce4Q==
X-Received: by 2002:a17:907:72c6:b0:ad4:d5be:8329 with SMTP id a640c23a62f3a-ad4d5be83d9mr91960066b.3.1747085358761;
        Mon, 12 May 2025 14:29:18 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.128.5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad23a5552a6sm472861466b.30.2025.05.12.14.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 14:29:18 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Andersson <andersson@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Liu Ying <victor.liu@nxp.com>,
	Ross Burton <ross.burton@arm.com>,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	Eric Biggers <ebiggers@google.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v3 11/19] dt-bindings: media: i2c: max96712: add support for MAX96724F/R
Date: Tue, 13 May 2025 00:28:20 +0300
Message-ID: <20250512212832.3674722-12-demonsingur@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512212832.3674722-1-demonsingur@gmail.com>
References: <20250512212832.3674722-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MAX96724F/MAX96724R are a lower capability variant of the MAX96724 which
only support a fixed rate of 3Gbps in the forward direction.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 .../devicetree/bindings/media/i2c/maxim,max96712.yaml        | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index e38213209973..0adda5574714 100644
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
2.49.0


