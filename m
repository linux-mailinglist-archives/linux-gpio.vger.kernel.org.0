Return-Path: <linux-gpio+bounces-10505-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D249D988607
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2024 15:04:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B41E1F212C2
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2024 13:04:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2CD018D645;
	Fri, 27 Sep 2024 13:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XwyNXTd8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E989316C6A1;
	Fri, 27 Sep 2024 13:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727442236; cv=none; b=h7CDXuJpdwgVXTif/EBJ3WUPWImJfwuycQk/rRHJFAPUZs8EnThSX1KNfPNZYK8y9RLbvp6FnsJiZA6W3uZCry1OZH4uwdp9IUI9e/jW0gPnhrNY3IMdu5XMg+ulFTJfWZYspjcpurbb9ht9RbtFE5jUk4988JM9IGUcQmsRA9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727442236; c=relaxed/simple;
	bh=KGaBNjNO7DouBka7wHY7CLPjOBmuYFckfmsZhp4KAVs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=XXGdQy6CCVru7VhmuwXQKl2oI5Zq6TwERrzEKJKgVc0Xv+u4AIn1k45Ap0+exodTnzmISlfSYdLDk4QTOLmtvXAI+G+ezj02eRgjhXQ0x8vDKawOcPpymjUS6D/JjO3K6yMV1l+QFjNX4BxeER9igVulzPMYQ+PT5eA4ITErYIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XwyNXTd8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48R6umUH001908;
	Fri, 27 Sep 2024 13:03:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jgDk6xMKnrNMczCXf9wyrjb0y6qIThGjEzlCc7vi6a0=; b=XwyNXTd8nQ31TWuy
	xksBVRoa6BujLruof/UBDybf+EW0RCgEVbNVFzu2viFVubv9SkSFUOtpqWsxbHTR
	t/9pA3CDzJptp0u+GFRaj1GtrVZEoBWcI5QtOBzeZosPLPKUOVoy8Da5WibHP4fN
	bf4/nkDLc7TUAeXgCTiSjFiWmzz5lqv/k0K6PVOcZctmfxjEyPCesExylbOthPAQ
	Pes7BbDf/VFmjTtPhfITXWUQbGTlZ54gyJTdz84w5QZ3zovcOa6Bci/JxCNBINIK
	UTpQZ8fqDqqx68k852abI0/Ai/TmqBKwOwAjcWCHU90GiKZLo3yr45M5j7jS93Qu
	KPn84w==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41skgnkjp2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Sep 2024 13:03:27 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48RD3PNW028858
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Sep 2024 13:03:25 GMT
Received: from [10.50.40.232] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 27 Sep
 2024 06:03:18 -0700
Message-ID: <21d89d9d-8bac-4bb8-a4e3-81328e783241@quicinc.com>
Date: Fri, 27 Sep 2024 18:33:15 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 6/9] clk: qcom: add Global Clock controller (GCC)
 driver for IPQ5424 SoC
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
References: <20240927065244.3024604-1-quic_srichara@quicinc.com>
 <20240927065244.3024604-7-quic_srichara@quicinc.com>
 <hitzcz3gjp4mywesnoicjnv4sfy4sckgepbl43bjjndp74etpl@adnjplfj3pfg>
Content-Language: en-US
From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
In-Reply-To: <hitzcz3gjp4mywesnoicjnv4sfy4sckgepbl43bjjndp74etpl@adnjplfj3pfg>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: eGJXufWxpeO_VZ9kBbgYTb7N3xRbGydw
X-Proofpoint-GUID: eGJXufWxpeO_VZ9kBbgYTb7N3xRbGydw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 mlxlogscore=856 adultscore=0 suspectscore=0 phishscore=0 impostorscore=0
 spamscore=0 mlxscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409270094



On 9/27/2024 2:32 PM, Dmitry Baryshkov wrote:
> On Fri, Sep 27, 2024 at 12:22:41PM GMT, Sricharan R wrote:
>> From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
>>
>> Add support for the global clock controller found on IPQ5424 SoC.
>>
>> Co-developed-by: Varadarajan Narayanan <quic_varada@quicinc.com>
>> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
>> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
>> ---
>>    [v2] Remove CLK_IS_CRITICAL for all clks
>>         Added CLK_IGNORE_UNUSED only for gpll0 temporarily till
> 
> This should be gpll4, not gpll0 (no need to resend just to fix the
> changelog though).
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
  ok, Thanks !

Regards,
  Sricharan


