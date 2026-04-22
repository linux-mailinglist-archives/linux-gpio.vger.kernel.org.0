Return-Path: <linux-gpio+bounces-35343-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8DNjKJGQ6GmpMQIAu9opvQ
	(envelope-from <linux-gpio+bounces-35343-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 11:10:41 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A3830443C85
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 11:10:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E083F30095CA
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 09:10:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5A483C197A;
	Wed, 22 Apr 2026 09:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yj+l5AA+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PjDAODNh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60CB33BFE2A
	for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 09:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776849012; cv=none; b=M8XOfACj6rEJMlCEVP28nGHwBeggCZd0HLKzxvF2TNvCJCfrvtsW7D3yN++YXGEe0rEfqv+fdM8pxv83nkpSQvyvcR/fLdHXzWGoh2uGnj8C8/xBuLAUUyKy1Uc3fkeu5nmIetbYvpqdXojsirK7lqE1Cnd8mXIl2bvnS2d17Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776849012; c=relaxed/simple;
	bh=Ht5XepZYeWRruFIhSU9il0UdSXEj0Q/RgKbZF358CzQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jYOp0EFKnwSmssCnlwoRznkqVNjl4ZeYrdnkcOE2h/s9YvwoFzHssSpiIytdG8KkLetjWayFp4C38stzUthsD0TrATQQ6o6xOjXdRrzyra+gouRFJWXHE3ITCMoRcwopoK5VaHLOQFC0dqydal9p/r5jPF9GPoLMRq2FMGe4bk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yj+l5AA+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PjDAODNh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M96E4Q664048
	for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 09:10:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ht3ugslvaAB2Tu02wj4yEDUsNolBfYrFDnScbsYJ3ic=; b=Yj+l5AA+2wthYYYx
	H8NyPInpanMAxY//LbbvDmYdeAIopIN51yaDsUFyoqeN8gkkMS4+ZKKL/q6Y6pD8
	Z56ULvAT8gctR9s7GsRcWIhkOHb0E9LlLaB7jetxIF9iRUi78ItcxQugjQCUUTWv
	DtUMTKhE9UQ7EELK3FolEVbOJvszZVUsS+KfdwpHS6PNgiv+SEVNRS6L6WsrxZjD
	8a451y7NNGwMtC4GOpaG5MT5Wy8q3lKsLiZV6eKapwj2VoLkPJfaEh6hmwbv4PAN
	YCxpytvC6vcSx6TIXom9wqpGOwDKd6et/2DkWScx+ItbRqi51T5uwKvJXfRTCUuk
	3zqzuQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpudgr123-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 09:10:10 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8954b9b5da7so14444126d6.2
        for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 02:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776849009; x=1777453809; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ht3ugslvaAB2Tu02wj4yEDUsNolBfYrFDnScbsYJ3ic=;
        b=PjDAODNhJTswMSAb99LcyGNINSuDClgsTrMBvusG1DI6yUG32w0NC5jFApwNIg7zeV
         BH5jnwRPbu0Z/p4CmoVvRege4nxMRLU4fEgGz9jApb67J77sm6Nb1QV3PhaXeREe3SV0
         9RuLQJ/2ZKL+roxEyWgI4JukRGpSzUjExskNssu6cSxzSvo04XCgOTaOat+WkloL5t7T
         szhOoR6mQURqIPo0aDQYMDYDdpn5lqnhn8A3zh2M50VVYnJ7wrvDLnzEDwnCRThH7+Ek
         27Nt0KmG64s/R2envjhaROvfjw6W+oeyqt4ze9vWLDp6MOSZLaDAUHloB1FVg48/sZjo
         uYmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776849009; x=1777453809;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ht3ugslvaAB2Tu02wj4yEDUsNolBfYrFDnScbsYJ3ic=;
        b=H103QFLqlH8a6nl89AB4Tv3q1uxG48PHAamaahVgMyV2oVk6le8yfT4bW6Sj4d7Cj/
         PJSj5ARVt13d7e7yroG3WFDah27+BGhLjhDY1/us8CvLre0W+iBwi7ruVJL/fKuAya3B
         nlzuvQoge02IOvpKxJJkybgeSkgO6+uB7GMiNs9G799em+6ACT8vUpQkuGHT4Hw9tGWO
         5XIuPyEYOLzFVhWHAKLza0GLeLkVepjcEEfFiPDAXEif5GidPLkHKTUVaWz7hg/L9AJa
         LWA9jw9XTMyb5noT/pLG4Vz1iEJPP5afulciTydCZTfiO7ZnIq99piJ7zdEO9wyM/MxF
         UaBw==
X-Forwarded-Encrypted: i=1; AFNElJ9a3hNQWZgtITPj6VgwauA+SqWhD4+hZucZx3hfLQuXmX+MRrP4RgQFsKKgAhOVx7W/aJ/Q1ZhetGGc@vger.kernel.org
X-Gm-Message-State: AOJu0YwQR+rXEo/Vj59r+0SYBsGjCV8X2zWduGLoKBSkggW3tLURS6Hk
	TB0X/tPorO1Uk19bgQGVkiNFnhgH1jMf7K4H6lCLgOU4fWm5q3N2jQdZw0TAfqx1hcstBlqxqAm
	+GAFIAV7y9cBj2x7lV8ENaNLFguTFrfvP7Wpp0nRUy/U9op6vCPeYttKO1ERLdTQ8
X-Gm-Gg: AeBDietH5pdeBK+RX6TjMzR1eZz9h4nnL7KPrxRpJ1P8VuDQL5GRdfb7gjstCo/PB/f
	mrjBvH2rc9uPQjqxhd6sjsk3F1Q2TJmVhRUBx5V0y49lZKfrCYqjjXPLFtr+J6sikKrH/BJMTfx
	EbnB4ZFxUNFCUnv4uPpXOPBXmcY43gsD9kFMlGwDEdnq5Pcd15dhIZXWSzYULhwvuxJ5PX5d3Bi
	ZVs2jsnH/d/Ww3a2PwlXavMy/XMiPFclakW1mkZ6rQ2cMsuFOtTe3KfJChUMb459crskNSn5Hwh
	tBkGZka8TvtyoTuYpiTE7UbK2LD/VLaGBgefL6zs9aa/DcI3msyNv/o3NSSZIq6679w5E2LGoVP
	+q1v2OUuKINohSnPrAHXTZmEzzZmocbcKIbUzb0W6CIuMb220hbuKyaLEKGhkfTnf/8OBZYIEVl
	lz6g46/ceKDB1x4w==
X-Received: by 2002:a05:6214:29c8:b0:8ac:a833:a22d with SMTP id 6a1803df08f44-8b02813864emr257999226d6.3.1776849009605;
        Wed, 22 Apr 2026 02:10:09 -0700 (PDT)
X-Received: by 2002:a05:6214:29c8:b0:8ac:a833:a22d with SMTP id 6a1803df08f44-8b02813864emr257998856d6.3.1776849009062;
        Wed, 22 Apr 2026 02:10:09 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba455539817sm518715166b.56.2026.04.22.02.10.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 02:10:08 -0700 (PDT)
Message-ID: <9635af37-f3cd-4f82-ac87-84e51021822d@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 11:10:05 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: eliza: Split up some QUP pin groups
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij
 <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260420-fix-eliza-pinctrl-v2-0-b68329fd6701@pm.me>
 <20260420-fix-eliza-pinctrl-v2-2-b68329fd6701@pm.me>
 <cdaf1f7d-72d1-4481-aa3f-4b15990cf6a6@oss.qualcomm.com>
 <Li2-2Zov5lvXZcLfb6l0_7mDAg2QB-ag10-aLD59ulR1pntDBHpNORrd0I5Gg_YGqo-rGdIgil2DmrVw1CoDhgN1S7QLsnId_k2mf4u5DYk=@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <Li2-2Zov5lvXZcLfb6l0_7mDAg2QB-ag10-aLD59ulR1pntDBHpNORrd0I5Gg_YGqo-rGdIgil2DmrVw1CoDhgN1S7QLsnId_k2mf4u5DYk=@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 0YBrrqBenEMkKdVCHIBKfoNcKpqtKQSd
X-Authority-Analysis: v=2.4 cv=c5ibhx9l c=1 sm=1 tr=0 ts=69e89072 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=dVDS_O1aKoMvdT6kGvYA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: 0YBrrqBenEMkKdVCHIBKfoNcKpqtKQSd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDA4MyBTYWx0ZWRfX75PsMzPnXzn/
 nYg3ZIskknz+2l5czEmJG02YUg46dJR6uOD9FSX41bhKI/c9WNqeqDNhchVBJ4lEMoIJQ3VM06q
 VxMQflYE0xCy+pUjvA37p8eUcevzTEpRks6LNw3npt3NE2UskIocSKYauuMMfGvJeu2Qs40+sh7
 1OkAcbIXOpmM1jo0rfWaK8h2283oWasXpRkxtP2G1cW/a+1cd+It5Ov5ZFh9/QcBDFyWGmQqY9N
 BmxiLfOLMWuweGLSGRVbix3Lnk9q5tNQQDMOLm5G/+7gPy/Yi2V15W3CRwgVZElFcscnAmhc9wp
 V7vwQbrNQ2ypaBs/Sr5RwLTR6+H0V30K9GsUsBbUB8ADXB0uEj/aeXzxmaPVpbxUyqNExyES63x
 4QDh/Cg7j9kobJnNCsjkfOaGFquW8gAbNJRsART5Cmv8PG1F7XzsxHs5EmsXkj2TEGCu15WdN6D
 Zz/q1HiuVPiEg0tbKHA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220083
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35343-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A3830443C85
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/21/26 6:50 PM, Alexander Koskovich wrote:
> On Tuesday, April 21st, 2026 at 9:06 AM, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
> 
>> On 4/20/26 4:28 PM, Alexander Koskovich wrote:
>>> Multiple QUPs have lanes that can be routed to one of two GPIOs and
>>> collapsing them prevents devicetrees from requesting specific routing.
>>>
>>> For example, a board that wires an I2C SCL line to one of two GPIOs
>>> cannot request that specific pin with the groups collapsed.
>>>
>>> This change splits them up so devicetrees can request the configuration
>>> they need.
>>
>> Please massage the commit message so that it highlights that the issue
>> is that there are multiple functions defined for a given pin, sharing
>> the same name
> 
> Will do in v3, also I was looking at how sm8550 handles this with qup2_se0, and
> noticed they don't split every lane in this case, they only split out the
> lanes that have two possible GPIOS:
> 
> 	msm_mux_qup2_se0_l0_mira,
> 	msm_mux_qup2_se0_l0_mirb,
> 	msm_mux_qup2_se0_l1_mira,
> 	msm_mux_qup2_se0_l1_mirb,
> 	msm_mux_qup2_se0_l2_mira,
> 	msm_mux_qup2_se0_l2_mirb,
> 	msm_mux_qup2_se0_l3_mira,
> 	msm_mux_qup2_se0_l3_mirb,
> 
> For Eliza I split them all out since I figured if I was already splitting some
> out for mira/mirb I should just also split the rest, but should I mirror this?

I'm a fan of keeping it minimal and only splitting where necessary

Konrad

