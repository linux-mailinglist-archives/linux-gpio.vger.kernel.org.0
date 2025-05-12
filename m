Return-Path: <linux-gpio+bounces-19988-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BB623AB4649
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 23:32:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 05A421890537
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 21:32:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2197029B8D7;
	Mon, 12 May 2025 21:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gDzRysbx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C357429B79F;
	Mon, 12 May 2025 21:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747085360; cv=none; b=JWrvE7mSiEaWEM780mio9l3N39mZCrcpm6dQPBIZYGojhFVO4DSDzf3J9L0IywPfLyuWGAvR4j+GhgoHBTB2khzKVEAPpq6YvB5Mz0QdLadJA50s0fV9aTnVN3k5hvtTRbNpaOiAPcYd95AVnXluOwIxX5TR37XuicjtwX6Ntzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747085360; c=relaxed/simple;
	bh=zfg+RJSUYWmDFrYgKmNlgJ0fy4URxTXC0G5qvYz8Cek=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ly7LZFEhrJ6yyrHsIZpfsDEF/nguJH8OCTG7pdtxrPgrO4+QtsUZdV0rvX561SuqfVlFsHGGU3zArUdRPqN46gCpfLTRc4zQFZBrPXe99HkMtI8XipqayVm27NbAncVX5SIpkESPQ7EZE79BG3YYFXtdT5tEwLfmcllyOHWZuos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gDzRysbx; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5f7ec0e4978so1480612a12.1;
        Mon, 12 May 2025 14:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747085356; x=1747690156; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Az28+HlcLM0sL1av0MSi/fM4ZT2oYYKjFc0IsJNfl4=;
        b=gDzRysbxxGXlon18IN69U7WW3oAK6jaHU9UHwE4zgbWRDm/I5I9OIxhCp7RyqEakmH
         bxSjV0KUr5Nv1zTwbvlaGjYCW5f7L37G82t8ts+YTie9Fs6pJ6bCAZhT+J5pU7wAQT5F
         zjxIYtZv7cF4aFn7opRGelcalJTcKKRytWEb8CPDXudz2KEIh4JLLOfVyAJCG8hLy2wr
         0bacewdBpmfpYurdKo8ahItG3lc9ucxsvfXOhQ34Y6Rh7mompj7beWTRx4ifpFVhE32i
         RX2P9BxmVjoUojV7mF9jFn6xp8Rs5xcmEKfHT+/V72cx2p9v+h0U6WK1dvdJGM9SmG/x
         i/VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747085356; x=1747690156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Az28+HlcLM0sL1av0MSi/fM4ZT2oYYKjFc0IsJNfl4=;
        b=uELKjpVlitQ9WUhVPzEMrn89CfBfGc5Ru1zwadO/ezjnVP2sB76GAGskjnSen9nc12
         rWfEu/buTfcLg3onYhE+98fZOQ5VM1LSSnnmX+zE/vQ6k8sgUTQ2Ci26c//mhkdIfTWw
         UlDPAn5ksgZgfPRRo/KlZOdZuEvNV3Fzly4yq4hllZuqK8ocPxorwp6IwZAq0WlY9f3B
         7oHzrIOVUCysl5KG0RUbIpaDlbqXiOAoH3FBdi4otMmaUZZUNaYHQqsyfyAyk1PS8BKh
         nDXNXYVV/Xj1m3+1A7skset9+pLf1rXRe76f1lqwsz/jcgXqFwUAuwE48to35gc/QSvK
         0/WA==
