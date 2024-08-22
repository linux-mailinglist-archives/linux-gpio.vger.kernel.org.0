Return-Path: <linux-gpio+bounces-9005-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C4795BF3D
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Aug 2024 21:58:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 70DCCB24990
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Aug 2024 19:58:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2424E1D1F50;
	Thu, 22 Aug 2024 19:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b="P3o21FUr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754F41D0DD4;
	Thu, 22 Aug 2024 19:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724356663; cv=pass; b=Qrhsl9ZEOcOOiw7k5dVvfxAjJ5+nj3IQdsVl7sjbROnZsPTvpDRkO+UaNAYPygxSaiUX8/hAMd4SInB6C2N1TkX74DmzF/bm1syh+CHlPCg2Ypbkow+BfdJdSYMGBgg9SRdLw/b/ewEiMLSekPf3F0MipO6rNmTZEtH8ptSszzw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724356663; c=relaxed/simple;
	bh=BREBKKn0ZLH0fdOJmwkB0mQOqF1Mg+iEIsczGLHjbw8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U+s/a7hleUeRhG7vjlSAZOy7FUSP1TeCDCYxGcqAI8SODLLU+Q4BVV8dm9rPJGo8e57i8pydELXqGFEW/WFXPTxFZctz69+CH/0t02v/Z7VEf/cm5UcZh//0ADF+PjzLEw2OU/UmzxC6doO2rWEg5wJf8wNVyLvVPrJ7rBqgWEg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b=P3o21FUr; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Delivered-To: sebastian.reichel@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1724356646; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=TusZiq+pKSWqrFSwmo41BCEsYdF8+HQBg1ojnW8kzguF03WjPklgFCkEqqLV+/7ZSN1ncJkVfz4uWtHAC3XsuhXmExINWtyv9lhazqqpmCp6HPL7UG2xP7AuDn9deaE0Rpj/F5UopCJqgMW59dPHM4yfVP6b32j3UmwZhTO/Kg0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1724356646; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=wsECUNMxH0Y8aucCQY3cxPX9gTcDFvZ5IvRT4ZS+ya0=; 
	b=FZEmOpEZfhLfJx/X/lXFk/gV1rtTySEKnEY35n5soxI4oIZQdjayvFG3QzSEsomkkr8MGriqIoMLAoE89mEfQPaWP788c3/ECqf8/6GB2c4gyUJLMamjx2rblBnKFSKEbIw8PV6tWX5WQeuoq2Gr/dUp96tnTo7n5khRQveDIGc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1724356646;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=wsECUNMxH0Y8aucCQY3cxPX9gTcDFvZ5IvRT4ZS+ya0=;
	b=P3o21FUrHxtGiINAGDyYkl6/FUteNLCok9D+UYDo9+9BoaZr8/5cHPiMEp/yvl1n
	isZjcQ9YC6ncI7XbjTlq2NWK55iVd1NuorJnQ7G+/1EHi0HAvjt7+XjHUvya7h259UX
	UoPOfQDVXuxI1G2P7l5j5tgLIIs4ad6vn8jobNMM=
Received: by mx.zohomail.com with SMTPS id 1724356644803998.6297720730971;
	Thu, 22 Aug 2024 12:57:24 -0700 (PDT)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Shresth Prasad <shresthprasad7@gmail.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v4 3/4] dt-bindings: pinctrl: Add rk3576 pinctrl support
Date: Thu, 22 Aug 2024 15:53:38 -0400
Message-ID: <20240822195706.920567-4-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240822195706.920567-1-detlev.casanova@collabora.com>
References: <20240822195706.920567-1-detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Add the compatible string for the rk3576 SoC.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
index 20e806dce1ec..6a23d845f1f2 100644
--- a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
@@ -45,6 +45,7 @@ properties:
       - rockchip,rk3368-pinctrl
       - rockchip,rk3399-pinctrl
       - rockchip,rk3568-pinctrl
+      - rockchip,rk3576-pinctrl
       - rockchip,rk3588-pinctrl
       - rockchip,rv1108-pinctrl
       - rockchip,rv1126-pinctrl
-- 
2.46.0


