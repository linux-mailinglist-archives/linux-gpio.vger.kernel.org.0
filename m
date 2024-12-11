Return-Path: <linux-gpio+bounces-13739-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 778CC9EC4FF
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2024 07:48:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4600A28466A
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2024 06:48:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 810EA1C548D;
	Wed, 11 Dec 2024 06:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N/0q+uk4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37AD546BF;
	Wed, 11 Dec 2024 06:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733899689; cv=none; b=qum5FSDcYq0OAP0J4FqhQdWgqB9kttJ9QTuqACghuDMJBmEdj8EYvlsxopKmK1gNWJpbodCe5n6tbOskZAVXa5+e7jl3feu9eLGSijT36KifnWQSumwhf8I90g+dbuWs1SEK+HcaToaQ5dbP3MWFnhVjeWLnQ9VwvImBIWUSZTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733899689; c=relaxed/simple;
	bh=OXcuGUST6PRMVKw++DvXhy9nNIvoCMMSwx2WhM7mMpE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=T5mxEFsi/dxY7xkV7Fqw3UnS1dc/r3ln9y4obcRYQjlEimQi3Tm1n2R2sv2dx5BHL9TGNtOtxoGUwdW9xKq19qRoIkN2VQyLdIkFNY8zxro+3tH/EXyilnkGNYTcOJz7tIuD7DcrM2Xp3f9TJe0FKUp9wdT78o3kmosyCyYkDFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N/0q+uk4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C46DEC4CED2;
	Wed, 11 Dec 2024 06:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733899688;
	bh=OXcuGUST6PRMVKw++DvXhy9nNIvoCMMSwx2WhM7mMpE=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=N/0q+uk4pcblU+kTaaEjyJHlXZoWqczJyXf6kd0KyqJeZWja5iW/ZFcCsfCX61h93
	 p3bx2wZac38j/yWcivf/sdKyLKHzm9kGiO6LqIu6y86Hp89hRBV8H8NPIlljRSn/Nj
	 KApbLe1O0cBhAVsaUmb3oDUPKNhZQTPO+UfAPeG9sGxLGGDWlCrz3vak5gglj0qSn/
	 Vtti01Oz5Pw2cq8vZgYRwDx1Zf9KjsSO/kXmQU8mx5SMzVbCqwJuKP8aMKIvKNFHLp
	 aDg9eJK3jbRBuBZf1VSI/rlQL41TXbinZ1qnVf54BiZpFfKv486M1B2QURiv+w90j3
	 03FkEpnuyWRBg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9DF3E77180;
	Wed, 11 Dec 2024 06:48:08 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH RFC 0/3] Pinctrl: Add Amlogic pinctrl driver
Date: Wed, 11 Dec 2024 14:47:48 +0800
Message-Id: <20241211-amlogic-pinctrl-v1-0-410727335119@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJQ1WWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDI0ND3cTcnPz0zGTdgsy85JKiHF0jo9REM0MLI4MUgxQloK6CotS0zAq
 widFKQW7OSrG1tQCTIDtuZgAAAA==
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733899686; l=1432;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=OXcuGUST6PRMVKw++DvXhy9nNIvoCMMSwx2WhM7mMpE=;
 b=FCAXcPi+2/pdauQ4NMuHxESiRUOmogABmpyrp0hwKtO3ielhPDS+1E/wKrJ4TTlFKTKZDGwDt
 um+UAOvzQjIDnQFdm51p4MCGAvMyKCjf+u4yv8ye9qDZAgNmUxQiOuK
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

Add pinctrl driver support for Amloigc SoCs

Base on the previous discussion,
https://lore.kernel.org/r/20241113-a4_pinctrl-v6-0-35ba2401ee35@amlogic.com
The existed meson driver failed to meet the requirement of the current dt-binding.
So we start this new pinctrl driver to solve problem.

The advantage of this version: Once the source file and binding document
are added, adding dts node will be only operation for subsequent Amlogic SoCs
(such as A4, A5).

The code in DTS file is also readable when using GPIO, as below:
reset-gpios = <&gpiob 6 GPIO_ACTIVE_LOW>;

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Xianwei Zhao (3):
      dt-bindings: pinctrl: Add support for Amlogic SoCs
      pinctrl: Add driver support for Amlogic SoCs
      arm64: dts: amlogic: a4: add pinctrl node

 .../bindings/pinctrl/amlogic,pinctrl.yaml          |  150 +++
 arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi        |  146 +++
 drivers/pinctrl/Kconfig                            |   18 +
 drivers/pinctrl/Makefile                           |    1 +
 drivers/pinctrl/pinctrl-amlogic.c                  | 1190 ++++++++++++++++++++
 include/dt-bindings/pinctrl/amlogic,pinctrl.h      |   68 ++
 6 files changed, 1573 insertions(+)
---
base-commit: 171aa289a6fe65faffeb92a1fda283c055435a62
change-id: 20241211-amlogic-pinctrl-22ea61820d0d

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



