Return-Path: <linux-gpio+bounces-40050-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id U4NIIYb3VWpRxAAAu9opvQ
	(envelope-from <linux-gpio+bounces-40050-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 10:47:02 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F414F7528D2
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 10:47:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="oPWz/jeU";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=UgadcJZq;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40050-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40050-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 971AC3059916
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 08:44:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C36ED42B750;
	Tue, 14 Jul 2026 08:44:07 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8D140BCA3
	for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2026 08:44:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784018646; cv=none; b=raCOVzl7EEpXL+Iu9ALLtjjWO08M7A1zgkOfM5GQFSWPkVCbjVjQLl5lQbg6NTWf/sMiCmaBBSm1et5N68hE980TlxXyuMbXZ1Dsto0pzAXh9PDUOiCxCWreD9idAF+pmXZtnltoQdiOEk0yPlwO1E2wNru6HpG3tY/Pddl5RRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784018646; c=relaxed/simple;
	bh=Z94W1/W7TzLbivinV9rurg1VRUmupKdUn2Ra61GL0wA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qu1QOHk64wlyED4j4xHxpN2+hGDzbdYk83M4Nx6b6ohQfTEhfwnAraSpqB8EYeSmokUmpKbb72gmy0J3100+dre91XS6nBwUJVko0TN/93Rin7mXXbCdcjT47U62FcWM2RhPVvaG0pe0WMsxOg3D5jc2WplEVvRebBjP04mWh2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oPWz/jeU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UgadcJZq; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E6SYKx3954676
	for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2026 08:44:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LW/CEzEGzNAEwypyCM6YJOofetx3Ogz57FDUQUJrgtA=; b=oPWz/jeUsdMn6FCg
	PjfHIMu6f4PBmZud+RGwDpd3jwhR9MoL+HFZZpbuCtauxonF3MRx6S6YsT9+cFVl
	P7okO5l/F4L6jzNhMfe0zbdjLT4ptqCXeiHwuZsONGw6DTyFiFpP5/dThjAWoPWB
	kGgw8uUp90PKbbk2s8WN6jnEHxxsjrr80OdIYss/dR5RRNf2b1JzCGO0DpIzBq5m
	89Hq4taMnOnePeVBtlmTe8E9IrAJOPjl+HQ4BhLfqiC2gSsi1h6eSSolo/IkEg0i
	jIWLsO9Ak4x0+XISL+C5uMh8rAdxxz2IPS2mVtslPbGaSB5AemEXUQGyoCefGv56
	/J7IYg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd44jtx4j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2026 08:44:00 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cc8bde6318so76698495ad.3
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2026 01:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784018639; x=1784623439; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LW/CEzEGzNAEwypyCM6YJOofetx3Ogz57FDUQUJrgtA=;
        b=UgadcJZqqu8fYR9JleJ7QYpusp1y9tsjgr5Est/qHWbEh9x5l7orJtOk3DLhyd/8hQ
         oVhSdDpG4kVWd62tAOmF8sKX1OwfgKsTv3MUXvGGTs39F5KXSWgaJkH2L2ox8I4SPz7q
         jaxXXsmKic5yfpb1DClOeMiYOigYA7CXhXRruiiQY9sfYqhL8NjB9uhHt4KEzRrzv8xw
         456+pTtgjPqd2XDBZ1U6CzDRvJkr8MiZJBu9SBCsTzyahJ4QUs29s8lG+2O0epUVDUzz
         kG1DIlsE7fG9gcJKcMkz4cX2Pw6LJoX2vHzRJN0WoHjvO+jkO62tRrAjyMiYK2RfX3vg
         +59A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784018639; x=1784623439;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LW/CEzEGzNAEwypyCM6YJOofetx3Ogz57FDUQUJrgtA=;
        b=l+A+Nd7SjsMNfZzeaOlMMTLEHGwZ6hyFtDypD/g08a39MY1b9E5DfdTmzu3JVHX2vW
         lGDi7sfzmQ6fGF8J1P+2z52PSyshVe680qrQdADw8C9DEaxhC6qvWM4RRWhb+hkG9MZY
         WcHb8zsE17DPAdzfa8CPArmcEvQ8Jxr1u3fQYYBUcvG2zxdIGqq86k0YAl8c0HcwKWeZ
         wt0DI1obYObN+6HNr6gR+B0x3gKghtU3lPZLoQczwNiqY0CUV8FOvzC/FqLhm6/S6zvM
         x4cxMICXalrryi8e3D2o6c0f4jeW6HP+7f1J8Cp/YJkNuoe2GsZvcVHIOlD8uuSq6Zh4
         hggQ==
X-Forwarded-Encrypted: i=1; AHgh+RoqL7TV8l3rmlKAYrPZo5QVR4rzScOiGl6ddNfBiGA+9WnBFOhKA1KEN/qgqzYxOfUffCNfZsNfSSxT@vger.kernel.org
X-Gm-Message-State: AOJu0YxJguqUUpNuF/jzO8T+UEClxLf45+2pQpt0Bn2T44QonZH8gB8J
	h8At7WsJgc0hXM0MFsT0JorqMTsjhFoVbP+tcNXWo3cy0EatpMDDa61u7PpsVCrEQxba/lfN5M/
	hLuZJr46A3LpxkuZk7+DI/OYl5qi38kR/iRgOzOB2rM2CjfbycRv74YSINAF2qGzD
X-Gm-Gg: AfdE7cmEEGOgWxGCLXdiR2woWKnv6iH2VJd9Smdxb/KCRFQ/awt4exez271fytNJa+6
	UGURsBfq0Scjk5E0Tbt2IHTXSnkNyDgCaFcx+5NAl5Hmb8F6j66cBcIxvO70QfA0Djb8xZ1rb1P
	kCoO2QFnH5eUROAd9rA8e3X5UEP6UhdlfpjmiDTksvFhQuBcvYhZXgJtxxAVfdKUa9MJEfMowt1
	dWJak/DO7+cRRGtVOOC2sUGkWZ6vClOxWqn7UD9moZ+Lh7v+SfP56ohxdfj6A+fy2HpS+CwVsMv
	ls+taiLxPhorKIEjjQUySdKx4e7i1R2uUPqd2i/uD3zYlgP0QQyooJJ5NJiZjb7X22VbFMiss/J
	CGzGvElYyyIlHZ3HM1pG/1Q+7snIm8hxn6I3t9KqgALKO
X-Received: by 2002:a17:903:234f:b0:2c2:bd7f:ccd4 with SMTP id d9443c01a7336-2cef12055f9mr16470925ad.21.1784018639426;
        Tue, 14 Jul 2026 01:43:59 -0700 (PDT)
X-Received: by 2002:a17:903:234f:b0:2c2:bd7f:ccd4 with SMTP id d9443c01a7336-2cef12055f9mr16470495ad.21.1784018638978;
        Tue, 14 Jul 2026 01:43:58 -0700 (PDT)
Received: from [10.219.49.235] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bf737bsm111470935ad.19.2026.07.14.01.43.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 01:43:58 -0700 (PDT)
Message-ID: <dae40416-f7b5-4f36-960d-808c1fdeef42@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 14:13:51 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] ASoC: qcom: q6prm: add support for LPASS LPR
 resource voting
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski
 <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