X-Forwarded-Encrypted: i=1; AJvYcCV8QI4w0tcwaBehF9VL3tlv5EAf++Ea8XLQPRSzXDjfHP0gpk/i4d5vC/yL7qGqKITx4Z0P68Mw+jGuV1g=@vger.kernel.org, AJvYcCWn63l24ZrBDcvqZhkM5502iEuJVHNCPCTrQNq1dpxb5faFWijjZ+XOjjdtpgy+Q3Drb/+SddAnOIXHAg==@vger.kernel.org, AJvYcCXsdMAeWZhsi2vqZFX0XbEQjTwj3FUaQi3YyQ1Y0vc6PdSSwcJbfHj+77EfPUjhpwJg5tDn1j1VJfTJ@vger.kernel.org, AJvYcCXuDtGSLbbLas929UtQtBvegCWdCX+/NGQs3aor9vwgzMUOK54hUR00r3YKcCgQHKejrxeLXsV0p+xge80H@vger.kernel.org
X-Gm-Message-State: AOJu0YzzxyYEMT+9e1/4Yv3ZG8gu4uVw0VWdu1spd52u1kWlZbIESRpk
	IvF8PqKfk0/MdJTalMsbViXoy1/khuJ/W+NAwlN1ARh4X0V8ru8d
X-Gm-Gg: ASbGncsLH8YDk+A0Q+Lv/cHrHq2tLDhOP951XCeJGtHnRDNIFeVnDUpr+fuaJWKMDJJ
	uwxYPGpLQOvhLQRKAIZcWg8pjDPzVyITg30ZDRVdxCSn1obfLWkbLZHKpdACdNWRMR7qoRlwee6
	VCw13+DqmMn3yk9FKBF/++9BWZmvLtuqWxBsj3OY9tF4F8hjIieNNIS0ICfMMhP5g47U5xYMe3V
	KdJQjTMhrpqvdn/P81PMmTrbpk3m3ECugxZep2IymP0SMKo4zSS4RzQXwc0P6UafvqAhcpoLRBe
	YuxvLcw+byL8fET4O1kJudBWdJFS9zkWButdAHqNfCiOvenfSZQ8dZyxDjHkMnY=
X-Google-Smtp-Source: AGHT+IHxZimkUK3H+FypaTOTN70zLrjfhJRz1zTX6CpTIj/ujzs/pJwUigs4Bc+mQ5Ey6V2j7ED66A==
X-Received: by 2002:a05:6402:40d6:b0:5fe:e999:e553 with SMTP id 4fb4d7f45d1cf-5fee999e5b8mr1117281a12.23.1747085355831;
        Mon, 12 May 2025 14:29:15 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.128.5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad23a5552a6sm472861466b.30.2025.05.12.14.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 14:29:15 -0700 (PDT)
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
Subject: [PATCH v3 10/19] dt-bindings: media: i2c: max96712: deprecate enable-gpios
Date: Tue, 13 May 2025 00:28:19 +0300
Message-ID: <20250512212832.3674722-11-demonsingur@gmail.com>
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

The MAX96712 actually has a GPIO named PWDNB, which will put the chip
in reset state when held low. Esentially, it works as an enable GPIO,
but the naming is different.

Deprecate the enable-gpios property, and add powerdown-gpios as the
rest of the GMSL chips.

Change the example to use powerdown-gpios.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 .../devicetree/bindings/media/i2c/maxim,max96712.yaml  | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index b345305acc4c..e38213209973 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -35,7 +35,13 @@ properties:
     description: I2C device address
     maxItems: 1
 
-  enable-gpios: true
+  enable-gpios:
+    maxItems: 1
+    deprecated: true
+
+  powerdown-gpios:
+    maxItems: 1
+    description: Specifier for the GPIO connected to the PWDNB pin.
 
   i2c-alias-pool:
     maxItems: 4
@@ -128,7 +134,7 @@ examples:
             gmsl0: gmsl-deserializer@49 {
                     compatible = "maxim,max96712";
                     reg = <0x49>;
-                    enable-gpios = <&pca9654_a 0 GPIO_ACTIVE_HIGH>;
+                    powerdown-gpios = <&pca9654_a 0 GPIO_ACTIVE_LOW>;
 
                     ports {
                             #address-cells = <1>;
-- 
2.49.0


