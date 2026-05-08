Return-Path: <linux-gpio+bounces-36470-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iCHeJ3Ho/WkPkgAAu9opvQ
	(envelope-from <linux-gpio+bounces-36470-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 08 May 2026 15:43:13 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A5EEF4F73E9
	for <lists+linux-gpio@lfdr.de>; Fri, 08 May 2026 15:43:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AB02930216FF
	for <lists+linux-gpio@lfdr.de>; Fri,  8 May 2026 13:42:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D30EB3E559C;
	Fri,  8 May 2026 13:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SM80tRrH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="icwGzqH7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76CE63E4C73
	for <linux-gpio@vger.kernel.org>; Fri,  8 May 2026 13:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778247725; cv=none; b=aDbG+rErn8YLkzkIMGbCkhToa/AMZj5HAV9ACAcZcDeV2Cbi9s77Ob/f+R1xsa2cz4Z7/h/UlStrIxsxgM2JOVA8yuHkpD16LksH073506OTcVvbZmMDLPogkThjFnfEGmvPr1g+b9PRix6zYw11epzkJlaTaGruEkKXvhrpUC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778247725; c=relaxed/simple;
	bh=EvmhqT/tWO4WclUqssSU3/XIi8iEKdq8cP4eL/Q44XQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YPKPpCXHQjrEIG2Su/W3HntVRpbOuNJAp8qnFKQ4D9ThMKPzhIx132zGv5Yk0nUb/UpatIHjJ9KUYPBYsG67BKLXQcrqHV83F5wgQRSewkgOk3Awv4v1icBBBlCkjphG++KPn3ZF6K1XpEYzHdQ1M4ml2esmM+pM9u2BOHcuBAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SM80tRrH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=icwGzqH7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648BwNeY2777831
	for <linux-gpio@vger.kernel.org>; Fri, 8 May 2026 13:42:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q3fNkyCw4bPiAIq5gd9teeiqwNQBvuQs8XOwCJ1OGus=; b=SM80tRrHxWO0A6wQ
	4LwePt6oyhGOqtpltGIYKkVj1qkczpqQU2WOypSnWYx5KLYnZII3VNYbUB9aaX9J
	K8Fqb2KVRJmmPv2blxfHYBNUg5msTTLHhYaeo3jcxYATDkV3ERkdhV7668rsbLJd
	c4TD6NfrScbXz+viEi1nmxBrnIcCvRexg+xsY9eHaNNOh3I8pm+1XHUZLiVQB0ES
	cv8HPM6NrTbAumJ0wrUVtEqi3o9ghMhgFEk73JbDvEzvvXjdpoi95jyvf7ps9sP9
	4xYc1nWCOK5hfJ4ugsDgjeFpN4khvmHlN5SuP7YFCI8za9n6JZeNlRAVQoF2Vaqm
	ZhJQEA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1285kd7n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 08 May 2026 13:42:03 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9569deb349aso111639241.3
        for <linux-gpio@vger.kernel.org>; Fri, 08 May 2026 06:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778247723; x=1778852523; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q3fNkyCw4bPiAIq5gd9teeiqwNQBvuQs8XOwCJ1OGus=;
        b=icwGzqH7z7aa3b0f2vcriJ8+mecnWkDhKzwAZirRTl6eqm+cGkAktATuMveryqL2cG
         dDHtIBzmsjUF3bGFLZM2D68BxBcuOywJSO3cL4Co+tD3Ww/YusOSg6yyXKGksB8d4skT
         4x8qipxjIsp+Qiksb6+VjfPsnDIDoiakLkye88jiBaZSB7ZKQkOTFeoX9n0rd0a9zvMT
         lwC5zOcvg2RjsvM8I45ekxJM9xv4JmK7gn3zPnbTOIupeXWnaosnYiCL6+5w9b1FdjKx
         7M1yR1vFcYEzAiqqOMk/nco5DcdHzFqJcQ/p0apCbtdSY0NtWZ2I/aedwNTzIIBnCuxa
         Y73A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778247723; x=1778852523;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q3fNkyCw4bPiAIq5gd9teeiqwNQBvuQs8XOwCJ1OGus=;
        b=Wzel9AVnQen+r4BrKTFDdJzXULjf/wlhIfrtmHtYbXTO3bieqMCx5Gvm/X20N7eveY
         xK8QJcDLg8/yQEFBXBSDD/Xdq0+q1Dqa3V52DktD6+4viy1LEhj6XwHeMMf33r9orfP6
         f6muwXyI2U3QsV3UVY/dXQTfrvPSjxT6rGFSHkEVNQrMU8ILJ95IJjgjJFKDo8yktv/w
         n1lsUTMPm043HbY58ZUdigHKdTOx9kUFSIs1f15u4lAMBLhcsbb4VmDnBUz1K/NjQ5LD
         Yb3epn1ZcacT6ywwsnBKvU9sDNaoNn7whszy4EC6YprdvlU196sTdgjfSUywLc3UPowi
         bKCg==
X-Forwarded-Encrypted: i=1; AFNElJ9DPBvJK+wGqjnYKiUsOro/oMVaTwIzQLrkIWEdUjzqocF/47ZJ+NxHSP+ufxwHQWjiGesYBgwlp9mf@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8ofVUkrkq5NX2e8eUTyLIwOWm4Zjvwqn7R/HN91bHQI1SrowF
	a0Gbf1jG0IJ/T7uDP5Y3ooKKqoPHWZkBHFR8XgfRVW0M5oDkajYeBrgbxB6Z/SSbEXpAd4GTLye
	o15u5rc+Z9cUD684IAVX9ec9WpMZ8MWZwaYyPaaJt7zBqLHlK8jH5zOKFkP6TIr6pFbnwerJB
X-Gm-Gg: Acq92OF/Gb8NFOpBES13vGP7FhqVuJNS55vHRhYhE4eG3E/tsP/3jpf2YNJIcWo5ttf
	kj+J7dhyyDV3j9HFJ8xz4Ix2M6/eDEDLGbHVpHl8ApjG6Hx6JoOCxbNb6CyKA4ZABHfYuOUdNLD
	Kg9o3aqMEpGpqwEqiNp3LCTQXvWdDzyUwfT5MHKdSDtDHdEBLZvJ6RMQvCMw8KyANeeFaN+SCGk
	dtovnrIZsB/gXRvA0jlzijQLOeTZPhO8pVE6/8xHYhj8KxPvM61g9Y6hDwUxQdE2CLVx0pwXu8T
	20tlqV+DwMk5EOOvB9tWbbA7dP1Tf+3Y9z10iQAPhICL1Jo+3vAupd3BX+TNLjR6/kxzsAqvpnn
	4Bcxx8ZxFyLKZ0/lPn06TpDmnB2L05Vu/zYn0IRPqHFfmvijuhb0UK8HIqsj/TT/n2ITouUsSEs
	2oAa2S01nr00uR6g==
X-Received: by 2002:a05:6102:3588:b0:61c:7453:af7c with SMTP id ada2fe7eead31-630fad3a524mr2878303137.4.1778247722659;
        Fri, 08 May 2026 06:42:02 -0700 (PDT)
X-Received: by 2002:a05:6102:3588:b0:61c:7453:af7c with SMTP id ada2fe7eead31-630fad3a524mr2878296137.4.1778247722113;
        Fri, 08 May 2026 06:42:02 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcb706b7631sm18832766b.61.2026.05.08.06.42.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 06:42:01 -0700 (PDT)
Message-ID: <45cc09dd-e5bc-4bf5-af87-cdd2616c02e4@oss.qualcomm.com>
Date: Fri, 8 May 2026 15:41:59 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] pinctrl: qcom: lpass-lpi: Enable runtime PM hooks
 on remaining SoCs
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260508113636.3561383-1-ajay.nandam@oss.qualcomm.com>
 <20260508113636.3561383-2-ajay.nandam@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260508113636.3561383-2-ajay.nandam@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDE0MSBTYWx0ZWRfX83ufQ2xPco52
 6poCTVg0Pl60ogjVWQCoTY/SscLfjApbn/IQpTzh/kwOIUBU7SiUUKii89lIJkBRS1FwlYbc328
 8txN8112pmOUyZJhNVpuWq0J182rMwPFagkiDmvdrXMfBaoGE2k5AzqWFFJbklX/V125idqdxPF
 D4aOjiAC0BkglqaCvQG0DzrKwMQpMoWZEY7B86ZpvuqKtuI5+Q5n9WpUs2Ct/v9+N/hfEassYLX
 BeU5xUs2cVqnVOjXzpssW6XzWZqvH4uaOM9DVMJnHvu1NozEZrC6EFMxOXLoK6mSmIJVRvziJD8
 c3smZxPmgNRbHVIHIsnNOfMXH3OZzxD2AzNyn8z4Wfm2FJdK0z84BvRn7f7g+JD2rau+zf70IMn
 ezwXZTzp/i8xfu6KEMRRMU5QIQ4AJiuv6wLs2JxEX1Ex40BhFgkTYzy99HYOVuIYHes9tk0tQTM
 Kc6ZDk/SWkTFwEno8cw==
