Return-Path: <linux-gpio+bounces-38090-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XmaRAM2qJmpsawIAu9opvQ
	(envelope-from <linux-gpio+bounces-38090-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 13:43:09 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FDE655CD4
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 13:43:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=I8K6eQUg;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=POXECiVE;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38090-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38090-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9A712303DD77
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jun 2026 11:31:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FDD3369990;
	Mon,  8 Jun 2026 11:31:35 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1A2366566
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 11:31:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780918295; cv=none; b=owUNZQUXJ5QjV4er6aXvExDYMqfe8YUkI7+XyLTeYPN5jWYx7v4KSLhboqGehDEZfbAU8Qk58yq95SC7DzvcDiOjrsvZuA1HPyyz6laK/2kpQkg06SpfALXjKcdzTUqoT0Iwhcy4BzJ915rKyTwUh2SRc2mP3wjFIJ1vRkagfIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780918295; c=relaxed/simple;
	bh=rD4WUl8Tw2dxSZ26CPIJak0rjmDn5VzPQcXVvyW/3po=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MVD1SgRudrDlze5m26yq21Zg6JUtRG/w+XxkdYMgwOsieHuYeOsLCQ2G3rXzk6RRGfnQTbRTd/8O35vIQxIT1DSjy+nFJBuPerKbByxXCqI7HehCZ63Edg606Lqe8XBH1q3h8t0RM2D6ZUkpbhxUpZMJZFn3PdSakYDtTIxqdfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I8K6eQUg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=POXECiVE; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658BBmsp3454697
	for <linux-gpio@vger.kernel.org>; Mon, 8 Jun 2026 11:31:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K4C4mnAl/QOpNfK6SglLqnWluPwGKCGjBTeeDnIrnfw=; b=I8K6eQUgDmlHQOOm
	zGLmuXJmwzcvGaheXF5WgHRf+gpazn+U9kCXBgRyQ0bB4mgX0CZSN83czl7f8lQG
	DiHGoeCCDDYVtDFSdwjYksqTGd6Ge+P0lGzUgpdkc20+tqv9QrdWyo8+amUdYTRe
	ykJOaNGGwwBwjkCbTj++iNxKgNrk2txnM0A3Zro7sMCHYFW3SdpZi5++TOvGr77k
	RNfYaO4mM+WuUwrVPYoEyn+/cRhsndFqDN4pLIGYgRlrbDNyBRxSYmuIVnbcoTpx
	K6sKu1H0hiUDYJ1fRCB4gI15n+HijeoW+12iLJ/WUWUh5veLOjTgvBZhNWY1zHJG
	HYGwbA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4entr0gmw4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 08 Jun 2026 11:31:32 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6c4271166f3so168418137.0
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jun 2026 04:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780918292; x=1781523092; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K4C4mnAl/QOpNfK6SglLqnWluPwGKCGjBTeeDnIrnfw=;
        b=POXECiVEG/FYXzGQFWJYA86K+OMafj4dZsdXhc2IowwwayQdqA9pS1ueBw6z1eUOVU
         wrTbLGBkw/+wdJM89NiDV4k/jUVxehczCO5Og91WyWjrToX0TM6+0Vj+GvJrMf+FsF+4
         gtJdXCQJ6zbFRsvPvCDgHio3f6CJdzVtw6gTX8a3XD830AzKhoLXQYSib1ZN9HfnJdac
         ZGJLkah0SZQd53tqDyAAFQ5uwRR0r24g8XuOydABTFqlTlZNwsycwwZlhio8nhVxR4mx
         QwJvf2Rgnc9ZIqpWRd1zpuwJphdAp9WA7N8w65kLr7JA/Lh5jAFF4lIsvn67BUmtcTmQ
         WO+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780918292; x=1781523092;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K4C4mnAl/QOpNfK6SglLqnWluPwGKCGjBTeeDnIrnfw=;
        b=LNrz64Z3LAEJTbyi4Ir9DwRntrrW7ywuvQq95RLEFBHZxivpvTFCKvTVJyE9d939ak
         oljPwzDQeAyI3Wq52QkVCy+MzCRN2waATDYDqpi1favKOjOLWB1+fUNP0vyqz9Sk8XiD
         HsUYHsNPnmupnmYal5EqEFOwwQ2Sk2wwqWQYtabeJgQfhuJeG4fNnGZtgJIBclE/dGaP
         ZseYtATNMByhIdoq5HuvpDUesRm+r93oMxakFwuw0lPB3lDA3jR/ac/bG86UtDRWlSj6
         Hlm3MuYv6v2fwpa30D3gbx2CZhNyBIGdT0imqaAb1Oxd2fTqYvrROHnK+aU9KocD+YLK
         Ekkw==
X-Forwarded-Encrypted: i=1; AFNElJ9SlzhEJ/6gn7dZnznbHpQwOfh0sgL2pS3AYHtHHqyu4Qs/+LpSntzPw3dYRFT8DNT2a5emdwKBtfBY@vger.kernel.org
X-Gm-Message-State: AOJu0YzOcKJzI2qckOEea8Og19c5GhqDqcx49FzIjxv8gg6I/Qa3axSR
	nHLItRDIhNS5kqM6l/ESXOTqSKtNOHePW9bMBjjg4wG5lIuBwZYD95QDDt/PbfaMyGvwz9BbyCk
	CMdOlMoGd2o7l1+Wqd8BVd+s6qnBNdrqGk5JmgUu88f9FlIKNSQzgtxdhlD5aUx9J
X-Gm-Gg: Acq92OESCr8KURrAZ3WviRF7/uEFcGkKYC0+dMj4WmQLMLdkGLBjPEjbpNEwpdgC6Go
	IlRkH/BfK3VhoM9Q5WyKGkM5aPZ99vyZZTNtOLjrmimCSQ5OkW8tAHvMhwIVrbYQmFfSFguXF3v
	plLwWrfNx3AaVR7eTe5LDE7RH7ws9ewQSNCmNYqte927LhDABeCMj7pHVeKOHnNvFD+jYjrl4le
	AYo7+/xBjtz9u9c2+IuUBUa2j6n7o11fjoBrMw5FllysV16fHlH5x5u4D+cQj8/WjvPqHxtckVc
	9vuu8mbVY/S49lu86+5biXcZuwZ6JtquW08dlopL4mZiGLI90ftKgIPFTHf0QTSZPcJBX08mG6m
	vHrn1/g2xRFbyROs7cpnFJOZclwvh2M6z/mJqzo9jkza1BfZBmqkNI1aD
X-Received: by 2002:a05:6102:2923:b0:634:8685:d331 with SMTP id ada2fe7eead31-6fefce7da37mr1999902137.6.1780918292177;
        Mon, 08 Jun 2026 04:31:32 -0700 (PDT)
X-Received: by 2002:a05:6102:2923:b0:634:8685:d331 with SMTP id ada2fe7eead31-6fefce7da37mr1999890137.6.1780918291704;
        Mon, 08 Jun 2026 04:31:31 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-691afe82416sm1611489a12.13.2026.06.08.04.31.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 04:31:30 -0700 (PDT)
Message-ID: <109ad54c-f17f-49ea-9d7f-54e13dd367da@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 13:31:29 +0200
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEwOCBTYWx0ZWRfX32gWYr4kG8Yd
 nV7bZgfl1K7J0i6HUsgbQ7DWNatMWkFKbfVZWWVOrEMRVXPnPEIVG48mgfouj4JY0m4xCcQEDEI
 gkGeJedvx/KMliZYEe87c/1B6cOig62WrSN4l4QgygyjkIbG87womYo/6FOCkKw9tZZ6P+bAWf9
 Du95+nBMO412516LS2HrrSji50CUXrtbcsJBH3Y12Zz55uXkDzha35P0MBaXJzEGhH+LC1/LNB0
 hh5UdzAD1AX0AhFPJOpy5TIHI97D75o1baqRt1F8W3KYCmnV0RNmfRXT6q8WFKUR1uM0DONO3pb
 Oxyq97i/t6+cIZXpOtD3HQAQ89UPsb+rp7gp/AlEHFa4f9cVS+b3lxbDjdK5JTCJrytMQaTdasS
 7Vg0/42OGrKN6DzisBMDcrlJRL1WAzslRb0GgiNVgjaHs5P9xTlMUfwRVkn/nirMVqd7euwgW8S
 5uFBcA5cf4kvRl+zUFg==
X-Proofpoint-ORIG-GUID: UUwXOwlelG1pIeGUBPemahpaVkXeJK7G
X-Proofpoint-GUID: UUwXOwlelG1pIeGUBPemahpaVkXeJK7G
X-Authority-Analysis: v=2.4 cv=VowTxe2n c=1 sm=1 tr=0 ts=6a26a814 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=I_GUxYuSRt8l7ccQOTUA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080108
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38090-lists,linux-gpio=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:akoskovich@pm.me,m:andersson@kernel.org,m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 53FDE655CD4

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

I was reassured that my source has the latest information

For reference, does your reference doc have any 80-xxxx-xx-like number?

Konrad

