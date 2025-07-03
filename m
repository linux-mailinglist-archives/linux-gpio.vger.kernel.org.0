Return-Path: <linux-gpio+bounces-22707-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6FD8AF7252
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 13:32:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D086A5288E7
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 11:32:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1194D2E3B09;
	Thu,  3 Jul 2025 11:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hHpz3G+g"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEAD92E3AEC;
	Thu,  3 Jul 2025 11:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751542327; cv=none; b=jBS6qvM5ICUO98Lci792+OLHDNr91ec5N0ieXhTsJFKEI56/TF9xzRlCdGzN2A/9g5V5kDGVtcmsxK3M7Pnjq2HGRJ0QQNHMfjA4aaZ4lOl0s+ST2KUKeKmpNsSVdpnHePPjUD5lMpclSNZsD0/7v6CBu7hgPJ/+/b4+9Pc5veU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751542327; c=relaxed/simple;
	bh=CLjocfQhTv2btnL4nKTEDOp+4oS1ggJW5Qc2uMHm88I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tefayslFrUsK88QYJaXxHYFvMjDmd8valcXffekqCGXvNDxSpTlhWBQ9yh/oEwhB8iy2/0a84h+wjE+vyhNSOtFJ+Nv4yXoPbzhA1Y+ZEuHfS7j+9ebyN5JBUa2uF2xGfVjFJU/xO8yyMj6JPQIW+EicMj3kdwh0WgQqSOOUYRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hHpz3G+g; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B405C4CEF2;
	Thu,  3 Jul 2025 11:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751542327;
	bh=CLjocfQhTv2btnL4nKTEDOp+4oS1ggJW5Qc2uMHm88I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hHpz3G+geN/CcM5y5quORUTyr8cpVd9/ZlzxzgscG7w/OoGj1+a8PHhqWzyE5HELV
	 3yzM9JD1iezuM2ClUAvcSc3KOhBSW1UVURqLnxbD8NFiAW65snJiFv8UTdMqZ3truv
	 7Vm4gSLASMzp1nWNPoobPWBIefrD33iAw08J+18LTF4s9qWRUIGgdY55VKFMqhZ9v9
	 texn77h3huF0ifMhzfJTOY5HiY6PZb3ERyCEcUU+0bK7FpZJMvKfXNMSMzSJq0d7UM
	 OSNE2GnFHBQLALOi3BNVw24Zb1zVlPGN3J3DmWSffmXSik3lfgD0AvSGMSYwgvxWWS
	 s/TboRqeuNMOg==
From: Michael Walle <mwalle@kernel.org>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Julien Panis <jpanis@baylibre.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Michael Walle <mwalle@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 1/8] dt-bindings: mfd: ti,tps6594: Add TI TPS652G1 PMIC
Date: Thu,  3 Jul 2025 13:31:46 +0200
Message-Id: <20250703113153.2447110-2-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250703113153.2447110-1-mwalle@kernel.org>
References: <20250703113153.2447110-1-mwalle@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The TPS652G1 is a stripped down version of the TPS65224. From a software
point of view, it lacks any voltage monitoring, the watchdog, the ESM
and the ADC.

Signed-off-by: Michael Walle <mwalle@kernel.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/mfd/ti,tps6594.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/ti,tps6594.yaml b/Documentation/devicetree/bindings/mfd/ti,tps6594.yaml
index 6341b6070366..a48cb00afe43 100644
--- a/Documentation/devicetree/bindings/mfd/ti,tps6594.yaml
+++ b/Documentation/devicetree/bindings/mfd/ti,tps6594.yaml
@@ -22,6 +22,7 @@ properties:
       - ti,tps6593-q1
       - ti,tps6594-q1
       - ti,tps65224-q1
+      - ti,tps652g1
 
   reg:
     description: I2C slave address or SPI chip select number.
-- 
2.39.5


