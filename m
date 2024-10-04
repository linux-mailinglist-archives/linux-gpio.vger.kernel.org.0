Return-Path: <linux-gpio+bounces-10834-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB57990203
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2024 13:22:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 49715B20909
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2024 11:22:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C254157487;
	Fri,  4 Oct 2024 11:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="aMGeT2j7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DEC5137903;
	Fri,  4 Oct 2024 11:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728040965; cv=none; b=js3x4X7wOru1tcKdBclqxOw/fdVo57zM1yIkt7pW75NOLSxSQ/y5ALi/TsTd9EbVtmM8oipj6nzgj2k+Xtv/tz1eb36R2GhnXr4mLC9IrZ75/GwoAb2aCFvRj+SFaOahB6JJZ8RgdmnWfobMPCRdoVoSj7Wxuxu6y/2btFjDLqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728040965; c=relaxed/simple;
	bh=JuzY7QcYQMFTsKFhb6M6Epx2VLSYGJ5bXpDgThfuniw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Ut5ba3jkN+IFrFMc5SNxBeNeyDkuDvy4NbBzRoKaUa1CbO3xBooQp6tYhhIdHv+eX7X06JEhk1Htgi5G7pht68G44+HsZDgnpq+96yG30x/HyCQqED8Z1GbzmBZFxxSR6o/3R+xRPh1M9d2n36eh3FOxxcGjjWg4EwBGRhe/UdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=aMGeT2j7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 494B4ZvR019120;
	Fri, 4 Oct 2024 11:22:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0DfXXY9TOZZaA/uIw9ViWZGEVxfNaqj4IRcafnRdJVQ=; b=aMGeT2j7m6oL1xTa
	7SvPwTStGHDLVsOALOdm1kdNu3POu03P9rF6fgxvcmZmi08XBS1yoRZpRGfltfKB
	kL6Bng1CbbobZymGie9Kv73uTurWPIl79CCfzCVj3FXRMwYg/7HaXKlEv5Cyip3A
	e6YzpjFrzX83JPGlLYf8kg0rE5QGgU5bUl0C0oVeXRPAtmsCPYOEu1AdMMmMnHM0
	4wjmnvwRmDiYqADn7jFwb9Wjfx3UKhXMDQ5KDx2dYaF80YpgvnEJ1OQIE3RvvzjM
	r5ojl0fWx1tgxLI21rBXw+N2X732+WN9QHqY+ArKmKU+/tTlLYuxjBQH1B1jLfkR
	Ii6YLQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42205n1wsv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Oct 2024 11:22:28 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 494BMQRZ008219
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 4 Oct 2024 11:22:26 GMT
Received: from [10.151.37.217] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 4 Oct 2024
 04:22:19 -0700
Message-ID: <1ac5e0e5-06c1-4930-8c03-f465d6e07848@quicinc.com>
Date: Fri, 4 Oct 2024 16:51:57 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 4/7] clk: qcom: add Global Clock controller (GCC)
 driver for IPQ5424 SoC
To: Sricharan R <quic_srichara@quicinc.com>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <ulf.hansson@linaro.org>, <linus.walleij@linaro.org>,
        <catalin.marinas@arm.com>, <p.zabel@pengutronix.de>,
        <geert+renesas@glider.be>, <dmitry.baryshkov@linaro.org>,
        <neil.armstrong@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <quic_varada@quicinc.com>
References: <20241004102342.2414317-1-quic_srichara@quicinc.com>
 <20241004102342.2414317-5-quic_srichara@quicinc.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>
In-Reply-To: <20241004102342.2414317-5-quic_srichara@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: V8UXvjLB4DwVVK88mDCfD3_3xjLk1YGv
X-Proofpoint-GUID: V8UXvjLB4DwVVK88mDCfD3_3xjLk1YGv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 adultscore=0
 clxscore=1011 bulkscore=0 malwarescore=0 phishscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410040083



