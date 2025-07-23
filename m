Return-Path: <linux-gpio+bounces-23692-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B7FB0F1B6
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Jul 2025 13:55:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D8513AACD8
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Jul 2025 11:55:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B91F72E541D;
	Wed, 23 Jul 2025 11:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e3d4eFH5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205E82E499B
	for <linux-gpio@vger.kernel.org>; Wed, 23 Jul 2025 11:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753271733; cv=none; b=WMSeRBxGtIMBls1rducem6HbcBlWyiGRdUoXZvYH5QscTR8W6vtsv5NzrY42PFYArPu2o63Q7E1dkAHPkKi9T93DTrTmT/+pJFt/097aP38DpBVDLSzz519CzoE/87lUUWbghLf1yP3zSmuwVP9rmcS+UUZSk142XWZA0gNqncg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753271733; c=relaxed/simple;
	bh=MoQhwJC2u9Y+tLlDaDW3Yj6vblx2mDmweBd2OxyalOA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VOm348/6S83chloy4D7AnZsziOramiDh5bImukWGNVNe90EjNOiZ1SmGHJ20CDRVswNpdm2EsaofASyx7OXpe2ipxS1I2C2Vu5390tI+eBvpDpLTaAxxhBUKLASaGaMjMeeCHdBUW9vPtsXetxiKq/PIoSFGQdc79mIaMAfOET0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e3d4eFH5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N9pHTp019472
	for <linux-gpio@vger.kernel.org>; Wed, 23 Jul 2025 11:55:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9LwQvdbcS9vqnDYnAsymKgiBjVaP1nufmyKeF5nfoc4=; b=e3d4eFH5ELMBAGQi
	ChgOJ3KXoc+nfsxDj4bZMCaVSvNvhm69kt0bSRaxJ4FZkAdsBkR6hfGu2D0yjZRD
	gtPu8ip18ddF8av/pXets1rfaFuEDHKQC/kQnm+oaKWtV+I/I8sWzDhfUVCkZwX3
	20KUb2avAYIR+pBLPKv6a7FQ1Qlcat8rVF2/T1pE0BOWhaq+LUvGMFSvjo80YgkZ
	7waGaZINEnRYhLzhYZGyXylW/OSbqHRzoZa3J84ugfMa43H4gqwyZ1gdLD9JUPsA
	ItxGe8amxjocBcnyt8nmwnofTWDdVN6GrjnRGzRFwDgQbOFrP9NUBuafuuia8rf2
	lPADcA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481qh6q79v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 23 Jul 2025 11:55:31 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fb030f541bso15876826d6.1
        for <linux-gpio@vger.kernel.org>; Wed, 23 Jul 2025 04:55:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753271730; x=1753876530;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9LwQvdbcS9vqnDYnAsymKgiBjVaP1nufmyKeF5nfoc4=;
        b=AIRQbQwtvbmjHQJ+FC0jbI//Gwb1bu/e69i4ii9Vor/I0cbE4uMUEssrnmQyd7telE
         5H0AuapWBw1uHFZdl1j1AsKfR8r9yVDrGzt5dDQBCv1BUi/ZKWwBlNtbPn8skXcOwVn4
         h6K9Smo09ZSGRtSayOoryH0l6EXpZ8CTEj9sQ5j0YgtsrrW8bEqoz9q/YEiE4FDP8+Sa
         wK6iVdC9NCvWYuV0iTIOorTue1jri7ID+kAAdw8PpQ05xF9CNtVbas/fXg/zZ3N50NHX
         DE4FPcpT2FF3xxl0SizDdwTkK5To4dEt3uoFfwZc+S2pK4F9artCz3Gix5WytnIiQpvX
         hYOg==
X-Forwarded-Encrypted: i=1; AJvYcCUDeYOyXTJ56zCo8tNKGDzS+Q8OIMLxn2MFyruelTHy0UG8Avt4Pdn69/o9cNjK+Bf0h+aEpXaT4JQ0@vger.kernel.org
X-Gm-Message-State: AOJu0YwDJYAZvdud0R7iCBHv/lNvvFJN+Yasor6SAbX1xPita665aFXY
	JQVNW6F8OGB5wh3RbuRGRhQb0JYMBZ5Xm9i7aaNp4Br0JfE5pf+CihhPvtp6UG9XB1J0wlXsrXz
	KZnf44z5pvFqdzq3Bi5voAz+RtQzxOFSOqEtjRLWUsJUjTPgDUkOGHNpyMuOueqmnqZi6LMqB
