Return-Path: <linux-gpio+bounces-33456-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gL0bM7rGt2kRVQEAu9opvQ
	(envelope-from <linux-gpio+bounces-33456-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 10:00:42 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 38717296934
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 10:00:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A8760304A6DE
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 08:58:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7C9E382F39;
	Mon, 16 Mar 2026 08:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CEX2PrQp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RHQmr/Mr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67DAB382F0C
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 08:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773651493; cv=none; b=LapqG4fQMAk4MNt4Oi4Q7BBrL1PjJckbrzHglsGT6UmehsqMSdfkO7p3nyuzleB/HwGu0me2n1D6C49HsnJVsekcB806b4KDVL6tYKblVlajZbrqnS/GUL0mFpHZNsJ2Iga83BuIf7lCrRqHDSE37Pd/me26wcjcM3f1ibZfdV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773651493; c=relaxed/simple;
	bh=WYEOtTpKJKbVcM32oVrlyRCNjAkwiCmSqVpChK7R73M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ts2giU6b4nYh5bnDX0CvZOio/GkDLYqxG6iZ6eKvMu3w9HsguP7uIVCCoIpxO5RT69oBMr/ppnixeiREL5eFUNmUlt8f3jD3zCq8ELpFDXPaxJUuk13aQqb+n5+iwh+NcoGm6jRSUeQBQOpNtjWtSxfcz//2dflWGGNaMB5TS8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CEX2PrQp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RHQmr/Mr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64eGZ1282091
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 08:58:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5Ew5aCzTfbJfZsbqot4EZ7SeBCdkQpT3b6lAtmV991M=; b=CEX2PrQpnsH0GmTT
	DPYwpfXotdf94WuXr9weW7ykDEqYV97/z+IN3jWGhHEZR9N4DZ6k8OSNTXAdxoUj
	ywFNYavlXfakz4FrdBYdZ2CAPJ4kUJ8YkhWyjs6daN/X1Zrz5AwQBg6T8sOPBxrE
	nc8LoM+mJfR1ev0p5Y8adF6y8MiktWyTcSdYVNz8dYysV5l9gLfrCMuDTv/y5ill
	srIEd21eUoaLFWseoqAJNS95KadaEe0T2xdsgta1y7TZJBqx5vbD1kv2gp6bRb50
	oIZ7rUuFnrHDLCpQqFgURkVsiYtnpL60awQ2jzqunzj5dLcMKvo6U6NqMD7LP38+
	/ZgjUA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvyyc4tsb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 08:58:10 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ae4b96c259so62278895ad.1
        for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 01:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773651490; x=1774256290; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5Ew5aCzTfbJfZsbqot4EZ7SeBCdkQpT3b6lAtmV991M=;
        b=RHQmr/MrGkwHQ+Wd2ciVJw1x3Zg80YcSRpq8o7V4iFz+oOZoEKqlFL3b/URvzO9syo
         3kAUnEvk0CW4n6WPiaxfkdZMu8H06tLpnW7FvSJofMjepfPXlyrpMF0FYG1Yxxn0IU62
         Q45sHHytRBJORC2A1Bn/G6h70rgg46EGX10lQsCQJB8LgW7Oz4XT0178Eto0IiiJdkJT
         fy0ABapIO2ST5qJl9+Cp/kNYuN113oXdA62rxntvIl3dUMAA5uJYP4skJAo+9oA8VLCc
         t8LmBVo4B+NRMKrJ0hyh9Amt5lLHryoz7JDazu66uk56Fv/YWxmYQFyMUIL6pjwRmnTB
         vzjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773651490; x=1774256290;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Ew5aCzTfbJfZsbqot4EZ7SeBCdkQpT3b6lAtmV991M=;
        b=SKym3Vi+ApOhK9F9TtedSlE0OCdW2ZvS4+h+S+VZUUCVp4GiXOq/XDHPBCJJnkIicy
         QYq0mkh+PYX87ob03BUjPawUvUJwjrvgkNBXGr9FXoBacYS88Z6/wi06gt8wn3FXE8Lb
         mvYwex7ATALZ854zaXsD9OJhjwGeODzr2ABSDI9nNzLfmf7caxHnz6t0GMq2b7S+IEwg
         8PCcrtWQ2mNvn59ole9L0W+KtoWNjRmcW8MGuUjbt0I5nUIKuyOhFak72W41SlM5MYYY
         Ae+wxL626Ml94Su5C45vfpG4do/hT+rHPFU+bLY0ofK2DhFI7WMOG8DIPMxY4SAEEsYc
         +1Hw==
X-Forwarded-Encrypted: i=1; AJvYcCWfRO9I2qtNGbV/CDdK9OXC2xSHrCM5Hu65ffqPka6M4qX+7QbIU9V+MgzHEVFiix1uNEVoW3/LEWej@vger.kernel.org
X-Gm-Message-State: AOJu0YyGbpddBNPT2LwFCmjJkBBMNZ8BCZM6ijyhZLWCt0hoREtld+8G
	UOtpCnTOC1kGsLI3xnArNkiADUCp1sVUoT46cIfM/7yKlLZpFYDyGR9hze5okE2OEbVA0IOkWIh
	Te864F8ksCdPHiuxG4wvYufBqABqWdi/fnb87SoReWy+kfHvsUvixyGcQ/UWf1XOH
X-Gm-Gg: ATEYQzxYPaGSciJyh+SvW64Gpws9I63Jtnnk9qOqjJHgStNPynPFk4Omekz/vQ6ZIPU
	mfctupfotuxbZvcYZTwF0fVNmDzD8CCUcSjCJiCvwJx1/hR7foSoBZ+MO7o+Ojjj/RvF1Wwpwsw
	L0Z9BB3ZW5Wv4SK7DtlcAR9hD+jjSZurrJDCmi8RPmdFtm8qGbrIddAwfqO/AOO5Ae3IiiYDXao
	q0sgp1JNbVAeA0RWhJDv+jJmHIPycJW+wINJiiaBzhekUECvD/Xg3kQbEPCkna7RF2KNbLUdLt0
	LysU8b3dqx+EJsjv6IMlVMECQhTLaz3VNQrsnaYUI71PjK5y+P7yKyH1a+ashfMu/ZFUGCwXtPH
	86mLfbKDyF+4fvz5LRRXA4KB7H9/qcdq2XjvIpqiI6IQ2o53fn9Pc6ZqrLToHWmjYbg==
X-Received: by 2002:a17:902:b946:b0:2b0:4f16:22f7 with SMTP id d9443c01a7336-2b04f162497mr29871075ad.16.1773651489976;
        Mon, 16 Mar 2026 01:58:09 -0700 (PDT)
X-Received: by 2002:a17:902:b946:b0:2b0:4f16:22f7 with SMTP id d9443c01a7336-2b04f162497mr29870745ad.16.1773651489142;
        Mon, 16 Mar 2026 01:58:09 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece8363b4sm100193485ad.76.2026.03.16.01.58.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 01:58:08 -0700 (PDT)
Message-ID: <1eef0fc0-d33a-452a-9da5-3d0903b1712f@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 14:28:01 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/9] pinctrl: qcom: Introduce IPQ5210 TLMM driver
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linusw@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-mmc@vger.kernel.org
References: <20260311-ipq5210_boot_to_shell-v1-0-fe857d68d698@oss.qualcomm.com>
 <20260311-ipq5210_boot_to_shell-v1-4-fe857d68d698@oss.qualcomm.com>
 <05a1dcfc-7df1-4b20-a504-468814a87b3d@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <05a1dcfc-7df1-4b20-a504-468814a87b3d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=euXSD4pX c=1 sm=1 tr=0 ts=69b7c622 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=B7sYG0t6GpuNDl58wUIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: VBb9UMkm9fYPFiP1FAqCnNk_Q03yHzoy
