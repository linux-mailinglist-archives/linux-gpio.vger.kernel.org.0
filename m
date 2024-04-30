Return-Path: <linux-gpio+bounces-5952-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9298B7BB2
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Apr 2024 17:34:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E6BD6288171
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Apr 2024 15:34:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E59A173343;
	Tue, 30 Apr 2024 15:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n00f2QLq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A5913AA51;
	Tue, 30 Apr 2024 15:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714491119; cv=none; b=lALxnjPxJbP5DuE8hosXiqtZmXxf6FcHn150Fe8rCooJHNxqCs4BR4ulEY0gs042KQ7tx/lN6aPYzvYQ8HOnhRs4vZlIJbe5EF9qJS2fBXb6n8b55T/0OwnhlqOZJRWaULt8q73DViVUbhN2O6B5Ymuzpt3phQm5X/ShgvXyr4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714491119; c=relaxed/simple;
	bh=4f8vPTEXoa/RV1WM80QmDjyRVjLy1yOS8lAeuWD3UDg=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=FubAGF6UOkdSeP8U8gDZ/x3PbH9f7LS+eTRMYmsfAyabUpZnOkvHz0M6ilKRJIhNTCKzXKorx1veIk808aBM1Y2Qp5nXO6DyU4q4FBl9xRX5ufDSISMWyy9xcbF5vT1eISDQoUKH10SVXVSlCTh4vtok9xGQUbCr0YYO2EM6HoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n00f2QLq; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714491117; x=1746027117;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=4f8vPTEXoa/RV1WM80QmDjyRVjLy1yOS8lAeuWD3UDg=;
  b=n00f2QLqJikHbsvuCDgyXLxviUvrt1/24gh1OtCRNX+A8xv+Qw5B0Luv
   pvmW+SKuk+fT7cMbzubueraY20ke+yJBqcUNCXPrNIbGp9wKPDCM9gtgj
   14Be6M1UCaBEJwD8H/sfvD5CZE35xY1ZzbIlD0fZ130QEZhe708Yl/w/2
   e5oaXInnYBJiYY/bjnyVXzjbRXIEGeDRSsBnclYD7pjcJ/gfatb01lEb/
   vOAjSrvWT2ioew2vHLuBGf1VkcjeBo6SLUXrkZCmAF45S5/PgJffXbJZk
   mhpn6WdL1wIkCruf7+dE+Ery61BghnDn2S4cAOlBBCtn8+86WArcH8A6K
   g==;
X-CSE-ConnectionGUID: nbNL/JcqRk+uAacO49XTUw==
X-CSE-MsgGUID: KaQ3U0WqSTOcpxRvTOrHbw==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="10065022"
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; 
   d="scan'208";a="10065022"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2024 08:31:55 -0700
X-CSE-ConnectionGUID: yrXH3eKyShmIIQa33+NmwA==
X-CSE-MsgGUID: Q0p7S90gQtu+ou59TZSY7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; 
   d="scan'208";a="31290948"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.49])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2024 08:31:51 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 30 Apr 2024 18:31:46 +0300 (EEST)
To: =?ISO-8859-15?Q?Marek_Beh=FAn?= <kabel@kernel.org>
cc: Gregory CLEMENT <gregory.clement@bootlin.com>, 
    Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, arm@kernel.org, 
    Andy Shevchenko <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
    Linus Walleij <linus.walleij@linaro.org>, 
    Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
    Alessandro Zummo <a.zummo@towertech.it>, 
    Alexandre Belloni <alexandre.belloni@bootlin.com>, 
    linux-rtc@vger.kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>, 
    Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v8 2/9] platform: cznic: Add preliminary support for
 Turris Omnia MCU
In-Reply-To: <20240430115111.3453-3-kabel@kernel.org>
Message-ID: <b90daba1-3333-0ca5-fb09-c2157f12d594@linux.intel.com>
References: <20240430115111.3453-1-kabel@kernel.org> <20240430115111.3453-3-kabel@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-121940876-1714490287=:1349"
Content-ID: <30ac92b2-d54b-bf80-edf2-b3f998ae025a@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-121940876-1714490287=:1349
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <c3816c99-1507-eaa1-97b9-2aac21194b52@linux.intel.com>

On Tue, 30 Apr 2024, Marek Beh=FAn wrote:

> Add the basic skeleton for a new platform driver for the microcontroller
> found on the Turris Omnia board.
>=20
> Signed-off-by: Marek Beh=FAn <kabel@kernel.org>

