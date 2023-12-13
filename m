Return-Path: <linux-gpio+bounces-1398-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 84FD8811A3A
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 18:00:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BBA961C2120F
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 17:00:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F9FA3A8C4;
	Wed, 13 Dec 2023 16:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="jbv6KQtZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA6B5EA;
	Wed, 13 Dec 2023 08:59:52 -0800 (PST)
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20231213165950epoutp01b110eb4e2939a8f4e887d97f490ec30d~gcrdENLmY2597125971epoutp01E;
	Wed, 13 Dec 2023 16:59:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20231213165950epoutp01b110eb4e2939a8f4e887d97f490ec30d~gcrdENLmY2597125971epoutp01E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1702486790;
	bh=d1P9fWCrpZA9GKdYIUHFi/3vlYR+11N04hqaneTRS7c=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=jbv6KQtZHs2O5pNge91bEuqpQ/q7aYKwT700yjrDutZZsg9PYToD/q+/0GZiO+r4o
	 eV7oo10uJIgI5uuio3pdtme9OMgC/x6DMjTEYTDjqW2YT/flpXXbo/795cIb32RsZh
	 h1PQEWhM5s7tbbWJO0Ybn2caafjLG0h6Pqv0tMsA=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTP id
	20231213165949epcas5p2d33be29db8698d42fa2aa0b55d30a9f3~gcrcgeJXv0076600766epcas5p2c;
	Wed, 13 Dec 2023 16:59:49 +0000 (GMT)
