Return-Path: <linux-gpio+bounces-36915-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GEYzLeH2BmpUpwIAu9opvQ
	(envelope-from <linux-gpio+bounces-36915-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 12:35:13 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4C554D6FB
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 12:35:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2854A301F7F9
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 10:32:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D8E13D1AB1;
	Fri, 15 May 2026 10:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JJyvMM1M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EpjeT5Pq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F10038D3FD
	for <linux-gpio@vger.kernel.org>; Fri, 15 May 2026 10:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778841131; cv=none; b=gRBYC3wZvIKk6SLTGiqXylmgcq0flg0R7qSylaO+qkoRRxwp9K8mgxC4/jIbCMEyp2wuz4zv7taiUer2XAd2ek8q1ClPDxRXjPneCUs32oswDb+KXWN1xS0T8NKr/6Uy2lD16LW6tVsYkjp7XvCfQ5AIwi6hWWQWiPScIJj/uoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778841131; c=relaxed/simple;
	bh=LaqNkBsC1aPqGZMmd9r+EzaETwzayMdcQqzUGkAYZx8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hzHYbkTneQ8lTYsdWWw1aJCAZ1/VhlY2VzKXva4u03mDLq9C+6fk0wkr2B2yKVv5De15xk+iZkq+mkhUZYGDvYm4rqAWh0t1rAz2+CIHtCGTHuJ8THrQKdQ5k1e1v5gZJjeZb/tzQfRNI6+NZvuh9WkgIirIsBaxl/PZ1DYOtAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JJyvMM1M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EpjeT5Pq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F4m69p4020724
	for <linux-gpio@vger.kernel.org>; Fri, 15 May 2026 10:32:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7P5tIwdg/rLa4pPJy9f6dOdgWa9waugHsGuQ8JjtvLw=; b=JJyvMM1MhhPgRHma
	u6YC1THsAyKMKFu4juyXz8tWxEMCBJgCsohNlcAUWrvAUkG02qKj88x8jgrnAbuQ
	iAWc3YX9CD5AGjizW8WiR28hRDznmBZ1zxJb2UX1aa+2a9TkCvV9m4/dCvAhzXR8
	/85EG4NEuHqGZEbyKykf/wwGiDbMJfnQlD54A66ngowY+5apLcLnKWnqIe132gRs
	IYd0MQljCmNQbi1SpihvNQss9W565IMEwOsFr1kEMzZT8qQhPMjbgFh0YYqL6kWV
	WTxS/62TuERj34FMWWyyiPpWPIYuqO13qaklvmh96JiZoRmNGNKRSi8x+EVzAgjQ
	SgNmBQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1rtv1k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 15 May 2026 10:32:09 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-90fef17f6f5so66089085a.1
        for <linux-gpio@vger.kernel.org>; Fri, 15 May 2026 03:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778841128; x=1779445928; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7P5tIwdg/rLa4pPJy9f6dOdgWa9waugHsGuQ8JjtvLw=;
        b=EpjeT5PqIGG6WpjFj1QJ1nv3oNk52EtUiMWpYXMeERodPxbnVan5m3FPMC3vaVHfOh
         kr5+yVBIQB0y1C9ygSxf5NupRxRyIJzNeWRRbFGtjCkZ3dCyVLWZvoTiMaSCRA1OKftn
         WfT0l3AoxddpTusC10wqqGZcpes7ezomEunB7KsJ0ICQwESRq07VPIBtk5zBueKlVFw6
         OQioOenOcXmpYH95lRssixxUkn0nRSneXKH43xKzY1kJZ92UyklwnwXgbhI3iHGXd7/n
         QlVJ2Wk6BRPNREOHPXiJYY4NM/RMQXMh0iusjMgK2dL0DES84BCNYmxoVvXyDSruAhzl
         eS2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778841128; x=1779445928;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7P5tIwdg/rLa4pPJy9f6dOdgWa9waugHsGuQ8JjtvLw=;
        b=UvH6zCtv2XuWDV7Wu5nrZIMMauVJM2bHhK3bYUFjoZxDyubqxjEmvgvu+3YKBZsya9
         5lp2HqfujDH35gMIjPJI9wqeKUUEh9Q2NK/owyWmV3lJ7xSV5b7x19VowpkUETm8JBU5
         9+j86ubi0trWImwifF2kId3mpdVC5Ga2unp3N3l/yNyqdOsYSKEXHW4Z8rTZolK2lurf
         C5zZx2Li3poRcCVuMxdV6zPSQveaZjL+K53OMLfnjOYsOskw1M881u6C2s+ZpD7Jf9Er
         VfiHwXejLLZIXFDVJlLduZo/CSOxOwgTbwfurfPm1EMRpsIs/4lOxMmnPBim0sX34ZOx
         hbcg==
X-Forwarded-Encrypted: i=1; AFNElJ+V31Il2Mf8iJ4ljQEc209Geug1V+QqotoUskKQILkK5J1oap7C7ZyPx8MAWAHXStrQl+r+4QXJUiN/@vger.kernel.org
X-Gm-Message-State: AOJu0YzQGsEkgJZYsIZpPQZSbeIzsJ2rhig1IlApSOU3it1K1vs/5bkh
	lNxhMSZR8LqRxWIMxmHQbt42nJ4V9kwxWVXZiNxTRktOiIBPwjGA1g3RQIpmIsRXkU93rx1cxDk
	F4gmMcRDp1l3sKi07X0VHKcyikO07GKSb0zo19wfpHu4gsQDyM6cFZRswb5H0KZzn
X-Gm-Gg: Acq92OEpflVkIbtCxHIrdZKW5RyD1s7EfUmZmed1jLQVzk8id23TZiT+XQv2Hqmq/ma
	VeJHWdjzR3aV732FdQNh0LtYRltz+3QVZf1uBwPPgiLW/eYV4PKTASzm6aoXR62SVgQg7fkDh+q
	MFibozGhgxGwZTIMx1/8fqPmorIqZFqtdgR+Pk37bc8W0R7pQaiPrxb/Zfu6kL6DSk+7+sF7VH/
	d2SSTU0i+qP+9pdPZ3HqfkVmZTWLvTsmf1ldLGdjXm8PRZxU6TVYIdm0JFT4QILnZNvW6Zp74G7
	BwuPWfFrwM5OcO4neq5SXf+8/SZpCcalrYOaVacB/QMIOmKzGHvCiJ85vaHkojWx8NcWxuz0u/m
	PMOlTAT6UcEEpJ8Yp2K/yHbAckyd4HsvZY0L9NQiOhoCep0f07s1MpkwUnMvsyD5MpXwHFUIp7T
	pahQe6tLGc1V0xVQ==
X-Received: by 2002:a05:620a:701b:b0:8d7:3f45:b95c with SMTP id af79cd13be357-911cd9560b9mr374352985a.2.1778841128320;
        Fri, 15 May 2026 03:32:08 -0700 (PDT)
X-Received: by 2002:a05:620a:701b:b0:8d7:3f45:b95c with SMTP id af79cd13be357-911cd9560b9mr374348485a.2.1778841127788;
        Fri, 15 May 2026 03:32:07 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68310b4069dsm1798256a12.1.2026.05.15.03.32.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 03:32:06 -0700 (PDT)
Message-ID: <7d84ca2a-9bbd-450e-a531-a9b2bc227cf2@oss.qualcomm.com>
Date: Fri, 15 May 2026 12:32:04 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] pinctrl: qcom: Add Shikra pinctrl driver
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org
References: <20260512-shikra-pinctrl-v4-0-b93c3a2e4c08@oss.qualcomm.com>
 <20260512-shikra-pinctrl-v4-2-b93c3a2e4c08@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260512-shikra-pinctrl-v4-2-b93c3a2e4c08@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 9FtF5-NCOxsaoKGutPTNQbZNCg86zCzm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEwNiBTYWx0ZWRfXxlRdtdtWGtWG
 9nVy8It9ZJr4yhAkH18NOhM41TmL0gRkBE4CZro/jKQL5vtuN2UxuFgSS5V7Xk/50pmGINqcmRy
 gIhf79cJG8tn4YpVGpki5Rdbqs7x86r+1xB9GmMNTylT047wuV68eWY10ZWepgzUAeQrzhHS9Iz
 UYJ0lhNn6oys9xjw+97ZHIBhgCosAl48FlaV5T9HBrRbTUQTYl49WNjGYVvRuwkKD6c9ZW2DRQT
 +AY9JODIbV6/Xh7wjkTCT7+puCMB6cllBjjuSn4dosyec4LrirIwGtLkdi8jd7qrJ/qYjsnYGgY
 nvDBL9/3e/t97of7uGMXWBDpoOxtMn36U4y1gaLAluDITXm0P6ozy7w7L9P4StekWz9z+zI0KVw
 gAejsplCsvuGGjIAiQMT4iY/NUHqTbxuoaW1Hht0uYoHQjpJkITkdoe3prSPga3ZzjR9/0f/2lC
 C5Hc/FdZpj2OTasHwBA==
X-Proofpoint-ORIG-GUID: 9FtF5-NCOxsaoKGutPTNQbZNCg86zCzm
X-Authority-Analysis: v=2.4 cv=JPELdcKb c=1 sm=1 tr=0 ts=6a06f629 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=NVK-j4C6oOT1ijtQxEUA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150106
X-Rspamd-Queue-Id: 5A4C554D6FB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36915-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/12/26 3:25 PM, Komal Bajaj wrote:
> Add pinctrl driver for TLMM block found in Shikra SoC.
> 
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

