Return-Path: <linux-gpio+bounces-31281-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8K1KDb46e2mNCgIAu9opvQ
	(envelope-from <linux-gpio+bounces-31281-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 11:47:26 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A77AF0DD
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 11:47:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 526AB300D963
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 10:33:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78D3E3815EC;
	Thu, 29 Jan 2026 10:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KiS+XQfl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Js35qjLH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A1B3815E4
	for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 10:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769682826; cv=none; b=Zq8AoS1WMtyPCSGBtIpt5vg8PLJlyIlcF01UYQgIUxC3LAoI8u1tWQYU0azYsPwvKtPxrUYrKxwYpX5l5kT7yYwpXNnstHhsT6ZBO307qS6hSrFPOkoDl+4WkGNDpGR3xymAwfBtm3r5yZBoZcdtDGhfvNq4AN2qFiLiq6c3LyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769682826; c=relaxed/simple;
	bh=RKjzM+AzWEd2xLqDveQmeQFdcy+M78s4wSRN+pTC75o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LVoHDTEEL8HRPnjsWT4h8+y3qenEeBvrbTfVHpUyk86ucBISw2KrB4ByNyr1Dms9mvqC+xbV0f+izl8HvVxsmzid0v3+T1DgeGv6SXisykf8NswEWcB1ge2LOJqkuh5LAvHWc13j2iPZDXeXiPcl/BkLfLbQGbxRdIs1J/DHcNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KiS+XQfl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Js35qjLH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60TA7k2v1565053
	for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 10:33:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XniacV/s3o9H91GWrpTbMKzmS7SyJtuAfhbd5BWpqpY=; b=KiS+XQflezgVQ6GB
	ta7uC/l56nU9wSgZ1xd0mERxwlyJi3hbc7+QJGgfSietA3fh8Y+YZzUQaQAvQI+h
	JWQsjGCxuN1dp3RaZx/NQy/7jUpW+55v7p0SKWQ2SO2WIP4PuAGgyI3jZNFHwf7a
	RzdgmbXEvbkTjK5XBj15EkV+YMSlBt2nZO7NT3zlSrVAsn7yWHmtBz6JJ4mVBe8y
	X7bsAhFx9x4Tq/aAoB2NV119k98/uoU22Ld2s+Lsa7ASlOigFVH5+EJIw4KvCtT+
	meLWbMJc3c6iKyg8CFyFMu0IkLLIIho+5tHjg+2n/BrsAysVuJJrSY+yS5gaKDEU
	IhtsLQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4byusfhx7v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 10:33:43 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a0f4822f77so22912185ad.2
        for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 02:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769682823; x=1770287623; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XniacV/s3o9H91GWrpTbMKzmS7SyJtuAfhbd5BWpqpY=;
        b=Js35qjLHvt8aLS3/CjYi8nhKmZDbpX/deeWlocTp8ASIv3tPs6AHlDODept9BQlqD6
         nBpAwZWqLGPtDwSvxdg29jh/ktUmPFGUtrfHJZbgHMygsI/dyPCofg13RnXqlplvs1bG
         fKAec4eiI+AxAhtYuTLB/ccF7Z3O9xtykMGRSfRjvh23oeQJJbEJ+l0IfDQtpIU4syFE
         I5JrrHcL7IbjUR9RX+mDCRAmNqsDAKD5RVGZ3oafXAoP6NPkdaLBQ1SiCEQ6NpSDbI7s
         CtyiPbV5/0ugD+Bn1u5z1zdTjrd2A9SSnj9Ak20B8dJfwFz2eNJZosA8aqnAOwfcTKdr
         HAWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769682823; x=1770287623;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XniacV/s3o9H91GWrpTbMKzmS7SyJtuAfhbd5BWpqpY=;
        b=Sqp1uo//iBx9nEQZgIlXzDfCRXKvnYXLPNDvwyy5AnZQHhGpA1RVkLHicRLrRfH9Xr
         lYBTdGyKWXND/HHsRs8F+aOka8mQW29vn3pCbYURAWvW95Ujer8UUqcpXd4A7/YTYGUH
         bozke1i64wZy3ZhbxOYyZkK4woWrL+fwvQ+1sqIFNQIEio0l2/nbkST1jEft83EK7etN
         i2Sq7pQHj7afirnX1j+/Lh1PgrOwGvJ4bTtrFG0PMPO1sZqbSNImPUEr1DoCldbzaiYr
         1G2vseYriV5CA8F/Oe/5/EoIFeV09Yai3j59gOPopMPIftcVub2k4lUhOlxIgqOfwbgP
         2U1A==
X-Forwarded-Encrypted: i=1; AJvYcCW20XXQeHVup9yIK/En6zUmfkinr06x8n4fTwnj4elYRgkv101knRYdArEmkU6VyteQsR1fbGBFvIhZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzUX+GHLrYTsSpGwTeYWYMSv493fNBefdhgbc4rqIhheCPjsxNx
	uCvM/3XlpFs0gWAmIzQpumAVHLdMBNUXeddqM2E9s4UoPe0//pxxMRWeRprfAt40M9RgA8aBKzN
	Lk4OzlFFo8W2oSFIMBe5wEaHZEEQX7Fs0GBmnqRvy9zPx13RmD8mrbVzrv6W5q2QV
X-Gm-Gg: AZuq6aJTbT9LaSUNvcUL7ZpmUEWcEI9WlO6hgu6TlNpPqnHjN6lfASXPzGTvDRrRlZE
	+X5+9pAG6va1vweXSJnEFJTmYfZYUHy7uDCP7pU7SG6LbJlLRYZHdRu6pxii4UKYBT2z2okjAcE
	wUTJu1gUjihhq4Rbn7x1EEmALX306J1PzElnQYApKu1AD4PPFNVTVumRTHGVjvffJe6ZXvSmsRn
	j7RDGxJ5P/ICmuIhOmbuoUGC9hy74XhQ9O19KSc8yQn3qiVISLDtslTLOdbDndQXCQ0hF9izQzo
	bKsC20g33Yh5NlCfwc6rrC20mBfw18T/6rEc5etIU8FXBdi+MMlPgGu5yK8KqF2NBCY13BhZFR0
	NvYFtqNTMCfNWOGxpY/ydx+rBuu/2qybTHQSYPo754hQOyiyv
X-Received: by 2002:a17:902:cccb:b0:2a0:9ca7:7405 with SMTP id d9443c01a7336-2a870dc9634mr87914225ad.36.1769682823238;
        Thu, 29 Jan 2026 02:33:43 -0800 (PST)
X-Received: by 2002:a17:902:cccb:b0:2a0:9ca7:7405 with SMTP id d9443c01a7336-2a870dc9634mr87913935ad.36.1769682822728;
        Thu, 29 Jan 2026 02:33:42 -0800 (PST)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b4c3d2bsm48006435ad.53.2026.01.29.02.33.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jan 2026 02:33:42 -0800 (PST)
Message-ID: <81f0ee3c-a7e3-4730-a396-9599ddd45f53@oss.qualcomm.com>
Date: Thu, 29 Jan 2026 16:03:37 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] dt-bindings: pinctrl: qcom,sm8450-lpass-lpi-pinctrl:
 Add SA8775P and QCS8300 pinctrl
