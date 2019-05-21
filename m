Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8743B2494F
	for <lists+linux-gpio@lfdr.de>; Tue, 21 May 2019 09:49:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726316AbfEUHtM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 May 2019 03:49:12 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:56738 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726193AbfEUHtL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 21 May 2019 03:49:11 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x4L7kp2S017921;
        Tue, 21 May 2019 09:48:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=GqxsC/HmUBt+EZxqpLDAlGaRrwKBJVv+DIPYytOsgHM=;
 b=O+4ww5RrIOrvk0ZwzbfxP2ZwW5MWhfSmI33EwCRauM2DpgmEv+mgxFbTJocOvTUCFRGU
 //C9eVSPYQC10CEDY2N+rrZ2crRec1En3CuzG/0fH6EYS0aaS1TdgEfvDGtqgjizPJBQ
 /fo6+2lLZXFXZpcuaqYuQHuJFe6P1152MTqVpL2C+UBtxgpBhlGoJqcJS1wMt8OncbwN
 jwYhav5uC7fL8vYxMQbVEjCMOEPLkvVM1uNaM2GWDTQ+aBFCIQfTchl4CAa0YcIA2aS1
 Nt10VfUaBzYKpg7QEFb7tofUwQgiyYcVGrOXLGyXrUg3kd1jP3ZtOSczYAofsXCJNuxF Dw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2sj7h0r0bf-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Tue, 21 May 2019 09:48:54 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EFA903F;
        Tue, 21 May 2019 07:48:53 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A05911613;
        Tue, 21 May 2019 07:48:53 +0000 (GMT)
Received: from [10.48.0.204] (10.75.127.48) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 21 May
 2019 09:48:49 +0200
Subject: Re: [PATCH 5/5] ARM: dts: stm32: use dedicated files to manage
 stm32mp157 packages
To:     Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, <arnd@arndb.de>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
References: <1554895824-25709-1-git-send-email-alexandre.torgue@st.com>
 <1554895824-25709-6-git-send-email-alexandre.torgue@st.com>
From:   Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <b236861c-2a25-d5a9-c892-3d2a33bacf30@st.com>
Date:   Tue, 21 May 2019 09:48:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1554895824-25709-6-git-send-email-alexandre.torgue@st.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG6NODE1.st.com (10.75.127.16) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-05-21_01:,,
 signatures=0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 4/10/19 1:30 PM, Alexandre Torgue wrote:
> Four packages exist for stm32mp157 die. As ball-out is different between
> them, this patch covers those differences by creating dedicated pinctrl
> dtsi files. Each dtsi pinctrl package file describes the package ball-out
> through gpio-ranges.
> 
> stm32mp157a-dk1 / dk2 boards embed a STM32MP_PKG_AC (TFBGA361 (12*12))
> package.
> 
> stm32mp157c-ed1 / ev1 boards embed a STM32MP_PKG_AA (LFBGA448 (18*18))
> package.
> 
> Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>
> 

Applied on stm32-next.

Thanks.
Alex

