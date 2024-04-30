Return-Path: <linux-gpio+bounces-5940-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DE88B74E1
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Apr 2024 13:51:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 68359282C1F
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Apr 2024 11:51:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8FDB13C9C3;
	Tue, 30 Apr 2024 11:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n59KTACW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99073134403
	for <linux-gpio@vger.kernel.org>; Tue, 30 Apr 2024 11:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714477893; cv=none; b=IhqxDhRVGaHh0k+SKtn1w2iNfOVpyk/flCYtfZ4VcYdD+HuWFlbeBRzpk+zRkLihwbABoDjdbfp/ulUzD6EaMINV+P3e9rm4RkSTOfTKJQbu251T3gA0R+S0EyotbLhurgtGFDZKKubTMgoWdvqOW45Vox5rPDjT9Q5QuOVGLRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714477893; c=relaxed/simple;
	bh=okYqWHwT/RMyMzshy4w4Tt04J3B9hz6GON0wa+FdGZg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UZTaYI4eDzJzUz12ehuBmcW3Vuk8INts/uLlkZ8/Pznh0ldb7tEtjlwQN/omJ37QRnH0x7GCvAgGCB7L5tp9nwGRzo8lzqV7Sz/GoRk1hBryyLvqCp+VeUPxYDtehf0wU/2UEGVgIdFwf26XrjI9AYCzqk0XBL5V8hhAmPbnnRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n59KTACW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4A7EC4AF1C;
	Tue, 30 Apr 2024 11:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714477891;
	bh=okYqWHwT/RMyMzshy4w4Tt04J3B9hz6GON0wa+FdGZg=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=n59KTACWE3I1a84iKoUomAdu3bvply7UERdINovM5emBPYTLKnKYyZZkbo6EFbDxg
	 Ksel4WrJcp4fJvefXSxjaImw/CkDWW+ElepJEgttnZWcBqXp5w+XpfkHewkoI4/WlR
	 FpVbuHfyLcIFGMTHiHLbkpsbEo2PXD0ceBU7n+A496eQzAXvi+vHFJHcVy4CcEjUTb
	 9CtdCyS10fa+8nEG3TGTNL2euu9nfp1/OXOU0pkBKb4i4I9I6hrik3pwo5cSqijbjM
	 HVFTEp+k3csRUvTuBPY42MHyyKjMRxOKgx4J8UcdTnXqQNOVO8W/djMr5FQRdn+hGk
	 l+AWDjLPQsrYA==
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
To: Gregory CLEMENT <gregory.clement@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org,
	arm@kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-gpio@vger.kernel.org
Cc: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH v8 3/9] platform: cznic: turris-omnia-mcu: Add support for MCU connected GPIOs
Date: Tue, 30 Apr 2024 13:51:05 +0200
Message-ID: <20240430115111.3453-4-kabel@kernel.org>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240430115111.3453-1-kabel@kernel.org>
References: <20240430115111.3453-1-kabel@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add support for GPIOs connected to the MCU on the Turris Omnia board.

This includes:
- front button pin
- enable pins for USB regulators
- MiniPCIe / mSATA card presence pins in MiniPCIe port 0
- LED output pins from WAN ethernet PHY, LAN switch and MiniPCIe ports
- on board revisions 32+ also various peripheral resets and another
  voltage regulator enable pin

Signed-off-by: Marek Behún <kabel@kernel.org>
---
 .../sysfs-bus-i2c-devices-turris-omnia-mcu    |   16 +
 drivers/platform/cznic/Kconfig                |   15 +
 drivers/platform/cznic/Makefile               |    1 +
 .../platform/cznic/turris-omnia-mcu-base.c    |   33 +-
 .../platform/cznic/turris-omnia-mcu-gpio.c    | 1048 +++++++++++++++++
 drivers/platform/cznic/turris-omnia-mcu.h     |   69 +-
 6 files changed, 1166 insertions(+), 16 deletions(-)
 create mode 100644 drivers/platform/cznic/turris-omnia-mcu-gpio.c

diff --git a/Documentation/ABI/testing/sysfs-bus-i2c-devices-turris-omnia-mcu b/Documentation/ABI/testing/sysfs-bus-i2c-devices-turris-omnia-mcu
index ff5e7cb00206..b27b60d00c87 100644
--- a/Documentation/ABI/testing/sysfs-bus-i2c-devices-turris-omnia-mcu
+++ b/Documentation/ABI/testing/sysfs-bus-i2c-devices-turris-omnia-mcu
@@ -22,6 +22,22 @@ Description:	(RO) Contains device first MAC address. Each Turris Omnia is
 
 		Format: %pM.
 
+What:		/sys/bus/i2c/devices/<mcu_device>/front_button_mode
+Date:		July 2024
+KernelVersion:	6.10
+Contact:	Marek Behún <kabel@kernel.org>
+Description:	(RW) The front button on the Turris Omnia router can be
+		configured either to change the intensity of all the LEDs on the
+		front panel, or to send the press event to the CPU as an
+		interrupt.
+
+		This file switches between these two modes:
+		- "mcu" makes the button press event be handled by the MCU to
+		  change the LEDs panel intensity.
+		- "cpu" makes the button press event be handled by the CPU.
+
+		Format: %s.
+
 What:		/sys/bus/i2c/devices/<mcu_device>/fw_features
 Date:		July 2024
 KernelVersion:	6.10
diff --git a/drivers/platform/cznic/Kconfig b/drivers/platform/cznic/Kconfig
index f8560ff9c1af..3a8c3edcd7e6 100644
--- a/drivers/platform/cznic/Kconfig
+++ b/drivers/platform/cznic/Kconfig
@@ -17,9 +17,24 @@ config TURRIS_OMNIA_MCU
 	tristate "Turris Omnia MCU driver"
 	depends on MACH_ARMADA_38X || COMPILE_TEST
 	depends on I2C
+	select GPIOLIB
+	select GPIOLIB_IRQCHIP
 	help
 	  Say Y here to add support for the features implemented by the
 	  microcontroller on the CZ.NIC's Turris Omnia SOHO router.
+	  The features include:
+	  - GPIO pins
+	    - to get front button press events (the front button can be
+	      configured either to generate press events to the CPU or to change
+	      front LEDs panel brightness)
+	    - to enable / disable USB port voltage regulators and to detect
+	      USB overcurrent
+	    - to detect MiniPCIe / mSATA card presence in MiniPCIe port 0
+	    - to configure resets of various peripherals on board revisions 32+
+	    - to enable / disable the VHV voltage regulator to the SOC in order
+	      to be able to program SOC's OTP on board revisions 32+
+	    - to get input from the LED output pins of the WAN ethernet PHY, LAN
+	      switch and MiniPCIe ports
 	  To compile this driver as a module, choose M here; the module will be
 	  called turris-omnia-mcu.
 
diff --git a/drivers/platform/cznic/Makefile b/drivers/platform/cznic/Makefile
index 31adca73bb94..53fd8f1777a3 100644
--- a/drivers/platform/cznic/Makefile
+++ b/drivers/platform/cznic/Makefile
@@ -2,3 +2,4 @@
 
 obj-$(CONFIG_TURRIS_OMNIA_MCU)	+= turris-omnia-mcu.o
 turris-omnia-mcu-y		:= turris-omnia-mcu-base.o