References: <20260713184549.929569-1-prasad.kumpatla@oss.qualcomm.com>
 <20260713184549.929569-4-prasad.kumpatla@oss.qualcomm.com>
 <046bb977-dad6-4bd0-b1c2-4321c58d3f27@oss.qualcomm.com>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <046bb977-dad6-4bd0-b1c2-4321c58d3f27@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 8JNnecBZYF6GQu6mzNImqC5wyf32DB-e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA5MSBTYWx0ZWRfX2PVRa+lif9dD
 QVU3oiHJg1ybgcBc+aKAuMy6GdYxMOUOlESlZhvRMdZOEJ3vPOoxBTiwpS6OJoewGSJ+r8awaAe
 Q2mJKkKzgCOsHfOOY3nTjmFep3BhPNMf3zjr0FWP5e4cLTnu67EaDkXPsYozwyCyShKR1HP8uhg
 O9syYLeC5elHbQmluKIWAsURC+3R+6ceHysDr+YOSIXmHoQXjoJrKo3qQPCG9JEZDqidoPZAME7
 mLo9Eab19z3SFLHa2asa34BH8pzt/Zh0+es0Y6EW42M6ucxrRS7s/xDfCEV3enuI0XuBqBdPif6
 uJwwM4eAWNLMCECyQLZOCGfsa2uxK5DhyFYb7xgUniSP4vfzW+eF6brZOHJ0eFXHUcOcvGSbHag
 gpx7rgVnob4wPGKjGUegU9ch88USrby3HAjpCrPt4bYpHBbEtd/n3/PuV5Hx6FLlQ5oWIqZZ7M2
 HfrWU66xb4BQRtwQk7g==
