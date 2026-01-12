Return-Path: <linux-gpio+bounces-30429-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CE411D10F2E
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jan 2026 08:47:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 225B9306CD9A
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jan 2026 07:46:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03BB733372A;
	Mon, 12 Jan 2026 07:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lBQ+ne23";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ewhk+95V"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B1A3043DE
	for <linux-gpio@vger.kernel.org>; Mon, 12 Jan 2026 07:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768204015; cv=none; b=engW7dejIGgfv+oMCztre5NO2hDIHQT4yK4ylyLUec7YbOkjVLy7whYQWE/REcK1wniW0QmBH0aUzKeG62xEtACJgnPXvMpHta17MMo1wBqq07zf7Z3E2l2PtcmLQzguUmPbTk32OXgnPzyaD5uDJLm7gtDwAfxRRoAYnrCUGkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768204015; c=relaxed/simple;
	bh=xB3p4jO6gpwMvB1bNsvPkMTXwiIeITc57QCzLK127rI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ex3VsHQfS4pKIGfhYeL5EFHtevw6JV8VS+TzzRIe6R11Jo/hMXK/Ytvk6UywjLrhVl3sCnLtk1WBV/gnPVMCiflrB3N6H+ChaGL1ISP7Avf5uy8lpdBwOtaonGljC3o8n88yTL2LgMflLgSkzbOBAciACGfxCxJo5igwRv/6yYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lBQ+ne23; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ewhk+95V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C672F12184927
	for <linux-gpio@vger.kernel.org>; Mon, 12 Jan 2026 07:46:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GccXshMNG6ZdESvyI7dZViESN17urT3Y9cvZCz6utdE=; b=lBQ+ne23qbztbPNY
	IzimUAqrsuf3C981AU2eGtzYpkGq1O9uHWiDQIEp0tF8w78UO9FATmUj7Sseysvh
	8aIVyXnMh8T0vsf3IEV5PmkSaz3k1LMF8UiFiToA2rFlc5ZZX869+frMmSpvnXLT
	0vYKJl83e80HFKvveImrRJnJWjF7wyn0+7JMuWopAEDWS55XQDCAgPGZqsfCseQI
	RwrSrqBuTw2dwIMkmhd5Qa/XkovoJ0anLkFPY9R56wxSfsWJXm2ny7fB+OPAnZJb
	ofEUBYBLzl7tsTv4zz5qUPEWjqG2rtN0IHgsJVwwSc3omeVmZDJwQ4lE6bYbx1As
	MBXe+Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bke3e42d9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 12 Jan 2026 07:46:46 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a0d43fcb2fso131048995ad.3
        for <linux-gpio@vger.kernel.org>; Sun, 11 Jan 2026 23:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768204005; x=1768808805; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GccXshMNG6ZdESvyI7dZViESN17urT3Y9cvZCz6utdE=;
        b=Ewhk+95VRMqZrAwS+p/MhBPdR63Fr5wfQ8v7oidBAMt4F/WRge1ktoFYXNHcSwE58J
         4gwQ1cJVzA0EiUvxdO8yaeZJHOEOSTcz5HgaqM11Z+d9I6EqWhUnfjSDA2Nyo/aD6Fof
         XNrHchhtSaJrBF1yzUaDA4auvi2TG38jAcpkRd0H0cxTlyL7irxNwEttwKcQKf85+WuO
         zlkhM9Ov/Xv3lVXy5GWSf6x+VChL6HIb0nZk5kSGKdYGXzxMKM+YUiMMQm6vmp7xjHiK
         PzPLpzCqZz3Km61xo+hX9x8MF8fCL8EVEcB6AuDFyykEa819JrwYAk+gV+TIDN455aQz
         uU6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768204005; x=1768808805;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GccXshMNG6ZdESvyI7dZViESN17urT3Y9cvZCz6utdE=;
        b=NIlatyJiCNNAb/B1Y82yVpP+dfOJUpJSvot2OsBD82i6pR4/rEcW8HKygitNvQCMtP
         V5WKVgNQi850oqDBoMX0gMkOw/15+GUIgcku9co+tGAwtkXgIbRDyOxI+QmY6+M+kbEo
         yfp3R4P1kue25X92+XtbtFe9RFwTf/FKHPh3FYn06SYmtMlAf/ULbnKrTALZE2SCQLjc
         ozZJf85zt70Rc3aoAahjY/uroAaOkPEGWLTVWS8YhDQxLTVc9B714sv5eZHhSNapc7zL
         RgDfJSsKBfICDypq4MTt1kLCjOPWuW/2Zavbjq7219b+EdD73DqGh8T6ptM0G91kontf
         sngQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0k9fBXkk4/9n2uekaCiXAbQSNljB294lXqG4SHT6R0Etzi/IvCBEfV8QsOvUiBpKKFAEXQqlxd6Re@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+X+aYXOpvCChi65IgIJ4QUunFgQ7SB8jjCok+JizUcjTq4zO6
	5xaUBx2KMYYDOwqSxheJXVVt5392ySWBVp69ceAcRQaltEIYtEgzEVsMqFwf+FHBbvLkLpZUyI0
	qCjaJ1hNiJ8Y89Hu+QPMe3x/ACi/T8fMepjnqeXyFN1qySQMDOiLEu/jkgRyG5KKFztSvPool