X-Gm-Gg: ASbGncv34U8upUk++oiFUAbTMuV9/nIMEoGp2aQ4TH/EiIcoJmhME+XWhNSzJnjtG6B
	tekcwC3MorG77xhYxR6vgS21BI9o3gKTGLOzuac3tyhQvQcMCfly3SXrUCJDBXXQzut0364bKS3
	QQxUlXqF/PJJEqwIcvmR8QB8FKjzNG24JT6B2hbNjERFKOX+FOCbjfWFyAZBfn8DEnB3yOTrE2l
	LMUMYg+I0bqKU6VD3ABsajxZCrFCEu95MT21c6pp9GpOHy7oYobLREeXsodGVE+rovYjcharm9g
	fjGEFfX8mZL8u2nwbxU2uNBVNgKcUmJ2STUHRaF3X0tF4XKoTNm3LW8TJ1QlSGW3tIZmxulPXMA
	NLABanEOCNPPikye9Ug==
X-Received: by 2002:a05:6214:246f:b0:705:19a2:c26e with SMTP id 6a1803df08f44-7070056dbcemr15043426d6.4.1753271729701;
        Wed, 23 Jul 2025 04:55:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPNIBqtK0Wyao7I4GLR61bfDwSTz2EK0WSLGM8xRQ/zUKkuKthVKvOpycFyxvFD1qSQsn+Cg==
X-Received: by 2002:a05:6214:246f:b0:705:19a2:c26e with SMTP id 6a1803df08f44-7070056dbcemr15043146d6.4.1753271729132;
        Wed, 23 Jul 2025 04:55:29 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6c7d4806sm1034993866b.39.2025.07.23.04.55.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 04:55:28 -0700 (PDT)
Message-ID: <d37879af-a1fc-41d4-8e31-2abba6fd6d57@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 13:55:26 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: pinctrl: qcom: Add Glymur pinctrl
 bindings
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>, andersson@kernel.org,
        linus.walleij@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, quic_rjendra@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250723103644.4058213-1-pankaj.patil@oss.qualcomm.com>
 <20250723103644.4058213-2-pankaj.patil@oss.qualcomm.com>
 <70277682-94e7-4905-823d-25ae76f72ee2@oss.qualcomm.com>
 <790fd85b-fb24-4d44-bdb1-706c534d1da5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <790fd85b-fb24-4d44-bdb1-706c534d1da5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CZ4I5Krl c=1 sm=1 tr=0 ts=6880cdb3 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=E8IWMSBLE9DYRS0HZ4oA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: gE45gsYpfN-MvQ24AAb8hsd7IMrEslW4
X-Proofpoint-GUID: gE45gsYpfN-MvQ24AAb8hsd7IMrEslW4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDEwMSBTYWx0ZWRfX+4M73/rWetjr
 +LwKQDjLgLuwN+r7w60ACooW1648Gsnyrclz7OZAhSyRJPjelX9EPvHjzFBX9FFpCGeuGwfw5XX
 34FPAmrLRGtL0+3kbGW33P+j3HWt35C8Fxz0au4tfy0fEIKk1ujoJqrEdL6PDp/gMIlP4/JaQzk
 gbXlM7K1RGLELJ2qyDlfUf2gN9tKEGgw+r1CYQY4zlaUp8uYv1TtpFBV81lEHcDcgr+4KTsCRRK
 HwynnRiaEtSajzGp6qAtO17lK7nxa+0ohBT9meDWOQ5AvL3Jra0HTnEjBUhIpKcyQ0hxsHBoK6/
 bjlW5ltxYguZXtiW078jfXKz4UWRW/F4G1KPwq5MFX5QmfmAU0hZVMBiNtONkhVwnCVGdZT+q0c
 IStsnmj0xwZdP6UYNMXTiARIIjcEeh1QOoFAgmkEeJrsXtZwzyPVMcykUUECO5JoIJ5+dnxu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 mlxlogscore=843 impostorscore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 bulkscore=0 spamscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507230101

On 7/23/25 1:48 PM, Pankaj Patil wrote:
> On 7/23/2025 5:10 PM, Konrad Dybcio wrote:
>> On 7/23/25 12:36 PM, Pankaj Patil wrote:
>>> Add DeviceTree binding for Glymur SoC TLMM block
>>>
>>> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
>>> ---
>> [...]
>>
>>> +      function:
>>> +        description:
>>> +          Specify the alternative function to be configured for the specified
>>> +          pins.
>>> +        enum: [ gpio, RESOUT_GPIO_N, aoss_cti, asc_cci, atest_char, atest_usb,
>> Any reason for           /\ to be uppercase?
>>
>> Konrad
>>
> glymur_functions enum members fetched from ipcat,
> this does not exist for sm8750.

I'll repeat my question

Konrad

