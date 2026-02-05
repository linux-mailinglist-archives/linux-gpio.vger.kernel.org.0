Return-Path: <linux-gpio+bounces-31464-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kGuYJcRahGl92gMAu9opvQ
	(envelope-from <linux-gpio+bounces-31464-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Feb 2026 09:54:28 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 025BDF0196
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Feb 2026 09:54:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 78FAD30091ED
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Feb 2026 08:53:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FDFB36166C;
	Thu,  5 Feb 2026 08:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ki0Yfm2j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="al0HOZAW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E575335971B
	for <linux-gpio@vger.kernel.org>; Thu,  5 Feb 2026 08:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770281607; cv=none; b=rTWkaeQWmItatNcFHzXnfEqITE0bWuHk5FI/wQ8WoGaeXRT6ID0WtbMEpjxKVJhNeE60DDHTWldLdgmClXazDKGZ2Sd1CD9eyuNL7PZi6x9Wz38LKiPNoplkCpu07W7p5Eh6IaSowtDF8uacevTQ4HdITuFUnaKacNMRbu5+XDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770281607; c=relaxed/simple;
	bh=jeRxW6NvArbsNamVoyEoTUZu2w80losl5bhdi2hXAM8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JT1x7K4WnzP0TIaDASKZVNJvbluvg3Kav4yoOQCjVL2nZgtI910nh5/SL/OJCRSzOO8RhxiWPtVzlHWLO3XwaAmdReGszteQT4szv1Mk8dyPhMyIV4EaO8fGffTrQ/gHAIX0Hd4jzCOnbzfQLZPsHFcP0CgxsdFPHbxQE010rpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ki0Yfm2j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=al0HOZAW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6153dkj52639620
	for <linux-gpio@vger.kernel.org>; Thu, 5 Feb 2026 08:53:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bPSSGnCIlHvKiwP/3XZmhF9BeEla2vdg3S2YBYcvhTE=; b=ki0Yfm2jmU9Z+59U
	mkc6Jqrb9mTZI+dczY+MENE1MYRBlATcXVndj65uAkkG/Sxyr5TRgpigHWXLjXgK
	PhsmLA5agdBnXBzG+VvZ4FyLLVTiX5x/We45YqbvR4ksCkLzEV/MFsR6lm/keCWH
	OOBO+whoyR1bvcugOD+k/i3Uq/+RMOKtE+h9R6Dk7qwEb96P7Z6sunF4IQpgHD+X
	ifiGnsUv5jKst5LGjg/1Mc46Nd/hQTcygJdjKSkdBRnaHEwrBu1396XO6EHBqVTt
	xp1Ol5a6GY/o54p/EupbXr6Ysdsrq1As8ZWnxpponUiH5kxiAAFR8KKB7sZA7WTw
	bMs4ZA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c47qvb2ud-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 05 Feb 2026 08:53:26 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89496f5086dso2918726d6.3
        for <linux-gpio@vger.kernel.org>; Thu, 05 Feb 2026 00:53:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770281605; x=1770886405; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bPSSGnCIlHvKiwP/3XZmhF9BeEla2vdg3S2YBYcvhTE=;
        b=al0HOZAWOEb2HwqeA39MXdkPKEwua/B0hfuxVQMObhJlzYgAwKJ5ECPYTgoaQzIFYA
         ujFHgf4kq77G9uyZQmTBtLT7a+nZAUDv37pARPoNO7S7gjmHrLtA5EvH/602xb/gNCRx
         OIAlRldFji50ui2EIq7yXVhce7UZU89F26iGGuJulA1Lv+LhfZM/Zqu0NmNN97Ha7Un6
         Gg37K0cICXe+lao3/wDJogdhRCsmiLM2qbci22Cy/nFlBYcR1+PY/7fM2c3lU42a2u36
         e6dbUPcD11kMR6xoNVvyyrpvk46QmMN1+e0lIpfUC44EnVYAnfVulhbKd/Cb4hDSK1Ir
         M/xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770281605; x=1770886405;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bPSSGnCIlHvKiwP/3XZmhF9BeEla2vdg3S2YBYcvhTE=;
        b=C8zdY3lMTTuYWqsLgELFuhnUcG5h5OxGH1cbu2jhjc7PRqNs2u6lMfT7CAR9PgWFdN
         9/2qFC1F4oAXuK48zEvpe/uBtoSNAGmmriJ/w0adVHANFjaPkz4TCf8YX7uE1a3KPEGm
         HstxlgT6p5/qwTuV17MJYW2m9sLLfbDrbqB0ffiIIh1BzfjJkqIkArUYsCTukkl77Vqo
         jcYE7YQWAQmzFWRmZGM6ZIGvbOr/JIAV5IYo0b3mvmDHwNAUS/pBK8k3Y8CSphKvWWwN
         XuKBitN368eaqiFLtf0NZBN1uYkZAzkmaeyouN015nkFWNUk62PKqT4AEneSQLDrLX+u
         2eyA==
X-Forwarded-Encrypted: i=1; AJvYcCVWZUWI01OM9tgHJyOQ9t9UBVKABi1fUPPkrIcClpToN8O30iYDwCmCPM8s7QzIo0WxSCIQlmRt6imu@vger.kernel.org
X-Gm-Message-State: AOJu0YzybfrX7KUUTlVOJI+aKEaXiyyDLPpB7jX6Mu+L7asQK0ZcTqIU
	8orOhLqHw1jj2Ohk+i/Jwodx2bjHl3QIqSY0vGLn0kz5JSmaded76WMSFdX/r2ktlwU0HXb5Rl5
	BhLnW2cTdm/gdrTqWap9/y6iPCBRgDig2j+LzT5vWsMyYH5H8nN62Ra4TOyHwz2IZ
X-Gm-Gg: AZuq6aKVG2E605NdXAH+YeyvU0/j7RuYdrWDrgMH6ogE3LZgudbzOMZm8545OtYz4Id
	z2mnwYxuAozqBdhMIxt8wwitx4+arXW6Jaw+i/uvS8FEILk9aUMKWXRt34ltf9S4mf9R4R5boKL
	S07P6SiAeIJsrj3zKYYcI6WKSjgIru/kH+LhM8JAx8fEzPToSSVMpggMH9lrsGqEsemJCHSpuQa
	BV0nLGY7PwlMcN920Dqr0xo9MMsKfpt5nB/z6iSvg8RQ1sNBw6zhfOaa+zp4XLwD+w7h6bwiaBB
	2SGaDNAymXeEqkJkcAotvtJS8IhuDv8sbjB6g4MRunvYpvq5pv0Pp7Erbf/EqnbgJA089XC/VYg
	tdB7/1AjyVkJfAIrVcDu7iALnD5mUh7IcQ0i2idodiV2+0qAvs9mKmj/V2kU4BGgoZqI=
X-Received: by 2002:a05:6214:4e90:b0:894:9d32:6160 with SMTP id 6a1803df08f44-895245ac304mr43939566d6.0.1770281605164;
        Thu, 05 Feb 2026 00:53:25 -0800 (PST)
X-Received: by 2002:a05:6214:4e90:b0:894:9d32:6160 with SMTP id 6a1803df08f44-895245ac304mr43939506d6.0.1770281604769;
        Thu, 05 Feb 2026 00:53:24 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65949fd80a7sm1876774a12.14.2026.02.05.00.53.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Feb 2026 00:53:24 -0800 (PST)
Message-ID: <aa0e8a75-969a-423c-a94f-fd8098fbeb48@oss.qualcomm.com>
Date: Thu, 5 Feb 2026 09:53:21 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: qcom,sm8450-lpass-lpi: add
 QCS8300 LPASS LPI
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        andersson@kernel.org
Cc: linusw@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org, srini@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260204174237.2906-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260204174237.2906-2-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260204174237.2906-2-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GaEaXAXL c=1 sm=1 tr=0 ts=69845a86 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=oKlzPlN8YpF2C1mTYpIA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: Oialzp15hwjqQ51txfo6F402LdsueUPN
X-Proofpoint-ORIG-GUID: Oialzp15hwjqQ51txfo6F402LdsueUPN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDA2MyBTYWx0ZWRfX0wzGBNJs00D2
 TUkDDIiM91269Agy07+bbK7iXXlqpmRLozzY8z9sgodCZcpOaaP18J2akwD7CY9uwmqM3IkJCfq
 /CwhTzKD7VFv0CvwaoSL5tPZs4nGvtfipncEsYk0qillevo6Js1N8J5wVH1DxBFmIxNPgUZAfBW
 VpgH9REVBTnaeL89s/oENDVmzvciITyG/dLr0vcJPXh0dcxdPyK9P+3/z118UMeuh61DRkUe2HU
 5ClUQS60ccUdQfsUNNO4SLR5YP65f5hAdFGApGHk4Qi2B+56nqMh2qTftZiRbHCGAXkLaCA59QP
 QU9iviqq3aI9dSQtknY7SiK2GGMDdIMd1/zWld/kflhx1YqVhpUizuIYzTgLzEHItYe7GexKK2T
 nGMdJqevE3hBctLDyKcY/2p9+UcdzOe/FjnPaA7/Mq1buJl0qbbZOV2TZmF6W08iz73MdF6dgbH
 TRTPIVV424r9XKu5QHg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_01,2026-02-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 malwarescore=0 spamscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050063
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31464-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 025BDF0196
X-Rspamd-Action: no action

On 2/4/26 6:42 PM, Srinivas Kandagatla wrote:
> Document the Qualcomm QCS8300 SoC Low Power Audio SubSystem Low Power
> Island (LPASS LPI) pin controller, compatible with earlier SM8450 model.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  .../bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml     | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml
> index e7565592da86..c81038320c35 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml
> @@ -15,7 +15,11 @@ description:
>  
>  properties:
>    compatible:
> -    const: qcom,sm8450-lpass-lpi-pinctrl
> +    oneOf:
> +      - const: qcom,sm8450-lpass-lpi-pinctrl
> +      - items:
> +          - const: qcom,qcs8300-lpass-lpi-pinctrl
> +          - const: qcom,sm8450-lpass-lpi-pinctrl

This patch conflicts with 

https://lore.kernel.org/linux-arm-msm/20260127105511.3917491-1-mohammad.rafi.shaik@oss.qualcomm.com/

Could you please consolidate the efforts?

Konrad

