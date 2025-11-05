Return-Path: <linux-gpio+bounces-28120-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 87268C35D93
	for <lists+linux-gpio@lfdr.de>; Wed, 05 Nov 2025 14:31:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0C474349D79
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Nov 2025 13:31:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B94E321F39;
	Wed,  5 Nov 2025 13:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=public-files.de header.i=frank-w@public-files.de header.b="E81htyYN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2D83093D2;
	Wed,  5 Nov 2025 13:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762349489; cv=none; b=HxzJTGENg5PJLugyuDO8HSxpfZoqi2nqdDPtYPppf4EaOHAcM6HdJA+FquFenikySiDNGlGYGzrwofW/SPmDhy+LykRunIMwiSJCm3PoqlBAgti8DCp9VXg4Cr7402RWI7ykk9RFjw4/648ax0fJIHnJz/DOpU/Da523ibNHv7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762349489; c=relaxed/simple;
	bh=eiv5lrtbnCndPAqA7o31oMtGagHlYhWlCZDSxYihjM8=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=UYM7qjq7yqOgtxdlfbaBJk6LrIwEx2ehZikcrrSo+eHU7DgzVOedHHEtnB0hmXoyL84svt1F47JH61JWXk4xbxH5FGTcoa/2WfT4N2JiRI+J53yjsBSc3px0Swm5BuTFGzc30xT8Od/VBHhKfZ/+sSbTQFrezLZPA+IJE0HhZTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=public-files.de; spf=pass smtp.mailfrom=public-files.de; dkim=pass (2048-bit key) header.d=public-files.de header.i=frank-w@public-files.de header.b=E81htyYN; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=public-files.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=public-files.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1762349466; x=1762954266; i=frank-w@public-files.de;
	bh=//hqlcnmQ9HOQJpoPy9uJyivjzQVDpYQ8MXiM01ZtjA=;
	h=X-UI-Sender-Class:Date:From:To:CC:Subject:Reply-to:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=E81htyYNaKYL8MZaUbK30jcE/5F1smCkcYR2OIzB3N6ij9KoFBWiWbzqMOvUzWnO
	 UNH2ZfEpMrKYuQTa7ZyLTjW8NR2IZlozTwYuZ5qqPVycaBuE53dgB1mbrVAj/QGVc
	 lGMRvcSQxKiaJinMOtN1V3EjzRdXBwjfkPdOp2zHx49h2sBLiXBcoWxjU3WxJ5dvQ
	 xD3bopxHr+9ssmMen/wekufsWattuRANZVNP75UQYwpfIlzAtqovmauqDaODonMlm
	 GRAQd7UmKwrRaXAqZi3pDKTE9Je9uZOy1tHLHQuovFQAVmG5lfzzmMVYu2SKnOy94
	 Zz11lFt8mX5A2NRlZA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ehlo.thunderbird.net ([194.15.81.38]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MVvPD-1vhpXT2czN-00MZ1H; Wed, 05
 Nov 2025 14:31:06 +0100
Date: Wed, 05 Nov 2025 14:31:01 +0100
From: Frank Wunderlich <frank-w@public-files.de>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Frank Wunderlich <linux@fw-web.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
CC: Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v1_4/6=5D_arm64=3A_dts=3A_mt798?=
 =?US-ASCII?Q?8=3A_Add_devicetree_for_BananaPi_R4_Pro?=
User-Agent: K-9 Mail for Android
Reply-to: frank-w@public-files.de
In-Reply-To: <017b2ebb-e6b0-40a2-a6e6-47ced8909f55@collabora.com>
References: <20251027132817.212534-1-linux@fw-web.de> <20251027132817.212534-5-linux@fw-web.de> <017b2ebb-e6b0-40a2-a6e6-47ced8909f55@collabora.com>
Message-ID: <2FA85806-B703-4F25-B22D-758AB0BBCCE7@public-files.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:WJZfUu51Iotzl+Za2Rrbd6Qlx+lgqaiVpeN351Cx+PO8arvyGWK
 VIKElthInoE9ZguygM9a6CZjD9YaukdHOC4S4j5YKZGNRZl3H1AO85TEy9/LAYk0pedq/T8
 I+hJ4vtJP/KfhSnCJ5ktqf/dEVPg5BTte9dXJIBZFb2bymlu8zJIeRlDkEjYYgYa0jcy7QY
 qofjblBnb6wRun3BJYeAg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:RNTS4dicsgs=;+O411AO9QEdSunoPku2CAyBr8a3
 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
 V4pAUtZPojcIjHdtyVrTxTivihy/1

Am 5=2E November 2025 13:55:43 MEZ schrieb AngeloGioacchino Del Regno <ange=
logioacchino=2Edelregno@collabora=2Ecom>:
>Il 27/10/25 14:28, Frank Wunderlich ha scritto:
>> From: Frank Wunderlich <frank-w@public-files=2Ede>
>>=20
>> Add devicetree for Bpi-R4-Pro=2E
>
>Thanks for this!
>
>Overall, this looks good - there are just a few small things to fix, but =
hey,
>I bet you're getting this upstream as early as v2 :-D
>
>>=20
>> BananaPi R4 Pro is a MT7988A based board which exists in 2 different
>> hardware versions:
>>=20
>> - 4E: 4 GB RAM and using internal 2=2E5G Phy for WAN-Combo
>> - 8X: 8 GB RAM and 2x Aeonsemi AS21010P 10G phys
>>=20
>> common parts:
>>=20
>> - MediaTek MT7988A Quad-core Arm Corex-A73,1=2E8GHz processor
>> - 8GB eMMC flash
>> - 256MB SPI-NAND Flash
>> - Micro SD card slot
>> - 1x 10G SFP+ WAN
>> - 1x 10G SFP+ LAN
>> - 4x 2=2E5G RJ45 LAN (MxL86252C)
>> - 1x 1G RJ45 LAN (MT7988 internal switch)
>> - 2x miniPCIe slots with PCIe3=2E0 2lane interface for Wi-Fi NIC
>> - 2x M=2E2 M-KEY slots with PCIe3=2E0 1lane interface for NVME SSD
>> - 3x M=2E2 B-KEY slots with USB3=2E2 for 5G Module (PCIe shared with ke=
y-m)
>> - 1x USB3=2E2 slot
>> - 1x USB2=2E0 slot
>> - 1x USB TypeC Debug Console
>> - 2x13 PIN Header for expanding application
>>=20
>> https://docs=2Ebanana-pi=2Eorg/en/BPI-R4_Pro/BananaPi_BPI-R4_Pro
>>=20
>> The PCIe is per default in key-m state and can be changed to key-b with
>> the pcie-overlays=2E
>>=20
>> Signed-off-by: Frank Wunderlich <frank-w@public-files=2Ede>
>> ---
>>   arch/arm64/boot/dts/mediatek/Makefile         |   4 +
>>   =2E=2E=2E/mt7988a-bananapi-bpi-r4-pro-4e=2Edts        |  16 +
>>   =2E=2E=2E/mt7988a-bananapi-bpi-r4-pro-8x=2Edts        |  16 +
>>   =2E=2E=2E/mediatek/mt7988a-bananapi-bpi-r4-pro=2Edtsi | 559 +++++++++=
+++++++++
>>   4 files changed, 595 insertions(+)
>>   create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-=
r4-pro-4e=2Edts
>>   create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-=
r4-pro-8x=2Edts
>>   create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-=
r4-pro=2Edtsi
>>=20
>> diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dt=
s/mediatek/Makefile
>> index a4df4c21399e=2E=2E8640e5f32d4b 100644
>> --- a/arch/arm64/boot/dts/mediatek/Makefile
>> +++ b/arch/arm64/boot/dts/mediatek/Makefile
>> @@ -24,6 +24,8 @@ dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986b-rfb=2Edtb
>>   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7988a-bananapi-bpi-r4=2Edtb
>>   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7988a-bananapi-bpi-r4-2g5=2Edtb
>>   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7988a-bananapi-bpi-r4-emmc=2Edtbo
>> +dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7988a-bananapi-bpi-r4-pro-4e=2Edtb
>> +dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7988a-bananapi-bpi-r4-pro-8x=2Edtb
>>   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7988a-bananapi-bpi-r4-sd=2Edtbo
>>   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8167-pumpkin=2Edtb
>>   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8173-elm=2Edtb
>> @@ -111,4 +113,6 @@ DTC_FLAGS_mt7986a-bananapi-bpi-r3 :=3D -@
>>   DTC_FLAGS_mt7986a-bananapi-bpi-r3-mini :=3D -@
>>   DTC_FLAGS_mt7988a-bananapi-bpi-r4 :=3D -@
>>   DTC_FLAGS_mt7988a-bananapi-bpi-r4-2g5 :=3D -@
>> +DTC_FLAGS_mt7988a-bananapi-bpi-r4-pro-4e :=3D -@
>> +DTC_FLAGS_mt7988a-bananapi-bpi-r4-pro-8x :=3D -@
>>   DTC_FLAGS_mt8395-radxa-nio-12l :=3D -@
>> diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-4=
e=2Edts b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-4e=2Edts
>> new file mode 100644
>> index 000000000000=2E=2Ec7ea6e88c4f4
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-4e=2Edts
>> @@ -0,0 +1,16 @@
>> +// SPDX-License-Identifier: (GPL-2=2E0 OR MIT)
>> +/*
>> + * Copyright (C) 2025 MediaTek Inc=2E
>> + * Author: Frank Wunderlich <frank-w@public-files=2Ede>
>> + */
>> +
>> +/dts-v1/;
>> +
>> +#include "mt7988a-bananapi-bpi-r4-pro=2Edtsi"
>> +
>> +/ {
>> +	model =3D "Bananapi BPI-R4";
>> +	compatible =3D "bananapi,bpi-r4-pro-4e",
>> +		     "bananapi,bpi-r4-pro",
>> +		     "mediatek,mt7988a";
>> +};
>> diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8=
x=2Edts b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x=2Edts
>> new file mode 100644
>> index 000000000000=2E=2Ec9a0e69e9dd5
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x=2Edts
>> @@ -0,0 +1,16 @@
>> +// SPDX-License-Identifier: (GPL-2=2E0 OR MIT)
>> +/*
>> + * Copyright (C) 2025 MediaTek Inc=2E
>> + * Author: Frank Wunderlich <frank-w@public-files=2Ede>
>> + */
>> +
>> +/dts-v1/;
>> +
>> +#include "mt7988a-bananapi-bpi-r4-pro=2Edtsi"
>> +
>> +/ {
>> +	model =3D "Bananapi BPI-R4";
>> +	compatible =3D "bananapi,bpi-r4-pro-8x",
>> +		     "bananapi,bpi-r4-pro",
>> +		     "mediatek,mt7988a";
>> +};
>> diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro=
=2Edtsi b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro=2Edtsi
>> new file mode 100644
>> index 000000000000=2E=2E44406e23c042
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro=2Edtsi
>> @@ -0,0 +1,559 @@
>> +// SPDX-License-Identifier: (GPL-2=2E0 OR MIT)
>> +/*
>> + * Copyright (C) 2025 MediaTek Inc=2E
>> + * Author: Sam=2EShih <sam=2Eshih@mediatek=2Ecom>
>> + * Author: Frank Wunderlich <frank-w@public-files=2Ede>
>> + */
>> +
>> +/dts-v1/;
>> +
>> +#include "mt7988a=2Edtsi"
>> +#include <dt-bindings/gpio/gpio=2Eh>
>> +#include <dt-bindings/input/input=2Eh>
>> +#include <dt-bindings/leds/common=2Eh>
>> +#include <dt-bindings/regulator/richtek,rt5190a-regulator=2Eh>
>> +
>> +/*
>> + * ----------------------------------- Bananapi Bpi R4 Pro PINs ------=
---------------------------
>> + * |    | Function                               | Function           =
                     |    |
>> + * |----|----------------------------------------|--------------------=
---------------------|----|
>> + * | 1  | 3V3                                    | 5V                 =
                     | 2  |
>> + * | 3  | GPIO18/I2C_1_SDA                       | 5V                 =
                     | 4  |
>> + * | 5  | GPIO17/I2C_1_SCL                       | GND                =
                     | 6  |
>> + * | 7  | GPIO62/JTAG_JTRST_N/PWM6/I2P5G_LED1_P0 | GPIO59/JTAG_JTDO/UA=
RT2_TX/GBE_LED1_P1   | 8  |
>> + * | 9  | GND                                    | GPIO58/JTAG_JTDI/UA=
RT2_RX/GBE_LED1_P0   | 10 |
>> + * | 11 | GPIO81/UART1_TXD                       | GPIO51/PCM_CLK_I2S_=
BCLK                 | 12 |
>> + * | 13 | GPIO80/UART1_RXD                       | GND                =
                     | 14 |
>> + * | 15 | GPIO50/PCM_FS_I2S_LRCK                 | GPIO61/JTAG_JTCLK/U=
ART2_RTS/GBE_LED1_P3 | 16 |
>> + * | 17 | 3v3                                    | GPIO60/JTAG_JTMS/UA=
RT2_CTS/GBE_LED1_P2  | 18 |
>> + * | 19 | GPIO30/SPI1_MOSI                       | GND                =
                     | 20 |
>> + * | 21 | GPIO29/SPI1_MISO                       | GPIO53/PCM_DTX_I2S_=
DOUT                 | 22 |
>> + * | 23 | GPIO31/SPI1_CLK                        | GPIO28/SPI1_CSB    =
                     | 24 |
>> + * | 25 | GND                                    | GPIO52/PCM_DRX_I2S_=
DIN                  | 26 |
>> + * |----|----------------------------------------|--------------------=
---------------------|----|
>> + */
>
>Nice! Is this a "raspberry pi header" thingy?
>
>Let's say that the header is called "CON89" on the schematics (if unsure,=
 you
>should find that name by looking at the PCB), so a better title would be:
>
>* ------------------------------------- CON89 Pi header pins ------------=
-----------------------
>
>Also this relates to PIO, right? You could move that as a pio node commen=
t,
>either before or inside of your PIO overrides=2E
>After all, this comment is mapping "header pin number" to "PIO pin number=
" ;-)