X-Proofpoint-ORIG-GUID: VBb9UMkm9fYPFiP1FAqCnNk_Q03yHzoy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA2OCBTYWx0ZWRfX+jfMBXbkw5Aj
 G91m5eTyIB6J6HJHO1oGzvK+k0jm2nzvJTzvLfBieEYiApeIMq2uH0UwvUqrEQ7vAvzF+C2+GG2
 Wcrk4rUGdCs07tg+Dkv2v031BUC/IeNQnf29ShJz6iA8CxI9HzRJ9PFH6tR7xsDLAVLlwsETP8Q
 0ksauEJec65ZkvyGOT6j2V6pXc+ZqvN1AQbRZ1a6Mm8ja7U5f4wl1v2ZXH6HD1jbawLaOV+KxgW
 VKGwsrCOOuVbiTNf0nHkD9XBpdNfwczVIZlj7DQCkutMf9Hve2zkcx83YYh/ZEN3qmoxKE7ccDL
 qNQmNonAeNLMiptuFC55EXodY2EE6qUwQLTk/d5sPS/NkkuAA24cTi3cwqVsAPIoaZRmpZHWIXH
 CkFS78q29orEMbAB/cmhXpIYDKVmchJtqkJtRFoRGePAW6gRqWiE8TCOZGgy+98nJAqGWVxYK65
 uO9aj3gRy9WkKdNjwiQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160068
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33456-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,pengutronix.de,linaro.org,gmail.com,gurudas.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 38717296934
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 3/13/2026 6:24 PM, Konrad Dybcio wrote:
> On 3/11/26 10:45 AM, Kathiravan Thirumoorthy wrote:
>> Qualcomm's IPQ5210 SoC comes with a TLMM block, like all other platforms,
>> so add a driver for it.
>>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
> [...]
>
>> +static const char *const Led00_groups[] = {
> odd uppercase


Yeah,  in HW document also only this name has the uppercase. So I just 
left it to align with the HW document. Do you prefer to change it to 
lower case to maintain consistency?


>
>> +	"gpio23",
>> +};
>> +
>> +static const char *const led01_groups[] = {
>> +	"gpio39",
>> +};
>> +
>> +static const char *const led02_groups[] = {
>> +	"gpio6",
>> +};
> What do these 'ledN[012]' functions represent? Are they muxes for
> getting activity/status signals for eth/wlan ports?


Yes, that's right. These LED functions used for the eth/wlan status.


>
> Konrad