X-Authority-Analysis: v=2.4 cv=XonK/1F9 c=1 sm=1 tr=0 ts=6a55f6d0 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=XFR1filUoCuqy7zT_QkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 8JNnecBZYF6GQu6mzNImqC5wyf32DB-e
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA5MSBTYWx0ZWRfX7Cw1hfnYuLUy
 alro4PZpq+aEnxnx26M4S1t5WFZQULZKSlAR5O14/D+bJydNeEpNteOBy3uvZ+wgisvh1uAdBgS
 awICPDF5/1cs9OgzXB6sjF/UtftgN8E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140091
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-40050-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,perex.cz,suse.com];
	FORGED_RECIPIENTS(0.00)[m:srinivas.kandagatla@oss.qualcomm.com,m:andersson@kernel.org,m:brgl@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:srini@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:krzk@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-sound@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[prasad.kumpatla@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prasad.kumpatla@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F414F7528D2


On 7/14/2026 1:13 PM, Srinivas Kandagatla wrote:
> On 7/13/26 7:45 PM, Prasad Kumpatla wrote:
>> Add support for issuing LPASS low-power resource (LPR) votes through
>> the PRM interface.
>>
>> Some platforms (e.g. Hawi) require the LPASS to be kept active via LPR
>> resource voting instead of the existing hardware core vote mechanism.
>> Handle this by introducing support for PARAM_ID_RSC_CPU_LPR when the
>> LPR vote clock ID is requested.
>>
>> For LPR requests, use the appropriate parameter ID and payload format
>> to disable CPU subsystem sleep, ensuring that the LPASS register space
>> remains accessible.
>>
>> Also add the corresponding clock mapping for LPASS_HW_LPR_VOTE and make
>> the q6dsp clock ID range consistent with the dt-bindings by deriving
>> it from Q6AFE_MAX_CLK_ID.
>>
>> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
>> ---
>>   sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c |  2 +-
>>   sound/soc/qcom/qdsp6/q6prm-clocks.c       |  2 ++
>>   sound/soc/qcom/qdsp6/q6prm.c              | 17 +++++++++++++----
>>   sound/soc/qcom/qdsp6/q6prm.h              |  1 +
>>   4 files changed, 17 insertions(+), 5 deletions(-)
>>
>> diff --git a/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c b/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c
>> index 03838582a..79527a367 100644
>> --- a/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c
>> +++ b/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c
>> @@ -12,7 +12,7 @@
>>   #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
>>   #include "q6dsp-lpass-clocks.h"
>>   
>> -#define Q6DSP_MAX_CLK_ID			104
>> +#define Q6DSP_MAX_CLK_ID			Q6AFE_MAX_CLK_ID
>>   #define Q6DSP_LPASS_CLK_ROOT_DEFAULT		0
>>   
>>   
>> diff --git a/sound/soc/qcom/qdsp6/q6prm-clocks.c b/sound/soc/qcom/qdsp6/q6prm-clocks.c
>> index 4c574b48a..2b2b3872e 100644
>> --- a/sound/soc/qcom/qdsp6/q6prm-clocks.c
>> +++ b/sound/soc/qcom/qdsp6/q6prm-clocks.c
>> @@ -63,6 +63,8 @@ static const struct q6dsp_clk_init q6prm_clks[] = {
>>   		       "LPASS_HW_MACRO"),
>>   	Q6DSP_VOTE_CLK(LPASS_HW_DCODEC_VOTE, Q6PRM_HW_CORE_ID_DCODEC,
>>   		       "LPASS_HW_DCODEC"),
>> +	Q6DSP_VOTE_CLK(LPASS_HW_LPR_VOTE, Q6PRM_HW_LPR_VOTE,
>> +		       "LPASS_HW_LPR_VOTE"),
>>   };
>>   
>>   static const struct q6dsp_clk_desc q6dsp_clk_q6prm __maybe_unused = {
>> diff --git a/sound/soc/qcom/qdsp6/q6prm.c b/sound/soc/qcom/qdsp6/q6prm.c
>> index 04892fb44..7a7a1d3d5 100644
>> --- a/sound/soc/qcom/qdsp6/q6prm.c
>> +++ b/sound/soc/qcom/qdsp6/q6prm.c
>> @@ -31,10 +31,16 @@ struct q6prm {
>>   #define PARAM_ID_RSC_HW_CORE		0x08001032
>>   #define PARAM_ID_RSC_LPASS_CORE		0x0800102B
>>   #define PARAM_ID_RSC_AUDIO_HW_CLK	0x0800102C
>> +#define PARAM_ID_RSC_CPU_LPR		0x08001A6E
>> +
>> +#define LPR_CPU_SS_SLEEP_DISABLED	0x1
>>   
>>   struct prm_cmd_request_hw_core {
>>   	struct apm_module_param_data param_data;
>> -	uint32_t hw_clk_id;
>> +	union {
>> +		u32 hw_clk_id;
>> +		u32 lpr_state;
>> +	};
>>   } __packed;
>>   
>>   struct prm_cmd_request_rsc {
>> @@ -62,6 +68,7 @@ static int q6prm_set_hw_core_req(struct device *dev, uint32_t hw_block_id, bool
>>   	struct prm_cmd_request_hw_core *req;
>>   	gpr_device_t *gdev = prm->gdev;
>>   	uint32_t opcode, rsp_opcode;
>> +	bool lpr_req = (hw_block_id == Q6PRM_HW_LPR_VOTE);
>>   
>>   	if (enable) {
>>   		opcode = PRM_CMD_REQUEST_HW_RSC;
>> @@ -82,10 +89,13 @@ static int q6prm_set_hw_core_req(struct device *dev, uint32_t hw_block_id, bool
>>   
>>   	param_data->module_instance_id = GPR_PRM_MODULE_IID;
>>   	param_data->error_code = 0;
>> -	param_data->param_id = PARAM_ID_RSC_HW_CORE;
>> +	param_data->param_id = lpr_req ? PARAM_ID_RSC_CPU_LPR : PARAM_ID_RSC_HW_CORE;
>>   	param_data->param_size = sizeof(*req) - APM_MODULE_PARAM_DATA_SIZE;
>>   
>> -	req->hw_clk_id = hw_block_id;
>> +	if (lpr_req)
>> +		req->lpr_state = LPR_CPU_SS_SLEEP_DISABLED;
> this does not make sense, this should be set based on enable flag, here
> you are disabling the LPR for both enable and disable request.
Hi Srini,

The intent here is slightly different from a typical enable/disable 
state variable.
For PARAM_ID_RSC_CPU_LPR, the payload field (lpr_state) identifies the 
low-power
resource being controlled, and the DSP API defines a single valid value: 
LPR_CPU_SS_SLEEP_DISABLED(0x1).

The actual operation is encoded by the PRM command:
PRM_CMD_REQUEST_HW_RSC + LPR_CPU_SS_SLEEP_DISABLED  -  Requests the 
resource and prevents the subsystem from entering the corresponding 
low-power state.
PRM_CMD_RELEASE_HW_RSC + LPR_CPU_SS_SLEEP_DISABLED    - Releases the 
resource, allowing the subsystem to enter that low-power state again.

In other words, the payload does not represent the desired runtime state 
and is therefore not toggled based on the enable flag.
Instead, the request/release opcode determines whether the low-power 
state is being blocked or re-enabled, while lpr_state remains 
LPR_CPU_SS_SLEEP_DISABLED for both operations.

Hope this clarifies why the payload remains unchanged across request and 
release paths.

>
>
>> +	else
>> +		req->hw_clk_id = hw_block_id;
>>   
>>   	return q6prm_send_cmd_sync(prm, pkt, rsp_opcode);
>>   }
>> @@ -94,7 +104,6 @@ int q6prm_vote_lpass_core_hw(struct device *dev, uint32_t hw_block_id,
>>   			     const char *client_name, uint32_t *client_handle)
>>   {
>>   	return q6prm_set_hw_core_req(dev, hw_block_id, true);
>> -
> unnecessary change.
Agreed, the whitespace change is unrelated and will be dropped in the 
next revision.

Thanks,
Prasad

>
>>   }
>>   EXPORT_SYMBOL_GPL(q6prm_vote_lpass_core_hw);
>>   
>> diff --git a/sound/soc/qcom/qdsp6/q6prm.h b/sound/soc/qcom/qdsp6/q6prm.h
>> index a988a3208..bd5ee0c40 100644
>> --- a/sound/soc/qcom/qdsp6/q6prm.h
>> +++ b/sound/soc/qcom/qdsp6/q6prm.h
>> @@ -87,6 +87,7 @@
>>   #define Q6PRM_LPASS_CLK_ROOT_DEFAULT	0
>>   #define Q6PRM_HW_CORE_ID_LPASS		1
>>   #define Q6PRM_HW_CORE_ID_DCODEC		2
>> +#define Q6PRM_HW_LPR_VOTE		3
>>   
>>   int q6prm_set_lpass_clock(struct device *dev, int clk_id, int clk_attr,
>>   			  int clk_root, unsigned int freq);

