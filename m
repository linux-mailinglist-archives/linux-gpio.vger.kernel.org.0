Return-Path: <linux-gpio+bounces-33346-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YOZxEBb6s2nWeQAAu9opvQ
	(envelope-from <linux-gpio+bounces-33346-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 12:50:46 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2542827AA
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 12:50:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8A667322CAB3
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 11:49:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1994138837E;
	Fri, 13 Mar 2026 11:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g9o9HVig";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C2cVIcE4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F49D366575
	for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 11:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773402569; cv=none; b=fY/y6y7WSijiopzOIUxqy9pjOHLxTxSDdjJd3V64+1++hlPQjWFu84MsS4G3VClxhbcr7NQxXD0QVqlYfb3WCUBrNeH5L7O6wP0ZLasX4KunJaCWPRkaxK+rTwQ5/BTPQukLbnp3Pr1xVStoz0aY+bNnYv6NjELo5dFjfcwl8gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773402569; c=relaxed/simple;
	bh=sZZUUaLeQ4v1ZopvGzFNNVcPexUQKf94vjgCIozk+Os=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VpbbdfUk/8H764REPpnCLpK4ZoiDAsBSWTiVpT/uYr4Jk5Zse9DQlR7mq96JSvMnyvmi9rT2Wcf1dAV+bLUsKefSy/skfv9MAKNUKX8l1L46LIYUMBw+MvpxggLQ00qx2jPYt0r114g2KGEJiev04kVl+4I6Hm//aBPkqbNhNy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g9o9HVig; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C2cVIcE4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D9B4rW3906296
	for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 11:49:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lPH4ExXk6F+X6p3nI+qiTA/Ls4lIhf6gx//Vkpe7pzM=; b=g9o9HVig4ffaDHOB
	jGTh61lFgJTDEjfWbFQXBgimrx+Mjfhz2DcjOgU67Bl7/E/I0aOrXsRbDMZGABSs
	rPZaigzI/vYCdZHVACawtE85gG3yc+zgFod4BCR4AjYSqzuqA8qykq8Qp2ryPAbN
	20rHxUawno6VZBO7wrl7YyqNUp17JyxJw7zdN/Ve8768sNa3MmxH7zbPRZoJLbBq
	Kr7ASKvS0OVZ8iVAXEelfQPUtqghi76VvJISo0cVQC2r1LAHXVp+XRuCWEaEWjVu
	vxwfNT0wAuc6o25sTnA1X8rf0yPCpn+wRO1dLAWQDtE3Z9/xoDlgDfOqmydpmdJB
	57Vf3g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvfqs8g98-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 11:49:27 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd8198fe16so131990385a.2
        for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 04:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773402567; x=1774007367; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lPH4ExXk6F+X6p3nI+qiTA/Ls4lIhf6gx//Vkpe7pzM=;
        b=C2cVIcE46CvjIB968TAMStjXLmn6iWrMRw8K+nleDGgSYLMfWJk4uLUUKJr6yFLkLD
         yMax+E+9KICr6kRyos8FWBqchv0ZgbO5NO+Omw0jfhqtcSV4+CsS1zgQxc3RCkKAKHgG
         PPhytlS6ugh2qltuSzCNSlSHQjHuVCcQrWy6/XW2COQQ3ooMozjkhN7FBENZux1S4IfZ
         hcgZWQWMZBNuYsR+4MKP928FbAlTG6kus1QgTlr3KwIkVlL4KGJQnoFTPJz0YBfor3cj
         lr5m2K9Htuy5ZwqSzc+STx5Du2imiJAb6xtO9bK+Uao8g9+HEkUHzu7SD1a+JUmHDvME
         NpBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773402567; x=1774007367;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lPH4ExXk6F+X6p3nI+qiTA/Ls4lIhf6gx//Vkpe7pzM=;
        b=kutIjhNhf0hMZJAvySxHZQQpt6gXuXtD9w3+mOnTLxn+xplrX7YnCSEBgZuQfFZ7bP
         RnY7H1zxuKjprnqcLFWH4NcJm1d0l5uAnStNwaReGsTBwHnViCe0Enoa53/6bWsKyvEh
         phYmHyD9c7dfb8mS/+qQNrVUVZzY4zR+9NpMx/24gj4sQf6I1Kf1lOKwdMHrHQ80SsS0
         E82fbDmp/Wgx3fLK+yJU3fqSsr+URLXGgitvxoHRrKB3F7Pji495rNHZWBr3h48BOdHf
         PbXVhp4AHFIbFCoU8ImJgzQ3E2sYNoCYR+brvJdQSHkDrhnrpiCLI40aqfSoKBMw9usQ
         GwXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyqKc+eFiDdmk+KRovpUT354ZWurONE/8bG7Yn1Re4AGaxT+1YQY6/RhMB65OLNPWgoFw2yqsrewAY@vger.kernel.org
X-Gm-Message-State: AOJu0Yywxfdxq26ZShrqjvbCVZ4yIww6lUxVFu2A6uhRAcIng5CGDKvn
	merayUFELtahcbLSJOHIzutShi+HDgyZYbFSc9V9/y2mlP/gPifMOrD7SoCZ74tTss2DKIetwjC
	FJNDk5M7cqAImqus93X6UUcv4kUgPU7V6PCM+s+N1ruPSWGuvxRe016gvUBz+bEqK
X-Gm-Gg: ATEYQzwFZDhSzrUNaIwJ/YrMgzrsyfspGEevc+gFcmUTSQPT3ZZZoRSFJineKSEbOnB
	M/+R/htLxEGVxO9wVy9wgR+zUN6vAwpSzzASZ5DdL0/ji1I93ylWNF4WITJlN2hlQMIHW6t6ODa
	CVIDZBePsFznmWegpSaQDlpTP5bqcmmcUXZgM5TBjO0QYFviiAWT605097mtnCiJSyiUOTp3TWc
	nrDCS92za6M1J2svgGu8um5k+I6/qIz2v8j6DZu1u9T7IB1dsSBIp8EKDO7NrTXeO5XKsiVXfjw
	YwqcYRVT6umEgbEvB55e6IsKm3MCiMXkTzTEq9je6UljPsSJfHIhME3aGiWb6nXG84uZRx8kFsz
	9s7IK37CL0xuavx/h2FbNtPPTKMbhuVRS0uAHu4BEFiY1z9jMe5ETbpQDzTrso+jkSV7/JEpu4S
	HKTmE=
X-Received: by 2002:a05:620a:4625:b0:8cd:b2ce:b746 with SMTP id af79cd13be357-8cdb5a1caa9mr297026385a.1.1773402566961;
        Fri, 13 Mar 2026 04:49:26 -0700 (PDT)
X-Received: by 2002:a05:620a:4625:b0:8cd:b2ce:b746 with SMTP id af79cd13be357-8cdb5a1caa9mr297023485a.1.1773402566495;
        Fri, 13 Mar 2026 04:49:26 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976d08e6a0sm39218666b.61.2026.03.13.04.49.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 04:49:25 -0700 (PDT)
Message-ID: <0df69fd0-92f0-4daa-af15-56163b812741@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 12:49:22 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] irqchip/qcom-pdc: Configure PDC to pass through mode
To: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Johan Hovold <johan@kernel.org>
References: <20260312-hamoa_pdc-v1-0-760c8593ce50@oss.qualcomm.com>
 <20260312-hamoa_pdc-v1-3-760c8593ce50@oss.qualcomm.com>
 <eizcoxjnjgbobjwndnq7gewqnynnm2o2aqhh4muposgnhhagaf@tnomg2p4uj27>
 <771a8f63-90d1-45b5-960e-342d9041fc4d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <771a8f63-90d1-45b5-960e-342d9041fc4d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: k01jCvP0ObhL6LWgerFRPV6pLPIMSTcm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA5MyBTYWx0ZWRfXzmmfhEFlcw51
 aZBu2Sql8dJOdUbOCPfHJyzax+XZByIkk5nLkH4GLp/NuU+RdY00lxVprwYFI3P2mRvX/LDezG7
 TjmSQ3cm0CHaBHYP4+7+0O8klwI3vXR2j3Z5zadO60aqEq7GVoKkeTuNp6dNXi1edhsVYchpgrG
 th/hakgj21Il7yl3WO4/IRryWPMP92YipqeQpAd9RSOq1/ta3QY9+tUsJ0cNvHEURYemSWzZDke
 pWubypAAzXVdahHfU046dnhiqDCidO5VIHna/5QBc0ru/zGeGWs6C9M+JYtWrqENbX5FZI41YgV
 YhlpVshRfsJnCUtDKX4XA5OFm6U9rRt3WyobMXErYJ/g2aKJbA+hfuSPjBHth/6+EScBKshW3Oo
 kiut4KQ2f2HZNbYHQCPZSxqoX/93lezVtzrGVUHZbv2AeyGwszYxJLmVoW3fnbEsKbFIDtpq8cw
 IVkhNLDV0Yv3ApCaMYA==
