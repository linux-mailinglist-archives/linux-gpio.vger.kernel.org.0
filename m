Return-Path: <linux-gpio+bounces-35551-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPxJIhg772mD+gAAu9opvQ
	(envelope-from <linux-gpio+bounces-35551-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 12:31:52 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B681A4710D6
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 12:31:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 01C8A300C95A
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 10:18:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBCD4309EE6;
	Mon, 27 Apr 2026 10:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B8KlCH0W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZKhGHSnP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6016D308F3B
	for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 10:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777285109; cv=none; b=MOZBjACta2fyeBth/u+LeTMvp5OvGTfydY0bi86g4R40kcr3fciaimPDIvfjiEEPxwe+thP2tJPYfGRqA/wmkIL+/M/BkMBWrCQOC1lB/DMOUHcLN24CvGFCL1pxQIJVaS1P3RrQ+qxfF2kHxL3Tz4GzneHHVxHH2W2bUfIFgB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777285109; c=relaxed/simple;
	bh=qi07rhbkZX5kV1q7T3eMORzlTK+gMtVNcpbOp1pndqM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=B/emHmJ/oBONMeD8Cm5tTa5vtxIHSHaejNCpGiUF1KO8f9nwoJ/dWC5Y3U03sQyJI7tN44dEp/AV/O7nQMDXyVbWtZNFlBv/H2af6aE1A2rvscW3QqN7peuw3Q3ht5HCXrBhV+Rpgh8u55iWs797X2laUXlodTkdUjDtv7FWRHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B8KlCH0W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZKhGHSnP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8kFlc3961977
	for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 10:18:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vbozWXvo4QjX4iElfaTeguvBAkfy1ceGfogaHli9wlI=; b=B8KlCH0Wvv4A+Cnf
	aAVr7DHhtWimI/NUqHBH91bRFRAutSWQkMrCJksWuA5WWWUPvmRoK/lkKC+RNSCf
	Qw/8gGVTHITFDlI3p5hT4tFg8JghvCccvuc/gSfh1HNyx/Hx5XHnhcwA04LJ3y0i
	tppEJBrhIJOY0EfVNOreAVkGgYdyf/QDXuJBCaKzjz7DVf9ZC3nj0HUcGh3N/uxa
	gM+jqtlHAhfZe1jXx5KHrcLW7lJXrKMp0DBwybqp3JixYQzCjZG6MLy+XKRDxtGd
	PePi5ToaWJJiQTWKCmKP3WajGdCpReYNUzApTcm9iiNREyyqNga7379Vo2seVEhS
	Xk21tg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt4k30kjb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 10:18:27 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8b02ea0c595so18515306d6.0
        for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 03:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777285107; x=1777889907; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vbozWXvo4QjX4iElfaTeguvBAkfy1ceGfogaHli9wlI=;
        b=ZKhGHSnPnr+GKviibXPWqyWgvYLS7TGAWh23aRtx7FKhlxF6Fmcww/kpq3Q3Erc8IW
         fDlCkUDIB+uKNpQt6AZopdS+vjSzzG6BBLykW83Ja9Yd7D5tFB2dGiyeXOYCDhAfk9CE
         cUjf23E8z0H7CZ5fzUW5r7KdluurA9MI4V5arSnk9oXoKfz6koiNqhUBP6b7SGRiJqUm
         4UMG8nANVMFXKWjKnDuSbkJd4x2n7T1a33fq+tZRmtf6dxWjRpto6GgpF650fbjMdeBZ
         Cl2vxlSxFEOWqqOFnM/rK3DIaX93gsp+SEhOBem0kXlHchtD8+MiB8+AQ7vRhAOg+Ueu
         gRnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777285107; x=1777889907;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vbozWXvo4QjX4iElfaTeguvBAkfy1ceGfogaHli9wlI=;
        b=MvNGHAqalxt7N4PjnHjIfVj+yyzEp+wLEpf8ZsXfMs1zogIEnFQxtFUGlexAEQ0aqb
         Vcn9qGdobvHf5t/rHlA/m3vJB4280eIZc5EO3GJPeCaOl0saijEPPv2kon5rmkh+8Pxx
         BvTPsVTHQbsGmpoyNE/thDOdpgaiHa12njIa1D7kprme6rUxPTmmpVRq62Qf+2qOnV1e
         1pbZSJl7R4yoNkRE/C4W47zrklKq0LaSfZJ1xGadfNgwq4m5SrMCKo7dKwefTW6AP8SS
         v9BesTitbOGBZioFdVxgrDskkkD0bBuugD00l3g1KhTEJClq93cPtYv+aYbT6LwjG/Ge
         HDng==
X-Forwarded-Encrypted: i=1; AFNElJ/DkbblIofxiyh0YfqDQ0aAYqhcWAa9T6VOvmYeCNu6r+BMr/zLYukpz5sSd4crsqC/Yh19Lr6sJ6nU@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9qfnLrZTa7rShrwM9SV6DtOInexSvwqf8RlqGUPaFV4dQ3QXB
	KldpwC0U88/4kdJtyu7LuBwpf2gX7ZiWsBO9Eokei9SjKG3YjJrvRGbzawQVEKi1YRKJ+u5vPPm
	HDDsUJ0/7GJAtoROheQ0WD6M6UbWHtDrr+VI4iCBymA02qAUB58Vrf5a7+vaqJogp
X-Gm-Gg: AeBDievh1rNVMC16eIymwl+eTga2jx0e5Tz1ThQrzmnXgMPKAEwEa5WkTOwWRMxrV4/
	tXOsNQ+Bzt7vyF+BtR/TYIo0sbohqxtuzNOwFXMzwm7mQEWqZbF6ei08RwKsEFFO8P7IuM4kL4A
	nGbGKyr4ItIozHzCm9vywiCUDLS/zkIvHn6evsyRWz3zMMPQWhzWE2aXuwoMkfatmYtcqI+Mtm7
	JQsVi5y3wdstHZgFLWEU5FVkDQf2PsQtZ+oFBL3jRkwEVp4pLmTi0j30ON1mgoDIT/HXhIhCkfu
	gL0K7tH49eM0S3jbWPICs4bHlKGVgiB5l+N5ywA0yDHGAgh4xFRXdUg2brrvYuz2tPxx4TZzCzC
	qe0WAElIDr4EPTMLDWew9XAGv7nKLww2iRaesxHk6lLDh4aPzBiOZnDBm+yaycXl88z8sHy9GTu
	5QbzySqyhgCY9Ytg==
X-Received: by 2002:a05:6214:2466:b0:8ac:8337:ca0e with SMTP id 6a1803df08f44-8b0281d5f4cmr461283666d6.6.1777285106696;
        Mon, 27 Apr 2026 03:18:26 -0700 (PDT)
X-Received: by 2002:a05:6214:2466:b0:8ac:8337:ca0e with SMTP id 6a1803df08f44-8b0281d5f4cmr461283306d6.6.1777285106202;
        Mon, 27 Apr 2026 03:18:26 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba455043cdbsm1104657566b.46.2026.04.27.03.18.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 03:18:25 -0700 (PDT)
Message-ID: <54cd62f7-bccd-40e5-be19-624cea3dd1ae@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 12:18:22 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: qcom: Make important drivers default
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Russell King <linux@armlinux.org.uk>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20260425155505.83688-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260425155505.83688-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEwOSBTYWx0ZWRfX6Yk/j6c4HIYJ
 KtT7k7pXmJkXJxx2elcEraDMlGwy5QVQLby316JtObuVGOw4DtPhlmDE7d59Vo7MqMkZ24kNCRF
 D14MgvHuPCfvmJ6O6S+9wFTRgqAzxGa4csAprL9ztUNvTaS4Tc3bABTV/xtnVqNTV7RS/L3q2TN
 JVivyjr0ky5urm69nzWo0RrYkSgGUSNbchv1uEOa5JsRQwTy7lPsWaTQIcLcfwOAWkaCIy1TlUq
 lIWHrSvnHziaT/ouHonviTM//wmYBIdOUuYz4XLutZcIennLmdrQndeu6xrcjSOCj2AJOgf9Cif
 6Ta9OsYTtv2B9zt7jVMlqaUaNwAnN/F8ZlNQJPxaqQNaadsy0yarry2696nh8X7UHF3SI25RZZO
 ey8W5uotU183SjjmCG9nOpkIPs0nMgfdjVFWcF0YiDecd8IiogcTVELXREDB6Q0+V9Zzb3x5gDP
 uQJ8rzGujKWNEOOteIA==
X-Authority-Analysis: v=2.4 cv=a7QAM0SF c=1 sm=1 tr=0 ts=69ef37f3 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=rorZNA5PaGnq6atEbW0A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: SkY1ldy7SZDZOwIyp4UNsri_d5Hfm1cw
X-Proofpoint-ORIG-GUID: SkY1ldy7SZDZOwIyp4UNsri_d5Hfm1cw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270109
X-Rspamd-Queue-Id: B681A4710D6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35551-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/25/26 5:55 PM, Krzysztof Kozlowski wrote:
> The main SoC TLMM (Top-Level Multiplexer) pin controller drivers are
> essential for booting up SoCs and are not really optional for a given
> platform.  Kernel should not ask users choice of drivers when that
> choice is obvious and known to the developers that answer should be
> 'yes' or 'module'.
> 
> Switch all Qualcomm TLMM pin controller drivers to a default 'yes' for
> ARCH_QCOM.  This has impact:
> 
> 1. arm64 defconfig: enable PINCTRL_SM7150 and PINCTRL_HAWI, which were
>    not selected before but should be, because these platforms need them
>    for proper boot.
> 
> 2. arm qcom_defconfig: no changes.
> 
> 3. arm multi_v7 defconfig: enable drivers necessary to boot ARM 32-bit
>    platforms, which are already enabled on qcom_defconfig.
> 
> 4. COMPILE_TEST builds: enable by default all drivers for arm or arm64
>    builds, whenever ARCH_QCOM is selected.  This has impact on build
>    time and feels logical, because if one selects ARCH_QCOM then
>    probably by default wants to build test it entirely.  Kernels with
>    COMPILE_TEST are not supposed to be used for booting.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

