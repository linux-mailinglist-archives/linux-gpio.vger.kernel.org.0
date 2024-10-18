Return-Path: <linux-gpio+bounces-11595-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F119A3817
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2024 10:11:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B5ECCB21A3F
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2024 08:11:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50E2018D62F;
	Fri, 18 Oct 2024 08:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CzTB57Sb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF5718872A;
	Fri, 18 Oct 2024 08:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729239054; cv=none; b=CIoqTOTzncrl7kKwvZRYe5kaDgnp28muaeyqe5vlZUNmfL0ZnbLZyjshmqLEwh3d2OrggpRLF4yVntf3vncsDoI+8ZziVnL0hLzTBnto8mcyl3hOL3lJ19Nn3RufvfJ5Md2y9AtyDCw4WVOTvHgrgoPACuDyadn1DPC30hGx7YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729239054; c=relaxed/simple;
	bh=qam845+M054/HCuxE2Dub4pqx0T6LNs2036Ba2LFmY8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UrcnXv1tS4mh/T1/wKTzBncUoaT1GEuQVwblrb9DnltS0Q9ZzY08vYew9YEybZ5hedlbnqUt1Z04nOhdnjVyGWL5jqsDZ/g2tFht7MRwqZ5ebNFK/mt7cl18GspXfCUfMX3B92sjuO/B+1w1RDNwjCmwDqUBpm3rdGZNK4LoNZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CzTB57Sb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 852F4C4CEC3;
	Fri, 18 Oct 2024 08:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729239053;
	bh=qam845+M054/HCuxE2Dub4pqx0T6LNs2036Ba2LFmY8=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=CzTB57SbnE7u8H5SDZ/GNUvfPjN+H+Y/TAZeCNvH9Y8Dy/fjEueBtFDxjY+1RK3Zz
	 +FxIrlgpoc5pePyfVeb/4yGm+YWqaeggvOlieLs6+3SOsCp5tii3ndWg0R5SqAij3A
	 VSDi9B8Myyif8qUjhqFNogyZdzRsMkRdTnmGqQ+VoFZiQL684Ph4a9UPJvlwYss+O+
	 05+kckJ6drNkAJ0D4nAWsEF65AEN0jvhkE84QXF1nX98G0VaOkoKy6RkLiTeyIVbY3
	 8qEhM8ofu2pB/yktIZouRcpbu13kcIvfWBC0h1A1kC4bFs5MDreLGTb8QeKwgfoyoU
	 RlO7d9xdjMRjw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70FC2D3C544;
	Fri, 18 Oct 2024 08:10:53 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v3 0/3] Pinctrl: A4: Add pinctrl driver
Date: Fri, 18 Oct 2024 16:10:49 +0800
Message-Id: <20241018-a4_pinctrl-v3-0-e76fd1cf01d7@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAkYEmcC/03M0QqCMBTG8VeRc91iO85WXvUeIbHmSQ+ok01GI
 b57Swi6/H/w/VaIFJgi1MUKgRJH9lOO8lCA6+3UkeA2N6BEraRCYfV95sktYRDy0qoHWmVIG8i
 HOdCTXzt2a3L3HBcf3rud8Lv+GP3PJBRSlGS0PVUOzxVd7Tj4jt3R+RGabds+UeMFT6YAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729239051; l=1206;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=qam845+M054/HCuxE2Dub4pqx0T6LNs2036Ba2LFmY8=;
 b=iq5sxMdSUIEb/ykt5CpcF6wTUW7k5vVqa1/aARrx4VQWbC7RVa4rVQEkZ2/RvI+s4XmHmW66h
 ZH7b6a8vJc+C4s/evg5ba7t8c9UZRdHkZw1MOWQX+Fz8dW58kTSduDI
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

Add pinctrl driver support for Amloigc A4 SoC

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Changes in v3:
- Remove head file from binding.
- Move GPIO define to file *.c.
- Link to v2: https://lore.kernel.org/r/20241014-a4_pinctrl-v2-0-3e74a65c285e@amlogic.com

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
 arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi        |   35 +
 drivers/pinctrl/meson/Kconfig                      |    6 +
 drivers/pinctrl/meson/Makefile                     |    1 +
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c         | 1253 ++++++++++++++++++++
 5 files changed, 1297 insertions(+)
---
base-commit: 58e2d28ed28e5bc8836f8c14df1f94c27c1f9e2f
change-id: 20241012-a4_pinctrl-09d1b2a17e47

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



