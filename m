Return-Path: <linux-gpio+bounces-21999-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 900D1AE38B0
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jun 2025 10:42:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1CC4816B03A
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jun 2025 08:42:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C96A6230BF8;
	Mon, 23 Jun 2025 08:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W/4hIKQJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C87022FAC3
	for <linux-gpio@vger.kernel.org>; Mon, 23 Jun 2025 08:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750668105; cv=none; b=PaYGGJAm9BAcl3oXcwWl3qoN4nvOEOCpzjrMBrxoW3BMSnZU0KNfUDugw4lsh6OhOGD/YxoipWRMZrcC3SNd90Xg6itYWjK40aN5rDz5TTv/Agfl15DGDrPSh1yXkfcWf9D9FVFBqF8uDcjEVZgqrrrDnafMNFGgUOo0HG8MQDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750668105; c=relaxed/simple;
	bh=Jbl9mEakLSLX4ZhoXwPqE10b06YGuEgYmXp7JI8CvTE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YFZmfPcJE5OkZ2FCb6a5bXMJU8N/00gvBYNPjsKP38E/od2vpN8+apilN8UqxmvqWc561o8YmYmPoIljPd1SZq4wDw+67WX28gzXw4nK9CvhGhliFlkUb3QLyo/+z5+9lzi02RbOlzs+ulKW62zJIjYqmNHXoW6qKuyhqcrE6yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W/4hIKQJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55MMeWTC020586
	for <linux-gpio@vger.kernel.org>; Mon, 23 Jun 2025 08:41:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tNGZoLuw9rglXq0NnsHbRKxL10Zk8yg3rB0wbfAxHGY=; b=W/4hIKQJf/pPD/6S
	URW4yFyBrHhTUaT1ak3PmWRvvOl9iBDc7mXQANUjrK61t+vXbVRUUzx/eOA7tQzz
	+xgFvXquiyhi5U1Ty5JdhRaPzgs6gAxrOpqoY0D+MGqyvRUeeruNVVST47N1XxCj
	nBZGmh+r9ceJ25MH0h4uGe08oC8l+IDxTC2nsXF3Kvcq7FmcjkPglXPTMaAHQEAJ
	Pra/d0xPIiEDQpU/NcnZTYdHyjMwQ9aVZ+/EQXKrAgd51gE44bPQhY9ybPaQqn3Z
	vGrn3opAArGDDymBWQrZTj75t6jbX7IcHt7DvD8dm2EpwBrEpSqGBc91ciYDz3qB
	RLRsmw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ec26265a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 23 Jun 2025 08:41:43 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b31f112c90aso2041810a12.0
        for <linux-gpio@vger.kernel.org>; Mon, 23 Jun 2025 01:41:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750668102; x=1751272902;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tNGZoLuw9rglXq0NnsHbRKxL10Zk8yg3rB0wbfAxHGY=;
        b=FICYfpFSSrdI1xtfK6UMOla8M9lVhGcOjaSKNc4Oo55Zh+pW9eDD6y975X70Re4jZK
         osTeIp03e2z0PiwU8WzdfUmoA1ayek1NXI4QGF4hwIXCG8VpiYDDd+PFoko4j2+JVPcD
         pqlYWw6fatyFnneyD5C+WT8w3m/XgOAMJMmP6nVeH4x+Lh0vvR4P7pDYGH/NntjvnypR
         MqvVHcR4XTpI9Te8bFwXluFcoF5w9an97kNqzJS7bnl7kYzJKZAMp4A+RoUXYMf8dNr3
         01/6EbC/S8diq2nLRY1GlRF3Ww43BFvuWwkFa/K4B/aBNNTKm2snqc4ZOpT+nw4qXLgq
         0DFQ==
X-Forwarded-Encrypted: i=1; AJvYcCV359q1kXDjTYDs1AD+Tv3eZCsgaxfsYkiK6NIxxreetDSZnMHwKh6FOGnDJPklFimZFQNV9Ilyre/c@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8Taa2n0Pk7x5x/nY3fotVAUmBgLajWy4JCmmUk5RU0FIJilnK
	kBnLwBAAEQ/tkxNxC4mSD0+wf2WKiGGBfNfvYI1iue0UM85yedAhXLEFMb6G44YoE49OTuBuw4N
	8UuD87knJgOHhelM6D7pQK2X5Lvr/KjQSOVJa8MUl/IbHpRy3VCxxUtV26sJrgOrq
