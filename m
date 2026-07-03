Return-Path: <linux-gpio+bounces-39390-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IQ10FFtwR2oVYQAAu9opvQ
	(envelope-from <linux-gpio+bounces-39390-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Jul 2026 10:18:35 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D85526FFFA9
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Jul 2026 10:18:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=CZAkf10s;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=KqQRdGYc;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39390-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39390-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A98493010910
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jul 2026 08:18:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6A1333D4E1;
	Fri,  3 Jul 2026 08:18:26 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566603064A9
	for <linux-gpio@vger.kernel.org>; Fri,  3 Jul 2026 08:18:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783066706; cv=none; b=KUwHVLzUJgQApfc0vdBeJqlsq/0CYfgUPJkmp8wBygCceb1ZlIP58d1p1kIYpIQSRHaTgDxVJ6iiNOKHDLy2p1ThydVStoYV8FJpVhWrL4WVpORFjmdpFFfc/zY6zIeL4UypoR5xd0xV7tJDAoSf1irHViHyMxocDsnFfqmUH/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783066706; c=relaxed/simple;
	bh=X7A2d8nw06smgyIcTq9KpSNNtCB1qTjlb0Lz/P935uw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a9d9UGQ2OIAOfpas6muAKMNv8vhp4ND2yuylciJfcYv0cejlNDRoFe5ln91ixsbZs8nXCvlQSNVWFqQMIgjwjohyp6qdn5szppdZSFx4Hy301rRUVMkMvIPau2JmF0TNUpDVV5jBvrQEp86eon8x7RmJ8EdvGIDBJxycLN8YIuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CZAkf10s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KqQRdGYc; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6637IQn73194644
	for <linux-gpio@vger.kernel.org>; Fri, 3 Jul 2026 08:18:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yHznjqxcH8V5jOn4X+unmnLf9eh1cHDxSeH30hTY1dU=; b=CZAkf10sVKZ+Z5It
	TiO0mQoDevx3Rhg54OrCNL1N+ozBkP9FH/slp89WHvQSsEq7DcyJPp+3imxnfm8y
	PaoLWfGsaocaQEXd4AnUZD/4sPMLMk6tX0POejoffawL1mYG3hk9IYMmwyN3lDCv
	Rz4YRz55iSURxWmjSE5JO57fQ4/JQbHN7yHwE/8DozGSROFGVX2FOP02Wv29AY/n
	qirXwrLFrDzgawSuwiL4ZI3R5qR0DDrw0TtmAvz4Pq0zlrlI9rVL+Iw69F/o0uLh
	LZICJLQMOsqvl4WBWZD4tvlelnoGytXTR46G5IfixDRLg0u5jvebUHtNeLYR+mTX
	bx8K3g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f68jyr73g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 03 Jul 2026 08:18:24 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c889d1eebafso864144a12.0
        for <linux-gpio@vger.kernel.org>; Fri, 03 Jul 2026 01:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783066704; x=1783671504; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yHznjqxcH8V5jOn4X+unmnLf9eh1cHDxSeH30hTY1dU=;
        b=KqQRdGYcXY8seHqrd9YjwbAW5LqBHF9+QjtjOc02sU2ar8D353jqCkk/QTyLO4WovL
         pRBNHUqcVLBeGJYJrXd2rKaJdE95tZ5MgjNgVT3zhcXfc9pUGvsaxEqvuZdwrwtZ8JIg
         FxOlh3ZslSvDgJTmd414di7siOYSIQY5PqUQQ77m3OMFIk48DfQrYJemmtFC3W1twyts
         pfCJ9ScLR9puEHjOpMmnmrxQJJnHvtTJRO/nYuCqc8y0JS+9N90vwYMnMfhYRNdzVWDg
         SEVDd0DyHsvzTubwMR7T/5tynNxtddDyxJbi4TScBT5UsEvricjLVEemqSLMc2DSj4E5
         hCpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783066704; x=1783671504;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yHznjqxcH8V5jOn4X+unmnLf9eh1cHDxSeH30hTY1dU=;
        b=VZUWlomFRR1JBh67OSPShcKFEXDmSBgEQYxb6gj+ZAFrjon8rPqAhqxO0xUWwb4sZ2
         jaTmyAUH42SPh2OH6seZFFBgj7wHkDRdkhlSyRuttuOnPGFaWVOVTmndxVznnDjCkpAu
         Xu1cnLu5srPh/o/dynSvD63aCmCMQHkg1r17QQ249arts8BAg7er7dnYioQpw3ee0MBS
         dL2nmJA2VXhYx3oqKvliu6QdzHUN2DgiyF7tJBLzyqtF36O0k4Zv6pA2l65ok3GbUeQ/
         Ri8ZHeODiChRmhbnVu87gA+1hLTUhXlMcaf0Q70Z3mz5HIySLmEXE+r2mBctIovnlqhs
         MySg==
X-Forwarded-Encrypted: i=1; AFNElJ/liGmzIeYHf2YWt1Rj5a4ZlBV4dal1Tkbnk6fh8139VZ3AT7Sw4c2iLGh/zHae8PNerv2PUAMp8Bv5@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx7cCfpBU2aAB61gn0Navve4pspMAESUAW6QJSWhGuymsR3XkJ
	gDNFMCHsH1BElgtMBBkIRM3DM1UFyQ8oCn3QaeyihcJ710wTEIkdyCmGBtl1tE5/rb8J4NVNjzu
	iav9QTBxvCKw+BVcwsvY9T2G/Q2QrUc+6nYELaKK7gjlXf/NLJ6hPTjijykN+3Pgixrv8R9gZ
X-Gm-Gg: AfdE7ck4Aku84/iE1SHJO1+8q2QkcahM6bPlUKCHiVhdnO1yC1Sh/OBPnOsBwGNYYSC
	Xkbx1KLeQV+rOtBiWX2mCjFf/9+QMiUqco64lFBr4gp+j5NiDOJj65H4RU7nQV8CzWmpl1cGlRZ
	ED1fH7uM5OayCVdJcd44GEVK7Wau+k+8MarUIHEonJuCaoHtiwF6/IlGEG1T32BxU5Mg2dFJr54
	/tG4FLfJA+Ngyvau9aZAfe1kA/sg8FpNI+U+pDQVb+u96b8QPIyO/c2SkHchj877oVMsQh65pjy
	Bu7y/sJrBm7uGPq5C+uMA0kxjX77vbftngLN6E3Un/UZszpbuKOSBLbymI7E73wwzOKOusttXMa
	btbAhfj9HPKOiN8qrs4gF/qafz5NLy8RVO8zOgL9p
X-Received: by 2002:a05:6a21:9f07:b0:3bf:6c08:2847 with SMTP id adf61e73a8af0-3bff42f825bmr10946888637.54.1783066704024;
        Fri, 03 Jul 2026 01:18:24 -0700 (PDT)
X-Received: by 2002:a05:6a21:9f07:b0:3bf:6c08:2847 with SMTP id adf61e73a8af0-3bff42f825bmr10946858637.54.1783066703563;
        Fri, 03 Jul 2026 01:18:23 -0700 (PDT)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c870effsm21148189c88.12.2026.07.03.01.18.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 01:18:23 -0700 (PDT)
Message-ID: <996d66e3-76a3-4d12-9e79-8dfe3e96137d@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 13:48:17 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/8] irqchip/qcom-pdc: restructure version support
To: Thomas Gleixner <tglx@kernel.org>, Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
References: <20260616-hamoa_pdc_v3-v3-0-4d8e1504ea75@oss.qualcomm.com>
 <20260616-hamoa_pdc_v3-v3-1-4d8e1504ea75@oss.qualcomm.com>
 <87mrwcqejt.ffs@fw13>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <87mrwcqejt.ffs@fw13>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA3OCBTYWx0ZWRfX8GJvoH/gu1iQ
 fDXptvPSBeb8DtG0NlU6cIe4UJTxhF/ktNvv2uRHNwnVFMM5wRL6OSQtIUCaJrZolBj83mVkYpe
 VHIHx/LJp7WJipWwxlGHERRVa+1rjW/5N7FQSzVtbYmiwoYwUKJexRIgBsnbdxd1AXBP7Ocfa5r
 hqrr7pi8uBnDlQyutvbmlFimFTLm/IO/rE6wRFP4WLQfuOcWdREbFx+VVuY9RksBdwotYABTUSm
 JlttPEJMEiaSfu8C1l5EdoI/k/KXs2gU4SAIQDvB3lWohCA+7EoUVBH+/Hwfm/r2BZ2MnLH6q/d
 y/XddyIpln462QydSIBEkYAVbgAgm5dTKDJ0h5YqC9/nZFQJ1fioRIJLDQ7n3hz8NN5h9IYQco4
 IACMeYlxXoQtELPRfc9sDTQcax6o4sHbE2Q+GDbi+VXPobW0OdsPYelggxEFEwJXqhF4m5jX0lD
 lIa84ZP3oFdlvEoPtsA==
