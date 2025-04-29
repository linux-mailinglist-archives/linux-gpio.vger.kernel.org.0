Return-Path: <linux-gpio+bounces-19481-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C70F6AA397A
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Apr 2025 23:34:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9CA0E9A7B7F
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Apr 2025 21:33:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 353D7270EA1;
	Tue, 29 Apr 2025 21:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uJWjBJhL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A7425E450;
	Tue, 29 Apr 2025 21:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745962427; cv=none; b=dyCMYdQAxkeW6XTutY3RKX1hiUY8c9gJoOx+Lr7YJQG+9D6p3B3K7yi9R2LhgmT1EuayE9zDSnddnC/PuSDdCZ3fSRcAilJgPd3fRWRBFeTUaZczbsRnhY1aMemg1Nv2k3qCEw+Xzv/b5AXEXItie7sEPwM3TQW9Gb5DvdV4tL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745962427; c=relaxed/simple;
	bh=sqgl5y8PVkwCo9nS/VR1ZpFSL6mY1lIOi7iBfe47K3E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BvJ2NwFkQhqgwolpa/9FSK8zOu0jG4At3/qWUA+ZwvMb0HGkjSO8gjM9XVm1r96D045F0gID9JQjDGwVuvrnN5oIKnIr27dUxwPhPa4jOrlWQg8p8KlSdxLh5YVcIdxChcELbJi6vl1OwV3sR8TLnhKoCkfq2OKx+eyEy9g15gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uJWjBJhL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 51B9AC4CEE3;
	Tue, 29 Apr 2025 21:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745962427;
	bh=sqgl5y8PVkwCo9nS/VR1ZpFSL6mY1lIOi7iBfe47K3E=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=uJWjBJhLgqgAq3KyfWA4iQ/y64zfVdFTV/DQxIcFmNyFI2OM7/YO54iiOB9Qs4mYz
	 TtDUXIyu0moBh/E0YwfKKmUw1NehYSER8kFxXz6jB7XPWAug+bUsOomYqfL1gJcxQo
	 N+1ghTXEFhzew73hoqSFcF125Du+8Ky2ecs2cEX2ncYKafJHTu9sZ/Y5s6I0PhbLgD
	 ntzUE8pJN8HuLly5aSCkYVdsXNb0uuq0TIFNbFFYV81H85hDPjpjL8jcTSN3BoWOvX
	 AI6hararlfwzPnfcKQYoVdIzaX+nBceCoMXaDboibrjrKZ29boG1dfTlsdv2BTMiAS
	 7Ams1W7gJMGNw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D344C3ABA5;
	Tue, 29 Apr 2025 21:33:47 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Subject: [PATCH 0/4] pinctrl: tegra: Add Tegra186 pinmux driver
Date: Tue, 29 Apr 2025 16:33:29 -0500
Message-Id: <20250429-tegra186-pinctrl-v1-0-722c7c42394e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKlFEWgC/x3MQQqAIBBA0avIrBO0UKSrRIu0sQbCYowIxLsnL
 d/i/wIZmTDDKAowPpTpTA26ExD2JW0oaW2GXvVGDcrJGzdetLPyohRuPqQ1OkbvPTptoWUXY6T
 3X05zrR/vH5J7YgAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745962426; l=1088;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=sqgl5y8PVkwCo9nS/VR1ZpFSL6mY1lIOi7iBfe47K3E=;
 b=82IwiueRLIua0SuZBRzUSmXl81Zbv2b6djBSxHxKnI8T6smApO86ykTTBxfRIbDo3CWdWaQnn
 Rgx+JNwb27wBcGEP1lIIXapKtz6Fm9bK5pOrMWtsDNSV0qZaNfcKb6f
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
Aaron Kling (4):
      dt-bindings: pinctrl: Document Tegra186 pin controllers
      dt-bindings: gpio: tegra186: Add gpio-ranges
      pinctrl: tegra: Add Tegra186 pinmux driver
      arm64: tegra: Add Tegra186 pin controllers

 .../bindings/gpio/nvidia,tegra186-gpio.yaml        |    3 +
 .../bindings/pinctrl/nvidia,tegra186-pinmux.yaml   |  285 ++++
 arch/arm64/boot/dts/nvidia/tegra186.dtsi           |   12 +
 drivers/pinctrl/tegra/Kconfig                      |    4 +
 drivers/pinctrl/tegra/Makefile                     |    1 +
 drivers/pinctrl/tegra/pinctrl-tegra186.c           | 1784 ++++++++++++++++++++
 drivers/soc/tegra/Kconfig                          |    1 +
 7 files changed, 2090 insertions(+)
---
base-commit: 1110ce6a1e34fe1fdc1bfe4ad52405f327d5083b
change-id: 20250308-tegra186-pinctrl-651ffbbbe816

Best regards,
-- 
Aaron Kling <webgeek1234@gmail.com>