To: Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij
 <linusw@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260127105511.3917491-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260127141740.GA1574044-robh@kernel.org>
 <9f5436df-fef7-4921-85b3-b6fe4e942779@oss.qualcomm.com>
 <CAL_Jsq+YYxWKaD-Xo7L3VUAJ=wvpbfW9GkKn0gcj3AOvMb=Uhg@mail.gmail.com>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <CAL_Jsq+YYxWKaD-Xo7L3VUAJ=wvpbfW9GkKn0gcj3AOvMb=Uhg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: i4IE-HyaFnEG6qMgGKnUKasQoGb-JLoi
X-Proofpoint-GUID: i4IE-HyaFnEG6qMgGKnUKasQoGb-JLoi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDA2OSBTYWx0ZWRfX3DxUEh3Jcy5C
 7MAAK/4KJ03u7WMN4g5CI3v+b6qISt12rCyaW9N6/cY8GwW/WVDgIPDB/Rumz0ptskU4X0zBpvM
 LoQq9MRsOBU6c87PiQXMFLzt53XqfktG1e/3Y7IqycUwUYxQlNwZcwzoSfmtrdW+cLe/UytQvw6
 ZqvVB0Phgxa5GqGoAn4jmPrgleDTMq+eMSHe4AlISV6R4IYU02iYS1i+3e9CFHq1DesUqsvjcl/
 m1Lq5m3OvpnCyFDWbDFb1fB5ELcMoLUS3BVy/7pxHnlI3gtb6B8DRiIgOWpYmQR/0qXk+3e1GFj
 cXPhiEzbaPIMLTJz4wzCHy0idlbGCxUEad2MZGKwPTeSvb5x8i82+E846pOuTeCebcpIAtYmxdb
 a46uxNrwA1Czv8yiJEAVUmKDySGKhcgUFpLlQfz4vXcCaRpNHrmHMf6JqggkzQVNfq+lr29J6ez
 KNMquom8+RTMnabvsjQ==
