Return-Path: <linux-gpio+bounces-38235-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RHEpLLguKWpFSAMAu9opvQ
	(envelope-from <linux-gpio+bounces-38235-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 11:30:32 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9A0667D9A
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 11:30:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=nLVn6rlp;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=d95lrpSv;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38235-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38235-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1B18230034A0
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 09:14:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 591D53BE14D;
	Wed, 10 Jun 2026 09:14:55 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70D93BB13A
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 09:14:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781082894; cv=none; b=OQ3t6PSLCU2KoUSjCR27JUQzzDeMPDKTOx481jATIWFJqi0pX46iSvkjZibs5sNDe5BiI4aX87m1TEqc58k6tMwGedAeSNexAhnqAFP4pqrMlATP+mTFK2GHvw+1wyBeROzAl1wiAn1SdsLbLhmXcsrJLrS8Bjkp5/yU0VbmON0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781082894; c=relaxed/simple;
	bh=+3Oey1WWs5aR95mQcQBU7xyu2mXS3uTyCEBbqJb8qu8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XagxsOP7tg7RGd3MBdakOEPi9acSxaq5s6nRlFd5Jrx8TB0hlfqOUwhWpBhQpBbCi1hAtzwGZEKz9zEB4LQPvxa90ykq1N0isuLo7Sr7qTAW5cBsZSmJHvRqxQk/XP9MbgeYiphmEv4p8wzQPM9jbDFGSZ9vScrHs3909IWwb1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nLVn6rlp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d95lrpSv; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7htUa531342
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 09:14:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N6BysjMJ/71Lcvntk0+U+p4cz371ihNxbLf/Gr/x7fI=; b=nLVn6rlpvacqkfb8
	xl8mVCl47/jMHJJCxTc9ECH+9JYmS2d8y7mPZkGLIMx4sLwwCL2UBe264kZG1m+E
	5SqgVEqnH3b4QQU7Z0ZbHKMyAn8S+VSBYi86tvM8HddOMSleeSDBoqOxaYbDpyIU
	LL+QgTtGE0B9cFqMgVtFnkLaG3DnLzTlEN2cl7whoyVMnJlpKHy0FAWdRPJBZUCr
	krFGOK7k/FgEwOKrLBofNd7vuD3QkCAgYS2lyqxFyLKxXMGw3vRq4756iRZnBgds
	4PdJStD/fNVwsM3r6J3RAuUdQweeedZK5RFdiVEs20ah4R6rJkT7ZZ2BUNu3DTnP
	hGqDTw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnh1qn4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 09:14:50 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36bc54005a7so8631002a91.0
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 02:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781082890; x=1781687690; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N6BysjMJ/71Lcvntk0+U+p4cz371ihNxbLf/Gr/x7fI=;
        b=d95lrpSvdeXk9Db56WMk/3nlPAuxWdEjy+03GktsVYkPS85prSaJ7YiEXtbzrv0BZQ
         g3iHBL2caPp97MkQZYMcwBaCLi+cA2Cn3BBMovyx2dbDVHyI5y2N8/3MXGlGYPRylHxO
         ymigqxgecpa/Qqh3qKWNcFTHQpOvsMwHyOHLDTmHW/Ug4neDPA6EbDZt7U0P/LQvO4Y7
         VoqGvPlSJSGvCv0WEry7G78Q2rfioF6GYpXbkwB8rDt6lVT7qF5j8nfpLUXwo1uWJENf
         c2BBNwjt6mkEKuwK/9LWYoW7Nf8SEEv8354+MT+K75gILmveIQgAuh6KG3E8vkmrwt9n
         9ayA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781082890; x=1781687690;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N6BysjMJ/71Lcvntk0+U+p4cz371ihNxbLf/Gr/x7fI=;
        b=JIfuHrpNN6IOUX7I0Cuwxs5dbBujUZJ7p6yxb/DyOU9n68kjUBZ/6pt0pSNiQfN5Ca
         OfyG2KPeVS1KJW7F1XngqHWIOh2a+/qA02CVMF0vlRZ+jPiSfbvhdTfJ06GRr8Le9XN8
         7QXhOCZZHo/w69rJ0M1+ul5C7HKE1rwysOkHkW/bDRdUcYRH4UrX09nAbiKGKLG7b0Y8
         EtvxAxw27bWXlwwBhyz2s4BwnOZpUUJKoEg4/KL5nM8HF7o5WAKkMcL/jn5zQENwFrk5
         RNZb76Qu3/ykDEvWQD5pFNKoUiERxjSur4sgMx9ImEslk6/Ha1svIt3ETSEiVebET8y/
         ooEg==
X-Forwarded-Encrypted: i=1; AFNElJ/IffXgnrtVx/eaelkrs84UBVCHdMB0ep/yY4A9Jk6ea2fMdHiCZmWNH30SpxQkbH+80OBialsMg6yP@vger.kernel.org
X-Gm-Message-State: AOJu0YxIptq3SeMldruGMYCmIAdKoZc6vAsYunKwJ5PeFLbU9vC96C3J
	OIlZD1hZLEXacb0YWwO38EgTR9XEnqORlK7tI6L/n4sAWFrt0i/JtrwgYGk477huyx5jWK9lSTc
	HP9zspcj/izN1LxTZaYQFAqfRbXBSKLINNAZjcm1RQrBK+pNEBsFUVHz2co7aT38P
X-Gm-Gg: Acq92OH49g+ShPgQxi6gwHSWSNnkEhv6VQ3ixNNj9ceIThOlzWkF5KQzr5g2n49ZlCn
	HaqbLiae/ZJhQrLkx4bvtAVdh2WmxBm3Ji1+/H5FPMvMa23b45qY7UriUNSWTkn30E5AZsOQCRK
	rSboeHRtcQgIkHZr48P6ivvptbBc52G2U+I8WAwV87swpvArMGEo3TJE/cL9+36lHTuY7DyuZTa
	6NDipD5WCNwZpOq4Acm8hzHqldAlBFkvwVCFH/nsqA4f9oSM+DCDv3WuSfSI0r7Heg2DvXgOINF
	/PS8hXQKoHL5Mbt1JtscUR7Kx8Guex2VEXVF5I1AKU/FZ/p41PuwFoijZzv71PIcUFXfD9mRoyr
	Wil3YBwTJ/4YSND9q9LQ1xrgep7kmyxlWBENRXslAVr7bAlgIrKabQl0fN3xv
X-Received: by 2002:a17:90b:280c:b0:36a:f612:e6a3 with SMTP id 98e67ed59e1d1-370f0095b7bmr27502265a91.17.1781082890279;
        Wed, 10 Jun 2026 02:14:50 -0700 (PDT)
X-Received: by 2002:a17:90b:280c:b0:36a:f612:e6a3 with SMTP id 98e67ed59e1d1-370f0095b7bmr27502244a91.17.1781082889858;
        Wed, 10 Jun 2026 02:14:49 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3762514be1bsm2796226a91.17.2026.06.10.02.14.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 02:14:49 -0700 (PDT)
Message-ID: <661e2c15-0528-4cdc-a7ed-ddced32f7ddd@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 14:44:45 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] pinctrl: qcom: lpass-lpi: drop unused runtime-PM write
 helper
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260610080809.2588640-1-ajay.nandam@oss.qualcomm.com>
 <f03850f6-186d-4988-a450-e6e95f24a551@kernel.org>
 <0fc4d9d4-2943-4ed8-a8ea-014e83c74e5c@oss.qualcomm.com>
 <f77f6d28-b3fa-46f3-a6c1-fd0093cbb458@kernel.org>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <f77f6d28-b3fa-46f3-a6c1-fd0093cbb458@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA4NyBTYWx0ZWRfXx0Hh2B4rUwc4
 C5C3jVyXLwB19jJVtE8msEW+/n6olEy6iBLxq6WEwxW2zDZwmQSByJqBTnpa0nbEnyojpM1vqwE
 fWRlVyGVC8pIV17/1B/7t6opTn4Lmo+zlg4julqjvUyavWrU/0YX1s47Gmhs/Wo4+hwLH25+jrY
 Y6eYf5hOSDalmYQ7iql1kCOxd67Bxm7GpcLAdoV7SmB+EvIE7T/MiAQTYIvrgVPWvpOM6zRnon2
 uHMqRkyC3dwTf/FQWU0s6lQIO7EV91ObLXEkJB7mR7ZGyYv3ma7IbJAbK3SrRIzjCneQTohwpq7
 34xQ9i1kdGkVyx2B4UJNwe6ic42pcB+pAc7ikdDwEYIPdnMXldPMRyQY5MnC3YAEaOTpQJ0xI//
 7pbk+VNKmlwTC2JWTmvgHHEr0Byl/Q6Xi2ebA1Dh5uteGNXjUsnTF0y542IXSJURIS60soOUtsE
 PEtX2aAUNw8hPaMo5xQ==
