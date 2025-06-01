Return-Path: <linux-gpio+bounces-20844-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 299C7AC9E8F
	for <lists+linux-gpio@lfdr.de>; Sun,  1 Jun 2025 14:56:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 14D173A74B5
	for <lists+linux-gpio@lfdr.de>; Sun,  1 Jun 2025 12:56:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E97BC1D6DB4;
	Sun,  1 Jun 2025 12:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LODSynJb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2042DCBFC;
	Sun,  1 Jun 2025 12:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748782597; cv=none; b=KvoRqsFRVKUVX6W6scFL+boQWBeFZSaLA6wKmOxykmYGk+fHD60MTZ5gTksyKHbGlThMQdrdwkU0VHMo/ebgefaWHbiJl80tBzPdewABOjBgVmQB9Y7AAB3ln1nuq/HCThfgCfNU1nqGFdcZ0oUSs4QkyyWYE0dVwRBp8uLUD0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748782597; c=relaxed/simple;
	bh=Dnl4Y2BK3WtjOt+CxyEJWXgQkE2yxvrk6MEqBckDMcc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=WgkzOsamYMYPl+TqCGjQm0UMK/pZ/bZHVzQ7eI9Zy50n2JKxl67W5VRzY8RV8KZfsNGdhjNf1J/KWRk7Crh2bR+/R/VfNMX+n7Y1vSeiM3dB8ES08nP39MThpI9lxFWBw5eGCuPDeplj/DmRC+cnpJK6J87kZ/h81NqeGM5Z8M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LODSynJb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5514p3VE028141;
	Sun, 1 Jun 2025 12:56:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OizP77fkCqFN1pfB9pzGKHVzzqcNqKIpPyPj6N409QU=; b=LODSynJb5pswLgU+
	pii5gZmYlk7TdF8yOFODcvz3PhTaO9pM1RQKUNuNCWRTKxcSlXV5FtYk22Z1dk8r
	/ggeuYIAlz1FQxkJ+Oa4CxcE3m04SwLYYF9PHBXkp22cKeiXUW3TCku4RvCg+0zc
	Nw/udOFQxU66m1ZHxsFqyxudSQ5uFFtIz8AqVyoaUKM350+1SBI+GC06jLwzPofn
	o99DsmlmXGUsD2pRk5yYr+Bg6JWsoOqITkGQpPp/gbw15o2BVCIvrcWTIk6ngE9i
	Dty28efHygvyzpMUVUig93ERITs6T6twyDg55otiRhNUru64A0taSNuUZ9pGcaA0
	7cWRVA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46ytkptak8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 01 Jun 2025 12:56:31 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 551CuUiP022433
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 1 Jun 2025 12:56:30 GMT
Received: from [10.216.12.79] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 1 Jun 2025
 05:56:04 -0700
Message-ID: <67117603-0636-43d1-82c0-cdf39babeda6@quicinc.com>
Date: Sun, 1 Jun 2025 18:26:00 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/8] arm64: dts: qcom: qcs6490-rb3gen2: Add sound card
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>
CC: <cros-qcom-dts-watchers@chromium.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-sound@vger.kernel.org>,
        <kernel@oss.qualcomm.com>, Mohammad Rafi Shaik <quic_mohs@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>
References: <20250527111227.2318021-1-quic_pkumpatl@quicinc.com>
 <20250527111227.2318021-7-quic_pkumpatl@quicinc.com>
 <0f70110d-4861-487b-834d-f217c9a77384@kernel.org>
Content-Language: en-US
From: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
In-Reply-To: <0f70110d-4861-487b-834d-f217c9a77384@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 62Rrdihgir1NTIdCLHthtZrW4AFdLVOU
X-Authority-Analysis: v=2.4 cv=SPNCVPvH c=1 sm=1 tr=0 ts=683c4dff cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=_2Pm6FfrxIRCaX_8azEA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 62Rrdihgir1NTIdCLHthtZrW4AFdLVOU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAxMDExMCBTYWx0ZWRfX0/TR050VipW/
 DW+pvX4iObd3ITH1ZjlC8r6trxvInNANtlsRSGKPpsyvscTReL1TEZC0TeiLt7AmNNZFC86zyTH
 hVZQ1dZceVp4Ys79f00rB5ZRBcuPVjZDbRWfMA66N34YcHXvp5joOgKfWiFCnK9g2IlAGZBK7xf
 sRapryNgl6UgRenrq8/o2AFqKpBH855MrtxMUqenKCYqlLW0uq7tEr7277A/AfQnkfudMAqhDSx
 9hc9WyN7uWdLXWLRn4x00cJeRWP2GFUq2vjoUkQKbbPoqprPc/dBhE9L44TjZu4Y/a2faL3qLHy
 ioL9ROjz/q83ks+uzjEyr3YsUtwc8DE5UHVfx5gRWdQWRI3NR8+9Jfz+78Wcx4HDaeQqdll3/ix
 H++0papSmmbG0F5fSmazqt9N4dfLq6aBG5nP59ifEaEiw0+a+9zPF+mwx78SQshfSKFU42Ep
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-01_05,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=735 priorityscore=1501 bulkscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 mlxscore=0 spamscore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2506010110



On 5/27/2025 5:30 PM, Krzysztof Kozlowski wrote:
> On 27/05/2025 13:12, Prasad Kumpatla wrote:
>> From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
>>
>> Add the sound card node with tested playback over WSA8835 speakers
>> and digital on-board mics.
>>
>> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
>> Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
>> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 45 ++++++++++++++++++++
>>   1 file changed, 45 insertions(+)
> 
> 
> Don't add one-node per patch. Add entire sound for this board.

Ack, Will takecare in upcoming platforms.

Thanks,
Prasad>
> Best regards,
> Krzysztof