On 10/4/2024 3:53 PM, Sricharan R wrote:
> From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> 
> Add support for the global clock controller found on IPQ5424 SoC.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Co-developed-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> ---
>   [V3] Added Reviewed tag
> 
>   drivers/clk/qcom/Kconfig       |    8 +
>   drivers/clk/qcom/Makefile      |    1 +
>   drivers/clk/qcom/gcc-ipq5424.c | 3309 ++++++++++++++++++++++++++++++++
>   3 files changed, 3318 insertions(+)
>   create mode 100644 drivers/clk/qcom/gcc-ipq5424.c
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index a3e2a09e2105..6a576bc2301c 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -213,6 +213,14 @@ config IPQ_GCC_5332
>   	  Say Y if you want to use peripheral devices such as UART, SPI,
>   	  i2c, USB, SD/eMMC, etc.
>   
> +config IPQ_GCC_5424
> +	tristate "IPQ5424 Global Clock Controller"
> +	depends on ARM64 || COMPILE_TEST
> +	help
> +	  Support for the global clock controller on ipq5424 devices.
> +	  Say Y if you want to use peripheral devices such as UART, SPI,
> +	  i2c, USB, SD/eMMC, etc.
> +
>   config IPQ_GCC_6018
>   	tristate "IPQ6018 Global Clock Controller"
>   	help
> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
> index 2b378667a63f..d58ba0f9a482 100644
> --- a/drivers/clk/qcom/Makefile
> +++ b/drivers/clk/qcom/Makefile
> @@ -32,6 +32,7 @@ obj-$(CONFIG_IPQ_APSS_6018) += apss-ipq6018.o
>   obj-$(CONFIG_IPQ_GCC_4019) += gcc-ipq4019.o
>   obj-$(CONFIG_IPQ_GCC_5018) += gcc-ipq5018.o
>   obj-$(CONFIG_IPQ_GCC_5332) += gcc-ipq5332.o
> +obj-$(CONFIG_IPQ_GCC_5424) += gcc-ipq5424.o
>   obj-$(CONFIG_IPQ_GCC_6018) += gcc-ipq6018.o
>   obj-$(CONFIG_IPQ_GCC_806X) += gcc-ipq806x.o
>   obj-$(CONFIG_IPQ_GCC_8074) += gcc-ipq8074.o
> diff --git a/drivers/clk/qcom/gcc-ipq5424.c b/drivers/clk/qcom/gcc-ipq5424.c
> new file mode 100644
> index 000000000000..3458c1c98bb7
> --- /dev/null
> +++ b/drivers/clk/qcom/gcc-ipq5424.c
> @@ -0,0 +1,3309 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2018,2020 The Linux Foundation. All rights reserved.
> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +#include <dt-bindings/clock/qcom,ipq5424-gcc.h>
> +#include <dt-bindings/reset/qcom,ipq5424-gcc.h>
> +
> +#include "clk-alpha-pll.h"
> +#include "clk-branch.h"
> +#include "clk-rcg.h"
> +#include "clk-regmap.h"
> +#include "clk-regmap-divider.h"
> +#include "clk-regmap-mux.h"
> +#include "clk-regmap-phy-mux.h"
> +#include "common.h"
> +#include "reset.h"
> +
> +enum {
> +	DT_XO,
> +	DT_SLEEP_CLK,
> +	DT_PCIE30_PHY0_PIPE_CLK,
> +	DT_PCIE30_PHY1_PIPE_CLK,
> +	DT_PCIE30_PHY2_PIPE_CLK,
> +	DT_PCIE30_PHY3_PIPE_CLK,
> +	DT_USB_PCIE_WRAPPER_PIPE_CLK,
> +};
> +
> +enum {
> +	P_GCC_GPLL0_OUT_MAIN_DIV_CLK_SRC,
> +	P_GPLL0_OUT_AUX,
> +	P_GPLL0_OUT_MAIN,
> +	P_GPLL2_OUT_AUX,
> +	P_GPLL2_OUT_MAIN,
> +	P_GPLL4_OUT_AUX,
> +	P_GPLL4_OUT_MAIN,
> +	P_SLEEP_CLK,
> +	P_XO,
> +	P_USB3PHY_0_PIPE,
> +};
> +


<snip>

> +
> +static const struct freq_tbl ftbl_gcc_qupv3_uart0_clk_src[] = {
> +	F(960000, P_XO, 10, 2, 5),
> +	F(4800000, P_XO, 5, 0, 0),
> +	F(9600000, P_XO, 2, 4, 5),
> +	F(16000000, P_GPLL0_OUT_MAIN, 10, 1, 5),
> +	F(24000000, P_XO, 1, 0, 0),
> +	F(25000000, P_GPLL0_OUT_MAIN, 16, 1, 2),
> +	F(50000000, P_GPLL0_OUT_MAIN, 16, 0, 0),
> +	F(64000000, P_GPLL0_OUT_MAIN, 12.5, 0, 0),
> +	{ }
> +};
> +

There are few more frequencies got added to this table. Can we 
incorporate that as well?

Thanks, Kathiravan T.

