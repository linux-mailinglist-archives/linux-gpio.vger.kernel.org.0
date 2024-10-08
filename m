Return-Path: <linux-gpio+bounces-11034-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F834994535
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 12:18:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C35B628402B
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 10:18:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8756E1BA285;
	Tue,  8 Oct 2024 10:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="c3lregHn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7B11AD401;
	Tue,  8 Oct 2024 10:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728382725; cv=none; b=JmEI5y6ycNt7QfdysmSDraoQqPfuh5AyUoENS5Q5i6qa3jJTHdlpZJfK7/E9uuvIuWnlUQKhQypaJz9LNECRbrzd+PCbPSfTnrJFTElNS4Kp/1WxfreqJWZLitKsgeYEeMxg93lqjjjYDIM7RtvEarw1ahDzMiaAGhedhJZ0b54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728382725; c=relaxed/simple;
	bh=u8xPnDu0qAYu6LejKWYoWWMdvK8gJRvYrhiJGpOdTLg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=USFZyqxg1F6EZa77haswD1NOVwk/7SuUDGa7v6kbWJS3ftJTVnZILotFexI+v6uSCGmCddeS5iJuuaJBY4jZnSqUV4A4U13MDerhWbGWcv8/F9t9KtjR8gJTleCO6lfWAqtnHTUJjnil4yWE7wwwdJQ9yDHVO+5s7O78Hux6HYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=c3lregHn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49896gcp004100;
	Tue, 8 Oct 2024 10:18:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sqpFdTY+6jzDWQR097kkAMWTTO8iAiSE8pceKsB4sbM=; b=c3lregHnCu6sgvl0
	IlAwZ2V8iFuSl5HXydolufxefzYRLOfjIfHvl1Y8ayfsOci9k8Uhxumg/Ka+D3Ec
	IARenIIyvDYbyAKcQUATpms1qh7bU1nLbmkwGDX/pKxa9VNbE0QHrq+xh7S28aaU
	hYh8utWbhkjaF3hZfRHC5XhXnulwaDbLTJxwGLXBEV9VGxzTsvB9GOUkRh5DG0sE
	QE3CNZCpwzjLKRmGmF3ef3IkPkmKVeHKgGbWvSLybR+zSheqe9ELwrk8T2cawejk
	LdAJvWdM697LCAUWcNN77d8KHBh5YMiTyvGfwx7j3rPaZf8AhGnY8MVk2vmx8hWB
	OoB8aQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 424ndy9vd5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Oct 2024 10:18:21 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 498AIK0o006896
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 8 Oct 2024 10:18:20 GMT
Received: from [10.50.47.90] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 8 Oct 2024
 03:18:13 -0700
Message-ID: <5e8bac8a-8e6b-423c-8e13-b73db9a226fd@quicinc.com>
Date: Tue, 8 Oct 2024 15:48:10 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 4/7] clk: qcom: add Global Clock controller (GCC)
 driver for IPQ5424 SoC
To: Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>,
        <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <mturquette@baylibre.com>,
        <sboyd@kernel.org>, <ulf.hansson@linaro.org>,
        <linus.walleij@linaro.org>, <catalin.marinas@arm.com>,
        <p.zabel@pengutronix.de>, <geert+renesas@glider.be>,
        <dmitry.baryshkov@linaro.org>, <neil.armstrong@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-mmc@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
CC: <quic_varada@quicinc.com>
References: <20241004102342.2414317-1-quic_srichara@quicinc.com>
 <20241004102342.2414317-5-quic_srichara@quicinc.com>
 <1ac5e0e5-06c1-4930-8c03-f465d6e07848@quicinc.com>
Content-Language: en-US
From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
In-Reply-To: <1ac5e0e5-06c1-4930-8c03-f465d6e07848@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: R4sxhw8CqABc2bubWh1F1geSuX3Npj5I
X-Proofpoint-ORIG-GUID: R4sxhw8CqABc2bubWh1F1geSuX3Npj5I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 mlxlogscore=999 spamscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410080067


> 
> <snip>
> 
>> +
>> +static const struct freq_tbl ftbl_gcc_qupv3_uart0_clk_src[] = {
>> +    F(960000, P_XO, 10, 2, 5),
>> +    F(4800000, P_XO, 5, 0, 0),
>> +    F(9600000, P_XO, 2, 4, 5),
>> +    F(16000000, P_GPLL0_OUT_MAIN, 10, 1, 5),
>> +    F(24000000, P_XO, 1, 0, 0),
>> +    F(25000000, P_GPLL0_OUT_MAIN, 16, 1, 2),
>> +    F(50000000, P_GPLL0_OUT_MAIN, 16, 0, 0),
>> +    F(64000000, P_GPLL0_OUT_MAIN, 12.5, 0, 0),
>> +    { }
>> +};
>> +
> 
> There are few more frequencies got added to this table. Can we 
> incorporate that as well?
> 

ok, yeah, since these patches are already reviewed, will send the
additional updates here and also for dts etc in a separate series.

Regards,
  Sricharan


