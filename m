Return-Path: <linux-gpio+bounces-30453-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 09590D1289C
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jan 2026 13:26:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7FBAC3001626
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jan 2026 12:26:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F9863570B3;
	Mon, 12 Jan 2026 12:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UIRHPp2F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZWV8k0mq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABCD4311588
	for <linux-gpio@vger.kernel.org>; Mon, 12 Jan 2026 12:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768220775; cv=none; b=HbyMYqylSO/VM/t9jd4OKk6RgvxrHjPn3z+GOZnSmXbGN4OkqrsOtE0RbqY3XfvqQNX9E0FRNwIepOF80GBC0d1avbHRSOInpgMtKtd3cIegrUa4CJYVnXcPkGftduukz0JjjGYjKc2BFddTN5CrHFh1eKQ3cSRGMNXuK9p7J28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768220775; c=relaxed/simple;
	bh=FSt3SZR1HqIhBpnUzq5+/i0Ny3b9Ke04T8hZL+578M8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uKo0OLAyGLLvjdXl+SJt+eYQdJPXy/d3c6hdLQRxTmPCik35psiWafIZA7qpVJurJT+cHKqFyP2cOhqL0L748/Zf7R2f5e9DQ0aNo8Bn1cwwZXCZTWhzZ7nprAeDH/W2OiLnbAF1w4e57KyxioJNXZPIUZBi+frj8wunAYL5BB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UIRHPp2F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZWV8k0mq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60CB5IxD2821948
	for <linux-gpio@vger.kernel.org>; Mon, 12 Jan 2026 12:26:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	26GhuHqL5WaISYyaolPRIW613+nZwqLB/dWLGWGzMF0=; b=UIRHPp2FZ8jGlN3r
	KYjQY3xtdPp7S0AxIU5nLNKgh2wIF+nDwQ0OfaRqnt04xOHtzXSBpmPP7j9vFlJM
	lCQJJAuxIHomG3VIkba/xzic37SnLHwOks76avVRYKlO21tQwhjBI65pna7jsZiD
	SqRL4B5rssdIvLRsaSpWJBaJWo1zE4BvOftYiherfapieQ0xt06xriFQPA2fY/np
	kCMpkoeqZGICqpRS+MBQ1OEEKOB2UbAFHmMmCfjz29iPGRYKD7ioCAI/TimUq+r2
	M8fo6xx/i/7D++3aeSsGeqq6mmcjD2vPhaiaYluTjaBNsxYag2I4P8YR8X2Kjb6p
	NkbOIA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmysag79r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 12 Jan 2026 12:26:12 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee05927208so23161931cf.1
        for <linux-gpio@vger.kernel.org>; Mon, 12 Jan 2026 04:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768220772; x=1768825572; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=26GhuHqL5WaISYyaolPRIW613+nZwqLB/dWLGWGzMF0=;
        b=ZWV8k0mqfFbpSgKXUmbMWpAs/m1qbCpO8iweZBcroTGvqYOvRIvHRV9oNRMh0Yk40m
         oV1wKW8BfGQE1xt8UXayofq7bxmjASn/4uehMNTosyd9cqSPNAsMD6uWjLMVZhZGnqS7
         zRLXLpA+VibNzcYuQsEJG9ZgjM/x4/IxxLkrHsMcY3CzuHxZSNCv+6QbH2JXIeBgJEow
         cRuNDEHo5Txtq4GAo2xZNhKv/7EMen5peKkueFzS6/orMMENge9CLNv9lpcyosBL5Vyv
         W+zg8yIeECOLvJr+KdfxpTjgXs3p50PEv1EY4opeHGnE1oUrCoglHdYRZ9CIgahUK1gs
         yi7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768220772; x=1768825572;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=26GhuHqL5WaISYyaolPRIW613+nZwqLB/dWLGWGzMF0=;
        b=TqVOzNDqgezK6gVXr+lU349f0RQbNvOoc2aDmsE906XBx+0auluofBJqbbjOxSybeB
         Rvoy5DNFxTYQUVVr4+/0ze2YetSmBdVLOq+r0YhpdXLuwB8312vRYPesNHpWJyz7KbDD
         sOAbga2f2ri+bnQuqAy2S/Ndhjv0OB4XExd3M3vgAl6Sg5ZhZ35j9burlb/GSp69Jxgz
         D5XdHD3kMW2B5sGmor4jNRRFJvlDicaK7js3XAqyEg9D8QKARDvsSiU1tT4sp3Y+OTsd
         k8JKpQgVfuyNcgeuIClzDQ1Hs5THLxwK5aHZtLehIYR5G9JAZ0xOgEz/nZL06iWjPUio
         xSEA==
