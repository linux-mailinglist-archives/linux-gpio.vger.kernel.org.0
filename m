Return-Path: <linux-gpio+bounces-14434-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1677E9FFE60
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jan 2025 19:33:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 884837A02A7
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jan 2025 18:33:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D69301B85FA;
	Thu,  2 Jan 2025 18:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WHj33gmC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1AC1B6D18;
	Thu,  2 Jan 2025 18:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735842743; cv=none; b=ix3SWmcGQmdGHk+sxclRKeSMMwvWjpRSg2vlkwR7YQMiNm3jOPtTshIj3uTlBKwF/2kf4W3y37Iduj4JYJRF4BswG6UvEmQZT9ZJcvVdnFIxcp5RyQ9p56x0cvFuMdwBjDNrZ49DTwv+vICf28/SMBLrIr8ldNFSCOtWG0vHoY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735842743; c=relaxed/simple;
	bh=CtMO4XDv+FCIXowgX0+Oc7/qErBmyMlcIzYO5eJynzc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VqDOdQGjZyJF3MYuV0WW7RuM9itAmmtJPu60dYN3hjMDYX0bgyNR0K1CgBK9zngHWupqUOU15S8lZo8ikWZPeEHf0e3rwGqycbFxV4729JKtpsjIz/3Agqw1HkFXmCOCoL4cWXCjIu0nj46IklOBC5vkMnX6zHY+a0WDqcHS10E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WHj33gmC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C0F0FC4CEDF;
	Thu,  2 Jan 2025 18:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735842742;
	bh=CtMO4XDv+FCIXowgX0+Oc7/qErBmyMlcIzYO5eJynzc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=WHj33gmC+AtDrAMJ7ROFrVMnsV8dcBYosyrcRl+u8eXsp8LYctHBcRCbekA6il3AA
	 Zmz4p7xj/1MWRIakbKLSXkgJB8gWdAsBAtV2YUFjKDrr3iYTcRhDWzWdngOuicduTE
	 +a94DBdMosQ1VlOfjXyyFPP9qUVDtHuiHkQwWjuL14BW7EyiHjMfP3H1CzpuKwGKhK
	 aym9kZzBFNdzVipbMZ5mQVpiWsJwdXPz61pWLSZWSLQVMwtX/Y9EZwijXpGHt/XaG+
	 QZOoFiEDqsiHW5pLeAIMQ1uNPwQOdLaGkxU5PPwf+j960/gJiImKIrpzbLJu72kR45
	 CP7wBBj9snYVw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7E51E77198;
	Thu,  2 Jan 2025 18:32:22 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Thu, 02 Jan 2025 19:31:59 +0100
Subject: [PATCH 18/19] powerpc: mpc83xx_defconfig: Enable NWAPP2 board
 features
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250102-mpc83xx-v1-18-86f78ba2a7af@posteo.net>
References: <20250102-mpc83xx-v1-0-86f78ba2a7af@posteo.net>
In-Reply-To: <20250102-mpc83xx-v1-0-86f78ba2a7af@posteo.net>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Frank Li <Frank.Li@nxp.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735842735; l=2040;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=8cjjERboXjwasKowHGhF3NwI7IcXjBOlMpP4+b1yNfY=;
 b=pENUUbNIQp734t9sjGGUCevEG+k3KlEAjIRAbzlvB7faecKhTzZv1xTfwPphoY/E0Xtaqb7jX
 SI7pMQIuWWGCaweTUM4hr3VB+RhS5KSrkYoFXwVlQxu0zFovaY2QLde
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Reply-To: j.ne@posteo.net

From: "J. Neuschäfer" <j.ne@posteo.net>

These features are required (or at least helpful) for running Linux on
the LANCOM NWAPP2 board:

- GPIO restart/watchdog are required for operation
- The MPC83xx-internal watchdog is optional
- LEDs are nice to have
- ATH9K is on a removable mini-PCIe card
- ATH803X is the Ethernet PHY installed on the board

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
 arch/powerpc/configs/mpc83xx_defconfig | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/powerpc/configs/mpc83xx_defconfig b/arch/powerpc/configs/mpc83xx_defconfig
index 525a4f6ae1ff7b51e365668b430fa46ce4938f19..40dc455517defd42c7dd8a5414531eced79831f2 100644
--- a/arch/powerpc/configs/mpc83xx_defconfig
+++ b/arch/powerpc/configs/mpc83xx_defconfig
@@ -30,6 +30,9 @@ CONFIG_SYN_COOKIES=y
 CONFIG_INET_ESP=y
 # CONFIG_IPV6 is not set
 CONFIG_PCI=y
+CONFIG_PCIEPORTBUS=y
+CONFIG_PCIEAER=y
+CONFIG_PCI_MSI=y
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 # CONFIG_FW_LOADER is not set
@@ -54,6 +57,7 @@ CONFIG_GIANFAR=y
 CONFIG_DAVICOM_PHY=y
 CONFIG_ICPLUS_PHY=y
 CONFIG_MARVELL_PHY=y
+CONFIG_AT803X_PHY=y
 CONFIG_VITESSE_PHY=y
 # CONFIG_INPUT_KEYBOARD is not set
 # CONFIG_INPUT_MOUSE is not set
@@ -64,7 +68,17 @@ CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_I2C=y
 CONFIG_I2C_CHARDEV=y
 CONFIG_I2C_MPC=y
+CONFIG_SPI=y
+CONFIG_SPI_FSL_SPI=y
+CONFIG_GPIO_MPC8XXX=y
+CONFIG_GPIO_74X164=y
+CONFIG_POWER_RESET=y
+CONFIG_POWER_RESET_GPIO_RESTART=y
 CONFIG_WATCHDOG=y
+CONFIG_GPIO_WATCHDOG=y
+CONFIG_GPIO_WATCHDOG_ARCH_INITCALL=y
+CONFIG_8xxx_WDT=y
+CONFIG_REGULATOR=y
 CONFIG_HID_A4TECH=y
 CONFIG_HID_BELKIN=y
 CONFIG_HID_CHERRY=y
@@ -82,6 +96,13 @@ CONFIG_USB=y
 CONFIG_USB_MON=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_EHCI_FSL=y
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
+CONFIG_LEDS_CLASS_MULTICOLOR=y
+CONFIG_LEDS_GPIO=y
+CONFIG_LEDS_GROUP_MULTICOLOR=y
+CONFIG_LEDS_TRIGGERS=y
+CONFIG_LEDS_TRIGGER_HEARTBEAT=y
 CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_DS1307=y
 CONFIG_RTC_DRV_DS1374=y

-- 
2.45.2



