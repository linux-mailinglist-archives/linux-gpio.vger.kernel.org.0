Return-Path: <linux-gpio+bounces-24832-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 82230B3218D
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Aug 2025 19:33:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C504B233DD
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Aug 2025 17:33:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05DB33128AC;
	Fri, 22 Aug 2025 17:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Ut2gKRSU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0253828E579;
	Fri, 22 Aug 2025 17:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755884023; cv=none; b=Six5breNF5UlmdbOJMTXhT5G1e+4ftayLd+Sm6S/O78haenrYqw5W6/9rGmWbatuAFhiZ5rdtqyLer5tXCI3Tp3S9snuRnSRSy+C86Zenc1MKoI/N5bLzgzUo//AfrUoq0kSCUKXDesfkNEZoMj0QLBzmlunqqZpwGYIIhgQ9r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755884023; c=relaxed/simple;
	bh=qzGcX2QKJZgPau8n3KCGHQhknefVrNuVSIhpxGsvuW8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=h3+XdSlzbbdWaAHpKK0NSNSISfSTOWkxMPo/vuwhpqNSUEjLpGfepj2er6kf2y1SSAHHCcbgwj3dwCOGEDXzrdkKM3DaeSrGI6fTrGmjmIh9W63rqEiC+9wMZ+DwSmhZ2gPZbDD64cRLPkNoJN/pP6AR2kLuiF0dAz415vZ+a+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Ut2gKRSU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57MHV3Ht019350;
	Fri, 22 Aug 2025 17:33:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lwBcAcs5br8qQtNHRCfNFC2LF/dfcqaA+kuFhinPq08=; b=Ut2gKRSUymGL4/bK
	c9MIkKE7fuCO638jNdFZFemNgcLoYBGF+5gSS7CI1zlrDvILZgOt/2buTbxk2Oa0
	yf2LsmRjJiXzl2zld+G+N09p9WDXeGGZXiJ+bCpr135zikkBuhpUSEhloX0X4hNV
	fgRYKcqnWI4To7KSr0aHknFHo0aPDXpZSWoWGOXdKeIEn8Yd9QfmIkRmOJoCTDUg
	aiFpiXl8rCFa9nmNRyOZjBtck/P27a9AL2jMMBn57RMUoKLhhwx/29eJCD4oX3ik
	JTxLBJ7O0CLzivkHiMJpMVSvEKGI0VwnROwNPdYyzzD/rsCWNwNeGsMcOsupJWwj
	KAkEwg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48pw10r0cv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Aug 2025 17:33:36 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57MHXZEv026286
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Aug 2025 17:33:35 GMT
Received: from [10.216.23.37] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 22 Aug
 2025 10:33:30 -0700
Message-ID: <c81019f3-3570-4437-a10a-d49cabc4952d@quicinc.com>
Date: Fri, 22 Aug 2025 23:03:27 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/9] Enable audio on qcs6490-RB3Gen2 and qcm6490-idp
 boards
To: Linus Walleij <linus.walleij@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        <cros-qcom-dts-watchers@chromium.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-sound@vger.kernel.org>,
        <kernel@oss.qualcomm.com>,
        Mohammad Rafi Shaik
	<mohammad.rafi.shaik@oss.qualcomm.com>
References: <20250821044914.710044-1-quic_pkumpatl@quicinc.com>
 <CACRpkdYEzbM33HBAhHEmAg9f4Zpi=2WvqPdZ35=M2eVCqcTTFg@mail.gmail.com>
Content-Language: en-US
From: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
In-Reply-To: <CACRpkdYEzbM33HBAhHEmAg9f4Zpi=2WvqPdZ35=M2eVCqcTTFg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIyMDE2MCBTYWx0ZWRfX9pZidifCGK7S
 jn07VXThat6c3gUuOxH3AD+f0IG1JNB4WoCuDf2wwFVzqIXCQ9gtHcsIJ+nfhuR7I0nLUwq/24C
 QZD36ryFNGTwSCsobS/792yjN46l50eAdZOz9MBC9aSuGVHcVZkNeDFF0VEo1CmA53iU8e9F6Zr
 fn0MA/HyUmqpAnCHDiROGNZQOEFS5C6GgEZkvPOJ03eyrf2SjY/7LUZnM/D8MInThV7BD89eGP4
 vQB09SFK2RngOvky69hNw9UNykO1DMyPl4rbD2qxkmYkE81X/eof3510+HQXlZLrI73cqNg0Edz
 gxVxt9tDmMTyY+qxeLoh1rX+ot00li2PH61jBn4gQx+xLIPevkvDwjYt6XBDZt1wC/OaGieFbaf
 KCyK3+cz
X-Authority-Analysis: v=2.4 cv=eaA9f6EH c=1 sm=1 tr=0 ts=68a8a9f0 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=eBniO7g4Yh2Fc4B1ST8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: o6nGBWm1tINpdsv4yEeZS4GtajS-cSJS
X-Proofpoint-ORIG-GUID: o6nGBWm1tINpdsv4yEeZS4GtajS-cSJS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_04,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508220160



On 8/21/2025 7:04 PM, Linus Walleij wrote:
> On Thu, Aug 21, 2025 at 6:49 AM Prasad Kumpatla
> <quic_pkumpatl@quicinc.com> wrote:
> 
>> Mohammad Rafi Shaik (9):
>>    dt-bindings: pinctrl: qcom,sc7280-lpass-lpi-pinctrl: Document the
>>      clock property
> 
> Can I just apply this one patch to the pinctrl tree?

yes, please go ahead.

Thanks,
Prasad>
> Yours,
> Linus Walleij


