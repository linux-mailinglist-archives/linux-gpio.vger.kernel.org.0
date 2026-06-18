Return-Path: <linux-gpio+bounces-38658-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iNSwCp+SM2odDgYAu9opvQ
	(envelope-from <linux-gpio+bounces-38658-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 08:39:27 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD4469DE0D
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 08:39:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=OOfMd87j;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=A8MLK3CZ;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38658-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38658-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 96F183063395
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 06:39:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 335B233439A;
	Thu, 18 Jun 2026 06:39:22 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917C7257854
	for <linux-gpio@vger.kernel.org>; Thu, 18 Jun 2026 06:39:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781764762; cv=none; b=Qe3ivECz4QUdqrWX6O6M2IEGb/zWyNnW65NgK28J0KDH/hl6CWooVox/9hsWndwPWP8eyzNsi7Ru6tl8MtpW7lfKAOxXVCLIwUmdaU6ev2adLGXFUOENzQUypc8ogQHyr9xNTgSNiD/4zpDjCcU+hHMvKOdq9gysZ7TUCz6Kwc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781764762; c=relaxed/simple;
	bh=CitbZsiqyq66RRkeKiRbQVLiOa6DYPRfkQxVYj9mvKw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M7pcxlSA+RXcfWnzMqLzG/lHExzrDoBXvXI/yhoQeUe9TY5/ayNeeuBkUlRKWUn8MBhJ5m/ewZbouy+gUztfsErnnO+TnNazvJHkfB9ckqRCKgABJoCf9tXgTBFBXHgXXf1MZ6gxHFj6lRXYcM63wf+KMsARqsAmqYEP5joX4P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OOfMd87j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A8MLK3CZ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65I68sra3525574
	for <linux-gpio@vger.kernel.org>; Thu, 18 Jun 2026 06:39:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g/stOCxZ+zAQ9WeYQSMa5ASQyIxGcj+rnwFXY6EZ0JA=; b=OOfMd87jECFH+brW
	tG3LXYftDFyR2s3hcbI8BOfWWKpn0MdvKmRL7PgcUCWzdAil/gBev40fi58N91N/
	pzAPmLaMrmup2nP+jJJyQR+S1LDmiH+KpdXa7me20BANJOvoTOJjiZMKoLnW0xC7
	Vtpfbl9veYHK2+MTowgA8VPUI9VfGk5ICUKhHe6Z80VvH8kjZOQD/NW54PTIDA4W
	4m6Lm7uGlkT7oaM1wnUkAVpX6c9eOD18sZ12V+v5wIg8Wve6fqo/KxFgsXIz6698
	NstepS4HXxVJQ9EMcfsnePPop5CI+KKD4sp7t5eJ8yy/AWrG48Dq99DjYLyDqaXI
	lea2pA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev1rtsyux-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 18 Jun 2026 06:39:19 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bf55c3f44aso13506155ad.0
        for <linux-gpio@vger.kernel.org>; Wed, 17 Jun 2026 23:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781764758; x=1782369558; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g/stOCxZ+zAQ9WeYQSMa5ASQyIxGcj+rnwFXY6EZ0JA=;
        b=A8MLK3CZsSO22ZvvmwNv/Y81hnBox7l9gI/ZqdzCOPPygbahtrcpC+Fw3WEZXJMPw6
         6ltNs+3XqX9j+NChGWskrDzm64gadayMVgughpMnXZMpBG/tuWkzYbxQs46XQ6wLGsew
         CMcEqPM3/MY4ErMFvjLLl7wLzvqjKYHBBPDP5JWoyQGJbqmNhAtZ2TGP/6pCq2RkeSUO
         237IaPNTXPRsqec+GrLLzANaX/e+YBMg/GycaGK1Z94ya5ErZMnMs2N2GlF3W9A1mCtj
         SbnLBKeToWLHVk+bsSFVQ22meyWBNGQHgOXiWwU+JRP9gfMPdMbAgukAEPMP0PoecgCj
         3hFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781764758; x=1782369558;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g/stOCxZ+zAQ9WeYQSMa5ASQyIxGcj+rnwFXY6EZ0JA=;
        b=nMSBh5kTX5hgi3lM/RDjzYGrP7StDPaZdiQOE+zcs1xfiXxuG/lW46shtaVn1pdvH0
         GqE9exCmmNX510x0M9FpI5W6gIGvwEe58IMimu1FgdkxGyl9OIw4sJoDKQvJkRb9DHT7
         HONcgoAWEJ4j2Fspr23pIrY/9rHOU1orrRi6NAZXmrq2jkC2ZKR/6tTBoUI9dhH8tUwq
         204CFCGlAKjLXEb3qcp6lPYrjdpV43mNqAXpmnw+nbERNfKKJgEMBpAwyJP+Qltr5YC/
         PkZyKnUUIge8dEctVaovAVh2B7EHer4MIs8HvJh1sL6L2F4V1795L8PUE88ndBAVo8Ht
         F4SA==
X-Forwarded-Encrypted: i=1; AFNElJ9kuFGpwlBHsLGnfjrUkXMPdyaYyD9Zgw/r5WFplkg0lHN9500g6/pG1PpcvgHbdLdvWYMfAUMxliw4@vger.kernel.org
X-Gm-Message-State: AOJu0YyNT3U74FOul0xfRZlkcyqTe7Tcb0pdHazCSrLChInEU0bIFpuN
	zXRIIf5xKztOP6T2V5dhSi5j+89Pufw2dHIVFNW73VL/x1/k0E6ky2eDoBH6SBWZumejW6E+ijU
	2tprMHEQ6o/hUjj+L1Pz80SJKJ+X8b96OVqLSK84ObRBn51V8H2NagjnLtCf/yl//
X-Gm-Gg: AfdE7cnm88FrjAlzCw63NPoz05HXKj1Fc6muUwBdjL8z1RY1134Oo0Ey20qztD1+Mf2
	cgNg6I7OrcjHKIipPf+Ex+H9XAXxcYOwbGmH+ZwS1mhM2tZ+S/StS7u8LA28WY5yflCS4F/6WLJ
	8vQBUAp9+X20N/6PKMK/TWv+8qQqMEs1yuwgqI79t7st8xtFaQKa8fWKpcMbPMV9O0ZIskKr585
	ocwQgBcvr48y6GVAkVbXhe1ZM6L9xERT5MAop5AFGeEt8MmdQ+NHhGqYwp3IPbtVCoeGSgozuMv
	dVVEfxcLhSsdKIwE9SZWKRDGr/+IKKUqXOsllJR2cY1sAPnynANW2h4QaB5ub71xMIDGMeutANS
	Gzeos/BMpJqQemwvD3Y14HeKxkD3dP6RIlJsK/wxwssbPCKf+IFMM/SqKRt23E+4xQRxTSC12LW
	10TbgO
X-Received: by 2002:a17:903:1b43:b0:2c0:b31b:b19 with SMTP id d9443c01a7336-2c6de79ed27mr21996655ad.21.1781764758101;
        Wed, 17 Jun 2026 23:39:18 -0700 (PDT)
X-Received: by 2002:a17:903:1b43:b0:2c0:b31b:b19 with SMTP id d9443c01a7336-2c6de79ed27mr21996345ad.21.1781764757497;
        Wed, 17 Jun 2026 23:39:17 -0700 (PDT)
Received: from [10.133.33.101] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c6a1878426sm68884315ad.64.2026.06.17.23.39.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 23:39:17 -0700 (PDT)
Message-ID: <c0478a3b-dcc0-44e0-abfd-2c86f24db733@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 14:39:12 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] soc: qcom: rpmh: Allow non-child devices to issue
 write commands
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260528-pinctrl-level-shifter-v2-0-3a6a025392bf@oss.qualcomm.com>
 <20260528-pinctrl-level-shifter-v2-1-3a6a025392bf@oss.qualcomm.com>
 <4ac5hjmr6divqs4myhcw5sveuboj265sw2jwslbivrfwh5e7ce@6d7ajvgikkgt>
 <18235340-cd42-4d88-bfdb-19aecdd63d68@oss.qualcomm.com>
 <9927f5d7-1eca-4936-b38c-678e76ac11cb@oss.qualcomm.com>
 <vmk6b6cd4jolhisfphgai35eznr5d5uwrhx2qktdwd2qayxwm5@fb2js7bw4dca>
 <837dc7e2-4db8-4a7d-a19f-e53ddbcc9cf6@oss.qualcomm.com>
 <4edaf745-d24f-4ce0-9605-e3971f067b68@oss.qualcomm.com>
 <ao2bl4vzgb3mvqnk2kgvgqnifujbvy6oyzuj4rnvjrv6teyrel@56txzbrtwm64>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <ao2bl4vzgb3mvqnk2kgvgqnifujbvy6oyzuj4rnvjrv6teyrel@56txzbrtwm64>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=MNpQXsZl c=1 sm=1 tr=0 ts=6a339297 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=l5iDvloktsjau2Z1kDIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDA1OSBTYWx0ZWRfX1YODkoM3SAKD
 1PFEKCvUsfQBgSKINKydtzbpJNCJCcHsR6yoIip8Gu1mC+fnbRZ32QwrQTKoNIKa/hB/vEn+PYj
 XPy792yYvIXvCpY3pbKMKQwLVAt7J8J8DiXQnpCPLPuS7ngx39W3293JoeUvKrBvZiP79jak7Oz
 1tOz0CjnjIJgjrPy4LS2uOZL0BPEnLV50IbQ38EN1Xe4gulzIioC9/5O8gJSlrSNc6kvsJciWjg
 /ZG+ituntFXycQlsZmAX1cu97KPZcp/pqIUyM3fKXM3dyoC4oArehvs9tCYxtmWqbFbqplOPKZr
 UVmD/EaLNVIF6HInGpBeCYh3FKJfsnwUR2HJQC0okB6qUrsaqCx8QcfAXRKRgjSdyWRCYF1Z8kU
 RLC07y9covXvjYmy05kcB9plQRcb0yw1G3JZ+xEYowoXsQLr5E83A9Y/LgZKJyfuae0Cr+z1JX8
 LA8iW0YIQ7hdmk+eWOQ==
