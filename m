Return-Path: <linux-gpio+bounces-17297-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 63133A57CF1
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Mar 2025 19:36:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B6F60188D104
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Mar 2025 18:36:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93C61214803;
	Sat,  8 Mar 2025 18:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IyMoFqut"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B23214214;
	Sat,  8 Mar 2025 18:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741458898; cv=none; b=aYHB/POoFB4tfv3cRiPWdkZq1/tHsw1Zx8bBZzjUwc0Jm3ZY5uDyDgS24feUXUo23p5goWiNeI2aDJSQDcFLTGW83axXMTdWbV278+2gI4NRBGI1TvXhC6yqC0EPLbuPo3Eo7eIRSTN+H1sXyvcce8dJ5xSW9+uUTUcXHvz4HWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741458898; c=relaxed/simple;
	bh=aY2OdPtIEjCbNO8extSTSEs8Nmwq4TVYO4BTZvMhQEE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yq9k5RaYG07wpgjDspIziKzWWhJUbhyYNKxv60NiyjnUescv+FfEhrDm1GqNpRjsyIT3bx2AWPx+LcfK+/uv8Vb1Ps2pVp2x+k6HB/sbA9lrBaxGfNLhQPa+0Y/MXKaCdlJAJgoXsc3GgK5eXve+47UFleFX7zpTBd9IKT7jSWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IyMoFqut; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-abf5f4e82caso566404866b.1;
        Sat, 08 Mar 2025 10:34:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741458895; x=1742063695; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a0RTV5VskyQw4SxBnUu+Jki4ojhQmudu+bw9SS3hYws=;
        b=IyMoFqutwo4jqSwWsvRJpjU8fAwOCEMTsadfkqxz9GDPAN4kY+sNFzTWICCLJGO8Vp
         oxVMcrGRJopOZNEosW1OXExd9tZ+Qe4ayb4m/YFWojT1x2CPNvnXmLElCq9Z10oh0u9r
         biDSACaIJL9HC4tfLcSpNJQYSBDqfUVbkfDByio2S3MSREwP58cJJrRy/xu3kBsoX/Bo
         cZw5OdrJqlvtd2s/VavlwZRaNKFfSpq2mryIk66Iy6y/KIK5gDoXZ4QaO7IQz/1LJRp9
         mfqNGEXOifF6afq4QpnBfcoj6xOMgm8vl/Mk97yltJjGtykhjdoH55TP5unfFcTvJhcG
         8b4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741458895; x=1742063695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a0RTV5VskyQw4SxBnUu+Jki4ojhQmudu+bw9SS3hYws=;
        b=nY/uz0KNHtCgId+JeS8tBEdfu+GNS36n/qzgaK7F/Xnki2ExGecTlDcg48SEpX6Sf/
         eVtHR9nkxUQnV9KUgp3018mInJIxBU2YME7JihIiFUbxNFc9foz2Ekt+1EKHx8mQD6Ws
         IHVJtnVBdZqqxX6xPi4XKir3Q6RSJDqNSSGvxhLi2QxpbJWCXbMs3CXyTOxIEQY5ykPY
         IdD0IeXhV3a+xx7uzfN+7EdmSLSEeVEn2TOpMAaiwr5Gcwph+2jBi3wSPgPv5hLNou5J
         eiJFZNcy8kMwZaf+JVFKTehBytbij4hzv5FnEHvRGDzHR1rgFe4/SQw5Oaw7CyVk93Cs
         XJpA==
X-Forwarded-Encrypted: i=1; AJvYcCUuXPZYH7US+pr6si3eQpQ+EUz8D+ZDkAqKFT9UF4j2BGOHbHWsEDVGxBQMJVO9sbqxxXQs7YtfwoQLLkVP@vger.kernel.org, AJvYcCVJKyuPYrMFrUt3RFXfXTn3RnCB+SJkeyTAGIoWxBbYQ1U3H7jwwx0aGorawdrrB9TiF5Zu8b+KTZkRCOs=@vger.kernel.org, AJvYcCXOap/sHur6sO9jGeBMoL6qG8tW3oeuPz0DsqMnQ3myD5tr93pLeNxkLVnTcQQgrKtHeSrp4vbhvMpT@vger.kernel.org, AJvYcCXwAKZeQ45HziLalZ5nQ73ri2YwzB1ck+N24k/NGYY7QSxizs7dyiBx0kpLOP0yGr5YzgOahX5GY3eNJw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHXxwxqX5U6YG190cpqDS4qJzcbC35RdhylGR++8Uq7rdZq6jh
	qZm1cMErdBVNri01JsA0Q/kUKWmlZpNFstMKfs3xkNXMlLdL+WZR
X-Gm-Gg: ASbGncumnzAHI7LIsWG1o+Rk3j2AjYworr6E9R3scgkHWChyUtMNS4DY0ZITyf8kN1k
	hfJLORFiPmpW2VnQ/fpo8KMKFqg8nvlFORkHeML+P2fxV7rWIHx33Zmjwugl94uIpNOMfaJHdGQ
	X5nmugrTS9lCf1Io6OwupzN3tnKqMXtt/SIkc0XKxa04N2vSoHAQoN4jA7Ie5uopeRyC5PZp7di
	BAzq9Gf3uo7i8lQPPQwxGu/vctlNcUyryR1+vnhsZbf+BUvcL0HNTSGfOQKsoij7BP3tWKTfcnV
	4yeVjPRHWBTR5Dc/mjl7ALqLtzqt+pKpuyE+VfXFp+Dva6qflZtgwGbQZw==
X-Google-Smtp-Source: AGHT+IGUMLDPU+kLqQqakvTwdZEbBOPDJZa3MFxXA26YIFzmlmYTztaOBI2ZGBOinmdRJLH3zGhkDQ==
X-Received: by 2002:a17:906:7303:b0:ac2:3ea:c23c with SMTP id a640c23a62f3a-ac25273a0f7mr996974166b.5.1741458894715;
        Sat, 08 Mar 2025 10:34:54 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac24a84397fsm379693666b.96.2025.03.08.10.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 10:34:54 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Eric Biggers <ebiggers@google.com>,
	Javier Carrasco <javier.carrasco@wolfvision.net>,
	Ross Burton <ross.burton@arm.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Ihor Matushchak <ihor.matushchak@foobox.net>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [RFC PATCH 07/24] dt-bindings: media: i2c: max96714: add myself as maintainer
Date: Sat,  8 Mar 2025 20:33:36 +0200
Message-ID: <20250308183410.3013996-8-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250308183410.3013996-1-demonsingur@gmail.com>
References: <20250308183410.3013996-1-demonsingur@gmail.com>
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
---
 Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml | 1 +
 MAINTAINERS                                                     | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
index 3ace50e11921..44667b74296c 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
@@ -9,6 +9,7 @@ title: Maxim MAX96714 GMSL2 to CSI-2 Deserializer
 
 maintainers:
   - Julien Massot <julien.massot@collabora.com>
+  - Cosmin Tanislav <cosmin.tanislav@analog.com>
 
 description:
   The MAX96714 deserializer converts GMSL2 serial inputs into MIPI
diff --git a/MAINTAINERS b/MAINTAINERS
index f8ffb7cff9c5..7fcdcc57c8ba 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14191,6 +14191,7 @@ F:	drivers/staging/media/max96712/max96712.c
 
 MAX96714 GMSL2 DESERIALIZER DRIVER
 M:	Julien Massot <julien.massot@collabora.com>
+M:	Cosmin Tanislav <cosmin.tanislav@analog.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
-- 
2.48.1