X-Proofpoint-GUID: k01jCvP0ObhL6LWgerFRPV6pLPIMSTcm
X-Authority-Analysis: v=2.4 cv=GoNPO01C c=1 sm=1 tr=0 ts=69b3f9c7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=bDJMtZGroyP0dw3QX1AA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130093
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-33346-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9A2542827AA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/13/26 7:40 AM, Maulik Shah (mkshah) wrote:
> 
> 
> On 3/13/2026 7:52 AM, Dmitry Baryshkov wrote:
>> On Thu, Mar 12, 2026 at 09:26:37PM +0530, Maulik Shah wrote:

[...]

>>> All the SoCs so far default uses pass through mode with the exception of
>>
>> Is it something that must be configured by the bootloaders?
> 
> yes, currently changing the the mode can be done from secure world either at boot
> or after boot via scm write.

..which won't work on almost any X1E devices, except CRD and IOT..

>>> x1e. x1e PDC may be set to secondary controller mode for builds on CRD
>>> boards whereas it may be set to pass through mode for IoT-EVK.
>>>
>>> There is no way to read which current mode it is set to and make PDC work
>>> in respective mode as the read access is not opened up for non secure
>>> world. There is though write access opened up via SCM write API to set the
>>> mode.
>>
>> What are going to loose? The ability to latch the wakeup sources on the
>> CRD?
> 
> CXPC (SoC level low power mode) would be lost if the device can not wake up from GPIO wakeup sources.

