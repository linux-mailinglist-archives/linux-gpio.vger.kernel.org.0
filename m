Return-Path: <linux-gpio+bounces-21394-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39EA3AD570E
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 15:32:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B973A3A2784
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 13:31:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5553F35897;
	Wed, 11 Jun 2025 13:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hu2bw+M7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D43928C2B4;
	Wed, 11 Jun 2025 13:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749648715; cv=none; b=LfMMqHElNMU9N1ktGxDzlsvsGPZ9PfXcrpYa5H8pbYV7Bgrhwl0EoZOI8i/ZDjmvsvVmqftPfeSvUbjpsK9XdGBoy/q97DEpXySJgZ5cabgFuosOnKWS259o+OJh+ifKzINArFNvdScudNjePBKxvRgsvEcNK9/6zhFgSSXa2X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749648715; c=relaxed/simple;
	bh=v+moNxRvidlpxyDzSFcUYvlY02SUk5i5xzP/sgNlv84=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iCZoGct4BJQKXrVzjKpOhCI2DUIjp1+j9fzInHWgm8KQ7fmvV4uNqXuMBXlK13f1xNTQDPsA+5323hFxPtCeFgQ8fNLlrKQvisSq5V024jdj+KAe8JOlHNJs1LwmDNM+2gutwgxwlILNsa/QT9V0/lBnwz/DlCfvLCDhwgw5yRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hu2bw+M7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29DC1C4CEF0;
	Wed, 11 Jun 2025 13:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749648714;
	bh=v+moNxRvidlpxyDzSFcUYvlY02SUk5i5xzP/sgNlv84=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hu2bw+M7NelTABhKBxTAY6byOPqO/7gOUwW/UyT3GSfruoP9lr0AmI6LqMYKMPg8B
	 E+IpRWxeGHoef5zFSt459pr3KKa5XJAgUtRL2LJL1MUZ0EFqG3bAtLrQH6p1uXn1mb
	 W28tfDwAsi+0KbipQrmzkAJ5BuTREYjXkkwr5nOCBYKtJAQM8+wlDxk6uK0XI4H6ds
	 V8LSIW12utbRs72CoapP4jLW3wOhwdfcJ2xRbZ4pUDbrTXGpaE3lEPDoOmaJUF4a+e
	 S6V6T4hOKkmGR828BFC3iYoL6pZwWXlE5v9vXpYmF/uCMR0maFbz3za449pPan6zaQ
	 Ih0ZSrrTTfB7Q==
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
	Michael Walle <mwalle@kernel.org>
Subject: [PATCH v1 1/5] dt-bindings: mfd: ti,tps6594: Add TI TPS652G1 PMIC
Date: Wed, 11 Jun 2025 15:31:33 +0200
Message-Id: <20250611133137.1686183-2-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250611133137.1686183-1-mwalle@kernel.org>
References: <20250611133137.1686183-1-mwalle@kernel.org>
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


