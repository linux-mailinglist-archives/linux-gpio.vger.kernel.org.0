Return-Path: <linux-gpio+bounces-6373-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3036A8C5874
	for <lists+linux-gpio@lfdr.de>; Tue, 14 May 2024 17:05:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E304C282206
	for <lists+linux-gpio@lfdr.de>; Tue, 14 May 2024 15:05:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD3C617EB8A;
	Tue, 14 May 2024 15:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fwH2L2d/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6ABF3EA66;
	Tue, 14 May 2024 15:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715699116; cv=none; b=rAr1lJOeT06x1bwVn+xJumIPhTrpZPI0hQkSEBR21t+5BJPxIP32IycZiW3ey9xnmhX7xK1NbTFxlCSpbYLeSkJGB6fdrq81MUMYExZSr5XzLjm5sn1CIBvmsSDs5rHoiAQx2NHccnAtoejRBYFHwDjM+KtJPH9kEbUu3TP0e4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715699116; c=relaxed/simple;
	bh=w4qu7AcWvUkrD2GyDHl1h65yHhTJv5ueqrzrzj7ci3s=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=TMqHrKhOVpbr3EudIwoRQuP1lc6c/Q7umqo8FBPYQAQN7KUU0yaxuDGoZCaJsETdBKCGi2QcDQl2trqbKetZzG4yqLSs+c3jXmUSYK72R4L2J4bpgj4uE+uXnw4yixTYj5i3VLqc0HBUFcMMlk05n60WFE8ux09hmPBrj2glx1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fwH2L2d/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44EBohpO004317;
	Tue, 14 May 2024 15:05:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=NnZu3bgBmSPSM6LjznEKtBZHGtRz96Gtt9Ol698i3bE=; b=fw
	H2L2d/9BoqMTJgCd45y6wQvAHo0ncZjyEqdX8HMR5PCTprwfXmuRNoOhgcv2s/Sz
	hrg0O6wK43J0ZPZ7aMUTqPYBQx/aczrpep8aG1RzpzcRSVti39ViagTLFHVizOhg
	4hVZ30A+hikkkj93BzXzP0s2BO8LOQyP0fQOUdNxBMkTsqSHMQLtvqOyLiLF0J/c
	txY/Eiu5x/Vp36QW9boaZOFeu4ygJfmhzwYmNNmKkJVYEo8bPcIVNVMIS7TQxh5k
	GGLqUz/0+j8PDcpI0/o/BAcNZuuvE8w3/ziqZ9S2+wcJvPDKNHJU2vr6EyAxDYi3
	FOQKMCc0kp2yfGPvNqsQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y47eg8fxc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 May 2024 15:05:08 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44EF55m7013646
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 May 2024 15:05:05 GMT
Received: from [10.216.14.10] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 14 May
 2024 08:04:59 -0700
Message-ID: <0a372307-8887-ac97-54c6-d6080e64540f@quicinc.com>
Date: Tue, 14 May 2024 20:34:56 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 12/13] regulator: add pm8008 pmic regulator driver
Content-Language: en-US
To: Andy Shevchenko <andy.shevchenko@gmail.com>
CC: <johan@kernel.org>, <andersson@kernel.org>, <broonie@kernel.org>,
        <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <johan+linaro@kernel.org>, <konrad.dybcio@linaro.org>,
        <krzk+dt@kernel.org>, <lee@kernel.org>, <lgirdwood@gmail.com>,
        <linus.walleij@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <robh@kernel.org>, <swboyd@chromium.org>
References: <ZjpMeVk_HiixZUEu@hovoldconsulting.com>
 <20240514140446.706847-1-quic_skakitap@quicinc.com>
 <CAHp75VcfYuukpLg=F36ykddsT9SpfdGNyyvVeyw-Yvz61Lrq7g@mail.gmail.com>
From: "Satya Priya Kakitapalli (Temp)" <quic_skakitap@quicinc.com>
In-Reply-To: <CAHp75VcfYuukpLg=F36ykddsT9SpfdGNyyvVeyw-Yvz61Lrq7g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 06wmee6BnCQYyBEKBkIDU_zBFoOtEd63
X-Proofpoint-ORIG-GUID: 06wmee6BnCQYyBEKBkIDU_zBFoOtEd63
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-14_08,2024-05-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 malwarescore=0 phishscore=0 spamscore=0 mlxlogscore=894 lowpriorityscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405140106


On 5/14/2024 7:48 PM, Andy Shevchenko wrote:
> On Tue, May 14, 2024 at 5:05 PM Satya Priya Kakitapalli
> <quic_skakitap@quicinc.com> wrote:
>>> On Thu, May 09, 2024 at 03:07:02PM +0300, Andy Shevchenko wrote:
>>>> Wed, May 08, 2024 at 10:37:50PM +0000, Stephen Boyd kirjoitti:
>>>>> Quoting Johan Hovold (2024-05-06 08:08:29)
> ...
>
>>>>>> +               BUILD_BUG_ON((ARRAY_SIZE(pldo_ranges) != 1) ||
>>>>> This should be an && not || right?
>>>>>> +                               (ARRAY_SIZE(nldo_ranges) != 1));
>>>> In any case BUILD_BUG_ON() is not encouraged for such cases, it would be much
>>>> better to have a static_assert() near to one of those arrays.
>>> I think the reason it is placed here is that the above line reads:
>>>
>>>        rdesc->n_linear_ranges = 1;
>>>
>>> and that would need to change if anyone expands the arrays.
>> Correct. static_assert() cannot be used in the middle of code here, it can only be used at the declarations part which doesn't serve the purpose.
> I didn't get this. The ARRAY_SIZE():s are defined at compile time
> globally. How does this prevent from using static_assert()?


The reason we added it here is to make sure the nlod_ranges and 
pldo_ranges doesn't become larger, and we forget updating the 
n_linear_ranges. Adding static_assert here is not feasible so adding a 
BUILD_BUG_ON at this point makes sure the n_linear_ranges is proper.


>> So, BUILD_BUG_ON is the only way to go here.
> I don't think so.
>

