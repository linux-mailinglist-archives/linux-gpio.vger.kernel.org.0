Return-Path: <linux-gpio+bounces-20384-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 03AA2ABEA50
	for <lists+linux-gpio@lfdr.de>; Wed, 21 May 2025 05:20:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 421AA1B615ED
	for <lists+linux-gpio@lfdr.de>; Wed, 21 May 2025 03:20:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAD4322DFAC;
	Wed, 21 May 2025 03:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cSopkJvE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD721FF7B3;
	Wed, 21 May 2025 03:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747797598; cv=none; b=oc7C8h6t2JWLaLi7u1CBqe/g8UrvFMSTpnXv2Ip75Q7AyeSVaBX+VIgbDxIYXuqRJ5EvrVtMXr3wCxBlIdUpPWvMWZCpIUYwibDEQHQyHmWq0Uqn2AZJlu5kv8zcsFN3m9vSxqmt+vbf1zD33LeTlrhy5lEfMRU8OjfloGjYwjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747797598; c=relaxed/simple;
	bh=SqXI1uvoCkhyqkrY5xjtQtfDKxNrvjB2D2HwRduTNGc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SY+LYzC7O5Lfu3G6zGHOqd2p9Hh6IyB8nHAP40sDz71VuYrpYHg0m/nn+mpqp2drv7tXEtTEPcD1eKcnSSJM7tAlNXOKG8V2pK6odAdlUrP4eXmc/HjZVnBBRYeJXDPLKVF6H4ZPdsz4Q99exIm9GYb2RkrM3DXFbfY4tUqGACA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cSopkJvE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D3855C4CEED;
	Wed, 21 May 2025 03:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747797597;
	bh=SqXI1uvoCkhyqkrY5xjtQtfDKxNrvjB2D2HwRduTNGc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=cSopkJvE0Kf9CTQCl+3k4tYWtdBkGRQCb9G6WmSgt1ZFsgrO/9PAl21runoubb0A9
	 9lBVWXSZBVFLLlvKHISL5XA2lvvDCqB4NIDN+JnjuWpvpjZ8NWllUFQR8yWi52JslA
	 RU+wd62HTK65zSQ5C60CO1dsx8ojDkZ+QeBI7zHSMZXMfDN6ajRCHByw6/pEGBRND6
	 5B94q1az7YCSDzkbKFOdIuWR6BCdHsXtmXqGKeTap3KcCUKd50bS0ohWy7Saor/a4p
	 3iLFRth50SnEA2a0lHs+1vZekLRd8MPFklZcMr7NBUZnXiaf4sk9w9y1qyes9UHPzJ
	 avyJc5SJoYd9A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5D08C54E92;
	Wed, 21 May 2025 03:19:57 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Wed, 21 May 2025 11:19:56 +0800
Subject: [PATCH v2 2/8] dt-bindings: pinctl: amlogic,pinctrl-a4: Add
 compatible string for S7D
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250521-s6-s7-pinctrl-v2-2-0ce5e3728404@amlogic.com>
References: <20250521-s6-s7-pinctrl-v2-0-0ce5e3728404@amlogic.com>
In-Reply-To: <20250521-s6-s7-pinctrl-v2-0-0ce5e3728404@amlogic.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747797595; l=1044;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=SRGfN0xHu7rPLyCZFtaZT28fxmetKbOy0Gk6C4ftPKQ=;
 b=xDc0h5Vw1oMx3S0SYBU1t9FdC5hI5owrChjc8tPYukG5Ui+agERsWO8ognjRHA8PZym76ynxy
 ieA1CvowSUVA6a1WC89YoBskbjrVOPY/oKmnWnNIP7k7mmi+w2gOcZu
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Update dt-binding document for pinctrl of Amlogic S7D SoC.

Amlogic S7D SoCs uses the same pintrl controller as S7 SoCs. There is
no need for an extra compatible line in the driver, but add S7D
compatible line for documentation.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
index 8a6981e9f873..96a7c5646c13 100644
--- a/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
@@ -22,6 +22,10 @@ properties:
           - enum:
               - amlogic,pinctrl-a5
           - const: amlogic,pinctrl-a4
+      - items:
+          - enum:
+              - amlogic,pinctrl-s7d
+          - const: amlogic,pinctrl-s7
 
   "#address-cells":
     const: 2

-- 
2.37.1



