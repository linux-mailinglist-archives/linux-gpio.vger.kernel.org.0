Return-Path: <linux-gpio+bounces-39100-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BAvuAyJDQmr52wkAu9opvQ
	(envelope-from <linux-gpio+bounces-39100-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 12:04:18 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 59AEB6D89EC
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 12:04:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="Xb9A6/LA";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=VpD9EOf1;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39100-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39100-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2DB1030841F4
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 09:54:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB1413B71B4;
	Mon, 29 Jun 2026 09:54:12 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271F23B5DEE
	for <linux-gpio@vger.kernel.org>; Mon, 29 Jun 2026 09:54:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782726852; cv=none; b=a35ib3zvvefpcI229ngQ4wBTosse2rQFnYbzaT4IjfdlmBWqJJlwvt3zBm94wiqhIcfduwUzf5UhTNUgmGQGVkJRsNYuAQBu6NjrNegY+NIboF8ie3hK5FxhuzIKskKt27dRjZWLu3y0gEQt7IbXRfvHMkMDTGtH9INMzdoFKA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782726852; c=relaxed/simple;
	bh=jJs5HXjAjE6envyfFgur9WbBH78XFXKLbcwrpOB9mic=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=meZCb5j638igMfn7981obJV87k6IZ2LW1q1+SoIzOtodnq6lWxjDhaqV73aIQR0u6ELx5mFdoSBuV11bxmL9UOGu9BORTJub3OLQ+Ob2mTQhCRO/InHOg2Nd0wD9JC8khP87VsvqFerYMVTe+CpGEYg/8Cus17NI2K1WhyUzsN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xb9A6/LA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VpD9EOf1; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T8aSvG2368200
	for <linux-gpio@vger.kernel.org>; Mon, 29 Jun 2026 09:54:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EBxu6i0uZX52gkc9fGScK0SejhMq3Ms/srPUAHTCOKg=; b=Xb9A6/LA+P7zO6gv
	TSHmWreXsuvxIaqNcikwvF5e64DLIRrdk7LaD5QdaDvOsfdkuo3dzdSZIvqH+1pJ
	gfdeltekerjusw2Oew6EsreXon0+bvI7KXOomzN7BNZ4DQYcrfJSUKVfdcejY62G
	Z8uR9ZDwYTMWhs9dNwN0dOgMNkdyOBeQR/EM5IZ/FXHwAXo4DbVZbAF+Cf2Za/jY
	rQzfd/NQx81suVRQykNd02KLMigk3qjFvCEdKQ64FZPOrw5UFQUJz13bDugCHhcX
	xkoj+TiZ4dhGCPm7ynlV8IkSNxEjDQ0mEu+Nurr0dsJeta2bQnB/y9RHBLCj+DcA
	GbUqOA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nbgra62-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 29 Jun 2026 09:54:10 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bf599c27cso448281cf.1
        for <linux-gpio@vger.kernel.org>; Mon, 29 Jun 2026 02:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782726849; x=1783331649; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EBxu6i0uZX52gkc9fGScK0SejhMq3Ms/srPUAHTCOKg=;
        b=VpD9EOf1NbxDuuJNI2zqKyDteQ0WyTsLZvLKPfURH7vrljlFKHrjMHvoqloQWztUdr
         bwV/3r6Mj9kg3hIh4wf5BLG+IvDePya8PKkXVNuLwFmtEp2rp1RSNinY+yyeH1HdpMjb
         KHSYNe+TXEWXQ77HEa8csDDCN09xZWRMlOeRwYS8odPp2I5Ev924uOQqoF2Ovtx1EU8i
         hIzgxs1/Yeo5las7+RujzTBv4MJ2yX4LjpJZ1MSCw8A3GZmjyyMLwi5+hB9XU2Ig9OLz
         geEsZdbhzC7cm67UovaRCaDq+KuOOikAU7XJgDrOcZzxoJD+5sCHrjMcJdrRbfsjGnhJ
         QHow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782726849; x=1783331649;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EBxu6i0uZX52gkc9fGScK0SejhMq3Ms/srPUAHTCOKg=;
        b=b8DKzpHNcaSXaVWTI+DSQLmHGl3T28UMkYqRkOtyn3BIIGB9D6xx81X5erIkUOsQJz
         cSlJQ/1BbYptncnDgdE60oPQMLy/jwuR/nR7u2IgQx2M2mkH/q3uIJowS/7wsRKyJQfE
         suQMSGntmwWS0+AcgRM6brzTxKIp+2XEuG0dATkehM5WJguUH8sPu7YAtGUc4n26w7BE
         ArnbXmQoNvHSk5V233aqtu0RikYsRHQ/qdpoi8gztzlsKXXaN3PV44VuQADJ50CBwA/X
         qB/REIzvHvbYxS0tx5GYfumT/Lp77HNtrW7i+i8HzyN77/6+x6KmnjllxjI57+qnTUFB
         ArWQ==
X-Forwarded-Encrypted: i=1; AFNElJ+4TurtLaa01HKkDRr3jXFp7MQCvpenhLh6CZU2lIxtRfd3nd97CHuqLBAUnwFkZfct1eKWCT7unYAO@vger.kernel.org
X-Gm-Message-State: AOJu0YyQAhHI1VXHPFcxGLp4VnXiu1w1e3LfO4DTQPFM4/xchEYDMrjG
	LMvKykLfzh36gRJB5dMzdIBoRNittBA8oHH0VQzM0KR5oisoYWTEhvuJXJAqKqVvv3uKU4Qmo4b
	arT+0XTG9RcyPD/NWeTz7i+bRsVa/aMjjkuxFFiFQB+/FDJC6Uc34qwMfd9tb5nA6
X-Gm-Gg: AfdE7cm+6MvJ2XnAmJhTBO2O4hCFHMvnHMmNCKdjd0BV3DS837vCeN8ui4GrAptCjsd
	ppzSru1Sj8I6DYUzj5qcv9KF44mXH+17/EA1W3NEYzGTDGMMK5pp0iqvjPGbnzSk4PPhHygxEOQ
	v2TQlqTbhxldSuyyq7lOjs/nW/6SQB8K2gqUoySn1tpIPXPYOFl3BpK3p2N7G/38y9UTyLKO+KV
	xdp/QuPeSun0VbWZ6BdLcda8g4UgNrUm8iThwqCm2J6Y2OORPhRpS3BfRrVyMHDoVVQVr/t9bux
	B4FUzE/LlU/r+JSFaIqbMy0QhvOEm+ECDqp3qBqTyQXkvq/UN87FgTcY20pE0QDNxMpdR/cpIvf
	bd946FrkkaF56k9a79mu2iWxVzT4a8PEeoss=
X-Received: by 2002:a05:622a:6804:20b0:51a:8945:312d with SMTP id d75a77b69052e-51a894539d5mr58095821cf.0.1782726849471;
        Mon, 29 Jun 2026 02:54:09 -0700 (PDT)
X-Received: by 2002:a05:622a:6804:20b0:51a:8945:312d with SMTP id d75a77b69052e-51a894539d5mr58095641cf.0.1782726849091;
        Mon, 29 Jun 2026 02:54:09 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c126ed2de5csm91319766b.7.2026.06.29.02.54.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 02:54:07 -0700 (PDT)
Message-ID: <d3e48ff0-e43b-4e02-87db-d734421cb9ba@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 11:54:05 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/8] x1e80100: Enable PDC wake GPIOs and deepest idle
 state
