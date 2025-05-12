Return-Path: <linux-gpio+bounces-19981-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1B0AB462A
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 23:29:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6105E19E68AF
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 21:30:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06F6429A9F0;
	Mon, 12 May 2025 21:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AyJ5DGVA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC6AD29A9C2;
	Mon, 12 May 2025 21:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747085341; cv=none; b=pZJdNQWnJfCLp4Z8sZTmY/olDJ+JzU9zsozqRUcZidQFDlJs48TEVUN1gMPX+yyzHtSi64Zp8oiRnffn/6dnfg9zM9xAGH9TMsVQJBhXO8uKzC2rT4ZICin3Dr3MNJnks+zncfv0nyDVAHmQsjV3R+OmNZ2KU1hpHNKl1kj7VhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747085341; c=relaxed/simple;
	bh=v8JZPPCmGx4DwUJ2EJxFmzLgmKrI+p/Zffgpv0LqZdU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m9OvQwL3WTOPoV+TNKGEIOtNS87TsApBvgbXIw4H6Bg3M2woeEnSdH3i4iz/XLlS42S7hNI6SyxKaGheE29k0G1bn5cOlbPHGTDuXMVjNTzoo1jNHvbA0S29j6QzqHa7ZwFmBOlzc1CfR1yF3+H98hKTL/JSZEEAsd/jt1MwSuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AyJ5DGVA; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-acbb85ce788so898041566b.3;
        Mon, 12 May 2025 14:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747085338; x=1747690138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8kUjFgmSm1aq3i57OyhvioiCKoKiPrbZ5ktvNV9Nzik=;
        b=AyJ5DGVA8Pyphb0szW5WryqcVGY9cZtVjRNAsXOZB0ZqDHEqJK8yiIKfM1zFvGE3L8
         ef/JP4U4LtoaMwPR/x7vGU9AZfcnAEURviT7PDWkDlvdTG/BnFgjeiorfQWlkUzw0cQr
         UgsdWwkaCziaexq61MaOnqEWh3l4gHrCzgL2FbLz1IRGFWsp8NvB38VOiKV7efwRZz4/
         znhdWC2LENZZEQ8uA/o6I0e/LGZtwyCuEZYIou9mN6YFOUgB2C8Nc+anyLQ5PtLWptT0
         j5A97dzYbeGulvWP86kUZCg8QzGYGbePCqDGZ7Gs4ZQVGUoiWzJdFfCBA7F2hPRnN7SO
         B1RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747085338; x=1747690138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8kUjFgmSm1aq3i57OyhvioiCKoKiPrbZ5ktvNV9Nzik=;
        b=pLgPu2Hknedn3Uz1Q3IDGqOg/hd9dJrxcRslHXuHf7YGXXR+VpJaWvmedNwmQ21KFU
         Y5oLcynmb3hHlkvJryWdNCtqPTtwReeeBOywvcAh46DhaF8TebxRfbKaL1HeEhN1lNx/
         qgpUuXB5iJpCZzFmn27c+EcvkekCwTVT00R8/PWg0lJx5CPe9zw8FlJ3ckU3p0GjJynx
         hE8+6nl+SYjYbjxAkoJkKqVGng7xK9xh9j1EbbSSS5DDyYwYnrq6XVULcC2EosCMU4Vm
         McSpUsmT/fR6cLtog4sEbQXklTsSuZcgdYeYMg8/cVbgeGIgHxdYa6ev6Q4OQD4eQwk/
         +5NQ==
X-Forwarded-Encrypted: i=1; AJvYcCU07UpnWu0f4kE2MBfarkJqCYeKylLhQ9KCsSRBkj50KUIMJ6HJZLyzTrbvPiCa7Is8NW2ppEYBl8Oq@vger.kernel.org, AJvYcCUKydM/e4fkhV2hWP5irHcHtpEbb7cd2bmtR6eeiRUjY/SpuUxKsNYG+qg9qrtJBH308VrKPQdpAbhA9MjK@vger.kernel.org, AJvYcCUSQ2FYv10B/puKsvMzzwAAYw5KpQBfjxImO+I2xAp0jRMgDSck9XKTBmFooK2LeGu+KRIF4gNkkTuDOw==@vger.kernel.org, AJvYcCWpIbLFke5D3vwCuG5v4A8GiL4XIhY1/PsTYQOSeO0ZE8hD7dK6VtEKaWMClDVCNvAMQLhuYMMf4N7EF44=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGio4kn0u1NWYatlmKKp6dzyMWaPc8AKRDR/6jxlKhXiDps1u/
	tRUtENOeCz4FKfPPgHrPRIBdFdNrEd/RE40u+UZfFbb++2k8TUAJ
X-Gm-Gg: ASbGncuxgE6EilcCVp8yC5i+dokzt0UeDWbmv9M0z20smNiMAN484zrYi0b++J/WyXx
	4XkhkYW3Vq8spuUzyBBanzoseBNMiEc9ZaVZfFCoznYiVBv1XUYNNW1+MRxNNNBe3DLBTQbhHNq
	Dx7z69rzd9lbqRilKLEMw6egXd06sQlaUfI66DzOGYM/3dsnbpbbTAY8iHmK9f9m6bWjl85eWNY
	m5aIjjifAR69mH0WcLJ4NMGV216fPhJ+zQ8SVcKqqUqq0nVigfiX+wAdidzuNhymQG7kWLV5+zp
	rtqYi1CaqLAf1yzW11Lsu+4mPl/B3V6FxzQQgO/Lq7sM7CIZ3M9iilcv6iBtSG8=
X-Google-Smtp-Source: AGHT+IEAPVafudDeKA7IZ+hp3781+KmAJJInbgDkuJoHFCm7mtISYKOW0uPGJOyF57LmU+R37Wj7OQ==
X-Received: by 2002:a17:906:4796:b0:acb:b1be:4873 with SMTP id a640c23a62f3a-ad218e54d32mr1432739566b.2.1747085338068;
        Mon, 12 May 2025 14:28:58 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.128.5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad23a5552a6sm472861466b.30.2025.05.12.14.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 14:28:57 -0700 (PDT)
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
Subject: [PATCH v3 04/19] dt-bindings: media: i2c: max96717: add support for MAX9295A
Date: Tue, 13 May 2025 00:28:13 +0300
Message-ID: <20250512212832.3674722-5-demonsingur@gmail.com>
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

MAX9295A is an older variant of the MAX96717 which does not support
tunnel mode.

Document the compatibility.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
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


