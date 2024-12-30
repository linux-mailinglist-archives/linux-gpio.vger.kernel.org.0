Return-Path: <linux-gpio+bounces-14360-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 574029FE6B7
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Dec 2024 14:54:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 987DE3A12CE
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Dec 2024 13:54:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B79BD1A9B2D;
	Mon, 30 Dec 2024 13:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GngGERgf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25DF21A76DD
	for <linux-gpio@vger.kernel.org>; Mon, 30 Dec 2024 13:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735566893; cv=none; b=TB5jSwhU2hvfobE8wNzmPRVJEGRs6C2G2i6m5A39Q0icwQNxpevd9jh1gzUzK5Cm/vfXYphvwP4zBDV7Xhf6I8YV4h6iF+AhR4rrjE0NDCJSXqdpAUc57qgrGxGEOciv2mZ4KhBzRJJotYr29UO43pr52yv3AF9CsLzv02/b4ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735566893; c=relaxed/simple;
	bh=+iHAttbLRN/6eXCEPybAf+3RrIyoVjP4/+q8BrEKzuI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P/nOnmTcPHHhxCUpLUDCkAyPrEMM83qouULaukRzQamC/mwPQjh91Ch8w9aPUfQBeuoTEdPBVfrJpxvStRMh9uW0VQUsP3SihBLAej0r1ESPvroD/niC9dpvBxHf6dBRDGVmHNs+elaCmmx9hUOzy3JLSUW5e9BMYtwab8+vgBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GngGERgf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BU83niM010313
	for <linux-gpio@vger.kernel.org>; Mon, 30 Dec 2024 13:54:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z7CVSRjgLfaKt5V5tnNqs5jqEoX/ptWeSmYIElKmPZo=; b=GngGERgfdqXPnwuG
	T21UFI5A9HKhEuj7E6SMJv/rE5iYUV1UbLfQAJlyFt94Bjg+UbcxI4d/DYOFmxJ6
	J3PNX62VDo8HxaBxILCP7WfMBkeS0WCaBujPdUkwZckfy3upnUYbhQTd19UQEZG5
	ImSQPZfTiCnuGQ1GS2H/dT55N00GbD/5BLrGF/4yA1uM5jx0gA1T+JA6rySlVrmo
	j2+RsQIS4UdVIKyqSTg3Gdx5LLEs2qds1mEbB6g0xhFHnvO1r0HTf13w8Kf3RzzU
	iE/BxkNOaz0Xd/lbebVJULRHMo2H2RbqZ4Dr3wW9MtTeqhtBR9YKfDUk/EiDt21F
	y1BFdQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43uqp60nv9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 30 Dec 2024 13:54:50 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-467a437e5feso24589881cf.0
        for <linux-gpio@vger.kernel.org>; Mon, 30 Dec 2024 05:54:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735566890; x=1736171690;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z7CVSRjgLfaKt5V5tnNqs5jqEoX/ptWeSmYIElKmPZo=;
        b=bjcKFqWmy5W2UmeqYhgSz0qUBuI3Pdelz6NMoVJmiZTSfCSKY1lTl50tJQB8EENmnY
         rOGBjJmTajxZeBN4GqfLMnaI2zK3AF/CU2pg4B4UX8rmoLuOiQrJhEpCT+eGFLio6U7o
         6bILGbL8kq56mFw1uf/SeqBCTTxahbBbR2jRl7xqi814FWIKbIDe44VdvsxkxILguzxW
         0Hcr5dyVerhHsbSyObY3FjTxaCHIwriDvaWOhpoJ8FGrZzK2wtDCPXeWUkMrM2zD54Vz
         hBfQZhWYzucccOeIWZb7Vs/PmAqk7zwBzMV+nv3rtNUIKmn+/v+Y3JAKXTta1oOuSDDH
         8uOg==
