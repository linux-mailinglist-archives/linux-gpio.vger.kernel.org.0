Return-Path: <linux-gpio+bounces-20120-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1093DAB63AA
	for <lists+linux-gpio@lfdr.de>; Wed, 14 May 2025 09:02:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E3123B220D
	for <lists+linux-gpio@lfdr.de>; Wed, 14 May 2025 07:01:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 959F22101AE;
	Wed, 14 May 2025 07:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P7mXiIXn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C8B20C460;
	Wed, 14 May 2025 07:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747206103; cv=none; b=A4h3U2VBDjIxegGGinVXtDcEfdfBebxfVyTvVvv06D392OnZ8cOwiYmfFXG46TdxKfqyHwas2EITTexv1GiYA/LLIA+22jx9K75gJbBa2oUjJ5CpGkDTf8AC7TVoG1mntrif1lSuj3ZgMlFZtBHqQD0mMqJiImhekRkvm1zgGa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747206103; c=relaxed/simple;
	bh=UCvwzxK/bPYbO8uWFcLJf6fdSxKUc+Dc5+81ionsKhM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CKXv5uFDmzTX0Iipv6Ii2r7+jMmOstlXmH89v92SrLHFsSijUMODNOaoZOxIBxheWajnoJnF2dioG+FfYWBF0oUYax4I9R0a+dcP9Y/Zrwn6pDHIB44O6FxAqjL6aSDkAkBGYzxFB8lW0tdzABGpk458D73edQf+/4F1+8pb0zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P7mXiIXn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1F1B8C4CEF0;
	Wed, 14 May 2025 07:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747206103;
	bh=UCvwzxK/bPYbO8uWFcLJf6fdSxKUc+Dc5+81ionsKhM=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=P7mXiIXnzebaTaPNlhq/ZZGro/gSv7BlGzq3xvtbAJqbveA7erQ3vXgAfTCk1ezWk
	 uUDWA7co+hpz33FeQ1LfvEO26QhinP6Yg6fn4Nd2GhtR6gODmX8AiQGu7GvL5lNhTP
	 SZQyWCLVD6BxBEHj/6RKtHm+oICmBnn9/n6+1AT9A9a9f9PFwmRjh9Q/K/XjoKor16
	 8CZENGKEMJIggj86RIVgqfBw4AAyS9k5kGLsCw+BdLk1yEUeGvD4Us9UYbHu0Vtf+f
	 aslvduTCM5MNaTqeyjK37hjKgHk5uKTKSDEV4IxWrFGpMtgm/RRTZo2aEb4KvwWUi1
	 8LlafgVcMmoAw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D566C3ABD9;
	Wed, 14 May 2025 07:01:42 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH 0/8] Add support for Amlogic S7/S7D/S6 pinctrl
Date: Wed, 14 May 2025 15:01:27 +0800
Message-Id: <20250514-s6-s7-pinctrl-v1-0-39d368cad250@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMc/JGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDU0MT3WIz3WJz3YLMvOSSohzdxDTD1KSURAuLRJNUJaCegqLUtMwKsHn
 RsbW1ADAKQIJfAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747206100; l=1883;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=UCvwzxK/bPYbO8uWFcLJf6fdSxKUc+Dc5+81ionsKhM=;
 b=9zDdZ22pvS5vNX0fUz5ZoCaN6HYJO/cDbnhKPhZi+P2y4KnpF3VzjKvUGxtZryG6WooZyc0AW
 PV4rUrCHdZXBqRMOSsRbuUQorKcwea07dQkxMWVfTTRUIFci2gJQl/k
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

In some Amlogic SoCs, to save register space or due to some
abnormal arrangements, two sets of pins share one mux register.
A group starting from pin0 is the main pin group, which acquires
the register address through DTS and has management permissions,
but the register bit offset is undetermined.
Another GPIO group as a subordinate group. Some pins mux use share
register and bit offset from bit0 . But this group do not have
register management permissions.

In SoC S7 and S7D, GPIOX(16~19) mux share with GPIOCC mux register.

In SoC S6, GPIOX(16~19) mux share with GPIOCC mux register, and GPIOD(6)
mux share with GPIOF mux register.

Add S7/S7D/S6 pinctrl compatible string and device node.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Xianwei Zhao (8):
      dt-bindings: pinctl: amlogic,pinctrl-a4: Add compatible string for S7
      dt-bindings: pinctl: amlogic,pinctrl-a4: Add compatible string for S7D
      dt-bindings: pinctl: amlogic,pinctrl-a4: Add compatible string for S6
      pinctrl: meson: a4: remove special data processing
      pinctrl: meson: support amlogic S6/S7/S7D SoC
      dts: arm64: amlogic: add S7 pinctrl node
      dts: arm64: amlogic: add S7D pinctrl node
      dts: arm64: amlogic: add S6 pinctrl node

 .../bindings/pinctrl/amlogic,pinctrl-a4.yaml       |   9 +-
 arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi        |  97 ++++++++++++++++++
 arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi        |  81 +++++++++++++++
 arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi       |  90 +++++++++++++++++
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c         | 111 ++++++++++++++++-----
 5 files changed, 363 insertions(+), 25 deletions(-)
---
base-commit: aa94665adc28f3fdc3de2979ac1e98bae961d6ca
change-id: 20250514-s6-s7-pinctrl-af1ebda88a4e

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



