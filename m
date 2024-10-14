Return-Path: <linux-gpio+bounces-11290-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D0E99C55D
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2024 11:20:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 883B8B2BDED
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2024 09:06:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F70B155CBF;
	Mon, 14 Oct 2024 09:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k8uQ0OXB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B779414B08E;
	Mon, 14 Oct 2024 09:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728896764; cv=none; b=TAMpDTZyCAbnaWcqJm7SGSwn5trtDKX8jtpO1vFkfd+Z01p3B/QidC2VTgHH6l3YhAxzLUTacdUeeB9Rq/4KE1YZ2TVKvtaOBxEujEmydbaUfi7Aez5AUcv5Ms0gYPSieR8Fk+pevLdoEQTPlmxkATINKnKmwIytpflSgyseGL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728896764; c=relaxed/simple;
	bh=rXMah+J87oYT3vd/VshwC8Oh5TzIdt2Y9rGblinQcgc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WtR6lWdKzIKi3E+/F9TcPU6s74x76zac0zq3LDiEzKI8s1eO4HxShjjrmhAJO6f53oxEh0NT1oznSog/mrhEuxaHvCuW3jRF3bxoG/OnDPYS8Y9E+tSp29fX1SWyv5aBL9VUu2Zo3ROxS+KA9+D7rQji3CcAQOSwvRrVE52O290=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k8uQ0OXB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 44284C4CEC3;
	Mon, 14 Oct 2024 09:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728896764;
	bh=rXMah+J87oYT3vd/VshwC8Oh5TzIdt2Y9rGblinQcgc=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=k8uQ0OXB7Kv8+1JDjTKonGSl/O73Q7rvYr3unxfB7J96UmedyS1blqe1UNzCjtMJn
	 2MN13XSh30iY6q42vEZWynwbA8dqub53NO6ILCDlG4p0fcVFyw5ohvob54xZItvc1q
	 xVjslnxZIg8Mfp6TecsEhYGpGQY+oT+L0yw6I9dEsH+LfoqtLWseec06YNO1woYb+C
	 XvKLBiqj0dyf6hDW6FztRUCUZZxvY63mDIsTK0cOpaadX4RwMo0hIL9EyyUApOYzIN
	 Em1i8Dfw58afco+EK6YxCBmtg3NKReCHveOil2IkBwmPT0oUo6ng0Z7arSRHa2h0LY
	 Y8zPHNCSJlZQw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B05ECFC51B;
	Mon, 14 Oct 2024 09:06:04 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v2 0/3] Pinctrl: A4: Add pinctrl driver
Date: Mon, 14 Oct 2024 17:05:50 +0800
Message-Id: <20241014-a4_pinctrl-v2-0-3e74a65c285e@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO7eDGcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIxNDA0Mj3UST+ILMvOSSohxdA8sUwySjREPzVBNzJaCGgqLUtMwKsGHRsbW
 1ANHff0ZcAAAA
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728896762; l=1092;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=rXMah+J87oYT3vd/VshwC8Oh5TzIdt2Y9rGblinQcgc=;
 b=zE3a0ATHwkt0UPDkqLiAfcZlwI7i+KGHXLiqYxVGuW8pgGCunXwkYetcGBd+Uwi7VDAZiZr7K
 8jbTkxDvx04AbcAAIUD1Yb07ySmA03pn6T4ZJs0hKuvniT23uDLnTJd
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

Add pinctrl driver support for Amloigc A4 SoC

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Changes in v2:
- Use one marco instead of all pin define.
- Add unit name for dts node.
- Link to v1: https://lore.kernel.org/all/20240611-a4_pinctrl-v1-0-dc487b1977b3@amlogic.com/

---
Xianwei Zhao (3):
      dt-bindings: pinctrl: Add support for Amlogic A4 SoCs
      pinctrl: meson: Add driver support for Amlogic A4 SoCs
      arm64: dts: amlogic: a4: add pinctrl node

 .../bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml |    2 +
 arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi        |   36 +
 drivers/pinctrl/meson/Kconfig                      |    6 +
 drivers/pinctrl/meson/Makefile                     |    1 +
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c         | 1176 ++++++++++++++++++++
 include/dt-bindings/gpio/amlogic-a4-gpio.h         |   38 +
 6 files changed, 1259 insertions(+)
---
base-commit: 58e2d28ed28e5bc8836f8c14df1f94c27c1f9e2f
change-id: 20241012-a4_pinctrl-09d1b2a17e47

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



