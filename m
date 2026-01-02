Return-Path: <linux-gpio+bounces-30076-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E0FCEE8EB
	for <lists+linux-gpio@lfdr.de>; Fri, 02 Jan 2026 13:40:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E4B0630274DC
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Jan 2026 12:40:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 593CC30F7F3;
	Fri,  2 Jan 2026 12:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OgF4v1Ws";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kC9v94Ke"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775E32E8B8B
	for <linux-gpio@vger.kernel.org>; Fri,  2 Jan 2026 12:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767357631; cv=none; b=LGq3Z8/vymB0Fff5M98wHv1dhU2usA3aRCMfNPTZj1tKNoL7Zbm1PQBG7Qka7+J3MdX5q+41K8mdxbo9GEK4w433CF7gLXWYa1ih9Zt4D4RsHp84zLzoCUwHJ1TEIh3S8QyAsnwowKOZ7+mPc6FJf2d2E4Jb1qa7c/Zn4Iu5e+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767357631; c=relaxed/simple;
	bh=x79WgESDywKc/k1LfXdmzcnvokVNdyJs4aX1bPJzvW4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gpy12pxrDCtlOQ6VMr4OJr8C5sABbUM997sfLUdVPKkM7q164ngwtWzzHknXavF8I7YMccfu5JkLPY1FLhp0T3FXcUYvDuB6VHkqiIZFoOPZSjxU05OXsOtH97/9V69GRrHcCXSBs6LPiBes+XvbYSKyQX4Tu2Z5Un/a7doZyKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OgF4v1Ws; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kC9v94Ke; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029VwlI784381
	for <linux-gpio@vger.kernel.org>; Fri, 2 Jan 2026 12:40:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ubBqoDh70LfpD1YdjSu3eNR7Ap2N2rxgOpRV9qaJMes=; b=OgF4v1WsFy7iYcjL
	llWOPaoqD6gc2M0+BRmNysbL85aGTm8v0E5I2ReD+k3oqLG3+pstsRt3qKRCu4r/
	YgO476xZR9C4Yu8TYRqw7RtNV1dCPrmdB7KRmrC5oWdReGYtM03mgOjv148fNCpn
	NuUnEy7cJVk93RzgxizQ3zI7yVOXRfYTuctBc2FqGAsr2SVlIHMUnIlTqmWizU1k
	nQPUcF3ol9ZKYOzy93QdV827b/hKV9hjBSd1xHeTyua4pGPR/7Avmk//9FCTU4UC
	/rJAony9w865eryTz5IImbeHZE+mhsy3BdGeRWKHp41M3QleZUesopDYrH7EkIwh
	kU4Y2Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bd7vtkdf7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 02 Jan 2026 12:40:28 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-88fd7ddba3fso38735736d6.1
        for <linux-gpio@vger.kernel.org>; Fri, 02 Jan 2026 04:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767357627; x=1767962427; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ubBqoDh70LfpD1YdjSu3eNR7Ap2N2rxgOpRV9qaJMes=;
        b=kC9v94Ke10FNNDWeUFOiRa9gqNajvreqlLHFZzq7KNylYcwu0mpiJC7yODMmIb19Do
         13ewO7wS/hf5fnNTGmP1/yV7NZNjmFJsTiHIj3MdPCPu6eVSbWWUKS5/RuWEdRpisdHl
         cQonxRFwTJ4GqLMTRHqH7x2nmyjoDNE7lpS7ciUPlFObN/LvFPpVEs7WrLvag81qOhjF
         0lBe4bMN8mQooozmhU2ijsfotUQRM+k8NQRz9yY5xYYTg5/SFMGV0zn3vgsP5PmSqwSi
         MZITBhBdrxjE/Ck+IpJrEyplPMq3I/I4omPCdUWVbvaqkf2yBWKFhrsfjGw4z7/LakoY
         8ibw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767357627; x=1767962427;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ubBqoDh70LfpD1YdjSu3eNR7Ap2N2rxgOpRV9qaJMes=;
        b=Fd6WGuQrIkT8NzAmHH0xylUVomI3k4/6Wm4nV4mmto19XPf3DQGKVOFaBkRHDSHlSk
         /8IdZv16eIJq6fF6rvnAxIbNYhJTiveKIDlbiEb1gmoghVKjSg2kPZQ/BZVo6qC8m0uT
         rm/+BU41jQqQYzzcjmU8qiK91Iwo7nBaPOdte1LLRosOM+rPI4KKlqPSm45br5zPnSz1
         dwGXWTfaBlVtC0XJiwo6g2L9FLKn+AgZEKVCCGb/oPLiuvwFYU2t6yEV9aW6pqUinEIu
         Ng3QrxYtVVvUugbtMLRI4s4I8EacOUSXYAwsfovSnrZOc6vpGpNzSMM5vbSNmuaS8uwf
         5KaA==
