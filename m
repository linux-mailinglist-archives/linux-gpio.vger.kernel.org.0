Return-Path: <linux-gpio+bounces-20574-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F02AAC478C
	for <lists+linux-gpio@lfdr.de>; Tue, 27 May 2025 07:23:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A1A2A16F948
	for <lists+linux-gpio@lfdr.de>; Tue, 27 May 2025 05:23:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50CDA1DF980;
	Tue, 27 May 2025 05:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q/Ij7YmJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70431D6DDD;
	Tue, 27 May 2025 05:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748323411; cv=none; b=H1XU9sdqFHxJzicYe0vEcgE76BzumyxMPp4Iutjru25+1vYSzb5B2ExndS6NpxK6xRSLodDICf+iZX0gnlkMmIDbf62OKYExZL0k6FBUjbwdb7VhXKKmiDzDaQtYaoocOBkRLCxJ5AL9keqKe8OaOoPyOy62rf0E+AyoGDjU1Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748323411; c=relaxed/simple;
	bh=1GCpqYieVMUjZiRR1spl6SkovVlonsGalWojCmfHnU8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=iipBk9IzHtfcHalx9qjORF2kEs3CFUe7cAaHq/EJ60rZS73Spo47CSM7GayRVdm/P703+h2dFMvjFI884sDK2A/1c+LH8oXlw0uxrDZ4EZZT6VBnzRtCxOQYFsT+3Zy4s9OF1gGW2ChY8B/F7gUJ9YBRagfiy4Sm/q9BnKoeCUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q/Ij7YmJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5B659C4CEEA;
	Tue, 27 May 2025 05:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748323410;
	bh=1GCpqYieVMUjZiRR1spl6SkovVlonsGalWojCmfHnU8=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=q/Ij7YmJmUW1NjByELEaA0Mhr7SA8x58hy9khjNtNUva/VJuZBWHe/2SERMvkF4z2
	 YidQ55mxZQ4bu8wTMwr2K8cIGLadB8uo+xDssW+ec+J7RUAmOhPTEm3x8i59lqeWSk
	 GSEhFIcWiicRs72HKuG2/y5Y8/fQ9q+fK7oWhOV5r3Hx4/asWj66aO2VYVVr3MfpDH
	 VrOwv84+pn1pdVBGZ6IxblTyQPyD55IPXOtBxHPktNJhmfpJ8JJ3565l818KnE89K0
	 a07BRjcFudPuR70UryE/bUXXcp9DF5xjhaZ/KA4RnwGVC/n4gdbZA6v7fGXYfJsmBa
	 dYpGHfW8hyCmw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45F58C54ED1;
	Tue, 27 May 2025 05:23:30 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v3 0/6] Add support for Amlogic S7/S7D/S6 pinctrl
Date: Tue, 27 May 2025 13:23:27 +0800
Message-Id: <20250527-s6-s7-pinctrl-v3-0-44f6a0451519@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE9MNWgC/3WMyw6CMBQFf4V0bU1fQGXlfxgXtb3ATYCSljQaw
 r9bWKmJyzk5MyuJEBAiaYqVBEgY0U8Z5KkgtjdTBxRdZiKYKFnJFY0VjTWdcbJLGKhpOTyc0do
 oINmZA7T4PHq3e+Ye4+LD68gnvq//SolTRuXFyUpb4/LlasbBd2jP1o9kbyXx4Qv+64vsMwsly
 FpoxdS3v23bGxChhL/sAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748323408; l=2141;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=1GCpqYieVMUjZiRR1spl6SkovVlonsGalWojCmfHnU8=;
 b=wtHOhFlqk718sG5FN2taveblE9/ol8PL4CgX+7110oCYLvkhagcOQvvyZlh/2hYLAbg5nfqF6
 kzUF/U7ytpjB39z+NSCAiwFHG+f+LreRrPkI6u1+I4Ox2xUJfSwIYWp
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
Changes in v3:
- Squash three submissons of bindings into one.
- Link to v2: https://lore.kernel.org/r/20250521-s6-s7-pinctrl-v2-0-0ce5e3728404@amlogic.com

Changes in v2:
- Add a unit address for pinctrl node.
- Use pointer instead of flexible array to solve the problem tested by kernel test robot.
- Link to v1: https://lore.kernel.org/r/20250514-s6-s7-pinctrl-v1-0-39d368cad250@amlogic.com

---
Xianwei Zhao (6):
      dt-bindings: pinctl: amlogic,pinctrl-a4: Add compatible string for S7/S7D/S6
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
base-commit: 176e917e010cb7dcc605f11d2bc33f304292482b
change-id: 20250514-s6-s7-pinctrl-af1ebda88a4e

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