X-Forwarded-Encrypted: i=1; AJvYcCUJzv1It1DHsHnVxI46Wrk291SPpEit570C06v2xO/sS0YHEg6veAHgvC3yODmzF+9hxW3O7MIiajyJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzJynxD5eK2j2jUWaNWNdAN1oJfHYjQsZJ8Y6B+g+wVlHcUfkoT
	uXJDfLAz/nNlhbSQL1MKQSGv1rLo9hDmS0ASKbiFbpV9KcnDqagwyFvkmkawoy9+oJPvIuaDzWv
	opPZA7q164OxvNEw2LUESYzbq+mrBZ9s4R7I9lluPASpOS664ViNQ9nSTT9xeoBPI
X-Gm-Gg: AY/fxX5FdGyV0DEvhLOF4CaRHS4eAWvNJfv/2+Uab+evqTpuEF7bfgORAJAYPNQFYB4
	PPF+9mgSidbAPLBoT4j7KQdIa8HPjsxm/05fbGKJC9k65ed+TahU/UWJj714Bpaj0XSFQE2NjcH
	Lpu3FSHr5oQYWs6JAAhsM9g2/X7tMqyqOzsF5nmU9A5vckSBhY7G4MYFprdP+BIkB37AsoO4qJQ
	SnBjbefeVD/kZTE/n53aI3EZRw7v3EJi99Ytu5E83FTBhXW0iTT8Dab8QkdsQa709o89lYe3UnF
	SxCNBmCeQEwuu+Ant3mZqD1hsaOPE2d4XI+NKFXx+Peao3GDcrFNRpRhnc+rEfdc/LFRk3lckvU
	t7/XTfd9E7mVdDHJQaAYCDnpxodKBR90MT6wvldssUc1Qgec4HJi1joNSWhCTXMkNVyw=
X-Received: by 2002:a05:622a:1890:b0:4ec:f9c2:c1ec with SMTP id d75a77b69052e-4ffb4a2520dmr184757091cf.9.1768220771883;
        Mon, 12 Jan 2026 04:26:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEVF5i0+E+/q0NeLdSSghOCerU11AV8TzcaGAltkl7XpYXjZxHrXxVSsw1hVhk0pk9x355EwQ==
X-Received: by 2002:a05:622a:1890:b0:4ec:f9c2:c1ec with SMTP id d75a77b69052e-4ffb4a2520dmr184756701cf.9.1768220771361;
        Mon, 12 Jan 2026 04:26:11 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b870bcd342bsm445262466b.56.2026.01.12.04.26.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 04:26:10 -0800 (PST)
Message-ID: <e8e575ec-7030-4bea-9a4b-1364d7a49759@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 13:26:08 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] pinctrl: qcom: glymur: Add Mahua TLMM support
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260102-pinctrl-qcom-mahua-tlmm-v1-0-0edd71af08b2@oss.qualcomm.com>
 <20260102-pinctrl-qcom-mahua-tlmm-v1-2-0edd71af08b2@oss.qualcomm.com>
 <91d2e5f7-7d93-4909-9ed2-6b19abf0b448@oss.qualcomm.com>
 <dayj662qu7tb3l2fuq4sfdxunvkk2rt777vm7dfvdazbwiwpzn@mysrwdbdptqt>
 <adlhkus5gvum6fkd7bxjohwlsiumw7w6w4c36vzphjz7my2644@pmobztmgpdvx>
 <zaf4uoms75wc7yvmrmqs53couefqsv5oie2hbiwvhitqonbs4u@aq6bcvf4nq3o>
 <0d6f8f95-01be-4fa3-9fde-bc00cbb894f6@oss.qualcomm.com>
 <025a8ba9-3889-4a8d-84ab-4f3f839f6003@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <025a8ba9-3889-4a8d-84ab-4f3f839f6003@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=auO/yCZV c=1 sm=1 tr=0 ts=6964e864 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=cqb_nhPC8VgIOyrc0CIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: VWk0V5cT2l8UKUjh9VBemCr2pRBvd2Fk
