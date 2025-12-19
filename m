Return-Path: <linux-gpio+bounces-29761-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B52AFCCFB58
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Dec 2025 13:10:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 57D023009824
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Dec 2025 12:10:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ED4A33890B;
	Fri, 19 Dec 2025 12:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ez6nQNFH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CmojiihD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58EF337BA6
	for <linux-gpio@vger.kernel.org>; Fri, 19 Dec 2025 12:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766146207; cv=none; b=VtBaSDMkmJXuZ5xZGsSacreWFSKXxKctvRZcci6UNejs1RZTTeUORbAt1PPfgX+fIWqkpQRHJHwdo/V69yE9q8jTOpyhbl2G2rq5xT1ucWTD+b2P3AuB0mCiqYhruLDtd6kbnFQfBeTbwee29ykhhwSdq8zGmVtuAX5/d5eyaqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766146207; c=relaxed/simple;
	bh=gpIoOy78pMZoCIbEE4j3i20bLFIXxKeGpbtD2INIchw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lc7S/ZBbPORvSPmEBf1kfNLwvFxxJAGbxYchk2xgtfTPhbTrN9OS2iXa7HEZyz8hDed1yCeMDqBfaFPPqf2c5SLAr4pLpbdw7MqeDd4hSG9FszGOpA6VDKJYGKp084d/E3yUCmkXFJxPrXEwf29X7yUpSIlnaB1nDV4dC12hxeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ez6nQNFH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CmojiihD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJBSAf24145372
	for <linux-gpio@vger.kernel.org>; Fri, 19 Dec 2025 12:10:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tUolEG07YuA8naiVLt7C1pto13E5WsEaNtMVembr75w=; b=ez6nQNFHtFElylYI
	CejLvYIDmesxKQNdLPRZrlOlIcLXgBTgBzymhItffriRO1rum38dJuyNDnlMVr5y
	dtwOYQ+5owUkXGrpp5lFoGvtcpJ8/qMaw+dcFPi41+DjMJtkFx/Kaj3wBY/o95xe
	7+/GsOv82CxskzwruoTS89fZ0tF0LkJrKgFik3gl3j9k7tFGUa53V1ZjiYYaQNLi
	JoaqVNPjVvwpBikY5MqQm9c9IMvtzq1BY5TCFtqbpM3bwMQ4lUm8+D45nC86KFk3
	euGqKCyNB2aCoEXTeXgKCEt/cUXsuJQiTwiVR3WnlTLlogkdw5LoVjjlX7yEJAn1
	VSKLOw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2dtkdb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 19 Dec 2025 12:10:04 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f1b39d7ed2so35974231cf.2
        for <linux-gpio@vger.kernel.org>; Fri, 19 Dec 2025 04:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766146204; x=1766751004; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tUolEG07YuA8naiVLt7C1pto13E5WsEaNtMVembr75w=;
        b=CmojiihDAyV2kxE8GGGa8yniBubjYhp2HdwI0boYncnuS3JqswTmBhvrHU7wimoJC+
         EYDQqI/xVWGK7C2B5qPAXE8YlNSUbOGmQqRjnZ6b/8e2aFXoeFj+9d9lZ6ynMeoRioJo
         GJzTotG+wZkbUJuVibbOLmQuif9iPmATtWaiS7Q430BPqaWPgLdUvxsKqhafWOjE27FL
         8AFNxzI22dtVz+k2UN4I7l84juowtidKrlklPtk3V/QZ20ZeC4wJJdemmCYWCKaf+ILX
         pPDz/3vUG9UGe2bUSlrY0WNCg+pwEt7RBKzxI6tAfx2OEUUgD8a5KsINsN84UQXhBPWv
         Ho4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766146204; x=1766751004;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tUolEG07YuA8naiVLt7C1pto13E5WsEaNtMVembr75w=;
        b=OOhyxcVzKmDR5sgkrIYXoW+SBaKk8kUnEyHSiwp0UkZYUwUG399WcVCm2veatdulEM
         wwdr2s09jwm6lIwFZnDTBE7DzAcz5wNVql+RUBoxyiREq0K0hVMAzMcDEYLT1VKM0HOA
         3LvK5UXS1+dUG4vZiLlnfLTUFEGIKdIcWrbKkqnGMbRxvaCtN0Z2Vxw8mHo/oFnbofoL
         Z0fF/PQuAC+PJZc630fWfBGOyB90xoG8yAKzSUEAz40DrE8bH6W/D3O+NnCJQoeHrQUb
         4Jfo70ilFoSNC9OcQbZEwUhcUAFqe7JOekN1UWp9LT7KhqKyCMUFg6Cgu0fAWjXkfKxM
         SQAg==
X-Forwarded-Encrypted: i=1; AJvYcCX20TVrfmIGUtQYcbFJk/3YRpE4Uc8nYv60S02bM9y4oIqJyv+yfQ9cY/Aud05E6ubc28FVtiDpolVM@vger.kernel.org
X-Gm-Message-State: AOJu0Yzrbr6NR5U4IVyHBeo1KS3J5GkseBKT30Ioa7kBxljm/v2AtORX
	NQ503gdcVJ0ofb3s/yTWZvJDYZAFKsRdh189a3h+00Pc+dJdQkw2ErrqCtUHo5gYg/bbZ5u7Jy+
	2qNblYR2kepzazFcY/t9ZjIrR28vD+BKHCeGemNCkR01QAyuQpAWQCaiKGT9BcZ2e