To: Val Packett <val@packett.cool>,
        Maulik Shah
 <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
References: <20260616-hamoa_pdc_v3-v3-0-4d8e1504ea75@oss.qualcomm.com>
 <439b81a5-b13c-4f1a-9c55-a8b0b56a4de6@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <439b81a5-b13c-4f1a-9c55-a8b0b56a4de6@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: e0YGVlUBafEQYd2fl-mb8tMnkD0ocOHx
X-Authority-Analysis: v=2.4 cv=Z4Hc2nRA c=1 sm=1 tr=0 ts=6a4240c2 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=CzlgM8hXaGG7tx5CzA4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3OSBTYWx0ZWRfXzZvK1kFAGdd1
 nl/d8Pl0FWFRJp5I7Zd87U1+e8T5MtNXA3H39eihuHjOL8dDBBdZLoXAleig9kROrNEY/lC+AV9
 8kMPjTie6mNBcu/VWb7cxsFfz/qiCtk=
X-Proofpoint-GUID: e0YGVlUBafEQYd2fl-mb8tMnkD0ocOHx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3OSBTYWx0ZWRfXyOt+SdKB0MLq
 A7lf+UpIup7/kHp520k39XHSk0Ejf15Fqa2RQfrRaF2cw+/QR6q7+uBf5Vb1Vnoa6EnLYxaCbgO
 DtlT+4biQ8Kp+6U0LvqpQ6ej6my4cT3wwbGEUOaqZyY6oSvypVgbwl9bh6mzRjRwAnggB7O9S7X
 IEQKtoceRR9Yu8W3fBytxYWPwHfZ1Ldlv+mdNJ11bz0wP/nOP7laG+5IS1KSPEmvDYHjaMn+Wnv
 brV3qjlBR+FbcmgF4OpJrToDVX7/5mrRf5lBM/BU/HRl1HP/0YVofxE6f0XQjjGnN/afaZOGz4C
 W5rttE7BWzo9RSs2cCG0qtpGomeQmN4H3LHmelhIyTZdbzfsuBO0rlrHKDZ3WkeGRAhbYQG6vaS
 omEkch5MjpsI++uEBWJCkYf4XMAJf6I+ydsMZtKV2UWIScaRYBY19vfkWeCl/bzo9LbTtahA+mW
 FrYRhKnX2uZEBaowvNQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290079
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39100-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:val@packett.cool,m:maulik.shah@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tglx@kernel.org,m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:stephan.gerhold@linaro.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 59AEB6D89EC

On 6/28/26 8:39 PM, Val Packett wrote:
> 
> On 6/16/26 6:25 AM, Maulik Shah wrote:
>> [..]
>> ---
>> Maulik Shah (7):
>>        irqchip/qcom-pdc: restructure version support
>>        irqchip/qcom-pdc: Move all statics to struct pdc_desc
>>        irqchip/qcom-pdc: Remove pdc_enable_intr() wrapper
>>        irqchip/qcom-pdc: Differentiate between direct SPI and GPIO as SPI
>>        irqchip/qcom-pdc: Configure PDC to pass through mode
>>        Revert "pinctrl: qcom: x1e80100: Bypass PDC wakeup parent for now"
>>        arm64: dts: qcom: x1e80100: Add deepest idle state
>>
>> Stephan Gerhold (1):
>>        pinctrl: qcom: Acknowledge IRQs for PDC interrupt controller
>>
>> [..]
> 
> Something about this series breaks the touchscreen interrupt (<&tlmm 81 IRQ_TYPE_LEVEL_LOW>) on sm7325-motorola-dubai :(
> 
> With this series, that interrupt only happens once (stuck at 1 in /proc/interrupts) so events are not reported. Something something level triggered..??

Could you bisect which of the (hopefully first 6) patches cause it?

Konrad