X-Gm-Gg: AY/fxX5/iEHvF0OrKwGIM1OOChTXHo8C+j20+qoTC/5rkeCPA9xF7wjy14r1bBJXMbu
	h/KuiqadyGojPMTC79vOL2QDYD+0sL0+Ng1dXnjFUXjuUMzissnUU4sEi0oDZe5se3wWsNOCoPU
	k79t2/qRETIXw6IZYj83q+yuGUIP6LXGFrMjnrZLCCoD3fYYJW1QRg2TdRZLR8hndD4hXC0+tQq
	nHqtwkGWhDShbq9lIsyQ0ns2kx+c3R5V4YwX/OsYm87nnL6O4sJN341sVfoMTEOW69vZWP53xoX
	zj2WgK/VZGX0X36OBDyGPHKpGtOkuD8v9lcxL+lsuMcxdfaMEjbphFUexkbS6n5aY0aTNu1tcWA
	/icMUZmYcuMohqpulnZ5luv7EHG6SWfeuUwyeXVBJx/0Fz87UQmkRtFq1
X-Received: by 2002:a05:6a20:a122:b0:384:fa66:c1a with SMTP id adf61e73a8af0-3898f997599mr15074062637.48.1768204005306;
        Sun, 11 Jan 2026 23:46:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IELLXnP9v/fdZk0GswqtPQ85SS7c8VVDneJqnU9uTg8UfqdMHaSijBxeILOAxPAhxBCNf5q+w==
X-Received: by 2002:a05:6a20:a122:b0:384:fa66:c1a with SMTP id adf61e73a8af0-3898f997599mr15074038637.48.1768204004789;
        Sun, 11 Jan 2026 23:46:44 -0800 (PST)
Received: from [192.168.43.245] ([157.48.167.118])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cc8d29592sm16502732a12.22.2026.01.11.23.46.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Jan 2026 23:46:44 -0800 (PST)
Message-ID: <025a8ba9-3889-4a8d-84ab-4f3f839f6003@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 13:16:37 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] pinctrl: qcom: glymur: Add Mahua TLMM support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
Content-Language: en-US
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
In-Reply-To: <0d6f8f95-01be-4fa3-9fde-bc00cbb894f6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: YLkImX00KW7Z28YqvW7TjMQQKKy8q8-O
X-Proofpoint-ORIG-GUID: YLkImX00KW7Z28YqvW7TjMQQKKy8q8-O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA1OSBTYWx0ZWRfXxDkwVlKNn2mI
 dtGBGIcYQad667g7LftSP11M+5Qg1QYXAMYnmb4osVbWEgcocnt4HApcn3bkvglfla0VUdU3z/V
 UAfe8skTFWERNv3S12eiZ/z4pZEHxzjGhJr0/mHLsyKh9QYLKYom9U4z3nMwGY+KH+uvLkEMtpA
 poEIW389eGbtYfZGCcu68VGen/lyo7DG0MLoLOKuPX+sT5mdEWQTzPzcE0N1NV6ml/Z0nfrITqz
 UQsjTJeXdoJOh3sL4UHqiiVlZcLB7CLTjtDB680jG7lyuXLm1noCi2TJRMPeAQ7iEzcZEbGLTxy
 9nj7NnQtoZWLgOXjSvQAJtQvHw1igRRJRhZRbGeBOKLGa2A2e0s7kF5HR8WkCcYN0H7rACmBrau
 ovebhbFv1VYZ3+TEszTXcB8Jd871KhSaHT5+ZNxTp/dWyPrqs4RA9+5rxORYT3aHRCBxH1cmQLF
 DbA932+c01xiQ/XgbBg==
