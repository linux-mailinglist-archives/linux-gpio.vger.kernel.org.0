Return-Path: <linux-gpio+bounces-35933-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8PkCCV9y82l52wEAu9opvQ
	(envelope-from <linux-gpio+bounces-35933-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 17:16:47 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE384A48F9
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 17:16:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 331F930300F4
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 15:16:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CD2C43CECC;
	Thu, 30 Apr 2026 15:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nA7ZlNwC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TFQE49b0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D741282F30
	for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 15:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777561969; cv=none; b=lgz+5jpZcmAR9XVCr4o8MfjrtuNKHQMaqi9fKPWA6hne7C7J724Kahbc4THzfOCuWYMpRNGaw5DqHmejZDiOaWPm8OLUXqbOqW0pJJN0V29u36j4YIxw2/ttVyPdS0RhcK4+c7WuPUZJgeSLLyhfCGwUe/UoVwAFvjxfzyeuFBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777561969; c=relaxed/simple;
	bh=G4L0Xf8IL4fWRdLnsrKd1HOfE8DHAWvVmaVeHwz8C54=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kW/MNkZ3W5xa8VuEip82EgZMYFjds6MnmHxpDT9hWp5eku4rU7aZrtkZ5I3do1/sej8egVpv7aBwOr6sLxyXLlebWKbrKDh4iNj9L9tX+4Of7XoGUFnfytd0wWv3V8js4/Hx0EaO+qpPOWAPrvVnOlARi5wwaSOmzAkkXObHOT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nA7ZlNwC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TFQE49b0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UBkkvi1821577
	for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 15:12:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ulrYcfHf8eIqVY1+cFokIxV8AlG+2IlbHsMqaIrHX5w=; b=nA7ZlNwCnxkpI5Ua
	T6G1AUGmSdjawvYbxrjjjz0AeBOPpy6GZpQNm4/z+usJ7YfN4maIZqsCk0VhKPSc
	hHphZIFqkJB+IwUwPxcvf6OD6uRNnrn/4G7LzIyEjkU1ykNclaSr5jdwQiRmZvdx
	GXD2LS+EsBuZ3is+J1nYv+5lbj277XrsvoFr4xLAn1qyBBUHWo833MoTk/KCJ11T
	tDiBWgtiB79WiozhqPl6RYjded62mRvhoTn+WvGBYFs2LDn49ZitpY+OZ1zkqICA
	zLcRKFcixkg3PFmK8+dko2US/nR73peqs/8eoP9JNywyfy8PNbHOSgnywW17ncCK
	7h6oaQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dv6ges0jv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 15:12:45 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-95cd67d9a7dso47117241.2
        for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 08:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777561965; x=1778166765; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ulrYcfHf8eIqVY1+cFokIxV8AlG+2IlbHsMqaIrHX5w=;
        b=TFQE49b0TWm9tyGcXvlmVbSITqFPxFJTkw8S1cJvt0Bp1EsdGZKA+qQUWZdMPkFo6F
         NU4YP6kv0hfoF6BYLtmOUIqHo7Mji+gIxKYSjKvXjxUzRS42PuPx/IvznBBb2WMVtAD9
         7l+05zn+wToBc+6cMwd13X2zuyZJTcSWm8q2z7m/FJbu7WlzfKJuKQDjAEvZpWbJHIG7
         IV+IJwNJn0sKtTasqRJHNNjAtxXup6C379a5yCpfZvtdepfyKpwqumVeIzo3u1eDJpx4
         4fVQ8RWOoDq/k5Pc41LnRt9epsYC1qP9oUDki/DAuvpS/EhGV+/8x06wQAI2LnpJ0tPY
         7QEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777561965; x=1778166765;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ulrYcfHf8eIqVY1+cFokIxV8AlG+2IlbHsMqaIrHX5w=;
        b=crJuTzTGzj73MorOCf+LRTFfocgqO0aWowhsh0wlkSOX5yUgLLlPikzYDI88SMG55o
         UzDaTP5W7wdsrWgXNg59VmsXl+9Yd5zqF5XfRVqMd9w2Ir3HJm0ouoBWhgcDfOsAiVzF
         MGD9QK9PuOmKIT9B4NDdj+n5C1xyOhDNUTi5Q3ZXEYvmtcRGHkokH1uRGwQP0TNXSY6i
         sfZsl+Fr0UsrFwyAx+4kY/P10ybBQNHS9UK7XOOVxp5+52nHGotUTRdIt9oGWnqG2ZZT
         sQlQq6vXdqdXkWFKB09Hf9xkbXNh4+21SwWq8ZOTCgN0dlDVHQDmZFyQUzm0E+h+bHUj
         WDfQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Lxg3r7bzHbQpLqkLb3vFrdiSHTjkeZHfIj+gDYqcbcQJDYQ1k/KpN6kuKZPX31bxTYmBPZNO1rFQh@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm+lH9hXtuEBQLxuM9MIipuDd60rp7/oRRzaYsvlhdwYiHH9K6
	WYbUi1PBcGAQqJ8XAZgSeftJBp73zt/m2jYE+t6gOQNlwk8kDCLauKvM5G+bqiVUJ1ELSDBHGZs
	D0RlVENEA6Y53dwT4TawLuBIlmjZpxgdRUaAz0IUSFGoh2sOUUvo2CmAQUKt1Hd2o
X-Gm-Gg: AeBDietVm1dn8mWw4/nbL+uQJqikW2ZnHQH1CeLO4Cgc/9spEkKiVTUx+EQXC80u/eq
	g2Si3jApTRSxz9N1WEjScsMxVXUOQw4ffX02J43lqGQ10PV3kiCSJE6N1qy81NDCZ5tGbdAxinP
	Zgc7fDsex8kcwgZJPRbB/3QMIvI+6FlThSXqAEA25vH2JB+3VlqY+o3i9iuIbFWVpf0nMk3fIcW
	jvw/s+J2CEekS9phteGy+TiLsm5Wuy8Z5KvrHt3u0Fj3K6jMpTtxqxsPPcQK/VzJi/fB0+Be7cZ
	Mv14hte1FAFGjzjeAiKKpRtQMIEdKEi/CEZVbfnn3tY+y7N5oT/I44udza54pxpr8h/4PlISF0Q
	vTE7A7xy92f7od6Pwp7+eMAQZYSSbkkLFJmAWvNU3UACRPl32EWWlTB62NxVH7Xynr5gYAh4VnE
	nS1Vnu6RQEyQUP1w==
X-Received: by 2002:ac5:c9ba:0:b0:573:abb5:7d39 with SMTP id 71dfb90a1353d-573c9698ee3mr610460e0c.3.1777561964653;
        Thu, 30 Apr 2026 08:12:44 -0700 (PDT)
X-Received: by 2002:ac5:c9ba:0:b0:573:abb5:7d39 with SMTP id 71dfb90a1353d-573c9698ee3mr610434e0c.3.1777561964239;
        Thu, 30 Apr 2026 08:12:44 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bbe6a64d919sm8497666b.23.2026.04.30.08.12.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 08:12:43 -0700 (PDT)
Message-ID: <efd349b8-eb01-43ab-ab0a-99e6d9ec0885@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 17:12:41 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: pinctrl: qcom: move gpio-hog schema to
 tlmm-common
To: Swati Agarwal <swati.agarwal@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260430140118.3684018-1-swati.agarwal@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260430140118.3684018-1-swati.agarwal@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=f6V4wuyM c=1 sm=1 tr=0 ts=69f3716d cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vT5BNdOIVckz33J0OJoA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: dPdQijO91wa97JW-mCigluWF1O4rdSTg
X-Proofpoint-ORIG-GUID: dPdQijO91wa97JW-mCigluWF1O4rdSTg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDE1NyBTYWx0ZWRfX4yFnQb8OJCyH
 LgTRHJrUtmIrPNO/z0q1UqRBtgM/7RoQ5sX4EKjp0Kq1FfLL4Hae+kD6sB0PX4dHNB7RGsWYn2U
 1BZUnI9t5wwe7yrlbDyz6SRIxlJAhm7YgVkSdb2HZ5XEQQEI6loxZxEoADfZPtez7OLPGGEBk05
 z/t5KtXAg40Gm1j36sIF04DEQ44FVM0trKLgimm2MoIA7uVMTcJ2se5YDRKsHqpNlBLaF8TWo+s
 JTPOWUn21BvzYfByBe13S3J0L5YDzooEqHUTWT157SPxdVQy6/EF79AQd+0ZwTxxcFOzpCzjir/
 jnSjD0fZxcJZQ2x/9x5TFUhygqDmkcCsb30mSkn8Tj99eTBse5NAMpVRRp7/M1+VZMJC4J4QdJM
 TBDdk9rk+y1a2Lha2NARoRwytuF/Twhvck0/Kh7BJV9+Ui0Y7ctlDrgbxw+1Ud1PrmFu+nJTkHk
 JT6qqNRM3reCV1LaLPQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604300157
X-Rspamd-Queue-Id: 8EE384A48F9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35933-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/30/26 4:01 PM, Swati Agarwal wrote:
> Qualcomm TLMM-based pin controllers share the same gpio-hog binding
> semantics across multiple SoCs. The gpio-hog pattern currently defined in
> qcom,sdm845-pinctrl.yaml is not specific to SDM845 and applies to all TLMM
> controllers.
> 
> Move the gpio-hog patternProperties definition to qcom,tlmm-common.yaml so
> that it can be reused by other Qualcomm TLMM pinctrl bindings and avoid
> duplication.
> 
> Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
> ---
> Changes in v2:
> Move the gpio-hog patternProperties definition to qcom,tlmm-common.yaml
> 
> Link to v1:
> https://lore.kernel.org/all/20260417152014.3000797-1-swati.agarwal@oss.qualcomm.com/
> ---
>  .../devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.yaml    | 5 -----
>  .../devicetree/bindings/pinctrl/qcom,tlmm-common.yaml       | 6 ++++++

Please also remove it from qcom,ipq4019-pinctrl, which also includes
tlmm-common

Konrad

