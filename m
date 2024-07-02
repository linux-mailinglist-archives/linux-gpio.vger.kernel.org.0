Return-Path: <linux-gpio+bounces-7874-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED812923BAE
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jul 2024 12:42:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 890FCB213F7
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jul 2024 10:42:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D6B615B0FF;
	Tue,  2 Jul 2024 10:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="BcC99NIC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E4C158D61;
	Tue,  2 Jul 2024 10:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719916917; cv=none; b=NbriPm5/a1t+59SLYbkwIbD32B1Ynqi+KYQjED/ytJKK9NVweJedQBkRjHknn6WmZWgXOQj08snmnn1DTGlHHXaID0I7e5uoJjrCSg+afRa7kTkjtLgzqpwrTnJlZXpJ6x6Wmj7HtoOWe+3CtxO/QnJWbrNPUR8EYpFtPmQF8Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719916917; c=relaxed/simple;
	bh=sPCgBGmaEIjGdzBuX+ZiLW5g5QxenEh/PLa2ZraUm7g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XOttiKnWKrJep5lLQ8xsD7LoAQ229BfRY/y33cqoFYHTdf5GHQV59y6JJZfkCaZyXJiQfqhPzB/I8bjuyqjoSH1ZCsN0DSE5wUrK1MLbzWpaWDn4A81+6wkTtTz398eSqfiAhpr5aX/6d8bHIkXKxLrALZef5iVDW5Z2VBPH69E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=fail smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=BcC99NIC; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=fris.de
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 97049BFC0E;
	Tue,  2 Jul 2024 12:32:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
	t=1719916378; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=VKYV733Fjpk+GAdBZI7izuRi4FBRnkYy/52IFjD1Dd8=;
	b=BcC99NICrst6VxTOtUzFX5RFrJiaxlX2/yPwMUOXY+vSRS/UIB+YkXeB94vzRUFA6rP/03
	RIif0ZrhMkTv7yoy9NAONNr/22kDEl8l+paquwhBz694Yx6OwzYFFL4d+vsozQ6CMVwY0U
	c24ZnVpwy3M/5Pyb/lOdvnz4xq68qwpnEm2B1CktbiHD7GtlVmj062BowxQmpAXCKLGvyL
	Vj7viGP4SYP46mimgUUEc7VaA7Yr0sC8Oz6mGNXol/MoExvk4CKojfU/SHrAWALwDL3cFZ
	K9JozOqbKmXspUNIfkTpeBwMupDmM5rwNc/ynCphMr4zoURGeDCxv50qUQGcYw==
From: Frieder Schrempf <frieder@fris.de>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Stefan Agner <stefan@agner.ch>
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 3/7] dt-bindings: gpio: vf610: Allow gpio-line-names to be set
Date: Tue,  2 Jul 2024 12:31:15 +0200
Message-ID: <20240702103155.321855-4-frieder@fris.de>
In-Reply-To: <20240702103155.321855-1-frieder@fris.de>
References: <20240702103155.321855-1-frieder@fris.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

From: Frieder Schrempf <frieder.schrempf@kontron.de>

Describe common "gpio-line-names" property to fix dtbs_check warnings
like:

  arch/arm64/boot/dts/freescale/imx93-kontron-bl-osm-s.dtb: gpio@43810000:
    'gpio-line-names' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', 'pinctrl-[0-9]+'

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 Documentation/devicetree/bindings/gpio/gpio-vf610.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml b/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
index a27f929502575..7230ba1a386ae 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
@@ -50,6 +50,7 @@ properties:
     const: 2
 
   gpio-controller: true
+  gpio-line-names: true
 
   clocks:
     items:
-- 
2.45.2


