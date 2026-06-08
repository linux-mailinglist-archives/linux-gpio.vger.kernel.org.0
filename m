Return-Path: <linux-gpio+bounces-38089-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4KqcAquXJmpIZQIAu9opvQ
	(envelope-from <linux-gpio+bounces-38089-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 12:21:31 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A83E654FEE
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 12:21:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=JqF5HFC0;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=FmTguH66;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38089-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38089-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 54C39307E126
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jun 2026 10:08:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E706D3C4545;
	Mon,  8 Jun 2026 10:06:49 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC0D3BB124
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 10:06:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780913209; cv=none; b=h4nB1kF4e7ShstwpnhIc9mgY40qA1s1JE4xtK7svZEUWOIFKBJ3dWqujgd0arUohBGNu0F7cXNbRkTTFw9w622sSs0O2YVmbEVIaLoEI9nL8nhk2waaa3tuEN5xWywahSeIwNuz1LG0yqEhlO6kXFC8YE4rn7vGs2SPEEjxK1xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780913209; c=relaxed/simple;
	bh=KI6uYiXA5Djw9SkNazf/BdY1/8gBsUt21OljjUxNkX8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eaMnVJuHTjkmz1nbxd0V04oWr57JoOu8xxVGV5rMRY+zS4279Na5opq2zMilJ09jXVe8xLngQMYl0fzZq68/8ZOFj+h0EiwCQ0uzIJ8KwMoRKvd+KPOvSI+yxFybaAALCWKtG3eUz4ynjDY4yIlOxlKJsMttECgeWc8acxSWtXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JqF5HFC0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FmTguH66; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586RWkM2833497
	for <linux-gpio@vger.kernel.org>; Mon, 8 Jun 2026 10:06:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	spxpQghrem8Y0gqdfZEhfncpVw0aY3EvdsS4NM86pGk=; b=JqF5HFC0HioFAen9
	Z/nA5RHfjDUFFhAasdxHhH5IGKsbcOJ277ku8oIMC5SbgRpUC/w3xhT/U/M+QrkP
	gBRbhQz8/mKwAxjjHjXqnq2bHvRHL+etDueqv8lSyV8BBRRD7tKr6mXaOW4gJfTn
	B9nT6ts5rLNJr4AoOmKcDYJ9w7L48slyIHpknGAOI0yp7J85vsDwUzcYLCR+/lqu
	MqGgwb2iHsdMiIG76omlRujOYLApKaNgqiVaBMtcTEmi5RdaofNpvMGNBX0ZQWiK
	3+elRrH7tQtkc4sEjT7jI4bwPz6W0E9WYC3JMV6/AYX30dAPSztmXwSwbtSL85Lt
	iisjfQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emaj4yhvu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 08 Jun 2026 10:06:47 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5178ac43d27so11593231cf.0
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jun 2026 03:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780913207; x=1781518007; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=spxpQghrem8Y0gqdfZEhfncpVw0aY3EvdsS4NM86pGk=;
        b=FmTguH664Rh/ywCf6kaMWAEPrMdUFzs39TmIn+befX/szGa5hox7XRRf62geot0nUb
         5Ys57F6TqFMEE2AGKtYUc7u0rvRzcc6dFFSCdCpAjp+WvJjW7XbsNHioNk/Ulp9L/WP2
         /sqqDo1atJgn1kjcZRrQCfPgYL52pLqfu2nWU49eUlrbLDvjJTU6tlGg75c12dU+7wXT
         7k1tQHFRJPyVQQidj08CZzluutGxMp7zFcCictgOFqJlfHfksEbvPFO1XIVfwoiAr2dd
         WxaD6Es6/Z7E5VXnLdRZt0tsbAHTPrxmDCjHBEOtaK0p9735dCXA0SIwksO4OzlMMmaR
         9n9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780913207; x=1781518007;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=spxpQghrem8Y0gqdfZEhfncpVw0aY3EvdsS4NM86pGk=;
        b=USAGhKGgK7g2OMXd9/2EqWJzIWOa89CJvYkO7qc+KdHln1QRX2B1rcMZs+LLOKOXzx
         0UNCpPpmiHuSwDGivZUG22PjadI70pO7FIyXZiRN25YbManV9Azlf6DyvOkoUbf74qR+
         rL+IiS3GJ4NkIGbApGma3WLqmJHW/+xv8oueoRfnGNdDQpXa3dtoiFE5sHsuizS8wMC1
         AY+5TOUPoxdzGADSL61YXss8rAWCsq5NlZaPEZ/NbpobNHWQ5ZV83ULTQ79NjnWYoV+X
         C7wuAqh6t9khn9aFyETNLEQ2XFUszK5dOsYtIGJXVVzenZszouYETY17wI/CZUo3SZcO
         dkDw==
X-Forwarded-Encrypted: i=1; AFNElJ/4KuYUWRYuiUpLlEzr2Ap2wFiRNy3b7paKn+yegxA3HLsnOjIehcLZJ8W+5AJPjnCYVw0g1D1TPZa3@vger.kernel.org
X-Gm-Message-State: AOJu0YwjW0Vy0lfUwGcNidXyy5eCM6dPcDPUwxb8TY7gJKmKvGK+y1Br
	9i2qLDzzFF9YO07CvvFybD5SW7u/wg+bo5WW8pYb7IBdaRRe2PybUy9IqGaiWqd6df6RCxANldu
	ujL954gGXKMB7l72qQkRUE4uLTyI8Uxay8g6kY6SE9B9+gA4+TDEAlaB4QpXfketu
X-Gm-Gg: Acq92OGwj5wOW/49FPyCVA33KhvH0Q9P0EYeqYb3hA928KZxBav4AxOrULg71j0OTZz
	yPyxTY+QWVdp2m3byQQU7gioDHJEjaMIvOUjusK6mnE/DG03O+2L9MrpjU3a/v5xzIx5dSoDPIP
	6YaPzojM83OUV218OrMRifC4hSf8I3j7SrJKdlobqSxfo6vElCnvetlXsHJcWU1wNrffgGdrXVT
	uyR6+QDEtEFFOmaGR8Pn3cRnYfjR8xMwOtqcYOCqPeAn9gr2IRCs+Kk/vM6jg9B9P/zeCWdmYAT
	Fh3MEqfoHqjMI9c6EecaztH4K7eURnktrXONm9oum2Cjv5GGgYxEBmctEcoXhsZ7vyBtAzv3P2Z
	hVMD5danhjZI2pSqxPzcz+czyQxPJREUvz3n33Cx5n13JSYrZfheqRptw
X-Received: by 2002:a05:622a:58cf:b0:50f:bea5:52a with SMTP id d75a77b69052e-517958e7faemr125717611cf.0.1780913207077;
        Mon, 08 Jun 2026 03:06:47 -0700 (PDT)
X-Received: by 2002:a05:622a:58cf:b0:50f:bea5:52a with SMTP id d75a77b69052e-517958e7faemr125717381cf.0.1780913206659;
        Mon, 08 Jun 2026 03:06:46 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf0553060dasm848324066b.44.2026.06.08.03.06.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 03:06:45 -0700 (PDT)
Message-ID: <bfe4049e-d84e-4359-81b9-a4e68851b32d@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 12:06:44 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/2] pinctrl: qcom: eliza: Fix HDMI_RCV_DET function
 slot
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij
 <linusw@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260423-misc-eliza-pinctrl-v1-0-2498b365ff2c@pm.me>
 <20260423-misc-eliza-pinctrl-v1-1-2498b365ff2c@pm.me>
 <5dae3a56-a17c-4201-ba0b-8591646197ef@oss.qualcomm.com>
 <P33wW6i3eN15uYIbIb8LfIVRvmL0zVdiI_FOKDoMIM_KFi01m_7PMaZmU1z3YJl9mGN2kDtSvXUujD-TWaXXiSOZeEH-kwj3JSjmIRfRb54=@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <P33wW6i3eN15uYIbIb8LfIVRvmL0zVdiI_FOKDoMIM_KFi01m_7PMaZmU1z3YJl9mGN2kDtSvXUujD-TWaXXiSOZeEH-kwj3JSjmIRfRb54=@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: hPhozVmDFyaKR0TFPQhv917BiMV4CwFL