> diff --git a/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
> index 9104896..3b4cc3c 100644
> --- a/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
> @@ -26,6 +26,7 @@
>   				st,bank-name = "GPIOA";
>   				ngpios = <16>;
>   				gpio-ranges = <&pinctrl 0 0 16>;
> +				status = "disabled";
>   			};
>   
>   			gpiob: gpio@50003000 {
> @@ -38,6 +39,7 @@
>   				st,bank-name = "GPIOB";
>   				ngpios = <16>;
>   				gpio-ranges = <&pinctrl 0 16 16>;
> +				status = "disabled";
>   			};
>   
>   			gpioc: gpio@50004000 {
> @@ -50,6 +52,7 @@
>   				st,bank-name = "GPIOC";
>   				ngpios = <16>;
>   				gpio-ranges = <&pinctrl 0 32 16>;
> +				status = "disabled";
>   			};
>   
>   			gpiod: gpio@50005000 {
> @@ -62,6 +65,7 @@
>   				st,bank-name = "GPIOD";
>   				ngpios = <16>;
>   				gpio-ranges = <&pinctrl 0 48 16>;
> +				status = "disabled";
>   			};
>   
>   			gpioe: gpio@50006000 {
> @@ -74,6 +78,7 @@
>   				st,bank-name = "GPIOE";
>   				ngpios = <16>;
>   				gpio-ranges = <&pinctrl 0 64 16>;
> +				status = "disabled";
>   			};
>   
>   			gpiof: gpio@50007000 {
> @@ -86,6 +91,7 @@
>   				st,bank-name = "GPIOF";
>   				ngpios = <16>;
>   				gpio-ranges = <&pinctrl 0 80 16>;
> +				status = "disabled";
>   			};
>   
>   			gpiog: gpio@50008000 {
> @@ -98,6 +104,7 @@
>   				st,bank-name = "GPIOG";
>   				ngpios = <16>;
>   				gpio-ranges = <&pinctrl 0 96 16>;
> +				status = "disabled";
>   			};
>   
>   			gpioh: gpio@50009000 {
> @@ -110,6 +117,7 @@
>   				st,bank-name = "GPIOH";
>   				ngpios = <16>;
>   				gpio-ranges = <&pinctrl 0 112 16>;
> +				status = "disabled";
>   			};
>   
>   			gpioi: gpio@5000a000 {
> @@ -122,6 +130,7 @@
>   				st,bank-name = "GPIOI";
>   				ngpios = <16>;
>   				gpio-ranges = <&pinctrl 0 128 16>;
> +				status = "disabled";
>   			};
>   
>   			gpioj: gpio@5000b000 {
> @@ -134,6 +143,7 @@
>   				st,bank-name = "GPIOJ";
>   				ngpios = <16>;
>   				gpio-ranges = <&pinctrl 0 144 16>;
> +				status = "disabled";
>   			};
>   
>   			gpiok: gpio@5000c000 {
> @@ -146,6 +156,7 @@
>   				st,bank-name = "GPIOK";
>   				ngpios = <8>;
>   				gpio-ranges = <&pinctrl 0 160 8>;
> +				status = "disabled";
>   			};
>   
>   			cec_pins_a: cec-0 {
> @@ -427,6 +438,7 @@
>   				st,bank-ioport = <11>;
>   				ngpios = <8>;
>   				gpio-ranges = <&pinctrl_z 0 400 8>;
> +				status = "disabled";
>   			};
>   
>   			i2c4_pins_a: i2c4-0 {
> diff --git a/arch/arm/boot/dts/stm32mp157a-dk1.dts b/arch/arm/boot/dts/stm32mp157a-dk1.dts
> index 1b1886d..8d60641 100644
> --- a/arch/arm/boot/dts/stm32mp157a-dk1.dts
> +++ b/arch/arm/boot/dts/stm32mp157a-dk1.dts
> @@ -7,7 +7,7 @@
>   /dts-v1/;
>   
>   #include "stm32mp157c.dtsi"
> -#include "stm32mp157-pinctrl.dtsi"
> +#include "stm32mp157xac-pinctrl.dtsi"
>   #include <dt-bindings/gpio/gpio.h>
>   
>   / {
> diff --git a/arch/arm/boot/dts/stm32mp157c-ed1.dts b/arch/arm/boot/dts/stm32mp157c-ed1.dts
> index 9fd7943..6ed9d49 100644
> --- a/arch/arm/boot/dts/stm32mp157c-ed1.dts
> +++ b/arch/arm/boot/dts/stm32mp157c-ed1.dts
> @@ -6,7 +6,7 @@
>   /dts-v1/;
>   
>   #include "stm32mp157c.dtsi"
> -#include "stm32mp157-pinctrl.dtsi"
> +#include "stm32mp157xaa-pinctrl.dtsi"
>   #include <dt-bindings/gpio/gpio.h>
>   
>   / {
> diff --git a/arch/arm/boot/dts/stm32mp157xaa-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp157xaa-pinctrl.dtsi
> new file mode 100644
> index 0000000..875adf5
> --- /dev/null
> +++ b/arch/arm/boot/dts/stm32mp157xaa-pinctrl.dtsi
> @@ -0,0 +1,90 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> +/*
> + * Copyright (C) STMicroelectronics 2019 - All Rights Reserved
> + * Author: Alexandre Torgue <alexandre.torgue@st.com>
> + */
> +
> +#include "stm32mp157-pinctrl.dtsi"
> +/ {
> +	soc {
> +		pinctrl: pin-controller@50002000 {
> +			st,package = <STM32MP_PKG_AA>;
> +
> +			gpioa: gpio@50002000 {
> +				status = "okay";
> +				ngpios = <16>;
> +				gpio-ranges = <&pinctrl 0 0 16>;
> +			};
> +
> +			gpiob: gpio@50003000 {
> +				status = "okay";
> +				ngpios = <16>;
> +				gpio-ranges = <&pinctrl 0 16 16>;
> +			};
> +
> +			gpioc: gpio@50004000 {
> +				status = "okay";
> +				ngpios = <16>;
> +				gpio-ranges = <&pinctrl 0 32 16>;
> +			};
> +
> +			gpiod: gpio@50005000 {
> +				status = "okay";
> +				ngpios = <16>;
> +				gpio-ranges = <&pinctrl 0 48 16>;
> +			};
> +
> +			gpioe: gpio@50006000 {
> +				status = "okay";
> +				ngpios = <16>;
> +				gpio-ranges = <&pinctrl 0 64 16>;
> +			};
> +
> +			gpiof: gpio@50007000 {
> +				status = "okay";
> +				ngpios = <16>;
> +				gpio-ranges = <&pinctrl 0 80 16>;
> +			};
> +
> +			gpiog: gpio@50008000 {
> +				status = "okay";
> +				ngpios = <16>;
> +				gpio-ranges = <&pinctrl 0 96 16>;
> +			};
> +
> +			gpioh: gpio@50009000 {
> +				status = "okay";
> +				ngpios = <16>;
> +				gpio-ranges = <&pinctrl 0 112 16>;
> +			};
> +
> +			gpioi: gpio@5000a000 {
> +				status = "okay";
> +				ngpios = <16>;
> +				gpio-ranges = <&pinctrl 0 128 16>;
> +			};
> +
> +			gpioj: gpio@5000b000 {
> +				status = "okay";
> +				ngpios = <16>;
> +				gpio-ranges = <&pinctrl 0 144 16>;
> +			};
> +
> +			gpiok: gpio@5000c000 {
> +				status = "okay";
> +				ngpios = <8>;
> +				gpio-ranges = <&pinctrl 0 160 8>;
> +			};
> +		};
> +
> +		pinctrl_z: pin-controller-z@54004000 {
> +			st,package = <STM32MP_PKG_AA>;
> +
> +			gpioz: gpio@54004000 {
> +				status = "okay";
> +				ngpios = <8>;
> +				gpio-ranges = <&pinctrl_z 0 400 8>;
> +			};
> +		};
> +	};
> +};
> diff --git a/arch/arm/boot/dts/stm32mp157xab-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp157xab-pinctrl.dtsi
> new file mode 100644
> index 0000000..961fa12
> --- /dev/null
> +++ b/arch/arm/boot/dts/stm32mp157xab-pinctrl.dtsi
> @@ -0,0 +1,62 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> +/*
> + * Copyright (C) STMicroelectronics 2019 - All Rights Reserved
> + * Author: Alexandre Torgue <alexandre.torgue@st.com>
> + */
> +
> +#include "stm32mp157-pinctrl.dtsi"
> +/ {
> +	soc {
> +		pinctrl: pin-controller@50002000 {
> +			st,package = <STM32MP_PKG_AB>;
> +
> +			gpioa: gpio@50002000 {
> +				status = "okay";
> +				ngpios = <16>;
> +				gpio-ranges = <&pinctrl 0 0 16>;
> +			};
> +
> +			gpiob: gpio@50003000 {
> +				status = "okay";
> +				ngpios = <16>;
> +				gpio-ranges = <&pinctrl 0 16 16>;
> +			};
> +
> +			gpioc: gpio@50004000 {
> +				status = "okay";
> +				ngpios = <16>;
> +				gpio-ranges = <&pinctrl 0 32 16>;
> +			};
> +
> +			gpiod: gpio@50005000 {
> +				status = "okay";
> +				ngpios = <16>;
> +				gpio-ranges = <&pinctrl 0 48 16>;
> +			};
> +
> +			gpioe: gpio@50006000 {
> +				status = "okay";
> +				ngpios = <16>;
> +				gpio-ranges = <&pinctrl 0 64 16>;
> +			};
> +
> +			gpiof: gpio@50007000 {
> +				status = "okay";
> +				ngpios = <6>;
> +				gpio-ranges = <&pinctrl 6 86 6>;
> +			};
> +
> +			gpiog: gpio@50008000 {
> +				status = "okay";
> +				ngpios = <10>;
> +				gpio-ranges = <&pinctrl 6 102 10>;
> +			};
> +
> +			gpioh: gpio@50009000 {
> +				status = "okay";
> +				ngpios = <2>;
> +				gpio-ranges = <&pinctrl 0 112 2>;
> +			};
> +		};
> +	};
> +};
> diff --git a/arch/arm/boot/dts/stm32mp157xac-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp157xac-pinctrl.dtsi
> new file mode 100644
> index 0000000..26600f1
> --- /dev/null
> +++ b/arch/arm/boot/dts/stm32mp157xac-pinctrl.dtsi
> @@ -0,0 +1,78 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> +/*
> + * Copyright (C) STMicroelectronics 2019 - All Rights Reserved
> + * Author: Alexandre Torgue <alexandre.torgue@st.com>
> + */
> +
> +#include "stm32mp157-pinctrl.dtsi"
> +/ {
> +	soc {
> +		pinctrl: pin-controller@50002000 {
> +			st,package = <STM32MP_PKG_AC>;
> +
> +			gpioa: gpio@50002000 {
> +				status = "okay";
> +				ngpios = <16>;
> +				gpio-ranges = <&pinctrl 0 0 16>;
> +			};
> +
> +			gpiob: gpio@50003000 {
> +				status = "okay";
> +				ngpios = <16>;
> +				gpio-ranges = <&pinctrl 0 16 16>;
> +			};
> +
> +			gpioc: gpio@50004000 {
> +				status = "okay";
> +				ngpios = <16>;
> +				gpio-ranges = <&pinctrl 0 32 16>;
> +			};
> +
> +			gpiod: gpio@50005000 {
> +				status = "okay";
> +				ngpios = <16>;
> +				gpio-ranges = <&pinctrl 0 48 16>;
> +			};
> +
> +			gpioe: gpio@50006000 {
> +				status = "okay";
> +				ngpios = <16>;
> +				gpio-ranges = <&pinctrl 0 64 16>;
> +			};
> +
> +			gpiof: gpio@50007000 {
> +				status = "okay";
> +				ngpios = <16>;
> +				gpio-ranges = <&pinctrl 0 80 16>;
> +			};
> +
> +			gpiog: gpio@50008000 {
> +				status = "okay";
> +				ngpios = <16>;
> +				gpio-ranges = <&pinctrl 0 96 16>;
> +			};
> +
> +			gpioh: gpio@50009000 {
> +				status = "okay";
> +				ngpios = <16>;
> +				gpio-ranges = <&pinctrl 0 112 16>;
> +			};
> +
> +			gpioi: gpio@5000a000 {
> +				status = "okay";
> +				ngpios = <12>;
> +				gpio-ranges = <&pinctrl 0 128 12>;
> +			};
> +		};
> +
> +		pinctrl_z: pin-controller-z@54004000 {
> +			st,package = <STM32MP_PKG_AC>;
> +
> +			gpioz: gpio@54004000 {
> +				status = "okay";
> +				ngpios = <8>;
> +				gpio-ranges = <&pinctrl_z 0 400 8>;
> +			};
> +		};
> +	};
> +};
> diff --git a/arch/arm/boot/dts/stm32mp157xad-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp157xad-pinctrl.dtsi
> new file mode 100644
> index 0000000..910113f
> --- /dev/null
> +++ b/arch/arm/boot/dts/stm32mp157xad-pinctrl.dtsi
> @@ -0,0 +1,62 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> +/*
> + * Copyright (C) STMicroelectronics 2019 - All Rights Reserved
> + * Author: Alexandre Torgue <alexandre.torgue@st.com>
> + */
> +
> +#include "stm32mp157-pinctrl.dtsi"
> +/ {
> +	soc {
> +		pinctrl: pin-controller@50002000 {
> +			st,package = <STM32MP_PKG_AD>;
> +
> +			gpioa: gpio@50002000 {
> +				status = "okay";
> +				ngpios = <16>;
> +				gpio-ranges = <&pinctrl 0 0 16>;
> +			};
> +
> +			gpiob: gpio@50003000 {
> +				status = "okay";
> +				ngpios = <16>;
> +				gpio-ranges = <&pinctrl 0 16 16>;
> +			};
> +
> +			gpioc: gpio@50004000 {
> +				status = "okay";
> +				ngpios = <16>;
> +				gpio-ranges = <&pinctrl 0 32 16>;
> +			};
> +
> +			gpiod: gpio@50005000 {
> +				status = "okay";
> +				ngpios = <16>;
> +				gpio-ranges = <&pinctrl 0 48 16>;
> +			};
> +
> +			gpioe: gpio@50006000 {
> +				status = "okay";
> +				ngpios = <16>;
> +				gpio-ranges = <&pinctrl 0 64 16>;
> +			};
> +
> +			gpiof: gpio@50007000 {
> +				status = "okay";
> +				ngpios = <6>;
> +				gpio-ranges = <&pinctrl 6 86 6>;
> +			};
> +
> +			gpiog: gpio@50008000 {
> +				status = "okay";
> +				ngpios = <10>;
> +				gpio-ranges = <&pinctrl 6 102 10>;
> +			};
> +
> +			gpioh: gpio@50009000 {
> +				status = "okay";
> +				ngpios = <2>;
> +				gpio-ranges = <&pinctrl 0 112 2>;
> +			};
> +		};
> +	};
> +};
> 
