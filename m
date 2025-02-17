Return-Path: <linux-gpio+bounces-16114-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0AEA37FCA
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 11:19:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B0B3188D9A2
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 10:16:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27313216E1E;
	Mon, 17 Feb 2025 10:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="F/pmuLRf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829E81A2380;
	Mon, 17 Feb 2025 10:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739787367; cv=none; b=fJKOFoP4c9MUOIKT4AcFPMGzmwSUNNB1QDn9dBr6/saAa7IxGQw3UWe45gCCw++9IP4myDIfxUkosHMApT8lHjpf+X4nVBDz0bVvoU+0i8lNc4Ox0OtjhxRex4kQ/pMZwMN4d3YBZQaN1HQXArxkbvnLguo5ldb8+hrI+nFDr8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739787367; c=relaxed/simple;
	bh=Dzn9lEoIN6eg5dYcexk1ycmvzDStXkXQ6o3w7H6EWXs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ehqSWOFT//DlS/Xs2SEVqX9UMyYK+imfBepaDAeruj5scYu3rEsBab2p5K8NUxGb2dskEbV6cqIn/lE6o2XmdWrGEiZQbqSmgt+CEBf3gDCZWcLnZgdk06+D6yiF3YWZ9Um1i5rYGRVktysokYS3RHoCLyxOETkG227lWvkF7Yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=F/pmuLRf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51H030c9002910;
	Mon, 17 Feb 2025 10:15:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7hjqKwAEjBQEmoqd+2ugTsyb6OUqNmOcwB/Gk2YNfnE=; b=F/pmuLRfn6c4NBZK
	9tZU2fCc604KUl4L9SEJnQhanqQ6lJLmxSErU+937agx6vjAGZFIAeI3YH1CsbxC
	T6S/HgwIt/Oet0N8C3RUuaTkdZwIsDqYpMgD+9HmbvXffg4qwS2tVm6bd3Tpswdt
	iKswX/eVmDpCTwGS7t2u0aebKVmFzZE8fn0+/J5GOMkzefUxv6mJay6lpoUcZB2r
	zvaRGlZu9D4/qLuANJ3oweI2Yy1mvdwKX/nt0fIsbZ8gzkmXSmPVATc0euUFs7eO
	jXKMFOOG9diS6870nYkAdUHMdMzkBgIgG3LI42dIt/B62pZtLP/VZa5/pDo5IWL6
	jVcWGA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ut7tsa2t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Feb 2025 10:15:50 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51HAFn2o021933
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Feb 2025 10:15:49 GMT
Received: from [10.151.37.100] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 17 Feb
 2025 02:15:43 -0800
Message-ID: <779a23f9-868a-4fe3-abc6-9240fd3ab491@quicinc.com>
Date: Mon, 17 Feb 2025 15:45:24 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH V5 0/6] Add minimal boot support for IPQ5424
To: Bjorn Andersson <andersson@kernel.org>, <konradybcio@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <ulf.hansson@linaro.org>, <linus.walleij@linaro.org>,
        <catalin.marinas@arm.com>, <p.zabel@pengutronix.de>,
        <geert+renesas@glider.be>, <dmitry.baryshkov@linaro.org>,
        <neil.armstrong@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <quic_varada@quicinc.com>
References: <20241028060506.246606-1-quic_srichara@quicinc.com>
 <173085441672.26510.12002868497417768812.b4-ty@kernel.org>
Content-Language: en-US
From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
In-Reply-To: <173085441672.26510.12002868497417768812.b4-ty@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 0vfDTzgoZsBo6oayox3MWP30CzYjNDKX
X-Proofpoint-ORIG-GUID: 0vfDTzgoZsBo6oayox3MWP30CzYjNDKX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-17_05,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 mlxscore=0 mlxlogscore=842 clxscore=1011 phishscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502170090



On 11/6/2024 6:23 AM, Bjorn Andersson wrote:
> 
> On Mon, 28 Oct 2024 11:35:00 +0530, Sricharan R wrote:
>> From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
>>
>> The IPQ5424 is Qualcomm's 802.11be SoC for Routers, Gateways and
>> Access Points.
>>
>> This series adds minimal board boot support for ipq5424-rdp466 board.
>>
>> [...]
> 
> Applied, thanks!
> 
> [6/6] arm64: defconfig: Enable IPQ5424 RDP466 base configs
>        commit: fd516bb4f48fc527744cae42d8e156fb09bce157

Hi Bjorn,
    This patch is not appearing in mainline. Can you please
    help ?

Regards,
  Sricharan