X-Proofpoint-GUID: hPhozVmDFyaKR0TFPQhv917BiMV4CwFL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA5NCBTYWx0ZWRfX+1RfoC1w6q4u
 zMamijBsd1QbrU2WRFlTzuja3Qsps/h4xNI5olMyFj4Yg2g6yzkqulvH81UfYuOZZiqlFgCYsJX
 b6sDJlZkp64FtmJsHsbSxBAryvQq1w9FDTZecoOVeNlk33GZFyCIxbKqJqNlwgDgk0Gl4Zk5FL4
 kVAOtCIrZU20VUIxaGteWlX0cnFvj4mox4aaq/3jVtttNiBgY+kwwh0EyB+2cG6jMMc9rdMqUMP
 OX48/rPJP9onuI0gDlEL2mKi75r2HrT0EwCKOtmyB/+OT2NyLX5kjVyKTaZcSAKMOUhrHx/i9Bm
 JmDaunVFTTf17TCXQLH7zkHg/wJ38P4iuZfL7v0vfDQM4PfCqg4OKq+asfuQEuNih+Ck3y9Ta+r
 gpdZ9T42StANsi92Y6FqkVlhooC3TH0nu41OQo+2mHR77ccs8xj05jmQlzPsidYgEswPJUtLM7r
 7v0ZbX4f6b4tVuz+lcQ==
X-Authority-Analysis: v=2.4 cv=TLh1jVla c=1 sm=1 tr=0 ts=6a269437 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=I_GUxYuSRt8l7ccQOTUA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 phishscore=0 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080094
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38089-lists,linux-gpio=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:akoskovich@pm.me,m:andersson@kernel.org,m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9A83E654FEE

On 5/28/26 7:24 PM, Alexander Koskovich wrote:
> On Thursday, April 23rd, 2026 at 7:08 PM, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
> 
>> On 4/23/26 6:51 AM, Alexander Koskovich wrote:
>>> The hdmi_rcv_det function was placed at alt function slot 2, but the
>>> correct mux value for this function on GPIO 19 is slot 3. Move it
>>> accordingly and leave slot 2 unassigned.
>>
>> No, 2 is the desired one per docs
>>
>> 0 -> GPIO
>> 1 -> QUP2_SE5_L3
>> 2 -> HDMI_RCV_DET
> 
> Is it possible that CQ7790S is a special case? The pin assignment I have for it
> here is:
> 
> 0 -> GPIO
> 1 -> QUP2_SE5_L3
> 2 -> N/A
> 3 -> GP_PDM_MIRA[0]/HDMI_RCV_DET

I'll try to find an answer, even though I doubt it

Konrad

