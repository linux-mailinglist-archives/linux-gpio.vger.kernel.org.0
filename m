Return-Path: <linux-gpio+bounces-587-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21ECB7FBE2F
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Nov 2023 16:36:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8FD4BB21597
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Nov 2023 15:35:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C21C35E0C1;
	Tue, 28 Nov 2023 15:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="PlXSi2sB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A279D1;
	Tue, 28 Nov 2023 07:35:48 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0C40AFF806;
	Tue, 28 Nov 2023 15:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701185747;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MO0oeiUpyqbOgvAxbqOeRIw/9jHxJtwd/pdok3s36o8=;
	b=PlXSi2sBmzn0/PFbfGLe0lOa8p9Rp3u9AJp14hX9ZaxUcbYWXQHwR99gVR0d5OG+AnYAjJ
	pU/wiqt725xhZd/WqjkZ++yokakY9tCVqgiWC1DPsd3tVpwdMNTdGzyY/FWVAb5EK1eSTV
	tB0hnUuKJ0uz8LtoluRhvxjEKZDEEDMrZPJLNu3HfBVrWniDZpAOEn7V0MXVNEvH5Fv7iN
	PfuifIj2dsySSzzpgK0n71RpQCZMK7UrhKTL1a4e7+x8hq+BFIxJbw3JZYX4qnJJB38+8g
	so+dfnK8Dqt36J0fEkUoarRamwn3CQByBRkZ/8GlFyJYXjjXFtBO9qdJqUcQcg==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Tue, 28 Nov 2023 16:34:59 +0100
Subject: [PATCH 1/3] dt-bindings: pinctrl: pinctrl-single: add
 ti,j7200-padconf compatible
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231128-j7200-pinctrl-s2r-v1-1-704e7dc24460@bootlin.com>
References: <20231128-j7200-pinctrl-s2r-v1-0-704e7dc24460@bootlin.com>
In-Reply-To: <20231128-j7200-pinctrl-s2r-v1-0-704e7dc24460@bootlin.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Haojian Zhuang <haojian.zhuang@linaro.org>, Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-omap@vger.kernel.org, thomas.petazzoni@bootlin.com, 
 gregory.clement@bootlin.com, theo.lebrun@bootlin.com, u-kumar1@ti.com, 
 Thomas Richard <thomas.richard@bootlin.com>
X-Mailer: b4 0.12.0
X-GND-Sasl: thomas.richard@bootlin.com

Add the "ti,j7200-padconf" compatible to support suspend to ram on
j7200.

Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
index 45a307d3ce16..c11495524dd2 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
@@ -31,6 +31,7 @@ properties:
               - ti,omap3-padconf
               - ti,omap4-padconf
               - ti,omap5-padconf
+              - ti,j7200-padconf
           - const: pinctrl-single
 
   reg:

-- 
2.39.2


