Return-Path: <linux-gpio+bounces-11699-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5D59A58E3
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Oct 2024 04:33:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A0EBD281BDA
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Oct 2024 02:33:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3CE8208A0;
	Mon, 21 Oct 2024 02:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cU5wjn7g"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63A5433AD;
	Mon, 21 Oct 2024 02:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729477999; cv=none; b=TxCtMgFwZ/sEKweoe9n4vwIqmWIHWcVKwki4ejHkXvATU3EpV2kcSBSFQWD+71KPOLn04crbYSCGk/9957TRlIONtlP8VtqtWqJqDovFKKcJ93MmyNwxBdSYzFxdRZOSyAtFjm8GSFNYtMq5ABQGsKGxrADS74y3TKCiMdB6oe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729477999; c=relaxed/simple;
	bh=Oobo+z1MeqZQNu7QDfGs0v4YgURSQ8bsx+cnNpmwhmQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=NklTiYtip2Mn9AmFgiHi8uG6cDNwwb3MdTPmQhYrIOI4DW1Uylpb30ULAPfp7Qr1+QQaiPYqQFqO7+LJh4eK/1h74BaWtZqgw1nISx8C/J1z6jTKBRJkU3RQya3dgXSVw/eWBmD50QB+TMr3Db2P3VoPRGaS8lzAvop3v1ONzxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cU5wjn7g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49L0nMjR013999;
	Mon, 21 Oct 2024 02:32:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	55Trh/miVS+zqaYD7btllZo9jno46NUeUdLug/z/5xQ=; b=cU5wjn7giUVY+zUW
	GMyxdCZyDKvrAkwiGUEqYqGRFoND5Zqjl7Pe1xnR/nuc/uck3FH5Bg3H4iHyApwe
	Fnmai497IL5tNyWrOEtldgGrbt3M11qQSQRjPltKljr4v2GeESKAU8gihmrf/yYP
	6YMx3ymsPmltLmp3Ui4C4M4xt5gQk1IDPp/RHtnW1EDBESb3v32LkwQURVF+M/Mp
	9hUG3IgARKD/S5wWmOT0C5x1ZJEcRgAZ1CLbU5EBZoQeeSAw4aoKRwGlDKo5Bdp4
	KQWLpWhgFi9wisMyo+Mt1ZZDaQ6g9r2/rz+fRLYN+CeiUECw7wmQzPbjgwDReJa6
	RvbFLA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42c6tsawpu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Oct 2024 02:32:59 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49L2WvwG013407
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Oct 2024 02:32:57 GMT
Received: from [10.233.21.53] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 20 Oct
 2024 19:32:53 -0700
Message-ID: <5fa2080a-f59e-405e-ba52-69d7293e2739@quicinc.com>
Date: Mon, 21 Oct 2024 10:32:53 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] pinctrl: qcom: Introduce Pinctrl for QCS8300
To: Andrew Lunn <andrew@lunn.ch>
CC: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij
	<linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Richard
 Cochran" <richardcochran@gmail.com>,
        <quic_tengfan@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <quic_tingweiz@quicinc.com>, <quic_aiquny@quicinc.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
References: <20241018-qcs8300_tlmm-v3-0-8b8d3957cf1a@quicinc.com>
 <f9dace93-f6c7-40c2-a6d2-60ce8043aa72@lunn.ch>
Content-Language: en-US
From: Jingyi Wang <quic_jingyw@quicinc.com>
In-Reply-To: <f9dace93-f6c7-40c2-a6d2-60ce8043aa72@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: fDyMZwgE4zQTkHSUTJje7lHLr6YNzBw3
X-Proofpoint-ORIG-GUID: fDyMZwgE4zQTkHSUTJje7lHLr6YNzBw3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 mlxscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1011
 mlxlogscore=250 malwarescore=0 impostorscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410210016



On 10/19/2024 2:08 AM, Andrew Lunn wrote:
> On Fri, Oct 18, 2024 at 11:19:30AM +0800, Jingyi Wang wrote:
>> Introduce Top Level Mode Multiplexer dt-binding and driver for Qualcomm
>> QCS8300 SoC.
>>
>> Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
> 
> I'm curious why you are Cc: netdev for a pin controller patch?  Did
> ./scripts/get_maintainer.pl say you should?
> 
The cc list was generated by the b4 tools.
>     Andrew
> 
> ---
> pw-bot: cr

Thanks,
Jingyi