+turris-omnia-mcu-y		+= turris-omnia-mcu-gpio.o
diff --git a/drivers/platform/cznic/turris-omnia-mcu-base.c b/drivers/platform/cznic/turris-omnia-mcu-base.c
index 8893c990853a..708b084cb5da 100644
--- a/drivers/platform/cznic/turris-omnia-mcu-base.c
+++ b/drivers/platform/cznic/turris-omnia-mcu-base.c
@@ -22,25 +22,31 @@
 #define OMNIA_FW_VERSION_HEX_LEN	(2 * OMNIA_FW_VERSION_LEN + 1)
 #define OMNIA_BOARD_INFO_LEN		16
 
-int omnia_cmd_read(const struct i2c_client *client, u8 cmd, void *reply,
-		   unsigned int len)
+int omnia_cmd_write_read(const struct i2c_client *client,
+			 void *cmd, unsigned int cmd_len,
+			 void *reply, unsigned int reply_len)
 {
 	struct i2c_msg msgs[2];
-	int ret;
+	int ret, num;
 
 	msgs[0].addr = client->addr;
 	msgs[0].flags = 0;
-	msgs[0].len = 1;
-	msgs[0].buf = &cmd;
-	msgs[1].addr = client->addr;
-	msgs[1].flags = I2C_M_RD;
-	msgs[1].len = len;
-	msgs[1].buf = reply;
-
-	ret = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
+	msgs[0].len = cmd_len;
+	msgs[0].buf = cmd;
+	num = 1;
+
+	if (reply_len) {
+		msgs[1].addr = client->addr;
+		msgs[1].flags = I2C_M_RD;
+		msgs[1].len = reply_len;
+		msgs[1].buf = reply;
+		num++;
+	}
+
+	ret = i2c_transfer(client->adapter, msgs, num);
 	if (ret < 0)
 		return ret;
-	if (ret != ARRAY_SIZE(msgs))
+	if (ret != num)
 		return -EIO;
 
 	return 0;
@@ -188,6 +194,7 @@ static const struct attribute_group omnia_mcu_base_group = {
 
 static const struct attribute_group *omnia_mcu_groups[] = {
 	&omnia_mcu_base_group,
+	&omnia_mcu_gpio_group,
 	NULL
 };
 
@@ -353,7 +360,7 @@ static int omnia_mcu_probe(struct i2c_client *client)
 					     "Cannot read board info\n");
 	}
 
