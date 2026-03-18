Return-Path: <linux-gpio+bounces-33747-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGICEZClummaaAIAu9opvQ
	(envelope-from <linux-gpio+bounces-33747-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 14:16:00 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BAD72BC076
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 14:15:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C6A1F3051849
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 13:13:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F7B93D75B4;
	Wed, 18 Mar 2026 13:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jz3XS10m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kGdm771G"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61A53921C7
	for <linux-gpio@vger.kernel.org>; Wed, 18 Mar 2026 13:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773839586; cv=none; b=cHNUNaqrI6yaoGczY4z1jCU6NDRACa/Bq2ETMwo3uZnAYdY3PZqaHrP+mue+XrEeGgED1JLUBOAn30lAjlSyxutjBbM5klrY1t8mF6SzSbqw2aOrqQIVka9OwSfUsa4N4AfYLeHevmJc8ZAnJ+cPUXFFdclHzhBOU8tfzaw4f8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773839586; c=relaxed/simple;
	bh=+L9vOqSjiO9a6O165CuZxAw6NKrb8imiDto6ttLiloo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bh4ESDDz94/akel40/Pd6wPD5O8Q2WLzYH9SYkUWEHcHAtF19WXDDbsXRU3e8TwJp5l8cdo20L8+Y/0r5WpWYL4HYgA+BJ9KCyNL7ME7cFFB7zEZD3g5oK0hMJAG//RpOR9f9VCUS4YWjct8N5q13+pvVu45pvh6YTHNPts97Lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jz3XS10m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kGdm771G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I8LGCP2790022
	for <linux-gpio@vger.kernel.org>; Wed, 18 Mar 2026 13:13:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E59iGtHoJttmNzitX+WU26YIvATCm8nHOcVB6LcRIhs=; b=Jz3XS10mK5iWpAMH
	IZOP/Ga9BaythitcXHYA3vN0cyT1r2vfujIy5BPUxHtRuFWfr6ffG0l2k4DOLCY1
	ZWjTGIrIQd75Kq6VlUln45zEZwsuJ7KDKmOteYAn30JGFOJUVGLaMebWdeBRknmr
	Dimqnhhht2vownssAYk5s6br/zRCWqURZY8nS6QxRJVMgnwIi6V7liAY4J6oqPc0
	/aMD9LIGihe1eNN7qRTJg+PUl+0wVv3+YulN16ZaDlTgFOJWgYKb+X26qPN7W2Od
	TVmxKbSfbrnA0CiBuG+iwZqaIrjJUJtDks/tjO0Ka5e/vA70eOxM2NT62/d8zYW9
	oVATFg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyj4g2n27-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 18 Mar 2026 13:13:04 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b069bfa817so20422335ad.3
        for <linux-gpio@vger.kernel.org>; Wed, 18 Mar 2026 06:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773839584; x=1774444384; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E59iGtHoJttmNzitX+WU26YIvATCm8nHOcVB6LcRIhs=;
        b=kGdm771GAL1UMY1qjIKsg3GRCV22r1rAfOLE3r2RthxgTUjbTWQrIB0kE/2DaCXMTs
         xu2Uhwn3+QkMNL0aDj0GvJnPardbnwOdEfv1hCaD8CIXx6KHrHInE4ynsm47hPv4kICp
         fXle0+Klzp0T8TuL4gzh55TUmYh2oPEaFlgCsbXOeddb6mtVtUzeBZQlFenpbA9goJuc
         uXIv2hFbR1hBXc88JeXIcO+GoF1B7ZfieWIjr+IxqveXRtugvYNbggr372n5nGsTNtj1
         E2t/fJkcAEn4CGkxiFnTFjpqsIdPZGB0LLfM7z26e4rLcFhAPv2VW3GodSqvh7mtjcL1
         xZZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773839584; x=1774444384;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E59iGtHoJttmNzitX+WU26YIvATCm8nHOcVB6LcRIhs=;
        b=tIizwW56/ynvYLqvMlYlmGFB8dbiUiXQnwcoX3cIiSa7qk+w8BDl/LmAvTqgYFLaL6
         kEO/hWXh2H/hU/05DbpfpJZaEs1RXreTk67x46yJzZoYNdmw0kpS3PusvNJ++c0rI9d0
         EkWmajX/ytDbUGF5UY67B+G21RqW+Z7+7B3gIwiZs+XieMXM4qnSo21dHOZolO8k6Lb8
         nalpnLz2v5gpLWosw449wilXAPokaswn+jsr3vaquZA0QMZobfOmLchu199/Xj+WVng4
         1wi9dWDUKl5NEyaPpGxrbpntjP/cMFrjssGPBwpNpwZUo3UwL93WZqt/GPsWRfYTEC6D
         rlLg==
X-Forwarded-Encrypted: i=1; AJvYcCUIyVNA6HTyHwtfDpX9KxTx+Amv0A9GbuTiZ5UtwCC0Su5gynRpyd4e1/zEU0rcGdKU1Dc+V8LNfV1K@vger.kernel.org
X-Gm-Message-State: AOJu0YwvCCA8d27xiuscEg/r8W1mu+orTb9BZ8H4LMA1+vs6copuTNeA
	+k0cVd8rf6LJoeGdF9wJzmmIqQG4vfXDoJx6/pMVqAdgaiQ8mWP68hVWdqr6rw28s+LYKSLLAdA
	yzV6bJ8nzS6zIucXH2jUFY5yMQGxnvS598fi3S34vTVnLCgn7+f2pofvzDuxxLATB
X-Gm-Gg: ATEYQzyl4DsF+BMI6Waf6F/jvcDbjowlXzMfMaE+i9ktLf1aMptmy++l5qTMuBV+PRF
	HHzGPBFS3/GXFm1h5oGTUi2q7CRsHK0urOg2S6ZHGIUQYEoRHlqER5kfvLuQUQXcg9c8MuKL0Rq
	VNnAQMgHdKptLw0sdIRFtKVqeuh2SiK0N8SqTw5ZhnL4qXt7FSuPQ823k1DnSXaN0wz5rvFdK8e
	yOq0jkW1uP9LjbQ5gaN0dM8P/p4MEvba9ANysjTNfhrgTewtr0Fa7NGtOOJdGiiT9WRkumBMw7B
	bGImUvTPMYdj5mN2ejmDNQsRwbPk5PEDiB3YekQj1pqtR81/UJz+NwVNtAuFT8MostZl9qVDBJ/
	Kn6iTSWC1j6+7bqU1AHi1hvJm5gUt/xdZdhBn/cuse9lgbMF5RYIMp8hYTiHuBqd/gw==
X-Received: by 2002:a17:903:2f87:b0:2b0:41bf:ca83 with SMTP id d9443c01a7336-2b06e35b4c7mr33140745ad.23.1773839584304;
        Wed, 18 Mar 2026 06:13:04 -0700 (PDT)
X-Received: by 2002:a17:903:2f87:b0:2b0:41bf:ca83 with SMTP id d9443c01a7336-2b06e35b4c7mr33140445ad.23.1773839583794;
        Wed, 18 Mar 2026 06:13:03 -0700 (PDT)
Received: from [192.168.1.28] ([122.164.82.79])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e44a258sm27444125ad.34.2026.03.18.06.12.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 06:13:03 -0700 (PDT)
Message-ID: <11471fb9-a862-41b9-95d1-68ddcca5b7a3@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 18:42:55 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: add IPQ5210 SoC and rdp504 board
 support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20260318-ipq5210_boot_to_shell-v2-0-a87e27c37070@oss.qualcomm.com>
 <20260318-ipq5210_boot_to_shell-v2-5-a87e27c37070@oss.qualcomm.com>
 <c0effabb-3daa-4752-9069-c49a562edc63@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <c0effabb-3daa-4752-9069-c49a562edc63@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TPhIilla c=1 sm=1 tr=0 ts=69baa4e1 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=x8XZtM9IcEPKAfKvXv8PGA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=onala_4StLzjsFYz-ZEA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: Lalzk7ZzynIyT_bkEcjrcTiLqB26eBmI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDExMiBTYWx0ZWRfXziJ5IH4HEr62
 qNzXIW5JssptNLO0CSDl9qmVht5pVoamJowegxJ+E0iTvDnAs8pzZhlikhFOmX7E5H/6HbF9LiL
 WTeBZduVlDOAMG52YL4aOOPYZDMgzdy/oeztY4IFwY00W4sDWvztf5bnCLBfkJtw82KHp0vkwDM
 zwY8z86G3CZDJgcB5lFv6V+uVWMf2ol2o6Y0+7n2YZwXE1G9ObfJV3kWdeaW0RMdmWh4zU8tQzU
 uzNUTfCVEOOKp47UBy0UsHaT/HlzPjkdvB1B6kbG1HBdVoNgYWzxlqZztXnsyWXTI1oqftOklKS
 VccE2eDtOX0DkYvo0M+6/yQXmHdS4cfqKDc1UhiZbJHAjVzHLdO4vxbQt0TblqADjrwEsQa8Qdd
 rgO9j5U9chZhxRXf1+zwf5L954U3lCOsIi7wjEHzZ/OPPbFjY3ww+4QAAIGNlkc20YGIdnPgz1W
 qG0eWTe0ASFj6DQ+8Aw==
X-Proofpoint-GUID: Lalzk7ZzynIyT_bkEcjrcTiLqB26eBmI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 spamscore=0 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180112
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33747-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,0.0.0.0:email,b000000:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,b120000:email];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,pengutronix.de,gmail.com,gurudas.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
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
X-Rspamd-Queue-Id: 9BAD72BC076
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 3/18/2026 5:14 PM, Konrad Dybcio wrote:
> On 3/18/26 9:39 AM, Kathiravan Thirumoorthy wrote:
>> Add initial device tree support for the Qualcomm IPQ5210 SoC and
>> rdp504 board.
>>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
> [...]
>
>> +&sdhc {
>> +	max-frequency = <192000000>;
>> +	bus-width = <4>;
>> +	mmc-ddr-1_8v;
>> +	mmc-hs200-1_8v;
>> +	pinctrl-0 = <&sdhc_default_state>;
>> +	pinctrl-names = "default";
>> +	status = "okay";
> nit: Please keep a uniform \n before 'status', file-wide

Ack. I missed this to take care in RDP DTS.

>
> [...]
>
>> +	cpus {
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +
>> +		cpu@0 {
>> +			device_type = "cpu";
>> +			compatible = "arm,cortex-a53";
>> +			reg = <0x0>;
>> +			enable-method = "psci";
>> +			next-level-cache = <&l2_0>;
> Since we have PSCI, is there some sort of cpuidle?

Yeah, there is a plan to support but it is under development. Once it is 
available and validate, I will submit the incremental patches.

>
> [...]
>
>> +		intc: interrupt-controller@b000000 {
>> +			compatible = "qcom,msm-qgic2";
>> +			interrupt-controller;
>> +			#interrupt-cells = <3>;
>> +			reg = <0x0 0xb000000 0x0 0x1000>,  /* GICD */
>> +			      <0x0 0xb002000 0x0 0x1000>,  /* GICC */
>> +			      <0x0 0xb001000 0x0 0x1000>,  /* GICH */
>> +			      <0x0 0xb004000 0x0 0x1000>;  /* GICV */
> let's drop these comments

Ack.

>
> [...]
>
>> +		timer@b120000 {
>> +			compatible = "arm,armv7-timer-mem";
>> +			reg = <0x0 0xb120000 0x0 0x1000>;
> Please pad the address part of reg with leading zeroes to 8 hex digits
> (i.e. 0x0b120000 etc.)

Ack. Will take care of this next spin

>
> otherwise I think lgtm

Thanks!

>
> Konrad

