Return-Path: <linux-gpio+bounces-14367-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 847029FE7A8
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Dec 2024 16:36:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C9F8A3A2221
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Dec 2024 15:36:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 146261AA1D0;
	Mon, 30 Dec 2024 15:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YiuZkCiA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9661AA792
	for <linux-gpio@vger.kernel.org>; Mon, 30 Dec 2024 15:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735572969; cv=none; b=i0Qewekjy+rpwrDxnRtWfu/NrNAwTfvzhZfTMo8bZ/PjvpjZ/+kvG9MXHYEJEiQ7aMW1xzjyDamtM64iwS6pOjQuI8Y16+NbESKKBw+8VaJL+ujzfEBqCIdbVua7UYp9FSrcBZemaN+6MYBCr6cPWSD0EDIvmY9ziPuqTr6guJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735572969; c=relaxed/simple;
	bh=wkeG7P4UChRzJtrhWCiRAM2V3yJ4AXjEyMvJFckL1vg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=syxWnXQ/W1yXtkYGL23m4WW13hMjwnYaxjq8VB+3xzSXrAzDtnQVe3d5T0u5xW0KESfAhyPXJQx7d/s+uyQ4g26qy/IJNYUcSMQRmRucvpftbz+AZqmSzls8Xu0L1yU+QmEz7O+VoX4SykWyCahuxZX17oVzajMWgIPf1M4HSKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YiuZkCiA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BU2jVrh025953
	for <linux-gpio@vger.kernel.org>; Mon, 30 Dec 2024 15:36:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QlRM+Tt9HfLWUo5Qja07NOP2unyO6boK9jX6MFLYbss=; b=YiuZkCiAgKoaSu6I
	T7wuFOM30jnPMCFlD/2Ycy1t2gju+g9FFZkeU9CmrAq8s5rgkLxKjKbHa9VD4oMq
	gKak7txiI99BvXno+E8spyxdFRJVo+cEAPskuIlel7hcLRC2Uu6GUjonHjgspvu2
	mDAVHYETYJ8wGRFPIbRHsKZQhDqtVxERfx4tp+1z4FsoWhftT7XGwRGcB0BAqSDK
	xjQfF7THQ2jdRNKJ8pMz3KvNyP3fmo/7EEXf0cMwV8xydSZjuBW+tp1TVzkTzYu5
	cf6v0LkMk8Yd+GuvvVpnTpGfIJT0mdtNva8AimAjzD1QFqTjWjrAPn5AmVl27RZv
	zdJ4bw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43uk121ffr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 30 Dec 2024 15:36:07 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7b6e5c3a933so131917485a.3
        for <linux-gpio@vger.kernel.org>; Mon, 30 Dec 2024 07:36:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735572966; x=1736177766;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QlRM+Tt9HfLWUo5Qja07NOP2unyO6boK9jX6MFLYbss=;
        b=Z4/NegeCALyX/5Wd4Ewj7XgX8TcOXfJz0nVF3xBjGlhbnjiiyM55OG0b+Pno5pNfCY
         OnIj+tI6TTc5xhBkcdSJyH4rswHVqGHVie1Qtyl0pnavZHsaR6ZUqWLiTTvSqNqNPY43
         LssjBnzgWEdT51yxUTT/4DjV5klnVmXXCIJ1xgqNJxuWxlXIfXwueYFGKzw02kg5zNYW
         7td18hnmAVhAEQNr5sW5sUbac52REncric+aV/ez5rV4pV6q4Fqal8Sw8nD2FyDmCCj8
         R0KvFyCrg4PsLL1Dp+HdVs+b1P1mtK/v0yEjfZsBvGUH6Uwh10uHYu/cTwNglv3KzXS4
         2sZw==
X-Forwarded-Encrypted: i=1; AJvYcCXunl2P4RGCdDJGggY7q5B6xkMA/yA5F2BA2Z/FbSdvf5iuZOhEavo4NBUihXXq0JqsPpXKgY7iZJgk@vger.kernel.org
X-Gm-Message-State: AOJu0YyPiwIKX0WCOm02R+SP8+RISWspqaJ/gXiAiNCmuU4+EJgU9TWu
	WUHrgA9yI0ymyaLfI+obsKDbCIj3bV5lD9lBi+7HjWDD+cdhO+WxpOLVRQBpj/9+59AypeL1BMB
	nnBTkVTv6OrBQo83En2LtD5CjXrFmy9tyERqDjoAAgYFzEh7Z8OFNPyjtEr69