-	return 0;
+	return omnia_mcu_register_gpiochip(mcu);
 }
 
 static const struct of_device_id of_omnia_mcu_match[] = {
diff --git a/drivers/platform/cznic/turris-omnia-mcu-gpio.c b/drivers/platform/cznic/turris-omnia-mcu-gpio.c
new file mode 100644
index 000000000000..bcc12bd1453c
--- /dev/null
+++ b/drivers/platform/cznic/turris-omnia-mcu-gpio.c
@@ -0,0 +1,1048 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * CZ.NIC's Turris Omnia MCU GPIO and IRQ driver
+ *
+ * 2024 by Marek Behún <kabel@kernel.org>
+ */
+
+#include <linux/array_size.h>
+#include <linux/bitfield.h>
+#include <linux/bitops.h>
+#include <linux/bug.h>
+#include <linux/cleanup.h>
+#include <linux/device.h>
+#include <linux/devm-helpers.h>
+#include <linux/gpio/driver.h>
+#include <linux/i2c.h>
+#include <linux/interrupt.h>
+#include <linux/mutex.h>
+#include <linux/sysfs.h>
+#include <linux/turris-omnia-mcu-interface.h>
+#include <linux/types.h>
+#include <linux/workqueue.h>
+#include <asm/unaligned.h>
+
+#include "turris-omnia-mcu.h"
+
+#define CMD_INT_ARG_LEN			8
+#define FRONT_BUTTON_RELEASE_DELAY	50 /* ms */
+
+static const char * const omnia_mcu_gpio_templates[64] = {
+	/* GPIOs with value read from the 16-bit wide status */
+	[4]  = "gpio%u.MiniPCIe0 Card Detect",
+	[5]  = "gpio%u.MiniPCIe0 mSATA Indicator",
+	[6]  = "gpio%u.Front USB3 port over-current",
+	[7]  = "gpio%u.Rear USB3 port over-current",
+	[8]  = "gpio%u.Front USB3 port power",
+	[9]  = "gpio%u.Rear USB3 port power",
+	[12] = "gpio%u.Front Button",
+
+	/* GPIOs with value read from the 32-bit wide extended status */
+	[16] = "gpio%u.SFP nDET",
+	[28] = "gpio%u.MiniPCIe0 LED",
+	[29] = "gpio%u.MiniPCIe1 LED",
+	[30] = "gpio%u.MiniPCIe2 LED",
+	[31] = "gpio%u.MiniPCIe0 PAN LED",
+	[32] = "gpio%u.MiniPCIe1 PAN LED",
+	[33] = "gpio%u.MiniPCIe2 PAN LED",
+	[34] = "gpio%u.WAN PHY LED0",
+	[35] = "gpio%u.WAN PHY LED1",
+	[36] = "gpio%u.LAN switch p0 LED0",
+	[37] = "gpio%u.LAN switch p0 LED1",
+	[38] = "gpio%u.LAN switch p1 LED0",
+	[39] = "gpio%u.LAN switch p1 LED1",
+	[40] = "gpio%u.LAN switch p2 LED0",
+	[41] = "gpio%u.LAN switch p2 LED1",
+	[42] = "gpio%u.LAN switch p3 LED0",
+	[43] = "gpio%u.LAN switch p3 LED1",
+	[44] = "gpio%u.LAN switch p4 LED0",
+	[45] = "gpio%u.LAN switch p4 LED1",
+	[46] = "gpio%u.LAN switch p5 LED0",
+	[47] = "gpio%u.LAN switch p5 LED1",
+
+	/* GPIOs with value read from the 16-bit wide extended control status */
+	[48] = "gpio%u.eMMC nRESET",
+	[49] = "gpio%u.LAN switch nRESET",
+	[50] = "gpio%u.WAN PHY nRESET",
+	[51] = "gpio%u.MiniPCIe0 nPERST",
+	[52] = "gpio%u.MiniPCIe1 nPERST",
+	[53] = "gpio%u.MiniPCIe2 nPERST",
+	[54] = "gpio%u.WAN PHY SFP mux",
+};
+
+#define _DEF_GPIO(_cmd, _ctl_cmd, _bit, _ctl_bit, _int_bit, _feat, _feat_mask) \
+	{								\
+		.cmd = _cmd,						\
+		.ctl_cmd = _ctl_cmd,					\
+		.bit = _bit,						\
+		.ctl_bit = _ctl_bit,					\
+		.int_bit = _int_bit,					\
+		.feat = _feat,						\
+		.feat_mask = _feat_mask,				\
+	}
+#define _DEF_GPIO_STS(_name) \
+	_DEF_GPIO(CMD_GET_STATUS_WORD, 0, STS_ ## _name, 0, INT_ ## _name, 0, 0)
+#define _DEF_GPIO_CTL(_name) \
+	_DEF_GPIO(CMD_GET_STATUS_WORD, CMD_GENERAL_CONTROL, STS_ ## _name, \
+		  CTL_ ## _name, 0, 0, 0)
+#define _DEF_GPIO_EXT_STS(_name, _feat) \
+	_DEF_GPIO(CMD_GET_EXT_STATUS_DWORD, 0, EXT_STS_ ## _name, 0, \
+		  INT_ ## _name, FEAT_ ## _feat | FEAT_EXT_CMDS, \
+		  FEAT_ ## _feat | FEAT_EXT_CMDS)
+#define _DEF_GPIO_EXT_STS_LED(_name, _ledext) \
+	_DEF_GPIO(CMD_GET_EXT_STATUS_DWORD, 0, EXT_STS_ ## _name, 0, \
+		  INT_ ## _name, FEAT_LED_STATE_ ## _ledext, \
+		  FEAT_LED_STATE_EXT_MASK)
+#define _DEF_GPIO_EXT_STS_LEDALL(_name) \
+	_DEF_GPIO(CMD_GET_EXT_STATUS_DWORD, 0, EXT_STS_ ## _name, 0, \
+		  INT_ ## _name, FEAT_LED_STATE_EXT_MASK, 0)
+#define _DEF_GPIO_EXT_CTL(_name, _feat) \
+	_DEF_GPIO(CMD_GET_EXT_CONTROL_STATUS, CMD_EXT_CONTROL, \
+		  EXT_CTL_ ## _name, EXT_CTL_ ## _name, 0, \
+		  FEAT_ ## _feat | FEAT_EXT_CMDS, \
+		  FEAT_ ## _feat | FEAT_EXT_CMDS)
+#define _DEF_INT(_name) \
+	_DEF_GPIO(0, 0, 0, 0, INT_ ## _name, 0, 0)
+
+static const struct omnia_gpio {
+	u8 cmd, ctl_cmd;
+	u32 bit, ctl_bit;
+	u32 int_bit;
+	u16 feat, feat_mask;
+} omnia_gpios[64] = {
+	/* GPIOs with value read from the 16-bit wide status */
+	[4]  = _DEF_GPIO_STS(CARD_DET),
+	[5]  = _DEF_GPIO_STS(MSATA_IND),
+	[6]  = _DEF_GPIO_STS(USB30_OVC),
+	[7]  = _DEF_GPIO_STS(USB31_OVC),
+	[8]  = _DEF_GPIO_CTL(USB30_PWRON),
+	[9]  = _DEF_GPIO_CTL(USB31_PWRON),
+
+	/* brightness changed interrupt, no GPIO */
+	[11] = _DEF_INT(BRIGHTNESS_CHANGED),
+
+	[12] = _DEF_GPIO_STS(BUTTON_PRESSED),
+
+	/* TRNG interrupt, no GPIO */
+	[13] = _DEF_INT(TRNG),
+
+	/* MESSAGE_SIGNED interrupt, no GPIO */
+	[14] = _DEF_INT(MESSAGE_SIGNED),
+
+	/* GPIOs with value read from the 32-bit wide extended status */
+	[16] = _DEF_GPIO_EXT_STS(SFP_nDET, PERIPH_MCU),
+	[28] = _DEF_GPIO_EXT_STS_LEDALL(WLAN0_MSATA_LED),
+	[29] = _DEF_GPIO_EXT_STS_LEDALL(WLAN1_LED),
+	[30] = _DEF_GPIO_EXT_STS_LEDALL(WLAN2_LED),
+	[31] = _DEF_GPIO_EXT_STS_LED(WPAN0_LED, EXT),
+	[32] = _DEF_GPIO_EXT_STS_LED(WPAN1_LED, EXT),
+	[33] = _DEF_GPIO_EXT_STS_LED(WPAN2_LED, EXT),
+	[34] = _DEF_GPIO_EXT_STS_LEDALL(WAN_LED0),
+	[35] = _DEF_GPIO_EXT_STS_LED(WAN_LED1, EXT_V32),
+	[36] = _DEF_GPIO_EXT_STS_LEDALL(LAN0_LED0),
+	[37] = _DEF_GPIO_EXT_STS_LEDALL(LAN0_LED1),
+	[38] = _DEF_GPIO_EXT_STS_LEDALL(LAN1_LED0),
+	[39] = _DEF_GPIO_EXT_STS_LEDALL(LAN1_LED1),
+	[40] = _DEF_GPIO_EXT_STS_LEDALL(LAN2_LED0),
+	[41] = _DEF_GPIO_EXT_STS_LEDALL(LAN2_LED1),
+	[42] = _DEF_GPIO_EXT_STS_LEDALL(LAN3_LED0),
+	[43] = _DEF_GPIO_EXT_STS_LEDALL(LAN3_LED1),
+	[44] = _DEF_GPIO_EXT_STS_LEDALL(LAN4_LED0),
+	[45] = _DEF_GPIO_EXT_STS_LEDALL(LAN4_LED1),
+	[46] = _DEF_GPIO_EXT_STS_LEDALL(LAN5_LED0),
+	[47] = _DEF_GPIO_EXT_STS_LEDALL(LAN5_LED1),
+
+	/* GPIOs with value read from the 16-bit wide extended control status */
+	[48] = _DEF_GPIO_EXT_CTL(nRES_MMC, PERIPH_MCU),
+	[49] = _DEF_GPIO_EXT_CTL(nRES_LAN, PERIPH_MCU),
+	[50] = _DEF_GPIO_EXT_CTL(nRES_PHY, PERIPH_MCU),
+	[51] = _DEF_GPIO_EXT_CTL(nPERST0, PERIPH_MCU),
+	[52] = _DEF_GPIO_EXT_CTL(nPERST1, PERIPH_MCU),
+	[53] = _DEF_GPIO_EXT_CTL(nPERST2, PERIPH_MCU),
+	[54] = _DEF_GPIO_EXT_CTL(PHY_SFP, PERIPH_MCU),
+};
+
+/* mapping from interrupts to indexes of GPIOs in the omnia_gpios array */
+static const u8 omnia_int_to_gpio_idx[32] = {
+	[__bf_shf(INT_CARD_DET)]		= 4,
+	[__bf_shf(INT_MSATA_IND)]		= 5,
+	[__bf_shf(INT_USB30_OVC)]		= 6,
+	[__bf_shf(INT_USB31_OVC)]		= 7,
+	[__bf_shf(INT_BUTTON_PRESSED)]		= 12,
+	[__bf_shf(INT_TRNG)]			= 13,
+	[__bf_shf(INT_MESSAGE_SIGNED)]		= 14,
+	[__bf_shf(INT_SFP_nDET)]		= 16,
+	[__bf_shf(INT_BRIGHTNESS_CHANGED)]	= 11,
+	[__bf_shf(INT_WLAN0_MSATA_LED)]		= 28,
+	[__bf_shf(INT_WLAN1_LED)]		= 29,
+	[__bf_shf(INT_WLAN2_LED)]		= 30,
+	[__bf_shf(INT_WPAN0_LED)]		= 31,
+	[__bf_shf(INT_WPAN1_LED)]		= 32,
+	[__bf_shf(INT_WPAN2_LED)]		= 33,
+	[__bf_shf(INT_WAN_LED0)]		= 34,
+	[__bf_shf(INT_WAN_LED1)]		= 35,
+	[__bf_shf(INT_LAN0_LED0)]		= 36,
+	[__bf_shf(INT_LAN0_LED1)]		= 37,
+	[__bf_shf(INT_LAN1_LED0)]		= 38,
+	[__bf_shf(INT_LAN1_LED1)]		= 39,
+	[__bf_shf(INT_LAN2_LED0)]		= 40,
+	[__bf_shf(INT_LAN2_LED1)]		= 41,
+	[__bf_shf(INT_LAN3_LED0)]		= 42,
+	[__bf_shf(INT_LAN3_LED1)]		= 43,
+	[__bf_shf(INT_LAN4_LED0)]		= 44,
+	[__bf_shf(INT_LAN4_LED1)]		= 45,
+	[__bf_shf(INT_LAN5_LED0)]		= 46,
+	[__bf_shf(INT_LAN5_LED1)]		= 47,
+};
+
+/* index of PHY_SFP GPIO in the omnia_gpios array */
+#define OMNIA_GPIO_PHY_SFP_OFFSET	54
+
+static int omnia_ctl_cmd_locked(struct omnia_mcu *mcu, u8 cmd, u16 val,
+				u16 mask)
+{
+	size_t len;
+	u8 buf[5];
+
+	buf[0] = cmd;
+
+	switch (cmd) {
+	case CMD_GENERAL_CONTROL:
+		buf[1] = val;
+		buf[2] = mask;
+		len = 3;
+		break;
+
+	case CMD_EXT_CONTROL:
+		put_unaligned_le16(val, &buf[1]);
+		put_unaligned_le16(mask, &buf[3]);
+		len = 5;
+		break;
+
+	default:
+		BUG();
+	}
+
+	return omnia_cmd_write(mcu->client, buf, len);
+}
+
+static int omnia_ctl_cmd(struct omnia_mcu *mcu, u8 cmd, u16 val, u16 mask)
+{
+	guard(mutex)(&mcu->lock);
+
+	return omnia_ctl_cmd_locked(mcu, cmd, val, mask);
+}
+
+static int omnia_gpio_request(struct gpio_chip *gc, unsigned int offset)
+{
+	if (!omnia_gpios[offset].cmd)
+		return -EINVAL;
+
+	return 0;
+}
+
+static int omnia_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
+{
+	struct omnia_mcu *mcu = gpiochip_get_data(gc);
+
+	if (offset == OMNIA_GPIO_PHY_SFP_OFFSET) {
+		int val;
+
+		scoped_guard(mutex, &mcu->lock)
+			val = omnia_cmd_read_bit(mcu->client,
+						 CMD_GET_EXT_CONTROL_STATUS,
+						 EXT_CTL_PHY_SFP_AUTO);
+
+		if (val < 0)
+			return val;
+
+		if (val)
+			return GPIO_LINE_DIRECTION_IN;
+
+		return GPIO_LINE_DIRECTION_OUT;
+	}
+
+	if (omnia_gpios[offset].ctl_cmd)
+		return GPIO_LINE_DIRECTION_OUT;
+
+	return GPIO_LINE_DIRECTION_IN;
+}
+
+static int omnia_gpio_direction_input(struct gpio_chip *gc, unsigned int offset)
+{
+	const struct omnia_gpio *gpio = &omnia_gpios[offset];
+	struct omnia_mcu *mcu = gpiochip_get_data(gc);
+
+	if (offset == OMNIA_GPIO_PHY_SFP_OFFSET)
+		return omnia_ctl_cmd(mcu, CMD_EXT_CONTROL, EXT_CTL_PHY_SFP_AUTO,
+				     EXT_CTL_PHY_SFP_AUTO);
+
+	if (gpio->ctl_cmd)
+		return -ENOTSUPP;
+
+	return 0;
+}
+
+static int omnia_gpio_direction_output(struct gpio_chip *gc,
+				       unsigned int offset, int value)
+{
+	const struct omnia_gpio *gpio = &omnia_gpios[offset];
+	struct omnia_mcu *mcu = gpiochip_get_data(gc);
+	u16 val, mask;
+
+	if (!gpio->ctl_cmd)
+		return -ENOTSUPP;
+
+	mask = gpio->ctl_bit;
+	val = value ? mask : 0;
+
+	if (offset == OMNIA_GPIO_PHY_SFP_OFFSET)
+		mask |= EXT_CTL_PHY_SFP_AUTO;
+
+	return omnia_ctl_cmd(mcu, gpio->ctl_cmd, val, mask);
+}
+
+static int omnia_gpio_get(struct gpio_chip *gc, unsigned int offset)
+{
+	const struct omnia_gpio *gpio = &omnia_gpios[offset];
+	struct omnia_mcu *mcu = gpiochip_get_data(gc);
+
+	/*
+	 * If firmware does not support the new interrupt API, we are informed
+	 * of every change of the status word by an interrupt from MCU and save
+	 * its value in the interrupt service routine. Simply return the saved
+	 * value.
+	 */
+	if (gpio->cmd == CMD_GET_STATUS_WORD &&
+	    !(mcu->features & FEAT_NEW_INT_API))
+		return !!(mcu->last_status & gpio->bit);
+
+	guard(mutex)(&mcu->lock);
+
+	/*
+	 * If firmware does support the new interrupt API, we may have cached
+	 * the value of a GPIO in the interrupt service routine. If not, read
+	 * the relevant bit now.
+	 */
+	if (gpio->int_bit && (mcu->is_cached & gpio->int_bit))
+		return !!(mcu->cached & gpio->int_bit);
+
+	return omnia_cmd_read_bit(mcu->client, gpio->cmd, gpio->bit);
+}
+
+static int omnia_gpio_get_multiple(struct gpio_chip *gc, unsigned long *mask,
+				   unsigned long *bits)
+{
+	struct omnia_mcu *mcu = gpiochip_get_data(gc);
+	u32 sts_bits, ext_sts_bits, ext_ctl_bits;
+	int err, i;
+
+	sts_bits = 0;
+	ext_sts_bits = 0;
+	ext_ctl_bits = 0;
+
+	/* determine which bits to read from the 3 possible commands */
+	for_each_set_bit(i, mask, ARRAY_SIZE(omnia_gpios)) {
+		if (omnia_gpios[i].cmd == CMD_GET_STATUS_WORD)
+			sts_bits |= omnia_gpios[i].bit;
+		else if (omnia_gpios[i].cmd == CMD_GET_EXT_STATUS_DWORD)
+			ext_sts_bits |= omnia_gpios[i].bit;
+		else if (omnia_gpios[i].cmd == CMD_GET_EXT_CONTROL_STATUS)
+			ext_ctl_bits |= omnia_gpios[i].bit;
+	}
+
+	guard(mutex)(&mcu->lock);
+
+	if (mcu->features & FEAT_NEW_INT_API) {
+		/* read relevant bits from status */
+		err = omnia_cmd_read_bits(mcu->client, CMD_GET_STATUS_WORD,
+					  sts_bits, &sts_bits);
+		if (err)
+			return err;
+	} else {
+		/*
+		 * Use status word value cached in the interrupt service routine
+		 * if firmware does not support the new interrupt API.
+		 */
+		sts_bits = mcu->last_status;
+	}
+
+	/* read relevant bits from extended status */
+	err = omnia_cmd_read_bits(mcu->client, CMD_GET_EXT_STATUS_DWORD,
+				  ext_sts_bits, &ext_sts_bits);
+	if (err)
+		return err;
+
+	/* read relevant bits from extended control */
+	err = omnia_cmd_read_bits(mcu->client, CMD_GET_EXT_CONTROL_STATUS,
+				  ext_ctl_bits, &ext_ctl_bits);
+	if (err)
+		return err;
+
+	/* assign relevant bits in result */
+	for_each_set_bit(i, mask, ARRAY_SIZE(omnia_gpios)) {
+		if (omnia_gpios[i].cmd == CMD_GET_STATUS_WORD)
+			__assign_bit(i, bits, sts_bits & omnia_gpios[i].bit);
+		else if (omnia_gpios[i].cmd == CMD_GET_EXT_STATUS_DWORD)
+			__assign_bit(i, bits, ext_sts_bits &
+					      omnia_gpios[i].bit);
+		else if (omnia_gpios[i].cmd == CMD_GET_EXT_CONTROL_STATUS)
+			__assign_bit(i, bits, ext_ctl_bits &
+					      omnia_gpios[i].bit);
+	}
+
+	return 0;
+}
+
+static void omnia_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
+{
+	const struct omnia_gpio *gpio = &omnia_gpios[offset];
+	struct omnia_mcu *mcu = gpiochip_get_data(gc);
+	u16 val, mask;
+
+	if (!gpio->ctl_cmd)
+		return;
+
+	mask = gpio->ctl_bit;
+	val = value ? mask : 0;
+
+	omnia_ctl_cmd(mcu, gpio->ctl_cmd, val, mask);
+}
+
+static void omnia_gpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
+				    unsigned long *bits)
+{
+	struct omnia_mcu *mcu = gpiochip_get_data(gc);
+	u16 ext_ctl, ext_ctl_mask;
+	u8 ctl, ctl_mask;
+	int i;
+
+	ctl = 0;
+	ctl_mask = 0;
+	ext_ctl = 0;
+	ext_ctl_mask = 0;
+
+	for_each_set_bit(i, mask, ARRAY_SIZE(omnia_gpios)) {
+		if (omnia_gpios[i].ctl_cmd == CMD_GENERAL_CONTROL) {
+			ctl_mask |= omnia_gpios[i].ctl_bit;
+			if (test_bit(i, bits))
+				ctl |= omnia_gpios[i].ctl_bit;
+		} else if (omnia_gpios[i].ctl_cmd == CMD_EXT_CONTROL) {
+			ext_ctl_mask |= omnia_gpios[i].ctl_bit;
+			if (test_bit(i, bits))
+				ext_ctl |= omnia_gpios[i].ctl_bit;
+		}
+	}
+
+	guard(mutex)(&mcu->lock);
+
+	if (ctl_mask)
+		omnia_ctl_cmd_locked(mcu, CMD_GENERAL_CONTROL, ctl, ctl_mask);
+
+	if (ext_ctl_mask)
+		omnia_ctl_cmd_locked(mcu, CMD_EXT_CONTROL, ext_ctl,
+				     ext_ctl_mask);
+}
+
+static bool omnia_gpio_available(struct omnia_mcu *mcu,
+				 const struct omnia_gpio *gpio)
+{
+	if (gpio->feat_mask)
+		return (mcu->features & gpio->feat_mask) == gpio->feat;
+
+	if (gpio->feat)
+		return mcu->features & gpio->feat;
+
+	return true;
+}
+
+static int omnia_gpio_init_valid_mask(struct gpio_chip *gc,
+				      unsigned long *valid_mask,
+				      unsigned int ngpios)
+{
+	struct omnia_mcu *mcu = gpiochip_get_data(gc);
+
+	for (unsigned int i = 0; i < ngpios; i++) {
+		const struct omnia_gpio *gpio = &omnia_gpios[i];
+
+		if (gpio->cmd || gpio->int_bit)
+			__assign_bit(i, valid_mask,
+				     omnia_gpio_available(mcu, gpio));
+		else
+			__clear_bit(i, valid_mask);
+	}
+
+	return 0;
+}
+
+static int omnia_gpio_of_xlate(struct gpio_chip *gc,
+			       const struct of_phandle_args *gpiospec,
+			       u32 *flags)
+{
+	u32 bank, gpio;
+
+	if (WARN_ON(gpiospec->args_count != 3))
+		return -EINVAL;
+
+	if (flags)
+		*flags = gpiospec->args[2];
+
+	bank = gpiospec->args[0];
+	gpio = gpiospec->args[1];
+
+	switch (bank) {
+	case 0:
+		return gpio < 16 ? gpio : -EINVAL;
+	case 1:
+		return gpio < 32 ? 16 + gpio : -EINVAL;
+	case 2:
+		return gpio < 16 ? 48 + gpio : -EINVAL;
+	default:
+		return -EINVAL;
+	}
+}
+
+static void omnia_irq_shutdown(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct omnia_mcu *mcu = gpiochip_get_data(gc);
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
+	u32 bit = omnia_gpios[hwirq].int_bit;
+
+	mcu->rising &= ~bit;
+	mcu->falling &= ~bit;
+}
+
+static void omnia_irq_mask(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct omnia_mcu *mcu = gpiochip_get_data(gc);
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
+	u32 bit = omnia_gpios[hwirq].int_bit;
+
+	if (!omnia_gpios[hwirq].cmd)
+		mcu->rising &= ~bit;
+	mcu->mask &= ~bit;
+	gpiochip_disable_irq(gc, hwirq);
+}
+
+static void omnia_irq_unmask(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct omnia_mcu *mcu = gpiochip_get_data(gc);
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
+	u32 bit = omnia_gpios[hwirq].int_bit;
+
+	gpiochip_enable_irq(gc, hwirq);
+	mcu->mask |= bit;
+	if (!omnia_gpios[hwirq].cmd)
+		mcu->rising |= bit;
+}
+
+static int omnia_irq_set_type(struct irq_data *d, unsigned int type)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct omnia_mcu *mcu = gpiochip_get_data(gc);
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
+	struct device *dev = &mcu->client->dev;
+	u32 bit = omnia_gpios[hwirq].int_bit;
+
+	if (!(type & IRQ_TYPE_EDGE_BOTH)) {
+		dev_err(dev, "irq %u: unsupported type %u\n", d->irq, type);
+		return -EINVAL;
+	}
+
+	if (type & IRQ_TYPE_EDGE_RISING)
+		mcu->rising |= bit;
+	else
+		mcu->rising &= ~bit;
+
+	if (type & IRQ_TYPE_EDGE_FALLING)
+		mcu->falling |= bit;
+	else
+		mcu->falling &= ~bit;
+
+	return 0;
+}
+
+static void omnia_irq_bus_lock(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct omnia_mcu *mcu = gpiochip_get_data(gc);
+
+	/* nothing to do if MCU firmware does not support new interrupt API */
+	if (!(mcu->features & FEAT_NEW_INT_API))
+		return;
+
+	mutex_lock(&mcu->lock);
+}
+
+/**
+ * omnia_mask_interleave - Interleaves the bytes from @rising and @falling
+ *	@dst: the destination u8 array of interleaved bytes
+ *	@rising: rising mask
+ *	@falling: falling mask
+ *
+ * Interleaves the little-endian bytes from @rising and @falling words.
+ *
+ * If @rising = (r0, r1, r2, r3) and @falling = (f0, f1, f2, f3), the result is
+ * @dst = (r0, f0, r1, f1, r2, f2, r3, f3).
+ *
+ * The MCU receives interrupt mask and reports pending interrupt bitmap int this
+ * interleaved format. The rationale behind it is that the low-indexed bits are
+ * more important - in many cases, the user will be interested only in
+ * interrupts with indexes 0 to 7, and so the system can stop reading after
+ * first 2 bytes (r0, f0), to save time on the slow I2C bus.
+ *
+ * Feel free to remove this function and its inverse, omnia_mask_deinterleave,
+ * and use an appropriate bitmap_* function once such a function exists.
+ */
+static void omnia_mask_interleave(u8 *dst, u32 rising, u32 falling)
+{
+	for (int i = 0; i < sizeof(u32); ++i) {
+		dst[2 * i] = rising >> (8 * i);
+		dst[2 * i + 1] = falling >> (8 * i);
+	}
+}
+
+/**
+ * omnia_mask_deinterleave - Deinterleaves the bytes into @rising and @falling
+ *	@src: the source u8 array containing the interleaved bytes
+ *	@rising: pointer where to store the rising mask gathered from @src
+ *	@falling: pointer where to store the falling mask gathered from @src
+ *
+ * This is the inverse function to omnia_mask_interleave.
+ */
+static void omnia_mask_deinterleave(const u8 *src, u32 *rising, u32 *falling)
+{
+	*rising = *falling = 0;
+
+	for (int i = 0; i < sizeof(u32); ++i) {
+		*rising |= src[2 * i] << (8 * i);
+		*falling |= src[2 * i + 1] << (8 * i);
+	}
+}
+
+static void omnia_irq_bus_sync_unlock(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct omnia_mcu *mcu = gpiochip_get_data(gc);
+	struct device *dev = &mcu->client->dev;
+	u8 cmd[1 + CMD_INT_ARG_LEN];
+	u32 rising, falling;
+	int err;
+
+	/* nothing to do if MCU firmware does not support new interrupt API */
+	if (!(mcu->features & FEAT_NEW_INT_API))
+		return;
+
+	cmd[0] = CMD_SET_INT_MASK;
+
+	rising = mcu->rising & mcu->mask;
+	falling = mcu->falling & mcu->mask;
+
+	/* interleave the rising and falling bytes into the command arguments */
+	omnia_mask_interleave(&cmd[1], rising, falling);
+
+	dev_dbg(dev, "set int mask %8ph\n", &cmd[1]);
+
+	err = omnia_cmd_write(mcu->client, cmd, sizeof(cmd));
+	if (err) {
+		dev_err(dev, "Cannot set mask: %d\n", err);
+		goto unlock;
+	}
+
+	/*
+	 * Remember which GPIOs have both rising and falling interrupts enabled.
+	 * For those we will cache their value so that .get() method is faster.
+	 * We also need to forget cached values of GPIOs that aren't cached
+	 * anymore.
+	 */
+	mcu->both = rising & falling;
+	mcu->is_cached &= mcu->both;
+
+unlock:
+	mutex_unlock(&mcu->lock);
+}
+
+static const struct irq_chip omnia_mcu_irq_chip = {
+	.name			= "Turris Omnia MCU interrupts",
+	.irq_shutdown		= omnia_irq_shutdown,
+	.irq_mask		= omnia_irq_mask,
+	.irq_unmask		= omnia_irq_unmask,
+	.irq_set_type		= omnia_irq_set_type,
+	.irq_bus_lock		= omnia_irq_bus_lock,
+	.irq_bus_sync_unlock	= omnia_irq_bus_sync_unlock,
+	.flags			= IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
+static void omnia_irq_init_valid_mask(struct gpio_chip *gc,
+				      unsigned long *valid_mask,
+				      unsigned int ngpios)
+{
+	struct omnia_mcu *mcu = gpiochip_get_data(gc);
+
+	for (unsigned int i = 0; i < ngpios; i++) {
+		const struct omnia_gpio *gpio = &omnia_gpios[i];
+
+		if (gpio->int_bit)
+			__assign_bit(i, valid_mask,
+				     omnia_gpio_available(mcu, gpio));
+		else
+			__clear_bit(i, valid_mask);
+	}
+}
+
+static int omnia_irq_init_hw(struct gpio_chip *gc)
+{
+	struct omnia_mcu *mcu = gpiochip_get_data(gc);
+	u8 cmd[1 + CMD_INT_ARG_LEN] = {};
+
+	cmd[0] = CMD_SET_INT_MASK;
+
+	return omnia_cmd_write(mcu->client, cmd, sizeof(cmd));
+}
+
+/*
+ * Determine how many bytes we need to read from the reply to the
+ * CMD_GET_INT_AND_CLEAR command in order to retrieve all unmasked interrupts.
+ */
+static size_t omnia_irq_compute_pending_length(u32 rising, u32 falling)
+{
+	size_t rlen = 0, flen = 0;
+
+	if (rising)
+		rlen = ((__fls(rising) >> 3) << 1) + 1;
+
+	if (falling)
+		flen = ((__fls(falling) >> 3) << 1) + 2;
+
+	return max(rlen, flen);
+}
+
+static bool omnia_irq_read_pending_new(struct omnia_mcu *mcu,
+				       unsigned long *pending)
+{
+	struct device *dev = &mcu->client->dev;
+	u8 reply[CMD_INT_ARG_LEN] = {};
+	u32 rising, falling;
+	size_t len;
+	int err;
+
+	len = omnia_irq_compute_pending_length(mcu->rising & mcu->mask,
+					       mcu->falling & mcu->mask);
+	if (!len)
+		return false;
+
+	guard(mutex)(&mcu->lock);
+
+	err = omnia_cmd_read(mcu->client, CMD_GET_INT_AND_CLEAR, reply,
+			     len);
+	if (err) {
+		dev_err(dev, "Cannot read pending IRQs: %d\n", err);
+		return false;
+	}
+
+	/* deinterleave the reply bytes into rising and falling */
+	omnia_mask_deinterleave(reply, &rising, &falling);
+
+	rising &= mcu->mask;
+	falling &= mcu->mask;
+	*pending = rising | falling;
+
+	/* cache values for GPIOs that have both edges enabled */
+	mcu->is_cached &= ~(rising & falling);
+	mcu->is_cached |= mcu->both & (rising ^ falling);
+	mcu->cached = (mcu->cached | rising) & ~falling;
+
+	return true;
+}
+
+static int omnia_read_status_word_old_fw(struct omnia_mcu *mcu, u16 *status)
+{
+	int ret;
+
+	ret = omnia_cmd_read_u16(mcu->client, CMD_GET_STATUS_WORD);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * Old firmware has a bug wherein it never resets the USB port
+	 * overcurrent bits back to zero. Ignore them.
+	 */
+	*status = ret & ~(STS_USB30_OVC | STS_USB31_OVC);
+
+	return 0;
+}
+
+static void button_release_emul_fn(struct work_struct *work)
+{
+	struct omnia_mcu *mcu = container_of(to_delayed_work(work),
+					     struct omnia_mcu,
+					     button_release_emul_work);
+
+	mcu->button_pressed_emul = false;
+	generic_handle_irq_safe(mcu->client->irq);
+}
+
+static void fill_int_from_sts(u32 *rising, u32 *falling, u16 rising_sts,
+			      u16 falling_sts, u16 sts_bit, u32 int_bit)
+{
+	if (rising_sts & sts_bit)
+		*rising |= int_bit;
+	if (falling_sts & sts_bit)
+		*falling |= int_bit;
+}
+
+static bool omnia_irq_read_pending_old(struct omnia_mcu *mcu,
+				       unsigned long *pending)
+{
+	struct device *dev = &mcu->client->dev;
+	u16 status, rising_sts, falling_sts;
+	u32 rising, falling;
+	int ret;
+
+	guard(mutex)(&mcu->lock);
+
+	ret = omnia_read_status_word_old_fw(mcu, &status);
+	if (ret < 0) {
+		dev_err(dev, "Cannot read pending IRQs: %d\n", ret);
+		return false;
+	}
+
+	/*
+	 * The old firmware triggers an interrupt whenever status word changes,
+	 * but does not inform about which bits rose or fell. We need to compute
+	 * this here by comparing with the last status word value.
+	 *
+	 * The STS_BUTTON_PRESSED bit needs special handling, because the old
+	 * firmware clears the STS_BUTTON_PRESSED bit on successful completion
+	 * of the CMD_GET_STATUS_WORD command, resulting in another interrupt:
+	 * - first we get an interrupt, we read the status word where
+	 *   STS_BUTTON_PRESSED is present,
+	 * - MCU clears the STS_BUTTON_PRESSED bit because we read the status
+	 *   word,
+	 * - we get another interrupt because the status word changed again
+	 *   (STS_BUTTON_PRESSED was cleared).
+	 *
+	 * The gpiolib-cdev, gpiolib-sysfs and gpio-keys input driver all call
+	 * the gpiochip's .get() method after an edge event on a requested GPIO
+	 * occurs.
+	 *
+	 * We ensure that the .get() method reads 1 for the button GPIO for some
+	 * time.
+	 */
+
+	if (status & STS_BUTTON_PRESSED) {
+		mcu->button_pressed_emul = true;
+		mod_delayed_work(system_wq, &mcu->button_release_emul_work,
+				 msecs_to_jiffies(FRONT_BUTTON_RELEASE_DELAY));
+	} else if (mcu->button_pressed_emul) {
+		status |= STS_BUTTON_PRESSED;
+	}
+
+	rising_sts = ~mcu->last_status & status;
+	falling_sts = mcu->last_status & ~status;
+
+	mcu->last_status = status;
+
+	/*
+	 * Fill in the relevant interrupt bits from status bits for CARD_DET,
+	 * MSATA_IND and BUTTON_PRESSED.
+	 */
+	rising = 0;
+	falling = 0;
+	fill_int_from_sts(&rising, &falling, rising_sts, falling_sts,
+			  STS_CARD_DET, INT_CARD_DET);
+	fill_int_from_sts(&rising, &falling, rising_sts, falling_sts,
+			  STS_MSATA_IND, INT_MSATA_IND);
+	fill_int_from_sts(&rising, &falling, rising_sts, falling_sts,
+			  STS_BUTTON_PRESSED, INT_BUTTON_PRESSED);
+
+	/* Use only bits that are enabled */
+	rising &= mcu->rising & mcu->mask;
+	falling &= mcu->falling & mcu->mask;
+	*pending = rising | falling;
+
+	return true;
+}
+
+static bool omnia_irq_read_pending(struct omnia_mcu *mcu,
+				   unsigned long *pending)
+{
+	if (mcu->features & FEAT_NEW_INT_API)
+		return omnia_irq_read_pending_new(mcu, pending);
+	else
+		return omnia_irq_read_pending_old(mcu, pending);
+}
+
+static irqreturn_t omnia_irq_thread_handler(int irq, void *dev_id)
+{
+	struct omnia_mcu *mcu = dev_id;
+	struct irq_domain *domain;
+	unsigned long pending;
+	int i;
+
+	if (!omnia_irq_read_pending(mcu, &pending))
+		return IRQ_NONE;
+
+	domain = mcu->gc.irq.domain;
+
+	for_each_set_bit(i, &pending, 32) {
+		unsigned int nested_irq;
+
+		nested_irq = irq_find_mapping(domain, omnia_int_to_gpio_idx[i]);
+
+		handle_nested_irq(nested_irq);
+	}
+
+	return IRQ_RETVAL(pending);
+}
+
+static const char * const front_button_modes[2] = { "mcu", "cpu" };
+
+static ssize_t front_button_mode_show(struct device *dev,
+				      struct device_attribute *a, char *buf)
+{
+	struct omnia_mcu *mcu = dev_get_drvdata(dev);
+	int val;
+
+	if (mcu->features & FEAT_NEW_INT_API) {
+		val = omnia_cmd_read_bit(mcu->client, CMD_GET_STATUS_WORD,
+					 STS_BUTTON_MODE);
+		if (val < 0)
+			return val;
+	} else {
+		val = !!(mcu->last_status & STS_BUTTON_MODE);
+	}
+
+	return sysfs_emit(buf, "%s\n", front_button_modes[val]);
+}
+
+static ssize_t front_button_mode_store(struct device *dev,
+				       struct device_attribute *a,
+				       const char *buf, size_t count)
+{
+	struct omnia_mcu *mcu = dev_get_drvdata(dev);
+	int err, i;
+
+	i = sysfs_match_string(front_button_modes, buf);
+	if (i < 0)
+		return i;
+
+	err = omnia_ctl_cmd_locked(mcu, CMD_GENERAL_CONTROL,
+				   i ? CTL_BUTTON_MODE : 0,
+				   CTL_BUTTON_MODE);
+	if (err)
+		return err;
+
+	return count;
+}
+static DEVICE_ATTR_RW(front_button_mode);
+
+static struct attribute *omnia_mcu_gpio_attrs[] = {
+	&dev_attr_front_button_mode.attr,
+	NULL
+};
+
+const struct attribute_group omnia_mcu_gpio_group = {
+	.attrs = omnia_mcu_gpio_attrs,
+};
+
+int omnia_mcu_register_gpiochip(struct omnia_mcu *mcu)
+{
+	bool new_api = mcu->features & FEAT_NEW_INT_API;
+	struct device *dev = &mcu->client->dev;
+	unsigned long irqflags;
+	int err;
+
+	err = devm_mutex_init(dev, &mcu->lock);
+	if (err)
+		return err;
+
+	mcu->gc.request = omnia_gpio_request;
+	mcu->gc.get_direction = omnia_gpio_get_direction;
+	mcu->gc.direction_input = omnia_gpio_direction_input;
+	mcu->gc.direction_output = omnia_gpio_direction_output;
+	mcu->gc.get = omnia_gpio_get;
+	mcu->gc.get_multiple = omnia_gpio_get_multiple;
+	mcu->gc.set = omnia_gpio_set;
+	mcu->gc.set_multiple = omnia_gpio_set_multiple;
+	mcu->gc.init_valid_mask = omnia_gpio_init_valid_mask;
+	mcu->gc.can_sleep = true;
+	mcu->gc.names = omnia_mcu_gpio_templates;
+	mcu->gc.base = -1;
+	mcu->gc.ngpio = ARRAY_SIZE(omnia_gpios);
+	mcu->gc.label = "Turris Omnia MCU GPIOs";
+	mcu->gc.parent = dev;
+	mcu->gc.owner = THIS_MODULE;
+	mcu->gc.of_gpio_n_cells = 3;
+	mcu->gc.of_xlate = omnia_gpio_of_xlate;
+
+	gpio_irq_chip_set_chip(&mcu->gc.irq, &omnia_mcu_irq_chip);
+	/* This will let us handle the parent IRQ in the driver */
+	mcu->gc.irq.parent_handler = NULL;
+	mcu->gc.irq.num_parents = 0;
+	mcu->gc.irq.parents = NULL;
+	mcu->gc.irq.default_type = IRQ_TYPE_NONE;
+	mcu->gc.irq.handler = handle_bad_irq;
+	mcu->gc.irq.threaded = true;
+	if (new_api)
+		mcu->gc.irq.init_hw = omnia_irq_init_hw;
+	mcu->gc.irq.init_valid_mask = omnia_irq_init_valid_mask;
+
+	err = devm_gpiochip_add_data(dev, &mcu->gc, mcu);
+	if (err)
+		return dev_err_probe(dev, err, "Cannot add GPIO chip\n");
+
+	/*
+	 * Before requesting the interrupt, if firmware does not support the new
+	 * interrupt API, we need to cache the value of the status word, so that
+	 * when it changes, we may compare the new value with the cached one in
+	 * the interrupt handler.
+	 */
+	if (!new_api) {
+		err = omnia_read_status_word_old_fw(mcu, &mcu->last_status);
+		if (err < 0)
+			return dev_err_probe(dev, err,
+					     "Cannot read status word\n");
+
+		INIT_DELAYED_WORK(&mcu->button_release_emul_work,
+				  button_release_emul_fn);
+	}
+
+	irqflags = IRQF_ONESHOT;
+	if (new_api)
+		irqflags |= IRQF_TRIGGER_LOW;
+	else
+		irqflags |= IRQF_TRIGGER_FALLING;
+
+	err = devm_request_threaded_irq(dev, mcu->client->irq, NULL,
+					omnia_irq_thread_handler, irqflags,
+					"turris-omnia-mcu", mcu);
+	if (err)
+		return dev_err_probe(dev, err, "Cannot request IRQ\n");
+
+	if (!new_api) {
+		/*
+		 * The button_release_emul_work has to be initialized before the
+		 * thread is requested, and on driver remove it needs to be
+		 * canceled before the thread is freed. Therefore we can't use
+		 * devm_delayed_work_autocancel() directly, because the order
+		 *   devm_delayed_work_autocancel();
+		 *   devm_request_threaded_irq();
+		 * would cause improper release order:
+		 *   free_irq();
+		 *   cancel_delayed_work_sync();
+		 * Instead we first initialize the work above, and only now
+		 * after IRQ is requested we add the work devm action.
+		 */
+		err = devm_add_action(dev, devm_delayed_work_drop,
+				      &mcu->button_release_emul_work);
+		if (err)
+			return err;
+	}
+
+	return 0;
+}
diff --git a/drivers/platform/cznic/turris-omnia-mcu.h b/drivers/platform/cznic/turris-omnia-mcu.h
index 5b21fbca8fe1..e8d9bf1c8fdc 100644
--- a/drivers/platform/cznic/turris-omnia-mcu.h
+++ b/drivers/platform/cznic/turris-omnia-mcu.h
@@ -8,9 +8,12 @@
 #ifndef __TURRIS_OMNIA_MCU_H
 #define __TURRIS_OMNIA_MCU_H
 
-#include <linux/i2c.h>
+#include <linux/bitops.h>
+#include <linux/gpio/driver.h>
 #include <linux/if_ether.h>
+#include <linux/mutex.h>
 #include <linux/types.h>
+#include <linux/workqueue.h>
 #include <asm/byteorder.h>
 
 struct omnia_mcu {
@@ -22,10 +25,66 @@ struct omnia_mcu {
 	u64 board_serial_number;
 	u8 board_first_mac[ETH_ALEN];
 	u8 board_revision;
+
+	/* GPIO chip */
+	struct gpio_chip gc;
+	struct mutex lock;
+	u32 mask, rising, falling, both, cached, is_cached;
+	/* Old MCU firmware handling needs the following */
+	struct delayed_work button_release_emul_work;
+	u16 last_status;
+	bool button_pressed_emul;
 };
 
-int omnia_cmd_read(const struct i2c_client *client, u8 cmd, void *reply,
-		   unsigned int len);
+int omnia_cmd_write_read(const struct i2c_client *client,
+			 void *cmd, unsigned int cmd_len,
+			 void *reply, unsigned int reply_len);
+
+static inline int omnia_cmd_write(const struct i2c_client *client, void *cmd,
+				  size_t len)
+{
+	return omnia_cmd_write_read(client, cmd, len, NULL, 0);
+}
+
+static inline int omnia_cmd_read(const struct i2c_client *client, u8 cmd,
+				 void *reply, unsigned int len)
+{
+	return omnia_cmd_write_read(client, &cmd, 1, reply, len);
+}
+
+/* Returns 0 on success */
+static inline int omnia_cmd_read_bits(const struct i2c_client *client, u8 cmd,
+				      u32 bits, u32 *dst)
+{
+	__le32 reply;
+	int err;
+
+	if (!bits) {
+		*dst = 0;
+		return 0;
+	}
+
+	err = omnia_cmd_read(client, cmd, &reply, (__fls(bits) >> 3) + 1);
+	if (err)
+		return err;
+
+	*dst = le32_to_cpu(reply) & bits;
+
+	return 0;
+}
+
+static inline int omnia_cmd_read_bit(const struct i2c_client *client, u8 cmd,
+				     u32 bit)
+{
+	u32 reply;
+	int err;
+
+	err = omnia_cmd_read_bits(client, cmd, bit, &reply);
+	if (err)
+		return err;
+
+	return !!reply;
+}
 
 static inline int omnia_cmd_read_u16(const struct i2c_client *client, u8 cmd)
 {
@@ -47,4 +106,8 @@ static inline int omnia_cmd_read_u8(const struct i2c_client *client, u8 cmd)
 	return err ?: reply;
 }
 
+extern const struct attribute_group omnia_mcu_gpio_group;
+
+int omnia_mcu_register_gpiochip(struct omnia_mcu *mcu);
+
 #endif /* __TURRIS_OMNIA_MCU_H */
-- 
2.43.2