X-Authority-Analysis: v=2.4 cv=YtIChoYX c=1 sm=1 tr=0 ts=697b3787 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=iS5eDfI7LrtSjKTbtTEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_02,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290069
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31281-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FROM_NEQ_ENVFROM(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B6A77AF0DD
X-Rspamd-Action: no action



On 1/27/2026 11:57 PM, Rob Herring wrote:
> On Tue, Jan 27, 2026 at 12:13 PM Mohammad Rafi Shaik
> <mohammad.rafi.shaik@oss.qualcomm.com> wrote:
>>
>>
>>
>> On 1/27/2026 7:47 PM, Rob Herring wrote:
>>> On Tue, Jan 27, 2026 at 04:25:11PM +0530, Mohammad Rafi Shaik wrote:
>>>> Document compatible for Qualcomm SA8775P and QCS8300 SoC LPASS TLMM
>>>> pin controller, fully compatible with previous SM8450 generation
>>>> (same amount of pins and functions).
>>>>
>>>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>>>> ---
>>>> changes in [v3]:
>>>>    - Removed the duplicate driver code patch as suggested by Krzysztof.
>>>>    - Reused the existing SM8490 pinctrl, which is fully compatible with SA8775P and QCS8300.
>>>>    - Link to V2: https://lore.kernel.org/all/20260107192007.500995-1-mohammad.rafi.shaik@oss.qualcomm.com/
>>>>
>>>> changes in [v2]:
>>>>    - Fixed dt-binding errors reported by Krzysztof and Rob.
>>>>    - Added proper slew rate value for wsa2_swr_data GPIO, as suggested by Konrad.
>>>>    - Documented Monaco compatible as suggested by Konrad.
>>>>    - Link to V1: https://lore.kernel.org/all/20251116171656.3105461-1-mohammad.rafi.shaik@oss.qualcomm.com/
>>>> ---
>>>>    .../pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml         | 10 +++++++++-
>>>>    1 file changed, 9 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml
>>>> index e7565592d..354629c38 100644
>>>> --- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml
>>>> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml
>>>> @@ -15,7 +15,15 @@ description:
>>>>
>>>>    properties:
>>>>      compatible:
>>>> -    const: qcom,sm8450-lpass-lpi-pinctrl
>>>> +    oneOf:
>>>> +      - const: qcom,sm8450-lpass-lpi-pinctrl
>>>> +      - items:
>>>> +          - enum:
>>>> +              - qcom,qcs8300-lpass-lpi-pinctrl
>>>> +              - qcom,sa8775p-lpass-lpi-pinctrl
>>>> +          - const: qcom,sm8450-lpass-lpi-pinctrl
>>>> +        minItems: 1
>>>> +        maxItems: 2
>>>
>>> No. You are either backwards compatible with sm8450 or you aren't. The
>>> h/w is fixed.
>>>
>>
>> ACK,
>>
>> Agree,
>>
>> Need backward compatibility with sm8450 for both sa8775p and qcs8300 as
>> they must fall back to the sm8450, so initially used enum to pick
>> between the sa8775p and qcs8300 compatibles. I see enum isn’t
>> appropriate here since fixed h/w.
>>
>> will use the const instead of enum like below.
>>
>>    properties:
>>      compatible:
>> -    const: qcom,sm8450-lpass-lpi-pinctrl
>> +    oneOf:
>> +      - const: qcom,sm8450-lpass-lpi-pinctrl
>> +      - items:
>> +          - const: qcom,sa8775p-lpass-lpi-pinctrl
>> +          - const: qcom,sm8450-lpass-lpi-pinctrl
>> +
>> +      - items:
>> +          - const: qcom,qcs8300-lpass-lpi-pinctrl
>> +          - const: qcom,sm8450-lpass-lpi-pinctrl
> 
> Sigh, no. The 2 entries can be combined like you had. Just drop
> minItems and maxItems from what you had.
> 
> And test your binding before sending it.
> 

Sure, I’ll take care of it going forward

Thanks & Regarding,
Rafi.

> Rob