X-Proofpoint-ORIG-GUID: VWk0V5cT2l8UKUjh9VBemCr2pRBvd2Fk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDEwMCBTYWx0ZWRfXxDLctXm3gKIm
 7KkmU4lPREjQ3TvWDdDVDWZ1PM4P/JhGzeHlNuSP5DxH1A7itJVW9pP7R2DMPyWNzIa7oXNWb6c
 5LEqTiNi+AH77vic7ydY5LU4Gd6I1tXt/yMb/72CW8mW8dvurib9b9gr9qTSBoeWisndXBYcart
 2v7ZlDw+H1HepIIhUW62SmM2SQShcvWHFzgRxWgKfOZ/wd2VkH48XCWMnWj3JmbossD7zTuZ+Wr
 NcmdOiDwuibAT8LrZul7fYbWENjrSZCPYlFh91ooPqHkfaLGo5Ly+Kt8NXoKx5TkPZpx+Ki1BN+
 8d9mCCBTlOJwLbYs52HmrLO/HLiKIp1aqTLuRYYHG+mdrSh7HYk0PNw3mO8Re3MOjssUldLalao
 Nm7Pps7piUJA+k1CSxsSc5HqzfGrYm/6+glc9BkXzoFc635L35X+V2W8F1bweX9h3JCBQSg7Ts9
 Khn+kJOcSbnHACVa7MA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120100