> +=09struct device *dev =3D &mcu->client->dev;
> +=09bool suggest_fw_upgrade =3D false;
> +=09int status;
> +
> +=09/* status word holds MCU type, which we need below */
> +=09status =3D omnia_cmd_read_u16(mcu->client, CMD_GET_STATUS_WORD);
> +=09if (status < 0)
> +=09=09return status;
> +
> +=09/* check whether MCU firmware supports the CMD_GET_FEAUTRES command *=
/

FEATURES

> +=09if (status & STS_FEATURES_SUPPORTED) {
> +=09=09__le32 reply;
> +=09=09int ret;
> +
> +=09=09/* try read 32-bit features */
> +=09=09ret =3D omnia_cmd_read(mcu->client, CMD_GET_FEATURES, &reply,
> +=09=09=09=09     sizeof(reply));
> +=09=09if (ret) {
> +=09=09=09/* try read 16-bit features */
> +=09=09=09ret =3D omnia_cmd_read_u16(mcu->client, CMD_GET_FEATURES);
> +=09=09=09if (ret < 0)
> +=09=09=09=09return ret;
> +
> +=09=09=09mcu->features =3D ret;
> +=09=09} else {
> +=09=09=09mcu->features =3D le32_to_cpu(reply);
> +
> +=09=09=09if (mcu->features & FEAT_FROM_BIT_16_INVALID)
> +=09=09=09=09mcu->features &=3D GENMASK(15, 0);
> +=09=09}

I'm not a big fan of the inconsistency here when it comes to who handles=20
the endianness, perhaps there is a good reason for that but it looks a bit=
=20
odd to have it done in a different way for 32-bit and 16-bit.

