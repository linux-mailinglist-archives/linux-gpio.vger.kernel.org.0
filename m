Return-Path: <linux-gpio+bounces-7337-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FDA902FC9
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2024 07:11:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 981E2B21FF4
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2024 05:11:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22A6717085C;
	Tue, 11 Jun 2024 05:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uggSy2wc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7304170835;
	Tue, 11 Jun 2024 05:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718082660; cv=none; b=Ge7379B5dnjgkzHSJKpCgiGySrCOxQB9Xq1bGZ64MXoHOCEcX/3fx5A3gCYTi3q4M64ky1XaRCSGF/TD4C2A1bIMQb28dOUeuR+WBIropIWgVqdwIxYQ+55CQY6kQSdHfAhaJ/d83BsaP1skn1x7uZ7ycZBRQa4OEHC1t/9kQuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718082660; c=relaxed/simple;
	bh=a1yCcNo00YVw+JbGiKiSn/QHOttjkTM0NAqfh9YXZrA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mp6TwiCBSJbT4zbhYLnbjFzv26DTiiacB6kvPqRI1KDcaCbfrQBCN+w1mCOxaAOa5B/R/Y3Y3CG5hDKaI/ZZulZZ5fttTzaDGnD5ykchTGLkcqkkpju8F+80TZC7sS5hJhhmwIPjLndMRYegWtK+ElkHv6oLDxsmN5b8lmVIE1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uggSy2wc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 281C7C2BD10;
	Tue, 11 Jun 2024 05:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718082660;
	bh=a1yCcNo00YVw+JbGiKiSn/QHOttjkTM0NAqfh9YXZrA=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=uggSy2wcxCeuMHpNhrkm0bzwOYCIcJcZECvpe65lQLkrX3cDvOFTQTaEXQ28shxFx
	 dT5C394l/6LKypiDoTgdjnfqdU7fha6dY29reltS4SRR3rVnT+EKmF+uuPj1yu+O3w
	 +8K+20GxdgbPPa2TqqWMQ+Ct6x7L1PfhnfNxLnNKO/r0cpylRzCv4zx1tZZBul7qZP
	 qHAyxIoMwzcKMnsuSndHgqzNy4ezLiTr/nrgSXSR4T7+YP0jaMsv/myQ77hPTZrGD7
	 dUnuC7gMMWSNofmtooux4pPqtYmPxW3ZPwxlN8zgBKhdb+MDQwHS8odUOiL/7QiDAb
	 OTm5WzwbXq8Pg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F144C25B76;
	Tue, 11 Jun 2024 05:11:00 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH 0/3] Pinctrl: A4: Add pinctrl driver
Date: Tue, 11 Jun 2024 13:10:56 +0800
Message-Id: <20240611-a4_pinctrl-v1-0-dc487b1977b3@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGHcZ2YC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDMwNz3UST+ILMvOSSohxdExNzEwNjA0NLQ9M0JaCGgqLUtMwKsGHRsbW
 1ABgVCJtcAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718082657; l=963;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=a1yCcNo00YVw+JbGiKiSn/QHOttjkTM0NAqfh9YXZrA=;
 b=CZCp68RkKk3QYBnZehamSHoVmqDw+Dzifk10pmgVUl0JpV1jociJdPiNpRjHkbrWa+WeSTn9m
 0+CraFm8i7UDbxmz6UALLINVPDDwMSzAmkl8uAHpkYTKEzmUfVrJhRX
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

Add pinctrl driver support for Amloigc A4 SoC

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Xianwei Zhao (3):
      dt-bindings: pinctrl: Add support for Amlogic A4 SoCs
      pinctrl: meson: Add driver support for Amlogic A4 SoCs
      arm64: dts: amlogic: a4: add pinctrl node

 .../bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml |    2 +
 arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi        |   36 +
 drivers/pinctrl/meson/Kconfig                      |    6 +
 drivers/pinctrl/meson/Makefile                     |    1 +
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c         | 1163 ++++++++++++++++++++
 .../dt-bindings/gpio/amlogic,a4-aobus-pinctrl.h    |   21 +
 .../dt-bindings/gpio/amlogic,a4-periphs-pinctrl.h  |   93 ++
 7 files changed, 1322 insertions(+)
---
base-commit: 87501b7ca0005c533d770d37e0047a60954d986a
change-id: 20240607-a4_pinctrl-44740301915f

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