On 1/12/26 8:46 AM, Gopikrishna Garmidi wrote:
> 
> 
> On 1/7/2026 4:00 PM, Konrad Dybcio wrote:
>> On 1/5/26 6:20 PM, Manivannan Sadhasivam wrote:
>>> On Mon, Jan 05, 2026 at 09:31:03AM -0600, Bjorn Andersson wrote:
>>>> On Mon, Jan 05, 2026 at 11:04:44AM +0530, Manivannan Sadhasivam wrote:
>>>>> On Fri, Jan 02, 2026 at 01:40:22PM +0100, Konrad Dybcio wrote:
>>>>>> On 1/2/26 12:07 PM, Gopikrishna Garmidi wrote:
>>>>>>> Introduce support for the Mahua TLMM (Top Level Mode Multiplexer)
>>>>>>> in the pinctrl-glymur driver. Mahua shares the same pin configuration
>>>>>>> as Glymur but requires a different PDC wake IRQ mapping.
>>>>>>>
>>>>>>> Changes include:
>>>>>>> - Add mahua_pdc_map[] with Mahua-specific GPIO to PDC IRQ mappings
>>>>>>> - Define mahua_tlmm msm_pinctrl_soc_data structure
>>>>>>> - Update device match table to include "qcom,mahua-tlmm" compatible
>>>>>>> - Modify probe function to use of_device_get_match_data() for dynamic
>>>>>>>    SoC-specific data selection
>>>>>>>
>>>>>>> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
>>>>>>> ---
>>>>>>>   drivers/pinctrl/qcom/pinctrl-glymur.c | 43 ++++++++++++++++++++++++++++++++---
>>>>>>>   1 file changed, 40 insertions(+), 3 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/pinctrl/qcom/pinctrl-glymur.c b/drivers/pinctrl/qcom/pinctrl-glymur.c
>>>>>>> index 335005084b6b..bf56a064d09c 100644
>>>>>>> --- a/drivers/pinctrl/qcom/pinctrl-glymur.c
>>>>>>> +++ b/drivers/pinctrl/qcom/pinctrl-glymur.c
>>>>>>> @@ -1729,6 +1729,25 @@ static const struct msm_gpio_wakeirq_map glymur_pdc_map[] = {
>>>>>>>       { 232, 206 }, { 234, 172 }, { 235, 173 }, { 242, 158 }, { 244, 156 },
>>>>>>>   };
>>>>>>>   +static const struct msm_gpio_wakeirq_map mahua_pdc_map[] = {
>>>>>>> +    { 0, 116 },   { 2, 114 },   { 3, 115 },      { 4, 175 },    { 5, 176 },
>>>>>>> +    { 7, 111 },   { 11, 129 },  { 13, 130 },  { 15, 112 },    { 19, 113 },
>>>>>>> +    { 23, 187 },  { 27, 188 },  { 28, 121 },  { 29, 122 },    { 30, 136 },
>>>>>>> +    { 31, 203 },  { 32, 189 },  { 34, 174 },  { 35, 190 },    { 36, 191 },
>>>>>>> +    { 39, 124 },  { 43, 192 },  { 47, 193 },  { 51, 123 },    { 53, 133 },
>>>>>>> +    { 55, 125 },  { 59, 131 },  { 64, 134 },  { 65, 150 },    { 66, 186 },
>>>>>>> +    { 67, 132 },  { 68, 195 },  { 71, 135 },  { 75, 196 },    { 79, 197 },
>>>>>>> +    { 83, 198 },  { 84, 181 },  { 85, 199 },  { 87, 200 },    { 91, 201 },
>>>>>>> +    { 92, 182 },  { 93, 183 },  { 94, 184 },  { 95, 185 },    { 98, 202 },
>>>>>>> +    { 105, 157 }, { 113, 128 }, { 121, 117 }, { 123, 118 }, { 125, 119 },
>>>>>>> +    { 129, 120 }, { 131, 126 }, { 132, 160 }, { 133, 194 }, { 134, 127 },
>>>>>>> +    { 141, 137 }, { 144, 138 }, { 145, 139 }, { 147, 140 }, { 148, 141 },
>>>>>>> +    { 150, 146 }, { 151, 147 }, { 153, 148 }, { 154, 144 }, { 155, 159 },
>>>>>>> +    { 156, 149 }, { 157, 151 }, { 163, 142 }, { 172, 143 }, { 181, 145 },
>>>>>>> +    { 193, 161 }, { 196, 152 }, { 203, 177 }, { 208, 178 }, { 215, 162 },
>>>>>>> +    { 217, 153 }, { 220, 154 }, { 221, 155 }, { 228, 179 }, { 230, 180 },
>>>>>>> +    { 232, 206 }, { 234, 172 }, { 235, 173 }, { 242, 158 }, { 244, 156 },
>>>>>>
>>>>>> Over the "common" base, Glymur has GPIO143 (PCIE3a_RST) and Mahua has GPIO155
>>>>>> (PCIE3b_RST). Both SoCs GPIO maps seem to contain both, but Mahua has a _unused
>>>>>> suffix for the missing 143, which makes sense given the bus isn't bifurcated
>>>>>> there.
>>>>>>
>>>>>> The _RST (PERST#) pin is driven by the SoC so I don't think it's useful to
>>>>>> have it as a wakeup source, unless someone decides to connect something that's
>>>>>> not PCIe to it (+Mani)
>>>>>>
>>>>>
>>>>> PERST# by definition is an optional reset line, but on most of the *recent*
>>>>> designs, OEMs always connect it to PERST# line. So practically, I don't think it
>>>>> make sense to mark this GPIO as a wakeup source.
>>>>>
>>>>
>>>> This assumes that all the OEMs uses the particular PCI instance. If they
>>>> choose to route this GPIO to some other use case, they would have to
>>>> figure out that we omitted one entry in this table and patch it with
>>>> the appropriate data in order to have their GPIO wakeup capable.
>>>>
>>>> Wouldn't it be better to put the correct information in this table at
>>>> this time? If we have a concrete reason not to, I think we should
>>>> include something useful in the commit message to help the poor engineer
>>>> faced with this task...
>>>>
>>>
>>> There is no concrete reason actually. I just mentioned that in practical
>>> usecase, I never saw an OEM routing the PERST# signal to other wakeup capable
>>> functionality. But the possibility still exists, so I'm not completely against
>>> it.
>>
>> I'm curious whether we can just describe the union of these sets as a
>> common config, because as I've mentioned, IPCat says both of these platforms
>> seem to have these interrupts wired up
>>
>> Konrad
> 
> Hi Konrad Dybcio,
> Thanks for the suggestion!
> 
> I tested using a single combined wake map (i.e., the union of both Mahua and Glymur sets) on actual Glymur and Mahua hardware, and both platforms work correctly without any errors.
> 
> Although both GPIOs are present in the wiring, only one of them is actually wake-capable on each platform.
> 
> Glymur:
> - GPIO 143: Supports wakeup
> - GPIO 155: Does not support wakeup
> Mahua:
> - GPIO 143: Does not support wakeup
> - GPIO 155: Supports wakeup
> 
> The combined map works functionally, but includes entries that don't match hardware capabilities.
> 
> Could you please advise which approach I should follow for v3?
> 1. Use a single combined map (union of both sets) with comments about wakeup capability difference, or
> 2. Keep separate maps for each SoC
> 
> Happy to update v3 in whichever direction you prefer.

Glad to hear this idea works too

Up to you, @Bjorn

Konrad

