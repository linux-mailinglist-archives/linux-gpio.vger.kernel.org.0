Return-Path: <linux-gpio+bounces-14361-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3519FE6BE
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Dec 2024 14:58:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 968931882539
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Dec 2024 13:58:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B8551A9B3F;
	Mon, 30 Dec 2024 13:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V/13v46X"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA97D1A8415
	for <linux-gpio@vger.kernel.org>; Mon, 30 Dec 2024 13:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735567103; cv=none; b=r6scnvBEohm3g/aEmxcrHXXB6GVgfAdwedtSsPfObPPu8+EbLuCoiJN0Dy1Ugq39VkkzliYPURjQVJxc9HAdnw3LnPHGIXmAxP5GVQaFpZtsXbgHhMMQ8qX+HQyY9glm1c2ABdjLBG19OH36t9lg8WhMuoq8RoE0lWjrSBfoYpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735567103; c=relaxed/simple;
	bh=PeuDHt6WcPomzSd1kduGTuYMkTKSLCaF1kT1zNFqK8k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cJ6dbZ6t15ayE5JyIzyBeF6gQgNV/jcFt0Decny9Ct0Dx2Ski7h7aDo4k4NVTjgQC+ijPKNoWvOD5snGwBjA96VGKOmJM/aFi6dDVNv+WAC2cgN2u6Z0OLjXuWNmassmzQ3s++ooOcBRAiJV4a8n8hsAM3hMSd/vU4ObiEcCHEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V/13v46X; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BU5RxnQ005524
	for <linux-gpio@vger.kernel.org>; Mon, 30 Dec 2024 13:58:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CWKkDS4rL6iLIjRza4Fuki40YBqixFHV8VZY018esFk=; b=V/13v46Xf04FOtHw
	X3k/WrAAZOZ9Tc98vcfKplgm3dKruJHRpJYT+VMwQe8x/kTiA5/E2tcFQHZjTRRM
	lPcBqoRgPqU/et5IuEtnC0xK0o06n4jtSwMeo3PGOBUBxqKHIvE1lqcg8zz1x0HC
	bh7tZ7l7kxip9f/fq3oTAOvBD0wx6RKb1f6SptT+OJBD1ALsrc1zFGY6VjeJ4wXe
	LZT7HA2YxPIXxu8yFKKBh89cDEkjTHDGYuJyHjFg5k7DInAN5kqWpizvdBoq/YQd
	EQ5LJH1IZZ6MiDqAORrlQVPYvb1FR/Iw89lhhLwdDaH2YgpncCiWMd3txIZoStyS
	0c7lPA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43und2s06n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 30 Dec 2024 13:58:21 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4679d6f9587so29777371cf.1
        for <linux-gpio@vger.kernel.org>; Mon, 30 Dec 2024 05:58:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735567100; x=1736171900;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CWKkDS4rL6iLIjRza4Fuki40YBqixFHV8VZY018esFk=;
        b=SzwrcfD9N46Puy4GOd8BMP3LFkAqG/yFVzzIle6hD1jTPrpuDczpw263Yyk6VONBDC
         veOVlMzA/xZlDuszfJTs0tQM/H3EWwkKaW2hyoJwB9ztwOWtyd1siY4qPISiOJJKndQB
         JYoeHq0XwWpRnDDneXEXXswPi2eWTZjbDU6pe0GlOIvreFtDJGJRbNrDG+XKIGiOiGWQ
         vuNMAKAk7ZL/75Fg9xxYAff71JZ6ZXqMYYtZmY4FDGPFyvEt8qOourxOuTmqmP2iwFz5
         uom3nZaaTIL7ZXRVn+kyg81OINJvN7dKJNXXptGq56sPMfZxgShOzcl4RsXdI/A2CGJO
         SN2w==
