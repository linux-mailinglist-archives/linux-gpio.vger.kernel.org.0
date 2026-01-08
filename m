Return-Path: <linux-gpio+bounces-30270-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4B3D030B0
	for <lists+linux-gpio@lfdr.de>; Thu, 08 Jan 2026 14:32:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BAF583112971
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Jan 2026 13:11:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1386D47148E;
	Thu,  8 Jan 2026 12:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dsPMqdAC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fkNW00/V"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A84F471497
	for <linux-gpio@vger.kernel.org>; Thu,  8 Jan 2026 12:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767876732; cv=none; b=VwHSSZWfYMvXSXdfWfUHEqmvh+N3csvlaNGhrPwWYv/lSOKAfoWGFj6A8Q7hFnJFKHk4yKIdDPxMRkvnELYNExQhrFBM8FNHRTZWJvqJiga0mugBWGGJc1CeJWHxmB158U8DzH9oUcjVtapaQyPgP0IljwV0HfIMVofvldpvSuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767876732; c=relaxed/simple;
	bh=QOFVeDUoq+RkKbWZq/pMK6/NwJiOTJMnMsw+4xmARgo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VhM0MvU227PZu9g6HIxjyXGWPZuY7csmjEIqbZmbeyisGNdd+EmQbszTlgIz/3s+Rax4lXChIgg5a/cumNchQl7Mppqfga9WGMeUBvc4BgiBjKfhpD8EXzJJlUgKvtNKCoSyg84Y9TgQz0pWye+KxSshWr7xL4MQdP0Z7UjEX3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dsPMqdAC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fkNW00/V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6089JXwG125951
	for <linux-gpio@vger.kernel.org>; Thu, 8 Jan 2026 12:52:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SSZq0W/AuZXDHLOoNS/P9czI9HRnbDZBm6oN0SdJro0=; b=dsPMqdACt2Xh921z
	pRkDa8qe5suH+5GhB6H7n9IAh3Qy7G1LuN85nUII5FMXJpXNj9+kK0UMg7M1l201
	LOWIGdY+dSbghFFh+hxtyUABxBUqVM8XdcjwoFpX/BMUtjjPfWx46iZgU/RDWYt7
	vCurZWjy7vIbL3UnUlpvnUoE+b0y3Vqu20qXqNfpo3Z2EszkjScEBXM0N9PWBePb
	ZzuXegM0TdDSCU2Hm0+yALRVRh4pKQWHJJbd1BFyZihZq1DUvpVzAzmFzsY14+0k
	oIs/rzV/2q+j3d5ahZ8S/sFgTv/5UAeRsAUg+TMdBTFe6uf0MHlO/Lg1aMFHxkh8
	5IxtjQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bj3d69une-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 08 Jan 2026 12:52:08 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b2ea2b51cfso72312685a.0
        for <linux-gpio@vger.kernel.org>; Thu, 08 Jan 2026 04:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767876728; x=1768481528; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SSZq0W/AuZXDHLOoNS/P9czI9HRnbDZBm6oN0SdJro0=;
        b=fkNW00/VQAyq8xsMPjygWHJu4wIkmz3lGV2Aac6AaNhNFOBzk5RAqQ8tgjTivbvasa
         Sj/znN4fIuRiEgOe2eWJDCmrPZNvI2/Ap47CVb6i035Uap+BJSi2y52pfkIDNz5+ffni
         2gSFgQHi3QisVWnOTlK+YGMV2J1j5cXELZrAGHo5PIMj6NdEPjWoP93PtRUJAkj4QvM9
         lUcNNdF4QIF4YiCzpZoNKO7+ndPhffAlVZnXzljTa1fhYxyQ4Uuc69lDphvHVFv2gAfJ
         0iMN1ALtyaqrKbLXme1VI/cAFBf+Ng7zenhew1qHSQJvWaJKgc70w6IYlZbUKqziYKqq
         y/WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767876728; x=1768481528;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SSZq0W/AuZXDHLOoNS/P9czI9HRnbDZBm6oN0SdJro0=;
        b=nehRQhmAclp0iC6WbidcMCp3im0zpJx1qSc0N6Fude3MKwcWJoiIKKyANZTgFffk0t
         +hSNEESQ/QkCi+NrWaUrUNdV05gaYxT+7xfDt5T2LWYtQA4MlanKbEZ/m7VkTY21dwGC
         xSusF4/VJHiBtf61Dir/F9nO2jdnJhONxeYXga/mJfJEzs0FlDAE8WJUpRGvXD05GYYz
         ODr6Fz1prc2YkCYfTx6mn61xvsLnBvBY6DLm4uNuA9p/nCpDbyNpZbGNBlbEap87aNeq
         V7KkNk5rl6dmx87ZSyjoG9kBGZSLzqXHTHRhcM+SrbiydxZiBwNaVF63dOpKnS7gOpvi
         lU7g==
