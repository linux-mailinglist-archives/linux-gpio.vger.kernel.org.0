Return-Path: <linux-gpio+bounces-33724-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ACLVIT9yumnRWQIAu9opvQ
	(envelope-from <linux-gpio+bounces-33724-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 10:37:03 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A0D2B92C6
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 10:37:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0EA80310B392
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 09:26:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE8973B27CC;
	Wed, 18 Mar 2026 09:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ecto1oXB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UwWPbkSz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8425E3ACA74
	for <linux-gpio@vger.kernel.org>; Wed, 18 Mar 2026 09:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773825872; cv=none; b=HGkj3vilBkK+1SpYNaXrySIJqcWnej7DK9e9gsekWHZ1Vi/5T2wCEzY8u2PecX0hfSOc5UyzvdYlM/EQP4tFzunsMEkNJYmsnwJteKPTlQuF5lURtKgVyZGCmmp5csASM7+SqIgHQtTXvmG2MPSOMjRuWoQ5XE8MTEaIe8Vtoz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773825872; c=relaxed/simple;
	bh=mKpALUSNN+vZ+vwSIY8NP+XEDB2kWb0Nbss+jOmN3Cs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A50IByX7LSli4MYy88TTM1PA7Q5rnECSbtdSdN3Haj1PG9Aw898gkVqdUlhW5qpA6w1jSCapxc7HU2uIgxLAEAdzE6Ht28/sP4Kf4NI7G82OKStVWxwO85eyVfxY1/ZqL9/X1UF1Kku6DYJXKMQvxDWITWO5pSm6uZ0ogJ6PUtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ecto1oXB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UwWPbkSz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I8spCU2730120
	for <linux-gpio@vger.kernel.org>; Wed, 18 Mar 2026 09:24:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mScTVSflKScsMduaq8uFre2oakEknzUSovCM8gwCPbw=; b=ecto1oXBVXVpDc0T
	ZHgRvHx09hQ1mYXOyO+5KCzAm9voR4goMlXdnNchyi+sMvbgneHvQhWumENqatF2
	nSGfvX0t2krxoYDQbZ1nhmnUODN7/78odGoJLr1jb1n+FsiHgXN0Q8okij6h8JVO
	e+/S300VPBnAlFQL0Rkix+to5zwi6gzC04oJaQaNwWnsds350p7rAyHPgTSB3lJP
	7tG8W8/g5DkMYlLE2cBdKMG27iJZGqu/GY2UCT5PSpTWjeY6W5K9vN234GJn4oG3
	+VBBagDh4c7Z7han1GhVoc6cmsmAZV9Rmi0YVZj5m1amcgg+7xOvkVDBnpKEv7Km
	wHsoBw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy8kjv4tn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 18 Mar 2026 09:24:30 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50910ca6ccaso86761961cf.3
        for <linux-gpio@vger.kernel.org>; Wed, 18 Mar 2026 02:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773825870; x=1774430670; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mScTVSflKScsMduaq8uFre2oakEknzUSovCM8gwCPbw=;
        b=UwWPbkSzmFBc3P0Zn+8rqYVzWUobFY7qWtJDYziWU5eTGup7sHqMf3Ngc6GNg5kDxN
         Fao6kYs6QDGt3dQipBRKY82tW/YcQb6bXGGH0k9XscXU2JzXuq58Ow4fDfg/uaN/8yLd
         pG7pc0c9muw6CLgovDuviGNw5Ufj1cH5eTOSxbMoeDVwZjoijKckj53ST3vtERTUBMec
         CEx47jpSmiseKkmlMsfaa4lUP6tbwlrd1phsud7c3AgW2YtyLs/gk8t2H0f05Rvob0j2
         NopqklVntbBae+hTZaAvhNxunYlPnp5rINViqgrY1uvAIaT+pH18UM7cpX+1/jdyE/hl
         PDLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773825870; x=1774430670;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mScTVSflKScsMduaq8uFre2oakEknzUSovCM8gwCPbw=;
        b=Z6nY/VikVGrOCdjQ1R7/2aEFybmNC18zwkEftDoKcSii13WHfLJJq+nN6ll7yuhgL3
         GN6T8EQRN8J1tHbckB+R3hsKzATvL97zl4qxEcauGuYDBVrWoK5S5luzhJlJmxLIRW2M
         63Eq7H5l6agwJdEJ5dIKsHwWhPYwPN6xJafWELOfx8dJUksDSBxk6MRm2hvDk9Xkf2gc
         Eo88c4i7OQpU5rw8L4ApYIJN0VNm14SqT2nOC+5MI1pxIKEJgpCKDzA+loHqhd55ZExr
         WEM8W0jkl5hfM71k0CJeIjjpVOhFqGYSdHkb3zhJ9ahdXdux9jQLuvQCQfhjawQSMbpj
         jBsA==
X-Forwarded-Encrypted: i=1; AJvYcCU2Q9YrAAS/jV2xHWhNzsQVJ8yLytcg4dVQUhMZppQ2Dw2opU5ZCX6yaLPqagFpaoY1kkQfnSvmRkSy@vger.kernel.org
X-Gm-Message-State: AOJu0YwkW1z3XSPADNLCeeGg7x67kIbZT+UCwhZcgU6n3gmDGKwsTktM
	nrnDRz6HskOuxdbO/0wB49KyhMZDhtchCL8BmFPBI4OwTwqUXASEjUiPXXBrcQHOVX7DJkxV/IN
	K71ZqdDs7yAh0rEDME/uhqQ0xLOdOrH9ffuTZPJe9Jx1eZkvQCHeg/ZwDlZnGkF7Z
X-Gm-Gg: ATEYQzx9LKMoBxXH4AnBjb0AQ91KL6s/SRtGK8aryB48GrvWaKg3Kk9iGhy10lL+T7b
	2M5G4jnN3EbQsuvAfJYwXQUv9qwMrq6g/KnZtov2jduQS6N9gfIkT1v2p+6RqR0Vy+v71h38OxT
	wN7R0pjTPL25NUQNy3xjjMOny1rKhEHozbyHk9W4zAJmD4vk93BvowBmEvmP79YoxwF5F2EfHYA
	fTs/3wPL5W6mRuc4evBMj1tCeFHSxZI8JYXmhNT/RCygrLDZXsI7avhsjRj/R4kxdF6jiSsyEHD
	a8YHUA1MOId0dcfHqHMUdPZpWMMYTJtgIkCgqbUHOGIC6RNNUNzNSO9SUB7n8d93T1ZcazfXdLQ
	j5B3egN5XH3CzzPKcTfqXbPUAcEi+psTI2BkKCpEXymaQ7oi2oSdGQJlczaSk4H7oYM0Sf5cr96
	97ixs=
X-Received: by 2002:ac8:7f4a:0:b0:509:2c6e:f6e0 with SMTP id d75a77b69052e-50b14906b2dmr23415871cf.8.1773825870012;
        Wed, 18 Mar 2026 02:24:30 -0700 (PDT)
X-Received: by 2002:ac8:7f4a:0:b0:509:2c6e:f6e0 with SMTP id d75a77b69052e-50b14906b2dmr23415641cf.8.1773825869500;
        Wed, 18 Mar 2026 02:24:29 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f1751cfesm162094766b.63.2026.03.18.02.24.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 02:24:28 -0700 (PDT)
Message-ID: <9adc65b6-abfa-4046-b029-1cf112c5256c@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 10:24:26 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: Introduce IPQ5210 TLMM driver
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260318-ipq5210_tlmm-v2-0-182d47b3d540@oss.qualcomm.com>
 <20260318-ipq5210_tlmm-v2-2-182d47b3d540@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260318-ipq5210_tlmm-v2-2-182d47b3d540@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA3OSBTYWx0ZWRfX5sVvf1T2CVlB
 S3ZDOQntKkUCpI4slPxJjYdsaWaAvehgJ5J2O98ZX0u9EMd1A1aMG/WpJk/7uV5zhYhoN1WA737
 5U8eJyrkKjtYDTVHSyaMJpORS68M31x40fGGNihqJ/dEhPPqxE99+lDyk/muJ7mNjm8hKo+EB9N
 vxluC8T0hemTMjH5UflwLnKs8N5EHUA2n8Tc2mvDUR/mK6F6kfZnLe7lSr9xuQ+KpJkZ7g2kqwR
 XjMiiyFqanbhCOktELu82NlNDDuLlbAczXJFw3K6V7vkXDn6rykGjKHT4hkdtrJcHGZJ3czq2We
 xuB7Uxe6egZ3pFkOI6mErLqG19y+yaFDot9YTGOHVWUjKKaJmSIIOwxvEmF4DEXkv+Ce7CaxsRo
 dR7ooEvLsSm7nHl4j+pAvUQNOuubJmKFwAKDUsU+ynM70HW3lXCUrPl4WR9zAJaKIgcfyZCFfzo
 Fb06R3aDAv64kwcSgWA==
X-Authority-Analysis: v=2.4 cv=P8I3RyAu c=1 sm=1 tr=0 ts=69ba6f4e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=_mKsZQhdUJt0vTTU-fsA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 2KEWgER-OG1vWsqCoTW-QRP0ka7o2Ebb
X-Proofpoint-GUID: 2KEWgER-OG1vWsqCoTW-QRP0ka7o2Ebb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_05,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603180079
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33724-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 28A0D2B92C6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/18/26 8:14 AM, Kathiravan Thirumoorthy wrote:
> Qualcomm's IPQ5210 SoC comes with a TLMM block, like all other platforms,
> so add a driver for it.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