I think i drop it on v2 as the "raspberry like" gpio header is not yet adr=
essed here=2E Current dts is only first part=2E

>> +
>> +/ {
>> +	aliases {
>> +		ethernet0 =3D &gmac0;
>> +		i2c0 =3D &i2c0;
>> +		i2c1 =3D &i2c1;
>> +		i2c2 =3D &i2c2;
>> +		/* PCA9548 (0-0070) provides 4 i2c channels */
>> +		i2c3 =3D &imux0;
>> +		i2c4 =3D &imux1_sfp1;
>> +		i2c5 =3D &imux2_sfp2;
>> +		i2c6 =3D &imux3_wifi;
>> +	};
>> +
>> +	chosen {
>> +		stdout-path =3D &serial0;
>> +		bootargs =3D "console=3DttyS0,115200n1 \
>> +			    earlycon=3Duart8250,mmio32,0x11000000";
>
>No, don't use bootargs - besides, earlycon is supposed to be for developm=
ent
>purposes only, and it *has to* be unnecessary after development, on upstr=
eamed
>devicetrees=2E

Yes that's already changed in my tree based on comment from krzysztof

>> +	};
>> +
>> +	fan: pwm-fan {
>> +		compatible =3D "pwm-fan";
>> +		/* cooling level (0, 1, 2, 3) : (0% duty, 30% duty, 50% duty, 100% d=
uty) */
>> +		cooling-levels =3D <0 80 128 255>;
>> +		pinctrl-names =3D "default";
>> +		pinctrl-0 =3D <&pwm0_pins>;
>> +		pwms =3D <&pwm 0 50000>;
>> +		#cooling-cells =3D <2>;
>> +	};
>> +
>> +	gpio-keys {
>> +		compatible =3D "gpio-keys";
>> +
>> +		button-reset {
>> +			label =3D "reset";
>> +			linux,code =3D <KEY_RESTART>;
>> +			gpios =3D <&pio 13 GPIO_ACTIVE_LOW>;
>
>Please treat the linux,code property as a vendor property=2E Means=2E=2E=
=2E
>
>label =3D
>gpios =3D
>linux,code =3D

Ok

>> +		};
>> +
>> +		button-wps {
>> +			label =3D "WPS";
>> +			linux,code =3D <KEY_WPS_BUTTON>;
>> +			gpios =3D <&pio 14 GPIO_ACTIVE_LOW>;
>> +		};
>> +	};
>> +
>> +	gpio-leds {
>> +		compatible =3D "gpio-leds";
>> +
>> +		led_red: sys-led-red {
>> +			color =3D <LED_COLOR_ID_RED>;
>> +			gpios =3D <&pca9555 15 GPIO_ACTIVE_HIGH>;
>> +			default-state =3D "on";
>> +		};
>> +
>> +		led_blue: sys-led-blue {
>> +			color =3D <LED_COLOR_ID_BLUE>;
>> +			gpios =3D <&pca9555 14 GPIO_ACTIVE_HIGH>;
>> +			default-state =3D "on";
>> +		};
>> +	};
>> +
>> +	reg_1p8v: regulator-1p8v {
>> +		compatible =3D "regulator-fixed";
>> +		regulator-name =3D "fixed-1=2E8V";
>
>Have you got the board schematics?
>
>If so, can you please change the regulator-name to the one from the schem=
atics?

Yes,have to look for it=2E

>> +		regulator-min-microvolt =3D <1800000>;
>> +		regulator-max-microvolt =3D <1800000>;
>> +		regulator-boot-on;
>> +		regulator-always-on;
>> +	};
>> +
>> +	reg_3p3v: regulator-3p3v {
>> +		compatible =3D "regulator-fixed";
>> +		regulator-name =3D "fixed-3=2E3V";
>> +		regulator-min-microvolt =3D <3300000>;
>> +		regulator-max-microvolt =3D <3300000>;
>> +		regulator-boot-on;
>> +		regulator-always-on;
>> +	};
>> +
>> +	/* SFP1 cage (LAN) */
>> +	sfp1: sfp1 {
>> +		compatible =3D "sff,sfp";
>> +		i2c-bus =3D <&imux1_sfp1>;
>> +		los-gpios =3D <&pio 70 GPIO_ACTIVE_HIGH>;//change4
>> +		mod-def0-gpios =3D <&pio 69 GPIO_ACTIVE_LOW>; //change3
>> +		tx-disable-gpios =3D <&pio 21 GPIO_ACTIVE_HIGH>; //change1
>
>What does "change4", "change3", "change1" even mean?
>
>Please remove=2E

Sorry that was my comments from changes between v0 and the v1 now=2E

>> +		maximum-power-milliwatt =3D <3000>;
>> +	};
>> +
>> +	/* SFP2 cage (WAN) */
>> +	sfp2: sfp2 {
>> +		compatible =3D "sff,sfp";
>> +		i2c-bus =3D <&imux2_sfp2>;
>> +		los-gpios =3D <&pio 2 GPIO_ACTIVE_HIGH>;
>> +		mod-def0-gpios =3D <&pio 1 GPIO_ACTIVE_LOW>;
>> +		tx-disable-gpios =3D <&pio 0 GPIO_ACTIVE_HIGH>;
>> +		maximum-power-milliwatt =3D <3000>;
>> +	};
>> +};
>> +
>
>=2E=2Esnip=2E=2E
>
>> +
>> +&gmac0 {
>> +	status =3D "okay";
>> +};
>> +
>> +&gsw_phy0 {
>> +	pinctrl-names =3D "gbe-led";
>> +	pinctrl-0 =3D <&gbe0_led0_pins>;
>> +};
>> +
>> +&gsw_phy0_led0 {
>> +	status =3D "okay";
>> +	color =3D <LED_COLOR_ID_YELLOW>;
>
>color first, status last

Ok

>> +};
>> +
>
>=2E=2Esnip=2E=2E
>
>> +
>> +&i2c1 {
>> +	pinctrl-names =3D "default";
>> +	pinctrl-0 =3D <&i2c1_pins>;
>> +	status =3D "okay";
>> +};
>> +
>> +&i2c2 {
>> +	pinctrl-names =3D "default";
>> +	pinctrl-0 =3D <&i2c2_1_pins>;
>> +	status =3D "okay";
>> +
>> +	pca9545: i2c-mux@70 {
>> +		reg =3D <0x70>;
>> +		compatible =3D "nxp,pca9545";
>
>compatible goes first=2E Check dts-coding-style=2Erst=2E

Ok,missed this

>> +		#address-cells =3D <1>;
>> +		#size-cells =3D <0>;
>> +
>> +		imux0: i2c@0 {
>> +			#address-cells =3D <1>;
>> +			#size-cells =3D <0>;
>> +			reg =3D <0>;
>
>reg goes first=2E
Ok
>> +
>> +			pca9555: i2c-gpio-expander@20 {
>> +				compatible =3D "nxp,pca9555";
>
>reg after compatible please

Ok
>> +				gpio-controller;
>> +				#gpio-cells =3D <2>;
>> +				reg =3D <0x20>;
>> +			};
>> +
>> +			rtc@51 {
>> +				compatible =3D "nxp,pcf8563";
>> +				reg =3D <0x51>;
>> +			};
>> +
>> +			eeprom@57 {
>> +				compatible =3D "atmel,24c02";
>> +				reg =3D <0x57>;
>> +				address-width =3D <8>;
>> +				pagesize =3D <8>;
>> +				size =3D <256>;
>> +			};
>> +		};
>> +
>> +		imux1_sfp1: i2c@1 {
>
>reg first, cells later;

>reg =3D <1>;
>#address-cells =3D <1>;
>#size-cells =3D <0>;
>
>here and everywhere else=2E

I do

>> +			#address-cells =3D <1>;
>> +			#size-cells =3D <0>;
>> +			reg =3D <1>;
>> +		};
>> +
>> +		imux2_sfp2: i2c@2 {
>> +			#address-cells =3D <1>;
>> +			#size-cells =3D <0>;
>> +			reg =3D <2>;
>> +		};
>> +
>> +		imux3_wifi: i2c@3 {
>> +			#address-cells =3D <1>;
>> +			#size-cells =3D <0>;
>> +			reg =3D <3>;
>> +		};
>> +	};
>> +};
>> +
>> +&int_2p5g_phy {
>> +	status =3D "disabled";
>> +};
>> +
>> +/* mPCIe SIM2 (11300000) */
>> +&pcie0 {
>> +	status =3D "okay";
>> +};
>> +
>> +/* mPCIe (11310000 near leds) SIM3 */
>> +&pcie1 {
>> +	status =3D "okay";
>> +};
>> +
>> +/* M=2E2 (11280000) 1L0 key-m SSD1 CN13 / key-b SIM1 CN15 */
>> +&pcie2 {
>> +	status =3D "okay";
>> +};
>> +
>> +/* M=2E2 (11290000) 1L1 key-m SSD2 CN14 / key-b SIM2 CN18 */
>> +&pcie3 {
>> +	status =3D "okay";
>> +};
>> +
>> +&pio {
>
>--snip=2E=2E
>
>> +
>> +	mmc0_pins_sdcard: mmc0-sdcard-pins {
>> +		mux {
>> +			function =3D "flash";
>> +			groups =3D "sdcard";
>> +		};
>> +	};
>> +
>> +	// 1L0 0=3Dkey-b (CN15), 1=3Dkey-m (CN13)
>
>Please fix the comments
>/* 1L0 0=3Dkey-b (CN15), 1=3Dkey-m (CN13) */
>
>> +	pcie-2-hog {
>> +		gpio-hog;
>> +		gpios =3D <79 GPIO_ACTIVE_HIGH>;
>> +		output-high;
>> +	};
>
>Extra space here please, and
>
>> +	// 1L1 0=3Dkey-b (CN18), 1=3Dkey-m (CN14)
>
>/* 1L1 0=3Dkey-b (CN18), 1=3Dkey-m (CN14) */
Ok

>> +	pcie-3-hog {
>> +		gpio-hog;
>> +		gpios =3D <63 GPIO_ACTIVE_HIGH>;
>> +		output-high;
>> +	};
>> +
>> +	pwm0_pins: pwm0-pins {
>> +		mux {
>> +			groups =3D "pwm0";
>> +			function =3D "pwm";
>> +		};
>> +	};
>> +
>> +	spi0_flash_pins: spi0-flash-pins {
>> +		mux {
>> +			function =3D "spi";
>> +			groups =3D "spi0", "spi0_wp_hold";
>> +		};
>> +	};
>> +};
>> +
>
>=2E=2Esnip=2E=2E
>
>> +
>> +/* back USB */
>> +&ssusb0 {
>> +	/* Use U2P only instead of both U3P/U2P due to U3P serdes shared with=
 pcie2 */
>> +	phys =3D <&xphyu2port0 PHY_TYPE_USB2>;
>> +	mediatek,u3p-dis-msk =3D <1>;
>> +	/delete-property/ mediatek,p0_speed_fixup;
>
>Where's that property defined, even?
>Am I blind, or it's nowhere to be found (in any dtsi)?
>
>(no, seriously, I'm not sarcastic :P)

Possibly forgot to drop while adding node from sdk dts :p

>> +	status =3D "okay";
>> +};
>> +
>
>Cheers,
>Angelo

Hi Angelo

Thanks for review
regards Frank

