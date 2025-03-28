Return-Path: <linux-gpio+bounces-18091-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 73BE9A749CA
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Mar 2025 13:29:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 221223B85BD
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Mar 2025 12:29:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 832FC21B91D;
	Fri, 28 Mar 2025 12:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="y/sX9qPI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184A621423F;
	Fri, 28 Mar 2025 12:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743164974; cv=none; b=eRhQqMl7gd0PdJ556icDhi78k88EEoGQGx2dI09ihCsaKyvAB0qEGR3e05HZYoY8JJ0HOyQuvn01JUpTSo1N+G3M/cEtCZaWxGn18aA3DUcPw1B0L9J17PwBQKeCi3Mx1AZBq4upawVOZOH0BAyMJa01R+uvgXIPATBa3wxr7JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743164974; c=relaxed/simple;
	bh=E1w1Pu81bUhOsVxhSt+NbiHujeHIIyEqLBGhz2QxMQw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gW0wpXVOBqY2zNpaZD7sfkjLk4R5nG22Shgg+R2aNipa/Bbnwotu5ZfZBwbqeBYxvAjNMkh08We3mGCb8PF0rfi6stJcxijGJcFH9YW//Hl4KxjVuaYNwAHqtKNwGbep/zDor+JZqwU4nmKxWd3/nh3fYElW2zTjvv9GDHxd3jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=y/sX9qPI; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 27B311F93B;
	Fri, 28 Mar 2025 13:29:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1743164961;
	bh=CJoUsYQQ2p89R4BMLX7IiEIRyUeB4EqC9KfvN65AKKE=; h=From:To:Subject;
	b=y/sX9qPII563AOIh4nsmHa209II2+DyvCWXOmT1qGGrksAjVHkPfLJiWufWP2S7Y6
	 t3k9FmX2NSj0V167AwBYmhKWMGs9N3vNmuoyH2wzHijvUrc31e0aOjY0cNbuoKclAJ
	 4pNC9G+l8GPqtuMGD7DRGBdP9591W7tTWggmcKQYVDaVCc6dXojYsheLH6qrmY3HIB
	 LGAdaX8HjIp8uM6M41UIJmgxnxOrgbkomKZKOo0jOHnDPju2Q2VSGXNRYYiF9dS0BF
	 sieinzZHu0CfwTmH798xTc10GwykiueergQeayuTjAddETu6NSs/1KJTTCKOFvQz8U
	 1TOBENrK05kOA==
From: Francesco Dolcini <francesco@dolcini.it>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: [PATCH v1] dt-bindings: gpio: pca95xx: add Toradex Embedded Controller
Date: Fri, 28 Mar 2025 13:29:17 +0100
Message-Id: <20250328122917.43273-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>

The Toradex Embedded Controller IO16 is a 16-bit I2C I/O expander
implemented using a small MCU.
Its register interface and behavior are compatible with the PCAL6416.

Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml b/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
index 7b1eb08fa055..db1520ff38bd 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
@@ -16,6 +16,9 @@ description: |+
 properties:
   compatible:
     oneOf:
+      - items:
+          - const: toradex,embedded-controller-io16
+          - const: nxp,pcal6416
       - items:
           - const: diodes,pi4ioe5v6534q
           - const: nxp,pcal6534
@@ -132,6 +135,7 @@ allOf:
               - maxim,max7325
               - maxim,max7326
               - maxim,max7327
+              - toradex,embedded-controller-io16
     then:
       properties:
         reset-gpios: false
-- 
2.39.5


