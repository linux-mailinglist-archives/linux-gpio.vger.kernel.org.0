Return-Path: <linux-gpio+bounces-36335-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6HJ5CHQQ/GlYKwAAu9opvQ
	(envelope-from <linux-gpio+bounces-36335-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 06:09:24 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B81714E2CAA
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 06:09:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E92603022605
	for <lists+linux-gpio@lfdr.de>; Thu,  7 May 2026 04:09:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3008631CA4E;
	Thu,  7 May 2026 04:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NKiR+Hwz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NS+xtHTt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E9C31E849
	for <linux-gpio@vger.kernel.org>; Thu,  7 May 2026 04:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778126955; cv=none; b=jS2XFoW20usSVvMMJxwGqaDlpDiSNidvoIK8FOvk9o1MhElaQvrrEuZC8Hudu4kDdcKvDKNz2qIFOIf8oMV/UMRYdJnjMpBrlVeRtHUztqJvwwLCHX5VHjNQx+Z46aJZibgCsi1NmMQGcMHFOL5BcuIwlX3crqnMkJYFriIkEGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778126955; c=relaxed/simple;
	bh=WtUC1agCPDh8q1OptnVFSZ0gqakui8D6ahrqHsh7bgE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qjWwCZEfi0Y3GTgryTTqGslYsnfO/AMShhvG1RQ5mQGX+gSFrY/GalpMRtqreE7vuJYD5V8c7GHJwhVyZsS/cTDOK+PS/gLD5yGHQJRRNRwyHfD8/Eufoo4Qjpviy0L/JoxTlLZBSQx/L24/Llz0yAlk3rXML07AW7h0o8pCwI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NKiR+Hwz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NS+xtHTt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6473eYXP026544
	for <linux-gpio@vger.kernel.org>; Thu, 7 May 2026 04:09:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WtUC1agCPDh8q1OptnVFSZ0gqakui8D6ahrqHsh7bgE=; b=NKiR+Hwz8aKEPHp7
	AptYX0puDPEhB3byWywfEZausfD2zBMbOP3JHCweT9/MPM34srzc9W8Pn/+8OGvS
	Z1QL8Ol+jT/Y/6QUvbOjqEYI2+I+ZHMEzB7UrTE5soHOiCVyDDCBAXGny1hHkySh
	zrfM8xy855ZktFYZHArnofd7o5nnXQLyJJYQnT46wQwnPXeHMgIUSSiDH2tgyr3T
	E7Eguvxq2LbdOzoNxnImvFd+xKb0w7Fwtr9KVPpB9tSkGfjtGBMVJtohDblmKEoZ
	z02Qk8j2o3kpvd/4dzMxUOvwXwRn2aFdpalvqn5vR26DTmJUWyEeBR2Qey3LHROR
	5DfjFg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0k1t027k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 07 May 2026 04:09:11 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-366122e01fcso130854a91.2
        for <linux-gpio@vger.kernel.org>; Wed, 06 May 2026 21:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778126951; x=1778731751; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WtUC1agCPDh8q1OptnVFSZ0gqakui8D6ahrqHsh7bgE=;
        b=NS+xtHTtvJun8P4dsXgrkEH61E9LKPSIQmlp+4aBMjfn+WG+q9jVoIp3ylibUQlD+4
         yQ495Zo+hbNZ+glFI6z1+tsc0m13hiNfixiYBCYZcM5P6n/LpWZtFiQA3kF5V4wF21/X
         N31W7AZSaX9JQZt8gyJrpWfuCARPUX6ZoZvK4V99bUvZbsDPMkjE2JQ/LQAs6LgwXjhb
         VFu4D/6I4BpHuNUtn7eAfy+jCzBpHxTFtt7zIEWRvkjNLH1ehzM7Oo10xqTjW5daDUHR
         nLVXnK6ZNXbhp+TnYZnmvV8iLBO5ek7XyP1dW+OBAPcW+DQl/bWAs0HyqhlDKj0NxqwB
         cxjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778126951; x=1778731751;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WtUC1agCPDh8q1OptnVFSZ0gqakui8D6ahrqHsh7bgE=;
        b=PwP5MsIcM/p+xKhs3ZIcVlaWpShlcNuPpDYJYTVapo+6kohXc01eWsdQ1u46APw1Ni
         a/rptgJUt9p+PfC+cwaMVT21n+Op1LiThjv3DBXdgFvMYAIaEg7VBN3HbAzGtWfgE88J
         /kJH04IuwdJthvnuuxh/yoycmweXu+i+ds/4zk8WS5l0KQFiHCEKOti7TA0CvOb7Fh1u
         6Ndl7S0SDSqphY9p1sJvzy3rlBUiSnTaxoyMlg0JdhjxjYJxuCjXSWx0X1vHKSpsGQHA
         9TkI2SnBIrcPQETwdD4h2xIgJuMDfoZOOqPiKJ8EqGNpigYDmRB1WWK46JOrYhwUDTXG
         xi2g==
X-Forwarded-Encrypted: i=1; AFNElJ938h0ECTLRaYMXsInE/LtqymE0LyjPHIgEeMoFK5ZFx/qvYaMMWOI0jHExqwDi6qTCHG7ppRVTtw/j@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+EEVGC6rrC3AzfmChurPfUVP6OP3BeVm6dy9k5FBe4BDZnQ6w
	TbJ0qS3YCJNSy3dATz5P65O4WNvct6t5AhfTJ4vGnttUG+TwxzlF36g2IuS2ksqD+5ODoz6jOf1
	LWLIkFet+ZnirgUM7o9uJ/JQMIDm8HoOQEeWwqvGy9jvxkBnLIMHH7ZrPsAvCrhFR
X-Gm-Gg: AeBDieuW4LHIMohdqtFh6PtfW0v8ErkSJl8FmHMJ5IMi5jIdGWKNOJ0RJ4+FkJ/u08E
	axfzO1EUSVtjI6FpCp7P51zktPVl72VeNPPG9hBXYL8dRwHqfyu7Wsj339L3FB4Ji9bIeWODSiJ
	EumCUFWH69+s2WAI38H1xPgwWrWTKUHkp0LUsEwgK7Fcp8q+79gi5ox5R8oAMhJ9V67lvYrQ95N
	QAO6RIQcAQAP9/O4tC1eE11qGKKvRcQ6qHYR08Q6wp3IeC8LzvEfrbFSduByNlK5XgK9V6R4Tut
	XLI+GJqP7lygmapxFC7zUAG9nF/QhknGmJSFfpxIMytesf0eA+Ot2BS3z+z2/k6Dk+SyqQq4R3W
	dHn55dcHC8scSQJjE7lXegiP5FiFZbv+hoe3Y6pXW6FQBgaBF2s73I0q8nLBm
X-Received: by 2002:a17:90b:134d:b0:33b:b078:d6d3 with SMTP id 98e67ed59e1d1-365ac7757cemr6881538a91.23.1778126950761;
        Wed, 06 May 2026 21:09:10 -0700 (PDT)
X-Received: by 2002:a17:90b:134d:b0:33b:b078:d6d3 with SMTP id 98e67ed59e1d1-365ac7757cemr6881514a91.23.1778126950094;
        Wed, 06 May 2026 21:09:10 -0700 (PDT)
Received: from [10.218.34.110] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2babadef249sm8030845ad.59.2026.05.06.21.09.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 21:09:09 -0700 (PDT)
Message-ID: <4809a7f7-8ec1-4f72-9154-8ca01111f4a5@oss.qualcomm.com>
Date: Thu, 7 May 2026 09:39:04 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: qcom: Unconditionally mark gpio as wakeup enable
To: Linus Walleij <linusw@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20260430-enable_wakeup_capable_gpios-v1-1-5de39bf06094@oss.qualcomm.com>
 <CAD++jLnX5J+GncH1U6zE40eErQ1LeNiPmQqZe5UewR3S4VhBOw@mail.gmail.com>
Content-Language: en-US
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
In-Reply-To: <CAD++jLnX5J+GncH1U6zE40eErQ1LeNiPmQqZe5UewR3S4VhBOw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=EoPiaycA c=1 sm=1 tr=0 ts=69fc1067 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=_3-bX4vkxkCJ1edF7K4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: 2ttpSKd41wsmjYH1NviEbkpR-Sygilnm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDAzNyBTYWx0ZWRfXyoGN4MJ//GNj
 IAF7RCeglJMLm0r9VmoBaRev2odgIHUdLWkIdXb1q1QmqA7X+/ojzndSi2f/c3bSGI+aN9eJCqe
 SNdYwds5L6lmqHYpju1NZPO9yKWmTxv+QeqGOgb/DVB5+bUh0dv37IluQ1UPuEX+Pg3FZkU+UEa
 yvoSGrM5iTFfqikiPGusmKYJv1uo7NsCP0aBmNeHh6mOHv56dsULIm0WVy8vrYkMpz++d7hXfpF
 vMm7sAt7kATHOod2O0fwC0bGeKuGDyqG8duyxpoc0Jsosfgwv0iBilSs0Ow7YHOjeLtsfaDos07
 ZknHDXjksijsGZyvW+fxwjTUPfgWRGyn+BydyDLl9FJa/sT+d4JW6t69v38Rjb5uEULqJTY980c
 9sJKZMjLOWHyYwyNil2+OTLR+mXcwqlXLX2eRrGD9KslIwBNSQT+9wWxmrEqlvtHtAWFgPEwJPH
 6IoMo6srmpHJoBILvUQ==
X-Proofpoint-GUID: 2ttpSKd41wsmjYH1NviEbkpR-Sygilnm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070037
X-Rspamd-Queue-Id: B81714E2CAA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36335-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_NEQ_ENVFROM(0.00)[sneh.mankad@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 05-May-26 3:58 PM, Linus Walleij wrote:

> On Thu, Apr 30, 2026 at 7:54 AM Sneh Mankad
> <sneh.mankad@oss.qualcomm.com> wrote:
>
>> The wakeup enable bit needs to be set irrespective of the SoC using PDC or
>> MPM as wakeup capable irqchip to allow the GPIO interrupts to be forwarded
>> to parent irqchip.
>>
>> This is set only for PDC irqchip using additional check skip_wake_irqs
>> making it impossible for MPM irqchip to detect the GPIO interrupt during
>> SoC low power mode since for MPM irqchip the skip_wake_irqs is always
>> false.
>>
>> Remove skip_wake_irqs condition when setting wakeup enable bit to allow
>> forwarding GPIO interrupts for SoCs using MPM irqchip too.
>>
>> Fixes: 76b446f5b86e ("pinctrl: qcom: handle intr_target_reg wakeup_present/enable bits")
>> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> Good work here, also super-dangerous so if some more Qualcomm
> engineers could pitch in on this patch it'd be great.
>
> Is this an urgent (-rc) or nonurgent (next) fix?
>
> Yours,
> Linus Walleij

Its fine if it gets picked in the next release.

Thanks

Sneh


