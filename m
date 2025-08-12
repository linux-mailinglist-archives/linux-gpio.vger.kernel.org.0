Return-Path: <linux-gpio+bounces-24325-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F952B23AA7
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 23:25:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A97A51A25E8E
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 21:25:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 286CD2D7392;
	Tue, 12 Aug 2025 21:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aFcZs2kR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB59A2777E8;
	Tue, 12 Aug 2025 21:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755033885; cv=none; b=H8sJ1pL2NQGlPvpbTrEsqFc22l8wb771gG1rgPphqi+nJcVI7DEddYb8L04Tpfc/TbldR6XJunf9e463xyLTyXlG/a7010bZ0Z6Fk3VcjupDh9H2IKtbTXNcuXkzPVe2bBjKihCbfdAYbtHIuaN3o2VtII6cTWLjIrs3pbuPxUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755033885; c=relaxed/simple;
	bh=Dpv1oPQG74ZYLF+MG89cus6fJnJbgGSnLUHZdOkHhkA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nBNnVeFlXN++kbjxmtVttdIit8FYhMj3gTSq3WC9zlRXaHavB4MzsDbtS4LPmbHsb2B77ZAxNFVQYqvF/3HFDStezN7H3v1SKRFqTkshtU19QBPCrw7febDuH4DWGYnpothq0dHL9/inR8wWEJ4UDyF8RoHRL7b4XJz5s/BCVqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aFcZs2kR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 673AEC4CEF0;
	Tue, 12 Aug 2025 21:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755033885;
	bh=Dpv1oPQG74ZYLF+MG89cus6fJnJbgGSnLUHZdOkHhkA=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=aFcZs2kRnESxCNSzFaIigjm+lJrVETBlzHhA1EMtyoMOI1xv+V0BUJRt687FbE1KM
	 2xDVQEuGFwrkSBtcrzqAbdJGYIP1LYRILpuJQC05WNdjhneCRz/Nz9OvpxKx42kzz4
	 fCYG80IfyC2WsFDWXmyApFS39X9aEmhdbwL7isAuxDbp9rjxgSZWxZzdUmjEdBvVrz
	 vsFai37kQAyoPicAJYML1ei81toATNuuzEznbY2dlRUzlq4p+khkD7mOekCNnnSW6k
	 HAGDt5uv9ofNeYeahdmDMbWo1xCUL/zhOM1ulvJ7o5UoXax4jx1jw3c+aQhcWSBXP1
	 MxSjMwTafoU4Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5807FCA0EDC;
	Tue, 12 Aug 2025 21:24:45 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Subject: [PATCH v3 0/3] pinctrl: tegra: Add Tegra186 pinmux driver
Date: Tue, 12 Aug 2025 16:24:39 -0500
Message-Id: <20250812-tegra186-pinctrl-v3-0-115714eeecb1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABexm2gC/23OSw6DIBCA4asY1qWBAVG76j2aLhQGJfEVMKSN8
 e5Fu2iTdvlPMt/MSgJ6h4FcspV4jC64aUwhThnRXT22SJ1JTYBBzgQr6YKtr3mp6OxGvfieqpx
 b2zQNllyRtDZ7tO5xkLd76s6FZfLP40Lk+/SNSah+scgpowWALrQEUUm8tkPt+rOeBrJjET6A+
 vdNhATkDIzkViAa8w1s2/YCxaQ4DvEAAAA=
X-Change-ID: 20250308-tegra186-pinctrl-651ffbbbe816
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755033884; l=1385;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=Dpv1oPQG74ZYLF+MG89cus6fJnJbgGSnLUHZdOkHhkA=;
 b=+vr+CNjojq1xVphpGn0Tq+9eXtmNHftCVnsWUizbQ1tZ7hiFuCn5eBh7/C3TuIBy7UF+eAKG5
 iQ8k4EUtK1rBoyxoD+0U3yNUsA/uH74/dCNzeRMRCVDRZM6kUWDxJ3a
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

This series adds support for Tegra186 pin control, based on a downstream
driver, updated to match the existing Tegra194 driver.

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
Changes in v3:
- Fixed some spacing and formating issues in patch 2
- Link to v2: https://lore.kernel.org/r/20250608-tegra186-pinctrl-v2-0-502d41f3eedd@gmail.com

Changes in v2:
- Don't allow underscores in node names in patch 1
- Rebase on v6.16-rc1
- Patch 2 was picked up and thus not in the rebase
- Link to v1: https://lore.kernel.org/r/20250429-tegra186-pinctrl-v1-0-722c7c42394e@gmail.com

---
Aaron Kling (3):
      dt-bindings: pinctrl: Document Tegra186 pin controllers
      pinctrl: tegra: Add Tegra186 pinmux driver
      arm64: tegra: Add Tegra186 pin controllers

 .../bindings/pinctrl/nvidia,tegra186-pinmux.yaml   |  285 +++
 arch/arm64/boot/dts/nvidia/tegra186.dtsi           |   12 +
 drivers/pinctrl/tegra/Kconfig                      |    4 +
 drivers/pinctrl/tegra/Makefile                     |    1 +
 drivers/pinctrl/tegra/pinctrl-tegra186.c           | 1979 ++++++++++++++++++++
 drivers/soc/tegra/Kconfig                          |    1 +
 6 files changed, 2282 insertions(+)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250308-tegra186-pinctrl-651ffbbbe816

Best regards,
-- 
Aaron Kling <webgeek1234@gmail.com>



