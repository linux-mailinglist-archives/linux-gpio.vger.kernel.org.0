Return-Path: <linux-gpio+bounces-18191-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D038A79E40
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Apr 2025 10:34:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 03D633B7698
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Apr 2025 08:33:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 805091F099D;
	Thu,  3 Apr 2025 08:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="exP+l7ZV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3819B2F4A;
	Thu,  3 Apr 2025 08:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743669200; cv=none; b=LknaEfMltEElSjm6ysEb1zsfRvl41GTTm2gBu+K4gPoaRZm2fbUpttHhfSQ2kvwxcNB4k7lUKFozgxCDk/Ul9H15qFDFwcAHi+6Pr4zGw7q9b8lgimhI4uvTDEDjUE/GE5ainM0DfDxBM/7sC5LFsdZO/z/qjgVMA1XSv8fyDEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743669200; c=relaxed/simple;
	bh=QgyehMsARveK93ZZL1S0DWD6VKwpD0RfUNcyzEEiVwI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Noj6RysAmS64rxiEtqy9ZNEWeaMa7CWX5EcUwI2Irlo9D/sPJiqQNFVy6zNwPyA1WIhHTrCgPV1v3DEcLcV7Dfp0cpBWDrlKTG3My/c5bkCjNKy+zxf7zjLYn6C3zU8vI+BvpIjjkup28rP54QPgE7INeoAUZBhX90yqtqS0mWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=exP+l7ZV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A1FF9C4CEE3;
	Thu,  3 Apr 2025 08:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743669199;
	bh=QgyehMsARveK93ZZL1S0DWD6VKwpD0RfUNcyzEEiVwI=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=exP+l7ZVtg7SpZn0pCxaOSXBK2L02RuTVX8UKSOIH4gE4VYAZsDIP0XreMOkfNuYA
	 /CWDSKtkelw6H1gJwt9kS1LulFiiKt/UrzKfGGt9Rf6ahxq8l5tZJ7jR3dMRPGOlkW
	 mVUnFoSw7L7FcmqGryPj3r4Vep11kkmpNME9Ssb0W1z2kkpiVAwZ3k0A5heF+pKPF1
	 5rhwplSSVNQXuMjw3gN9ap5BGQ8nIbzlPvzDNLuPgVnomeTSkWL0YDi3AGBhzfzXYq
	 Bf27qSghHvroclrpabvZqmGVNw9tqz8k6Vv76IccyAaiVdWh1Ct8j/ncE9e9MXvOv2
	 WiMVu3I11LE3g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 909ACC3600C;
	Thu,  3 Apr 2025 08:33:19 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v3 0/2] Pinctrl: add amlogic a5 pinctrl node
Date: Thu, 03 Apr 2025 16:33:13 +0800
Message-Id: <20250403-a5-pinctrl-v3-0-a8c067e22295@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMpH7mcC/1XMQQqDMBCF4auUrJuSZGLUrnqP0kWYRh1QI4mEF
 vHujVJoXb4H/7ew6AK5yK6nhQWXKJIf84DziWFnx9ZxeubNlFCFAFlxW/CJRpxDzxtAg8Za4cq
 G5WAKrqHXjt0feXcUZx/eu53k9n4ZVf4zSXLBdQ1KgK5RG7jZofct4QX9wDYoqV+shTzEKsdWg
 kEpigrK+hiv6/oBEbPHo+MAAAA=
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743669198; l=918;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=QgyehMsARveK93ZZL1S0DWD6VKwpD0RfUNcyzEEiVwI=;
 b=wC3pYUawqVLxEBq/uVvbyL6+tKn79Zulf2H4XuvfZ3meWIf0mcSkbL8sDDDGC/t/nsGArhLVW
 COjkuoNlARFCmhaENF1XQ+4ZRl5fa5kaZRVR6OmFAd+EmC1zhfc2qqr
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

Add A5 pinctrl compatible string and device node.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Changes in v3:
- Remain blank line.
- Link to v2: https://lore.kernel.org/r/20250401-a5-pinctrl-v2-0-a136c1058379@amlogic.com

Changes in v2:
- Modify bindings according to Conor's suggestion.
- Link to v1: https://lore.kernel.org/r/20250327-a5-pinctrl-v1-0-49320349c463@amlogic.com

---
Xianwei Zhao (2):
      dt-bindings: pinctl: amlogic,pinctrl-a4: Add compatible string for A5
      dts: arm64: amlogic: add a5 pinctrl node

 .../bindings/pinctrl/amlogic,pinctrl-a4.yaml       |  7 +-
 arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi        | 90 ++++++++++++++++++++++
 2 files changed, 96 insertions(+), 1 deletion(-)
---
base-commit: 79e0ecfc780aaf8c0b6658607f75a661a5f00736
change-id: 20250318-a5-pinctrl-f3c6c6aa0e7f

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



