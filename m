Return-Path: <linux-gpio+bounces-31228-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cHniJN0DemlE1gEAu9opvQ
	(envelope-from <linux-gpio+bounces-31228-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 13:41:01 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DE07AA15F1
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 13:41:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 126F330378AB
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 12:39:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA27934FF5B;
	Wed, 28 Jan 2026 12:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V5n28WXB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a1sjthdd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70FD634F46B
	for <linux-gpio@vger.kernel.org>; Wed, 28 Jan 2026 12:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769603967; cv=none; b=p9r4aoHApcAWT/vSaJIvpm+k7gVvgbpmy2yjmkWjbhDYo3ZsUlo0bPMfkVb1pXfx7SusDPnXLEDgddL0LuAyBMPshoX846rrI8ANRXrD+Us/rsMRGcfDMf0gajd+Rh0WZUPbcyuKWgUcmnGvXYslhDQJ+pIdy0Atl8Mc52YTSXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769603967; c=relaxed/simple;
	bh=rnSFYiKpipLYfYsB7I4jYi2KJwlBXa6QxCsWGp3+S5c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=awuBwDcAe76CXMbsU7tEQIZuq7Fx4Rdg8CucV1yV9/erYDSJGbAgUN1aXGDjGgpRtng7GZ99kY/cyIi+EOQEm99cyj5KxrUhWCgi72r7wBlLxjqpkWeqHUoNGqbJeuN6G/0L5vFkB7aZwLey5I5ogjj9lP87/omDtu068pt93nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V5n28WXB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a1sjthdd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S91sRr3442505
	for <linux-gpio@vger.kernel.org>; Wed, 28 Jan 2026 12:39:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zuk0aNNm3PN/IEIs187jYGxFLJiqS4HGWXcW5xEcOl0=; b=V5n28WXBnCDbknJT
	GZh9mo6ev1aaCAVBfNhLRqHRJW7DpYWx0Uwqj4hN3uEu7OjjaH/WYtYoxc2B2fI9
	XCTIlejLqkHPHaKUj1gxW5+v/O2eo5ld8f1avzA8tNSrjC4O282nYG5n8t4wbhtN
	b4bSpKquj8bUQCD/rPR6wTZelPbHiIhHY6QzplBT+2mRKSVjL3zJ28OgIqFmZ8YJ
	EzM60LgzV3H/BQH+ZynWsHSB/ap04IjDiQjnGQF/VUyj8VvjE8d5FYaCJpZtHPtO
	83AUfVp3cvAVJclZ7+MSO2hlD6uDv0yQtbHbb9KT1+BssJS0a3Xy6LVMny21eYj0
	CKnJvw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4byanahp7d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 28 Jan 2026 12:39:25 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88a26989018so15451156d6.0
        for <linux-gpio@vger.kernel.org>; Wed, 28 Jan 2026 04:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769603965; x=1770208765; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zuk0aNNm3PN/IEIs187jYGxFLJiqS4HGWXcW5xEcOl0=;
        b=a1sjthddU3BVCEpw7pwOKvf2vHyR5yslccJ523Z7li3DuGn1c1CEv+r/jKvXNDBENb
         i+MMykFTvhmOqe7EePD2P7HaZqcDqw/wKJI8mkrS1g8tWkPM/jsuiFziy3AvGu3deKdD
         4N/be38pE0Yzg7GXP5+n7vrhzAT9sLednIOtcyOfwpI/TOuW4NbguCgorGQdNB3NLlA9
         x5J1jAwoRfuw+bFdygniPV1EJTvo8bIN9IeZTg1UDW0f3jb6T4Ab8zC/EJ6egbGnuf0s
         LeE3TCLqBFB1+1OasWUTNb9DEK0yWW2biCIThN9CEUnGuqGX8QJ2afKk/TlgTZvmqR5J
         6JNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769603965; x=1770208765;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zuk0aNNm3PN/IEIs187jYGxFLJiqS4HGWXcW5xEcOl0=;
        b=UJn6y9f4NXLpGwi85iLU+5P2SWAoWStnz6LudR2YceVD9TaIFQyNfz+ielmfl7cAjC
         JzbKQWT9TRuiQFF/W9opCzAXDOlYOUcTFV/Zrqk96XcqwtXvmeqQSdQ2HP5wjWiy8xXG
         psxcEn5ai3S8/MYALcckv4TQ9MBkAAHtEbGp4hZXWrcFdMZcCaI0MDINBPTs3sQLi9Az
         Jdx3ZuJrvgr9Bw6BJpaHmHPIzWqNuDXKcV1uXjSbmYR04QWW4w+zlNcfP4ey1hrEP4zW
         Efzz7ggOMPMNfyWZzKFRjFRsE8mGsSslzWLQ2xKzOS+zHsa5Lv4OHu5jSKhbdDpOH6oK
         Sb9A==
X-Forwarded-Encrypted: i=1; AJvYcCVRiaALkgisjdATSJC942i/EEvN/BloxyVlLCOfAwPzPWKx3RbXYgb/IeTIH3fwYAIB0U4RKPLhnper@vger.kernel.org
X-Gm-Message-State: AOJu0YxxnY7gXUmt5SB4XI9u5rer06sO9BStVakiNylw+QrGB+xDGMBQ
	FTiUrwFHXvwVtSV+3ms2EXAvJxfWOPLSK9uw/fIJwou44Lk2TABFryB9NrvLKcip0w4AikOALcM
	PEOH5YziTDAROUd3u5BkckvEp2jiyH41IRjQWYY505bbdiOElhBqbn+BpRSRH46tM
X-Gm-Gg: AZuq6aKbFvLF4JNWc24zVvfEN3/aIqYJ5ZlqlsfFSccHcprbbSwe2sNT7+qpHVj3qN9
	L0cEXB58nc+ShI5FFT+WQpBIibiTwqE++s6ygl2Rxi/9A3ASkW1qCE1S3yi9QmZMhqXVmNh3HVg
	KVv+LHrfsECwrVyrqAk7qCX4GanC4LzFHvgfw+ey7ejWX4zmjSz9pUFJs/391YvtT52fhScTMPh
	Gd16/dujNrzalCyTqGl22K7zFvOcLIJYizO1rHO9LaP7Mbh589aIBRS/eO0QbrMVAGekHoJ2V8h
	KOwmUStVEtD5YT+YzFcUAm1YZVU8nIdXQ5mXvZNmyBkwQHg6c3SpklxzpXRmdl8+yKWzT0ujkIh
	XLWjiY+QJwhcXdkA0PVb1J1iXOzESbTfkUaCrQBb7e2rEGZrXt2GVN197vhHSXGiVCgI=
X-Received: by 2002:a05:6214:5e03:b0:894:979a:bf7d with SMTP id 6a1803df08f44-894dccc1b03mr1054806d6.6.1769603964576;
        Wed, 28 Jan 2026 04:39:24 -0800 (PST)
X-Received: by 2002:a05:6214:5e03:b0:894:979a:bf7d with SMTP id 6a1803df08f44-894dccc1b03mr1054486d6.6.1769603964029;
        Wed, 28 Jan 2026 04:39:24 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b4452e98sm1498904a12.12.2026.01.28.04.39.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 04:39:23 -0800 (PST)
Message-ID: <5fcbfcef-5fb4-4d95-b75a-1c425d1c4183@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 13:39:21 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] pinctrl: qcom: Add SM6350 LPASS LPI TLMM
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260128-sm6350-lpi-tlmm-v1-0-36583f2a2a2a@fairphone.com>
 <20260128-sm6350-lpi-tlmm-v1-3-36583f2a2a2a@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260128-sm6350-lpi-tlmm-v1-3-36583f2a2a2a@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: FxR4iAaLgIDRpaiPNsofD1mSqr9ydpWV
