Return-Path: <linux-gpio+bounces-33726-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EDvRKTqAumldXQIAu9opvQ
	(envelope-from <linux-gpio+bounces-33726-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 11:36:42 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F0E2BA027
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 11:36:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C80273008C8F
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 10:36:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE23F37C928;
	Wed, 18 Mar 2026 10:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VPamrkD0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DyzqwTD5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E3D370D6A
	for <linux-gpio@vger.kernel.org>; Wed, 18 Mar 2026 10:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773830190; cv=none; b=YuF0OplZ7Ad4zGtwjxlK5kHRmCC/2dsl61PbFANhXj53KslF6lSUyQqkGLFFTdE+evLKlGW//y6qAAjF1TdKwBz/V1xsfR/hhAJaxKWGYK9oKbEuRPTY+EbXzBLCtcCckfOgBjqD4CguQ9sg7g7UfnkEYaDmQ+p9Hdt1HJkTNKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773830190; c=relaxed/simple;
	bh=hVWH89DidmpmKxAGOLwA+g+gHVKnhMhNuhjzUg/8z+E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hArujMCyhhbsRaNhcIzKQEVB3DdV4xH9WTkuKWktzdA1dOqx8J8Bk85oVVk1h5kZVwoRB2keDqi2pxgNLrKU4GD5GwwjHSNBRs7/MjXHbgmlHsW6/FzdHpPiEa+lChk7YfOSo2Dc4oRUENJ+Su15U/iyaIeWhiJQQjhQnEEfjhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VPamrkD0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DyzqwTD5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I8mtdY084761
	for <linux-gpio@vger.kernel.org>; Wed, 18 Mar 2026 10:36:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1MpnT9tRvsK84h6PeL9Je186l57/P4skpZbYvmTYhSA=; b=VPamrkD0cPOyBLJK
	iZEgRNowvTLxpClhjdhTyty6XSaFm4de9ARrP0EO5CVANvBW8feyH58j5/i87UxZ
	pHgKLmeUWwjaES/kwH2c04w9VmFLBevT9xR24/9dOhVRqeQf7vk9eNKur0E/DNT7
	I6HSJSGn31+wFVkxVk4cIrb/M0RgyvdGht1TvjzmZDTkm/0NnRpYrKUMJ2RYg6YK
	0mgv1yn8LFdPULecGBwFkt0zPsGn1jRJoMIEzmxufWLIhB5HMarlLrtXEfSPOj2o
	dIJlV5TlJL7rAfVZVkLIrF8zWZf7Fzqc33+SLa0gIEDuIojsSqQCVdO+zfCR2ufQ
	GH9R9A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cykqesu7e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 18 Mar 2026 10:36:28 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-509118781dcso78981241cf.0
        for <linux-gpio@vger.kernel.org>; Wed, 18 Mar 2026 03:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773830188; x=1774434988; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1MpnT9tRvsK84h6PeL9Je186l57/P4skpZbYvmTYhSA=;
        b=DyzqwTD59wp229Zah6xgVCsesJjLlo+LW1LqHDL/D6PHKWShPecq0/uKg3X1a/2s/9
         rCq07uSr2t+hz8HDVslzBn1ugcxmKPj6x/myl9QEeJRjn25ME8z4FpoUyJ2IML7C+BCo
         1ZBoSnULt0umRGqOM0D0HvqeBeYtAt6sqJripFp1LcxLYXpBF6nZO4kzth65RjVXlGS8
         X+ZIXs3kT+Tj8GJrRjoV1KAGPvp4UkEeFdo1jKTFwuyTXTuKK8ENoJ6t4AB2Eub/P26b
         hiWgozGJV2Ee9hz8l1oaBaD6Okd3U0CZmKdgIuYl5zQDQmyeelGeM2nTDTmAOKA46of6
         jQEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773830188; x=1774434988;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1MpnT9tRvsK84h6PeL9Je186l57/P4skpZbYvmTYhSA=;
        b=ZBnnpUIxdXhuZDjFFpPchpyBjQcndg+YfL8SC/eBg+fFpqav3jv3HHu+LXnkvGTFFy
         26UC32g3LZlrlNmPtCvvesgjEtHyQBwDMsl7JX23jQsRYfBDieJq4Uc1kde+O8sVnntq
         CAEs8QpbxENqHDDQW8TcKIeqKcjHzDTrQfss1B2AWV8MPBnv/HURulgeViyC8mBIpZbl
         z+0PlsEHE1ju/js/JBnnj/Jkb5iyxw9nCRioOZ6KPXZbdb36W6zZrLN5W02dp1hcLA3V
         8RVVMaYsJ6tZlVdmd+Po+Fq4qWWQB4kwHoWWl7Sm4OZyv6HfF9nv5zaJEwX2wZitkjMo
         YCuw==
X-Forwarded-Encrypted: i=1; AJvYcCXsx+0ivuXyvqUFhnT1OX7nBuAV4ZfLiIHqRJbQugwKqtBG+5McCnLoDjiQiOB/lQdJkvdURQTv9nTg@vger.kernel.org
X-Gm-Message-State: AOJu0YxwxhX5QxFG0MLbM1kzKiVXZGMgw0M+WuHBV6UtxgfHMX1rEcg0
	5HdG66EWwASQT/92R5H2F07CvmM09bh7W3DcRRRRCmy2+vZ4eSG7uRWJTn+/xDUY+Y/F7CU0tVv
	itlb7FZsziD10H0lghhgQQggQHZYHj1hHxdj4Ii/ZVJcedgoVHBaml1xvAIFmB/jl
X-Gm-Gg: ATEYQzyYCC0WHN1MUEJIQI6EgycR7+mXux1pdM6HLcFx+dZ2Iq3AoQyJWHmg2pEP34x
	SjMKSVd6dx0yOAwjKGQxdC07ze6gh4qXvcEn8zb3Mwzv0eeL7FneZweCY/W842SWGfgqvpkc6uj
	0Fae/Mozb7ZFbwcz3B578kMiTXKkRURx8AKED2AePPnXh4AAfegKOEI/tJ90Za874QvXuQd14gl
	RuZHN6Naf0JANaurKAUsffaPOmJWeb1W1MXHYt8tj+MMtCoKGZ3jLd8qQfu2mRcc9lvqW9DQdI1
	K7cDjYVu34O+qLOwTBjHhHhtgV3wnP2iaReLgiw3i0AwXiCWnoy1ACYwEoK+krgNogwDzoKL+yP
	wZEcM5m/N/dRmrdPrWMfx54XhCtOGE2amIpnitSgD568tsbcA7mOvkqOgErLQHio72mlppKzl6M
	2/Gn0=
X-Received: by 2002:ac8:58c6:0:b0:509:1636:486b with SMTP id d75a77b69052e-50b1489deffmr24005331cf.6.1773830187688;
        Wed, 18 Mar 2026 03:36:27 -0700 (PDT)
X-Received: by 2002:ac8:58c6:0:b0:509:1636:486b with SMTP id d75a77b69052e-50b1489deffmr24005071cf.6.1773830187262;
        Wed, 18 Mar 2026 03:36:27 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-667b12ad2efsm1318481a12.27.2026.03.18.03.36.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 03:36:25 -0700 (PDT)
Message-ID: <c50b8a91-ebda-4ba0-984e-b4121a55adf3@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 11:36:23 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: glymur: Add LPASS macro codecs and
 pinctrl
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        andersson@kernel.org, linusw@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org
Cc: srini@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sibi.sankar@oss.qualcomm.com,
        mohammad.rafi.shaik@oss.qualcomm.com
References: <20260311124230.2241781-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260311124230.2241781-3-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260311124230.2241781-3-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA4OSBTYWx0ZWRfX4YErIONLU/DU
 cPPsGjaWVypr9d+6e1uKUrcu3JPohONAneu6OaJgMB5FH4pfXLcJUBvPbDX66e+c/hHufcuAeib
 BxpfgjKlMrUtyT7KHvNhKOe3n/uNccd62OdxCsLupxNGX4Rb4pKOeVOOsWoW6Hpd8YYSRScB9hm
 9i14fufw/m45aqtnmjGOec7iahVjbfbQd04UuaH6hUP1hgYbd0guX++1+WDPxwIpEKhn8giV04J
 4yzSkyT+iitOV66z5axPeS6IjWp1dMcTqbJl65oYIHoNHKEY/TJiWPn7KkbAKgb0jOGsK0CFPpN
 /E3+UBRTMX6er3rs4irJ8Jyoob1wq6mYYDMXP5E7cCdgu2/l3NAGiB5VTTh/B/mD6aSEHh11znK
 8tOLaZSOEUUtzCUlDFiWXylQRLF5h0r+70Ao0uXlhT6fN6qygFg7xQJvv7Sbb+W9ktROcrxct/0
 Sv/p/u7m1ibc1AWuIHw==
X-Authority-Analysis: v=2.4 cv=Cd4FJbrl c=1 sm=1 tr=0 ts=69ba802c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=szBlefgwOCt4PKCK3EMA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 3JetZ9KFHplZwr6E0MXXVhvuUEbRYab9
X-Proofpoint-GUID: 3JetZ9KFHplZwr6E0MXXVhvuUEbRYab9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603180089
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-33726-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,6c90000:email,6e80000:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_PROHIBIT(0.00)[0.116.225.224:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B5F0E2BA027
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/11/26 1:42 PM, Srinivas Kandagatla wrote:
> Add LPASS macro codecs and LPASS TLMM pin controller on Qualcomm glymur.
> for proper sound support.
> 
> Also add GPR(Generic Pack router) node along with
> APM(Audio Process Manager) and PRM(Proxy resource
> Manager) audio services.
> 
> Co-developed-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---

[...]

> +		lpass_wsamacro: codec@6c90000 {
> +			compatible = "qcom,glymur-lpass-wsa-macro", "qcom,sm8550-lpass-wsa-macro";
> +			reg = <0 0x06c90000 0 0x1000>;

sz = 0x10_000 (no difference but for completeness)

[...]

> +		lpass_wsa2macro: codec@6cb0000 {
> +			compatible = "qcom,glymur-lpass-wsa-macro", "qcom,sm8550-lpass-wsa-macro";
> +			reg = <0 0x06cb0000 0 0x1000>;

same here

[...]

> +		lpass_tlmm: pinctrl@6e80000 {

unit address doesn't match (reg is correct)

> +			compatible = "qcom,glymur-lpass-lpi-pinctrl", "qcom,sm8650-lpass-lpi-pinctrl";
> +			reg = <0 0x07760000 0 0x20000>;

0 -> 0x0

> +		lpass_vamacro: codec@7660000 {
> +			compatible = "qcom,glymur-lpass-va-macro", "qcom,sm8550-lpass-va-macro";
> +			reg = <0 0x07660000 0 0x1000>;

_at least_ 0x2000, I don't know if the following registers are also
related

Konrad

