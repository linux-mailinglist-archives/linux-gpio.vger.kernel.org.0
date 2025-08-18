Return-Path: <linux-gpio+bounces-24478-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D4BB29A8F
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Aug 2025 09:12:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B99643AD67F
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Aug 2025 07:12:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B11BA1A8412;
	Mon, 18 Aug 2025 07:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HlF2kawC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1760425DAFF
	for <linux-gpio@vger.kernel.org>; Mon, 18 Aug 2025 07:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755501143; cv=none; b=RvhaN/Wk0PxFPFienXyqG+1Cq7Zqnn1IMpRShLpxmk1n3aM4mxNTyqq8qDAn4VMzCijdnFyfFUYOIVbglR+GCvYvtEhdzzVrbOkXaqNAe93rtwBis1r8RXHfYxm8IdkDHQEqLy6ZnWnU3Caty3odv8/Wv88v4jxmP9kgP0Hlp+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755501143; c=relaxed/simple;
	bh=0171qvNEwhctc8IfFKLfbfF7b9YjDUBrifuNLF1OewA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oY6P3hqbRndR/f8k//KGu7OObNrN7KCeGCj1jX65IZb5mzw0CmrobRgmkLG13hgNbRKyA6wg3mbmky0OFdAiV5RCRcYfKgTWlZQXxieabxMD04axc2Hk0lb7TNIKuxHn36NLJl8HVTbfS6BnnV0hbzjHm3c0pmAedqZPCqK0LKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HlF2kawC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57HJUH4I007855
	for <linux-gpio@vger.kernel.org>; Mon, 18 Aug 2025 07:12:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CljCLWxC3VuOUrt1/JUd1oMX4O4FgjwPAOwwS6aA++M=; b=HlF2kawC+j703on/
	tH5fytuhbAfUDjBtj0KO0CikZ2/NCfa+q9or3wRHbgqp13aUjx+Ud6kQCPRUpzBO
	9IveNJ1Y3to6RGWVghPNpGt8tPAeuuq59leOkbMqbcgUSoizMqyGpSdN/m2+N4Cc
	PfIYK65uQFyrOFX7EK9R0juooZhyIWJfz/c2Qm1U//3dps9ujo+qxbg4ZVaIstRe
	5nEB1W2xB5Mz8iCUczH85RGtwmdNHb92adpboptyWY+xlpZxse6U4KTAuL3F+odZ
	v+oWNt/Pj1bxVUQyWXrVykC64EWHpok9icoe4hgh1WpptpVuht+EK1gcxEEJrUoY
	Zq9xAA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jfbnbxsb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 18 Aug 2025 07:12:16 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-24457fe8844so43608725ad.0
        for <linux-gpio@vger.kernel.org>; Mon, 18 Aug 2025 00:12:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755501054; x=1756105854;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CljCLWxC3VuOUrt1/JUd1oMX4O4FgjwPAOwwS6aA++M=;
        b=Zc+kHd94DdcOnvpv6QGELlrelh/gQFV1OSPGAr4WZQWAdqiiob1sFsAJt23uH9L2be
         NJAirMzg/QoRsvJI5KKeIriNo3jh38JOaXOuK+HDpG0LsMHkmXqlkN1/WjvYbJRuxifq
         D42tUNvphl9+DtWtZmkglbAM8oGd5ATzyn5qoRqbBTwcA7wqgYrTzM51bnZO2pkQ2D9J
         nYy5krf7o417V8ZrrweDdqcfS8PfzGIRgO6hcfpevNq6YqMxhddUjN4hiAxk/oZJJiyD
         NVDN5HLRH4+rgvdYWpXbwrBJddAgcIeDTYjBjhTfCXwk5HlFOIisPmbH2ETPj7s5qPe8
         WGjA==
X-Gm-Message-State: AOJu0YzRmAy4t40vxTYdoqwXT06sJj3e24QvbB7r8xEtQoLPBVdIOwdd
	dlT/+l+q2IjedPmaRWLwYe1Wtaajz0jbIBscDsdcW+3g330SDjR1acOUZPdQWLR9wUI6Ngniq+Q
	kuLJGmM+MaOgx3+Vm/PHuYhhD6GKt23vIHS6CUqYOTzpmYVVMFr0xfiNVcZb+hlC8