> +=09} else {
> +=09=09omnia_info_missing_feature(dev, "feature reading");
> +=09=09suggest_fw_upgrade =3D true;
> +=09}
> +
> +=09mcu->type =3D omnia_status_to_mcu_type(status);
> +=09dev_info(dev, "MCU type %s%s\n", mcu->type,
> +=09=09 (mcu->features & FEAT_PERIPH_MCU) ?
> +=09=09=09", with peripheral resets wired" : "");
> +
> +=09omnia_mcu_print_version_hash(mcu, true);
> +
> +=09if (mcu->features & FEAT_BOOTLOADER)
> +=09=09dev_warn(dev,
> +=09=09=09 "MCU is running bootloader firmware. Was firmware upgrade inte=
rrupted?\n");
> +=09else
> +=09=09omnia_mcu_print_version_hash(mcu, false);
> +
> +=09for (unsigned int i =3D 0; i < ARRAY_SIZE(features); i++) {
> +=09=09if (mcu->features & features[i].mask)
> +=09=09=09continue;
> +
> +=09=09omnia_info_missing_feature(dev, features[i].name);
> +=09=09suggest_fw_upgrade =3D true;
> +=09}
> +
> +=09if (suggest_fw_upgrade)
> +=09=09dev_info(dev,
> +=09=09=09 "Consider upgrading MCU firmware with the omnia-mcutool utilit=
y.\n");
> +
> +=09return 0;
> +}

> +int omnia_cmd_read(const struct i2c_client *client, u8 cmd, void *reply,
> +=09=09   unsigned int len);
> +
> +static inline int omnia_cmd_read_u16(const struct i2c_client *client, u8=
 cmd)
> +{
> +=09__le16 reply;
> +=09int err;
> +
> +=09err =3D omnia_cmd_read(client, cmd, &reply, sizeof(reply));
> +
> +=09return err ?: le16_to_cpu(reply);
> +}
> +
> +static inline int omnia_cmd_read_u8(const struct i2c_client *client, u8 =
cmd)
> +{
> +=09u8 reply;
> +=09int err;
> +
> +=09err =3D omnia_cmd_read(client, cmd, &reply, sizeof(reply));
> +
> +=09return err ?: reply;
> +}
> +
> +#endif /* __TURRIS_OMNIA_MCU_H */


> diff --git a/include/linux/turris-omnia-mcu-interface.h b/include/linux/t=
urris-omnia-mcu-interface.h
> new file mode 100644
> index 000000000000..88f8490b5897
> --- /dev/null
> +++ b/include/linux/turris-omnia-mcu-interface.h
> @@ -0,0 +1,249 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * CZ.NIC's Turris Omnia MCU I2C interface commands definitions
> + *
> + * 2024 by Marek Beh=FAn <kabel@kernel.org>
> + */
> +
> +#ifndef __TURRIS_OMNIA_MCU_INTERFACE_H
> +#define __TURRIS_OMNIA_MCU_INTERFACE_H
> +
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +
> +enum omnia_commands_e {
> +=09CMD_GET_STATUS_WORD=09=09=3D 0x01, /* slave sends status word back */
> +=09CMD_GENERAL_CONTROL=09=09=3D 0x02,
> +=09CMD_LED_MODE=09=09=09=3D 0x03, /* default/user */
> +=09CMD_LED_STATE=09=09=09=3D 0x04, /* LED on/off */
> +=09CMD_LED_COLOR=09=09=09=3D 0x05, /* LED number + RED + GREEN + BLUE */
> +=09CMD_USER_VOLTAGE=09=09=3D 0x06,
> +=09CMD_SET_BRIGHTNESS=09=09=3D 0x07,
> +=09CMD_GET_BRIGHTNESS=09=09=3D 0x08,
> +=09CMD_GET_RESET=09=09=09=3D 0x09,
> +=09CMD_GET_FW_VERSION_APP=09=09=3D 0x0A, /* 20B git hash number */
> +=09CMD_SET_WATCHDOG_STATE=09=09=3D 0x0B, /* 0 - disable
> +=09=09=09=09=09=09 * 1 - enable / ping
> +=09=09=09=09=09=09 * after boot watchdog is started
> +=09=09=09=09=09=09 * with 2 minutes timeout
> +=09=09=09=09=09=09 */
> +
> +=09/* CMD_WATCHDOG_STATUS=09=09=3D 0x0C, not implemented anymore */
> +
> +=09CMD_GET_WATCHDOG_STATE=09=09=3D 0x0D,
> +=09CMD_GET_FW_VERSION_BOOT=09=09=3D 0x0E, /* 20B git hash number */
> +=09CMD_GET_FW_CHECKSUM=09=09=3D 0x0F, /* 4B length, 4B checksum */
> +
> +=09/* available if FEATURES_SUPPORTED bit set in status word */
> +=09CMD_GET_FEATURES=09=09=3D 0x10,
> +
> +=09/* available if EXT_CMD bit set in features */
> +=09CMD_GET_EXT_STATUS_DWORD=09=3D 0x11,
> +=09CMD_EXT_CONTROL=09=09=09=3D 0x12,
> +=09CMD_GET_EXT_CONTROL_STATUS=09=3D 0x13,
> +
> +=09/* available if NEW_INT_API bit set in features */
> +=09CMD_GET_INT_AND_CLEAR=09=09=3D 0x14,
> +=09CMD_GET_INT_MASK=09=09=3D 0x15,
> +=09CMD_SET_INT_MASK=09=09=3D 0x16,
> +
> +=09/* available if FLASHING bit set in features */
> +=09CMD_FLASH=09=09=09=3D 0x19,
> +
> +=09/* available if WDT_PING bit set in features */
> +=09CMD_SET_WDT_TIMEOUT=09=09=3D 0x20,
> +=09CMD_GET_WDT_TIMELEFT=09=09=3D 0x21,
> +
> +=09/* available if POWEROFF_WAKEUP bit set in features */
> +=09CMD_SET_WAKEUP=09=09=09=3D 0x22,
> +=09CMD_GET_UPTIME_AND_WAKEUP=09=3D 0x23,
> +=09CMD_POWER_OFF=09=09=09=3D 0x24,
> +
> +=09/* available if USB_OVC_PROT_SETTING bit set in features */
> +=09CMD_SET_USB_OVC_PROT=09=09=3D 0x25,
> +=09CMD_GET_USB_OVC_PROT=09=09=3D 0x26,
> +
> +=09/* available if TRNG bit set in features */
> +=09CMD_TRNG_COLLECT_ENTROPY=09=3D 0x28,
> +
> +=09/* available if CRYPTO bit set in features */
> +=09CMD_CRYPTO_GET_PUBLIC_KEY=09=3D 0x29,
> +=09CMD_CRYPTO_SIGN_MESSAGE=09=09=3D 0x2A,
> +=09CMD_CRYPTO_COLLECT_SIGNATURE=09=3D 0x2B,
> +
> +=09/* available if BOARD_INFO it set in features */
> +=09CMD_BOARD_INFO_GET=09=09=3D 0x2C,
> +=09CMD_BOARD_INFO_BURN=09=09=3D 0x2D,
> +
> +=09/* available only at address 0x2b (led-controller) */
> +=09/* available only if LED_GAMMA_CORRECTION bit set in features */
> +=09CMD_SET_GAMMA_CORRECTION=09=3D 0x30,
> +=09CMD_GET_GAMMA_CORRECTION=09=3D 0x31,
> +
> +=09/* available only at address 0x2b (led-controller) */
> +=09/* available only if PER_LED_CORRECTION bit set in features */
> +=09/* available only if FROM_BIT_16_INVALID bit NOT set in features */
> +=09CMD_SET_LED_CORRECTIONS=09=09=3D 0x32,
> +=09CMD_GET_LED_CORRECTIONS=09=09=3D 0x33,
> +};
> +
> +enum omnia_flashing_commands_e {
> +=09FLASH_CMD_UNLOCK=09=09=3D 0x01,
> +=09FLASH_CMD_SIZE_AND_CSUM=09=09=3D 0x02,
> +=09FLASH_CMD_PROGRAM=09=09=3D 0x03,
> +=09FLASH_CMD_RESET=09=09=09=3D 0x04,
> +};

I'm bit worried about many items above, they seem generic enough they=20
could trigger name conflict at some point. Could these all defines be=20
prefixed so there's no risk of collisions.

> +enum omnia_sts_word_e {
> +=09STS_MCU_TYPE_MASK=09=09=09=3D GENMASK(1, 0),
> +=09STS_MCU_TYPE_STM32=09=09=09=3D 0 << 0,
> +=09STS_MCU_TYPE_GD32=09=09=09=3D 1 << 0,
> +=09STS_MCU_TYPE_MKL=09=09=09=3D 2 << 0,

These are FIELD_PREP(STS_MCU_TYPE_MASK, x), although I suspect you need to=
=20
use FIELD_PREP_CONST() in this context. If neither ends up working in this=
=20
context, then leave it as is.

> +=09STS_FEATURES_SUPPORTED=09=09=09=3D BIT(2),
> +=09STS_USER_REGULATOR_NOT_SUPPORTED=09=3D BIT(3),
> +=09STS_CARD_DET=09=09=09=09=3D BIT(4),
> +=09STS_MSATA_IND=09=09=09=09=3D BIT(5),
> +=09STS_USB30_OVC=09=09=09=09=3D BIT(6),
> +=09STS_USB31_OVC=09=09=09=09=3D BIT(7),
> +=09STS_USB30_PWRON=09=09=09=09=3D BIT(8),
> +=09STS_USB31_PWRON=09=09=09=09=3D BIT(9),
> +=09STS_ENABLE_4V5=09=09=09=09=3D BIT(10),
> +=09STS_BUTTON_MODE=09=09=09=09=3D BIT(11),
> +=09STS_BUTTON_PRESSED=09=09=09=3D BIT(12),
> +=09STS_BUTTON_COUNTER_MASK=09=09=09=3D GENMASK(15, 13)
> +};
> +
> +enum omnia_ctl_byte_e {
> +=09CTL_LIGHT_RST=09=09=3D BIT(0),
> +=09CTL_HARD_RST=09=09=3D BIT(1),
> +=09/* BIT(2) is currently reserved */
> +=09CTL_USB30_PWRON=09=09=3D BIT(3),
> +=09CTL_USB31_PWRON=09=09=3D BIT(4),
> +=09CTL_ENABLE_4V5=09=09=3D BIT(5),
> +=09CTL_BUTTON_MODE=09=09=3D BIT(6),
> +=09CTL_BOOTLOADER=09=09=3D BIT(7)
> +};
> +
> +enum omnia_features_e {
> +=09FEAT_PERIPH_MCU=09=09=09=3D BIT(0),
> +=09FEAT_EXT_CMDS=09=09=09=3D BIT(1),
> +=09FEAT_WDT_PING=09=09=09=3D BIT(2),
> +=09FEAT_LED_STATE_EXT_MASK=09=09=3D GENMASK(4, 3),
> +=09FEAT_LED_STATE_EXT=09=09=3D 1 << 3,
> +=09FEAT_LED_STATE_EXT_V32=09=09=3D 2 << 3,

Ditto.

> +=09FEAT_LED_GAMMA_CORRECTION=09=3D BIT(5),
> +=09FEAT_NEW_INT_API=09=09=3D BIT(6),
> +=09FEAT_BOOTLOADER=09=09=09=3D BIT(7),
> +=09FEAT_FLASHING=09=09=09=3D BIT(8),
> +=09FEAT_NEW_MESSAGE_API=09=09=3D BIT(9),
> +=09FEAT_BRIGHTNESS_INT=09=09=3D BIT(10),
> +=09FEAT_POWEROFF_WAKEUP=09=09=3D BIT(11),
> +=09FEAT_CAN_OLD_MESSAGE_API=09=3D BIT(12),
> +=09FEAT_TRNG=09=09=09=3D BIT(13),
> +=09FEAT_CRYPTO=09=09=09=3D BIT(14),
> +=09FEAT_BOARD_INFO=09=09=09=3D BIT(15),
> +
> +=09/*
> +=09 * Orginally the features command replied only 16 bits. If more were
> +=09 * read, either the I2C transaction failed or 0xff bytes were sent.
> +=09 * Therefore to consider bits 16 - 31 valid, one bit (20) was reserve=
d
> +=09 * to be zero.
> +=09 */
> +
> +=09/* Bits 16 - 19 correspond to bits 0 - 3 of status word */
> +=09FEAT_MCU_TYPE_MASK=09=09=3D GENMASK(17, 16),
> +=09FEAT_MCU_TYPE_STM32=09=09=3D 0 << 16,
> +=09FEAT_MCU_TYPE_GD32=09=09=3D 1 << 16,
> +=09FEAT_MCU_TYPE_MKL=09=09=3D 2 << 16,

Ditto.


--=20
 i.
--8323328-121940876-1714490287=:1349--