X-Authority-Analysis: v=2.4 cv=Dckaa/tW c=1 sm=1 tr=0 ts=6964a6e6 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Rpb+4nhYU3MGDSpx93MvVA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=mIxXIP1jWOx8OtetEwYA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601120059



On 1/7/2026 4:00 PM, Konrad Dybcio wrote:
> On 1/5/26 6:20 PM, Manivannan Sadhasivam wrote:
>> On Mon, Jan 05, 2026 at 09:31:03AM -0600, Bjorn Andersson wrote:
>>> On Mon, Jan 05, 2026 at 11:04:44AM +0530, Manivannan Sadhasivam wrote:
>>>> On Fri, Jan 02, 2026 at 01:40:22PM +0100, Konrad Dybcio wrote:
>>>>> On 1/2/26 12:07 PM, Gopikrishna Garmidi wrote:
>>>>>> Introduce support for the Mahua TLMM (Top Level Mode Multiplexer)
>>>>>> in the pinctrl-glymur driver. Mahua shares the same pin configuration
>>>>>> as Glymur but requires a different PDC wake IRQ mapping.
>>>>>>
>>>>>> Changes include:
>>>>>> - Add mahua_pdc_map[] with Mahua-specific GPIO to PDC IRQ mappings
>>>>>> - Define mahua_tlmm msm_pinctrl_soc_data structure
>>>>>> - Update device match table to include "qcom,mahua-tlmm" compatible
>>>>>> - Modify probe function to use of_device_get_match_data() for dynamic
>>>>>>    SoC-specific data selection
>>>>>>
>>>>>> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
>>>>>> ---
>>>>>>   drivers/pinctrl/qcom/pinctrl-glymur.c | 43 ++++++++++++++++++++++++++++++++---
>>>>>>   1 file changed, 40 insertions(+), 3 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/pinctrl/qcom/pinctrl-glymur.c b/drivers/pinctrl/qcom/pinctrl-glymur.c
>>>>>> index 335005084b6b..bf56a064d09c 100644
>>>>>> --- a/drivers/pinctrl/qcom/pinctrl-glymur.c
>>>>>> +++ b/drivers/pinctrl/qcom/pinctrl-glymur.c
>>>>>> @@ -1729,6 +1729,25 @@ static const struct msm_gpio_wakeirq_map glymur_pdc_map[] = {
>>>>>>   	{ 232, 206 }, { 234, 172 }, { 235, 173 }, { 242, 158 }, { 244, 156 },
>>>>>>   };
>>>>>>   
>>>>>> +static const struct msm_gpio_wakeirq_map mahua_pdc_map[] = {
>>>>>> +	{ 0, 116 },   { 2, 114 },   { 3, 115 },	  { 4, 175 },	{ 5, 176 },
>>>>>> +	{ 7, 111 },   { 11, 129 },  { 13, 130 },  { 15, 112 },	{ 19, 113 },
>>>>>> +	{ 23, 187 },  { 27, 188 },  { 28, 121 },  { 29, 122 },	{ 30, 136 },
>>>>>> +	{ 31, 203 },  { 32, 189 },  { 34, 174 },  { 35, 190 },	{ 36, 191 },
>>>>>> +	{ 39, 124 },  { 43, 192 },  { 47, 193 },  { 51, 123 },	{ 53, 133 },
>>>>>> +	{ 55, 125 },  { 59, 131 },  { 64, 134 },  { 65, 150 },	{ 66, 186 },
>>>>>> +	{ 67, 132 },  { 68, 195 },  { 71, 135 },  { 75, 196 },	{ 79, 197 },
>>>>>> +	{ 83, 198 },  { 84, 181 },  { 85, 199 },  { 87, 200 },	{ 91, 201 },
>>>>>> +	{ 92, 182 },  { 93, 183 },  { 94, 184 },  { 95, 185 },	{ 98, 202 },
>>>>>> +	{ 105, 157 }, { 113, 128 }, { 121, 117 }, { 123, 118 }, { 125, 119 },
>>>>>> +	{ 129, 120 }, { 131, 126 }, { 132, 160 }, { 133, 194 }, { 134, 127 },
>>>>>> +	{ 141, 137 }, { 144, 138 }, { 145, 139 }, { 147, 140 }, { 148, 141 },
>>>>>> +	{ 150, 146 }, { 151, 147 }, { 153, 148 }, { 154, 144 }, { 155, 159 },
>>>>>> +	{ 156, 149 }, { 157, 151 }, { 163, 142 }, { 172, 143 }, { 181, 145 },
>>>>>> +	{ 193, 161 }, { 196, 152 }, { 203, 177 }, { 208, 178 }, { 215, 162 },
>>>>>> +	{ 217, 153 }, { 220, 154 }, { 221, 155 }, { 228, 179 }, { 230, 180 },
>>>>>> +	{ 232, 206 }, { 234, 172 }, { 235, 173 }, { 242, 158 }, { 244, 156 },
>>>>>
>>>>> Over the "common" base, Glymur has GPIO143 (PCIE3a_RST) and Mahua has GPIO155
>>>>> (PCIE3b_RST). Both SoCs GPIO maps seem to contain both, but Mahua has a _unused
>>>>> suffix for the missing 143, which makes sense given the bus isn't bifurcated
>>>>> there.
>>>>>
>>>>> The _RST (PERST#) pin is driven by the SoC so I don't think it's useful to
>>>>> have it as a wakeup source, unless someone decides to connect something that's
>>>>> not PCIe to it (+Mani)
>>>>>
>>>>
>>>> PERST# by definition is an optional reset line, but on most of the *recent*
>>>> designs, OEMs always connect it to PERST# line. So practically, I don't think it
>>>> make sense to mark this GPIO as a wakeup source.
>>>>
>>>
>>> This assumes that all the OEMs uses the particular PCI instance. If they
>>> choose to route this GPIO to some other use case, they would have to
>>> figure out that we omitted one entry in this table and patch it with
>>> the appropriate data in order to have their GPIO wakeup capable.
>>>
>>> Wouldn't it be better to put the correct information in this table at
>>> this time? If we have a concrete reason not to, I think we should
>>> include something useful in the commit message to help the poor engineer
>>> faced with this task...
>>>
>>
>> There is no concrete reason actually. I just mentioned that in practical
>> usecase, I never saw an OEM routing the PERST# signal to other wakeup capable
>> functionality. But the possibility still exists, so I'm not completely against
>> it.
> 
> I'm curious whether we can just describe the union of these sets as a
> common config, because as I've mentioned, IPCat says both of these platforms
> seem to have these interrupts wired up
> 
> Konrad

Hi Konrad Dybcio,
Thanks for the suggestion!

I tested using a single combined wake map (i.e., the union of both Mahua 
and Glymur sets) on actual Glymur and Mahua hardware, and both platforms 
work correctly without any errors.

Although both GPIOs are present in the wiring, only one of them is 
actually wake-capable on each platform.

Glymur:
- GPIO 143: Supports wakeup
- GPIO 155: Does not support wakeup
Mahua:
- GPIO 143: Does not support wakeup
- GPIO 155: Supports wakeup

The combined map works functionally, but includes entries that don't 
match hardware capabilities.

Could you please advise which approach I should follow for v3?
1. Use a single combined map (union of both sets) with comments about 
wakeup capability difference, or
2. Keep separate maps for each SoC

Happy to update v3 in whichever direction you prefer.

Best regards,
Gopikrishna Garmidi