X-Proofpoint-ORIG-GUID: bpOehND5cjPSKfRXg2EskwSHQ2UsvN0b
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDA1OSBTYWx0ZWRfX29/tIKC+kBjk
 U60Lks5Xar/TvjcZsWOQiHQvP6D/rxLpHflto9uRfNLu5/YZIzm/fm7MA4qXV9cui+7Y4bVdbSN
 hjJ01VXzLicPNpxJ2Zou3wHcWUSNSyk=
X-Proofpoint-GUID: bpOehND5cjPSKfRXg2EskwSHQ2UsvN0b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_02,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 spamscore=0 impostorscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606180059
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38658-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:brgl@kernel.org,m:david.collins@oss.qualcomm.com,m:subbaraman.narayanamurthy@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:maulik.shah@oss.qualcomm.com,m:kernel@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[fenglin.wu@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fenglin.wu@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8DD4469DE0D


On 6/12/2026 8:27 AM, Dmitry Baryshkov wrote:
> On Thu, Jun 11, 2026 at 12:36:43PM +0200, Konrad Dybcio wrote:
>> On 6/9/26 3:28 AM, Fenglin Wu wrote:
>>> On 6/8/2026 5:21 AM, Dmitry Baryshkov wrote:
>>>> On Thu, Jun 04, 2026 at 10:02:43AM +0800, Fenglin Wu wrote:
>>>>> On 6/2/2026 3:29 PM, Fenglin Wu wrote:
>>>>>> On 6/1/2026 9:37 PM, Dmitry Baryshkov wrote:
>>>>>>> On Thu, May 28, 2026 at 06:05:35PM -0700, Fenglin Wu wrote:
>>>>>>>> Currently, the RPMH driver only allows child devices of the RPMH
>>>>>>>> controller to issue commands, as it assumes dev->parent points to the
>>>>>>>> RSC device.
>>>>>>>>
>>>>>>>> There is a possibility that certain devices which are not children of
>>>>>>>> the RPMH controller want to send commands for special control at the
>>>>>>>> RPMH side. For example, in PMH0101 PMICs, there are bidirectional
>>>>>>>> level shifter (LS) peripherals, and each LS works with a pair of PMIC
>>>>>>>> GPIOs. The control of the LS, which is combined with the GPIO
>>>>>>>> configuration, is handled by RPMH firmware for sharing the resource
>>>>>>>> between different subsystems. From a hardware point of view, the LS
>>>>>>>> functionality is tied to a pair of PMIC GPIOs, so its control is more
>>>>>>>> suitable to be added in the pinctrl-spmi-gpio driver by adding the
>>>>>>>> level-shifter function. However, the pinctrl-spmi-gpio device is a
>>>>>>>> child device of the SPMI controller, not the RPMH controller.
>>>>>>> This replicates the story of the PMIC regulators. There are two drivers,
>>>>>>> one SPMI and one RPMh. Why don't we add a separate, RPMh-based GPIO
>>>>>>> driver targeting only those paired GPIOs (and we don't even need to
>>>>>>> represent them as a pair, it might be just one pin).
>>>>>> Thanks for the suggestion.
>>>>>>
>>>>>> I agree that adding a separate, RPMh-based GPIO driver would be more
>>>>>> straightforward from RPMh control perspective. It makes the new device
>>>>>> as a child of the RSC device then it can naturally use the APIs for RPMh
>>>>>> commands. The main challenge here is, we need to make the level-shifter
>>>>>> mutually exclusive with other GPIO functions when the GPIO pairs are
>>>>>> used in level-shifter function, which means we need to write SPMI
>>>>>> commands to disable the associated GPIO modules. I am not sure if AOP
>>>>>> already handles this; as far as I know, AOP only manages the
>>>>>> BIDIR_LVL_SHIFTER module registers. Let me double check on this
>>>>>> internally, if the GPIO modules could be controlled along
>>>>>> with BIDIR_LVL_SHIFTER module registers at AOP side, and get back.
>>>>>>
>>>>> I checked on this internally, AOP only handles BIDIR_LVL_SHIFTER module
>>>>> registers, it doesn't disable the associated GPIO modules. Also, I still
>>>>> have no idea how could we make the "level-shifter" function to be mutually
>>>>> exclusive with other GPIO functions after moved it into a separate driver.
>>>>> Do you have further suggestions?
>>>> So, for my understanding, we still need to write SPMI registers to
>>>> configure the pins and only then AOP can handle the level shifter?
>>>>
>>>> I was thinking of using gpio-reserved-ranges to prevent those GPIOs from
>>>> being used by the normal SPMI driver.
>>> More background: "level-shifter" module is actually an independent hardware which is not part of the GPIO module. However, they are sharing the physical pins. Which means, from PMIC chip perspective, these pins can be configured to either a GPIO function or the "level-shifter" function. So in PMIC base dtsi file, for example, pmh0101.dtsi, these pins should not be restricted in the GPIO nodes in "gpio-reserved-ranges".
>>>
>>> Also, we need to make the GPIO modules are disabled when the "level-shifter" is enabled, to ensure that the "level-shifter" circuitry is not impacted by the GPIO modules internal circuitry. So it is supposed to write GPIO EN_CTL register (offset 0x46) to 0 through SPMI bus when the "level-shifter" is enabled.
>>>
>>> That's why we have the requirement to access both RPMh and SPMI bus in the same driver.
>> I was thinking about other ways to solve it.. maybe someting like:
>>
>> &pmh0101_gpios {
>> 	pmh0101_ls_pins1_2: foo-bar {
>> 		pins = "gpio1", "gpio2";
>> 		// appropriate pinctrl config
>> 	};
>> };
>>
>> &rpmh_rsc {
>> 	// should this be a gpio controller? a mux provider?
>> 	// is there another class that would better suit this?
>> 	rpmh_level_shifter: rpmh-foo-bar {
>> 		pinctrl-0 = <&>;
>> 		pinctrl-names = "default";
>> 	};
>> };
>>
>> // but where would it make sense to describe?
>> // fixed-regulator or something akin to that?
>> &some_consumer {
>> 	someclass = <&rpmh_level_shifter 1>;
>> };
>>
>> i.e. the "rpmh level shifter" driver would consume a reference to the
>> pins, configure them as necessary (just like any other pinctrl consumer)
>> upon request
> SGTM.
Thanks for the suggestion, Konrad and Dmitry!
Using the pinctrl state in the new driver to disable GPIO pairs is a 
good idea. I’ve been considering which class would best support the PMIC 
level-shifter, especially since we’re moving it to a new driver and it’s 
no longer restricted by the pinctrl framework. Functionally, the driver 
should provide following capabilities:
1. Enable and disable the level-shifter at runtime. Consumers, likely 
I2C client devices, will enable it when active and disable it when not, 
mainly to save power.
2. Allow sharing the level-shifter between multiple consumers, even 
across different subsystems (currently managed by AOP).

I see flaws in each of the following approaches and haven’t decided 
which to use:
A. Using the mux subsystem: The level-shifter acts as a switch, so it 
fits the mux subsystem physically. It can be enabled/disabled via 
‘mux_control_select()’ and ‘mux_control_deselect()’. However, with 
multiple consumers, a second call to ‘mux_control_select()’ is blocked 
until ‘mux_control_deselect()’ is called, so votes from multiple 
consumers are not allowed and can’t be aggregated.
B. Using the GPIO/pinctrl subsystem: After moving to a new driver, the 
level-shifter doesn’t fit the GPIO controller or pinctrl device concept. 
It has only one pinmux, and each level-shifter works with two pins. 
Also, both GPIO and pinctrl frameworks require exclusive control, and 
couldn't shared between consumers.
C. Using the regulator framework: The level-shifter is controlled via 
the RPMh XOB resource at the AOP side, which was adopted from the idea 
of power rails sharing between subsystems. The regulator framework’s 
APIs and reference counting fit the requirements for sharing between 
multiple consumers. The problem is, the level-shifter isn’t a power rail 
so it is conceptually not a regulator.

Please let me know your thoughts. If there isn’t a suitable approach for 
supporting the PMIC level-shifter right now, I’ll stop chasing on this 
until there is a better idea.

Thanks


>> Konrad

