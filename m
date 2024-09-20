Return-Path: <linux-gpio+bounces-10310-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F3FE797D522
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Sep 2024 13:59:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B505B281C6D
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Sep 2024 11:59:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04AAD14A606;
	Fri, 20 Sep 2024 11:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Fayq3Nup"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6030314900E;
	Fri, 20 Sep 2024 11:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726833587; cv=none; b=NQEr5EBD9W0zijRo4cRmdUdFHrAaEvz/wJ5hq/sgt6YJZwTVYzFVtfqKUqbG5IDUACg73NucICkymhTXY17weodiFMPR7iiQmqTOgvplpjIs1QdXwSZRafppinoFOy22BfOyVr6Yr6QqO/5LokGmoBxifWKDMKh8FWcD4qQQj5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726833587; c=relaxed/simple;
	bh=twR9/xKgcPJCn0wKq/pnL447/Bf46ge3JFqvvLcj1NY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=E/TXyosCW1vhRIllipSp7GPTd3xH31bOeJowoXuMTyMXd0HwNBLIeky1yMPv32SBKikS+QPeQ2bUIiKD1p3+Lmgmr1nuuFUUXAxSNkJWqwRNQ/6uRWXLkEopcawmIXWJ/2gbfwQY8lkyuztFvv2ILMeY43O+gdvlvrWBKkQ1M5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Fayq3Nup; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48K84XHP018700;
	Fri, 20 Sep 2024 11:59:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y1w2MfHxG82l7hDgOZjGvEcyjxV3FDlBOCExbl4smX4=; b=Fayq3Nupc+DexYdl
	BA8EfGIFNm/LqfUhPSfCfbCFeC18VDBWyYd5YM+jml3KlC0h9XHpJkoYzCe3xRy/
	L6SigVOzk4xIUQV1C57TZgYXAIhmPhFv8fHESGdt0hNWdFpvFJUOqFFITOWVsw+H
	mW7b210SHJRy6/+VC72mWvcgmrXfDKAjQmPsDD0tpTAP/SFnfOaMK8e06YqeqE2Y
	5vJTeNqhKD5yIqx2jm114IZm3cea6R/oIyM0WXmaMiwdHOhYlAVCKgI15nLwFkDF
	eUKgNM11mjOeF73yLmbGQXQoSa0+T+8RW2YLwLx9T630fp31PdR3v2kohYwOIp67
	MCwdiw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4j712au-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Sep 2024 11:59:33 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48KBxWkh028033
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Sep 2024 11:59:32 GMT
Received: from [10.50.45.132] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 20 Sep
 2024 04:59:26 -0700
Message-ID: <e8b30b47-2862-4ea6-97cf-2e5c42c514a7@quicinc.com>
Date: Fri, 20 Sep 2024 17:29:23 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] arm64: dts: qcom: add IPQ5424 SoC and rdp466 board
 support
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>
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
 <20240913121250.2995351-8-quic_srichara@quicinc.com>
 <fyoh72in62sfmsw3syqswr2p3pcv26zoce2tvlx53mu4lpoakx@ixyvy4oylms3>
 <10887d65-e643-4ab2-a9e7-af0f829e88ec@kernel.org>
Content-Language: en-US
From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
In-Reply-To: <10887d65-e643-4ab2-a9e7-af0f829e88ec@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: MbuGF4Mb9U91R7SattFhlkAB1Rnw9pa4
X-Proofpoint-GUID: MbuGF4Mb9U91R7SattFhlkAB1Rnw9pa4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=885
 mlxscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409200087



On 9/19/2024 6:01 PM, Krzysztof Kozlowski wrote:
> On 13/09/2024 14:52, Dmitry Baryshkov wrote:
>> On Fri, Sep 13, 2024 at 05:42:49PM GMT, Sricharan R wrote:
> 
>>> +	#address-cells = <2>;
>>> +	#size-cells = <2>;
>>> +	interrupt-parent = <&intc>;
>>> +
>>> +	clocks {
>>> +		xo_board: xo-board-clk {
>>> +			compatible = "fixed-clock";
>>> +			#clock-cells = <0>;
>>> +		};
>>> +
>>> +		sleep_clk: sleep-clk {
>>> +			compatible = "fixed-clock";
>>> +			#clock-cells = <0>;
>>> +		};
>>
>> I think Krzysztof lately suggested moving these clocks to board DT
>> files.
>>
> 
> The node can stay. Just the frequency goes to DTSI. See also DTS coding
> style document.

ok, will check

Regards,
  Sricharan

