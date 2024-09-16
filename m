Return-Path: <linux-gpio+bounces-10184-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5127979C49
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Sep 2024 09:51:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 146E1B22715
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Sep 2024 07:51:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C21EC13C8F3;
	Mon, 16 Sep 2024 07:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LxF5/PLI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C191339B1;
	Mon, 16 Sep 2024 07:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726473065; cv=none; b=XKrAP/GfDmc5S6mdVahGmMxTzrsO9i9wmSfo7feVBMxhjmEGodG+HApNNTahFsYgnGaCWQPasl8ljJlDxv9NIwJ8L0pZwPxC+XIFLaqLQXvPtUviLb3H3FCoi3vDWEFUMvWO9j0QeOf5M0NJJW5emx7aKEMjh46Rkfhdh4xPx7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726473065; c=relaxed/simple;
	bh=Z9uIWG2PKf2KyhsARs6C+a8hCyFUNF7z+oDNfDWyUlI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=X30wxTdhmpOySvugy7czh9QD45L9AVgwds0DhSqTZTBB2bwOVaVwgEITid+Lykq6nAzR/pQ+8apLiFyLVxheAVY/tFJ5EOGN9GRZcMKRP4UsKe9iAz+ZIHKY1gJBX3YjvlYfMXqHaiOg4gkLhaFD31OdU2/YY7faH0+bLwYzywA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LxF5/PLI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48FNmwBA024426;
	Mon, 16 Sep 2024 07:50:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gBgmFYIDtjCkjwPRAQZ3OnNLyodUiCbqaDvzxqA+Jog=; b=LxF5/PLIqnNscV1V
	h5fsKk2lNKyAB+/1ODBuwJa29nB1U10CeqfixNcxascuUhmI7KAzaphLLU43jtBb
	4MENoySc0b7apl5JuzSo5LADUyYXKsptKy64B/iMkCXPBDEK6yzUcjY5hb35QWip
	4NcICcQYFSvDSWYREEpsvvlsb/sFdRV8OwZBTb7/D3f+zbwIgyoGWpKj7O7el10e
	PFVF2OT7fhJrZakDFjJkkRTJCQ8IY22EX/rZ2ROVA1glSOAMfPF0h+i6qQiI16ww
	vaDQpJJzet2nDxk94/4iu/Adr+uZA0LXvTkTSjmTTCMDY8nxVuu848nJiD2UnfNU
	bSJ4Zg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4gcu60a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Sep 2024 07:50:34 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48G7oXGF012618
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Sep 2024 07:50:33 GMT
Received: from [10.151.37.100] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 16 Sep
 2024 00:50:27 -0700
Message-ID: <f9126534-3a46-4d01-9026-58e0b65c08d2@quicinc.com>
Date: Mon, 16 Sep 2024 13:20:24 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] clk: qcom: add Global Clock controller (GCC) driver
 for IPQ5424 SoC
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <mturquette@baylibre.com>,
        <sboyd@kernel.org>, <ulf.hansson@linaro.org>,
        <linus.walleij@linaro.org>, <catalin.marinas@arm.com>,
        <p.zabel@pengutronix.de>, <geert+renesas@glider.be>,
        <neil.armstrong@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <quic_varada@quicinc.com>
References: <20240913121250.2995351-1-quic_srichara@quicinc.com>
 <20240913121250.2995351-6-quic_srichara@quicinc.com>
 <glkvcne5eius5l7dro7gzd7hyztc6vc4eekcbbxz6c4wwolwqy@aoj66qbrxezg>
Content-Language: en-US
From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
In-Reply-To: <glkvcne5eius5l7dro7gzd7hyztc6vc4eekcbbxz6c4wwolwqy@aoj66qbrxezg>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: lGQJOmdExYP4olx6XnTSFvayGnhWWGDd
X-Proofpoint-GUID: lGQJOmdExYP4olx6XnTSFvayGnhWWGDd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 bulkscore=0 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=999 impostorscore=0 mlxscore=0 priorityscore=1501 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409160048