X-Gm-Gg: ASbGncsqY0WphMXJ/DJpiKzcINtXEEfFcvwjUN0MizXNqEqeRg8W3h8hesTnFU35j1D
	M8mSFI+FsMlmpnuMwrY0ff2rT4DPCEZptrRxb1X0ng39Sge2dvLjwrjbyZlAr5cc0HgUDi/6tby
	p8miSmoZ/xB8bDLmnqrigsg42yDM1yHfzO9MotfFUt3oRZCh4dkIx8bG/FxpuByfPyBwx5TcHp/
	911zHN4ypRpmfm7UuM4J+bqNi5VCJnckpLaKv6XYF9+N+D5QBegLZe8Y2KkuhCSIDkR4hBGkOVf
	wRmePIYXvgzl63LZKdLS1wckIH6mlJ9bqI2fvXHhubYoU4odusnW79F978om
X-Received: by 2002:a05:6a20:7484:b0:21f:53e4:1919 with SMTP id adf61e73a8af0-220291769c2mr19504187637.3.1750668102411;
        Mon, 23 Jun 2025 01:41:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEoOzdK61MC4UC9PSvUuZZFZ1mPlOBgCQkBVTbQyU+iDFdKfnbBjKZLhRChtXt2Hb8DDc3hdg==
X-Received: by 2002:a05:6a20:7484:b0:21f:53e4:1919 with SMTP id adf61e73a8af0-220291769c2mr19504161637.3.1750668102041;
        Mon, 23 Jun 2025 01:41:42 -0700 (PDT)
Received: from [10.218.21.68] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74933e6d117sm3431544b3a.53.2025.06.23.01.41.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 01:41:41 -0700 (PDT)
Message-ID: <dba9c6db-12aa-4522-9873-0e27f96bf523@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 14:11:34 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] ASoC: dt-bindings: qcom,wsa8830: Add reset-gpios
 for shared line
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, quic_pkumpatl@quicinc.com,
        kernel@oss.qualcomm.com
References: <20250620103012.360794-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20250620103012.360794-2-mohammad.rafi.shaik@oss.qualcomm.com>
 <3ddf2df5-4591-421e-bfc2-50c7d3ca526d@kernel.org>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <3ddf2df5-4591-421e-bfc2-50c7d3ca526d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA1MSBTYWx0ZWRfX7O4Gol7tr1t8
 PlyIufCNRdfhtPJGZ3LmnQlZBw6KCt8ZXUOqs7VXxOYLzCFtrWK6daN9eqTa5Y8SQo5EBrbWbwM
 skrhlzUj6QMijDnJ9X2JRoCR7m3bjftDr3kSJvncfiRn1RrWL7PfqSAGxokITO88fznrxoqU0oF
 KZRfjO7msY6vz8PmMJvO9nzWiA9ITZ1QFaCfl75RP5J552vtLtsIXQAR7WBU8OuWbG8EFs23gU1
 BnH4mA5zWbqm07s+577T4K7O+LnhxDkjiK2x1N8QJ0AX3/tGQ3dWcWsVYyw24D3EtsfHKDbqXXr
 6E776fj/yQJLz/yBSrzBcYGqlrzwW5sj1zgPZqW4t69Bn+WIVTWAn/ESlmgrQxTTwOsBhk0U4+U
 zHZvvQaKDdDKtwMzquRvKZDnqxKmCUbUI2g6mJiroOzInHPKq0Q/SshoY2Di73ttZLI7jWOE
X-Authority-Analysis: v=2.4 cv=XPQwSRhE c=1 sm=1 tr=0 ts=68591347 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=Te_N3oLfps8sEPozdqUA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: 0JI-A_dAbjSDzn2VbDIdHJds_EnLcDpE
X-Proofpoint-ORIG-GUID: 0JI-A_dAbjSDzn2VbDIdHJds_EnLcDpE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_03,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 suspectscore=0 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=888 bulkscore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506230051



On 6/23/2025 1:33 PM, Krzysztof Kozlowski wrote:
> On 20/06/2025 12:30, Mohammad Rafi Shaik wrote:
>> On Qualcomm platforms, like QCS6490-RB3Gen2 and QCM6490-IDP, the
>> WSA884x speakers share SD_N GPIOs between two speakers, thus
> 
> You copied everything from my commit 26c8a435fce6 ... even device name.
> Please don't blindly copy, but check what you are actually pasting.
> 
Ack, Sorry about that

Will take care and update the proper commit message.

Thanks & Regards,
Rafi.

> Best regards,
> Krzysztof