X-Forwarded-Encrypted: i=1; AJvYcCUT7OnoftmKCADootQcQKEqmR/C5BbvRl0tetcV1nyrCHuz7RZHo31nQDBAAaYBS4j39BIisDbNaDuG@vger.kernel.org
X-Gm-Message-State: AOJu0YwbfSCaM/wFYFHt4Nh8YxYGhAfnLuG7JFx98WPJhf8tzoFOqe4Y
	EwzTJQjXM/7PH+q8SK2z11EkeKToL0yVS/fwSaQpB2f12HDt1b4gth48nqiwIVJjsZ4pi5/K4Ph
	t0wg2CB1P/I4QRO7w7BHLOs5fK8JZlhhd1KYeulBCviBAuPcC6btUBVELHeca
X-Gm-Gg: ASbGncuOYLDdj21XqrarvOkYJuMGPi934JytySUdxIqlm4LBTDMI0gdqWxqCb7XP1R+
	YHiGytXmhxkJsdakyLlhU5kyZHhHjUQG4W5Tz0FQ1JnujdVEmC9JI2TgwBYKjFnRWJMzcwMM5ov
	i7vonOWVpBZiJ3phShSYeDksxNsixHN/8T0egal5XZx4Is+F41fDELQP9pd9LMhXdL9OCfnPQkP
	kHTNdCJahixzBOJB5yvpQqDMnrLIEp0Mhz7LnpvUZqEwaLiX2U7RNV2qlX+Il2xZ86nF9LRCKOX
	duUWGd+5EH/7fBRRXDurOgx6Clm8mQ6oODU=
X-Received: by 2002:a05:620a:454c:b0:7b1:4add:f234 with SMTP id af79cd13be357-7b9ba7232c6mr2316613485a.1.1735566890164;
        Mon, 30 Dec 2024 05:54:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHZdkhj+BV1o4dgVVkLIoaoqu+7Y4A1qVLU9VX+qB0ht+A0G1NdzcFyr5Ff74WKLL3Pqf3bmg==
X-Received: by 2002:a05:620a:454c:b0:7b1:4add:f234 with SMTP id af79cd13be357-7b9ba7232c6mr2316611085a.1.1735566889850;
        Mon, 30 Dec 2024 05:54:49 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e82ede9sm1458554666b.2.2024.12.30.05.54.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Dec 2024 05:54:48 -0800 (PST)
Message-ID: <d4875732-ec24-4e35-9a7b-af05c6ee7d4b@oss.qualcomm.com>
Date: Mon, 30 Dec 2024 14:54:47 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] Add SPI4 support for IPQ5424
To: Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>,
        Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, andersson@kernel.org,
        linus.walleij@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org, mturquette@baylibre.com,
        sboyd@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Cc: quic_varada@quicinc.com, quic_srichara@quicinc.com
References: <20241227072446.2545148-1-quic_mmanikan@quicinc.com>
 <e673dbdf-9b16-4c64-a3e0-cf5bb31e2b82@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e673dbdf-9b16-4c64-a3e0-cf5bb31e2b82@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: cHrbfa59iJGBUcVYkrkld4yKZ6MyGIto
X-Proofpoint-ORIG-GUID: cHrbfa59iJGBUcVYkrkld4yKZ6MyGIto
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 spamscore=0 suspectscore=0 mlxscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 mlxlogscore=815 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412300120

On 30.12.2024 7:51 AM, Kathiravan Thirumoorthy wrote:
> 
> 
> On 12/27/2024 12:54 PM, Manikanta Mylavarapu wrote:
>> Add SPI4 node to the IPQ5424 device tree and update the relevant
>> bindings, GPIO pin mappings accordingly.
>>
>> Changes in V3:
>>     - Rename SPI0 to SPI4 because SPI protocol runs on serial engine 4
> 
> Do we really need to do this? If so, it will not align with the HW documentation and will lead to the confusion down the line. IMHO, we should stick with the convention followed in the HW documentation.

+1, the clocks are called SPI0/SPI1 internally

Konrad