X-Proofpoint-ORIG-GUID: FxR4iAaLgIDRpaiPNsofD1mSqr9ydpWV
X-Authority-Analysis: v=2.4 cv=N58k1m9B c=1 sm=1 tr=0 ts=697a037d cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=FKLYIeIi5cSbgHY3oWEA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDEwNCBTYWx0ZWRfX/5f7HaCysQ//
 zu6USH3ZiRy49wRrT85Zz0wVEdCo+uzWmSF24cDfS5L7ChOPl5AbVOfuEtjpsIxMauJnJM5che3
 UiflrbBimlMRLcxxUpQAe5hptLayG6w29s9uxjE2v6EfQGgryPMMl48+lfa9Ak464S5V7CmgWek
 N6dKWE0RoCTrTP1YBjWDQQ5PpIRzNa06Wp/ISP88L4z1oBNFVCAgHloIJLNtcQuCthE72mRkz0W
 3zFguVA8cXGMcpn8vN7trvEBIqy0s1YmfyV/msYBmute7x08fCMvLVPVHySxozq3VHpm+OIKT6b
 nvXO6JzoXp1wJM6RX+3R2OQPrkOA/I8euZOU/04/xJVOFXn5t/MKTX2AnTV0/AT518X95fOPr3T
 NMDf8/84OTJ/lhqOt6pn4AcpGTn4EQO2ZN9F/Y5O5VgwA3q2a3tSw5Vu4tAiUspqtxj2FSwY0WT
 l4hkJiexFCbnhLeNrfg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601280104
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-31228-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,fairphone.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DE07AA15F1
X-Rspamd-Action: no action

On 1/28/26 1:26 PM, Luca Weiss wrote:
> Add support for the pin controller block on SM6350 Low Power Island.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

[...]

> +static const struct lpi_pingroup sm6350_groups[] = {
> +	LPI_PINGROUP(0, 0, swr_tx_clk, qua_mi2s_sclk, _, _),
> +	LPI_PINGROUP(1, 2, swr_tx_data, qua_mi2s_ws, _, _),
> +	LPI_PINGROUP(2, 4, swr_tx_data, qua_mi2s_data, _, _),
> +	LPI_PINGROUP(3, 8, swr_rx_clk, qua_mi2s_data, _, _),
> +	LPI_PINGROUP(4, 10, swr_rx_data, qua_mi2s_data, _, _),
> +	LPI_PINGROUP(5, 12, swr_rx_data, _, qua_mi2s_data, _),
> +	LPI_PINGROUP(6, LPI_NO_SLEW, dmic1_clk, i2s1_clk, _,  _),
> +	LPI_PINGROUP(7, LPI_NO_SLEW, dmic1_data, i2s1_ws, _, _),
> +	LPI_PINGROUP(8, LPI_NO_SLEW, dmic2_clk, i2s1_data, _, _),
> +	LPI_PINGROUP(9, LPI_NO_SLEW, dmic2_data, i2s1_data, _, _),
> +	LPI_PINGROUP(10, 16, i2s2_clk, wsa_swr_clk, _, _),
> +	LPI_PINGROUP(11, 18, i2s2_ws, wsa_swr_data, _, _),
> +	LPI_PINGROUP(12, LPI_NO_SLEW, dmic3_clk, i2s2_data, _, _),
> +	LPI_PINGROUP(13, LPI_NO_SLEW, dmic3_data, i2s2_data, _, _),
> +	LPI_PINGROUP_SLEW_SPARE_1(14, 0, swr_tx_data, _, _, _),

Modulo this odd cookie, it's identical to 8250.. but then it messes with
all the definitions, so it makes sense to keep it separate

I verified all the functions and slew offsets


Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

