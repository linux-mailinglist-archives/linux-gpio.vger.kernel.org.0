Return-Path: <linux-gpio+bounces-36015-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KDdmJrxP+GmQsQIAu9opvQ
	(envelope-from <linux-gpio+bounces-36015-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 09:50:20 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F19734B9A2C
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 09:50:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9D4223032CEC
	for <lists+linux-gpio@lfdr.de>; Mon,  4 May 2026 07:45:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 277082E040D;
	Mon,  4 May 2026 07:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kfGwnj5P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N0GB4Ie/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E7926980F
	for <linux-gpio@vger.kernel.org>; Mon,  4 May 2026 07:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777880746; cv=none; b=VNWUyyVYPWcwLJCRCViXQWysTPDBkE5ZD5QtvRUIyD8Dk8oimC05Y/aOnFHqYkdM7gVEyVmg84bST28DvfBCtXW0xECFqNiVmxB2VtaQylgFqvgWXAeXsUxOQ8DwHfEZCM3o84MLVgwPr7aXc+a/CoxxDdT6yaBMzVqQXkOox34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777880746; c=relaxed/simple;
	bh=/NX+up7++QBsfX+DKkSvYEgv8gH3v/yxVfCr6DOJpno=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fGZYcUL9mN+lnnq/sz/YXW4kzhOIennnBPAsxYPoeOmUBBywaTpg/H5GRgXfiqFrlHbVR6FMzJzc5+XemLLTwDp3XaUic0+UGBtxjMmpr9phCyG1YWGcuLYW8pDqUNFlOKnYkuUMl1110DZUyaY1ag3GvbfNCyAMUFu9o+hgJ8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kfGwnj5P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N0GB4Ie/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6446D7Kg147016
	for <linux-gpio@vger.kernel.org>; Mon, 4 May 2026 07:45:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2FEhjnVz8B3YbTK0kWp6u8teq7DGCVzqV0sQmkfjGa0=; b=kfGwnj5PujYZ3NxA
	XVs9AaHavli2R/NrFOAeups3Ah/W9UJhAQnunglsHgdt78u4aCTIEiXgoiN5IMs/
	4xVBz/psEr+cLbsp+hF3cxSkb0C+VdO0x8wD1PutYG9vmNpM7Xns32ODjaLNbNq0
	IGUNkXgG6Z1OuoS5Jnnxq4oJqyN1mqndUAmFgSDRXEosdcehmtLQMebQTR1YF2nr
	GG9PF79Wd3QkfiaHAcjs9lenN3vcKdPQzXD0/rUI+le8+TYsKKDpLS4vw/vjQqoq
	9wDSmu5fK0uKqaZsRsyu80g6UrjRNeC8ZxpkGMkFcWb3w2PRocmgjljMxVdDTj60
	gHzRPg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dw8uxmtcm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 04 May 2026 07:45:44 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82fa7c6699fso4765232b3a.1
        for <linux-gpio@vger.kernel.org>; Mon, 04 May 2026 00:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777880743; x=1778485543; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2FEhjnVz8B3YbTK0kWp6u8teq7DGCVzqV0sQmkfjGa0=;
        b=N0GB4Ie/boBaXh62BduXun+GDE3S0qEJ9zG6gOQlK6MVX/QrCVRjl5TNRtP0TQKICV
         Hv/Zod7Fk9csLHNKdlG15SYCDSpX6/zPvwNdOJLhmFM5B5rxeBU64oTyVDN3uK5XyJ0B
         iHkKKOFvNWAD5S1H1pkvHwMFVi+hIKDRUOrBzMwraHm+ihh7aSKtgzaaNeP+DQ9iMTdi
         ZwPRowx9upHHt9mDDfid7gOit/CSS6+InkYx5Epnjyo9hrQWSHFEbR+mnbj1cJO3NNIL
         ocA7xZXnYLqaTXXAfAT53mwSrJs55pV2m7Zc0PLQLQ3AJWV+7/50Mq2c6WWM7MRc8qnj
         kdeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777880743; x=1778485543;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2FEhjnVz8B3YbTK0kWp6u8teq7DGCVzqV0sQmkfjGa0=;
        b=avCtZzJIljGKNunihBBdgZJtjq4977DMCMceKQLglFBv5eGk7nTBSU9FocdxvkXmqQ
         sFEeJx27yoDw+5aV1K+hd/hQSTW11dL/G3Gb3B/9qzZYEzsRd4Z3T5fRiKrr6YgqA+ik
         JhCxf7DYaZdlpW6bhXqU1TlKHV9ZBXga47q24EWZArQ2lkxk0tJRKHMv/YLtllDJNaJc
         afomKLGx2iXjetfhc0oAt1idvPDs4EywjXJcyBTZXvjwDVQAyvtcFE0rBbX6mF/KfyWZ
         q+cREUMcO+glkh7D5BP6hlKw3g/xkM5OBrX+QLpK025LgBlTUZ5oSG55mj1muGcyoQpQ
         kOgg==
X-Forwarded-Encrypted: i=1; AFNElJ+6WfRSZQHpUo5JgzfuUNGOSbi+toQHPa0wKx7jA+YeLVlQDbHwMJx6ei3BFlR3IOuGYCGNRiga+SPE@vger.kernel.org
X-Gm-Message-State: AOJu0YzUa6+fmfBgNThelZYe9ImzWTcjWsI3HVhz16NFSUTGrHsBJsmY
	n15OfcRDtZHKAacfJDX78T6QKBLB2LDa1OLfnC1YwUfzM+M7KKki8ah96j/ckhp9sjoJDnhD0Ua
	FC7MxX1tMhwQK2sOTr/qns83MJxlQanUyEOfwsoC+i9hfXoT0a9w4J8DRT2zIfJR/
X-Gm-Gg: AeBDievD6rawxfYOJRyn3A6gruAmgNwEfkcNVsusKOnu9RGBYkwtoZAsyNl/RJA3jSP
	kmYzPOgTJ7AJBrLKzHSMfA7qXFZsS2B48FBYAUrQSimfM6ijJQHc0kkgzgqOnvYggrWLm1lv/Xt
	V4rZ2vOiwV5PhWBE6OMXkTL/pW5hpcUdrnFCqeTw6cBZBvBUd19WxtE/vzEVcWgQ8IHUonstVCn
	fE/KcdVndvMXjqunPiA7QEwNEMe+RKZ4g9cWIgdo5+yYUG1upXSkIwoCm+QUd0DIQccknN8yQyy
	cPFZ0Obh80r4goOTTmO1XU66FYAjUzBQv9OsnFhIPZttxpk0t31zME/Wawj5Ao5oqsiGfkxTfyF
	vWBHPlhhsTTeKvv3KN3Zqvm4BunPZ2k5ZT8oYBB3Mtlnku6TDmdn3mbKqcAQ=
X-Received: by 2002:a05:6a00:369b:b0:834:df57:9d6b with SMTP id d2e1a72fcca58-8352d28bc1fmr8161754b3a.24.1777880743585;
        Mon, 04 May 2026 00:45:43 -0700 (PDT)
X-Received: by 2002:a05:6a00:369b:b0:834:df57:9d6b with SMTP id d2e1a72fcca58-8352d28bc1fmr8161727b3a.24.1777880743078;
        Mon, 04 May 2026 00:45:43 -0700 (PDT)
Received: from [192.168.1.143] ([59.96.95.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83515b543b0sm10299368b3a.53.2026.05.04.00.45.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 00:45:42 -0700 (PDT)
Message-ID: <82bf6986-f3c9-487e-89cc-366bdf92022d@oss.qualcomm.com>
Date: Mon, 4 May 2026 13:15:36 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: qcom: Document Shikra Top Level
 Mode Multiplexer
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij
 <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org
References: <20260429-shikra-pinctrl-v1-0-1b4bb2b3a8d6@oss.qualcomm.com>
 <20260429-shikra-pinctrl-v1-1-1b4bb2b3a8d6@oss.qualcomm.com>
 <20260430-esoteric-badger-from-hyperborea-1049ef@quoll>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20260430-esoteric-badger-from-hyperborea-1049ef@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Ws1420VNciQMh5wwuiGs8EhMLADXzXUu
X-Authority-Analysis: v=2.4 cv=QqxuG1yd c=1 sm=1 tr=0 ts=69f84ea8 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=d18XUvOkrfNYrh/LwM53Ig==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=2V555Vb6lIzm2OLpEQsA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: Ws1420VNciQMh5wwuiGs8EhMLADXzXUu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDA4MiBTYWx0ZWRfX13UnNEf7/uWe
 qEyQhZHo7pyzKVQy8jT0C+Xv0P6We5sfG5rP/MP1eTJDjA/j+Dj+/HmLGUJKci3dvMTDg1/Axyr
 xlXebPRpS85OTvG0TwE2nWWXnXlTv9rd81J6K3FoGYCnuRhk26jbo2gzIjdN67ERdHzYk7jszIB
 0xgcaITFHDHbJ2gbeWfNI+Hy1MIgRxT3oTQvV5g/MF5vhKQSM14UwEty8KtUTz0pPcRdAfyyMmK
 JfYTPw1QXhoiwY+7BYPxJBqF/uN3jOMdJnavDKYJrEm2yytGeKoOlidzjuUGInI/p6bpdRPdRaJ
 iPqEEbFBOurpjEEhKPVgJeJtYDpwfWCT5XoZLYdPqR5s8W5CBcXwc5V1MuqJx0h+72xAP/ZP5EW
 yLH4sxL7r5jSOWuS9H2mkNbmD7qWwd65nrOznlF/gVHc/XjgRKigKpnmmzNG3rMJJYycHCF16rP
 08zyNALmX1d2AC4sncQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040082
X-Rspamd-Queue-Id: F19734B9A2C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36015-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/30/2026 3:42 PM, Krzysztof Kozlowski wrote:
> On Wed, Apr 29, 2026 at 06:41:56PM +0530, Komal Bajaj wrote:
>> +properties:
>> +  compatible:
>> +    const: qcom,shikra-tlmm
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  gpio-reserved-ranges:
>> +    minItems: 1
>> +    maxItems: 83
>> +
>> +  gpio-line-names:
>> +    maxItems: 165
> Further pattern said you have 166 GPIOs.

Thanks Krzysztof, you are right, it should be 166. I will fix it in the 
next revision.

Komal

>
> Best regards,
> Krzysztof
>


