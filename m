Return-Path: <linux-gpio+bounces-19977-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 495D1AB461A
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 23:29:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8754D7A3E68
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 21:27:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F88B299A9C;
	Mon, 12 May 2025 21:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f2Qt1VOc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98274299955;
	Mon, 12 May 2025 21:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747085332; cv=none; b=JaLCx4yBYoDdooOY5tAHjKgH0qnq02e0LQ9bJwW0YUZ36IDPd72aQUJaENDPJcAr6D5LBk0ZTcr0B4UylaWeIV2Vlz/xXZRIOdVflImVJ0Vreo6UPVb1g+4CvcYXSiUjuxwCn5ovFdcLKWM9Tkfu8l1T82b9LAElpl9pTwn4hUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747085332; c=relaxed/simple;
	bh=BbfNlYyIq6bfD8iWwyjMF+VezLL/5HH50K5s2pADmws=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XopIa4Yen6Rp3mXEtGW/t0uqvZZ1OUlTvvF28cSYjSWM2oNH52IkGqlkrtPRsrKo9z8CfLDxRwQNjf62hfYbM8zbCG78e/ip4l+0Sy/vnMfcaX8HciRHKm5ssehYsPuDGQjGKs7oHuUvS5gP6eKyRQpoATrkzoo+dk7dOBUz0j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f2Qt1VOc; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ad1d1f57a01so935523766b.2;
        Mon, 12 May 2025 14:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747085329; x=1747690129; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EKrPGYo6r8jTfHw6fTsyOidOITDoSW91H73atx2WSvo=;
        b=f2Qt1VOcxsY2xew31S6M5OSUnxSoyHTBZYoGIZz/4lbqo5JdUebUSOphZV0wwvuHoW
         pNZMZ53btz1CbmUjfbgFsGVqztac/qgZ9ksJIrsI0DDTRkUuznq9NZjVmrwD7cc3NYOh
         hPYxTnbfuRyEwHPpr33OkvKltEBe3zsAE84VJHLgXrd7sR/mjr3U1HzfZkOISQZrGKdD
         DFJzyKIUaLnUHFi5nDYxaoRc6n1+9G/C8OM5RiqT502FbU8a1D4UNONHvXspv+87kVyx
         24/xlQBBhbWZQMG+ztJ72VdSRQeh8eZmTvt2ivPaFytw04t88UKWnm4qmP1sAMtDkwo+
         5EvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747085329; x=1747690129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EKrPGYo6r8jTfHw6fTsyOidOITDoSW91H73atx2WSvo=;
        b=xUtEInpz1007xpC/YQ5MbN1vQbRmcVmyRZLU5CMMYp17REVeu4It+t4tsPSkM9j5jh
         uvNzuO0Ju1pk0JZJvKjyXnNy79wyefS1IXH2qsIG2NIygojEoDsRCQlP4x6QQ+RhzDKW
         seBSKNhShN0g9EUv7f19Xw8jwuwpPf7WHNxFVuYu3YjLDLYBSOib18sUuJOBVz59TkYF
         UsAQPBi3HTQL9JX1zqe8maHXplbQCi3AJJfWjEZJhJWEnfPlo8Ht7+s81yz+V/LmSekv
         OWA69cjQ72ysLrnGZf/fTpfaI6VzQ0uQ4u/YaJK5dGRhz+pQxJfJOpyEaIdtcmdqAUu2
         V6Tg==
X-Forwarded-Encrypted: i=1; AJvYcCVR0KZd71R4EPAMSQH/8mIBbWChqxzLo8cl72l5RhgaS2e8rLLxz0ReKMyDMFkQL93o5JFmY+uED2QN@vger.kernel.org, AJvYcCWyr6HoQ10NUrG+KEFSNtBW45WupEuAn1ZTul+Kb/9AcsONz/Ce9/yDpfmjfwsw9TIzmg99FTGFDlA+Cw==@vger.kernel.org, AJvYcCXF4fU+KLzKJDNbm+UQPc9C5hWbOgiKVfcjsnaIvbdQtZsiQKOuVNhNnFLnzaxNP4gM2BINcrEo/tsPC54=@vger.kernel.org, AJvYcCXQWDIOYVXkeW4IcvbDVwk4wUOxoGlD+ESSizolnwd6D9HKm+U7YReJTb2e3xeGUSArFSVCRgGsLfX6dekw@vger.kernel.org
X-Gm-Message-State: AOJu0YwKPH8s83WmXIqm/5FC7q00vgNVrtfxLXZcak1GBQivS/hhJqzA
	5PfKfKmtw61yafoWy5qB+vqfPHmbUd0PqSVqW0IPkxGPZaXkmZH2
X-Gm-Gg: ASbGnctu/vVYyG6ZI/lOcg37XZ6JT7fu+kb7uH21RGkB/3hyzjn1uAAjcfaKd3uVquR
	wd+IOxVQ4JHAx6gWjQAeeTr2RUxuCqj8tvKwoRoadk/SCPOhIKB93VuxfWMv3gErmzQQ9aeiMSE
	PqeK2MUS1t6sqOX7qVOcdmkqV0kRZxL1bXPMix4/ch9qGrQ5JMZ1lXR23xcc9qSLnRVdzeQce9q
	ie0j4CkrTWConVVdl2uWz/xAdhtUMwdEEvV8sEPmYKjh2F5CNwVGDYVSP9nBO4JnwB30HN9/Nmi
	G8XbimQf7bRYcbGBTwJm3QwwTrJDOjMrqQLtyl5rkytBXYEdEqzovGC3Bnuqmq/5z+nG97M0aw=
	=
X-Google-Smtp-Source: AGHT+IFpt22qZHel8pg/VMN2FxBOpRn/l+5KBVuDEFumIWkq54C5p/vidB0Hx0vw1cOpJ8lTlDD8Pg==
X-Received: by 2002:a17:907:7f05:b0:ad4:d069:324b with SMTP id a640c23a62f3a-ad4d06934ebmr188335466b.10.1747085328447;
        Mon, 12 May 2025 14:28:48 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.128.5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad23a5552a6sm472861466b.30.2025.05.12.14.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 14:28:48 -0700 (PDT)
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
Subject: [PATCH v3 01/19] dt-bindings: media: i2c: max96717: add myself as maintainer
Date: Tue, 13 May 2025 00:28:10 +0300
Message-ID: <20250512212832.3674722-2-demonsingur@gmail.com>
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

Analog Devices is taking responsability for the maintenance of the Maxim
GMSL2/3 devices.
Add myself to the maintainers list and to the device tree bindings.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
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
index 1916d0636408..8f463ebca056 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14198,6 +14198,7 @@ F:	drivers/media/i2c/max96714.c
 
 MAX96717 GMSL2 SERIALIZER DRIVER
 M:	Julien Massot <julien.massot@collabora.com>
+M:	Cosmin Tanislav <cosmin.tanislav@analog.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
-- 
2.49.0


