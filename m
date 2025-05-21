Return-Path: <linux-gpio+bounces-20381-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A2BABEA4D
	for <lists+linux-gpio@lfdr.de>; Wed, 21 May 2025 05:20:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 610F08A11E0
	for <lists+linux-gpio@lfdr.de>; Wed, 21 May 2025 03:19:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A0B322DF91;
	Wed, 21 May 2025 03:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ahkxs39R"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BCBC1D89E3;
	Wed, 21 May 2025 03:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747797598; cv=none; b=MOFTVMPnSaDmCC6ppYYz8pUt0BwEwmhC9eYGA2Q54XPFlNRnMsoMnhsRcFIp0O+SFDheZc/2GrCzWOpPmoZ3z1yH9G15ftOXuCSt1AUdoPZcFA8kK/TJoCOvU8evVNIiZZm4e6VeFYejuCtRfoQnajoFvDCn0P4znz54EmObcAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747797598; c=relaxed/simple;
	bh=FilmMjWVjeFbgPQ1/VIsUxcruvgzblwEpDc5cmgZlVY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Xb8kw8zTmXpHGCMNtD4ay7n1lBMMBs+vWWF14x8+QKZMtG7+c0KrCd9MZp4CNuzZH86+nlMLAvSCbnZ3OH67eSVilrm8SWoehwL0udkgNYbYK6NJmzJWgwDqs0CdNsFQMeoGHtOMk7XyJqemhgM3O2Mec+HpcPtIIfHtkbw8q4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ahkxs39R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B6314C4CEE4;
	Wed, 21 May 2025 03:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747797597;
	bh=FilmMjWVjeFbgPQ1/VIsUxcruvgzblwEpDc5cmgZlVY=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=ahkxs39Rg4dUQir30EiFH3sSbqIY0xZQAMd+KG8QGFeDfT2dHCrf7sHtXEnJ3BKw/
	 DyPcYaTfcGiiCxy0eFo0pDuJ7dZp3XN2xbnThyN88K+gqVOrFjgSGXxVcDALL9eJFc
	 wG/wDMBJG4imZ7lVZx4tP7xEbUQL9otvEm8AQyQBM2amfl7OaqPOxeP4elrVSDCDR1
	 jJrLtNRjnOEAvMyrRyQqGpGljKIYf7IuDzk6wp1e/13kQG04M4dJKzmQ+guiM8DB7C
	 jQKSYSrIzqCt+ZupDHpRdfnbzyCCJsiqbjZHcoxNTdPr//PjQSDVlupuuYl+zSuDms
	 /IPm15z3CpuMA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB7ECC2D0CD;
	Wed, 21 May 2025 03:19:57 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v2 0/8] Add support for Amlogic S7/S7D/S6 pinctrl
Date: Wed, 21 May 2025 11:19:54 +0800
Message-Id: <20250521-s6-s7-pinctrl-v2-0-0ce5e3728404@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFtGLWgC/3WMyw6CMBBFf4XM2jG0PERW/odhUdsBJoGWtKTRk
 P67lb3Lc3PPOSCQZwrQFwd4ihzY2QzyUoCelZ0I2WQGWcqmbESNocVww42t3v2CahT0MqrrVE2
 Qnc3TyO+z9xwyzxx25z9nPorf+q8UBZZY3U3VdlqZfHmodXET66t2KwwppS+CZbg7rAAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747797595; l=2128;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=FilmMjWVjeFbgPQ1/VIsUxcruvgzblwEpDc5cmgZlVY=;
 b=U1eTjmPOftcb7iYltC3UH46ARev+gM0/KW5ZTeoQ/qiPrvdj/r6c6PBMe9+aR35Bzk4OhXzRq
 JEx4RuXCa7cAoIPVyO0iXifLoJGKdUy2fFud6Pfi8GnF6FyuVYtWSRE
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
Changes in v2:
- Add a unit address for pinctrl node.
- Use pointer instead of flexible array to solve the problem tested by kernel test robot.
- Link to v1: https://lore.kernel.org/r/20250514-s6-s7-pinctrl-v1-0-39d368cad250@amlogic.com

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
 arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi        |  97 +++++++++++++++++
 arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi        |  81 ++++++++++++++
 arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi       |  90 ++++++++++++++++
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c         | 118 ++++++++++++++++-----
 5 files changed, 370 insertions(+), 25 deletions(-)
---
base-commit: aa94665adc28f3fdc3de2979ac1e98bae961d6ca
change-id: 20250514-s6-s7-pinctrl-af1ebda88a4e

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



