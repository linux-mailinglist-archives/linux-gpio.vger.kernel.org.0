Return-Path: <linux-gpio+bounces-21106-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C0EAD16B5
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Jun 2025 04:13:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D9DC167FD5
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Jun 2025 02:13:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75C36194094;
	Mon,  9 Jun 2025 02:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G5VSebKL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2790612FF69;
	Mon,  9 Jun 2025 02:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749435200; cv=none; b=PgrOzVOw6aEbUd86AhJPifKKAwXaDG+0V6WZD9ZHAbR4wGEro/FqScBf1UTNjnriKzA/HuferkwOVV9aJcCqPyKGro9cMt4mzwuvfFPUXtCaxyvezg42W3epfJvRr8258IybKUG9ninDSlSjFCYU33YujIAz6cYBc8mHp4NPS64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749435200; c=relaxed/simple;
	bh=lOx07OEPHI4zIhQLY6PyPM+jjTNfD5XG4BYf083Bork=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fOn+bpQDXxZm0cuSCLJ6RzK07tHpaC8zD/Pz8h1sNpCTu++Jsheoic2TeBnXD0LAB533B3pe2eZusKOXOQhaRAbIxQFMHxjYHv1ChbxMMRBd3ZVm3dW4F5wrBNwAdVGFmNMUGq86D+oET1EWhDybsU6GdWuNCxSA9eSuVIgHWNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G5VSebKL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B0435C4CEEE;
	Mon,  9 Jun 2025 02:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749435199;
	bh=lOx07OEPHI4zIhQLY6PyPM+jjTNfD5XG4BYf083Bork=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=G5VSebKLRwMrJ+AhMsSo0P3RibMQm3HgCV34RWSmnLYPH5RrJbHTyXq2ScXNFM9QM
	 hU2EzkxUjN6sctfX7klmRuFoBC1cgGfekHCTkVkHKikIrpklHRsF6j8SXhwzdM75Ii
	 WljVrJ8j/n5AF0DEIzIfEiarg/XovsmPRSQXSR7TcVPmJvjmlyjcV/jKJbW6JvspMy
	 uPrfGHGSmw9cXSN+/FighUzQ0+I09c1Vx70i3S1Q43+oLc1UjTkFR6sZnFX/9RioYT
	 le4ItE0NKxJ/rZPnmW2fipWijAY+HYhMzeM8YLOrmgODfPX6yh0OEZROGYb6S11ddy
	 6hm1gwJN6lKzQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FB98C61CE7;
	Mon,  9 Jun 2025 02:13:19 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Subject: [PATCH v2 0/3] pinctrl: tegra: Add Tegra186 pinmux driver
Date: Sun, 08 Jun 2025 21:13:12 -0500
Message-Id: <20250608-tegra186-pinctrl-v2-0-502d41f3eedd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADhDRmgC/2WNyw6CMBBFf4XM2pp2KC9X/odhQesUJuGVtiEaw
 r9bcenynOSeu0MgzxTglu3gaePAy5wALxnYoZt7EvxMDCixkLmsRaTed6ouxcqzjX4UZaGcM8Z
 QrUpIs9WT49eZfLSJBw5x8e/zYVNf+4tpbP5jmxJSVIi2shrzRtO9nzoer3aZoD2O4wOodoShs
 AAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749435198; l=1219;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=lOx07OEPHI4zIhQLY6PyPM+jjTNfD5XG4BYf083Bork=;
 b=O1rlq6CV9i34HIKnA2LRs9rH6O9Bnt683ScNvXZXVAqIWBk3Yq6RQDFNOzO4LQi+KVVwaV+Ju
 VgsQi1AFbneBuSoJ55FJ2JDsEg23RmM8iC+mCFXUHdJqgneva1MFsTm
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

 .../bindings/pinctrl/nvidia,tegra186-pinmux.yaml   |  285 ++++
 arch/arm64/boot/dts/nvidia/tegra186.dtsi           |   12 +
 drivers/pinctrl/tegra/Kconfig                      |    4 +
 drivers/pinctrl/tegra/Makefile                     |    1 +
 drivers/pinctrl/tegra/pinctrl-tegra186.c           | 1784 ++++++++++++++++++++
 drivers/soc/tegra/Kconfig                          |    1 +
 6 files changed, 2087 insertions(+)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250308-tegra186-pinctrl-651ffbbbe816

Best regards,
-- 
Aaron Kling <webgeek1234@gmail.com>



