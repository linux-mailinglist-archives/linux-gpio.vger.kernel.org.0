Return-Path: <linux-gpio+bounces-36440-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2LVaJg2k/Wl0ggAAu9opvQ
	(envelope-from <linux-gpio+bounces-36440-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 08 May 2026 10:51:25 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFF84F3E66
	for <lists+linux-gpio@lfdr.de>; Fri, 08 May 2026 10:51:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A88A93017ED9
	for <lists+linux-gpio@lfdr.de>; Fri,  8 May 2026 08:51:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4BB8369980;
	Fri,  8 May 2026 08:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M7c6drTF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f8dbdxqn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F512D97B5
	for <linux-gpio@vger.kernel.org>; Fri,  8 May 2026 08:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778230283; cv=none; b=XOI7KJgqndzETCLNZvVs9qXrjGq1UL0vZrM/v5oYAY2ftDxgsAE429npo5lMvoCIU7+Emu1KspxzzkM4BjmyhgHMWF6OucJwiqp8aQK035psz1nW/AWxzNiJ2QIZfWYUSW0NBoGmPKdxru4GjYUf/7PIIe2vPFn3tJEK4ChWX2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778230283; c=relaxed/simple;
	bh=VtsjDtpzf1aSwXKAMAiXCL3tDm2zBBBXyjYr/AaI1x8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a+mGWMP0aZqqL5t/kOWLMW2CW5D8RzzbNVjlKGsfzVcbbWZ9Vex0rqcHqXq9YrwNyMRF1y0ff/hR5AFCBqjBk7qweHa80JNhzpvsmZp+Wlxn/ykSpKJQREbrm5bPavRhSmRqY7sbcqMeNiffWElkpmbKfWUsqNLBWlAXjr6CgYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M7c6drTF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f8dbdxqn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6484VtOe2771642
	for <linux-gpio@vger.kernel.org>; Fri, 8 May 2026 08:51:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Go6MMG1FPNgUfm3yVi8/f5fii9YrI8DP0LqHCFgBeA4=; b=M7c6drTFyv6zraF/
	T/6u+JilJa7uUyx8eJYMlXLo5qgRpdTPdq7FjP5E+Lo2YofWdsXg5zubXu0cbxFt
	I55TpKz+OkZffbamuPqwFXhWXZOZPJtBj6liNQ/OdZqTLBBWdjcX5AiJS73QAn1+
	8Qp68VBpJSlY3ygHZ5Eq/SO7+yckKjwiJCDDf+swTsFSMWBjy6EGaY965Nm3HHPj
	lg4yqdi8bm9nbpR2LBsUygYvMERpLOrwYCCFokbrDDZXq3C3pN0c6mL4iMSv9jR6
	GmCIcv9i0xgSlWBs/py4H7Kr89B9BdiCUcpfAowexy7wIcq8Y8qpjCYjmMRg4kLE
	izU5dQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0yt5jv20-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 08 May 2026 08:51:20 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8ee2dfd63beso31190285a.1
        for <linux-gpio@vger.kernel.org>; Fri, 08 May 2026 01:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778230279; x=1778835079; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Go6MMG1FPNgUfm3yVi8/f5fii9YrI8DP0LqHCFgBeA4=;
        b=f8dbdxqn9QvtcAENIrJWKqtS+oE6XjFKou4INklcUIfTx4kGJjmOCDcWV2V5Uwmf0m
         OZFLDtu1nYEtQZ0R1vBdJbH/03uzzsSsn16Z/vbgLahe7dR6ixga0Dojyk8ziP+MmAf7
         aQbeUkSZ5K7jsTzad7e/xTfx3PEhkvOK1eBucJzEwij5NKnQp36/qmG2MNecL68bUQjE
         afZYln+p47R97sJ/L/mjYzXifTiFWJjq3l1idiniCGmw9jgmVTxbXvWsEyjhYd6ZS68E
         9YbcTguTjRWPiZQrNk7krHYe80witjgIbo1hZwTCUgHBdJ7UfQlVjaeH4Q0Rftm1UPWq
         e4zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778230279; x=1778835079;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Go6MMG1FPNgUfm3yVi8/f5fii9YrI8DP0LqHCFgBeA4=;
        b=maf03CXEUk2ORdfMnWFg+j0Ql9Olmv2/CwEMMUXzUzArHXAWR7BE7VgrWrtYMshh5J
         JmV4Y1uzDXfNHel+Ta4ok2H8wCnblqrxDjJwSPyxd56WQYzU9zGj+VzyTE0KTemLVni2
         4uaGLaJp+nIp4tqn2Wo2TffD1ZclFWkEuMRCfTigk6Q5KvIw6X9tWOEwFW6UdqiyWaru
         P3/88UWOG+fxAXgziMyTf8JdK0ib5CB0J/5tVnixwxLiPaWmTZ/bg92Up5znRucnKydz
         LmYquv07pSWYZfbeZ2JbwMyNM3QdOI91ACvdQW11Oyhiz/f9jb+8i/+hdl7r+M0xLLHD
         yqEA==
X-Forwarded-Encrypted: i=1; AFNElJ+F/w3uA65MEP0TKjZYSANsKYfFBOYHGZiPcSKqr8L55ySTPQV1q613PbJ7Z8RlWYeED2s1GY6lFSxW@vger.kernel.org
X-Gm-Message-State: AOJu0YzKkfKfuwN0haHbZIMzoioKdiBCj7dIG+nRp/oKLeEBYbz1UjQG
	3WZ4vwF3sZd1g705QsUxrq+45DZxkPxl4ubCo6WCAToEfNwdd+f9xlr/SOwmtw5gCW67xxN8ZyT
	WlhyQe1GRc4sXSJp0Z706J8Mhr+FGP3zR1QWgb9Ic2k9fWeD2Q2wwi0HO17PhKSnV1PlMUPqz
X-Gm-Gg: AeBDietgrPIdRCH/eRoTUFklHMU17F+aHfERdI9HxC91PcgsCPZN8VvWlMShxi0nsXk
	/E5z8Pbnt/ZsfWSnG+7VmUJVkamXVBi2HeCOM2VRq9cCG9PwsE4We2M8x6aVEbTvVJWQ2kgSvHZ
	d7xgBsz1qLvG/07SbZR1BDq0/zVFrPz+fySxmyHGTTApnWfL+g9/WNWw47bpC1GJx3TtEcWeFvN
	7OacfIbZfyGiE7bTwHvx8vjT1WpebC262XIFPIkGD1j5f3DyM7fI06Fuf1uUdV/C2+TmySRO3F1
	980RmzkBIeHynrdHjmt1Rwbp9MxEM6DKpGicLVx4M6ixOLWFMYzLCB/V1biLgdnob2kvjO2SXL9
	14cTW2B1anSA54H/lToPWBXwywODn0Yi5VZ4Mqg0J+ZR5VmxswgTOiaoy5J6p4z88DILPgGCs38
	MUBOw=
X-Received: by 2002:a05:620a:458f:b0:8f8:cdd0:df70 with SMTP id af79cd13be357-904ddcc2a73mr1168442085a.3.1778230279566;
        Fri, 08 May 2026 01:51:19 -0700 (PDT)
X-Received: by 2002:a05:620a:458f:b0:8f8:cdd0:df70 with SMTP id af79cd13be357-904ddcc2a73mr1168439685a.3.1778230279185;
        Fri, 08 May 2026 01:51:19 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67ef0b8a939sm407542a12.13.2026.05.08.01.51.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 01:51:18 -0700 (PDT)
Message-ID: <cba5bb2d-a885-4476-aa16-eb1384fcaa58@oss.qualcomm.com>
Date: Fri, 8 May 2026 10:51:15 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add gpio device node for pm8010
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        David Collins
 <david.collins@oss.qualcomm.com>,
        kamal.wadhwa@oss.qualcomm.com, kernel@oss.qualcomm.com
References: <20260507-pm8010_gpio-v1-0-3bce9da8d2ba@oss.qualcomm.com>
 <20260507-pm8010_gpio-v1-3-3bce9da8d2ba@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260507-pm8010_gpio-v1-3-3bce9da8d2ba@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Dc0nbPtW c=1 sm=1 tr=0 ts=69fda408 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=iQYToJXVBgYrGeExREkA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: O062aCJXI1-1E7V4BD1qi67BrJAbG6NF
X-Proofpoint-ORIG-GUID: O062aCJXI1-1E7V4BD1qi67BrJAbG6NF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDA5MCBTYWx0ZWRfX+Yk1uA+z9vlz
 eviVxL2WIwxbMA//C/I+SR7q/DCB1RMxMYrdXDcVssXiAwZKHszh5ssShn/uhK3MF6Orkbnv3tj
 H60AsN3oghMljtyWBwX6rcjX49neJqEfLOiKi/jXqB5wD9IO5biOjNxp/G+PsPAVsH2I0qtn94N
 gWzcrSc4C3hpCsizBxnddJPkhW48Eqets4m7W4xB0GjP1uloDm0apR2GkPqK4JCTVsR2eRCAntW
 e72MHDi1uUZKGW8caWXfhAPdSOuFXxUpFwWONONHTBouZBqqLU9Tn8vPZG17SE/LZprEvsBv2Ll
 EQ7XFLLi0/rU3rhm04OYUK7yuiHLbhcpYrEDoZfg4/7NOMQFumzXLzdtUcSj50PGgN44QIc5Y3T
 IGIw8379Stbm3GtgZdrBohwjEYiPx9qPuGHmz7JL4xTsDEIkJvp1YL+RWfm9l8eanR6CLu3zKQQ
 KKzn4NPyfK4co5wRLkg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080090
X-Rspamd-Queue-Id: 3EFF84F3E66
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-36440-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/8/26 7:34 AM, Fenglin Wu wrote:
> Add gpio device nodes in pm8010*.dtsi files for any consumers to be
> able to use the GPIOs.
> 
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