X-Forwarded-Encrypted: i=1; AJvYcCW4ygZgmm6OsgUxFxJLBDN5ck0S1TJZ+i0+zYIMdm8N3PXquFQvEniPglc9YUewv+uNf7RrIVibOKPY@vger.kernel.org
X-Gm-Message-State: AOJu0YwTCYiGeFAc/Wr2RANlZQB+BQSMFrAf6+DkaYjQp3KgKfUgXWSx
	wPO65qyt6YE6X7tlGhwLhFysj3eJzk2cTsutO+vjzT1CeHXlWHHvuT4yzGrnn5nwlswJyoZlA0G
	8dx/cuV3W+I2u77Xl2umFhGYkcjhs1zVKpgxBGIU8Xx/HK0FaSlkjfhUi4j3L
X-Gm-Gg: ASbGncslGw7zYGgVeKStrDKw3Mc0O/hRFT7Gy7ytNzMWx3jOfhc7/R5LEbIEnWMfB1A
	m+Tj5BQrDNSjJ20HdpNEUEm4X2Fwaf0C1zB0jpyX20rLFDQ0s+EMbDb2P5GNQozyBJ5udxlpiUh
	NieTF3YezVChC84HXD0ULqYFA7S4fN3c6rdji8X272finiZg7CH0uNOKNKynTgyc0wsb2sh7VqG
	Dkit+XjGF36dbAJ58HrHtfiWDBAwyJBYeBB/L5rSCFlY3iVm+oEmPiMtWuvMwZBXploUO+f/Il2
	mlzxzO7ADCkuMWLlz1Gz0DSuHu2Tnv8fmGg=
X-Received: by 2002:a05:622a:5d0:b0:467:6b59:42e with SMTP id d75a77b69052e-46a4a8efb50mr244987281cf.7.1735567099784;
        Mon, 30 Dec 2024 05:58:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE7uS/Qtj7X7ktl4p9ibnbawCELVofusbTIDAqUnCjvZkfb64VxafvNGVvkkrFA/FIpSAXeqw==
X-Received: by 2002:a05:622a:5d0:b0:467:6b59:42e with SMTP id d75a77b69052e-46a4a8efb50mr244987051cf.7.1735567099386;
        Mon, 30 Dec 2024 05:58:19 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d806fed4e1sm15216164a12.70.2024.12.30.05.58.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Dec 2024 05:58:18 -0800 (PST)
Message-ID: <fbf019aa-e8f9-4169-9543-f85d2a17ce7f@oss.qualcomm.com>
Date: Mon, 30 Dec 2024 14:58:17 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] Add SPI4 support for IPQ5424
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>,
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d4875732-ec24-4e35-9a7b-af05c6ee7d4b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: NclqQnFVjS6DYnt4ebCcvAjS-EFRGTre
X-Proofpoint-ORIG-GUID: NclqQnFVjS6DYnt4ebCcvAjS-EFRGTre
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 mlxlogscore=875 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412300121

On 30.12.2024 2:54 PM, Konrad Dybcio wrote:
> On 30.12.2024 7:51 AM, Kathiravan Thirumoorthy wrote:
>>
>>
>> On 12/27/2024 12:54 PM, Manikanta Mylavarapu wrote:
>>> Add SPI4 node to the IPQ5424 device tree and update the relevant
>>> bindings, GPIO pin mappings accordingly.
>>>
>>> Changes in V3:
>>>     - Rename SPI0 to SPI4 because SPI protocol runs on serial engine 4
>>
>> Do we really need to do this? If so, it will not align with the HW documentation and will lead to the confusion down the line. IMHO, we should stick with the convention followed in the HW documentation.
> 
> +1, the clocks are called SPI0/SPI1 internally

Ok, I looked at a bit more documentation and it looks like
somebody just had fun naming things..

SPI0 is on SE4 and SPI1 is on something else, with no more
clock provisions for that protocol.. Which is not usually the
case.

Let's just go with what you guys use internally, as this is
mighty spaghetti

Konrad