X-Forwarded-Encrypted: i=1; AJvYcCXgeiOE28sHHXlqn0zMahsX+UiTQrnkyvUkgJplPaYFCyGj2hpymMAD6rcmhFuWg4/lxT8Rc+MkhqU7@vger.kernel.org
X-Gm-Message-State: AOJu0YxRW/KbNIGB8FFnP7qojr7SVyR6ynGSRNfGVWRXUOmHUisAWLL/
	J/tmvjGe8OKNXiJeEEUQq8eepHJOpDd6/R+5yT2QwI5BETqPzQNNxZTcV7REs0wE9GQb8WClKhP
	exdVO9JprqHUa3mnm8NtqIyrz0DWw4FNEiJPUg4L0O2SA+SnRSS46C/y5UyF1LG+h
X-Gm-Gg: AY/fxX6GQDcZC2zbZ1OeO2lLoS1QD8z7a3D4BNmB3xNwMP+MV9FumcPNCS5CVlAFc4i
	WOHFzp/B4MLuJ/taqD53x3zLmd/FL2YM6J8/7v4DyjLSgIlOJCTWDO2wSOmIodePcOntwrf6Znu
	jJN/OcIsVFRSbAOdjH0iiuYFaqZzABsnFc+kg4C7CuqnNTjNIls3vkr7eR82uhg8Ph0kYgcsery
	2bBFv2Up23TtntWDZy7I5zu1lXR0B1gOq2BL/p8synM2EOeeN9bYKaSsPwtcIEuKA26Z5oZiUpt
	HJMdcFPzo0jGpsL34iPcEedtiEtVhAAhCfoOpvLug1lMUFb87knQ2xS+VKse2362YXYtRbghsYO
	KV7PFG8XqmgsN8V0Wth+H/z1ddxkOCNzpAT0/6GpU/WSCHJFAJM2+wZCSYE5MG7+YBw==
X-Received: by 2002:a05:6214:252a:b0:7d0:8b28:aaa4 with SMTP id 6a1803df08f44-88d8452929emr512192416d6.6.1767357627447;
        Fri, 02 Jan 2026 04:40:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHUyM1aSteHj74TNcIlszcFmzlamaA60legzWxRh88FQD/NtIa5jcJoEc61i1k70PkYhGpbDw==
X-Received: by 2002:a05:6214:252a:b0:7d0:8b28:aaa4 with SMTP id 6a1803df08f44-88d8452929emr512192036d6.6.1767357626989;
        Fri, 02 Jan 2026 04:40:26 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382861ef4ccsm45978701fa.23.2026.01.02.04.40.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Jan 2026 04:40:25 -0800 (PST)
Message-ID: <91d2e5f7-7d93-4909-9ed2-6b19abf0b448@oss.qualcomm.com>
Date: Fri, 2 Jan 2026 13:40:22 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] pinctrl: qcom: glymur: Add Mahua TLMM support
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260102-pinctrl-qcom-mahua-tlmm-v1-0-0edd71af08b2@oss.qualcomm.com>
 <20260102-pinctrl-qcom-mahua-tlmm-v1-2-0edd71af08b2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260102-pinctrl-qcom-mahua-tlmm-v1-2-0edd71af08b2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NMbYOk6g c=1 sm=1 tr=0 ts=6957bcbc cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=9J1-as2qgA27kOtx8oUA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: 2TRk2N4J-jGAcaNuGyBTkHMvAVXcArOz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDExMSBTYWx0ZWRfX/YlwLAAF1Cor
 S5dSZBN1WZjY+DUOT9FezcmCqoszaeDCJ0t/nAFlniZOW/H9t6T8Jgs4GKAyEgtE/4D/BMqGlDp
 Br1cGLe2sK4lnS1w2tpNFbx63mMja+dWToGCTaTdaL3VX3KOhmGPwfBpW3X/D1EwsEsngriEAyY
 DkWxB5YOXA46vV/lS4cu/MC1HMj9LkFRmJXn40bbayT5JauEtvV+QLSPKZRphAeOFdcCxrNjzFl
 I63zl8O3sZqLAeIXKuv4A65H2lhWHdk7bilW3saLSj5ekghGHXaT2Agpd4hHxFZxGeuNogJ3U4l
 VFi+LXKEYslJtFzpIACklysrwohH4E0dfVGuoyvFpl2nzgednJ/k5LOcGwp2vnHUMlvwXBqTluN
 9vm+l/RcaKW9l877Oz1iUSB07I+lG4UESGVJyJTERt1Thkt3s5cNqodWdKLJOea9cmF/g6TivmN
 WnoOujPNkTM3Vm2LLdw==
