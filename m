Return-Path: <linux-gpio+bounces-37744-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EAkiEFQkHWq6VwkAu9opvQ
	(envelope-from <linux-gpio+bounces-37744-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 01 Jun 2026 08:19:00 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A7061A0B9
	for <lists+linux-gpio@lfdr.de>; Mon, 01 Jun 2026 08:18:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4D4C5304704D
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Jun 2026 06:15:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A962535F609;
	Mon,  1 Jun 2026 06:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b7D2e04K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NrStXR0I"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE20C35AC14
	for <linux-gpio@vger.kernel.org>; Mon,  1 Jun 2026 06:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780294515; cv=none; b=BFuO8BkSVsfL4J8EAl2zsOvBI2KPKtp/Ykc3dt8y5ZmyvMAF9R5kvAxH9OGroG8+9o3/mR0QBgwdoSnjfmiDvDC7VRSlauhc+xSb2HOEixyj+tw9iG6Ln8+a3i6K3maFWMAQ7u90rOMMS4qaZxIuxvLrCSTQWIFdf1bsRNDlhiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780294515; c=relaxed/simple;
	bh=BYInH99AES8l6GOH74UMUsVD2nICq4mqXDc//+JCYIQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NGmd8EwKHw9JqrnhqyvLam3aOOZ542cnd8Ln2grGUTaolULGIrm26zV4rJqaZ+egSR8hGO5w0/6zHVEJvB6D4iytzoD12Fnk0n31wOo+gYUoKa9+cE4+3yU8+ZfcJDSVkI8S52vhSgavn7X9wryqCbHNniVSh0uNMUBGddBBLsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b7D2e04K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NrStXR0I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64VNSiwp3250706
	for <linux-gpio@vger.kernel.org>; Mon, 1 Jun 2026 06:15:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xfeYcVH6YJHbtfgsbpNeqbgrkd3UR64ekVNjwW2FoaI=; b=b7D2e04Kz26XzWCr
	bsPCL3rVZCm8slMypKGbUCBYyICgr2WAb0+IKO6HY+iAU6eJCqQl6a2WsysdwVLT
	IqOH1G7ORoiuqESxKULs8sLQCEz73KrigZa/6ONgXd84l4Mj58PMHm3kdn7cB+AN
	+ji+aUIHMWP9I9f54SLErCUPvB3JHXqgCsxi9+oGI20Yp/hJ+D4uelZDNMsXW+7u
	H1Xbz8MgbpuebslZIn2j6Zx2JldJtXvuPiLdHc5/z+guva4Q7VS80hBYaeSKgai6
	5VYcl0zrBIIG3CEAGRS0F6vxn+2+AC5vEybE7yjhoo9ZpuzLa55gsfsU1wZGnvP7
	xv+4lA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efr98dxej-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 01 Jun 2026 06:15:11 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84240683a82so805601b3a.1
        for <linux-gpio@vger.kernel.org>; Sun, 31 May 2026 23:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780294511; x=1780899311; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xfeYcVH6YJHbtfgsbpNeqbgrkd3UR64ekVNjwW2FoaI=;
        b=NrStXR0INnAIWcW6LooWnKviSuXXIq9SGT201eNfYLR0zxwpzk2RwqtUOMDGrqjAlN
         irhXc+ceKfkPy9snAZYJCYui5Ob6mvE2KktrK9kLAfpelWmqKwVxgWVYIWnO4yGJrJw/
         sEPODh3bUcOOGGDnH5YF3PY6tP2i+B4sBkeGjxFwSnMrc4MhFH2DXo1fS1sFu47g0GDH
         tR5qIIrmftpZMcbMVq/BimqQWqdouyelM7oXl7u3NLGplVPszvXHmc1gMTn15+mMSo7L
         2Nb0mdTLyduKM/vNK//kXEjQVfMVuWOCTJIRVfHL9HVqQFtO+i1k8hhRr44zjQZ5WnzU
         mlnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780294511; x=1780899311;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xfeYcVH6YJHbtfgsbpNeqbgrkd3UR64ekVNjwW2FoaI=;
        b=OjE9KLIqOLYXuwE5hnPAy4ee7gQheYxD216LvSqgk1b2DwRKA5+wIUPfXcCaoQWulr
         mYYViI+rtR3bDrX0IQYVPhhtP1E8J9dQ25q0XNsbrqchg6pisPnGbqSgCWKlENmrv51L
         Kp1a9ilNC5ZfIgUCMNcrHkl/SIoCH0/0dyD5QAoEaOFIwPpk6EDYo1PC3jRUfFT/omLK
         6kH4E2r4ux/cMnQG91U0UgxQFgYOz/hHuvN7oW+rmCAgo3HdKUyW25fDxXuygq5R5+v0
         o5Cirq8IodonnOz+J9TAHxMUDa/rO9+xqllDETU6gr1c19gPkwa1uszhkYM+tQI14k8B
         oJrA==
X-Forwarded-Encrypted: i=1; AFNElJ/OaA4XWG41/xty8veIUg5IAROC0OW6jXvC7KIe+irhmeTSI7W1249qjQGSwCBG9pF+j5puSKUEGLuP@vger.kernel.org
X-Gm-Message-State: AOJu0YwE83mqPo68iQ7tKe/QjlgSZFM+71q3MZLScoqRnwys/wkN7oCA
	kkq1CMJvpSM5mqZlnknhGC1stmh2HeNS2nbbfgui1/SdPmOJw+YYAxBzHz8yx3WxtOG68m+TNMg
	iao9ZV/YGj2zGOJqW5YVFvM3O7TqaKD3VzBOueUa9hqJyyjdJ0gY9KK/XXvzedine
X-Gm-Gg: Acq92OHlM9BV+PbWZzqIxeRcrifFA7cNQ8NSDUQB7YfRqLiQDu7HAYeIdsl0arc17dA
	EATROY4xtPHv9cN6G2eAB2EFLuxbt8rrUkDapMSKFPw0MoGV2qJsj2luI2pE96wqSNEQOLOPVfL
	F8Frnq5yxWRdbL9p7tSOjCrM1GKC5pl0I13m6kvdcIf29lYMJ30tC7cBuSSIwHcCEMUftjAzg0e
	+Epo2wIO/PnPEpIggwU4RHJ7+qmg/odbu7kJX1z/5sQLWDKNnQmp+ZRXheVzwe37Xq0hGy04Rde
	1LzJRwDvNi3Yo/d1J+hm59x3gKN/vDqGhAlLfiEmM3pyTCxf52ytJ9gHRDflSGf/eq1A2P2Af9m
	P0miJQoJu2uqhyKnYR42PZXm/YsTwHbvmN18rx6K2UBJaxTvK2O9dE7jAh30shXqmli/FfsbI1Q
	AQGycyHRN/WlszRDcE5usNlzHwow==
X-Received: by 2002:a05:6a00:330c:b0:842:5f67:eada with SMTP id d2e1a72fcca58-8425f67f7a7mr526137b3a.5.1780294510654;
        Sun, 31 May 2026 23:15:10 -0700 (PDT)
X-Received: by 2002:a05:6a00:330c:b0:842:5f67:eada with SMTP id d2e1a72fcca58-8425f67f7a7mr526114b3a.5.1780294510066;
        Sun, 31 May 2026 23:15:10 -0700 (PDT)
Received: from [10.133.33.72] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84214b000ebsm9515214b3a.11.2026.05.31.23.15.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 May 2026 23:15:09 -0700 (PDT)
Message-ID: <c7b5f9cb-09a4-448f-8f49-bdc9570d6b29@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 14:15:05 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] pinctrl: qcom: Introduce Pinctrl for the upcoming
 Maili SoC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij
 <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260522-maili-pinctrl-v1-0-0a6636f5c277@oss.qualcomm.com>
 <20260530-primitive-encouraging-quail-ee8af1@quoll>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <20260530-primitive-encouraging-quail-ee8af1@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BaDoFLt2 c=1 sm=1 tr=0 ts=6a1d236f cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=jTSDsdX6X7ecxBhJIo4A:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: xE1FNtL4h51mBbl4uU0h4uRZexuvgLCl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDA1OSBTYWx0ZWRfX7gphRNa9e7hm
 XAAn1FqMzubMFD69BAv9zJY5BHJU5Kpka3ORIiGhbSy7+1VuGHjgRiQNfgirkhJgfPoZeChY4H7
 9qp3EunTRI4KewsthrKusW81pxRATI5Aor9PhhBChVGZIDzxOC640UcdKtSfCR5EVVM8/HxchHg
 qDt+kqgSGWgxD0bSWkJ+EWFjiGBzQRV+Kx1Zh40uyzmwNKVKKNXX98rUr/TSYTHonWZ2n623ya8
 BdSggoeGhMdVCMo2/r2ZWh5RY5m1UCaQvzUb39TTAEnhwBpZEk+vmyRXPdC3+aY7KnC0CcqmqqZ
 XTYLrCGsru3tqdp52Yy9Hrcrov+NL/BFXgUGp7QdP568juyA/ZV5LRpLMBLIhaSUPgHPo7WgKV8
 4e+U4GdAYGrHA8tNkuMAkGRUIcKAHWQWFikk4wkGzQ+rLR0eiOuYVJ9IzDWH64wJm4GiZ0VPiAJ
 S3V6NS/2FgvovVnNgog==
X-Proofpoint-ORIG-GUID: xE1FNtL4h51mBbl4uU0h4uRZexuvgLCl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0
 adultscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010059
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-37744-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E4A7061A0B9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/30/2026 6:42 PM, Krzysztof Kozlowski wrote:
> On Fri, May 22, 2026 at 12:42:07AM -0700, Jingyi Wang wrote:
>> Introduce Top Level Mode Multiplexer dt-binding and driver for the
>> upcoming Qualcomm Maili SoC.
> 
> This is the first patch where such name appears, so same comments as
> before for other cases - describe what is Maili somewhere.
> 

Hi Krzysztof,

Maili is similar to Hawi which is not announced yet, so we refer to Hawi
to use "upcoming Qualcomm Maili SoC" to describe it, shall we expose details
now or add info after announcement?

Thanks,
Jingyi

> Best regards,
> Krzysztof
> 