X-Gm-Gg: ASbGncvK7Pho3I2VtbuWD0WILZi6JPSThNAFnIqc2h+l3CznDQbrsXqSfytH9HuGonf
	eN6ansJ5UYdw5NhyTJ3XFC3dONqARpjyvacLlgeTrkkNayXihDq11RdPCrW6uwUK5rLK1VQoLT7
	OyKs0Ywk8kNz02g1JV62h6iEB0M69t8vkCUTF9qOzX7yvAAHabDbWmstigZvoM0hojyl4SUinF6
	52wPDiPxIi9quEayjsLrNxXsnBgqnSRq+TWBiHWHE6SF5pQQpmhznpP+r0+lf72lYlqHTstE2es
	r6pA56YGe1yTcXyX4Y6ZDhY1/YHLohm0RKc=
X-Received: by 2002:a05:620a:2496:b0:7b6:e61b:3e60 with SMTP id af79cd13be357-7b9ba742c0cmr2250328785a.7.1735572966261;
        Mon, 30 Dec 2024 07:36:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEi4DQS+Ey4mwcCBBrhyHtkNV/V1K4BRSDlma3sCc3zl5NHxwgFKp47MXICxUIytxfQe/LDZQ==
X-Received: by 2002:a05:620a:2496:b0:7b6:e61b:3e60 with SMTP id af79cd13be357-7b9ba742c0cmr2250326985a.7.1735572965855;
        Mon, 30 Dec 2024 07:36:05 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f01228bsm1477930666b.143.2024.12.30.07.36.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Dec 2024 07:36:05 -0800 (PST)
Message-ID: <34ab59a1-b735-44d1-918a-1b82954a4423@oss.qualcomm.com>
Date: Mon, 30 Dec 2024 16:36:03 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] Add SPI4 support for IPQ5424
To: Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, andersson@kernel.org,
        linus.walleij@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org, mturquette@baylibre.com,
        sboyd@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Cc: quic_varada@quicinc.com, quic_srichara@quicinc.com
References: <20241227072446.2545148-1-quic_mmanikan@quicinc.com>
 <e673dbdf-9b16-4c64-a3e0-cf5bb31e2b82@quicinc.com>
 <d4875732-ec24-4e35-9a7b-af05c6ee7d4b@oss.qualcomm.com>
 <fbf019aa-e8f9-4169-9543-f85d2a17ce7f@oss.qualcomm.com>
 <52fa8219-0485-4fc6-8f3f-5759649057cf@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <52fa8219-0485-4fc6-8f3f-5759649057cf@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: porN0PAocRfYMbJeF8VW3Xa0l0RL_Nt0
X-Proofpoint-GUID: porN0PAocRfYMbJeF8VW3Xa0l0RL_Nt0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0 mlxlogscore=969
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412300135

On 30.12.2024 4:34 PM, Kathiravan Thirumoorthy wrote:
> 
> 
> On 12/30/2024 7:28 PM, Konrad Dybcio wrote:
>> On 30.12.2024 2:54 PM, Konrad Dybcio wrote:
>>> On 30.12.2024 7:51 AM, Kathiravan Thirumoorthy wrote:
>>>>
>>>>
>>>> On 12/27/2024 12:54 PM, Manikanta Mylavarapu wrote:
>>>>> Add SPI4 node to the IPQ5424 device tree and update the relevant
>>>>> bindings, GPIO pin mappings accordingly.
>>>>>
>>>>> Changes in V3:
>>>>>      - Rename SPI0 to SPI4 because SPI protocol runs on serial engine 4
>>>>
>>>> Do we really need to do this? If so, it will not align with the HW documentation and will lead to the confusion down the line. IMHO, we should stick with the convention followed in the HW documentation.
>>>
>>> +1, the clocks are called SPI0/SPI1 internally
>>
>> Ok, I looked at a bit more documentation and it looks like
>> somebody just had fun naming things..
>>
>> SPI0 is on SE4 and SPI1 is on something else, with no more
>> clock provisions for that protocol.. Which is not usually the
>> case.
> 
> 
> IPQ5424 has one QUPV3 instance with 6 SEs. SE0-SE4 are Mini core and SE5 is FW core.
> 
> SE0 and SE1 are for 4-wire UART and 2-wire UART respectively. SE2 and SE3 are for I2C protocol. SE4 is for SPI.
> 
> Since SE5 is FW based (some RDPs use this SE for I2C). In GCC block, clocks for this instance is named after SPI as SPI1.

Thanks for the explanation.

Manikanta, please refer to this in the commit message as well

Konrad