To the best of my understanding, that's only because your approach chooses
to ignore supporting the secondary controller mode and force-reconfigure,
since GPIO wakeup functionality is otherwise available regardless of the
mode.

>>> Configure PDC mode to pass through mode for all x1e based boards via SCM
>>> write.
>>
>> Would it make sense to always use the secondary mode instead?
> 
> No, it would not make sense to support the secondary mode in Linux.

Why?

[...]

>>> +		 *	- Inform TLMM to monitor GPIO IRQs (same as MPM)
>>> +		 *	- Prevent SoC low power mode (CxPC) as PDC is not
>>> +		 *	  monitoring GPIO IRQs which may be needed to wake
>>> +		 *	  the SoC from low power mode.
>>
>> This doesn't quite match the description of "latches the GPIO IRQs".
> 
> It does, PDC would continue to still latch the GPIO IRQs (as the mode change failed)
> but PDC won't forward them to parent GIC as they are masked at PDC with __pdc_mask_intr().

Can you not refrain from masking them then, and clear them upon reception,
with a write to IRQ_i_CFG[IRQ_STATUS]?

The HPG states that this mechanism is only engaged for GPIO IRQs and that
the forwarded interrupt will be of LEVEL_HIGH type (which is what TLMM
accepts anyway)

FWIW, some related work:
c7984dc0a2b9 ("pinctrl: qcom: Add test case for TLMM interrupt handling")

Konrad