X-Forwarded-Encrypted: i=1; AJvYcCWRaj6nNDxwSfHnOYvSdyGHGCz1UZJIUg9sBl0H/zWJjrUlCr5sVmVs3LcMFOm0UD2Xz3Z/6PG84cTS@vger.kernel.org
X-Gm-Message-State: AOJu0YzNZCSWDL2tzY1yxoOYVF8PVmxvWyV0hy5bX3RRRrNUBzj9/mL2
	VlTwh9KK4fd9ZVdMrNYW/X1K59EHKxgx3CubG7luce8Cepi08jQ6B5dqvqvRSPNg1+9+r5lv19n
	LPBp+6KxGXpuzBdxsTPfjIERRqamoQN+LNwYEKGMzOimNsOHBU/PFsSAmnMGaiwMD
X-Gm-Gg: AY/fxX4Qlqx8KmUqoALGfGjPpdVJl7Z2o/HU6tiMpXbYVHWy2OOu2F0lxq8bAtUA2Ax
	tS4efptfpGcztwJupZHtjunP7fQA/c5dVSNHCQDALuTtwRZgX+cYPL8m74sT51fHaaIjis9dtI5
	Cd8bOm7fU2VaLxj332wcUczjkYX+Wd/SFopwMAsHmFMoDnIoiad2DEzxaHSvQk+ELNykaKx1GRy
	yWKlfgtZjbmAH8TSUpZJDy/JVeJoyMBXM4JC91c60e2SnJqejncgmWdTUA1GykxBKuaDBffMiJS
	KF8ZOuKgiQuH2mTBFV4aTznYoBOuk2vXOWVHDA6wbOEf6tjlw2P8hOGnRDPvpjYI8xeU/EUjAAm
	Mj3f1eg9JsqUdjiVzoiiFsyrI/LxySTgCh0jgYGhC+3FhA+DXlUZQm+e2ASe6Uam30OQ=
X-Received: by 2002:a05:620a:1794:b0:89f:63e7:b085 with SMTP id af79cd13be357-8c389410364mr545961285a.10.1767876727865;
        Thu, 08 Jan 2026 04:52:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHo45yMO7U4oaudAIbE+xfU6IFOYt/20jPnNbq86GzeDWfKgToo4vFxzHEx+lvnvjGdNyAZaQ==
X-Received: by 2002:a05:620a:1794:b0:89f:63e7:b085 with SMTP id af79cd13be357-8c389410364mr545958885a.10.1767876727439;
        Thu, 08 Jan 2026 04:52:07 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a230db0sm811852566b.2.2026.01.08.04.52.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 04:52:06 -0800 (PST)
Message-ID: <dff0c32f-b471-410b-8a70-9c20e436a3b7@oss.qualcomm.com>
Date: Thu, 8 Jan 2026 13:52:04 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: qcom: sm8350-lpass-lpi: Merge with SC7280 to fix
 I2S2 and SWR TX pins
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20260108100721.43777-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260108100721.43777-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: O4nBXdAJvrUl4x_u7c7qFspUV1P4lJuE
X-Authority-Analysis: v=2.4 cv=APfYzRIR c=1 sm=1 tr=0 ts=695fa878 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=7bMfskS0MixV3btvheMA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA5MSBTYWx0ZWRfX0l6gHIVeDnr9
 mxHoBzf2vwq3L3kNrToP3AyVXRvWHqThZcypvR2ZaOTcv1iEYZ3f7UT50zWkq/mY+CY0Fd4SDz+
 pqkWJDp7QESdb2AW+GMUFTsQHR2GP/iZJErF2FZXyd7Zung1l4svQ2f9v4QHnVEJHK1TXpsu+VW
 lmBHdUejecvnz3zXtje5jaY7ULiAGwe85vcUDrx3kL133PWELNTmCafDwAKWFJQUwo7EkwVHzFX
 KefzwpiMBMg/om9ttgTOKSJCYj1mit2F5Dgy4Y6AznG+sbejS7P9qC17yrVJDB1cahuRf/gx6Wd
 vkcmewXMZmml3vgHbWeSDNYGiw685+nU1SVJkfHCuLTm1gmvWii/Uk1XDF39Sory9rOXEFiMAxp
 i/ZGVPhkqXhup9WKdWZ5k6YwQKDUbIrrLqrAS+Ri37yR1xa0pCZx1ixLqoD3TeySISytxEHNReG
 egODdhQ/sVSL/pFMh8A==
X-Proofpoint-ORIG-GUID: O4nBXdAJvrUl4x_u7c7qFspUV1P4lJuE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_02,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601080091

On 1/8/26 11:07 AM, Krzysztof Kozlowski wrote:
> Qualcomm SC7280 and SM8350 SoCs have slightly different LPASS audio
> blocks (v9.4.5 and v9.2), however the LPASS LPI pin controllers are
> exactly the same.  The driver for SM8350 has two issues, which can be
> fixed by simply moving over to SC7280 driver which has them correct:
> 
> 1. "i2s2_data_groups" listed twice GPIO12, but should have both GPIO12
>    and GPIO13,
> 
> 2. "swr_tx_data_groups" contained GPIO5 for "swr_tx_data2" function, but
>    that function is also available on GPIO14, thus listing it twice is
>    not necessary.  OTOH, GPIO5 has also "swr_rx_data1", so selecting
>    swr_rx_data function should not block  the TX one.

This is a little difficult to read, but tldr the correct functions are:

5 -> swr_rx_data1
14 -> swr_tx_data2

which is what this patch does

so:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


