Return-Path: <linux-gpio+bounces-20845-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8E7AC9EA2
	for <lists+linux-gpio@lfdr.de>; Sun,  1 Jun 2025 15:29:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 93087173E4F
	for <lists+linux-gpio@lfdr.de>; Sun,  1 Jun 2025 13:29:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77D781DB124;
	Sun,  1 Jun 2025 13:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GWna/ExP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89A764A8F;
	Sun,  1 Jun 2025 13:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748784558; cv=none; b=RCEpCp5d4zlhzQBew21YyNRGL95F69j/MdVSdVTg9HxCXk/eWTVeOKa8Ad14viysQfkXGAykm2Bm6wHjhofEE4V4BGR5yKqvuyhFB+Zu+bb30IqSxDZIdraJVB3106gA85zuC86EpFO25328twJM0uencz5Ei2SKEGDpoV76uO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748784558; c=relaxed/simple;
	bh=qbM/x9+dxfg6bxyCTiHdXODsE+BEoaFjM4cMuytHYas=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=CJU3toaOiRMHH3YnacjXlXnm90ubMsQvajaPOD+KKlwTN2tzg5kV3e6rRr8ghOZOhDaBeM9caedYV5Sg6WWvTUneQtA+aO7Sm7RLUYgnuiBknU0KHcFw22dphSdxN+Qo6aXCpp2W0NW1CRwkghry8s+iCVPykfhH2kpneCt7WZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GWna/ExP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 551CwjiR019562;
	Sun, 1 Jun 2025 13:29:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qbM/x9+dxfg6bxyCTiHdXODsE+BEoaFjM4cMuytHYas=; b=GWna/ExP9+elYxU+
	oYp+R5La8gBmTsjt31sOl7lqWbcDADdXme1SQGfoGfegNc7r4CoBqoBTXx/LTAP4
	ud2FdLWN422AXbKLNutd+p6rrrVE/6WPh3QjWtlEaAauvRYQSFsvT4d4ZFPSmSYG
	XUKVZeGbA7KNql6E5X+3ad4hPjxCZs7G/5JYlUMi3VRHCzcYP0Z3Rhdj9fx94Occ
	WDMLnDVOE+xLAyIxyZfp8hLXtGTqhQKxW01Ch4jfSiApATm5LsFSz4f2I/yUlVGc
	PbhY7KLnfODWOwWmmLKG0XEPUYq6G1UfupxvZNDJLh+RDTO14c5DACeeFQW4kT3R
	Q7S5vw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46ytkwacuq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 01 Jun 2025 13:29:12 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 551DTBeo023446
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 1 Jun 2025 13:29:11 GMT
Received: from [10.216.12.79] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 1 Jun 2025
 05:58:07 -0700
Message-ID: <e2601e67-d2f0-4092-8622-d5c528d8c5d3@quicinc.com>
Date: Sun, 1 Jun 2025 18:28:04 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/8] arm64: dts: qcom: qcm6490-idp: Add WSA8830
 speakers and WCD9370 headset codec
To: Alexey Klimov <alexey.klimov@linaro.org>,
        Mohammad Rafi Shaik
	<quic_mohs@quicinc.com>
CC: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij
	<linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Srinivas Kandagatla" <srini@kernel.org>,
        Liam Girdwood
	<lgirdwood@gmail.com>,
        "Mark Brown" <broonie@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        <cros-qcom-dts-watchers@chromium.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-sound@vger.kernel.org>,
        <kernel@oss.qualcomm.com>
References: <20250527111227.2318021-1-quic_pkumpatl@quicinc.com>
 <20250527111227.2318021-8-quic_pkumpatl@quicinc.com>
 <DA7SEY5S1F1Z.1LZE7191BKBFM@linaro.org>
Content-Language: en-US
From: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
In-Reply-To: <DA7SEY5S1F1Z.1LZE7191BKBFM@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=JIE7s9Kb c=1 sm=1 tr=0 ts=683c55a8 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=Gb2ctWwJMhN3Q1VwubcA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: oxhMXy4X7XDqJT8accXY9JZZ0sZVcPmq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAxMDExNSBTYWx0ZWRfXyRnaL6WB2LHr
 HwpyEjnSqN5JhIWStHRpKHv88eKLU4AzWGMcosG3lkjE9C7KGY3UpSxsaNR7rfdSqce9K9F66hf
 xBxW9JYCpp+G83P0wPE3eIiG2ZxOmEZTN5/+/XykA9m97WciB87WQV44rwkfmEaRPmihJ4KMyt1
 ZsDxRDq6adZ0fk1FGO4fNM5e8rlg4fz+KJjgnhsPpGJh5+SPtGOX431BLjv/+H6lFL3CTkNl0ir
 BnDTjgc40HjXop3gajvNCaJrykvPjoKlX814DIZ/MNcZ6ZIQq0bzxS0f2lan0IEh8k9rucjsNea
 TEUxz2BVhnya9csdrBLHUoiByCJmEmH0jJb3vB4EpezLMcGg/wt4jTCynYnjs6fgQEfJHw+MJqq
 E7ay+pnm8ZOSQaxE/AZiAoPy/6jrz8WkUXSvbC0iaEmq2pLv3VCnYuMU7iIGGC909vZmpzSY
X-Proofpoint-ORIG-GUID: oxhMXy4X7XDqJT8accXY9JZZ0sZVcPmq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-01_05,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=778 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0
 spamscore=0 impostorscore=0 clxscore=1011 malwarescore=0 lowpriorityscore=0
 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2506010115



On 5/28/2025 5:50 PM, Alexey Klimov wrote:
> It will be tremendously useful to add comments that elaborate the {rx,tx}-channel-mapping
> (and port mapping for what it's worth) here like it is done in other dt files.
> For example in the same way as it is done in sm8650-qrd.dts

Ack, Will add more info.

Thanks,
Prasad