Received: from epsmges5p3new.samsung.com (unknown [182.195.38.176]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4Sr1tX2rMdz4x9Pt; Wed, 13 Dec
	2023 16:59:48 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
	epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
	2C.C3.09672.403E9756; Thu, 14 Dec 2023 01:59:48 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20231213165947epcas5p2ea8a715b68d03d788e6c96c1e2a0153a~gcraLo9dV1505615056epcas5p2s;
	Wed, 13 Dec 2023 16:59:47 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20231213165947epsmtrp1119415af4c01f9b8da7bba5adc0f6c83~gcraKD_Ut2889328893epsmtrp14;
	Wed, 13 Dec 2023 16:59:47 +0000 (GMT)
X-AuditID: b6c32a4b-60bfd700000025c8-62-6579e30476f9
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	02.66.07368.303E9756; Thu, 14 Dec 2023 01:59:47 +0900 (KST)
Received: from INBRO000447 (unknown [107.122.12.5]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20231213165943epsmtip2b97c5865caab5215e212efc678a16a3b~gcrWDQbBQ0136401364epsmtip2G;
	Wed, 13 Dec 2023 16:59:42 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Peter Griffin'" <peter.griffin@linaro.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <mturquette@baylibre.com>,
	<conor+dt@kernel.org>, <sboyd@kernel.org>, <tomasz.figa@gmail.com>,
	<s.nawrocki@samsung.com>, <linus.walleij@linaro.org>,
	<wim@linux-watchdog.org>, <linux@roeck-us.net>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <arnd@arndb.de>, <olof@lixom.net>,
	<gregkh@linuxfoundation.org>, <jirislaby@kernel.org>,
	<cw00.choi@samsung.com>
Cc: <tudor.ambarus@linaro.org>, <andre.draszik@linaro.org>,
	<semen.protsenko@linaro.org>, <saravanak@google.com>,
	<willmcvicker@google.com>, <soc@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<linux-watchdog@vger.kernel.org>, <kernel-team@android.com>,
	<linux-serial@vger.kernel.org>
In-Reply-To: <20231211162331.435900-16-peter.griffin@linaro.org>
Subject: RE: [PATCH v7 15/16] arm64: dts: exynos: google: Add initial
 Oriole/pixel 6 board support
Date: Wed, 13 Dec 2023 22:29:41 +0530
Message-ID: <018d01da2de5$c7153ef0$553fbcd0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-us
Thread-Index: AQEeDlMUs+qnFg95EVUf+Z9FZqMuEwDnnW+uAJFCo7eyE+eYwA==
X-Brightmail-Tracker: H4sIAAAAAAAAA01Ta1ATVxTuZjfZQCeyBpRLsBIyYxVakFTASweqrWi3I7VIZzotHUszZCUU
	SGISitBO5S1EiIKMoxkQMAojRqCBIo+CEBANUiytAlLE8hKRhzxaKAGxCcGWf9859/vOOd+5
	c5gouwnnMMPFCkomFkTyGNZYVbOLixs2FEt56AcJWPmsAoMvsltx+LwoA4Ha+g4a7P5rlA7z
	WzroMElTxoBTeVtg9Q07qHo6gMKc5WIa1A110eFMRj8dVuQvI/D8vQYabNdk4rCntAGHw4Xt
	NNjZth+2dc8xYPn5FQym1LfgsHniJB0q9S8YcKXrRwyOqkyqoe5lBiypNRWZ7f0KJvd5wZLZ
	lwgcGltB93LJqroqOqm9qEXIJWM2Qj7vScHJGvUjnCzQRZO6knQG2df1M4O8qtXSyZt5Wpys
	uHyCvH8nkU7WLMTjpKqyBCHndFsDbYIjfEWUQEjJuJQ4VCIMF4f58Q5+GrIvxMvbg+/G94G7
	eVyxIIry4/kHBLodCI80rYvH/VYQGW1KBQrkct7O93xlkmgFxRVJ5Ao/HiUVRko9pe5yQZQ8
	WhzmLqYU7/I9PN7xMhG/jhCdPnsJk5a7Hi9JnEHjkXmeErFiAsIT9E2epCkRayabqENAzpXl
	tWAWAT1Td1BLMI+AFaMReSXJmr+HWB7qTazZzLXgKQJ+H8xjmFkMwg1Ua1JXsR3Rj4LujvfN
	JJTQomDxZZ+pLpNpRewFt6YoM8eWEIKKdv1qB4zYBgyqGroZswgfUHVOi1vwRmC4MIyZMUo4
	gRuTuahlIi5YHCmiW/L2YOxWC24ub0d8ANJHVh0AQmUNNAv5dAvfH6RPDuAWbAue3a5cwxww
	djp1VQsIElxa5ljSIjBZXLZmfg9ovJ+LmSko4QLKandaum4AmUvDNIuSBdJS2Rb2NpA09QCz
	YEeQderU2gAkSG8tZZxBnNXrfKnX+VKv86L+v1kBgpUgDpRUHhVGyb2ku8RUzH/fHSqJ0iGr
	t+R6sBoZ/HPaXY/QmIgeAUyUZ8cyVMdQbJZQEBtHySQhsuhISq5HvEzLzkI5m0IlpmMUK0L4
	nj4ent7e3p4+u7z5PHvWeEqekE2ECRRUBEVJKdkrHY1pxYmnbQo9VPj9tKo0K8uALUwEP4hQ
	Pjr8sUam/E0zK5vb8NaRPYZWh+u3Pa4FJOMFhp9cBx6+8eSzHU5xv4rKQ3SHbWNJx6b+v5lL
	x5ysw9VLotxyOHd98xdXMn27Lo4rl26WOrfZ1tTs31GN9tlVbPY9BDs7yyL+yF1s1/mrdus/
	ZL191e/oa9I0ljGhNuExTODiMcUjXkryy7gzQYH7GvxXMp7ctS+se9xshDYPlY3CT1odx6/9
	MHohLYj9+RHn9G+Ck3/p9W4+cXe669y0eEucP4evitxYtX2G3vTRP0FFVdkHtgaIh7c3X35z
	4LvAxuMTcw5HXTTpwza0XknSsVBjmTQn8XUBD5OLBHxXVCYX/AtWBi2V1AQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrFKsWRmVeSWpSXmKPExsWy7bCSvC7z48pUg1ubRS22vNrMYvF30jF2
	i/fLehgt1uw9x2Rx/ctzVov5R86xWjQvXs9m8W6ujMWO7SIWfS8eMltM+bOcyWLT42usFh97
	7rFabJ7/h9Fixvl9TBZnFveyW9xYt4/d4snCM0wWF0+5Wpy6/pnNYsOMfywWrXuPsFscftPO
	atF16C+bxb9rG1ksnvcBdT2+/ofNYtUuoCGfbsVZtNwxtVj16T+jxeOX/5gdFDy27d7G6rFm
	3hpGj9+/JjF6vL/Ryu6xc9Zddo8Fm0o9Nq3qZPO4c20Pm8fKNWtYPfbPXcPusXlJvceVE02s
	Hju/N7B79G1ZxejxeZNcAH8Ul01Kak5mWWqRvl0CV0b/5EUsBRu0KlY1fWRuYPym1MXIySEh
	YCIx8dt5xi5GLg4hgd2MEu3/uxghEtIS1zdOYIewhSVW/nvODlH0jFFi5r3nYEVsAroSOxa3
	sYEkRAQ+MUus/n8DzGEW2MUsca6hjRWi5QijxJKJHUAZDg5OAQeJo+9SQbqFBZIkDv77ywxi
	swioSpzs28kKYvMKWEpsm7aGHcIWlDg58wkLSCuzgJ5E20awxcwC8hLb385hhrhOQeLn02Ws
	EHFxiZdHj7CDlIsIOEl0PmWewCg8C8mgWQiDZiEZNAtJ8wJGllWMkqkFxbnpucmGBYZ5qeV6
	xYm5xaV56XrJ+bmbGMHJSUtjB+O9+f/0DjEycTAeYpTgYFYS4T25ozxViDclsbIqtSg/vqg0
	J7X4EKM0B4uSOK/hjNkpQgLpiSWp2ampBalFMFkmDk6pBia/fw1Ooc/v7uB8K1m2cIvbTYMq
	ffWO0Cr9iQvPXW5revXCoJCLTeb5Ws5vq2rDj88RfGL+7orWk+i90Z0M1k5vJ8UYbGh1VExJ
	2H+ns18446r/6wBrA6tGDslbpwJ39goITV9hdmmR8LX39it7w/T+LA29HJz87oWQg6oNY0Ns
	wtvbCS3aWyfWbL6czCoQ4cyzMvoMS+/G0qTNujOqL7jqz3YOW6xW+2x6f/n6iaeMONY+eT+1
	Z5GRRfEW20gO83+dbvNcVhq+nhwr8HDfzSVKsVJWz1t2Kxzez+R7ZcXSKP41HH/m3Tz1YI+h
	0VWtNO++9gKJvYdi/Hft7rBS03/+9J5S8zuns5nFz43VG5VYijMSDbWYi4oTAdIRjHe9AwAA
X-CMS-MailID: 20231213165947epcas5p2ea8a715b68d03d788e6c96c1e2a0153a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20231211162439epcas5p208ddd651650cb5e8de3e8f411db7663d
References: <20231211162331.435900-1-peter.griffin@linaro.org>
	<CGME20231211162439epcas5p208ddd651650cb5e8de3e8f411db7663d@epcas5p2.samsung.com>
	<20231211162331.435900-16-peter.griffin@linaro.org>



> -----Original Message-----
> From: Peter Griffin <peter.griffin@linaro.org>
> Sent: Monday, December 11, 2023 9:54 PM
> To: robh+dt@kernel.org; krzysztof.kozlowski+dt@linaro.org;
> mturquette@baylibre.com; conor+dt@kernel.org; sboyd@kernel.org;
> tomasz.figa@gmail.com; s.nawrocki@samsung.com; linus.walleij@linaro.org;
> wim@linux-watchdog.org; linux@roeck-us.net; catalin.marinas@arm.com;
> will@kernel.org; arnd@arndb.de; olof@lixom.net;
> gregkh@linuxfoundation.org; jirislaby@kernel.org;
> cw00.choi@samsung.com; alim.akhtar@samsung.com
> Cc: peter.griffin@linaro.org; tudor.ambarus@linaro.org;
> andre.draszik@linaro.org; semen.protsenko@linaro.org;
> saravanak@google.com; willmcvicker@google.com; soc@kernel.org;
> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> samsung-soc@vger.kernel.org; linux-clk@vger.kernel.org; linux-
> gpio@vger.kernel.org; linux-watchdog@vger.kernel.org; kernel-
> team@android.com; linux-serial@vger.kernel.org
> Subject: [PATCH v7 15/16] arm64: dts: exynos: google: Add initial
Oriole/pixel
> 6 board support
> 
> Add initial board support for the Pixel 6 phone code named Oriole. This
has
> been tested with a minimal busybox initramfs and boots to a shell.
> 
> Tested-by: Will McVicker <willmcvicker@google.com>
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>

>  arch/arm64/boot/dts/exynos/Makefile           |   2 +
>  arch/arm64/boot/dts/exynos/google/Makefile    |   4 +
>  .../boot/dts/exynos/google/gs101-oriole.dts   | 105 ++++++++++++++++++
>  3 files changed, 111 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/exynos/google/Makefile
>  create mode 100644 arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
> 
> diff --git a/arch/arm64/boot/dts/exynos/Makefile
> b/arch/arm64/boot/dts/exynos/Makefile
> index 6e4ba69268e5..44c24a8ad9e1 100644
> --- a/arch/arm64/boot/dts/exynos/Makefile
> +++ b/arch/arm64/boot/dts/exynos/Makefile
> @@ -1,4 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
> +subdir-y += google
> +
>  dtb-$(CONFIG_ARCH_EXYNOS) += \
>  	exynos5433-tm2.dtb		\
>  	exynos5433-tm2e.dtb		\
> diff --git a/arch/arm64/boot/dts/exynos/google/Makefile
> b/arch/arm64/boot/dts/exynos/google/Makefile
> new file mode 100644
> index 000000000000..0a6d5e1fe4ee
> --- /dev/null
> +++ b/arch/arm64/boot/dts/exynos/google/Makefile
> @@ -0,0 +1,4 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +dtb-$(CONFIG_ARCH_EXYNOS) += \
> +	gs101-oriole.dtb \
> diff --git a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
> b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
> new file mode 100644
> index 000000000000..4a71f752200d
> --- /dev/null
> +++ b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
> @@ -0,0 +1,105 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Oriole Device Tree
> + *
> + * Copyright 2021-2023 Google LLC
> + * Copyright 2023 Linaro Ltd - <peter.griffin@linaro.org>  */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include "gs101-pinctrl.h"
> +#include "gs101.dtsi"
> +
> +/ {
> +	model = "Oriole";
> +	compatible = "google,gs101-oriole", "google,gs101";
> +
> +	aliases {
> +		serial0 = &serial_0;
> +	};
> +
> +	chosen {
> +		/* Bootloader expects bootargs specified otherwise it
> crashes */
> +		bootargs = "";
> +		stdout-path = &serial_0;
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&key_voldown>, <&key_volup>,
> <&key_power>;
> +
> +		button-vol-down {
> +			label = "KEY_VOLUMEDOWN";
> +			linux,code = <KEY_VOLUMEDOWN>;
> +			gpios = <&gpa7 3 GPIO_ACTIVE_LOW>;
> +			wakeup-source;
> +		};
> +
> +		button-vol-up {
> +			label = "KEY_VOLUMEUP";
> +			linux,code = <KEY_VOLUMEUP>;
> +			gpios = <&gpa8 1 GPIO_ACTIVE_LOW>;
> +			wakeup-source;
> +		};
> +
> +		button-power {
> +			label = "KEY_POWER";
> +			linux,code = <KEY_POWER>;
> +			gpios = <&gpa10 1 GPIO_ACTIVE_LOW>;
> +			wakeup-source;
> +		};
> +	};
> +};
> +
> +&ext_24_5m {
> +	clock-frequency = <24576000>;
> +};
> +
> +&ext_200m {
> +	clock-frequency = <200000000>;
> +};
> +
> +&pinctrl_far_alive {
> +	key_voldown: key-voldown-pins {
> +		samsung,pins = "gpa7-3";
> +		samsung,pin-function = <GS101_PIN_FUNC_EINT>;
> +		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
> +		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
> +	};
> +
> +	key_volup: key-volup-pins {
> +		samsung,pins = "gpa8-1";
> +		samsung,pin-function = <GS101_PIN_FUNC_EINT>;
> +		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
> +		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
> +	};
> +};
> +
> +&pinctrl_gpio_alive {
> +	key_power: key-power-pins {
> +		samsung,pins = "gpa10-1";
> +		samsung,pin-function = <GS101_PIN_FUNC_EINT>;
> +		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
> +		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
> +	};
> +};
> +
> +&serial_0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&uart0_bus>;
> +	status = "okay";
> +};
> +
> +&usi_uart {
> +	samsung,clkreq-on; /* needed for UART mode */
> +	status = "okay";
> +};
> +
> +&watchdog_cl0 {
> +	timeout-sec = <30>;
> +	status = "okay";
> +};
> --
> 2.43.0.472.g3155946c3a-goog



