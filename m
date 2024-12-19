Return-Path: <linux-gpio+bounces-14009-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC7F9F788C
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2024 10:30:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C631A18897F9
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2024 09:30:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47C61221D94;
	Thu, 19 Dec 2024 09:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="evgjuFG6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3130C221D98;
	Thu, 19 Dec 2024 09:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734600649; cv=none; b=sZWkq1Btf6dknErm5FgswWlUOHDKYtP58aKl65j5vAgvhB7MtYIh/NydH14C9LTVaiTGChYR98WIFgIxGFGlgCrvvPsIxug5VzzdtBOXQ7YEqPPNDfJXuGCKA4LRg+A4bKfelgIiwnWEvkp3RbUgiIuiYMykGLIw9WHvO3JjZw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734600649; c=relaxed/simple;
	bh=tXVo7Q2Dgptk7YoHRTIly2DZZi36JzNVknejIxi9PgA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qU7I39j7YtGVO+9oaVm9jbIQt9605mCKR3z7uOlL9Twr1oSRaAtZ+MQgeVB39bTsVnBfvHUd3nBgEtEpMUMyys7K2yUUcQWs3+Xf12pLtgzAMnlsHSSW+wlUOey8OhhvlIvXKdjBMkZsD1WTKoqkQp/0SlpbXYj4+XESfRCNKn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=evgjuFG6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJ6HgMA013515;
	Thu, 19 Dec 2024 09:30:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	klksmNswTWrYXc2YyXcFVCA2i64WA7STAqzcHE5wCmQ=; b=evgjuFG6+B4qqBW3
	+71SsBfNY+mSZL+wD6Wl9puzGusXl1qAcKI0rBk9IZjwr6AKqmrZC6XbpOslx0Db
	22c0yqO+rZbxlu5EeGceWoIm+wPn5wlSQ8hSyz6RmzdusuMkFRZNl9mVk0ycV2Lg
	cCb6QGDDbF0M+OcHDQAXQ1WBGMZt5jmHy8PGUMQm/88Fw8fCMvqFohCMgzhopflG
	mNQyS5D8SuinyfaxUTHkYJWNDwFvziYuAOZegE7i9mQeXrvcVJ6kXfYlwFK9FJrw
	LhMYRXrjyNlZT157Ia9fdNxNgyqO5sBT9dUZbZFTYnwGf+9S0XO9eisrx5ESH5gK
	RI2n8Q==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43me3g0g0f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Dec 2024 09:30:42 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BJ9UfGP014730
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Dec 2024 09:30:41 GMT
Received: from [10.239.132.205] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 19 Dec
 2024 01:30:34 -0800
Message-ID: <236fcae1-0632-4691-861a-51a5aeff2ea3@quicinc.com>
Date: Thu, 19 Dec 2024 17:30:31 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] dt-bindings: pinctrl: qcom: correct gpio-ranges in
 examples for qcs615
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Jingyi Wang <quic_jingyw@quicinc.com>,
        Konrad Dybcio
	<konradybcio@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20241219-correct_gpio_ranges-v2-0-19af8588dbd0@quicinc.com>
 <20241219-correct_gpio_ranges-v2-1-19af8588dbd0@quicinc.com>
 <2867cd9e-4de9-47dd-b4e8-c88f78b1113d@linaro.org>
From: Lijuan Gao <quic_lijuang@quicinc.com>
In-Reply-To: <2867cd9e-4de9-47dd-b4e8-c88f78b1113d@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: r2z9SuBPTnu4DTkHdo90j6VxL0H3CIry
X-Proofpoint-GUID: r2z9SuBPTnu4DTkHdo90j6VxL0H3CIry
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 mlxlogscore=999 spamscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 clxscore=1015 mlxscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412190075



在 12/19/2024 4:15 PM, Krzysztof Kozlowski 写道:
> On 19/12/2024 08:59, Lijuan Gao wrote:
>> Correct the gpio-ranges in the QCS615 TLMM pin controller example to
>> include the UFS_RESET pin, which is expected to be wired to the reset
>> pin of the primary UFS memory. This allows the UFS driver to toggle it.
>>
>> Fixes: 55c487ea6084 ("dt-bindings: pinctrl: document the QCS615 Top Level Mode Multiplexer")
>> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
>> ---
> 
> <form letter>
> This is a friendly reminder during the review process.
> 
> It looks like you received a tag and forgot to add it.
> 
> If you do not know the process, here is a short explanation:
> Please add Acked-by/Reviewed-by/Tested-by tags when posting new
> versions, under or above your Signed-off-by tag. Tag is "received", when
> provided in a message replied to you on the mailing list. Tools like b4
> can help here. However, there's no need to repost patches *only* to add
> the tags. The upstream maintainer will do that for tags received on the
> version they apply.
> 
> https://elixir.bootlin.com/linux/v6.5-rc3/source/Documentation/process/submitting-patches.rst#L577
> 
> If a tag was not added on purpose, please state why and what changed.
> </form letter>
Sorry, my mistake. I didn't realize that Rob Herring had already given 
me an "Acked-by." I updated the commit message in this patch.
> 
> Best regards,
> Krzysztof

-- 
Thx and BRs
Lijuan Gao