X-Gm-Gg: ASbGncvnVyYHtyI7PN54ldVZO30eMLfvDXPTx1IrMzsApUafyVa2YHy02wA9YKUmdMu
	o2bEQ8JY80XsQ4y8qiiSrAXGezZwR5tfX94nTpw/fD4rxi5h6BhYS3p4mrCHj0vqBFdU2kJfsEb
	uMvuDpxCH5G5Le0KYOmQCoOfSQoK/MVALyU2KWCX6/Iqr+qpcIsWdyyR5kO6/s6RiDPhJ86Uptm
	0OqoC0Enhbg0OypviW5HVpllnj5jseKrXbvWchStzRPM3pO/958J1YXkKIVUqXtnA/Xi88vNoIN
	vaU31OZ4ajkbzfaGvPT75V6z833lDuxy04uYlQNWYIldhjq/UGp/hfDUrSCoTjWPSw==
X-Received: by 2002:a17:903:b8e:b0:240:9dd8:219b with SMTP id d9443c01a7336-24478fd2a8emr122795135ad.49.1755501054563;
        Mon, 18 Aug 2025 00:10:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGm7LsS8pR5b68tpo9G2VcNmUMBXY1NQ7esD+UdwLtswNRa5j63VuLnVBb7Rr2C4YZHwcX2Nw==
X-Received: by 2002:a17:903:b8e:b0:240:9dd8:219b with SMTP id d9443c01a7336-24478fd2a8emr122794915ad.49.1755501054124;
        Mon, 18 Aug 2025 00:10:54 -0700 (PDT)
Received: from [10.64.16.151] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d54f8b9sm72276985ad.130.2025.08.18.00.10.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 00:10:53 -0700 (PDT)
Message-ID: <77067ec1-4f1f-45d1-8027-4c7a6f66ecff@oss.qualcomm.com>
Date: Mon, 18 Aug 2025 15:10:47 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: defconfig: Modularize SX150X GPIO expander
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        dmitry.baryshkov@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        xiangxu.yin@oss.qualcomm.com
References: <20250818-modularize-sx150x-gpio-expander-v1-0-c2a027200fed@oss.qualcomm.com>
 <20250818-modularize-sx150x-gpio-expander-v1-2-c2a027200fed@oss.qualcomm.com>
 <43e2a824-d7a3-4142-9b59-416df0c0c2c9@kernel.org>
Content-Language: en-US
From: Fange Zhang <fange.zhang@oss.qualcomm.com>
In-Reply-To: <43e2a824-d7a3-4142-9b59-416df0c0c2c9@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAwMSBTYWx0ZWRfX4HO0sJ1AErdB
 N9MwVAky67ZVSzKsRvDg9ZiCgZHO4IpOkBXRSRtPyYh2dlipetAkkAK1hepMTs0KLANyxgkWm6u
 5yJSvOgjFH73SO6i6JZjmRBX8fmFWSUUQqjfvSqasp5T3Sw7H9yfFD/TRnSn/VELrYuOXc/4lmz
 RgHYJICa8UXLqnu3SXq0OofeBR3Bnp5zOlVG4QGdc18932kca5RTk3kRUwX51ibWPb4CxEAAI3H
 MfOsbtSocdcTQj0cfp8YJe2W1FLd3EX2oD0wgFSrv0+L6ILGqK8HBahLRFcSCRQckwCfcCgnpxl
 7WiZXqVBjnDLIJjF06OtbVx1+FFxDDYfHkASFSOwy105G0KdFctuHNPyMgSF8nXlgcVepFUZ2bM
 rfRLBQAA
X-Authority-Analysis: v=2.4 cv=A+1sP7WG c=1 sm=1 tr=0 ts=68a2d250 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=qthNqDW-ekIAEVpD3OwA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: GQ54hlMj4wHZEaORyqjbePSuxszyEMME
X-Proofpoint-ORIG-GUID: GQ54hlMj4wHZEaORyqjbePSuxszyEMME
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_03,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0 malwarescore=0
 adultscore=0 spamscore=0 impostorscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160001



On 8/18/2025 2:33 PM, Krzysztof Kozlowski wrote:
> On 18/08/2025 06:41, Fange Zhang wrote:
>> Modularize the SX150X GPIO expander which is equipped on the QCS615 Ride
> 
> Qualcomm QCS615 Ride
> 
> You are changing defconfig for all platforms, it's not your personal or
> company defconfig.

Thank you for the feedback. Yes, The change is intended to support the 
Qualcomm QCS615 Ride platform, which is now upstream-ready and actively 
maintained.
I believe enabling it as a module ensures it's available without 
impacting other platforms. While it's not currently used directly in the 
kernel, having it built as a module allows flexibility for platforms 
like QCS615 that may require it in future use cases.

> 
>>
> 
> 
> Best regards,
> Krzysztof