X-Proofpoint-GUID: 2TRk2N4J-jGAcaNuGyBTkHMvAVXcArOz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601020111

On 1/2/26 12:07 PM, Gopikrishna Garmidi wrote:
> Introduce support for the Mahua TLMM (Top Level Mode Multiplexer)
> in the pinctrl-glymur driver. Mahua shares the same pin configuration
> as Glymur but requires a different PDC wake IRQ mapping.
> 
> Changes include:
> - Add mahua_pdc_map[] with Mahua-specific GPIO to PDC IRQ mappings
> - Define mahua_tlmm msm_pinctrl_soc_data structure
> - Update device match table to include "qcom,mahua-tlmm" compatible
> - Modify probe function to use of_device_get_match_data() for dynamic
>   SoC-specific data selection
> 
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-glymur.c | 43 ++++++++++++++++++++++++++++++++---
>  1 file changed, 40 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-glymur.c b/drivers/pinctrl/qcom/pinctrl-glymur.c
> index 335005084b6b..bf56a064d09c 100644
> --- a/drivers/pinctrl/qcom/pinctrl-glymur.c
> +++ b/drivers/pinctrl/qcom/pinctrl-glymur.c
> @@ -1729,6 +1729,25 @@ static const struct msm_gpio_wakeirq_map glymur_pdc_map[] = {
>  	{ 232, 206 }, { 234, 172 }, { 235, 173 }, { 242, 158 }, { 244, 156 },
>  };
>  
> +static const struct msm_gpio_wakeirq_map mahua_pdc_map[] = {
> +	{ 0, 116 },   { 2, 114 },   { 3, 115 },	  { 4, 175 },	{ 5, 176 },
> +	{ 7, 111 },   { 11, 129 },  { 13, 130 },  { 15, 112 },	{ 19, 113 },
> +	{ 23, 187 },  { 27, 188 },  { 28, 121 },  { 29, 122 },	{ 30, 136 },
> +	{ 31, 203 },  { 32, 189 },  { 34, 174 },  { 35, 190 },	{ 36, 191 },
> +	{ 39, 124 },  { 43, 192 },  { 47, 193 },  { 51, 123 },	{ 53, 133 },
> +	{ 55, 125 },  { 59, 131 },  { 64, 134 },  { 65, 150 },	{ 66, 186 },
> +	{ 67, 132 },  { 68, 195 },  { 71, 135 },  { 75, 196 },	{ 79, 197 },
> +	{ 83, 198 },  { 84, 181 },  { 85, 199 },  { 87, 200 },	{ 91, 201 },
> +	{ 92, 182 },  { 93, 183 },  { 94, 184 },  { 95, 185 },	{ 98, 202 },
> +	{ 105, 157 }, { 113, 128 }, { 121, 117 }, { 123, 118 }, { 125, 119 },
> +	{ 129, 120 }, { 131, 126 }, { 132, 160 }, { 133, 194 }, { 134, 127 },
> +	{ 141, 137 }, { 144, 138 }, { 145, 139 }, { 147, 140 }, { 148, 141 },
> +	{ 150, 146 }, { 151, 147 }, { 153, 148 }, { 154, 144 }, { 155, 159 },
> +	{ 156, 149 }, { 157, 151 }, { 163, 142 }, { 172, 143 }, { 181, 145 },
> +	{ 193, 161 }, { 196, 152 }, { 203, 177 }, { 208, 178 }, { 215, 162 },
> +	{ 217, 153 }, { 220, 154 }, { 221, 155 }, { 228, 179 }, { 230, 180 },
> +	{ 232, 206 }, { 234, 172 }, { 235, 173 }, { 242, 158 }, { 244, 156 },

Over the "common" base, Glymur has GPIO143 (PCIE3a_RST) and Mahua has GPIO155
(PCIE3b_RST). Both SoCs GPIO maps seem to contain both, but Mahua has a _unused
suffix for the missing 143, which makes sense given the bus isn't bifurcated
there.

The _RST (PERST#) pin is driven by the SoC so I don't think it's useful to
have it as a wakeup source, unless someone decides to connect something that's
not PCIe to it (+Mani)

Perhaps we could unify these maps?

Konrad