X-Proofpoint-GUID: nOh9eiLPRRO1qH1iVEYDkj7Av1PkjqCI
X-Proofpoint-ORIG-GUID: nOh9eiLPRRO1qH1iVEYDkj7Av1PkjqCI
X-Authority-Analysis: v=2.4 cv=NKblPU6g c=1 sm=1 tr=0 ts=69fde82b cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=2BSzYs6jjcQe9ZRK-WwA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605080141
X-Rspamd-Queue-Id: A5EEF4F73E9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36470-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/8/26 1:36 PM, Ajay Kumar Nandam wrote:
> The LPASS LPI core conversion to PM clock framework relies on variant
> drivers wiring runtime PM callbacks.
> 
> Hook up runtime PM callbacks for the remaining LPASS LPI variant
> drivers so all SoCs using the common core get consistent pm_clk based
> clock handling:
>   - milos
>   - sdm660
>   - sdm670
>   - sc8280xp
>   - sm4250
>   - sm6115
>   - sm8250
>   - sm8450
>   - sm8550
>   - sm8650

This list can be removed, as we can deduce it from the diffstat
easily

> This is a mechanical per-variant driver update that relies on the
> same generic PM clock flow (of_pm_clk_add_clks() + pm_clk_suspend/
> pm_clk_resume()) and DT-provided clocks.

Please mention that this commit alone is a preparatory NOP, since runtime
PM is currently disabled for those devices

> Runtime behavior was validated on Kodiak (sc7280).
> 
> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> ---

Please remove the word remaining from the subject and commit message,
as it no longer matches

Konrad