On 9/13/2024 6:16 PM, Dmitry Baryshkov wrote:
> On Fri, Sep 13, 2024 at 05:42:47PM GMT, Sricharan R wrote:
>> From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
>>
>> Add support for the global clock controller found on IPQ5424 SoC.
>>
>> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
>> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> 
> Same comment regarding tags.
> 
ok
>> ---
>>   drivers/clk/qcom/Kconfig       |    7 +
>>   drivers/clk/qcom/Makefile      |    1 +
>>   drivers/clk/qcom/gcc-ipq5424.c | 3333 ++++++++++++++++++++++++++++++++
>>   3 files changed, 3341 insertions(+)
>>   create mode 100644 drivers/clk/qcom/gcc-ipq5424.c
>>
>> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
>> index a3e2a09e2105..c41e3318c2a7 100644
>> --- a/drivers/clk/qcom/Kconfig
>> +++ b/drivers/clk/qcom/Kconfig
>> @@ -213,6 +213,13 @@ config IPQ_GCC_5332
>>   	  Say Y if you want to use peripheral devices such as UART, SPI,
>>   	  i2c, USB, SD/eMMC, etc.
>>   
>> +config IPQ_GCC_5424
>> +	tristate "IPQ5424 Global Clock Controller"
>> +	help
>> +	  Support for the global clock controller on ipq5424 devices.
>> +	  Say Y if you want to use peripheral devices such as UART, SPI,
>> +	  i2c, USB, SD/eMMC, etc.
>> +
>>   config IPQ_GCC_6018
>>   	tristate "IPQ6018 Global Clock Controller"
>>   	help
>> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
>> index 2b378667a63f..d58ba0f9a482 100644
>> --- a/drivers/clk/qcom/Makefile
>> +++ b/drivers/clk/qcom/Makefile
>> @@ -32,6 +32,7 @@ obj-$(CONFIG_IPQ_APSS_6018) += apss-ipq6018.o
>>   obj-$(CONFIG_IPQ_GCC_4019) += gcc-ipq4019.o
>>   obj-$(CONFIG_IPQ_GCC_5018) += gcc-ipq5018.o
>>   obj-$(CONFIG_IPQ_GCC_5332) += gcc-ipq5332.o
>> +obj-$(CONFIG_IPQ_GCC_5424) += gcc-ipq5424.o
>>   obj-$(CONFIG_IPQ_GCC_6018) += gcc-ipq6018.o
>>   obj-$(CONFIG_IPQ_GCC_806X) += gcc-ipq806x.o
>>   obj-$(CONFIG_IPQ_GCC_8074) += gcc-ipq8074.o
>> diff --git a/drivers/clk/qcom/gcc-ipq5424.c b/drivers/clk/qcom/gcc-ipq5424.c
>> new file mode 100644
>> index 000000000000..72d2c9bfa986
>> --- /dev/null
>> +++ b/drivers/clk/qcom/gcc-ipq5424.c
>> @@ -0,0 +1,3333 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) 2018,2020 The Linux Foundation. All rights reserved.
>> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#include <linux/clk-provider.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/regmap.h>
>> +
>> +#include <dt-bindings/clock/qcom,ipq5424-gcc.h>
>> +#include <dt-bindings/reset/qcom,ipq5424-gcc.h>
>> +
>> +#include "clk-alpha-pll.h"
>> +#include "clk-branch.h"
>> +#include "clk-rcg.h"
>> +#include "clk-regmap.h"
>> +#include "clk-regmap-divider.h"
>> +#include "clk-regmap-mux.h"
>> +#include "clk-regmap-phy-mux.h"
>> +#include "common.h"
>> +#include "reset.h"
>> +
>> +enum {
>> +	DT_XO,
>> +	DT_SLEEP_CLK,
>> +	DT_PCIE30_PHY0_PIPE_CLK,
>> +	DT_PCIE30_PHY1_PIPE_CLK,
>> +	DT_PCIE30_PHY2_PIPE_CLK,
>> +	DT_PCIE30_PHY3_PIPE_CLK,
>> +	DT_USB_PCIE_WRAPPER_PIPE_CLK,
> 
> This doesn't seem to match bindings.
> 
ok, will fix
>> +};
>> +
>> +enum {
>> +	P_GCC_GPLL0_OUT_MAIN_DIV_CLK_SRC,
>> +	P_GPLL0_OUT_AUX,
>> +	P_GPLL0_OUT_MAIN,
>> +	P_GPLL2_OUT_AUX,
>> +	P_GPLL2_OUT_MAIN,
>> +	P_GPLL4_OUT_AUX,
>> +	P_GPLL4_OUT_MAIN,
>> +	P_SLEEP_CLK,
>> +	P_XO,
>> +	P_USB3PHY_0_PIPE,
>> +};
>> +
>> +static const struct clk_parent_data gcc_parent_data_xo = { .index = DT_XO };
>> +
>> +static struct clk_alpha_pll gpll0 = {
>> +	.offset = 0x20000,
>> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT_EVO],
>> +	.clkr = {
>> +		.enable_reg = 0xb000,
>> +		.enable_mask = BIT(0),
>> +		.hw.init = &(const struct clk_init_data) {
>> +			.name = "gpll0",
>> +			.parent_data = &gcc_parent_data_xo,
>> +			.num_parents = 1,
>> +			.ops = &clk_alpha_pll_ops,
>> +			.flags = CLK_IS_CRITICAL,
> 
> This deserves a comment
> 
ok will add
>> +		},
>> +	},
>> +};
>> +
>> +static struct clk_fixed_factor gpll0_div2 = {
>> +	.mult = 1,
>> +	.div = 2,
>> +	.hw.init = &(const struct clk_init_data) {
>> +		.name = "gpll0_div2",
>> +		.parent_hws = (const struct clk_hw *[]) {
>> +			&gpll0.clkr.hw
>> +		},
>> +		.num_parents = 1,
>> +		.ops = &clk_fixed_factor_ops,
>> +	},
>> +};
>> +
>> +static struct clk_alpha_pll gpll2 = {
>> +	.offset = 0x21000,
>> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_NSS_HUAYRA],
>> +	.clkr = {
>> +		.enable_reg = 0xb000,
>> +		.enable_mask = BIT(1),
>> +		.hw.init = &(const struct clk_init_data) {
>> +			.name = "gpll2",
>> +			.parent_data = &gcc_parent_data_xo,
>> +			.num_parents = 1,
>> +			.ops = &clk_alpha_pll_ops,
>> +		},
>> +	},
>> +};
>> +
>> +static const struct clk_div_table post_div_table_gpll2_out_main[] = {
>> +	{ 0x1, 2 },
>> +	{ }
>> +};
>> +
>> +static struct clk_alpha_pll_postdiv gpll2_out_main = {
>> +	.offset = 0x21000,
>> +	.post_div_table = post_div_table_gpll2_out_main,
>> +	.num_post_div = ARRAY_SIZE(post_div_table_gpll2_out_main),
>> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_NSS_HUAYRA],
>> +	.clkr.hw.init = &(const struct clk_init_data) {
>> +		.name = "gpll2_out_main",
>> +		.parent_hws = (const struct clk_hw*[]) {
>> +			&gpll2.clkr.hw,
>> +		},
>> +		.num_parents = 1,
>> +		.ops = &clk_alpha_pll_postdiv_ro_ops,
>> +	},
>> +};
>> +
>> +static struct clk_alpha_pll gpll4 = {
>> +	.offset = 0x22000,
>> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT_EVO],
>> +	.clkr = {
>> +		.enable_reg = 0xb000,
>> +		.enable_mask = BIT(2),
>> +		.hw.init = &(const struct clk_init_data) {
>> +			.name = "gpll4",
>> +			.parent_data = &gcc_parent_data_xo,
>> +			.num_parents = 1,
>> +			.flags = CLK_IS_CRITICAL,
> 
> Comment, please.
> 
ok, will add
>> +			.ops = &clk_alpha_pll_ops,
>> +		},
>> +	},
>> +};
>> +
> 
> [skipped]
> 
>> +
>> +static struct clk_rcg2 gcc_pcnoc_bfdcd_clk_src = {
>> +	.cmd_rcgr = 0x31004,
>> +	.mnd_width = 0,
>> +	.hid_width = 5,
>> +	.parent_map = gcc_parent_map_0,
>> +	.freq_tbl = ftbl_gcc_pcnoc_bfdcd_clk_src,
>> +	.clkr.hw.init = &(const struct clk_init_data) {
>> +		.name = "gcc_pcnoc_bfdcd_clk_src",
>> +		.parent_data = gcc_parent_data_0,
>> +		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
>> +		.flags = CLK_IS_CRITICAL,
> 
> Comment
> 
ok
>> +		.ops = &clk_rcg2_ops,
>> +	},
>> +};
>> +
> 
> [skipped]
> 
>> +
>> +static struct clk_branch gcc_qdss_dap_clk = {
>> +	.halt_reg = 0x2d058,
>> +	.clkr = {
>> +		.enable_reg = 0x2d058,
>> +		.enable_mask = BIT(0),
>> +		.hw.init = &(const struct clk_init_data) {
>> +			.name = "gcc_qdss_dap_clk",
>> +			.parent_hws = (const struct clk_hw *[]) {
>> +				&gcc_qdss_dap_sync_clk_src.hw
>> +			},
>> +			.num_parents = 1,
>> +			.flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
> 
> Comment
> 
ok
>> +			.ops = &clk_branch2_ops,
>> +		},
>> +	},
>> +};
>> +
>> +static struct clk_branch gcc_qdss_at_clk = {
>> +	.halt_reg = 0x2d034,
>> +	.clkr = {
>> +		.enable_reg = 0x2d034,
>> +		.enable_mask = BIT(0),
>> +		.hw.init = &(const struct clk_init_data) {
>> +			.name = "gcc_qdss_at_clk",
>> +			.parent_hws = (const struct clk_hw *[]) {
>> +				&gcc_qdss_at_clk_src.clkr.hw
>> +			},
>> +			.num_parents = 1,
>> +			.flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
> 
> Comment
> 
ok
>> +			.ops = &clk_branch2_ops,
>> +		},
>> +	},
>> +};
>> +
> 
> [skipped]
> 
>> +
>> +static int gcc_ipq5424_probe(struct platform_device *pdev)
>> +{
>> +	struct regmap *regmap;
>> +	struct qcom_cc_desc ipq5424_desc = gcc_ipq5424_desc;
>> +	int ret;
>> +
>> +	regmap = qcom_cc_map(pdev, &ipq5424_desc);
>> +	if (IS_ERR(regmap))
>> +		return PTR_ERR(regmap);
>> +
>> +	ret = qcom_cc_really_probe(&pdev->dev, &ipq5424_desc, regmap);
>> +	if (ret) {
>> +		dev_err(&pdev->dev, "Failed to register GCC clocks ret=%d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	dev_info(&pdev->dev, "Registered GCC clocks\n");
>> +
>> +	return ret;
> 
> Drop all the cruft and use qcom_cc_probe() directly.
> 
ok

Regards,
  Sricharan


