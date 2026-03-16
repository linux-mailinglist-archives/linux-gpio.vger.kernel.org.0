Return-Path: <linux-gpio+bounces-33448-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UHzvKvqIt2n8SAEAu9opvQ
	(envelope-from <linux-gpio+bounces-33448-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 05:37:14 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 58914294A0D
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 05:37:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3A1A63015479
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 04:37:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B12533A9DE;
	Mon, 16 Mar 2026 04:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N6tbnXyk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eA01FmzT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79D8337BBC
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 04:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773635823; cv=none; b=cvR9KFncP3ZyrZx/JE3fiJB55C8WfktE3xBArnKcTcrOn5fvROpBLsl0GqFt/FhbuhyFQNngAeYCfFncpOlIc7mBX2Q+uJV+PgdS6XXxeTS9R3aKeqXfPTj4h09i0EFFnZzTxtKrdz/OU98vMBmGsUVzQ4hgRna7JVV+2zciZ3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773635823; c=relaxed/simple;
	bh=MHq/ggIuD0G5x/JV496CxH1JIPSrNVnxRjHwwItF7vA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qs/3l3wGnrytEPTfiP1pK8yeHirlSIkclqba73n6LP8l5uBdS+LWD9som49Q+HzKr96gOxwa45gQVVrkIb5/F/a7qkZXqmGR5b7im9W1pCYPCIYvuBezHMc/ayfsJWkVcOxsvSsVQeBtM+3CYUZNh/Q0IwgbzsVSM+WSmY266AY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N6tbnXyk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eA01FmzT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62FHabxe3924538
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 04:37:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cFbjsbqI85gZSU8iBFCvyTzG3Zqip4n2ZD1U7wtutak=; b=N6tbnXykl6a2Sevb
	bF/Qe3vdsX4kGt+aJeIgiSkgQ/zSFhrx3vFnXydpVwh4oe/VO1KuV3zplsG6AMgF
	1PDi0+2ARUaBCkfk5YUO3fAiPfSMW3hRPliEMZJkMXX+o0tZDyNry5r7AOJ88XuC
	kCxqQ8a7c/h47I9Yogbd1tOmqWt6FbhLrSP+ZolOk2HpuYH7c7wNJR4aE7Q/tGO+
	a876g8BcPdFpT4BGYsNjCPZk+ZFmqDSIffCHSaXHrVjwB3An+jg1xHPs2iND5TP0
	a42bccpU91b2XyvxuarkLBi8/6Zq5GcJglegjE8dL38O/BwPrmftsEXkyu6/Pk5l
	iqcwDw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvyyc417f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 04:37:02 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c73781252edso18764907a12.0
        for <linux-gpio@vger.kernel.org>; Sun, 15 Mar 2026 21:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773635822; x=1774240622; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cFbjsbqI85gZSU8iBFCvyTzG3Zqip4n2ZD1U7wtutak=;
        b=eA01FmzT/34r1JpZVPKH+l+L5WRnKO33kGEuitDIwc9wc282fQJYJMF86ixujJMmJj
         90YpJqJYHXy4h14t8863ANbFoRI4GLMNE2kmSVPGJ0MOckk765bvj18Dxmkmj6EoLoqY
         cKibhd746I0XDJz9aXzDDKtG+Q/JdqR54GT87jWFdc3RveTrHwAcEV8WHIQct7gVlGki
         eo9v65fLxRvyGXtNmTJi8MAQCG/WpU9Bwt5zaqVdW5l76xAagEn/uIpCaZ5annjYp4YJ
         IxNsKcyhKu2Y1Ao1VQSvEqo78rz4EdwH/M4LGD/xo0MWOYuEP2C+i7285OunE6p+2KBM
         As3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773635822; x=1774240622;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cFbjsbqI85gZSU8iBFCvyTzG3Zqip4n2ZD1U7wtutak=;
        b=LA05eCHfd/JYyjhvqJEnW8386zDJ4ydgYF+hP9DIYuCP2LiftaxzNudrI8g1tvkEQS
         9XaTiD3HcRQU4Nlp7ola1F2R4uAN2kMkJBLyPpJOWwLHDZnuR39nTNuy2o9qFYCwXoz4
         8pagUu6BTdlgVc86Y6+TSgHdgrhf8SR1MkrpW2jst/4nIOnzPEBQiDunNoM+5bGQg7uy
         AGn2pnmAf90dEYYQvl9mvJIiB4YJHdy9XVkl+QD7vCDh+pYaIokxPNNbxhQ0k5PhPpU8
         H2m3e3yJq4+MejEAGtnB/ph8ccJ7BWGsY14rXMk0J7c3Sf4012ytgwH6sXCd88Pn1wyS
         5cmg==
X-Forwarded-Encrypted: i=1; AJvYcCU3k44a8MUr3mZ6cGE3+zGeFLjbcDOsiMdSbYYGqyAehkz7tDKgrF5rz0e4tVUlffVnK5qCvGoZ/qxl@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+WagEpnu1Wr8unL4RDaPtdEM9mqpvkYckkkDVkdycLLncTim9
	L549GdjovgybmADX3Js3WDutYGSocAGtsehQ03Z1dDpEPf7749n+2w2jQz6UUR4RrgNmb6lGEBE
	YtoXHQQXbWISArrJN71IluryESGzFTbXlFgLFb/u0AkaWAa6mpMUHUAJ61k8Z7XoE
X-Gm-Gg: ATEYQzwrvOKBYkfwEEfxdvWs3cPjKc+VtwVke8C99t39IfGEpQwAIf5rZWrgQTrFy5R
	XGb1RK02/br1+kkC/jV6eJmUFrivBSN7YyPmvuF3+HHGaCo/qrcODdu4ShG/gj2AB5OlltysyeC
	M52JDP3yex7dgd/XXSptUB9GCIVyDNrt+w2aY1B5lpJ1IK+TNBaJL5Dq0h3ImcbnL+LleNduOs5
	J8sZTLj7B111jMs5Q0dBA1Pmc7KCO/6waWFZ6UpZ08mLVWx7I83W4gWcUvCkMVYRfbQDTZzabm1
	TvVKbEQuGoi9PDdlMzeYBC2sMFrdK0t/6wbLuFHPOxEt/IW02ljE185xB4kQTBSwHC+CXS2Z05u
	aoc0/NKKeKHYFUv1jKaTEc6/bkA+plVizYec/IYbnElXqa0f+Ivw=
X-Received: by 2002:a05:6a20:a125:b0:398:87ae:5967 with SMTP id adf61e73a8af0-398eca1175fmr10536911637.4.1773635821696;
        Sun, 15 Mar 2026 21:37:01 -0700 (PDT)
X-Received: by 2002:a05:6a20:a125:b0:398:87ae:5967 with SMTP id adf61e73a8af0-398eca1175fmr10536841637.4.1773635820271;
        Sun, 15 Mar 2026 21:37:00 -0700 (PDT)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7401588ecesm2989834a12.32.2026.03.15.21.36.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Mar 2026 21:36:59 -0700 (PDT)
Message-ID: <191a3b8f-7309-4561-ae40-3c187becc32e@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 10:06:54 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: qcom: x1e80100: Add deepest idle state
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Sneh Mankad <sneh.mankad@oss.qualcomm.com>
References: <20260312-hamoa_pdc-v1-0-760c8593ce50@oss.qualcomm.com>
 <20260312-hamoa_pdc-v1-4-760c8593ce50@oss.qualcomm.com>
 <20260313-accomplished-unnatural-rhino-59ccbe@quoll>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <20260313-accomplished-unnatural-rhino-59ccbe@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=euXSD4pX c=1 sm=1 tr=0 ts=69b788ee cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=qAycWwI3HuNM5PRzo7QA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: Tn-2UmF6lBFIoYLDWzgWgQndA9HvlMkY
X-Proofpoint-ORIG-GUID: Tn-2UmF6lBFIoYLDWzgWgQndA9HvlMkY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDAzMyBTYWx0ZWRfX9Z5/zc2gcsgk
 QTsq8XGc8Xdk3ipXAdCq/N2pK8/HMcMsamcOgbBa8MeV55cb0Nsu5vinW2cRMKKpf7l+ioKccFk
 iARriSvHCLTo9fxyvvWcNh9LrkHRSu2KbVtgn708+ePjj+tjwvCOA6ikwcG+DsibfQM6pKl7Gj4
 A5iiMQo7W2YhdBicm3iJD7GkK2dzTI2Mxp/AUKeQOL8Kii7pmdPUJDVu7uq6ExNbpK7NFZjNtIO
 topzgKmpaRn11Nw+A33o6yQ2BQP+iM8AeyK9mFOrTTwHXtLoC7j2tgnCy3BOm1ZoPKa3i+PdO8a
 HWuLzmxPIzEHDwz7NNRmiIhjXJLIngSH5Qv7qgKjRvOsgT2Kcs2hKWlkenqSNaBdrNyAqmJkRSw
 BoWCdXlRmkSq9SF4TS+4oicNFWAXKVYG3NC58PEUmy53pJOSO3/uO3SdEbk4O6peIOcQ94WqelR
 D10ticJm+B/zxM0JRRQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160033
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-33448-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,b220000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 58914294A0D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/13/2026 7:27 PM, Krzysztof Kozlowski wrote:
> On Thu, Mar 12, 2026 at 09:26:38PM +0530, Maulik Shah wrote:
>> Add deepest idle state along with pdc config reg to make GPIO IRQs work
>> as wakeup capable interrupts in deepest idle state.
>>
...
...
>>  
>>  		pdc: interrupt-controller@b220000 {
>>  			compatible = "qcom,x1e80100-pdc", "qcom,pdc";
>> -			reg = <0 0x0b220000 0 0x30000>, <0 0x174000f0 0 0x64>;
>> -
>> +			reg = <0 0x0b220000 0 0x30000>,
>> +			      <0 0x174000f0 0 0x64>,
>> +			      <0 0x0b2045e8 0 0x4>;
> 
> One register is not device's address space.
> 

I can move this one register as #define in driver in v2, SCM API is the only use
for this reg.

Thanks,
Maulik