X-Authority-Analysis: v=2.4 cv=Xce5Co55 c=1 sm=1 tr=0 ts=6a292b0a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=NdOHzJ4ck5ORsDkasxEA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: Jzsd6dCInpqPYaf-q75d4W7OQ8l9oQqx
X-Proofpoint-GUID: Jzsd6dCInpqPYaf-q75d4W7OQ8l9oQqx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100087
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38235-lists,linux-gpio=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:andersson@kernel.org,m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ajay.nandam@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AA9A0667D9A



On 6/10/2026 2:30 PM, Krzysztof Kozlowski wrote:
> On 10/06/2026 10:57, Ajay Kumar Nandam wrote:
>>> So why do we need __lpi_gpio_write()?
>>
>> Hi Krzysztof,
>>
>> Thanks, good point.
>>
>> I will respin with:
>> Reported-by: Nathan Chancellor <nathan@kernel.org>
> 
> 
> And checkpatch.
> 
>>
>> About __lpi_gpio_write(): it is still needed for the in-callers path
>> where runtime PM is already held and we only need the raw MMIO helper.
>> The unused wrapper is lpi_gpio_write(), so this fix removes only that
>> dead function.
> 
> No. Why did you have to add __ prefix? Why do we need function named
> with such style?

Hi Krzysztof,

The __ prefix was introduced during refactoring to distinguish the raw 
MMIO helper from lpi_gpio_write(). After the wrapper became unused and 
was removed, the naming is less clear.

Do you recommend renaming these helpers to regular/raw names (without 
__) while keeping behavior unchanged?

Thanks,
Ajay


> 
> Best regards,
> Krzysztof


