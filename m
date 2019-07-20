Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF89A6EEDC
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Jul 2019 11:50:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727645AbfGTJuM convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Sat, 20 Jul 2019 05:50:12 -0400
Received: from hermes.aosc.io ([199.195.250.187]:35126 "EHLO hermes.aosc.io"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727434AbfGTJuM (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 20 Jul 2019 05:50:12 -0400
Received: from localhost (localhost [127.0.0.1]) (Authenticated sender: icenowy@aosc.io)
        by hermes.aosc.io (Postfix) with ESMTPSA id 3221A6ECDF;
        Sat, 20 Jul 2019 09:50:05 +0000 (UTC)
Date:   Sat, 20 Jul 2019 17:50:10 +0800
In-Reply-To: <20190720094814.s6qik6ja2ympwpmp@flea>
References: <20190713034634.44585-1-icenowy@aosc.io> <20190713034634.44585-7-icenowy@aosc.io> <20190720094814.s6qik6ja2ympwpmp@flea>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8BIT
Subject: Re: [PATCH v4 6/8] ARM: sunxi: dts: s3/s3l/v3: add DTSI files for S3/S3L/V3 SoCs
To:     linux-arm-kernel@lists.infradead.org,
        Maxime Ripard <maxime.ripard@bootlin.com>
CC:     devicetree@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-sunxi@googlegroups.com, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
        Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org
From:   Icenowy Zheng <icenowy@aosc.io>
Message-ID: <76C8832D-04C8-4EEE-A0D1-1EE018DF9B94@aosc.io>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



于 2019年7月20日 GMT+08:00 下午5:48:14, Maxime Ripard <maxime.ripard@bootlin.com> 写到:
>On Sat, Jul 13, 2019 at 11:46:32AM +0800, Icenowy Zheng wrote:
>> The Allwinner S3/S3L/V3 SoCs all share the same die with the V3s SoC,
>> but with more GPIO wired out of the package.
>>
>> Add DTSI files for these SoCs. The DTSI file for V3 just replaces the
>> pinctrl compatible string, and the S3/S3L DTSI files just include the
>V3
>> DTSI file.
>>
>> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
>> ---
>> No changes since v2.
>>
>>  arch/arm/boot/dts/sun8i-s3.dtsi  |  6 ++++++
>>  arch/arm/boot/dts/sun8i-s3l.dtsi |  6 ++++++
>>  arch/arm/boot/dts/sun8i-v3.dtsi  | 14 ++++++++++++++
>>  3 files changed, 26 insertions(+)
>>  create mode 100644 arch/arm/boot/dts/sun8i-s3.dtsi
>>  create mode 100644 arch/arm/boot/dts/sun8i-s3l.dtsi
>>  create mode 100644 arch/arm/boot/dts/sun8i-v3.dtsi
>>
>> diff --git a/arch/arm/boot/dts/sun8i-s3.dtsi
>b/arch/arm/boot/dts/sun8i-s3.dtsi
>> new file mode 100644
>> index 000000000000..0f41a25ecb30
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/sun8i-s3.dtsi
>> @@ -0,0 +1,6 @@
>> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>> +/*
>> + * Copyright (C) 2019 Icenowy Zheng <icenowy@aosc.io>
>> + */
>> +
>> +#include "sun8i-v3.dtsi"
>> diff --git a/arch/arm/boot/dts/sun8i-s3l.dtsi
>b/arch/arm/boot/dts/sun8i-s3l.dtsi
>> new file mode 100644
>> index 000000000000..0f41a25ecb30
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/sun8i-s3l.dtsi
>> @@ -0,0 +1,6 @@
>> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>> +/*
>> + * Copyright (C) 2019 Icenowy Zheng <icenowy@aosc.io>
>> + */
>> +
>> +#include "sun8i-v3.dtsi"
>> diff --git a/arch/arm/boot/dts/sun8i-v3.dtsi
>b/arch/arm/boot/dts/sun8i-v3.dtsi
>> new file mode 100644
>> index 000000000000..6ae8645ade50
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/sun8i-v3.dtsi
>> @@ -0,0 +1,14 @@
>> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>> +/*
>> + * Copyright (C) 2019 Icenowy Zheng <icenowy@aosc.io>
>> + */
>> +
>> +#include "sun8i-v3s.dtsi"
>> +
>> +&ccu {
>> +	compatible = "allwinner,sun8i-v3-ccu";
>> +};
>> +
>> +&pio {
>> +	compatible = "allwinner,sun8i-v3-pinctrl";
>> +};
>
>Is there any difference between the S3, S3L and V3?

DRAM. This might be useful when we introduce DRAM DVFS.

>
>If not, then we don't need all those DTSI, just add the v3

But I agree with this now.

>
>Maxime
>
>--
>Maxime Ripard, Bootlin
>Embedded Linux and Kernel engineering
>https://bootlin.com

-- 
使用 K-9 Mail 发送自我的Android设备。
