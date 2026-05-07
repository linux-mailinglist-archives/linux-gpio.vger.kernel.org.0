Return-Path: <linux-gpio+bounces-36405-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKBcH/jk/GmGVAAAu9opvQ
	(envelope-from <linux-gpio+bounces-36405-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 21:16:08 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5424EDD52
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 21:16:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EA3673017EE3
	for <lists+linux-gpio@lfdr.de>; Thu,  7 May 2026 19:15:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2651848122E;
	Thu,  7 May 2026 19:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YG/o8Lz6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AbMQD8pi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF48481AA3
	for <linux-gpio@vger.kernel.org>; Thu,  7 May 2026 19:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778181264; cv=none; b=hYlfDWm7aa3k46uHVwummIih67vdlCKP8960GPgJ/lI+EUI0+ifySotySqS0/qUHkJG17EaqU96FgcdGgRi1wboF3SV0vwAF7igKEDrpnAOwDo8Sx/Ba//lw0KKjagCq8rkcTHbPx7RRcKF/FxKWEjwulx4AOtgiaBmodXHjloA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778181264; c=relaxed/simple;
	bh=bn6KIAftZFAgu0Fj8bdAqw+sb5cS+6rxHQsH6/lo5tk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WB4pltoqRD7aYBjkuaFgNbmQxd/ewfxGxZk8t+gEXKuBpxAcqdFWrqff+kFHt6ByXyIzkjgCB6+IY2gx5DUbYs2l7zjrC4EaN2hVJHrX9OsxZm50f9xCixFrD5Lon3WmHdxD5DA8yZ5kyNxB161dfAcOvVNs39TwCSAAo9fuQtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YG/o8Lz6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AbMQD8pi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647G6JGo026471
	for <linux-gpio@vger.kernel.org>; Thu, 7 May 2026 19:14:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	krw9NYPIRjOwvAqsLEaC0tplCBFZCd1N8FeCy+nD22g=; b=YG/o8Lz6gC0410iD
	dtKh56KHWDhifpwwqMiE099T24CGq0lRxrjtkI5k+NLsUoRnmQiIVbzIv1/uYrlH
	XFYTnKSfKMRjh7sMwlyHRCTz3sp3bXAaQSTeykGPMwRPmkAUm9Du+EXmaMcvmf+C
	mDdeLpXm7ojmb+iN4qk26fxLCpuGypRpFAY4ved3m9MlnJkm0nZIUWxnaDHscS6m
	f5ld2/vQlbo9L0k19hK/xeoL5J3io7t7ELAE0yfZKD5cHsqHKszo3jtRv70IdDYQ
	nykRjbmGJc5f/dWZCHOjFWl39eRCzbCgXo4V+pBT/b5m4Ofz1jwXQAsDHWxJm6yx
	Nd69jw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0k1t3jqj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 07 May 2026 19:14:05 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3651991d0bcso2472084a91.0
        for <linux-gpio@vger.kernel.org>; Thu, 07 May 2026 12:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778181245; x=1778786045; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=krw9NYPIRjOwvAqsLEaC0tplCBFZCd1N8FeCy+nD22g=;
        b=AbMQD8pik6FhGN8KRrkJl3R4WV3AIwjv6SSpEmWAr93Io6O2pL3CzybnFBEmpgsq6e
         SZO1tkEhiSzxxSljlYj3PfxTsJQ+Or9XNTyvG6dvXi9n/4Z8AX5T27qkt36VTmO3b/it
         oOxytIOGOLaWsunLHc4OpZ6uP0vOklMSH4CwCVygqaO+wpfALHN0OOnliYR7wMBmp2vh
         6EQOv5OIkwaAx3XIgTlqgURV+nfBpf18nEz43PqBbMD06MAW8aet2bElT9m/eii0UXxf
         D+r5c62GUmPa+QA39XRF8bnvygFuISzBbUvL1xXB8L0r0f2oq4ZYny+uXt9HLzH+vpw1
         r47w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778181245; x=1778786045;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=krw9NYPIRjOwvAqsLEaC0tplCBFZCd1N8FeCy+nD22g=;
        b=q9Si8XGw9Dd2YGm0dZKpLi8+iwAkzsL9ELqi/3qzaX4ttEDHULSF3kr5MoUXvpm+Zs
         zwF1Vu840bsN+m9QHo84JxDUsqn4DsLLD3PdHawvfv9fhFHbi+ZfQw2VgfDcFGkR99iF
         2F9MFqLhhXbaRRwqs4EAwXbpcmsA7CUm3o/yUe+LixgxxRmBwdf6uowTkSCYIcnTtvii
         +WpYjoChWDy5SDFqwTWQE7onfZAgYQqEynfdL82tS41SgSVyTqrRvQ4vOtB8VGkSEVLH
         h7cvoDwwO6Q/ZAlVUx/fjEcnY+eZazwAY9O5+zZn67zXRwx8zavhgfkrlzBYX9Yg1I2l
         HPkw==
X-Forwarded-Encrypted: i=1; AFNElJ9veX1R+Yemh3wdqEpGe5AeEaS3gFPNLTpZYk2MFhTSIT+M8SX+WliT0z1gR3Z+0UnXLSBHknK6mS+Z@vger.kernel.org
X-Gm-Message-State: AOJu0Yyoh2gAQEeqGIDATIhX3iLLmmyTSZzg3umjcHHPEfZ8OO6R6cD2
	hGb23jqpzuRJQUF4SHKAn4eLruMFTtCDjpByBxHpYElUI77/rVgyGVpvyIZF96ilghq17V+TwSw
	FiRNzuUmp+C2csnFHMQlwEIvufh9NiisrcUJijJHbfv5yAYzmUq4CKNQvrQP4R0RN
X-Gm-Gg: Acq92OGo1KgkP8qUoblOP/B1i25ZiqU+Zgvj6ssRMKSzfkftoAAExVujeMLd8nK5ZV8
	nO/4kL0qFjrqWJh49b8heuz4FS4jmthIaao4oBdzSq2uDy/J4HjueKeHj1p/9ygcdy3qGTBS+b3
	uYrqSXtKh9DzQ7XP0VivNu8SfyhZBUWzmy+7KpoGmHB4diV1C/XjdnUuNa0T0fE94xkKeNkSBB5
	lowZovbsdk3wZHpS8Pli+eEXdT6UcVg8cj+STfQ4jLCSx4mA1jjHX05b2c2lE0ddkP6eY/rXVx+
	SR38rBDYCj3IfuuZxq+IzGDZcNZZ9iRbyQmtIhfTj2dQ+XJwiKgny9PNvLpqR385wscecdjj7jF
	yibt7z9BfiXwwKfMbQ3Tfm5M+/lAXaJ1VilW1lRtQIeik5Vn4Zl4=
X-Received: by 2002:a17:90a:1c88:b0:365:d9e2:7511 with SMTP id 98e67ed59e1d1-365d9e27b9emr4444019a91.25.1778181244750;
        Thu, 07 May 2026 12:14:04 -0700 (PDT)
X-Received: by 2002:a17:90a:1c88:b0:365:d9e2:7511 with SMTP id 98e67ed59e1d1-365d9e27b9emr4443990a91.25.1778181244281;
        Thu, 07 May 2026 12:14:04 -0700 (PDT)
Received: from [192.168.29.166] ([49.43.202.51])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-366478ddb86sm170288a91.14.2026.05.07.12.13.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 12:14:03 -0700 (PDT)
Message-ID: <4c6ad0ff-5b1f-4beb-8896-da325961f8e5@oss.qualcomm.com>
Date: Fri, 8 May 2026 00:43:57 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: Add Shikra pinctrl driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij
 <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org
References: <20260504-shikra-pinctrl-v2-0-14e9dcc2d685@oss.qualcomm.com>
 <20260504-shikra-pinctrl-v2-2-14e9dcc2d685@oss.qualcomm.com>
 <20260505-groovy-loyal-bee-0cf72a@quoll>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20260505-groovy-loyal-bee-0cf72a@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EoPiaycA c=1 sm=1 tr=0 ts=69fce47d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=GlSZ2Rd4KtbczYCFEJIQVA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=4uznfLdumDQ2-nrduUMA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: W0TSTYg4Vj4UxJkL-LsVyYXWR2Ijl5wF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE5MyBTYWx0ZWRfX9HfOQnMcO4DE
 8zF+fvgE4G1wNqgAECIAIt1CiRZiYwqQqLndiR7veOTUS5y0nT0qEAOgHHkp9AKCTI4SIafNaMU
 qxWkzrteOPPyzTB3DSYcQDmRcoIOydmfuXm0+9X4UdCEfNclEpw+4DG8AujScjqJMiWQZ4F1VPD
 BJjN7rPH3Szd2r3qTBf3sGJnBnnlF4Aw5QzW7YRnV+etRCXhPcPAlU9Hx1SGs1a6OnBpo/XoWQ4
 ruyNkazy0J7MzR+6SzAGKvs0jrhhaqvaLH2BRTAhoMV3kmOAWwRZO7Pd833+9dS2MfOgwFSxJUr
 ZQGyPDxfhi+tBO4DBzRtz39e2jxKv/QR2aEfSp41WYEF7aNPVFtc24MBwf0ZMB55I/f8TwriE2M
 r4L2FL1TfglioZZXuG9oPSoZUfqduipGKyjqrqTHR2PfG7NQit4o5gSqLDezbMLJecnvrk76I3s
 6QygGWUEc3LxL4qxt8Q==
X-Proofpoint-GUID: W0TSTYg4Vj4UxJkL-LsVyYXWR2Ijl5wF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070193
X-Rspamd-Queue-Id: 6A5424EDD52
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-36405-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 5/5/2026 2:54 PM, Krzysztof Kozlowski wrote:
> On Mon, May 04, 2026 at 04:18:43PM +0530, Komal Bajaj wrote:
>> +static void __exit shikra_tlmm_exit(void)
>> +{
>> +	platform_driver_unregister(&shikra_tlmm_driver);
>> +}
>> +module_exit(shikra_tlmm_exit);
>> +
>> +MODULE_DESCRIPTION("QTI Shikra TLMM driver");
>> +MODULE_LICENSE("GPL");
>> +MODULE_DEVICE_TABLE(of, shikra_tlmm_of_match);
> This is NEVER placed separately from the table.

Thanks for the suggestion. Will update it in next version.

Komal

>
>> -- 
>> 2.34.1
>>


