Return-Path: <linux-gpio+bounces-19983-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96EB4AB4632
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 23:30:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E176C7A663C
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 21:29:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C289A29ACD7;
	Mon, 12 May 2025 21:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mdpPK9/C"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0398129ACC4;
	Mon, 12 May 2025 21:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747085348; cv=none; b=iRHMKmmIz5Q6a0NFbju5q9JwzEVb7u6CU29v3t9Yzh/gAI6A4L/yiaY2oedAyR09QyQnja4iiknyPqTNvhCJ/Dnu40Cks+I0FUm4gEptM9WTAUYP71tUPz8PxVfMdbHwnrwIE7W5nH3bKb43zvEC53QZ+T779NVBqQL7/IhPEm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747085348; c=relaxed/simple;
	bh=WOZHxr1JPl5MhxAXvir0pT2I7EGKgta9DVSDIll+ckc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jHyG/qZNRWhUuttLAhzvGmRzATCCAmC+9ydaNsnzorKr7RKdVbi9z/zjtugT0bxYxzYIhNDLGSiIOf4lDSyZR9jdgacUJPsRGTfpPC7mTNNoQioTe2LSUDvrkYTmVJqeuGF9XKnmGJz1Mizr1kh7hbadhtIXZQ6DexioZfdLNLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mdpPK9/C; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9ebdfso9141710a12.3;
        Mon, 12 May 2025 14:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747085344; x=1747690144; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bAz48FYkFVpYXUdYC+Su9R3w9TkApJmckQAewQrh2nQ=;
        b=mdpPK9/C2GY1itkarOpauV9cQ+fW6ac1D5z1YhduVudClwf/7btB49taPHat0eJ3ca
         +6Cly5MIrK5hCwJIgf6AVI+xYQIssclaU4+1bMU0mTZ9VeoQB52Mmhi3MpCrzVEAcPEo
         3LjZW6Nl9m1p0CipzXonPXhGfPrGKQYfHxGM1sDr5Ri+XsHW2ERRnFdjm8BzymIqFFYf
         c+Gmb6EW/vuAej/mgBFmjkTf/ClWYwB1afglkjoM/22fPdJxsY23A59ly/I8CxUdENZz
         K8WnWjm6fUqXCN7Q9dlQh7dsBviL98Cj6Ty8Ydvp4HZZNs1UKBABZtOzumkBSypV7Dp/
         7p5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747085344; x=1747690144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bAz48FYkFVpYXUdYC+Su9R3w9TkApJmckQAewQrh2nQ=;
        b=ZRlujF3FigYTS3yMhnCndqB4VM7HSJCt6q5p4ZziNGKZqUksJfyu7GTCMtEQbRsjSr
         OG3H7WS4hNsVAMSIDZDck3SKVXWP9tBM34MMLfCEwsptxPR63VtalBXC0Rb2HXeFwiic
         JNTF4I10AeFzSz50t0E1zPfsJRNOM/aiwlMBqifIWqtaNZbAgh0h6dYDnQ+4zYB64vrV
         eavRhaw9yE/3BAmXqMZj69UEZEn3iKBo5iSAlK9E5MRElYzRkhJQkvIyyRzoCQfvlALi
         JYfcuYI6akKgOsphU0jVLTL77ylmncxnQ+Gg9TxTzRYGSmh7byVuFKWJTAy7X34nFwSz
         1LSw==
X-Forwarded-Encrypted: i=1; AJvYcCU7R/bhAcyWtTD0xaivW0eBtv/vnx3BOIPSnxZ3Cs/cx5DJrvBwmeTV8d63B9fCowxc9Ixm2XjqwUs/F9s=@vger.kernel.org, AJvYcCUoXUoV0WpU+ESSmvm/iYRN5uXLU/xr5WNi+yhkY/0ZjqgDnQ33lEp+nYuUtoZkTl8M5xug89AfwacEHjoa@vger.kernel.org, AJvYcCVPBeRcSn1tXHoH4p1UnnLJJLccayxjkpl4Zi6Oippqts0fc9Hrz16ZLA+sFq9+MQPzy+xu2MV5n5I2aw==@vger.kernel.org, AJvYcCVgTSEs32zRHzY4cN1ZKdZ6B0ibE61aC8hlaoaRzuUameXpxstIzHuqwVkVkta+58SJSFspR+pe5coY@vger.kernel.org
X-Gm-Message-State: AOJu0YyuVAaju2xDKfb146POeOytueGkA5eug+ixVi+na1GVmTBWt9Tz
	iwspryJB5D8rv6x6oa3nukvNfuoCcFHPuUN2alCA88b1Aoq302vG
X-Gm-Gg: ASbGncuRQR7jNLQAVkOLlFMu0gAQJGMqeH0Hun0GUcXMrV/Uc/Ugls0KT7itpUN9J+z
	ifMLPg71o9i4e2Bi0dSYcvnlLsg/eB/53Jre+rd6YB20S5+XZ0ZA2AaFtCQ89DxEjl9jJfqY3St
	+KLml4GBPsWuzDWB6BnsVJSEPcBtycJ+WOUj0r1cbeZzx5uI2L5oUtcHqbByit1pEz+eMChiJsA
	FySkrYzXHvYBZK5a7YoHCz1sV6yRnpDaRy7N75NRjIbpKzBHh/fzu86LFu7xAjqnnQ3Xx1qQN/J
	hoxC7isVMkYpEkn16ddupXRoROTgFiaBAQDFaPuIPlfV942YBWPCSacqlA5rzy7+U+mr3A5CFg=
	=
X-Google-Smtp-Source: AGHT+IF3wDuYJ+g7Mgxi4N3TDw1mN1R3uL1whx6mbYJx3067WhAjCO2lvksHmND2LByrVN06I2Xi0Q==
X-Received: by 2002:a17:907:1c91:b0:ad2:3eab:4998 with SMTP id a640c23a62f3a-ad23eab4c5cmr884411566b.32.1747085344105;
        Mon, 12 May 2025 14:29:04 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.128.5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad23a5552a6sm472861466b.30.2025.05.12.14.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 14:29:03 -0700 (PDT)
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
Subject: [PATCH v3 06/19] dt-bindings: media: i2c: max96712: add myself as maintainer
Date: Tue, 13 May 2025 00:28:15 +0300
Message-ID: <20250512212832.3674722-7-demonsingur@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512212832.3674722-1-demonsingur@gmail.com>
References: <20250512212832.3674722-1-demonsingur@gmail.com>
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
index f8ffb7cff9c5..abf3afc95fc9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14184,6 +14184,7 @@ F:	drivers/media/i2c/max9286.c
 
 MAX96712 QUAD GMSL2 DESERIALIZER DRIVER
 M:	Niklas Söderlund <niklas.soderlund@ragnatech.se>
+M:	Cosmin Tanislav <cosmin.tanislav@analog.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
-- 
2.49.0