X-Proofpoint-GUID: 4P8Uz2xeowHtvKh8SUVlHeMRytMsVWjt
X-Authority-Analysis: v=2.4 cv=QbFWeMbv c=1 sm=1 tr=0 ts=6a477050 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=xxOP1YzqUXX0Hlv9yD0A:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: 4P8Uz2xeowHtvKh8SUVlHeMRytMsVWjt
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA3OCBTYWx0ZWRfX/9F4Pevnbz8c
 zOoXggrPEpe3mc8EE3sFTbcx6ATeLteizEwB0J/QaZPWcus0DmZD7feb4fuGoVFPWAMWl3BTwU/
 mBH4lwbo7dgiJS/GGTM1NNQVzFX8eEg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030078
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39390-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:tglx@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[maulik.shah@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D85526FFFA9



On 6/30/2026 8:08 PM, Thomas Gleixner wrote:
> On Tue, Jun 16 2026 at 14:55, Maulik Shah wrote:
>> @@ -336,7 +418,8 @@ static int pdc_setup_pin_mapping(struct device_node *np)
>>  		return -EINVAL;
>>  
>>  	pdc_region_cnt = n / 3;
>> -	pdc_region = kzalloc_objs(*pdc_region, pdc_region_cnt);
>> +	pdc_region = devm_kcalloc(dev, pdc_region_cnt, sizeof(*pdc_region),
>> +				  GFP_KERNEL);
> 
> No line break required. You have 100 characters
> 
> Other than that nit, this looks sane now.

Sure. I will update in v4.

Thanks,
Maulik