X-Gm-Gg: AY/fxX5ICZHmA28wbnqyzlunqmCxm2op07bsOJS9mZCgUMHhkfuYtaIzdIEUG7rLcM4
	UPzQXk5c7rPt0OfTrM7dfQgm2X1BA/A8j0grl+M9AbqYMhfe1Atrph8hafXZOr46nxlwYYI9Qhw
	xhDGAObjzv2P5Xy67nE3b56Q79xchV25/UxkIhgJqu31SLZ+Tt1LervAl62Y6/TPD4VtrWYVsRV
	xOmVDzCea4O6Xy10xzn5/SF04iv+SvAC1lFEviC1TE+y9kvGoaydb66LitvlULCYLWahcYiNRnH
	3x1q+YCSsYmFdXxEqI1WO0KQdsHULfuyGSXU1tA2gT9OSDwCUPMlSv97EtpGOIAvq3d0FwQ51/6
	FyoySTjC97VmiucI4CTK/MIY9FxisVFqBjkHI3gba4i+twvWypJMzTfLsNXA2CZgVbaZqFTF+
X-Received: by 2002:ac8:5745:0:b0:4ed:b363:2c2 with SMTP id d75a77b69052e-4f4abdba542mr36235221cf.62.1766146204024;
        Fri, 19 Dec 2025 04:10:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFNHE8mUt1RqbOG36asJqPTyKdt2EDtPV/2sqLUBv01aNJ8HLkYsLaCnyAzQhCj8S9G+cl7ag==
X-Received: by 2002:ac8:5745:0:b0:4ed:b363:2c2 with SMTP id d75a77b69052e-4f4abdba542mr36234831cf.62.1766146203623;
        Fri, 19 Dec 2025 04:10:03 -0800 (PST)
Received: from [192.168.1.27] (83.31.98.88.ipv4.supernova.orange.pl. [83.31.98.88])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b90f53c16sm2024766a12.1.2025.12.19.04.10.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 04:10:03 -0800 (PST)
Message-ID: <c60ec8e3-0ceb-478f-9c21-14f9faa0b7e5@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 13:10:01 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] gpio: zynq: Simplify with
 of_device_get_match_data()
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
        Srinivas Neeli <srinivas.neeli@amd.com>,
        Michal Simek
 <michal.simek@amd.com>,
        Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org
References: <20251219-gpio-of-match-v2-0-5c65cbb513ac@oss.qualcomm.com>
 <20251219-gpio-of-match-v2-3-5c65cbb513ac@oss.qualcomm.com>
 <CAMRc=Md=KvKaXZvdwRd_rTp-Oq1qrAo12ENcUqTTWSYnCYSZuA@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <CAMRc=Md=KvKaXZvdwRd_rTp-Oq1qrAo12ENcUqTTWSYnCYSZuA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: t02JTc78aPUXH3kfekcnF45PX_Tkr1nZ
X-Authority-Analysis: v=2.4 cv=A7ph/qWG c=1 sm=1 tr=0 ts=6945409c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=qe4J/qXhiWkb1JZGYKbLYA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=kcWgoHX1vMHs3kmCK-YA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: t02JTc78aPUXH3kfekcnF45PX_Tkr1nZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDEwMCBTYWx0ZWRfX5LPZfx4t4AOq
 sk2CaWN87eFJmHCpDZJVFGn73TipfMaTgiXtsK9l8smXELuHvoJaTO6nX7Jkys28MmGQTj926np
 el8IyjjOz8Cljtd3arAvSwRyPKt0HUdOVkSAHp54tI2/Uc+jNkOQJCrZmaz5IXyD/28kkjUvKXe
 VlsWmtx5qLFVkCziWXRfKK3tcT+87sCYVMKr+14+9WQ9PR0jCuqiwHxJSlQVXHPwMIFcNe7zekp
 1QVw5RNluDGROy7YuBAFK6KfNNfYArWQQSjXiZpS2mT/oU3YJbPtEhINWlcMNU8tTP1BSfis19H
 NSxf8bMX6b6Lzuj0Mi0nGC1Y49rhvzngIQX7ElyYHIEbdwM6tHSBg93hrKdQHdXCCo6eqC6vvCV
 hB84FeKu8gxmbe+3XPwoJmPBawQUxxGbM0bbgDh9h815UD4ydkQFQlqpSm470POJVRDpIbuPQzv
 9zK5JJcjFI/lYiwcOIg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0 spamscore=0
 phishscore=0 suspectscore=0 malwarescore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190100

On 19/12/2025 11:15, Bartosz Golaszewski wrote:
> On Fri, Dec 19, 2025 at 11:12 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@oss.qualcomm.com> wrote:
>>
>> Driver's probe function matches against driver's of_device_id table,
>> where each entry has non-NULL match data, so of_match_node() can be
>> simplified with of_device_get_match_data().
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> ---
> 
> I think there are some copy-paste leftovers in your commit messages.

I just did not update the commit msg.

> You're saying you're using of_ functions but you're really going for
> the device_ ones. Also update error messages. And possibly use
> dev_err_probe() too while at it?

Sure

> 
> Same elsewhere.
> 
> Bart


Best regards,
Krzysztof

